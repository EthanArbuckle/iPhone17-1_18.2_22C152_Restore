@interface CNPRUISPosterEditingViewController
- (BOOL)prefersStatusBarHidden;
- (BOOL)showsContentWhenReady;
- (CNPRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4;
- (CNPRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5;
- (CNPRUISPosterEditingViewControllerDelegate)delegate;
- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4;
- (void)editingViewControllerDidFinishShowingContent:(id)a3;
- (void)presentationDidFinishAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsContentWhenReady:(BOOL)a3;
@end

@implementation CNPRUISPosterEditingViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_wrappedPosterEditingViewController, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CNPRUISPosterEditingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPRUISPosterEditingViewControllerDelegate *)WeakRetained;
}

- (void)editingViewControllerDidFinishShowingContent:(id)a3
{
  v4 = [(CNPRUISPosterEditingViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CNPRUISPosterEditingViewController *)self delegate];
    [v6 editingViewControllerDidFinishShowingContent:self];
  }
}

- (void)editingViewController:(id)a3 didFinishWithConfiguration:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    char v5 = [[CNPRSPosterConfiguration alloc] initWithPosterConfiguration:v7];
    id v6 = [(CNPRUISPosterEditingViewController *)self delegate];
    [v6 editingViewController:self didFinishWithConfiguration:v5];
  }
  else
  {
    char v5 = [(CNPRUISPosterEditingViewController *)self delegate];
    [(CNPRSPosterConfiguration *)v5 editingViewController:self didFinishWithConfiguration:0];
  }
}

- (void)presentationDidFinishAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    wrappedPosterEditingViewController = self->_wrappedPosterEditingViewController;
    [(PRUISPosterEditingViewController *)wrappedPosterEditingViewController presentationDidFinishAnimated:v3];
  }
}

- (BOOL)showsContentWhenReady
{
  return [(PRUISPosterEditingViewController *)self->_wrappedPosterEditingViewController showsContentWhenReady];
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
}

- (CNPRUISPosterEditingViewController)initWithExistingConfiguration:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNPRUISPosterEditingViewController;
  v8 = [(CNPRUISPosterEditingViewController *)&v17 init];
  if (v8)
  {
    id v9 = objc_alloc((Class)getPRUISPosterEditingViewControllerClass[0]());
    v10 = [v6 wrappedPosterConfiguration];
    v11 = [v7 wrappedIncomingCallPosterContext];
    uint64_t v12 = [v9 initWithExistingConfiguration:v10 context:v11];
    wrappedPosterEditingViewController = v8->_wrappedPosterEditingViewController;
    v8->_wrappedPosterEditingViewController = (PRUISPosterEditingViewController *)v12;

    [(PRUISPosterEditingViewController *)v8->_wrappedPosterEditingViewController setDelegate:v8];
    [(CNPRUISPosterEditingViewController *)v8 addChildViewController:v8->_wrappedPosterEditingViewController];
    v14 = [(CNPRUISPosterEditingViewController *)v8 view];
    v15 = [(PRUISPosterEditingViewController *)v8->_wrappedPosterEditingViewController view];
    [v14 addSubview:v15];

    [(PRUISPosterEditingViewController *)v8->_wrappedPosterEditingViewController didMoveToParentViewController:v8];
  }

  return v8;
}

- (CNPRUISPosterEditingViewController)initWithExtensionIdentifier:(id)a3 configuration:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNPRUISPosterEditingViewController;
  v11 = [(CNPRUISPosterEditingViewController *)&v20 init];
  if (v11)
  {
    id v12 = objc_alloc((Class)getPRUISPosterEditingViewControllerClass[0]());
    v13 = [v9 wrappedMutablePosterConfiguration];
    v14 = [v10 wrappedIncomingCallPosterContext];
    uint64_t v15 = [v12 initWithExtensionIdentifier:v8 configuration:v13 context:v14];
    wrappedPosterEditingViewController = v11->_wrappedPosterEditingViewController;
    v11->_wrappedPosterEditingViewController = (PRUISPosterEditingViewController *)v15;

    [(PRUISPosterEditingViewController *)v11->_wrappedPosterEditingViewController setDelegate:v11];
    [(CNPRUISPosterEditingViewController *)v11 addChildViewController:v11->_wrappedPosterEditingViewController];
    objc_super v17 = [(CNPRUISPosterEditingViewController *)v11 view];
    v18 = [(PRUISPosterEditingViewController *)v11->_wrappedPosterEditingViewController view];
    [v17 addSubview:v18];

    [(PRUISPosterEditingViewController *)v11->_wrappedPosterEditingViewController didMoveToParentViewController:v11];
  }

  return v11;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

@end