@interface FBSceneObserver
- (BOOL)isEqual:(id)a3;
- (FBSceneObserver)initWithScene:(id)a3;
- (NSString)description;
- (_BYTE)initWithComponent:(unsigned char *)a1;
- (_BYTE)initWithDelegate:(unsigned char *)a1;
- (id)_initWithObserver:(id)a3;
- (id)delegate;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)observer;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)scene:(id)a3 handlePrivateActions:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)component;
- (uint64_t)delegateReceivesActions;
- (uint64_t)observerHandlesActions;
- (unint64_t)hash;
- (unint64_t)receiverImplementsWillUpdate;
- (void)componentWillInvalidate:(id)a3;
- (void)configureInitialSettings:(id)a3;
- (void)initWithObserver:(void *)a1;
- (void)invalidate;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)scene:(id)a3 willUpdateSettings:(id)a4;
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withContext:(id)a4;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4;
- (void)sceneWillActivate:(id)a3;
- (void)sceneWillDeactivate:(id)a3 withContext:(id)a4;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
@end

@implementation FBSceneObserver

- (unint64_t)hash
{
  return self->_observerAddress;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  if (self->_observerFlags.didUpdateSettings)
  {
    p_observer = &self->_observer;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained scene:v7 didUpdateSettings:v6];
  }
}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  if (self->_observerFlags.updatePreparedLEGACY)
  {
    p_observer = &self->_observer;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained scene:v7 didPrepareUpdateWithContext:v6];
  }
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (self->_observerFlags.updateAppliedLEGACY && !self->_observerFlags.didUpdateSettings)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    [WeakRetained scene:v8 didApplyUpdateWithContext:v6];
  }
}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  if (self->_observerFlags.updateCompletedLEGACY)
  {
    p_observer = &self->_observer;
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained scene:v10 didCompleteUpdateWithContext:v9 error:v8];
  }
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  if (self->_observerFlags.didUpdateClientSettings)
  {
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    [WeakRetained scene:v7 didUpdateClientSettings:v6];
  }
  else
  {
    id v8 = a4;
    id v9 = a3;
    id WeakRetained = [v8 settingsDiff];
    id v7 = [v8 previousSettings];
    id v6 = [v8 transitionContext];

    [(FBSceneObserver *)self scene:v9 didUpdateClientSettingsWithDiff:WeakRetained oldClientSettings:v7 transitionContext:v6];
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  if (self->_observerFlags.clientSettingsUpdatedLEGACY)
  {
    p_observer = &self->_observer;
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained scene:v13 didUpdateClientSettingsWithDiff:v12 oldClientSettings:v11 transitionContext:v10];
  }
}

- (void)sceneContentStateDidChange:(id)a3
{
  if (self->_observerFlags.contentStateDidChange)
  {
    p_observer = &self->_observer;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained sceneContentStateDidChange:v4];
  }
}

- (void)sceneDidActivate:(id)a3
{
  if (self->_observerFlags.didActivate)
  {
    p_observer = &self->_observer;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained sceneDidActivate:v4];
  }
}

- (uint64_t)component
{
  if (result) { {
    return *(void *)(result + 56);
  }
  }
  return result;
}

- (_BYTE)initWithComponent:(unsigned char *)a1
{
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = [a1 _initWithObserver:v4];
    a1 = (unsigned char *)v5;
    if (v5)
    {
      objc_storeStrong((id *)(v5 + 56), a2);
      a1[53] = objc_opt_respondsToSelector() & 1;
      a1[54] = objc_opt_respondsToSelector() & 1;
      a1[55] = objc_opt_respondsToSelector() & 1;
    }
  }

  return a1;
}

- (id)_initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FBSceneObserver;
  uint64_t v5 = [(FBSceneObserver *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    v5->_observerAddress = (unint64_t)v4;
    v5->_observerClass = (Class)objc_opt_class();
    objc_storeWeak((id *)&v6->_observer, v4);
    v6->_observerFlags.contentStateDidChange = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didUpdateSettings = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.updatePreparedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.updateAppliedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.updateCompletedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didUpdateClientSettings = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.clientSettingsUpdatedLEGACY = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.willActivate = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didActivate = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.willDeactivateWithError = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.willDeactivateWithContext = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didInvalidate = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.didInvalidateWithContext = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.clientDidConnect = objc_opt_respondsToSelector() & 1;
    v6->_observerFlags.handleActions = objc_opt_respondsToSelector() & 1;
  }

  return v6;
}

- (void)initWithObserver:(void *)a1
{
  if (a1) { {
    return (void *)[a1 _initWithObserver:a2];
  }
  }
  return a1;
}

