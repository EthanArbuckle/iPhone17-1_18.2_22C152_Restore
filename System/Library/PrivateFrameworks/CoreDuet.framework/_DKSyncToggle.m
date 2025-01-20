@interface _DKSyncToggle
+ (_DKSyncToggle)toggleWithObject:(void *)a3 name:(uint64_t)a4 enableSelector:(uint64_t)a5 disableSelector:;
- (BOOL)isEnabled;
- (_DKSyncToggle)initWithObject:(id)a3 name:(id)a4 enableSelector:(SEL)a5 disableSelector:(SEL)a6;
- (uint64_t)setEnabled:(uint64_t)result;
- (void)_setEnabled:(BOOL)a3;
- (void)dealloc;
@end

@implementation _DKSyncToggle

+ (_DKSyncToggle)toggleWithObject:(void *)a3 name:(uint64_t)a4 enableSelector:(uint64_t)a5 disableSelector:
{
  id v8 = a3;
  id v9 = a2;
  self;
  v10 = [[_DKSyncToggle alloc] initWithObject:v9 name:v8 enableSelector:a4 disableSelector:a5];

  return v10;
}

- (_DKSyncToggle)initWithObject:(id)a3 name:(id)a4 enableSelector:(SEL)a5 disableSelector:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_DKSyncToggle;
  v12 = [(_DKSyncToggle *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_object, v10);
    objc_storeStrong((id *)&v13->_name, a4);
    v13->_enableSelector = a5;
    v13->_disableSelector = a6;
  }

  return v13;
}

- (void)dealloc
{
  if (self->_enabled) {
    [(_DKSyncToggle *)self _setEnabled:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)_DKSyncToggle;
  [(_DKSyncToggle *)&v3 dealloc];
}

- (void)_setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    v5 = +[_CDLogging syncChannel];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6) {
        -[_DKSyncToggle _setEnabled:]();
      }
      uint64_t v7 = 32;
    }
    else
    {
      if (v6) {
        -[_DKSyncToggle _setEnabled:]();
      }
      uint64_t v7 = 40;
    }

    [(_DKSyncToggle *)self willChangeValueForKey:@"isEnabled"];
    self->_enabled = v3;
    [(_DKSyncToggle *)self didChangeValueForKey:@"isEnabled"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
    [WeakRetained performSelector:*(Class *)((char *)&self->super.isa + v7)];
  }
}

- (uint64_t)setEnabled:(uint64_t)result
{
  if (result)
  {
    BOOL v3 = (void *)result;
    v4 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v4);

    return [v3 _setEnabled:a2];
  }
  return result;
}

- (BOOL)isEnabled
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_object);
}

- (void)_setEnabled:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Enabling '%@' toggle", v3, v4, v5, v6, v7);
}

- (void)_setEnabled:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Disabling '%@' toggle", v3, v4, v5, v6, v7);
}

@end