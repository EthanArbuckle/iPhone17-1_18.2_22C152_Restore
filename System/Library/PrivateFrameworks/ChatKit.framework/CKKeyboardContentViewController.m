@interface CKKeyboardContentViewController
- (CKKeyboardContentViewController)initWithViewController:(id)a3 identifier:(id)a4;
- (NSString)identifier;
- (UIViewController)viewController;
- (void)loadView;
- (void)setIdentifier:(id)a3;
- (void)setViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKKeyboardContentViewController

- (CKKeyboardContentViewController)initWithViewController:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKKeyboardContentViewController;
  v8 = [(UIInputViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    [(CKKeyboardContentViewController *)v8 setIdentifier:v7];
    [(CKKeyboardContentViewController *)v9 setViewController:v6];
    if ([v7 isEqualToString:*MEMORY[0x1E4F6CBF8]]) {
      [(UIInputViewController *)v9 _setAutosizeToCurrentKeyboard:1];
    }
  }

  return v9;
}

- (void)loadView
{
  v3 = [(CKKeyboardContentViewController *)self identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CBF8]];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42AC0]);
    id v7 = (CKInputView *)objc_msgSend(v5, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    id v6 = [CKInputView alloc];
    id v7 = -[UIInputView initWithFrame:inputViewStyle:](v6, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIInputView *)v7 setAllowsSelfSizing:1];
  }
  [(CKInputView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKInputView *)v7 setBackgroundColor:0];
  [(UIInputViewController *)self setView:v7];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CKKeyboardContentViewController;
  [(UIInputViewController *)&v12 viewDidLoad];
  v3 = [(CKKeyboardContentViewController *)self viewController];

  if (v3)
  {
    char v4 = [(CKKeyboardContentViewController *)self viewController];
    [(CKKeyboardContentViewController *)self addChildViewController:v4];

    id v5 = [(CKKeyboardContentViewController *)self view];
    id v6 = [(CKKeyboardContentViewController *)self viewController];
    id v7 = [v6 view];
    [v5 addSubview:v7];

    v8 = [(CKKeyboardContentViewController *)self viewController];
    v9 = [v8 view];
    v10 = [(CKKeyboardContentViewController *)self view];
    [v10 bounds];
    objc_msgSend(v9, "setBounds:");

    objc_super v11 = [(CKKeyboardContentViewController *)self viewController];
    [v11 didMoveToParentViewController:self];
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CKKeyboardContentViewController;
  [(CKKeyboardContentViewController *)&v6 viewDidLayoutSubviews];
  v3 = [(CKKeyboardContentViewController *)self viewController];
  char v4 = [v3 view];
  id v5 = [(CKKeyboardContentViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKKeyboardContentViewController;
  -[CKKeyboardContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v5 = [(CKKeyboardContentViewController *)self view];
  [v5 invalidateIntrinsicContentSize];
}

- (void)setViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_viewController = &self->_viewController;
  viewController = self->_viewController;
  v13 = v5;
  if (viewController != v5)
  {
    [(UIViewController *)viewController removeFromParentViewController];
    v8 = [(UIViewController *)*p_viewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)*p_viewController didMoveToParentViewController:0];
    objc_storeStrong((id *)&self->_viewController, a3);
    if (*p_viewController)
    {
      -[CKKeyboardContentViewController addChildViewController:](self, "addChildViewController:");
      v9 = [(CKKeyboardContentViewController *)self view];
      v10 = [(UIViewController *)*p_viewController view];
      [v9 addSubview:v10];

      [(UIViewController *)*p_viewController didMoveToParentViewController:self];
      objc_super v11 = [(UIViewController *)*p_viewController view];
      objc_super v12 = [(CKKeyboardContentViewController *)self view];
      [v12 bounds];
      objc_msgSend(v11, "setFrame:");
    }
  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end