@interface BLSHPreventBacklightIdleAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
+ (id)registerHandlerForService:(id)a3 provider:(id)a4;
- (BLSHBacklightIdleProvider)provider;
- (id)countingTargetForEntry:(id)a3;
- (id)initForService:(id)a3 provider:(id)a4;
- (int64_t)typeForEntry:(id)a3;
- (void)activate:(BOOL)a3 withEntry:(id)a4;
- (void)activateWithFirstEntry:(id)a3;
- (void)deactivateWithFinalEntry:(id)a3;
@end

@implementation BLSHPreventBacklightIdleAttributeHandler

+ (id)registerHandlerForService:(id)a3 provider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initForService:v7 provider:v6];

  [v8 setupService];

  return v8;
}

- (id)initForService:(id)a3 provider:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BLSHPreventBacklightIdleAttributeHandler;
  id v7 = [(BLSHLocalCountingAssertionAttributeHandler *)&v10 initForService:a3];
  v8 = v7;
  if (v7)
  {
    *((_DWORD *)v7 + 12) = 0;
    objc_storeWeak(v7 + 7, v6);
  }

  return v8;
}

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)typeForEntry:(id)a3
{
  id v3 = a3;
  v4 = [v3 attribute];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[attribute isKindOfClass:[BLSPreventBacklightIdleAttribute class]]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHPreventBacklightIdleAttributeHandler typeForEntry:]();
    }
LABEL_12:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD0A4FCLL);
  }
  int v5 = [v4 clearUserInteraction];
  unsigned int v6 = [v4 restartTimerOnInvalidation];
  if (!v5)
  {
    int64_t v7 = v6;
    goto LABEL_6;
  }
  if ((v6 & 1) == 0)
  {
    v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[attribute restartTimerOnInvalidation]"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHPreventBacklightIdleAttributeHandler typeForEntry:]();
    }
    goto LABEL_12;
  }
  int64_t v7 = 2;
LABEL_6:

  return v7;
}

- (id)countingTargetForEntry:(id)a3
{
  unint64_t v3 = [(BLSHPreventBacklightIdleAttributeHandler *)self typeForEntry:a3];
  if (v3 <= 2)
  {
    v4 = NSStringFromSelector(*off_264532688[v3]);
  }

  return v4;
}

- (void)activateWithFirstEntry:(id)a3
{
}

- (void)deactivateWithFinalEntry:(id)a3
{
}

- (void)activate:(BOOL)a3 withEntry:(id)a4
{
  BOOL v4 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v7 = [(BLSHPreventBacklightIdleAttributeHandler *)self typeForEntry:v6];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  active = self->_active;
  if (self->_active[v7] != !v4)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_active[type] == !isActivate"];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[BLSHPreventBacklightIdleAttributeHandler activate:withEntry:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x21FD0A894);
  }
  id v22 = v6;
  int v10 = self->_active[2];
  int v11 = (self->_active[1] | v10);
  int v12 = *active | v11;
  active[v7] = v4;
  int v13 = self->_active[2];
  int v14 = (self->_active[1] | v13);
  int v15 = *active | v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  os_unfair_lock_unlock(p_lock);
  v17 = bls_backlight_log();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v18)
    {
      *(_DWORD *)buf = 67109888;
      int v24 = v12;
      __int16 v25 = 1024;
      int v26 = v15;
      __int16 v27 = 1024;
      int v28 = v11;
      __int16 v29 = 1024;
      int v30 = v14;
      _os_log_debug_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_DEBUG, "received first assertion acquired event oldPreventIdle=%{BOOL}u preventIdle=%{BOOL}u oldRestartTimer=%{BOOL}u restartTimer=%{BOOL}u", buf, 0x1Au);
    }

    if (v12 != v15) {
      -[BLSHBacklightIdleProvider setSuppressed:]((uint64_t)WeakRetained, 1);
    }
    v19 = v22;
    if (v11 != v14) {
      [WeakRetained setSuspended:1];
    }
  }
  else
  {
    int v20 = v12;
    if (v18)
    {
      *(_DWORD *)buf = 67110400;
      int v24 = v10;
      __int16 v25 = 1024;
      int v26 = v13;
      __int16 v27 = 1024;
      int v28 = v11;
      __int16 v29 = 1024;
      int v30 = v14;
      __int16 v31 = 1024;
      int v32 = v12;
      __int16 v33 = 1024;
      int v34 = v15;
      _os_log_debug_impl(&dword_21FCFC000, v17, OS_LOG_TYPE_DEBUG, "received last assertion dropped event oldClearUserInteraction=%{BOOL}u clearUserInteraction=%{BOOL}u  oldRestartTimer=%{BOOL}u restartTimer=%{BOOL}u  oldPreventIdle=%{BOOL}u preventIdle=%{BOOL}u", buf, 0x26u);
    }

    v19 = v22;
    if (v10 != v13) {
      [WeakRetained reset];
    }
    if (v11 != v14) {
      [WeakRetained setSuspended:0];
    }
    if (v20 != v15) {
      -[BLSHBacklightIdleProvider setSuppressed:]((uint64_t)WeakRetained, 0);
    }
  }
}

- (BLSHBacklightIdleProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  return (BLSHBacklightIdleProvider *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)typeForEntry:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)typeForEntry:.cold.2()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)activate:withEntry:.cold.1()
{
  OUTLINED_FUNCTION_4();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_5();
  unint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_21FCFC000, &_os_log_internal, v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end