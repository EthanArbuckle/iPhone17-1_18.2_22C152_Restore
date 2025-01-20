@interface LACUISceneSpringBoardAdapter
- (LACUISceneSpringBoardAdapter)initWithScene:(id)a3;
- (int64_t)statusBarStyle;
- (void)deactivateWithReason:(id)a3;
@end

@implementation LACUISceneSpringBoardAdapter

- (LACUISceneSpringBoardAdapter)initWithScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUISceneSpringBoardAdapter;
  v6 = [(LACUISceneSpringBoardAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scene, a3);
  }

  return v7;
}

- (int64_t)statusBarStyle
{
  v2 = [(SBSUIRemoteAlertScene *)self->_scene statusBarManager];
  int64_t v3 = [v2 statusBarStyle];

  return v3;
}

- (void)deactivateWithReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end