@interface _EXSceneComponent
- (UIScene)_scene;
- (_EXSceneComponent)initWithScene:(id)a3;
- (void)_sceneWillInvalidate:(id)a3;
- (void)_setScene:(id)a3;
@end

@implementation _EXSceneComponent

- (_EXSceneComponent)initWithScene:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_EXSceneComponent;
  v5 = [(_EXSceneComponent *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    v7 = [v4 _FBSScene];
    id v8 = objc_alloc(MEMORY[0x263F08C38]);
    v9 = [v7 identifier];
    v10 = (void *)[v8 initWithUUIDString:v9];

    v11 = [MEMORY[0x263F04E10] sharedInstance];
    v12 = [v11 sessionForIdentifier:v10];

    v13 = [v12 scene];
    if ([v13 conformsToProtocol:&unk_26C676108])
    {
      v14 = [v13 sceneDelegate];
    }
    else
    {
      v14 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_scene);
    [WeakRetained setDelegate:v14];
  }
  return v6;
}

- (void)_sceneWillInvalidate:(id)a3
{
  id v7 = [a3 _FBSScene];
  id v3 = objc_alloc(MEMORY[0x263F08C38]);
  id v4 = [v7 identifier];
  v5 = (void *)[v3 initWithUUIDString:v4];

  v6 = [MEMORY[0x263F04E10] sharedInstance];
  [v6 removeSessionForIdentifier:v5];
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end