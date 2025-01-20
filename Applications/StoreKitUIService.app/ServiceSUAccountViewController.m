@interface ServiceSUAccountViewController
- (ServiceAccountPageEmbeddedParent)embeddedParent;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setEmbeddedParent:(id)a3;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ServiceSUAccountViewController

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ServiceSUAccountViewController;
  [(ServiceSUAccountViewController *)&v7 viewDidDisappear:a3];
  v4 = [(ServiceSUAccountViewController *)self embeddedParent];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(ServiceSUAccountViewController *)self embeddedParent];
    [v6 attemptDismissHostViewController];
  }
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(ServiceSUAccountViewController *)self embeddedParent];
  [v5 dismissHostViewController];

  v6.receiver = self;
  v6.super_class = (Class)ServiceSUAccountViewController;
  [(ServiceSUAccountViewController *)&v6 dismissAnimated:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = [(ServiceSUAccountViewController *)self embeddedParent];
  [v7 dismissHostViewController];

  v8.receiver = self;
  v8.super_class = (Class)ServiceSUAccountViewController;
  [(ServiceSUAccountViewController *)&v8 dismissViewControllerAnimated:v4 completion:v6];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
  if (!a4) {
    [(ServiceSUAccountViewController *)self dismissAnimated:1];
  }
}

- (ServiceAccountPageEmbeddedParent)embeddedParent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_embeddedParent);

  return (ServiceAccountPageEmbeddedParent *)WeakRetained;
}

- (void)setEmbeddedParent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end