@interface ACNotifyReader
- (ACNotifyReader)initWithKey:(id)a3 updateQueue:(id)a4 updateBlock:(id)a5;
- (NSString)key;
- (unint64_t)cachedValue;
- (unint64_t)currentValue;
- (void)currentValue;
- (void)dealloc;
- (void)setCachedValue:(unint64_t)a3;
- (void)setKey:(id)a3;
@end

@implementation ACNotifyReader

- (unint64_t)currentValue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int notifierToken = self->_notifierToken;
  if (notifierToken != -1)
  {
    int check = 0;
    uint32_t v4 = notify_check(notifierToken, &check);
    if (v4)
    {
      uint32_t v5 = v4;
      v6 = _ACLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(ACNotifyReader *)self key];
        *(_DWORD *)buf = 138412546;
        v15 = v7;
        __int16 v16 = 1024;
        uint32_t v17 = v5;
        _os_log_impl(&dword_1A57C5000, v6, OS_LOG_TYPE_DEFAULT, "\"Failed to check for %@ change: notify_check failed: %u\"", buf, 0x12u);
      }
    }
    else if (check != 1)
    {
      return self->_cachedValue;
    }
    uint32_t state = notify_get_state(self->_notifierToken, &self->_cachedValue);
    if (state)
    {
      int v11 = state;
      v12 = _ACLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(ACNotifyReader *)self currentValue];
      }

      self->_cachedValue = 0;
    }
    return self->_cachedValue;
  }
  v8 = _ACLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(ACNotifyReader *)self currentValue];
  }

  return 0;
}

- (void).cxx_destruct
{
}

- (ACNotifyReader)initWithKey:(id)a3 updateQueue:(id)a4 updateBlock:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACNotifyReader;
  int v11 = [(ACNotifyReader *)&v19 init];
  v12 = v11;
  if (v11)
  {
    [(ACNotifyReader *)v11 setCachedValue:0];
    v12->_int notifierToken = -1;
    [(ACNotifyReader *)v12 setKey:v8];
    id v13 = v8;
    if (notify_register_check((const char *)[v13 UTF8String], &v12->_notifierToken))
    {
      v14 = _ACLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[ACNotifyReader initWithKey:updateQueue:updateBlock:]();
      }
    }
    v12->_dispatchToken = -1;
    if (v9 && v10)
    {
      v15 = (const char *)[v13 UTF8String];
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __54__ACNotifyReader_initWithKey_updateQueue_updateBlock___block_invoke;
      handler[3] = &unk_1E5BCE938;
      id v18 = v10;
      notify_register_dispatch(v15, &v12->_dispatchToken, v9, handler);
    }
  }

  return v12;
}

- (void)setKey:(id)a3
{
}

- (void)setCachedValue:(unint64_t)a3
{
  self->_cachedValue = a3;
}

- (void)dealloc
{
  int notifierToken = self->_notifierToken;
  if (notifierToken != -1) {
    notify_cancel(notifierToken);
  }
  int dispatchToken = self->_dispatchToken;
  if (dispatchToken != -1) {
    notify_cancel(dispatchToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)ACNotifyReader;
  [(ACNotifyReader *)&v5 dealloc];
}

uint64_t __54__ACNotifyReader_initWithKey_updateQueue_updateBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)cachedValue
{
  return self->_cachedValue;
}

- (NSString)key
{
  return self->_key;
}

- (void)initWithKey:updateQueue:updateBlock:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_3();
  int v3 = v0;
  _os_log_error_impl(&dword_1A57C5000, v1, OS_LOG_TYPE_ERROR, "\"Failed to register for %@ notifications: notify_register_check failed: %u\"", v2, 0x12u);
}

- (void)currentValue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a1 key];
  OUTLINED_FUNCTION_0_3();
  int v7 = a2;
  _os_log_error_impl(&dword_1A57C5000, a3, OS_LOG_TYPE_ERROR, "\"Failed to get %@ number: notify_get_state failed: %u\"", v6, 0x12u);
}

@end