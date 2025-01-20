@interface MPModalPresentationWindow
- (BOOL)isInternalWindow;
- (MPModalPresentationWindow)init;
- (id)_presentationViewController;
- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation MPModalPresentationWindow

- (id)_presentationViewController
{
  v3 = [(MPModalPresentationWindow *)self rootViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1440]);
    [v4 setSizesWindowToScene:1];
    [(MPModalPresentationWindow *)self setRootViewController:v4];
  }

  return (id)[(MPModalPresentationWindow *)self rootViewController];
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v13 = (void (**)(id, BOOL))a5;
  id v9 = a3;
  v10 = [(MPModalPresentationWindow *)self _presentationViewController];
  id v11 = [v10 presentedViewController];
  if (v11)
  {

    if (v11 != v9)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"MPModalPresentationWindow.m", 49, @"Multiple alert controllers assigned to the same window: %@", self object file lineNumber description];
    }
    if (v13) {
      v13[2](v13, v11 == v9);
    }
  }
  else
  {
    [(MPModalPresentationWindow *)self presentViewController:v9 animated:v5 completion:v13];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(MPModalPresentationWindow *)self _presentationViewController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__MPModalPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E57FA198;
  id v13 = v8;
  id v11 = v8;
  [v10 presentViewController:v9 animated:v5 completion:v12];
}

uint64_t __71__MPModalPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (MPModalPresentationWindow)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPModalPresentationWindow;
  v2 = [(UIApplicationRotationFollowingWindow *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MPModalPresentationWindow *)v2 setOpaque:0];
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(MPModalPresentationWindow *)v3 setBackgroundColor:v4];

    [(MPModalPresentationWindow *)v3 setWindowLevel:*MEMORY[0x1E4FB3108]];
    [(MPModalPresentationWindow *)v3 setHidden:1];
  }
  return v3;
}

@end