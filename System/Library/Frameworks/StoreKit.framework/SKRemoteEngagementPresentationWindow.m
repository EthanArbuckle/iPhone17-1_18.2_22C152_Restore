@interface SKRemoteEngagementPresentationWindow
- (BOOL)isInternalWindow;
- (SKRemoteEngagementPresentationWindow)init;
- (id)_presentationViewController;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SKRemoteEngagementPresentationWindow

- (SKRemoteEngagementPresentationWindow)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKRemoteEngagementPresentationWindow;
  v2 = [(UIApplicationRotationFollowingWindow *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SKRemoteEngagementPresentationWindow *)v2 setOpaque:0];
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(SKRemoteEngagementPresentationWindow *)v3 setBackgroundColor:v4];

    [(SKRemoteEngagementPresentationWindow *)v3 setWindowLevel:*MEMORY[0x1E4FB3118] + -1.0];
  }
  return v3;
}

- (BOOL)isInternalWindow
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(SKRemoteEngagementPresentationWindow *)self _presentationViewController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__SKRemoteEngagementPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E5FA9988;
  id v13 = v8;
  id v11 = v8;
  [v10 presentViewController:v9 animated:v5 completion:v12];
}

uint64_t __82__SKRemoteEngagementPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (id)_presentationViewController
{
  v3 = [(SKRemoteEngagementPresentationWindow *)self rootViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1440]);
    [v4 setSizesWindowToScene:1];
    [(SKRemoteEngagementPresentationWindow *)self setRootViewController:v4];
  }

  return (id)[(SKRemoteEngagementPresentationWindow *)self rootViewController];
}

@end