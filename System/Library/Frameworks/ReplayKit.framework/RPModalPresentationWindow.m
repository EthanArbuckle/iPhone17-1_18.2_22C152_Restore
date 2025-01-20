@interface RPModalPresentationWindow
- (BOOL)isInternalWindow;
- (RPModalPresentationWindow)init;
- (id)_presentationViewController;
- (id)mainWindow;
- (void)dealloc;
- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation RPModalPresentationWindow

- (RPModalPresentationWindow)init
{
  v8.receiver = self;
  v8.super_class = (Class)RPModalPresentationWindow;
  v2 = [(UIApplicationRotationFollowingWindow *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(RPModalPresentationWindow *)v2 setOpaque:0];
    v4 = [MEMORY[0x263F1C550] clearColor];
    [(RPModalPresentationWindow *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F1C920] mainScreen];
    [(RPModalPresentationWindow *)v3 setScreen:v5];

    [(RPModalPresentationWindow *)v3 setWindowLevel:*MEMORY[0x263F1D810]];
    [(RPModalPresentationWindow *)v3 setHidden:1];
    v6 = [(RPModalPresentationWindow *)v3 mainWindow];
    [v6 beginDisablingInterfaceAutorotation];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(RPModalPresentationWindow *)self mainWindow];
  [v3 endDisablingInterfaceAutorotation];

  v4.receiver = self;
  v4.super_class = (Class)RPModalPresentationWindow;
  [(RPModalPresentationWindow *)&v4 dealloc];
}

- (id)mainWindow
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  v3 = [v2 windows];
  objc_super v4 = [v3 firstObject];

  return v4;
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
  v10 = [(RPModalPresentationWindow *)self _presentationViewController];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __71__RPModalPresentationWindow_presentViewController_animated_completion___block_invoke;
  v12[3] = &unk_26451DD28;
  id v13 = v8;
  id v11 = v8;
  [v10 presentViewController:v9 animated:v5 completion:v12];
}

uint64_t __71__RPModalPresentationWindow_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)presentAlertController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v11 = a3;
  id v8 = (void (**)(id, BOOL))a5;
  id v9 = [(RPModalPresentationWindow *)self _presentationViewController];
  id v10 = [v9 presentedViewController];
  if (v10)
  {
    if (v8) {
      v8[2](v8, v10 == v11);
    }
  }
  else
  {
    [(RPModalPresentationWindow *)self presentViewController:v11 animated:v6 completion:v8];
  }
}

- (id)_presentationViewController
{
  v3 = [(RPModalPresentationWindow *)self rootViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1C410]);
    [v4 setSizesWindowToScene:1];
    [(RPModalPresentationWindow *)self setRootViewController:v4];
  }

  return (id)[(RPModalPresentationWindow *)self rootViewController];
}

@end