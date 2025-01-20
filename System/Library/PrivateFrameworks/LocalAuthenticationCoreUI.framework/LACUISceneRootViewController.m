@interface LACUISceneRootViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (LACUIScene)scene;
- (LACUISceneRootViewController)initWithScene:(id)a3;
- (int)_preferredStatusBarVisibility;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)dismiss;
- (void)handleSceneButton:(int64_t)a3;
- (void)present:(id)a3 animated:(BOOL)a4;
- (void)present:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation LACUISceneRootViewController

- (LACUISceneRootViewController)initWithScene:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUISceneRootViewController;
  v6 = [(LACUISceneRootViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_scene, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = [NSString stringWithFormat:@"%@ was deallocated", self];
  [(LACUIScene *)self->_scene deactivateWithReason:v3];

  v4.receiver = self;
  v4.super_class = (Class)LACUISceneRootViewController;
  [(LACUISceneRootViewController *)&v4 dealloc];
}

- (void)dismiss
{
}

- (void)present:(id)a3 animated:(BOOL)a4
{
}

- (void)present:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (!a5) {
    a5 = &__block_literal_global_8;
  }
  [(LACUISceneRootViewController *)self presentViewController:a3 animated:a4 completion:a5];
}

- (void)handleSceneButton:(int64_t)a3
{
  if (!a3) {
    [(LACUIScene *)self->_scene deactivateWithReason:@"Home Button was pressed"];
  }
}

- (int)_preferredStatusBarVisibility
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  return [(LACUIScene *)self->_scene statusBarStyle];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (LACUIScene)scene
{
  return self->_scene;
}

- (void).cxx_destruct
{
}

@end