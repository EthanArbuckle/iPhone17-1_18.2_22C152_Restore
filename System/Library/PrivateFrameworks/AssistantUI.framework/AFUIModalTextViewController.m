@interface AFUIModalTextViewController
- (AFUIModalTextViewController)initWithTitleText:(id)a3 andBodyText:(id)a4;
- (void)donePressed;
- (void)loadView;
- (void)presentFromParentViewController:(id)a3;
@end

@implementation AFUIModalTextViewController

- (AFUIModalTextViewController)initWithTitleText:(id)a3 andBodyText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AFUIModalTextViewController;
  v8 = [(AFUIModalTextViewController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(AFUIModalTextViewController *)v8 setTitle:v6];
    objc_storeStrong((id *)&v9->_bodyText, a4);
    v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_donePressed];
    v11 = [(AFUIModalTextViewController *)v9 navigationItem];
    [v11 setRightBarButtonItem:v10];
  }
  return v9;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82D60]);
  id v5 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5 setText:self->_bodyText];
  v4 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v5 setFont:v4];

  [v5 setEditable:0];
  objc_msgSend(v5, "setTextContainerInset:", 8.0, 10.0, 8.0, 10.0);
  objc_msgSend(v5, "setContentOffset:", 0.0, -8.0);
  [(AFUIModalTextViewController *)self setView:v5];
}

- (void)presentFromParentViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:self];
  [v6 setModalPresentationStyle:6];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)donePressed
{
  id v2 = [(AFUIModalTextViewController *)self parentViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end