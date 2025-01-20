@interface AKAuthorizationSubPanePrivacyLink
- (AKAuthorizationSubPanePrivacyLink)initWithPrivacyLinkType:(unint64_t)a3;
- (id)_createPrivacyLinkWithType:(unint64_t)a3;
- (void)addToConstraints:(id)a3 context:(id)a4;
- (void)addToStackView:(id)a3 context:(id)a4;
@end

@implementation AKAuthorizationSubPanePrivacyLink

- (AKAuthorizationSubPanePrivacyLink)initWithPrivacyLinkType:(unint64_t)a3
{
  v4 = [(AKAuthorizationSubPanePrivacyLink *)self _createPrivacyLinkWithType:a3];
  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationSubPanePrivacyLink;
  v5 = [(AKAuthorizationSubPane *)&v7 initWithViewController:v4];

  return v5;
}

- (void)addToStackView:(id)a3 context:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKAuthorizationSubPanePrivacyLink;
  [(AKAuthorizationSubPane *)&v4 addToStackView:a3 context:a4];
}

- (void)addToConstraints:(id)a3 context:(id)a4
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationSubPanePrivacyLink;
  id v6 = a4;
  id v7 = a3;
  [(AKAuthorizationSubPane *)&v21 addToConstraints:v7 context:v6];
  +[AKAuthorizationSubPaneMetrics privacyLinkMarginInset];
  double v9 = v8;
  v20 = [(AKAuthorizationSubPane *)self view];
  v19 = [v20 leadingAnchor];
  v10 = [v6 stackView];
  v11 = [v10 leadingAnchor];
  v12 = [v19 constraintEqualToAnchor:v11 constant:v9];
  v22[0] = v12;
  v13 = [(AKAuthorizationSubPane *)self view];
  v14 = [v13 trailingAnchor];
  v15 = [v6 stackView];

  v16 = [v15 trailingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:-v9];
  v22[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  [v7 addObjectsFromArray:v18];
}

- (id)_createPrivacyLinkWithType:(unint64_t)a3
{
  if (a3 == 1) {
    objc_super v4 = @"com.apple.onboarding.signinwithmaid";
  }
  else {
    objc_super v4 = @"com.apple.onboarding.signinwithapple";
  }
  v5 = [MEMORY[0x1E4F83AD0] linkWithBundleIdentifier:v4];
  id v6 = [v5 view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  if (a3 == 1)
  {
    [v5 setDisplayIcon:0];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F4F020] sharedManager];
    objc_msgSend(v5, "setDisplayLargeIcon:", objc_msgSend(v7, "isLisbonAvailable") ^ 1);
  }

  return v5;
}

@end