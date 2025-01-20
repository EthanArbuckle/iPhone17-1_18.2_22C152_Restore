@interface AKAuthorizationSubPane
- (AKAuthorizationSubPane)initWithView:(id)a3;
- (AKAuthorizationSubPane)initWithViewController:(id)a3;
- (UIView)internalView;
- (UIView)view;
- (UIViewController)viewController;
- (double)internalCustomSpacingAfter;
- (void)addToStackView:(id)a3 context:(id)a4;
- (void)setCustomSpacingAfter:(double)a3;
- (void)setInternalCustomSpacingAfter:(double)a3;
@end

@implementation AKAuthorizationSubPane

- (AKAuthorizationSubPane)initWithViewController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSubPane;
  v6 = [(AKAuthorizationSubPane *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (AKAuthorizationSubPane)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationSubPane;
  v6 = [(AKAuthorizationSubPane *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalView, a3);
  }

  return v7;
}

- (UIView)view
{
  v3 = [(AKAuthorizationSubPane *)self viewController];
  if (v3)
  {
    v4 = [(AKAuthorizationSubPane *)self viewController];
    id v5 = [v4 view];
  }
  else
  {
    id v5 = [(AKAuthorizationSubPane *)self internalView];
  }

  return (UIView *)v5;
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  v7 = [(AKAuthorizationSubPane *)self viewController];

  if (v7)
  {
    v8 = [v12 paneViewController];
    objc_super v9 = [(AKAuthorizationSubPane *)self viewController];
    [v8 addChildViewController:v9];

    v10 = [(AKAuthorizationSubPane *)self view];
    [v6 addArrangedSubview:v10];

    v11 = [(AKAuthorizationSubPane *)self viewController];
    id v6 = [v12 paneViewController];
    [v11 didMoveToParentViewController:v6];
  }
  else
  {
    v11 = [(AKAuthorizationSubPane *)self view];
    [v6 addArrangedSubview:v11];
  }
}

- (void)setCustomSpacingAfter:(double)a3
{
  -[AKAuthorizationSubPane setInternalCustomSpacingAfter:](self, "setInternalCustomSpacingAfter:");
  id v5 = [(AKAuthorizationSubPane *)self view];
  id v6 = [v5 superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(AKAuthorizationSubPane *)self view];
    v8 = [v10 superview];
    objc_super v9 = [(AKAuthorizationSubPane *)self view];
    [v8 setCustomSpacing:v9 afterView:a3];
  }
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (UIView)internalView
{
  return self->_internalView;
}

- (double)internalCustomSpacingAfter
{
  return self->_internalCustomSpacingAfter;
}

- (void)setInternalCustomSpacingAfter:(double)a3
{
  self->_internalCustomSpacingAfter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalView, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end