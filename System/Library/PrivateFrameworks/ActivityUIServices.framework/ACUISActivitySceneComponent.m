@interface ACUISActivitySceneComponent
+ (void)load;
- (ACUISActivitySceneComponent)initWithScene:(id)a3;
- (BOOL)isActivityScene:(id)a3;
- (BSAbsoluteMachTimer)delayedGestureActionTimer;
- (NSMapTable)dependencyRecognizersPerWindow;
- (NSMapTable)recognizersPerWindow;
- (UIScene)_scene;
- (void)_handleGestureChange:(id)a3;
- (void)_handleGestureDependencyChange:(id)a3;
- (void)_handleGestureState:(int64_t)a3;
- (void)_sendActions:(id)a3;
- (void)_setScene:(id)a3;
- (void)_windowBecameHidden:(id)a3;
- (void)_windowDidBecomeVisible:(id)a3;
- (void)dealloc;
- (void)setDelayedGestureActionTimer:(id)a3;
- (void)setDependencyRecognizersPerWindow:(id)a3;
- (void)setRecognizersPerWindow:(id)a3;
@end

@implementation ACUISActivitySceneComponent

- (void)_setScene:(id)a3
{
}

- (ACUISActivitySceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ACUISActivitySceneComponent;
  v5 = [(ACUISActivitySceneComponent *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    uint64_t v7 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    dependencyRecognizersPerWindow = v6->_dependencyRecognizersPerWindow;
    v6->_dependencyRecognizersPerWindow = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    recognizersPerWindow = v6->_recognizersPerWindow;
    v6->_recognizersPerWindow = (NSMapTable *)v9;

    if ([(ACUISActivitySceneComponent *)v6 isActivityScene:v4])
    {
      v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:v6 selector:sel__windowDidBecomeVisible_ name:*MEMORY[0x263F83C40] object:0];

      v12 = [MEMORY[0x263F08A00] defaultCenter];
      [v12 addObserver:v6 selector:sel__windowBecameHidden_ name:*MEMORY[0x263F83C30] object:0];
    }
  }

  return v6;
}

- (BOOL)isActivityScene:(id)a3
{
  v3 = [a3 session];
  id v4 = [v3 role];

  if ([v4 isEqualToString:@"ActivitySceneSessionRoleListItem"]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"ActivitySceneSessionRoleAmbient"];
  }

  return v5;
}

void __35__ACUISActivitySceneComponent_load__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 == objc_opt_class())
  {
    v3 = (void *)MEMORY[0x263F82B30];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x263F08A98] predicateWithValue:1];
    [v3 _registerSceneComponentClass:v4 withKey:@"ACUISActivitySceneComponentKey" predicate:v5];
  }
}

+ (void)load
{
}

- (void)dealloc
{
  [(NSMapTable *)self->_dependencyRecognizersPerWindow removeAllObjects];
  [(NSMapTable *)self->_recognizersPerWindow removeAllObjects];
  [(BSAbsoluteMachTimer *)self->_delayedGestureActionTimer invalidate];
  delayedGestureActionTimer = self->_delayedGestureActionTimer;
  self->_delayedGestureActionTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)ACUISActivitySceneComponent;
  [(ACUISActivitySceneComponent *)&v4 dealloc];
}

- (void)_windowDidBecomeVisible:(id)a3
{
  id v4 = a3;
  id v5 = _sceneComponentLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C948000, v5, OS_LOG_TYPE_DEFAULT, "windowBecameVisible", buf, 2u);
  }

  v6 = [v4 object];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(NSMapTable *)self->_dependencyRecognizersPerWindow objectForKey:v6];
      if (!v7)
      {
        v8 = [[ACUISDependencyGestureRecognizer alloc] initWithTarget:self action:sel__handleGestureDependencyChange_];
        uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", NSClassFromString(&cfstr_Mruslider.isa), 0);
        [(ACUISDependencyGestureRecognizer *)v8 setObservedControlClasses:v9];

        v10 = [v6 rootViewController];
        v11 = [v10 view];
        [v11 addGestureRecognizer:v8];

        [(NSMapTable *)self->_dependencyRecognizersPerWindow setObject:v8 forKey:v6];
      }
      v12 = [(NSMapTable *)self->_recognizersPerWindow objectForKey:v6];
      if (!v12)
      {
        v13 = [[ACUISGestureRecognizer alloc] initWithTarget:self action:sel__handleGestureChange_];
        objc_super v14 = [v6 rootViewController];
        v15 = [v14 view];
        [v15 addGestureRecognizer:v13];

        [(NSMapTable *)self->_recognizersPerWindow setObject:v13 forKey:v6];
      }
    }
  }
}

