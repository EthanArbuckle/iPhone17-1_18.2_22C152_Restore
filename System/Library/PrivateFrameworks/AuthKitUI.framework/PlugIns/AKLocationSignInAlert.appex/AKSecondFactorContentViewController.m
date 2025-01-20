@interface AKSecondFactorContentViewController
+ (void)initialize;
- (AKAppleIDAuthenticationContext)authenticationContext;
- (AKBasicLoginContentViewController)titleHeaderViewController;
- (AKCodeGenerationView)codeGeneratorView;
- (UILabel)footerView;
- (double)_codeGeneratorSpacing:(double)a3;
- (void)_configureCodeGenView;
- (void)_configureFooterView;
- (void)_configureTitleHeaderView;
- (void)loadView;
- (void)setAuthenticationContext:(id)a3;
- (void)setCodeGeneratorView:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setTitleHeaderViewController:(id)a3;
@end

@implementation AKSecondFactorContentViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sub_100003864();
  }
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)AKSecondFactorContentViewController;
  [(AKSecondFactorContentViewController *)&v11 loadView];
  v3 = [(AKSecondFactorContentViewController *)self extensionContext];
  v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  v6 = objc_msgSend(v5, "ak_context");
  [(AKSecondFactorContentViewController *)self setAuthenticationContext:v6];

  id v7 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(AKSecondFactorContentViewController *)self setView:v7];
  [(AKSecondFactorContentViewController *)self _configureTitleHeaderView];
  [(AKSecondFactorContentViewController *)self _configureCodeGenView];
  [(AKSecondFactorContentViewController *)self _configureFooterView];
  v8 = [(AKSecondFactorContentViewController *)self view];
  objc_msgSend(v8, "systemLayoutSizeFittingSize:", UILayoutFittingExpandedSize.width, UILayoutFittingExpandedSize.height);
  double v10 = v9;

  -[AKSecondFactorContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v10);
}

- (void)_configureTitleHeaderView
{
  v3 = (AKBasicLoginContentViewController *)[objc_alloc((Class)sub_1000039A0()) initWithNibName:0 bundle:0];
  titleHeaderViewController = self->_titleHeaderViewController;
  self->_titleHeaderViewController = v3;

  v5 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext _message];
  v6 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  [v6 setTitleText:v5];

  id v7 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext _interpolatedReason];
  v8 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  [v8 setMessageText:v7];

  [(AKSecondFactorContentViewController *)self addChildViewController:self->_titleHeaderViewController];
  id v14 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = [(AKSecondFactorContentViewController *)self view];
  [v9 addSubview:v14];

  double v10 = [(AKSecondFactorContentViewController *)self view];
  objc_super v11 = +[NSLayoutConstraint constraintWithItem:v14 attribute:7 relatedBy:0 toItem:v10 attribute:7 multiplier:1.0 constant:0.0];
  [v11 setActive:1];

  v12 = [(AKSecondFactorContentViewController *)self view];
  v13 = +[NSLayoutConstraint constraintWithItem:v14 attribute:3 relatedBy:0 toItem:v12 attribute:3 multiplier:1.0 constant:0.0];
  [v13 setActive:1];
}

- (void)_configureCodeGenView
{
  v3 = [AKCodeGenerationView alloc];
  uint64_t v4 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext generatedCode];
  v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = @"000000";
  }
  id v7 = [(AKCodeGenerationView *)v3 initWithGeneratedCode:v6];
  codeGeneratorView = self->_codeGeneratorView;
  self->_codeGeneratorView = v7;

  double v9 = [(AKSecondFactorContentViewController *)self view];
  [v9 addSubview:self->_codeGeneratorView];

  double v10 = self->_codeGeneratorView;
  objc_super v11 = [(AKSecondFactorContentViewController *)self view];
  v12 = +[NSLayoutConstraint constraintWithItem:v10 attribute:9 relatedBy:0 toItem:v11 attribute:9 multiplier:1.0 constant:0.0];
  [v12 setActive:1];

  v13 = self->_codeGeneratorView;
  id v16 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  [(AKSecondFactorContentViewController *)self _codeGeneratorSpacing:50.0];
  v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:12 relatedBy:0 toItem:v16 attribute:11 multiplier:1.0 constant:v14];
  [v15 setActive:1];
}

- (void)_configureFooterView
{
  v3 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  footerView = self->_footerView;
  self->_footerView = v3;

  id v20 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:2];
  v5 = self->_footerView;
  CFStringRef v6 = [(AKAppleIDAuthenticationContext *)self->_authenticationContext notificationDisclaimer];
  [(UILabel *)v5 setText:v6];

  id v7 = +[UIFont fontWithDescriptor:v20 size:0.0];
  [(UILabel *)self->_footerView setFont:v7];

  [(UILabel *)self->_footerView setTextAlignment:1];
  [(UILabel *)self->_footerView setNumberOfLines:0];
  [(UILabel *)self->_footerView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v8) = 1055286886;
  [(UILabel *)self->_footerView _setHyphenationFactor:v8];
  [(UILabel *)self->_footerView setPreferredMaxLayoutWidth:238.0];
  double v9 = [(AKSecondFactorContentViewController *)self view];
  [v9 addSubview:self->_footerView];

  double v10 = self->_footerView;
  objc_super v11 = [(AKSecondFactorContentViewController *)self view];
  v12 = +[NSLayoutConstraint constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:16.0];
  [v12 setActive:1];

  v13 = self->_footerView;
  double v14 = [(AKSecondFactorContentViewController *)self view];
  v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:6 relatedBy:0 toItem:v14 attribute:6 multiplier:1.0 constant:-16.0];
  [v15 setActive:1];

  id v16 = +[NSLayoutConstraint constraintWithItem:self->_footerView attribute:3 relatedBy:0 toItem:self->_codeGeneratorView attribute:4 multiplier:1.0 constant:16.0];
  [v16 setActive:1];

  v17 = self->_footerView;
  v18 = [(AKSecondFactorContentViewController *)self view];
  v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:4 relatedBy:0 toItem:v18 attribute:4 multiplier:1.0 constant:-16.0];
  [v19 setActive:1];
}

- (double)_codeGeneratorSpacing:(double)a3
{
  uint64_t v4 = +[AKCodeGenerationView _generatorLabelFont];
  [v4 _scaledValueForValue:a3];
  v5 = +[UIScreen mainScreen];
  UIRoundToScreenScale();
  double v7 = v6;

  return v7;
}

- (AKCodeGenerationView)codeGeneratorView
{
  return self->_codeGeneratorView;
}

- (void)setCodeGeneratorView:(id)a3
{
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (AKBasicLoginContentViewController)titleHeaderViewController
{
  return self->_titleHeaderViewController;
}

- (void)setTitleHeaderViewController:(id)a3
{
}

- (UILabel)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);

  objc_storeStrong((id *)&self->_codeGeneratorView, 0);
}

@end