@interface PKPaletteTapToRadarAppExtensionExecution
- (void)_dismiss;
- (void)_updateUI;
- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3;
- (void)run;
@end

@implementation PKPaletteTapToRadarAppExtensionExecution

- (void)run
{
  v40[4] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)PKPaletteTapToRadarAppExtensionExecution;
  [(PKPaletteTapToRadarCommandExecution *)&v39 run];
  v3 = [(PKPaletteTapToRadarCommandExecution *)self configuration];
  v38 = [v3 debugSharpenerLog];

  v37 = [[PKTextInputDebugRadarViewController alloc] initWithSharpenerLog:v38];
  [(PKTextInputDebugRadarViewController *)v37 setDelegate:self];
  v4 = [(PKPaletteTapToRadarCommandExecution *)self configuration];
  v5 = [v4 presentationViewController];

  v6 = [v5 view];
  v7 = [v6 window];

  v8 = (UIViewController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v37];
  contentViewController = self->_contentViewController;
  self->_contentViewController = v8;

  [v5 addChildViewController:self->_contentViewController];
  v10 = [v5 view];
  v11 = [(UIViewController *)self->_contentViewController view];
  [v10 addSubview:v11];

  v12 = [(UIViewController *)self->_contentViewController view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(UIViewController *)self->_contentViewController view];
  v14 = [v13 widthAnchor];
  v36 = v7;
  [v7 hostedViewSize];
  objc_msgSend(v14, "constraintEqualToConstant:");
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewWidthConstraint = self->_contentViewWidthConstraint;
  self->_contentViewWidthConstraint = v15;

  v17 = [(UIViewController *)self->_contentViewController view];
  v18 = [v17 heightAnchor];
  [v7 hostedViewSize];
  v20 = [v18 constraintEqualToConstant:v19];
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v20;

  v30 = (void *)MEMORY[0x1E4F28DC8];
  v35 = [(UIViewController *)self->_contentViewController view];
  v33 = [v35 topAnchor];
  v31 = v5;
  v34 = [v5 view];
  v32 = [v34 topAnchor];
  v22 = [v33 constraintEqualToAnchor:v32];
  v40[0] = v22;
  v23 = [(UIViewController *)self->_contentViewController view];
  v24 = [v23 leftAnchor];
  v25 = [v5 view];
  v26 = [v25 leftAnchor];
  v27 = [v24 constraintEqualToAnchor:v26];
  v28 = self->_contentViewWidthConstraint;
  v40[1] = v27;
  v40[2] = v28;
  v40[3] = self->_contentViewHeightConstraint;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:4];
  [v30 activateConstraints:v29];

  [(UIViewController *)self->_contentViewController didMoveToParentViewController:v31];
}

- (void)_dismiss
{
  [(UIViewController *)self->_contentViewController willMoveToParentViewController:0];
  v3 = [(UIViewController *)self->_contentViewController view];
  [v3 removeFromSuperview];

  contentViewController = self->_contentViewController;

  [(UIViewController *)contentViewController removeFromParentViewController];
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteTapToRadarAppExtensionExecution;
  -[PKPaletteTapToRadarCommandExecution editingOverlayContainerDidChangeToSceneBounds:](&v4, sel_editingOverlayContainerDidChangeToSceneBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKPaletteTapToRadarAppExtensionExecution *)self _updateUI];
}

- (void)_updateUI
{
  v3 = [(PKPaletteTapToRadarCommandExecution *)self configuration];
  objc_super v4 = [v3 presentationViewController];
  v5 = [v4 view];
  id v7 = [v5 window];

  [v7 hostedViewSize];
  -[NSLayoutConstraint setConstant:](self->_contentViewWidthConstraint, "setConstant:");
  [v7 hostedViewSize];
  [(NSLayoutConstraint *)self->_contentViewHeightConstraint setConstant:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewWidthConstraint, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end