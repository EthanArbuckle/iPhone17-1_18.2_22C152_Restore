@interface AKSecondFactorCodeEntryContentViewController
- (AKAppleIDAuthenticationContext)authenticationContext;
- (AKBasicLoginContentViewController)titleHeaderViewController;
- (AKCodeEntryView)codeGeneratorView;
- (BOOL)piggybackingForTrustedDevice;
- (NSArray)activeConstraints;
- (NSString)generatedCode;
- (NSString)reason;
- (void)_configureCodeGenView;
- (void)_configureTitleHeaderView;
- (void)_updateFontContstraints:(id)a3;
- (void)clearSecondFactorEntry;
- (void)dealloc;
- (void)jiggleAView;
- (void)loadView;
- (void)setActiveConstraints:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setCodeGeneratorView:(id)a3;
- (void)setPasscodeFieldDisabled:(BOOL)a3;
- (void)setPiggybackingForTrustedDevice:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setTitleHeaderViewController:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AKSecondFactorCodeEntryContentViewController

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v4 dealloc];
}

- (void)_configureTitleHeaderView
{
  objc_super v4 = [[AKBasicLoginContentViewController alloc] initWithNibName:0 bundle:0];
  titleHeaderViewController = self->_titleHeaderViewController;
  self->_titleHeaderViewController = v4;

  unsigned int v6 = [(AKSecondFactorCodeEntryContentViewController *)self piggybackingForTrustedDevice];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 localizedStringForKey:@"VERIFICATION_HEADER_REPAIR" value:&stru_100008480 table:@"Localizable"];
    v2 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
    [v2 setTitleText:v9];

    v10 = [(AKSecondFactorCodeEntryContentViewController *)self authenticationContext];
    v11 = [v10 _message];
    v12 = v11;
    if (v11) {
      goto LABEL_16;
    }
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v2 = v13;
    CFStringRef v14 = @"ENTER_VERIFICATION_CODE_REPAIR";
    goto LABEL_15;
  }
  v15 = @"VERIFICATION_HEADER";
  unsigned __int8 v16 = [@"VERIFICATION_HEADER" containsString:@"REBRAND"];
  if (v16)
  {
    int v17 = 0;
  }
  else
  {
    v2 = +[AKFeatureManager sharedManager];
    if ([v2 isAABrandingEnabled])
    {
      v15 = [@"VERIFICATION_HEADER" stringByAppendingString:@"_REBRAND"];
      int v17 = 1;
    }
    else
    {
      int v17 = 0;
    }
  }
  v18 = [v8 localizedStringForKey:v15 value:&stru_100008480 table:@"Localizable"];
  v19 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  [v19 setTitleText:v18];

  if (v17) {
  if ((v16 & 1) == 0)
  }

  v10 = [(AKSecondFactorCodeEntryContentViewController *)self authenticationContext];
  v11 = [v10 _message];
  v12 = v11;
  if (!v11)
  {
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v2 = v13;
    CFStringRef v14 = @"ENTER_VERIFICATION_CODE";
LABEL_15:
    v12 = [v13 localizedStringForKey:v14 value:&stru_100008480 table:@"Localizable"];
  }
LABEL_16:
  v20 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  [v20 setMessageText:v12];

  if (!v11)
  {
  }
  [(AKSecondFactorCodeEntryContentViewController *)self addChildViewController:self->_titleHeaderViewController];
  id v22 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v21 addSubview:v22];
}