- (unint64_t)receiverImplementsWillUpdate
{
  if (result) { {
    return *(unsigned char *)(result + 49) || *(unsigned char *)(result + 54) || *(unsigned char *)(result + 48) || *(unsigned char *)(result + 53) != 0;
  }
  }
  return result;
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_delegateFlags.willUpdateSettings)
  {
    objc_super v8 = -[FBSceneObserver delegate]((id *)&self->super.isa);
    [v8 scene:v11 willUpdateSettings:v7];
  }
  else if (self->_componentFlags.willUpdateSettings)
  {
    [(FBSceneComponent *)self->_component scene:v11 willUpdateSettings:v6];
  }
  else
  {
    id v9 = [v6 mutableSettings];
    id v10 = [v7 transitionContext];
    [(FBSceneObserver *)self scene:v11 willUpdateSettings:v9 withTransitionContext:v10];
  }
}

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_delegateFlags.willUpdateSettingsLEGACY)
  {
    id v10 = -[FBSceneObserver delegate]((id *)&self->super.isa);
    [v10 scene:v11 willUpdateSettings:v8 withTransitionContext:v9];
  }
  else if (self->_componentFlags.willUpdateSettingsLEGACY)
  {
    [(FBSceneComponent *)self->_component scene:v11 willUpdateSettings:v8 withTransitionContext:v9];
  }
}

- (id)delegate
{
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 32)) { {
      id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    }
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FBSceneObserver *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && v4->_observerAddress == self->_observerAddress
      && v4->_observerClass == self->_observerClass)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->_observer);
      id v8 = objc_loadWeakRetained((id *)&self->_observer);
      BOOL v5 = WeakRetained == v8;
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
}

- (id)observer
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 1);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (_BYTE)initWithDelegate:(unsigned char *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 _initWithObserver:v3];
    a1 = (unsigned char *)v4;
    if (v4)
    {
      *(unsigned char *)(v4 + 32) = 1;
      *(unsigned char *)(v4 + 48) = objc_opt_respondsToSelector() & 1;
      a1[49] = objc_opt_respondsToSelector() & 1;
      a1[50] = objc_opt_respondsToSelector() & 1;
      a1[51] = objc_opt_respondsToSelector() & 1;
      a1[52] = objc_opt_respondsToSelector() & 1;
    }
  }

  return a1;
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  if (self->_delegateFlags.didReceiveActions)
  {
    id v6 = a4;
    id v7 = a3;
    -[FBSceneObserver delegate]((id *)&self->super.isa);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 scene:v7 didReceiveActions:v6];
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_observerFlags.handleActions && [v7 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    id v10 = [WeakRetained scene:v6 handleActions:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (uint64_t)delegateReceivesActions
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained) { {
        uint64_t v1 = *(unsigned char *)(v1 + 50) != 0;
      }
      }
      else {
        uint64_t v1 = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)observerHandlesActions
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained) { {
      uint64_t v1 = *(unsigned char *)(v1 + 47) != 0;
    }
    }
    else {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)sceneDidDeactivate:(id)a3 withContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = -[FBSceneObserver delegate]((id *)&self->super.isa);
  id v8 = v7;
  if (v7)
  {
    if (self->_delegateFlags.didDeactivateWithContext)
    {
      [v7 sceneDidDeactivate:v10 withContext:v6];
    }
    else if (self->_delegateFlags.didDeactivateWithError)
    {
      id v9 = [v6 error];
      [v8 sceneDidDeactivate:v10 withError:v9];
    }
  }
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"call sceneDidDeactivate:withContext:"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSceneObserver.m";
    __int16 v21 = 1024;
    int v22 = 218;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneWillActivate:(id)a3
{
  if (self->_observerFlags.willActivate)
  {
    p_observer = &self->_observer;
    id v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained sceneWillActivate:v4];
  }
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"call sceneWillDeactivate:withContext:"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = NSStringFromSelector(a2);
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    int v13 = 138544642;
    v14 = v10;
    __int16 v15 = 2114;
    v16 = v12;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"FBSceneObserver.m";
    __int16 v21 = 1024;
    int v22 = 274;
    __int16 v23 = 2114;
    v24 = v9;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v13, 0x3Au);
  }
  [v9 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneWillDeactivate:(id)a3 withContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (self->_observerFlags.willDeactivateWithContext)
    {
      [WeakRetained sceneWillDeactivate:v10 withContext:v6];
    }
    else if (self->_observerFlags.willDeactivateWithError)
    {
      id v9 = [v6 error];
      [v8 sceneWillDeactivate:v10 withError:v9];
    }
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"call sceneDidInvalidate:withContext:"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    id v11 = v7;
    __int16 v12 = 2114;
    int v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = @"FBSceneObserver.m";
    __int16 v18 = 1024;
    int v19 = 291;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)sceneDidInvalidate:(id)a3 withContext:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self->_component && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v7 = [v11 settings];
    id v8 = (void *)[v7 mutableCopy];

    [(FBSceneComponent *)self->_component componentWillInvalidate:v8];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  int v10 = WeakRetained;
  if (WeakRetained)
  {
    if (self->_observerFlags.didInvalidateWithContext)
    {
      [WeakRetained sceneDidInvalidate:v11 withContext:v6];
    }
    else if (self->_observerFlags.didInvalidate)
    {
      [WeakRetained sceneDidInvalidate:v11];
    }
  }
  [(FBSceneComponent *)self->_component invalidate];
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  if (self->_observerFlags.clientDidConnect)
  {
    p_observer = &self->_observer;
    id v6 = a4;
    id v7 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_observer);
    [WeakRetained scene:v7 clientDidConnect:v6];
  }
}

