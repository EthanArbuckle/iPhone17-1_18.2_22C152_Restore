@interface DBLocalSceneHostWindow
- (DBLocalSceneController)localSceneController;
- (DBLocalSceneHostWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 sceneFrame:(CGRect)a5 sceneIdentity:(id)a6;
- (FBSScene)clientScene;
- (FBScene)localScene;
- (id)presentationViewWithIdentifier:(id)a3;
- (void)invalidate;
- (void)invalidatePresentationViewForIdentifier:(id)a3;
- (void)setLocalSceneController:(id)a3;
@end

@implementation DBLocalSceneHostWindow

- (DBLocalSceneHostWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 sceneFrame:(CGRect)a5 sceneIdentity:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  id v16 = a3;
  id v17 = a6;
  v18 = [v17 identifier];
  v27.receiver = self;
  v27.super_class = (Class)DBLocalSceneHostWindow;
  v19 = (DBLocalSceneHostWindow *)-[DBLocalSceneHostWindow _initWithFrame:debugName:windowScene:](&v27, sel__initWithFrame_debugName_windowScene_, v18, v16, v14, v13, v12, v11);

  if (v19)
  {
    v20 = [v16 _FBSScene];
    v21 = [v20 settings];
    v22 = [v21 displayConfiguration];

    v23 = -[DBLocalSceneController initWithDisplayConfiguration:frame:sceneIdentity:]([DBLocalSceneController alloc], "initWithDisplayConfiguration:frame:sceneIdentity:", v22, v17, x, y, width, height);
    localSceneController = v19->_localSceneController;
    v19->_localSceneController = v23;

    v25 = [(DBLocalSceneController *)v19->_localSceneController presentationView];
    [(DBLocalSceneHostWindow *)v19 addSubview:v25];
  }
  return v19;
}

- (FBScene)localScene
{
  v2 = [(DBLocalSceneHostWindow *)self localSceneController];
  v3 = [v2 scene];

  return (FBScene *)v3;
}

- (FBSScene)clientScene
{
  v2 = [(DBLocalSceneHostWindow *)self localSceneController];
  v3 = [v2 clientScene];

  return (FBSScene *)v3;
}

- (id)presentationViewWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(DBLocalSceneHostWindow *)self localSceneController];
  v6 = [v5 presentationViewWithIdentifier:v4];

  return v6;
}

- (void)invalidatePresentationViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DBLocalSceneHostWindow *)self localSceneController];
  [v5 invalidatePresentationViewForIdentifier:v4];
}

- (void)invalidate
{
  id v2 = [(DBLocalSceneHostWindow *)self localSceneController];
  [v2 invalidate];
}

- (DBLocalSceneController)localSceneController
{
  return self->_localSceneController;
}

- (void)setLocalSceneController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end