@interface _FBSDisplayLayoutService
- (id)_initWithEndpoint:(id)a3 qos:(char)a4;
- (id)currentLayout;
- (id)endpoint;
- (void)_noteDisconnected;
- (void)addObserver:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserverForKey:(id)a3;
- (void)updateLayout:(id)a3 withTransition:(id)a4;
@end

@implementation _FBSDisplayLayoutService

- (void)updateLayout:(id)a3 withTransition:(id)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionary();
}

- (id)currentLayout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_layout;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)addObserver:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 copy];
  if (!v7)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_FBSDisplayLayoutService addObserver:forKey:]();
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
  }
  if (!v6)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_FBSDisplayLayoutService addObserver:forKey:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  v8 = (void *)v7;
  os_unfair_lock_lock(&self->_lock);
  lock_keyedObservers = self->_lock_keyedObservers;
  v10 = (void *)MEMORY[0x19F3991F0](v8);
  [(NSMapTable *)lock_keyedObservers setObject:v10 forKey:v6];

  unint64_t lock_layoutGeneration = self->_lock_layoutGeneration;
  os_unfair_lock_unlock(&self->_lock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47___FBSDisplayLayoutService_addObserver_forKey___block_invoke;
  v18[3] = &unk_1E58F6320;
  v18[4] = self;
  unint64_t v21 = lock_layoutGeneration;
  id v12 = v6;
  id v19 = v12;
  id v13 = v8;
  id v20 = v13;
  v14 = (void *)MEMORY[0x19F3991F0](v18);
  if (lock_layoutGeneration)
  {
    dispatch_async((dispatch_queue_t)self->_callOutQueue, v14);
  }
  else
  {
    dispatch_time_t v15 = dispatch_time(0, 1000000000);
    dispatch_after(v15, (dispatch_queue_t)self->_callOutQueue, v14);
  }
}

- (id)_initWithEndpoint:(id)a3 qos:(char)a4
{
  unsigned int v4 = a4;
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_FBSDisplayLayoutService;
  v8 = [(_FBSDisplayLayoutService *)&v16 init];
  if (v8)
  {
    objc_storeStrong((id *)&v8->_endpoint, a3);
    v9 = NSString;
    uint64_t v10 = [v7 service];
    uint64_t v11 = [v7 targetDescription];
    uint64_t v12 = [v7 instance];
    _NSStringFromFBSDisplayLayoutQOS(v4);
    [v9 stringWithFormat:@"%@:%@-%@-%@", v10, v11, v12, objc_claimAutoreleasedReturnValue()];
    objc_claimAutoreleasedReturnValue();
    id v13 = [off_1E58F44F8 serial];
    if (v4 >= 3) {
      uint64_t v14 = 9;
    }
    else {
      uint64_t v14 = 4 * v4 + 17;
    }
    [v13 serviceClass:v14];
    objc_claimAutoreleasedReturnValue();
    BSDispatchQueueCreate();
  }

  return 0;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_keyedObservers = self->_lock_keyedObservers;
  self->_lock_keyedObservers = 0;

  os_unfair_lock_unlock(p_lock);
  connection = self->_connection;

  [(BSServiceConnection *)connection invalidate];
}

- (id)endpoint
{
  return self->_endpoint;
}

- (void)removeObserverForKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"key"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[_FBSDisplayLayoutService removeObserverForKey:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
  }
  id v6 = v4;
  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_lock_keyedObservers removeObjectForKey:v6];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  [(BSServiceConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_FBSDisplayLayoutService;
  [(_FBSDisplayLayoutService *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_layout, 0);
  objc_storeStrong((id *)&self->_lock_keyedObservers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (void)_noteDisconnected
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_layout = self->_lock_layout;
  os_unfair_lock_unlock(p_lock);
  if (lock_layout)
  {
    id v6 = (id)objc_opt_new();
    uint64_t v5 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:@"FBSDisplayLayoutMonitorDisconnected"];
    [v6 setTransitionReasons:v5];

    BSCreateSerializedBSXPCEncodableObject();
  }
}

- (void)addObserver:forKey:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addObserver:forKey:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeObserverForKey:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  objc_super v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end