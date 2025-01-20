@interface CLPrivacyLinkDisplayView
- (CLPrivacyLinkDisplayView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (id)backgroundColor;
@end

@implementation CLPrivacyLinkDisplayView

- (CLPrivacyLinkDisplayView)initWithSpecifier:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CLPrivacyLinkDisplayView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v6 = a3;
  v7 = -[CLPrivacyLinkDisplayView initWithFrame:](&v29, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  uint64_t v8 = CLFPrivacyLinkBundleIdentifier;
  v9 = [v6 propertyForKey:CLFPrivacyLinkBundleIdentifier];
  uint64_t v10 = +[OBPrivacyLinkController linkWithBundleIdentifier:v9];
  privacyController = v7->_privacyController;
  v7->_privacyController = (OBPrivacyLinkController *)v10;

  uint64_t v12 = [(OBPrivacyLinkController *)v7->_privacyController view];
  privacyView = v7->_privacyView;
  v7->_privacyView = (UIView *)v12;

  [(UIView *)v7->_privacyView setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [v6 propertyForKey:v8];
  v15 = +[OBPrivacyLinkController linkWithBundleIdentifier:v14];

  v28 = v15;
  uint64_t v16 = [v15 view];
  heightEstimationView = v7->_heightEstimationView;
  v7->_heightEstimationView = (UIView *)v16;

  [(UIView *)v7->_heightEstimationView setTranslatesAutoresizingMaskIntoConstraints:1];
  [(CLPrivacyLinkDisplayView *)v7 addSubview:v7->_privacyView];
  v18 = [v6 propertyForKey:CLFPrivacyCallbackIdentifier];

  if (v18) {
    ((void (**)(void, OBPrivacyLinkController *))v18)[2](v18, v7->_privacyController);
  }
  v19 = [(UIView *)v7->_privacyView widthAnchor];
  v20 = [(CLPrivacyLinkDisplayView *)v7 widthAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 multiplier:0.9];
  v30[0] = v21;
  v22 = [(UIView *)v7->_privacyView centerXAnchor];
  v23 = [(CLPrivacyLinkDisplayView *)v7 centerXAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v30[1] = v24;
  v25 = +[NSArray arrayWithObjects:v30 count:2];
  +[NSLayoutConstraint activateConstraints:v25];

  v26 = +[UIColor clearColor];
  [(CLPrivacyLinkDisplayView *)v7 setBackgroundColor:v26];

  return v7;
}

- (id)backgroundColor
{
  return +[UIColor clearColor];
}

- (double)preferredHeightForWidth:(double)a3
{
  -[UIView setFrame:](self->_heightEstimationView, "setFrame:", 0.0, 0.0, a3 * 0.9, 0.0);
  [(UIView *)self->_heightEstimationView setNeedsLayout];
  [(UIView *)self->_heightEstimationView layoutIfNeeded];
  LODWORD(v5) = 1148846080;
  LODWORD(v6) = 1112014848;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_heightEstimationView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v5, v6);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightEstimationView, 0);
  objc_storeStrong((id *)&self->_privacyView, 0);

  objc_storeStrong((id *)&self->_privacyController, 0);
}

@end