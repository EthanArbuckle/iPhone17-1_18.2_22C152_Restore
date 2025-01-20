@interface IAMModalWebMessageViewController
- (BOOL)shouldDisplayCloseButton;
- (IAMModalWebMessageViewController)initWithWebView:(id)a3;
- (IAMViewControllerMetricsDelegate)metricsDelegate;
- (IAMWebView)webView;
- (UIButton)closeButton;
- (void)_handleCloseButtonTap:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setMetricsDelegate:(id)a3;
- (void)setShouldDisplayCloseButton:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)viewDidLoad;
@end

@implementation IAMModalWebMessageViewController

- (IAMModalWebMessageViewController)initWithWebView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IAMModalWebMessageViewController;
  v6 = [(IAMModalWebMessageViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webView, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)IAMModalWebMessageViewController;
  [(IAMModalWebMessageViewController *)&v5 viewDidLoad];
  v3 = [(IAMModalWebMessageViewController *)self view];
  [v3 bounds];
  -[IAMWebView setFrame:](self->_webView, "setFrame:");

  [(IAMWebView *)self->_webView setAutoresizingMask:18];
  v4 = [(IAMModalWebMessageViewController *)self view];
  [v4 addSubview:self->_webView];
}

- (UIButton)closeButton
{
  closeButton = self->_closeButton;
  if (!closeButton)
  {
    v4 = [MEMORY[0x263F1C488] buttonWithType:7];
    [(UIButton *)v4 addTarget:self action:sel__handleCloseButtonTap_ forControlEvents:64];
    objc_super v5 = self->_closeButton;
    self->_closeButton = v4;

    closeButton = self->_closeButton;
  }

  return closeButton;
}

- (void)setShouldDisplayCloseButton:(BOOL)a3
{
  v27[2] = *MEMORY[0x263EF8340];
  if (self->_shouldDisplayCloseButton != a3)
  {
    self->_shouldDisplayCloseButton = a3;
    if (a3)
    {
      v4 = [(IAMModalWebMessageViewController *)self view];
      objc_super v5 = [(IAMModalWebMessageViewController *)self closeButton];
      [v4 addSubview:v5];

      v6 = [(IAMModalWebMessageViewController *)self closeButton];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

      v7 = (void *)MEMORY[0x263F08938];
      v25 = [(IAMModalWebMessageViewController *)self closeButton];
      v8 = [v25 topAnchor];
      objc_super v9 = [(IAMModalWebMessageViewController *)self view];
      v10 = [v9 topAnchor];
      v24 = v8;
      v11 = [v8 constraintEqualToAnchor:v10 constant:16.0];
      v26[0] = v11;
      v12 = [(IAMModalWebMessageViewController *)self closeButton];
      v13 = [v12 rightAnchor];
      v14 = [(IAMModalWebMessageViewController *)self view];
      v15 = [v14 rightAnchor];
      v16 = [v13 constraintEqualToAnchor:v15 constant:-16.0];
      v26[1] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
      [v7 activateConstraints:v17];
    }
    else
    {
      v18 = [(IAMModalWebMessageViewController *)self closeButton];
      v19 = [(IAMModalWebMessageViewController *)self view];
      int v20 = [v18 isDescendantOfView:v19];

      if (!v20) {
        return;
      }
      v21 = [(IAMModalWebMessageViewController *)self closeButton];
      [v21 removeFromSuperview];

      v22 = (void *)MEMORY[0x263F08938];
      v25 = [(IAMModalWebMessageViewController *)self closeButton];
      v23 = [v25 topAnchor];
      objc_super v9 = [(IAMModalWebMessageViewController *)self view];
      v10 = [v9 topAnchor];
      v24 = v23;
      v11 = [v23 constraintEqualToAnchor:v10 constant:16.0];
      v27[0] = v11;
      v12 = [(IAMModalWebMessageViewController *)self closeButton];
      v13 = [v12 rightAnchor];
      v14 = [(IAMModalWebMessageViewController *)self view];
      v15 = [v14 rightAnchor];
      v16 = [v13 constraintEqualToAnchor:v15 constant:-16.0];
      v27[1] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];
      [v22 deactivateConstraints:v17];
    }
  }
}

- (void)_handleCloseButtonTap:(id)a3
{
  v4 = [(IAMModalWebMessageViewController *)self metricsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(IAMModalWebMessageViewController *)self metricsDelegate];
    [v6 viewController:self didReportDismissalAction:0];
  }

  [(IAMModalWebMessageViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (IAMViewControllerMetricsDelegate)metricsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metricsDelegate);

  return (IAMViewControllerMetricsDelegate *)WeakRetained;
}

- (void)setMetricsDelegate:(id)a3
{
}

- (BOOL)shouldDisplayCloseButton
{
  return self->_shouldDisplayCloseButton;
}

- (void)setCloseButton:(id)a3
{
}

- (IAMWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);

  objc_destroyWeak((id *)&self->_metricsDelegate);
}

@end