@interface CAMSemanticStyleSettingsRootController
- (BOOL)_canShowWhileLocked;
- (CAMSemanticStyleSettingsView)_settingsView;
- (id)completionBlock;
- (void)_dismiss;
- (void)loadView;
- (void)setCompletionBlock:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CAMSemanticStyleSettingsRootController

- (void)loadView
{
  v3 = objc_alloc_init(CAMSemanticStyleSettingsView);
  settingsView = self->__settingsView;
  self->__settingsView = v3;

  [(CAMSemanticStyleSettingsView *)self->__settingsView setDelegate:self];
  [(CAMSemanticStyleSettingsRootController *)self setView:self->__settingsView];
  id v5 = objc_alloc(MEMORY[0x263F824A8]);
  v6 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_SETTINGS_CANCEL", 0);
  id v8 = (id)[v5 initWithTitle:v6 style:2 target:self action:sel__dismiss];

  v7 = [(CAMSemanticStyleSettingsRootController *)self navigationItem];
  [v7 setLeftBarButtonItem:v8];
}

- (void)viewWillLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CAMSemanticStyleSettingsRootController;
  [(CAMSemanticStyleSettingsRootController *)&v9 viewWillLayoutSubviews];
  v3 = [(CAMSemanticStyleSettingsRootController *)self _settingsView];
  [v3 bounds];
  double v6 = v4 / v5;
  if (v4 / v5 > 0.5615)
  {
    v7 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_SETTINGS_TITLE", 0);
  }
  else
  {
    v7 = 0;
  }
  id v8 = [(CAMSemanticStyleSettingsRootController *)self navigationItem];
  [v8 setTitle:v7];

  if (v6 > 0.5615) {
  [v3 setShowsTitle:v6 <= 0.5615];
  }
}

- (void)_dismiss
{
  v3 = [(CAMSemanticStyleSettingsRootController *)self completionBlock];

  if (v3)
  {
    double v4 = [(CAMSemanticStyleSettingsRootController *)self completionBlock];
    v4[2]();
  }
  id v5 = [(CAMSemanticStyleSettingsRootController *)self navigationController];
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CAMSemanticStyleSettingsView)_settingsView
{
  return self->__settingsView;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->__settingsView, 0);
}

@end