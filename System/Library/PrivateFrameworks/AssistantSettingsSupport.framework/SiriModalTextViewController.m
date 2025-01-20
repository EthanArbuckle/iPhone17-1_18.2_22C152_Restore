@interface SiriModalTextViewController
- (SiriModalTextViewController)initWithTitleText:(id)a3 andBodyText:(id)a4;
- (void)donePressed;
- (void)presentFromParentViewController:(id)a3;
@end

@implementation SiriModalTextViewController

- (SiriModalTextViewController)initWithTitleText:(id)a3 andBodyText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SiriModalTextViewController;
  v8 = [(SiriModalTextViewController *)&v16 init];
  v9 = v8;
  if (v8)
  {
    [(SiriModalTextViewController *)v8 setTitle:v6];
    id v10 = objc_alloc(MEMORY[0x263F82D60]);
    v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v11 setText:v7];
    v12 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v11 setFont:v12];

    [v11 setEditable:0];
    objc_msgSend(v11, "setTextContainerInset:", 8.0, 10.0, 8.0, 10.0);
    objc_msgSend(v11, "setContentOffset:", 0.0, -8.0);
    v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v9 action:sel_donePressed];
    v14 = [(SiriModalTextViewController *)v9 navigationItem];
    [v14 setRightBarButtonItem:v13];

    [(SiriModalTextViewController *)v9 setView:v11];
  }

  return v9;
}

- (void)presentFromParentViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F829B8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithRootViewController:self];
  [v6 setModalPresentationStyle:2];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (void)donePressed
{
  id v2 = [(SiriModalTextViewController *)self parentViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

@end