- (void)_configureCodeGenView
{
  v3 = -[AKCodeEntryView initWithFrame:]([AKCodeEntryView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  codeGeneratorView = self->_codeGeneratorView;
  self->_codeGeneratorView = v3;

  id v5 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v5 addSubview:self->_codeGeneratorView];
}

- (void)updateViewConstraints
{
  v33.receiver = self;
  v33.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v33 updateViewConstraints];
  if (self->_activeConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  id v5 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  unsigned int v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:9 relatedBy:0 toItem:v5 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v6];

  v7 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  v8 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  v9 = +[NSLayoutConstraint constraintWithItem:v7 attribute:3 relatedBy:0 toItem:v8 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v9];

  codeGeneratorView = self->_codeGeneratorView;
  v11 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  v12 = +[NSLayoutConstraint constraintWithItem:codeGeneratorView attribute:9 relatedBy:0 toItem:v11 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v12];

  id v13 = objc_alloc_init((Class)NSStringDrawingContext);
  [v13 setWantsBaselineOffset:1];
  CFStringRef v14 = +[AKCodeEntryView generatorFieldFont];
  v15 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  unsigned __int8 v16 = [v15 messageText];
  NSAttributedStringKey v34 = NSFontAttributeName;
  v35 = v14;
  int v17 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 0, v17, v13, 1.79769313e308, 1.79769313e308);

  [v13 baselineOffset];
  double v19 = v18;
  v20 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
  v21 = self->_codeGeneratorView;
  id v22 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  [v20 scaledValueForValue:50.0];
  v24 = +[NSLayoutConstraint constraintWithItem:v21 attribute:3 relatedBy:0 toItem:v22 attribute:11 multiplier:1.0 constant:ceil(v23 - v19)];

  [v3 addObject:v24];
  [v14 descender];
  double v26 = v25;
  v27 = self->_codeGeneratorView;
  v28 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v20 scaledValueForValue:-32.0];
  v30 = +[NSLayoutConstraint constraintWithItem:v27 attribute:4 relatedBy:0 toItem:v28 attribute:4 multiplier:1.0 constant:ceil(v29 - v26)];
  [v3 addObject:v30];

  +[NSLayoutConstraint activateConstraints:v3];
  v31 = (NSArray *)[v3 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v31;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v9 loadView];
  id v3 = [(AKSecondFactorCodeEntryContentViewController *)self extensionContext];
  objc_super v4 = [v3 inputItems];
  id v5 = [v4 firstObject];

  unsigned int v6 = objc_msgSend(v5, "ak_context");
  [(AKSecondFactorCodeEntryContentViewController *)self setAuthenticationContext:v6];

  v7 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AKSecondFactorCodeEntryContentViewController *)self _configureTitleHeaderView];
  [(AKSecondFactorCodeEntryContentViewController *)self _configureCodeGenView];
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_updateFontContstraints:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v6 viewWillLayoutSubviews];
  id v3 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", UILayoutFittingExpandedSize.width, UILayoutFittingExpandedSize.height);
  double v5 = v4;

  -[AKSecondFactorCodeEntryContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", 270.0, v5);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v4 viewDidAppear:a3];
  [(AKCodeEntryView *)self->_codeGeneratorView becomeFirstResponder];
}

- (void)_updateFontContstraints:(id)a3
{
  id v3 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)setReason:(id)a3
{
  titleHeaderViewController = self->_titleHeaderViewController;
  id v5 = a3;
  objc_super v6 = [(AKBasicLoginContentViewController *)titleHeaderViewController contentContainerView];
  [v6 setMessageText:v5];

  id v7 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v7 setNeedsUpdateConstraints];
}

- (NSString)reason
{
  v2 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  id v3 = [v2 messageText];

  return (NSString *)v3;
}

- (NSString)generatedCode
{
  return [(AKCodeEntryView *)self->_codeGeneratorView stringValue];
}

- (void)jiggleAView
{
  id v13 = [(AKCodeEntryView *)self->_codeGeneratorView layer];
  id v3 = +[CASpringAnimation animation];
  [v3 setMass:1.20000005];
  [v3 setStiffness:1200.0];
  [v3 setDamping:12.0];
  [v3 setDuration:1.39999998];
  [v3 setVelocity:0.0];
  [v3 setFillMode:kCAFillModeBackwards];
  [v3 setDelegate:self];
  LODWORD(v4) = 30.0;
  id v5 = +[NSNumber numberWithFloat:v4];
  [v3 setFromValue:v5];

  objc_super v6 = +[NSNumber numberWithFloat:0.0];
  [v3 setToValue:v6];

  id v7 = +[CAValueFunction functionWithName:kCAValueFunctionTranslateX];
  [v3 setValueFunction:v7];

  LODWORD(v8) = 1028389654;
  LODWORD(v9) = 990057071;
  LODWORD(v10) = 1059712716;
  LODWORD(v11) = 1.0;
  v12 = +[CAMediaTimingFunction functionWithControlPoints:v8 :v9 :v10 :v11];
  [v3 setTimingFunction:v12];

  [v3 setKeyPath:@"transform"];
  [v13 addAnimation:v3 forKey:@"shake"];
}

- (void)clearSecondFactorEntry
{
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing Second Factor Entry Field", v4, 2u);
  }

  [(AKCodeEntryView *)self->_codeGeneratorView setStringValue:&stru_100008480];
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[AKCodeEntryView setPasscodeFieldDisabled:](self->_codeGeneratorView, "setPasscodeFieldDisabled:");
  codeGeneratorView = self->_codeGeneratorView;
  if (v3)
  {
    [(AKCodeEntryView *)codeGeneratorView resignFirstResponder];
  }
  else
  {
    [(AKCodeEntryView *)codeGeneratorView becomeFirstResponder];
  }
}

- (BOOL)piggybackingForTrustedDevice
{
  return self->_piggybackingForTrustedDevice;
}

- (void)setPiggybackingForTrustedDevice:(BOOL)a3
{
  self->_piggybackingForTrustedDevice = a3;
}

- (AKCodeEntryView)codeGeneratorView
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

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewController, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);

  objc_storeStrong((id *)&self->_codeGeneratorView, 0);
}

@end