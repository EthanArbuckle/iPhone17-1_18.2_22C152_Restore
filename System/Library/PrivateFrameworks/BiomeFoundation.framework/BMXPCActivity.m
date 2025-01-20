@interface BMXPCActivity
- (BMXPCActivity)initWithActivity:(id)a3;
- (BMXPCActivity)initWithActivity:(id)a3 activityName:(id)a4;
- (BOOL)_setDefer;
- (BOOL)didDefer;
- (BOOL)setContinue;
- (BOOL)setDone;
- (BOOL)shouldDefer;
- (NSString)activityName;
- (OS_xpc_object)activity;
- (int64_t)_state;
- (void)didDefer;
@end

@implementation BMXPCActivity

- (BMXPCActivity)initWithActivity:(id)a3
{
  return [(BMXPCActivity *)self initWithActivity:a3 activityName:0];
}

- (BMXPCActivity)initWithActivity:(id)a3 activityName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMXPCActivity;
  v9 = [(BMXPCActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    objc_storeStrong((id *)&v10->_activityName, a4);
  }

  return v10;
}

- (BOOL)shouldDefer
{
  return xpc_activity_should_defer(self->_activity);
}

- (BOOL)didDefer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(BMXPCActivity *)self _state] == 3)
  {
    v3 = __biome_log_for_category(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[BMXPCActivity didDefer]();
    }
LABEL_4:
    BOOL v4 = 1;
    goto LABEL_12;
  }
  if ([(BMXPCActivity *)self shouldDefer])
  {
    BOOL v5 = [(BMXPCActivity *)self _setDefer];
    v6 = __biome_log_for_category(0);
    v3 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v7);
        activityName = self->_activityName;
        int v11 = 138412546;
        objc_super v12 = v8;
        __int16 v13 = 2112;
        v14 = activityName;
        _os_log_impl(&dword_1B30A0000, v3, OS_LOG_TYPE_DEFAULT, "%@ successfully deferred activity with name: %@, didDefer returning YES", (uint8_t *)&v11, 0x16u);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(BMXPCActivity *)(uint64_t)self didDefer];
    }
    goto LABEL_4;
  }
  v3 = __biome_log_for_category(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[BMXPCActivity didDefer]();
  }
  BOOL v4 = 0;
LABEL_12:

  return v4;
}

- (BOOL)setContinue
{
  return xpc_activity_set_state(self->_activity, 4);
}

- (BOOL)setDone
{
  return xpc_activity_set_state(self->_activity, 5);
}

- (BOOL)_setDefer
{
  return xpc_activity_set_state(self->_activity, 3);
}

- (int64_t)_state
{
  return xpc_activity_get_state(self->_activity);
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityName, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)didDefer
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_3(&dword_1B30A0000, v2, v3, "%@ with name: %@ has not been deferred, didDefer returning NO", v4, v5, v6, v7, v8);
}

@end