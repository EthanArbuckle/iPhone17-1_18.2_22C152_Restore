@interface LACUIScenePresentationContext
- (LACUIScene)scene;
- (LACUISceneContentPresenter)presenter;
- (LACUIScenePresentationContext)initWithPresenter:(id)a3 scene:(id)a4;
@end

@implementation LACUIScenePresentationContext

- (LACUIScenePresentationContext)initWithPresenter:(id)a3 scene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACUIScenePresentationContext;
  v9 = [(LACUIScenePresentationContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    objc_storeStrong((id *)&v10->_scene, a4);
  }

  return v10;
}

- (LACUISceneContentPresenter)presenter
{
  return self->_presenter;
}

- (LACUIScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end