@interface ACNotifyWriter
- (ACNotifyWriter)initWithKey:(id)a3;
- (NSString)key;
- (void)dealloc;
- (void)setKey:(id)a3;
- (void)write:(unint64_t)a3;
@end

@implementation ACNotifyWriter

- (void)write:(unint64_t)a3
{
  if (self->notifierToken == -1)
  {
    v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[ACNotifyWriter write:](self, v6);
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v8 = __24__ACNotifyWriter_write___block_invoke;
    v9 = &unk_1E5BCF070;
    p_lock = &self->lock;
    v10 = self;
    unint64_t v11 = a3;
    v5 = v7;
    os_unfair_lock_lock(p_lock);
    v8((uint64_t)v5);
    os_unfair_lock_unlock(p_lock);
  }
}

void __24__ACNotifyWriter_write___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int check = 0;
  v2 = (id *)(a1 + 32);
  uint32_t v3 = notify_check(*(_DWORD *)(*(void *)(a1 + 32) + 8), &check);
  if (v3)
  {
    uint32_t v4 = v3;
    v5 = _ACLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [*v2 key];
      *(_DWORD *)buf = 138412546;
      *(void *)v16 = v6;
      *(_WORD *)&v16[8] = 1024;
      *(_DWORD *)&v16[10] = v4;
      _os_log_impl(&dword_1A57C5000, v5, OS_LOG_TYPE_DEFAULT, "\"Failed to check for %@ number change: notify_check failed: %u\"", buf, 0x12u);
    }
  }
  uint32_t v7 = notify_set_state(*(_DWORD *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40));
  if (v7)
  {
    uint32_t v8 = v7;
    v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *(_DWORD *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v16 = v11;
      *(_WORD *)&v16[4] = 2048;
      *(void *)&v16[6] = v10;
      __int16 v17 = 1024;
      uint32_t v18 = v8;
      _os_log_error_impl(&dword_1A57C5000, v9, OS_LOG_TYPE_ERROR, "\"notify_set_state(%d, %llu) failed: %d\"", buf, 0x18u);
    }
  }
  else
  {
    id v12 = [*v2 key];
    uint32_t v13 = notify_post((const char *)[v12 UTF8String]);

    if (!v13) {
      return;
    }
    v9 = _ACLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __24__ACNotifyWriter_write___block_invoke_cold_1(v2, v13, v9);
    }
  }
}

- (NSString)key
{
  return self->_key;
}

- (ACNotifyWriter)initWithKey:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACNotifyWriter;
  v5 = [(ACNotifyWriter *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(ACNotifyWriter *)v5 setKey:v4];
    v6->notifierToken = -1;
    id v7 = [(ACNotifyWriter *)v6 key];
    uint32_t v8 = notify_register_check((const char *)[v7 UTF8String], &v6->notifierToken);

    if (v8)
    {
      v9 = _ACLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ACNotifyReader initWithKey:updateQueue:updateBlock:]();
      }
    }
  }

  return v6;
}

- (void)dealloc
{
  int notifierToken = self->notifierToken;
  if (notifierToken != -1) {
    notify_cancel(notifierToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)ACNotifyWriter;
  [(ACNotifyWriter *)&v4 dealloc];
}

- (void)setKey:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)write:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint32_t v3 = [a1 key];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_ERROR, "\"Failed to get %@ number: libnotify registration failed\"", (uint8_t *)&v4, 0xCu);
}

void __24__ACNotifyWriter_write___block_invoke_cold_1(id *a1, int a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = [*a1 key];
  OUTLINED_FUNCTION_0_3();
  int v7 = a2;
  _os_log_error_impl(&dword_1A57C5000, a3, OS_LOG_TYPE_ERROR, "\"notify_post(%{public}@) failed: %d\"", v6, 0x12u);
}

@end