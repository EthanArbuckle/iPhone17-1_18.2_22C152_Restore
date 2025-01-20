@interface UIEditUserWordController
- (BOOL)_shouldSetDefaultFirstResponder;
- (UIEditUserWordController)initWithText:(id)a3;
- (UIEditUserWordController)initWithText:(id)a3 andShortcut:(id)a4;
- (UIWindow)_rotationDecider;
- (id)dismissCompletionHandler;
- (void)_dismiss;
- (void)_setRotationDecider:(id)a3;
- (void)dealloc;
- (void)setDismissCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation UIEditUserWordController

- (UIEditUserWordController)initWithText:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIEditUserWordController;
  v4 = [(KSEditUserWordController *)&v6 init];
  if (v4)
  {
    [(KSEditUserWordController *)v4 setDictionaryController:objc_alloc_init(KSUserWordsManager)];
    [(KSEditUserWordController *)v4 setTarget:a3];
  }
  return v4;
}

- (UIEditUserWordController)initWithText:(id)a3 andShortcut:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIEditUserWordController;
  objc_super v6 = [(KSEditUserWordController *)&v8 init];
  if (v6)
  {
    [(KSEditUserWordController *)v6 setDictionaryController:objc_alloc_init(KSUserWordsManager)];
    [(KSEditUserWordController *)v6 setTarget:a3];
    [(KSEditUserWordController *)v6 setShortcut:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIEditUserWordController;
  [(KSEditUserWordController *)&v3 dealloc];
}

- (BOOL)_shouldSetDefaultFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)UIEditUserWordController;
  [(KSEditUserWordController *)&v9 viewDidLoad];
  objc_msgSend((id)-[UIEditUserWordController navigationItem](self, "navigationItem"), "setLeftBarButtonItem:", (id)objc_msgSend(objc_alloc(MEMORY[0x263F1C468]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss));
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "frame");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "setFrame:", v3, v5, 330.0, v7);
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "layoutIfNeeded");
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "contentSize");
    -[UIEditUserWordController setPreferredContentSize:](self, "setPreferredContentSize:");
    objc_msgSend((id)-[UIEditUserWordController table](self, "table"), "setFrame:", v4, v6, 0.0, v8);
  }
}

- (void)_dismiss
{
  if ([(UIEditUserWordController *)self dismissCompletionHandler])
  {
    objc_msgSend((id)-[UIEditUserWordController navigationController](self, "navigationController"), "dismissViewControllerAnimated:completion:", 1, -[UIEditUserWordController dismissCompletionHandler](self, "dismissCompletionHandler"));
    [(UIEditUserWordController *)self setDismissCompletionHandler:0];
    [(UIEditUserWordController *)self _setRotationDecider:0];
  }
  else
  {
    double v3 = (void *)[(UIEditUserWordController *)self parentViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (UIWindow)_rotationDecider
{
  return self->_rotationDecider;
}

- (void)_setRotationDecider:(id)a3
{
}

- (id)dismissCompletionHandler
{
  return self->_dismissCompletionHandler;
}

- (void)setDismissCompletionHandler:(id)a3
{
}

@end