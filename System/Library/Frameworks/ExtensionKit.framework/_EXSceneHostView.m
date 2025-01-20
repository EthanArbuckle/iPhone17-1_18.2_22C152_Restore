@interface _EXSceneHostView
- (FBScene)scene;
- (NSString)role;
- (NSUUID)sessionUUID;
- (UIScenePresenter)scenePresenter;
- (_EXExtensionProcessHandle)extensionProcess;
- (_EXSceneHostView)initWithExtensionProcess:(id)a3 sessionUUID:(id)a4 role:(id)a5;
- (void)creatScene;
- (void)layoutSubviews;
- (void)setExtensionProcess:(id)a3;
- (void)setScene:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)setSessionUUID:(id)a3;
@end

@implementation _EXSceneHostView

- (_EXSceneHostView)initWithExtensionProcess:(id)a3 sessionUUID:(id)a4 role:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_EXSceneHostView;
  v12 = [(_EXSceneHostView *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sessionUUID, a4);
    objc_storeStrong((id *)&v13->_role, a5);
    objc_storeStrong((id *)&v13->_extensionProcess, a3);
    v14 = [MEMORY[0x263F825C8] lightGrayColor];
    [(_EXSceneHostView *)v13 setBackgroundColor:v14];
  }
  return v13;
}

- (void)creatScene
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a2 + 432);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_2156DD000, log, OS_LOG_TYPE_DEBUG, "Scene created: %{public}@ for session: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)setScene:(id)a3
{
  v31[4] = *MEMORY[0x263EF8340];
  int v4 = (FBScene *)a3;
  uint64_t v5 = [(_EXSceneHostView *)self scenePresenter];
  __int16 v6 = [v5 presentationView];
  [v6 removeFromSuperview];

  uint64_t v7 = [(_EXSceneHostView *)self scenePresenter];
  [v7 invalidate];

  scene = self->_scene;
  self->_scene = v4;
  v28 = v4;

  v30 = [(FBScene *)v28 uiPresentationManager];
  id v9 = [(_EXSceneHostView *)self sessionUUID];
  id v10 = [v9 UUIDString];
  id v11 = [v30 createPresenterWithIdentifier:v10];

  v29 = v11;
  [(_EXSceneHostView *)self setScenePresenter:v11];
  v12 = [v11 presentationView];
  [(_EXSceneHostView *)self bounds];
  objc_msgSend(v12, "setFrame:");
  v13 = [MEMORY[0x263F825C8] darkGrayColor];
  [v12 setBackgroundColor:v13];

  [(_EXSceneHostView *)self addSubview:v12];
  v23 = (void *)MEMORY[0x263F08938];
  v27 = [(_EXSceneHostView *)self leftAnchor];
  v26 = [v12 leftAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v31[0] = v25;
  v24 = [(_EXSceneHostView *)self topAnchor];
  v14 = [v12 topAnchor];
  v15 = [v24 constraintEqualToAnchor:v14];
  v31[1] = v15;
  objc_super v16 = [(_EXSceneHostView *)self rightAnchor];
  v17 = [v12 rightAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v31[2] = v18;
  v19 = [(_EXSceneHostView *)self bottomAnchor];
  v20 = [v12 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v31[3] = v21;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  [v23 activateConstraints:v22];

  [v29 activate];
}

- (void)layoutSubviews
{
  scene = self->_scene;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34___EXSceneHostView_layoutSubviews__block_invoke;
  v3[3] = &unk_2642583C8;
  v3[4] = self;
  [(FBScene *)scene updateSettingsWithBlock:v3];
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
}

- (_EXExtensionProcessHandle)extensionProcess
{
  return self->_extensionProcess;
}

- (void)setExtensionProcess:(id)a3
{
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_extensionProcess, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);

  objc_storeStrong((id *)&self->_scene, 0);
}

@end