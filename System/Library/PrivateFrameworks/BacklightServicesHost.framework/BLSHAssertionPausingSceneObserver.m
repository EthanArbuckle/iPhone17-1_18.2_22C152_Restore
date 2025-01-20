@interface BLSHAssertionPausingSceneObserver
+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6;
- (BLSAssertionServiceResponding)assertion;
- (BLSHAssertionAttributeHandlerService)service;
- (BLSPauseWhenSceneBackgroundAttribute)attribute;
- (BOOL)reactivateIfPossible;
- (uint64_t)initForAttribute:(void *)a3 fromAssertion:(void *)a4 forService:;
- (void)dealloc;
- (void)invalidate;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidInvalidate:(id)a3;
- (void)updateAssertionPauseStateForScene:(uint64_t)a1;
@end

@implementation BLSHAssertionPausingSceneObserver

+ (id)activateForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5 attributeHandler:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)-[BLSHAssertionPausingSceneObserver initForAttribute:fromAssertion:forService:]((id *)[BLSHAssertionPausingSceneObserver alloc], v10, v9, v8);

  return v11;
}

- (uint64_t)initForAttribute:(void *)a3 fromAssertion:(void *)a4 forService:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_5;
  }
  v14.receiver = a1;
  v14.super_class = (Class)BLSHAssertionPausingSceneObserver;
  id v10 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  *((_DWORD *)v10 + 4) = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeWeak(a1 + 5, v7);
    objc_storeWeak(a1 + 3, v8);
    objc_storeWeak(a1 + 4, v9);
    *((unsigned char *)a1 + 21) = 0;
    id v13 = v7;
    a1 = a1;
    BSDispatchMain();

LABEL_5:
    return (uint64_t)a1;
  }
  v12 = [NSString stringWithFormat:@"BLSPauseWhenSceneBackgroundAttribute not class for %@", v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[BLSHAssertionPausingSceneObserver initForAttribute:fromAssertion:forService:](sel_initForAttribute_fromAssertion_forService_, (uint64_t)a1, (uint64_t)v12);
  }
  [v12 UTF8String];
  uint64_t result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

void __79__BLSHAssertionPausingSceneObserver_initForAttribute_fromAssertion_forService___block_invoke(uint64_t a1)
{
  v2 = +[BLSHBacklightOSInterfaceProvider sharedProvider];
  v3 = [*(id *)(a1 + 32) sceneIdentityToken];
  id obj = [v2 sceneWithIdentityToken:v3];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v4 + 20))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 16));
  }
  else
  {
    objc_storeWeak((id *)(v4 + 8), obj);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 16));
    [obj addObserver:*(void *)(a1 + 40)];
    -[BLSHAssertionPausingSceneObserver updateAssertionPauseStateForScene:](*(void *)(a1 + 40), obj);
  }
}

- (void)updateAssertionPauseStateForScene:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v5 = [v3 settings];
    int v6 = [v5 isForeground];
    char v7 = v6;
    int v8 = v6 ^ 1;

    id v9 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    int v10 = *(unsigned __int8 *)(a1 + 20);
    int v11 = *(unsigned __int8 *)(a1 + 21);
    v12 = bls_assertions_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = [v4 identifier];
      v16 = [v4 settings];
      *(_DWORD *)buf = 134219266;
      uint64_t v18 = a1;
      __int16 v19 = 1024;
      int v20 = v10;
      __int16 v21 = 1024;
      BOOL v22 = v11 != v8;
      __int16 v23 = 1024;
      int v24 = v8;
      __int16 v25 = 2114;
      v26 = v15;
      __int16 v27 = 2114;
      v28 = v16;
      _os_log_debug_impl(&dword_21FCFC000, v12, OS_LOG_TYPE_DEBUG, "%p invalidated:%{BOOL}u needUpdate:%{BOOL}u shouldBePaused:%{BOOL}u for scene:%{public}@ settings:%{public}@", buf, 0x32u);
    }
    *(unsigned char *)(a1 + 21) = v8;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    id v14 = objc_loadWeakRetained((id *)(a1 + 32));
    os_unfair_lock_unlock(v9);
    if (!v10 && v11 != v8)
    {
      if (v7) {
        [v14 resumeAssertion:WeakRetained];
      }
      else {
        [v14 pauseAssertion:WeakRetained];
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromSelector(a1);
  v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  id v9 = @"BLSHPauseWhenSceneBackgroundAttributeHandler.m";
  __int16 v10 = 1024;
  int v11 = 91;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

- (BOOL)reactivateIfPossible
{
  return 0;
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_storeWeak((id *)&self->_scene, 0);
  os_unfair_lock_unlock(p_lock);
  id v5 = WeakRetained;
  BSDispatchMain();
}

uint64_t __47__BLSHAssertionPausingSceneObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
}

- (void)sceneDidInvalidate:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  id v5 = objc_loadWeakRetained((id *)&self->_assertion);
  int v6 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F29920];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = @"scene invalidated";
  int v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v9 = [v6 errorWithDomain:v7 code:20 userInfo:v8];
  [WeakRetained cancelAssertion:v5 withError:v9];
}

- (BLSAssertionServiceResponding)assertion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertion);

  return (BLSAssertionServiceResponding *)WeakRetained;
}

- (BLSHAssertionAttributeHandlerService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (BLSHAssertionAttributeHandlerService *)WeakRetained;
}

- (BLSPauseWhenSceneBackgroundAttribute)attribute
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attribute);

  return (BLSPauseWhenSceneBackgroundAttribute *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attribute);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_assertion);

  objc_destroyWeak((id *)&self->_scene);
}

- (void)initForAttribute:(const char *)a1 fromAssertion:(uint64_t)a2 forService:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSStringFromSelector(a1);
  id v5 = (objc_class *)objc_opt_class();
  int v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  id v9 = @"BLSHPauseWhenSceneBackgroundAttributeHandler.m";
  __int16 v10 = 1024;
  int v11 = 64;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_21FCFC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

@end