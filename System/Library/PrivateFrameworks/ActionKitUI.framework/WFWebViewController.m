@interface WFWebViewController
- (WFWebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (WFWebViewController)initWithWebView:(id)a3;
- (WFWebViewControllerDelegate)delegate;
- (WKWebView)webView;
- (void)cancel;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)done;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDelegate:(id)a3;
- (void)setWebView:(id)a3;
- (void)updateNavigationItems;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation WFWebViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setWebView:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (WFWebViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWebViewControllerDelegate *)WeakRetained;
}

- (void)done
{
  v3 = [(WFWebViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFWebViewController *)self delegate];
    [v5 webViewControllerDidFinish:self];
  }
}

- (void)cancel
{
  v3 = [(WFWebViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFWebViewController *)self delegate];
    [v5 webViewControllerDidCancel:self];
  }
}

- (void)loadView
{
  v28[4] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)WFWebViewController;
  [(WFWebViewController *)&v27 loadView];
  v3 = [(WFWebViewController *)self webView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v4 = [(WFWebViewController *)self view];
  [v4 addSubview:v3];

  v26 = objc_opt_new();
  [v26 configureWithOpaqueBackground];
  id v5 = [(WFWebViewController *)self navigationController];
  v6 = [v5 navigationBar];
  [v6 setScrollEdgeAppearance:v26];

  v17 = (void *)MEMORY[0x263F08938];
  v24 = [v3 topAnchor];
  v25 = [(WFWebViewController *)self view];
  v23 = [v25 safeAreaLayoutGuide];
  v22 = [v23 topAnchor];
  v21 = [v24 constraintEqualToAnchor:v22];
  v28[0] = v21;
  v19 = [v3 bottomAnchor];
  v20 = [(WFWebViewController *)self view];
  v18 = [v20 bottomAnchor];
  v16 = [v19 constraintEqualToAnchor:v18];
  v28[1] = v16;
  v7 = [v3 leadingAnchor];
  v8 = [(WFWebViewController *)self view];
  v9 = [v8 leadingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v28[2] = v10;
  v11 = [v3 trailingAnchor];
  v12 = [(WFWebViewController *)self view];
  v13 = [v12 trailingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v28[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
  [v17 activateConstraints:v15];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFWebViewControllerTitleContext == a6)
  {
    id v8 = [(WFWebViewController *)self webView];
    v7 = [v8 title];
    [(WFWebViewController *)self setTitle:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFWebViewController;
    -[WFWebViewController observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateNavigationItems
{
  v3 = [(WFWebViewController *)self navigationController];
  char v4 = [v3 viewControllers];
  id v5 = [v4 firstObject];
  int v6 = [v5 isEqual:self];

  if (!v6)
  {
    v16 = [(WFWebViewController *)self navigationItem];
    [v16 setLeftBarButtonItem:0];

    id v17 = [(WFWebViewController *)self navigationItem];
    [v17 setRightBarButtonItem:0];
    goto LABEL_7;
  }
  v7 = [(WFWebViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    v10 = [(WFWebViewController *)self navigationItem];
    [v10 setLeftBarButtonItem:v9];
  }
  v11 = [(WFWebViewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_done];
    v14 = [(WFWebViewController *)self navigationItem];
    [v14 setRightBarButtonItem:v13];

    id v17 = [(WFWebViewController *)self navigationItem];
    v15 = [v17 rightBarButtonItem];
    [v15 setStyle:2];

LABEL_7:
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFWebViewController;
  [(WFWebViewController *)&v4 didMoveToParentViewController:a3];
  [(WFWebViewController *)self updateNavigationItems];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(WFWebViewController *)self updateNavigationItems];
}

- (void)dealloc
{
  [(WFWebViewController *)self removeObserver:self forKeyPath:@"webView.title" context:WFWebViewControllerTitleContext];
  v3.receiver = self;
  v3.super_class = (Class)WFWebViewController;
  [(WFWebViewController *)&v3 dealloc];
}

- (WFWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WFWebViewController;
  objc_super v4 = [(WFWebViewController *)&v7 initWithNibName:a3 bundle:a4];
  id v5 = v4;
  if (v4)
  {
    [(WFWebViewController *)v4 updateNavigationItems];
    [(WFWebViewController *)v5 addObserver:v5 forKeyPath:@"webView.title" options:0 context:WFWebViewControllerTitleContext];
  }
  return v5;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v6 = a5;
  if (objc_msgSend(a4, "_wk_shouldAskAboutInsecureFormSubmission"))
  {
    objc_super v7 = [MEMORY[0x263F336E8] alertWithPreferredStyle:0];
    char v8 = WFLocalizedString(@"This is a non-secure form.");
    [v7 setTitle:v8];

    objc_super v9 = WFLocalizedString(@"This form will be sent in a way that is not secure. Are you sure you want to send it?");
    [v7 setMessage:v9];

    v10 = [MEMORY[0x263F85308] imageNamed:@"Privacy" inBundle:0];
    [v7 setIcon:v10];

    v11 = (void *)MEMORY[0x263F336F0];
    char v12 = WFLocalizedString(@"Submit");
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke;
    v23[3] = &unk_264900A58;
    id v13 = v6;
    id v24 = v13;
    v14 = [v11 buttonWithTitle:v12 style:0 handler:v23];
    [v7 addButton:v14];

    v15 = (void *)MEMORY[0x263F336F0];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
    v21 = &unk_264900A58;
    id v22 = v13;
    v16 = [v15 cancelButtonWithHandler:&v18];
    objc_msgSend(v7, "addButton:", v16, v18, v19, v20, v21);

    id v17 = WFUserInterfaceFromViewController();
    [v17 presentAlert:v7];
  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79__WFWebViewController_webView_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFWebViewController)initWithWebView:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWebViewController *)self initWithNibName:0 bundle:0];
  id v6 = v5;
  if (v5)
  {
    [(WFWebViewController *)v5 setWebView:v4];
    objc_super v7 = [(WFWebViewController *)v6 webView];
    [v7 setNavigationDelegate:v6];
  }
  return v6;
}

@end