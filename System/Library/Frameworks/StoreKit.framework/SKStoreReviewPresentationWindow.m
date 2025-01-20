@interface SKStoreReviewPresentationWindow
- (BOOL)isInternalWindow;
- (double)windowLevel;
- (id)_presentationViewController;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation SKStoreReviewPresentationWindow

- (double)windowLevel
{
  return *MEMORY[0x1E4FB3108];
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
  v10 = [(SKStoreReviewPresentationWindow *)self _presentationViewController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__SKStoreReviewPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_1E5FA9988;
  id v13 = v8;
  id v11 = v8;
  [v10 presentViewController:v9 animated:v5 completion:v12];
}

uint64_t __77__SKStoreReviewPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (id)_presentationViewController
{
  v3 = [(SKStoreReviewPresentationWindow *)self rootViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1440]);
    [v4 setSizesWindowToScene:1];
    [(SKStoreReviewPresentationWindow *)self setRootViewController:v4];
  }

  return (id)[(SKStoreReviewPresentationWindow *)self rootViewController];
}

@end