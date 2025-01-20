@interface CDMBaseService
- (CDMBaseService)initWithConfig:(id)a3;
- (NSSet)supportedCommands;
- (NSString)serviceName;
- (id)createErrorWithCode:(int64_t)a3 description:(id)a4;
- (id)createSetupResponseCommand;
- (int64_t)serviceState;
- (void)addObserver:(id)a3;
- (void)handleCommand:(id)a3 withCallback:(id)a4;
- (void)publish:(id)a3;
- (void)removeObserver:(id)a3;
- (void)request:(id)a3 withCallback:(id)a4;
@end

@implementation CDMBaseService

- (CDMBaseService)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDMBaseService;
  v6 = [(CDMBaseService *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_serviceState = 0;
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  if (![(NSHashTable *)observers containsObject:v4]) {
    [(NSHashTable *)self->_observers addObject:v8];
  }
}

- (NSSet)supportedCommands
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[CDMBaseCommand commandName];
  id v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return (NSSet *)v4;
}

- (NSString)serviceName
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)createSetupResponseCommand
{
  v3 = [CDMSetupResponseCommand alloc];
  int64_t v4 = [(CDMBaseService *)self serviceState];
  id v5 = [(CDMBaseService *)self serviceName];
  v6 = [(CDMSetupResponseCommand *)v3 initWithServiceState:v4 serviceName:v5];

  return v6;
}

- (int64_t)serviceState
{
  return self->_serviceState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id)createErrorWithCode:(int64_t)a3 description:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263F087E8];
  id v7 = a4;
  id v8 = [(CDMBaseService *)self serviceName];
  uint64_t v12 = *MEMORY[0x263F08320];
  v13[0] = v7;
  objc_super v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = [v6 errorWithDomain:v8 code:a3 userInfo:v9];

  return v10;
}

- (void)request:(id)a3 withCallback:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_super v9 = [v6 commandName];
    *(_DWORD *)buf = 136315394;
    v22 = "-[CDMBaseService request:withCallback:]";
    __int16 v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 smService:self didPublishRequest:v6 withResponseCallback:v7];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)publish:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 commandName];
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[CDMBaseService publish:]";
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_2263A0000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 smService:self didPublishCommand:v4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)handleCommand:(id)a3 withCallback:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, NSObject *, void))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(CDMBaseService *)self createSetupResponseCommand];
    v7[2](v7, v8, 0);
  }
  else
  {
    uint64_t v8 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v6 commandName];
      int v10 = 136315394;
      uint64_t v11 = "-[CDMBaseService handleCommand:withCallback:]";
      __int16 v12 = 2112;
      long long v13 = v9;
      _os_log_impl(&dword_2263A0000, v8, OS_LOG_TYPE_INFO, "%s Unhandled Command: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:")) {
    [(NSHashTable *)self->_observers removeObject:v4];
  }
}

@end