- (id)scene:(id)a3 handlePrivateActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  component = self->_component;
  if (component && self->_componentFlags.handlePrivateActions)
  {
    uint64_t v9 = [(FBSceneComponent *)component handlePrivateActions:v7];
  }
  else
  {
    uint64_t v9 = [(FBSceneObserver *)self scene:v6 handleActions:v7];
  }
  int v10 = (void *)v9;

  return v10;
}

- (FBSceneObserver)initWithScene:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"called before this object is created"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    __int16 v12 = v7;
    __int16 v13 = 2114;
    __int16 v14 = v9;
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2114;
    __int16 v18 = @"FBSceneObserver.m";
    __int16 v19 = 1024;
    int v20 = 362;
    __int16 v21 = 2114;
    int v22 = v6;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  result = (FBSceneObserver *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)invalidate
{
}

- (void)configureInitialSettings:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"called before this object is created"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    int v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = @"FBSceneObserver.m";
    __int16 v18 = 1024;
    int v19 = 375;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)componentWillInvalidate:(id)a3
{
  id v5 = a3;
  id v6 = [NSString stringWithFormat:@"not handled by this object"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = NSStringFromSelector(a2);
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = 138544642;
    int v11 = v7;
    __int16 v12 = 2114;
    __int16 v13 = v9;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2114;
    __int16 v17 = @"FBSceneObserver.m";
    __int16 v18 = 1024;
    int v19 = 379;
    __int16 v20 = 2114;
    __int16 v21 = v6;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);
  }
  [v6 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (NSString)description
{
  return (NSString *)[(FBSceneObserver *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSceneObserver *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  if (self->_isDelegate)
  {
    id v3 = @"delegate";
  }
  else if (self->_component)
  {
    id v3 = @"component";
  }
  else
  {
    id v3 = @"observer";
  }
  id v4 = v3;
  id v5 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  id v7 = (id)[v5 appendObject:WeakRetained withName:v4];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSceneObserver *)self descriptionBuilderWithMultilinePrefix:v4];
  id v6 = v5;
  if (self->_isDelegate)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke;
    v26[3] = &unk_1E5C497A0;
    id v27 = v5;
    v28 = self;
    [v27 appendBodySectionWithName:@"delegate" multilinePrefix:v4 block:v26];
  }
  if (self->_component)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    int v22 = __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke_2;
    __int16 v23 = &unk_1E5C497A0;
    id v24 = v6;
    v25 = self;
    [v24 appendBodySectionWithName:@"component" multilinePrefix:v4 block:&v20];
  }
  id v7 = (id)objc_msgSend(v6, "appendBool:withName:ifEqualTo:", self->_observerFlags.didUpdateSettings, @"RespondsToDidUpdateSettings", 1, v20, v21, v22, v23);
  id v8 = (id)[v6 appendBool:self->_observerFlags.didUpdateClientSettings withName:@"RespondsToDidUpdateClientSettings" ifEqualTo:1];
  id v9 = (id)[v6 appendBool:self->_observerFlags.updatePreparedLEGACY withName:@"RespondsToPrepared" ifEqualTo:1];
  id v10 = (id)[v6 appendBool:self->_observerFlags.updateAppliedLEGACY withName:@"RespondsToApplied" ifEqualTo:1];
  id v11 = (id)[v6 appendBool:self->_observerFlags.updateCompletedLEGACY withName:@"RespondsToCompleted" ifEqualTo:1];
  id v12 = (id)[v6 appendBool:self->_observerFlags.didInvalidate withName:@"RespondsToInvalidated" ifEqualTo:1];
  id v13 = (id)[v6 appendBool:self->_observerFlags.clientSettingsUpdatedLEGACY withName:@"RespondsToClientSettingsUpdated" ifEqualTo:1];
  id v14 = (id)[v6 appendBool:self->_observerFlags.didActivate withName:@"RespondsToDidActivate" ifEqualTo:1];
  id v15 = (id)[v6 appendBool:self->_observerFlags.willDeactivateWithError withName:@"RespondsToWillDeactivate" ifEqualTo:1];
  id v16 = (id)[v6 appendBool:self->_observerFlags.clientDidConnect withName:@"RespondsToClientDidConnect" ifEqualTo:1];
  id v17 = (id)[v6 appendBool:self->_observerFlags.handleActions withName:@"RespondsToHandleActions" ifEqualTo:1];
  __int16 v18 = [v6 build];

  return v18;
}

id __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 48) withName:@"RespondsToWillUpdateSettingsWithTransitionContext" ifEqualTo:1];
  id v3 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 49) withName:@"RespondsToWillUpdateSettings" ifEqualTo:1];
  id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 50) withName:@"RespondsToDidReceiveActions" ifEqualTo:1];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 51) withName:@"RespondsToDidDeactivateWithError" ifEqualTo:1];
}

id __50__FBSceneObserver_descriptionWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 53) withName:@"RespondsToWillUpdateSettingsWithTransitionContext" ifEqualTo:1];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 54) withName:@"RespondsToWillUpdateSettings" ifEqualTo:1];
}

@end