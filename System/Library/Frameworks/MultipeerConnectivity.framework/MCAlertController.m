@interface MCAlertController
- (UIWindow)alertWindow;
- (id)viewDidDisappearHandler;
- (id)viewWillAppearHandler;
- (void)dealloc;
- (void)dismiss;
- (void)setAlertWindow:(id)a3;
- (void)setViewDidDisappearHandler:(id)a3;
- (void)setViewWillAppearHandler:(id)a3;
- (void)show;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCAlertController

- (void)show
{
  id v3 = objc_alloc(MEMORY[0x263F1CBC8]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  -[MCAlertController setAlertWindow:](self, "setAlertWindow:", (id)objc_msgSend(v3, "initWithFrame:"));
  [(UIWindow *)[(MCAlertController *)self alertWindow] setRootViewController:objc_alloc_init(MEMORY[0x263F1CB68])];
  [(UIWindow *)[(MCAlertController *)self alertWindow] setWindowLevel:*MEMORY[0x263F1D810] + 1.0];
  [(UIWindow *)[(MCAlertController *)self alertWindow] makeKeyAndVisible];
  v4 = [(UIWindow *)[(MCAlertController *)self alertWindow] rootViewController];

  [(UIViewController *)v4 presentViewController:self animated:1 completion:0];
}

- (void)dismiss
{
  v2 = [(UIWindow *)[(MCAlertController *)self alertWindow] rootViewController];

  [(UIViewController *)v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCAlertController;
  [(MCAlertController *)&v4 viewWillAppear:a3];
  if ([(MCAlertController *)self viewWillAppearHandler]) {
    (*(void (**)(void))([(MCAlertController *)self viewWillAppearHandler] + 16))();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCAlertController;
  [(MCAlertController *)&v4 viewDidDisappear:a3];
  [(UIWindow *)[(MCAlertController *)self alertWindow] setHidden:1];
  [(MCAlertController *)self setAlertWindow:0];
  if ([(MCAlertController *)self viewDidDisappearHandler]) {
    (*(void (**)(void))([(MCAlertController *)self viewDidDisappearHandler] + 16))();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MCAlertController;
  [(MCAlertController *)&v3 dealloc];
}

- (id)viewWillAppearHandler
{
  return self->_viewWillAppearHandler;
}

- (void)setViewWillAppearHandler:(id)a3
{
}

- (id)viewDidDisappearHandler
{
  return self->_viewDidDisappearHandler;
}

- (void)setViewDidDisappearHandler:(id)a3
{
}

- (UIWindow)alertWindow
{
  return self->_alertWindow;
}

- (void)setAlertWindow:(id)a3
{
}

@end