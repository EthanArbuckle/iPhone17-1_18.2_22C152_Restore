@interface ILClassificationExtensionShellViewController
- (BOOL)enableFinishOption;
- (ILClassificationExtensionShellViewControllerDelegate)delegate;
- (UIBarButtonItem)doneButton;
- (UIViewController)extensionViewController;
- (void)displayExtensionViewController:(id)a3 forExtension:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEnableFinishOption:(BOOL)a3;
- (void)setExtensionViewController:(id)a3;
- (void)userDidCancel;
- (void)userDidFinish;
- (void)viewDidLoad;
@end

@implementation ILClassificationExtensionShellViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)ILClassificationExtensionShellViewController;
  [(ILClassificationExtensionShellViewController *)&v9 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_userDidFinish];
  [(ILClassificationExtensionShellViewController *)self setDoneButton:v3];

  v4 = [(ILClassificationExtensionShellViewController *)self doneButton];
  [v4 setEnabled:0];

  v5 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_userDidCancel];
  v6 = [(ILClassificationExtensionShellViewController *)self doneButton];
  v7 = [(ILClassificationExtensionShellViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  v8 = [(ILClassificationExtensionShellViewController *)self navigationItem];
  [v8 setLeftBarButtonItem:v5];
}

- (void)setEnableFinishOption:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ILClassificationExtensionShellViewController *)self doneButton];
  [v4 setEnabled:v3];
}

- (void)displayExtensionViewController:(id)a3 forExtension:(id)a4
{
  id v6 = a4;
  id v22 = a3;
  [(ILClassificationExtensionShellViewController *)self setExtensionViewController:v22];
  v7 = [v6 _plugIn];

  v8 = [v7 localizedContainingName];
  objc_super v9 = [(ILClassificationExtensionShellViewController *)self navigationItem];
  [v9 setTitle:v8];

  [(ILClassificationExtensionShellViewController *)self addChildViewController:v22];
  v10 = [(ILClassificationExtensionShellViewController *)self view];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [v22 view];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  v20 = [(ILClassificationExtensionShellViewController *)self view];
  v21 = [v22 view];
  [v20 addSubview:v21];

  [v22 didMoveToParentViewController:self];
}

- (void)userDidFinish
{
  id v3 = [(ILClassificationExtensionShellViewController *)self delegate];
  [v3 userDidFinishForExtensionShellViewController:self];
}

- (void)userDidCancel
{
  id v3 = [(ILClassificationExtensionShellViewController *)self delegate];
  [v3 userDidCancelForExtensionShellViewController:self];
}

- (ILClassificationExtensionShellViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ILClassificationExtensionShellViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enableFinishOption
{
  return self->_enableFinishOption;
}

- (UIViewController)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end