@interface _UIKeyboardArbiterHost
+ (id)launchAdvisorWithOmniscientDelegate:(id)a3;
+ (id)launchAdvisorWithOmniscientDelegate:(id)a3 sceneDelegate:(id)a4;
+ (void)launch;
- (BOOL)isAvailable;
- (NSString)description;
- (NSString)serviceName;
- (_UIKeyboardArbiter)owner;
- (id)_createSceneWithIdentifier:(id)a3 initialClientSettings:(id)a4;
- (void)attach:(id)a3;
- (void)connectWithQueue:(id)a3;
- (void)createSceneWithCompletion:(id)a3;
- (void)dealloc;
- (void)detach:(id)a3;
- (void)setOwner:(id)a3;
- (void)updateSceneSettings;
@end

@implementation _UIKeyboardArbiterHost

- (void)updateSceneSettings
{
  v3 = [(FBSScene *)self->_scene clientSettings];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(_UIKeyboardArbiterHost *)self owner];
  [v5 updateSceneClientSettings:v4];

  id v6 = v4;
  BSDispatchMain();
}

- (_UIKeyboardArbiter)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->owner);
  return (_UIKeyboardArbiter *)WeakRetained;
}

- (BOOL)isAvailable
{
  return self->_scene != 0;
}

- (void)dealloc
{
  v3 = self->_scene;
  v4 = v3;
  if (v3)
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __33___UIKeyboardArbiterHost_dealloc__block_invoke;
    v9 = &unk_2647211F0;
    v10 = v3;
    BSDispatchMain();
  }
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardArbiterHost;
  [(_UIKeyboardArbiterHost *)&v5 dealloc];
}

+ (void)launch
{
  id v2 = (id)[a1 launchAdvisorWithOmniscientDelegate:0];
}

+ (id)launchAdvisorWithOmniscientDelegate:(id)a3
{
  return (id)[a1 launchAdvisorWithOmniscientDelegate:a3 sceneDelegate:0];
}

+ (id)launchAdvisorWithOmniscientDelegate:(id)a3 sceneDelegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76___UIKeyboardArbiterHost_launchAdvisorWithOmniscientDelegate_sceneDelegate___block_invoke;
  v12[3] = &unk_2647211A0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = qword_26AC12AD0;
  id v8 = v6;
  id v9 = v5;
  if (v7 != -1) {
    dispatch_once(&qword_26AC12AD0, v12);
  }
  id v10 = (id)_MergedGlobals_3;

  return v10;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UIKeyboardArbiterHost;
  v4 = [(_UIKeyboardArbiterHost *)&v7 description];
  id v5 = [v3 stringWithFormat:@"<%@ scene = %@>", v4, self->_scene];;

  return (NSString *)v5;
}

- (NSString)serviceName
{
  return (NSString *)[MEMORY[0x263F83088] serviceName];
}

- (void)connectWithQueue:(id)a3
{
}

- (void)createSceneWithCompletion:(id)a3
{
  id v10 = (void (**)(id, BOOL))a3;
  id v4 = objc_alloc_init(MEMORY[0x263F82988]);
  id v5 = [(_UIKeyboardArbiterHost *)self owner];
  [v5 updateSceneClientSettings:v4];

  id v6 = [(_UIKeyboardArbiterHost *)self _createSceneWithIdentifier:@"com.apple.UIKit.remote-keyboard" initialClientSettings:v4];
  scene = self->_scene;
  self->_scene = v6;

  id v8 = self->_scene;
  if (v10) {
    v10[2](v10, v8 != 0);
  }
  if (v8)
  {
    id v9 = [(_UIKeyboardArbiterHost *)self owner];
    [v9 activateClients];
  }
}

- (void)attach:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

- (void)detach:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

- (id)_createSceneWithIdentifier:(id)a3 initialClientSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke;
  v16[3] = &unk_264721990;
  id v9 = v8;
  id v17 = v9;
  id v10 = v7;
  v20 = &v22;
  SEL v21 = a2;
  id v18 = v10;
  v19 = self;
  v11 = (void (**)(void))MEMORY[0x22A631F50](v16);
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    v11[2](v11);
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __75___UIKeyboardArbiterHost__createSceneWithIdentifier_initialClientSettings___block_invoke_3;
    v14[3] = &unk_264721868;
    v15 = v11;
    dispatch_sync(MEMORY[0x263EF83A0], v14);
  }
  id v12 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v12;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->owner);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end