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
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v4 dealloc];
}

- (void)_configureTitleHeaderView
{
  objc_super v4 = [[AKBasicLoginContentViewController alloc] initWithNibName:0 bundle:0];
  titleHeaderViewController = self->_titleHeaderViewController;
  self->_titleHeaderViewController = v4;

  BOOL v6 = [(AKSecondFactorCodeEntryContentViewController *)self piggybackingForTrustedDevice];
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 localizedStringForKey:@"VERIFICATION_HEADER_REPAIR" value:&stru_1F1EE8138 table:@"Localizable"];
    v2 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
    [v2 setTitleText:v9];

    v10 = [(AKSecondFactorCodeEntryContentViewController *)self authenticationContext];
    v11 = [v10 _message];
    v12 = v11;
    if (v11) {
      goto LABEL_16;
    }
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v2 = v13;
    v14 = @"ENTER_VERIFICATION_CODE_REPAIR";
    goto LABEL_15;
  }
  v15 = @"VERIFICATION_HEADER";
  char v16 = [@"VERIFICATION_HEADER" containsString:@"REBRAND"];
  if (v16)
  {
    int v17 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4F4F020] sharedManager];
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
  v18 = [v8 localizedStringForKey:v15 value:&stru_1F1EE8138 table:@"Localizable"];
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
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v2 = v13;
    v14 = @"ENTER_VERIFICATION_CODE";
LABEL_15:
    v12 = [v13 localizedStringForKey:v14 value:&stru_1F1EE8138 table:@"Localizable"];
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
  v3 = [AKCodeEntryView alloc];
  objc_super v4 = -[AKCodeEntryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  codeGeneratorView = self->_codeGeneratorView;
  self->_codeGeneratorView = v4;

  id v6 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v6 addSubview:self->_codeGeneratorView];
}

- (void)updateViewConstraints
{
  v40[1] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v38 updateViewConstraints];
  if (self->_activeConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v4 = (void *)MEMORY[0x1E4F28DC8];
  v5 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  id v6 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  v7 = [v4 constraintWithItem:v5 attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v7];

  v8 = (void *)MEMORY[0x1E4F28DC8];
  v9 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  v10 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  v11 = [v8 constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v10 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addObject:v11];

  v12 = (void *)MEMORY[0x1E4F28DC8];
  codeGeneratorView = self->_codeGeneratorView;
  v14 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  v15 = [v12 constraintWithItem:codeGeneratorView attribute:9 relatedBy:0 toItem:v14 attribute:9 multiplier:1.0 constant:0.0];
  [v3 addObject:v15];

  id v16 = objc_alloc_init(MEMORY[0x1E4F42688]);
  [v16 setWantsBaselineOffset:1];
  int v17 = +[AKCodeEntryView generatorFieldFont];
  v18 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController contentContainerView];
  v19 = [v18 messageText];
  uint64_t v39 = *MEMORY[0x1E4F42508];
  v40[0] = v17;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 0, v20, v16, 1.79769313e308, 1.79769313e308);

  [v16 baselineOffset];
  double v22 = v21;
  v23 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43870]];
  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = self->_codeGeneratorView;
  v26 = [(AKBasicLoginContentViewController *)self->_titleHeaderViewController view];
  [v23 scaledValueForValue:50.0];
  v28 = [v24 constraintWithItem:v25 attribute:3 relatedBy:0 toItem:v26 attribute:11 multiplier:1.0 constant:ceil(v27 - v22)];

  [v3 addObject:v28];
  [v17 descender];
  double v30 = v29;
  v31 = (void *)MEMORY[0x1E4F28DC8];
  v32 = self->_codeGeneratorView;
  v33 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v23 scaledValueForValue:-32.0];
  v35 = [v31 constraintWithItem:v32 attribute:4 relatedBy:0 toItem:v33 attribute:4 multiplier:1.0 constant:ceil(v34 - v30)];
  [v3 addObject:v35];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  v36 = (NSArray *)[v3 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v36;
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v9 loadView];
  id v3 = [(AKSecondFactorCodeEntryContentViewController *)self extensionContext];
  objc_super v4 = [v3 inputItems];
  v5 = [v4 firstObject];

  id v6 = objc_msgSend(v5, "ak_context");
  [(AKSecondFactorCodeEntryContentViewController *)self setAuthenticationContext:v6];

  v7 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AKSecondFactorCodeEntryContentViewController *)self _configureTitleHeaderView];
  [(AKSecondFactorCodeEntryContentViewController *)self _configureCodeGenView];
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__updateFontContstraints_ name:*MEMORY[0x1E4F43788] object:0];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AKSecondFactorCodeEntryContentViewController;
  [(AKSecondFactorCodeEntryContentViewController *)&v6 viewWillLayoutSubviews];
  id v3 = [(AKSecondFactorCodeEntryContentViewController *)self view];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B98], *(double *)(MEMORY[0x1E4F43B98] + 8));
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
  id v3 = [MEMORY[0x1E4F39C90] animation];
  [v3 setMass:1.20000005];
  [v3 setStiffness:1200.0];
  [v3 setDamping:12.0];
  [v3 setDuration:1.39999998];
  [v3 setVelocity:0.0];
  [v3 setFillMode:*MEMORY[0x1E4F39F98]];
  [v3 setDelegate:self];
  LODWORD(v4) = 30.0;
  id v5 = [NSNumber numberWithFloat:v4];
  [v3 setFromValue:v5];

  objc_super v6 = [NSNumber numberWithFloat:0.0];
  [v3 setToValue:v6];

  id v7 = [MEMORY[0x1E4F39D20] functionWithName:*MEMORY[0x1E4F3A600]];
  [v3 setValueFunction:v7];

  LODWORD(v8) = 1028389654;
  LODWORD(v9) = 990057071;
  LODWORD(v10) = 1059712716;
  LODWORD(v11) = 1.0;
  v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v8 :v9 :v10 :v11];
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
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Clearing Second Factor Entry Field", v4, 2u);
  }

  [(AKCodeEntryView *)self->_codeGeneratorView setStringValue:&stru_1F1EE8138];
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