- (void)_windowBecameHidden:(id)a3
{
  id v4 = a3;
  id v5 = _sceneComponentLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23C948000, v5, OS_LOG_TYPE_DEFAULT, "_windowBecameHidden", v10, 2u);
  }

  v6 = [v4 object];

  uint64_t v7 = [(NSMapTable *)self->_dependencyRecognizersPerWindow objectForKey:v6];
  if (v7)
  {
    v8 = [v6 rootViewController];
    uint64_t v9 = [v8 view];
    [v9 removeGestureRecognizer:v7];

    [(NSMapTable *)self->_dependencyRecognizersPerWindow removeObjectForKey:v6];
  }
}

- (void)_handleGestureDependencyChange:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = _sceneComponentLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23C948000, v4, OS_LOG_TYPE_DEFAULT, "UIControl was tapped", v8, 2u);
    }

    id v5 = (void *)MEMORY[0x263EFFA08];
    v6 = [[ACUISActivitySceneAction alloc] initWithCommand:1];
    uint64_t v7 = [v5 setWithObject:v6];

    [(ACUISActivitySceneComponent *)self _sendActions:v7];
  }
}

- (void)_handleGestureState:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v7 = _sceneComponentLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_23C948000, v7, OS_LOG_TYPE_DEFAULT, "Gesture ended", v13, 2u);
    }

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = [ACUISActivitySceneAction alloc];
    uint64_t v10 = 3;
    goto LABEL_13;
  }
  if (a3 != 2)
  {
    if (a3 != 1) {
      return;
    }
    id v4 = _sceneComponentLogger();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v15 = 0;
    id v5 = "Gesture began";
    v6 = (uint8_t *)&v15;
    goto LABEL_11;
  }
  id v4 = _sceneComponentLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v5 = "Gesture changed";
    v6 = buf;
LABEL_11:
    _os_log_impl(&dword_23C948000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }
LABEL_12:

  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = [ACUISActivitySceneAction alloc];
  uint64_t v10 = 2;
LABEL_13:
  v11 = [(ACUISActivitySceneAction *)v9 initWithCommand:v10];
  v12 = [v8 setWithObject:v11];

  [(ACUISActivitySceneComponent *)self _sendActions:v12];
}

- (void)_handleGestureChange:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v16 = [v4 state];
  if ((v14[3] | 2) == 3)
  {
    -[ACUISActivitySceneComponent _handleGestureState:](self, "_handleGestureState:");
  }
  else if (!self->_delayedGestureActionTimer)
  {
    objc_initWeak(&location, self);
    id v5 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x263F29BA8]) initWithIdentifier:@"ACUISActivitySceneComponent.delayedGestureActionTimer"];
    delayedGestureActionTimer = self->_delayedGestureActionTimer;
    self->_delayedGestureActionTimer = v5;

    uint64_t v7 = self->_delayedGestureActionTimer;
    uint64_t v8 = MEMORY[0x263EF83A0];
    id v9 = MEMORY[0x263EF83A0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__ACUISActivitySceneComponent__handleGestureChange___block_invoke;
    v10[3] = &unk_264E78358;
    objc_copyWeak(&v11, &location);
    v10[4] = &v13;
    [(BSAbsoluteMachTimer *)v7 scheduleWithFireInterval:v8 leewayInterval:v10 queue:1.0 handler:0.0];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v13, 8);
}

void __52__ACUISActivitySceneComponent__handleGestureChange___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleGestureState:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  if (WeakRetained)
  {
    [WeakRetained[4] invalidate];
    id v2 = WeakRetained[4];
    WeakRetained[4] = 0;
  }
}

- (void)_sendActions:(id)a3
{
  p_scene = &self->_scene;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scene);
  id v5 = [WeakRetained _FBSScene];
  [v5 sendActions:v4];
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (NSMapTable)dependencyRecognizersPerWindow
{
  return self->_dependencyRecognizersPerWindow;
}

- (void)setDependencyRecognizersPerWindow:(id)a3
{
}

- (NSMapTable)recognizersPerWindow
{
  return self->_recognizersPerWindow;
}

- (void)setRecognizersPerWindow:(id)a3
{
}

- (BSAbsoluteMachTimer)delayedGestureActionTimer
{
  return self->_delayedGestureActionTimer;
}

- (void)setDelayedGestureActionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedGestureActionTimer, 0);
  objc_storeStrong((id *)&self->_recognizersPerWindow, 0);
  objc_storeStrong((id *)&self->_dependencyRecognizersPerWindow, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end