@interface IMBaseCommandHandlerRegistry
- (BOOL)canAddCommand:(id)a3;
- (BOOL)hasHandlerForCommand:(id)a3;
- (BOOL)hasLockdownHandlerForCommand:(id)a3;
- (BOOL)isLockedDown;
- (IMBaseCommandHandlerRegistry)init;
- (NSDictionary)handlers;
- (NSDictionary)lockdownHandlers;
- (NSDictionary)standardHandlers;
- (id)handlerForCommand:(id)a3;
- (id)noopHandlerForCommand:(id)a3;
- (void)setLockdownHandler:(id)a3 forCommand:(id)a4;
- (void)setPassThroughLockdownHandlerForCommand:(id)a3;
- (void)setStandardHandler:(id)a3 forCommand:(id)a4;
@end

@implementation IMBaseCommandHandlerRegistry

- (IMBaseCommandHandlerRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMBaseCommandHandlerRegistry;
  v2 = [(IMBaseCommandHandlerRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    standardHandlers = v2->_standardHandlers;
    v2->_standardHandlers = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    lockdownHandlers = v2->_lockdownHandlers;
    v2->_lockdownHandlers = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)noopHandlerForCommand:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v8 = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_1A0772000, v4, OS_LOG_TYPE_ERROR, "noopHandler is a required override for %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"noopHandler is a required override for IMBaseCommandHandlerRegistry" userInfo:0];
  objc_exception_throw(v7);
}

- (BOOL)canAddCommand:(id)a3
{
  return 1;
}

- (BOOL)hasHandlerForCommand:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_standardHandlers objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isLockedDown
{
  return +[IMDeviceUtilities deviceIsLockedDown];
}

- (BOOL)hasLockdownHandlerForCommand:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_lockdownHandlers objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setLockdownHandler:(id)a3 forCommand:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IMBaseCommandHandlerRegistry *)self canAddCommand:v7];
  v9 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      int v15 = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "lockdown handler for command '%@' in %@: ADDED", (uint8_t *)&v15, 0x16u);
    }
    v9 = [v6 copy];
    [(NSMutableDictionary *)self->_lockdownHandlers setObject:v9 forKeyedSubscript:v7];
  }
  else if (v10)
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    int v15 = 138412546;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "lockdown handler for command '%@' in %@: NOT ADDED (Command not ready for Blastdoor)", (uint8_t *)&v15, 0x16u);
  }
}

- (void)setPassThroughLockdownHandlerForCommand:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMBaseCommandHandlerRegistry *)self canAddCommand:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_standardHandlers objectForKeyedSubscript:v4];
    id v6 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        BOOL v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "lockdown passThrough handler for command '%@' in %@: ADDED", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1A09EFD9C((uint64_t)v4, (uint64_t)self, v7);
      }

      uint64_t v5 = [(IMBaseCommandHandlerRegistry *)self noopHandlerForCommand:v4];
    }
    id v12 = [v5 copy];
    [(NSMutableDictionary *)self->_lockdownHandlers setObject:v12 forKeyedSubscript:v4];
  }
  else
  {
    uint64_t v5 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v13 = 138412546;
      id v14 = v4;
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "lockdown passThrought handler for command '%@' in %@: NOT ADDED (Command not ready for Blastdoor)", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)setStandardHandler:(id)a3 forCommand:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(IMBaseCommandHandlerRegistry *)self canAddCommand:v7])
  {
    id v14 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v18);
      int v19 = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v16;
      uint64_t v17 = "handler for command '%@' in %@: NOT ADDED (Command not ready for Blastdoor)";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v8 = (void *)[v6 copy];
  [(NSMutableDictionary *)self->_standardHandlers setObject:v8 forKeyedSubscript:v7];

  v9 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    BOOL v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    int v19 = 138412546;
    id v20 = v7;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "blastdoor handler for command '%@' in %@: ADDED", (uint8_t *)&v19, 0x16u);
  }
  if ([(IMBaseCommandHandlerRegistry *)self isLockedDown])
  {
    id v12 = [(IMBaseCommandHandlerRegistry *)self noopHandlerForCommand:v7];
    int v13 = (void *)[v12 copy];
    [(NSMutableDictionary *)self->_lockdownHandlers setObject:v13 forKeyedSubscript:v7];

    id v14 = IMLogHandleForCategory("IMBaseCommandHandlerRegistry");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      int v19 = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      v22 = v16;
      uint64_t v17 = "added noop lockdown handler for command '%@' in %@";
LABEL_9:
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v19, 0x16u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (NSDictionary)handlers
{
  BOOL v3 = [(IMBaseCommandHandlerRegistry *)self isLockedDown];
  uint64_t v4 = 8;
  if (v3) {
    uint64_t v4 = 16;
  }
  uint64_t v5 = *(Class *)((char *)&self->super.isa + v4);

  return (NSDictionary *)v5;
}

- (id)handlerForCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMBaseCommandHandlerRegistry *)self handlers];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDictionary)standardHandlers
{
  return &self->_standardHandlers->super;
}

- (NSDictionary)lockdownHandlers
{
  return &self->_lockdownHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownHandlers, 0);

  objc_storeStrong((id *)&self->_standardHandlers, 0);
}

@end