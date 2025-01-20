@interface AKAuthorizationNavigationController
- (void)_updateStyleIfNeeded;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation AKAuthorizationNavigationController

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)AKAuthorizationNavigationController;
  [(AKAuthorizationNavigationController *)&v15 viewDidLoad];
  [(AKAuthorizationNavigationController *)self _setBuiltinTransitionStyle:1];
  id v3 = objc_alloc_init(MEMORY[0x1E4F42A80]);
  v4 = [(AKAuthorizationNavigationController *)self navigationBar];
  [v4 setBackgroundImage:v3 forBarMetrics:0];

  v5 = [(AKAuthorizationNavigationController *)self navigationBar];
  [v5 setTranslucent:1];

  [(AKAuthorizationNavigationController *)self _updateStyleIfNeeded];
  v6 = [MEMORY[0x1E4F428B8] clearColor];
  v7 = [(AKAuthorizationNavigationController *)self view];
  [v7 setBackgroundColor:v6];

  v8 = [MEMORY[0x1E4F4F020] sharedManager];
  LODWORD(v7) = [v8 isLisbonAvailable];

  if (v7)
  {
    +[AKAuthorizationPaneMetrics paneCornerRadius];
    double v10 = v9;
    v11 = [(AKAuthorizationNavigationController *)self view];
    v12 = [v11 layer];
    [v12 setCornerRadius:v10];

    v13 = [(AKAuthorizationNavigationController *)self view];
    v14 = [v13 layer];
    [v14 setMaskedCorners:3];

    +[AKAuthorizationPaneMetrics paneAdditionSafeAreaInsets];
    -[AKAuthorizationNavigationController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationNavigationController;
  [(AKAuthorizationNavigationController *)&v4 traitCollectionDidChange:a3];
  [(AKAuthorizationNavigationController *)self _updateStyleIfNeeded];
}

- (void)_updateStyleIfNeeded
{
  id v3 = [(AKAuthorizationNavigationController *)self traitCollection];
  int64_t v4 = [v3 userInterfaceStyle];

  if (v4 != self->_currentStyle)
  {
    self->_currentStyle = v4;
    [(_UIBackdropView *)self->_backdropView removeFromSuperview];
    v5 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v5 isLisbonAvailable]) {
      uint64_t v6 = 2020;
    }
    else {
      uint64_t v6 = 2010;
    }

    if (v4 == 2) {
      uint64_t v7 = 2030;
    }
    else {
      uint64_t v7 = v6;
    }
    id v15 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v7];
    v8 = +[AKAuthorizationAppearance paneBackgroundColor];
    [v15 setColorTint:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F430A8]);
    double v10 = (_UIBackdropView *)objc_msgSend(v9, "initWithFrame:settings:", v15, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    backdropView = self->_backdropView;
    self->_backdropView = v10;

    v12 = self->_backdropView;
    v13 = [(AKAuthorizationNavigationController *)self view];
    [v13 bounds];
    -[_UIBackdropView setFrame:](v12, "setFrame:");

    v14 = [(AKAuthorizationNavigationController *)self view];
    [v14 insertSubview:self->_backdropView atIndex:0];
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 != 1)
  {
    -[AKAuthorizationNavigationController setPreferredContentSize:](self, "setPreferredContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v7.receiver = self;
    v7.super_class = (Class)AKAuthorizationNavigationController;
    [(AKAuthorizationNavigationController *)&v7 preferredContentSizeDidChangeForChildContentContainer:v4];
  }
}

- (void).cxx_destruct
{
}

@end