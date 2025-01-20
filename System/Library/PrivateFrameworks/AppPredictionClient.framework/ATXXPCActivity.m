@interface ATXXPCActivity
- (ATXXPCActivity)initWithActivity:(id)a3 name:(id)a4;
- (ATXXPCActivity)initWithActivity:(id)a3 name:(id)a4 logHandle:(id)a5;
- (BOOL)didDefer;
- (BOOL)setContinue;
- (BOOL)setDone;
- (BOOL)shouldDefer;
- (void)didDefer;
@end

@implementation ATXXPCActivity

- (ATXXPCActivity)initWithActivity:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = __atxlog_handle_default();
  v9 = [(ATXXPCActivity *)self initWithActivity:v7 name:v6 logHandle:v8];

  return v9;
}

- (ATXXPCActivity)initWithActivity:(id)a3 name:(id)a4 logHandle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXXPCActivity;
  v12 = [(ATXXPCActivity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activity, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_handle, a5);
  }

  return v13;
}

- (BOOL)didDefer
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL should_defer = xpc_activity_should_defer(self->_activity);
  if (should_defer)
  {
    BOOL v4 = xpc_activity_set_state(self->_activity, 3);
    handle = self->_handle;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)self->_handle, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        int v8 = 138412290;
        id v9 = name;
        _os_log_impl(&dword_1A790D000, handle, OS_LOG_TYPE_DEFAULT, "Abandoning activity %@ since we were asked to defer", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_handle, OS_LOG_TYPE_ERROR))
    {
      [(ATXXPCActivity *)(uint64_t)self didDefer];
    }
  }
  return should_defer;
}

- (BOOL)shouldDefer
{
  return xpc_activity_should_defer(self->_activity);
}

- (BOOL)setContinue
{
  return xpc_activity_set_state(self->_activity, 4);
}

- (BOOL)setDone
{
  return xpc_activity_set_state(self->_activity, 5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)didDefer
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Abandoning activity %@, but failed to properly defer", (uint8_t *)&v3, 0xCu);
}

@end