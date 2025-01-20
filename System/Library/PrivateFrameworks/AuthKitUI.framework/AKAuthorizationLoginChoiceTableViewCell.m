@interface AKAuthorizationLoginChoiceTableViewCell
- (AKAuthorizationLoginChoice)loginChoice;
- (AKAuthorizationLoginChoiceTableViewCell)initWithLoginChoice:(id)a3 reuseIdentifier:(id)a4;
- (UIImage)iconImage;
- (UIImageView)sharedIconImageView;
- (void)_setupContent;
- (void)_setupSharedIconImageView;
- (void)_setupSubViewLayout;
- (void)_setupSubViews;
- (void)layoutSubviews;
- (void)setIconImage:(id)a3;
- (void)setLoginChoice:(id)a3;
- (void)setSharedIconImageView:(id)a3;
@end

@implementation AKAuthorizationLoginChoiceTableViewCell

- (AKAuthorizationLoginChoiceTableViewCell)initWithLoginChoice:(id)a3 reuseIdentifier:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationLoginChoiceTableViewCell;
  v7 = [(AKAuthorizationScopeDetailTableViewCell *)&v10 initWithStyle:2 reuseIdentifier:a4];
  v8 = v7;
  if (v7)
  {
    [(AKAuthorizationLoginChoiceTableViewCell *)v7 setLoginChoice:v6];
    [(AKAuthorizationLoginChoiceTableViewCell *)v8 _setupSubViews];
  }

  return v8;
}

- (void)_setupSubViews
{
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  v4 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  [v4 setBackgroundColor:v3];

  [(AKAuthorizationLoginChoiceTableViewCell *)self _setupSharedIconImageView];

  [(AKAuthorizationLoginChoiceTableViewCell *)self _setupSubViewLayout];
}

- (void)_setupSharedIconImageView
{
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
  sharedIconImageView = self->_sharedIconImageView;
  self->_sharedIconImageView = v3;

  v5 = +[AKAuthorizationAppearance sharedAccountIconBackgroundColor];
  [(UIImageView *)self->_sharedIconImageView setBackgroundColor:v5];

  id v6 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UIImageView *)self->_sharedIconImageView setTintColor:v6];

  [(UIImageView *)self->_sharedIconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_sharedIconImageView setContentMode:4];
  id v7 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v8 = [v7 CGColor];
  v9 = [(UIImageView *)self->_sharedIconImageView layer];
  [v9 setBorderColor:v8];

  objc_super v10 = [(UIImageView *)self->_sharedIconImageView layer];
  [v10 setBorderWidth:1.0];

  id v13 = [MEMORY[0x1E4F42A98] configurationWithPointSize:9.0];
  v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.2.fill" withConfiguration:v13];
  [(UIImageView *)self->_sharedIconImageView setImage:v11];

  [(UIImageView *)self->_sharedIconImageView setHidden:1];
  v12 = [(AKAuthorizationLoginChoiceTableViewCell *)self contentView];
  [v12 addSubview:self->_sharedIconImageView];
}

- (void)_setupSubViewLayout
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v17 = [(UIImageView *)self->_sharedIconImageView centerXAnchor];
  v18 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  v16 = [v18 trailingAnchor];
  +[AKAuthorizationSubPaneMetrics sharedAccountIconPadding];
  v15 = [v17 constraintEqualToAnchor:v16 constant:-v4];
  v19[0] = v15;
  v5 = [(UIImageView *)self->_sharedIconImageView centerYAnchor];
  id v6 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  id v7 = [v6 bottomAnchor];
  +[AKAuthorizationSubPaneMetrics sharedAccountIconPadding];
  v9 = [v5 constraintEqualToAnchor:v7 constant:-v8];
  v19[1] = v9;
  objc_super v10 = [(UIImageView *)self->_sharedIconImageView heightAnchor];
  +[AKAuthorizationSubPaneMetrics sharedAccountIconSize];
  v11 = objc_msgSend(v10, "constraintEqualToConstant:");
  v19[2] = v11;
  v12 = [(UIImageView *)self->_sharedIconImageView widthAnchor];
  +[AKAuthorizationSubPaneMetrics sharedAccountIconSize];
  id v13 = objc_msgSend(v12, "constraintEqualToConstant:");
  v19[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v3 addObjectsFromArray:v14];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationLoginChoiceTableViewCell;
  [(AKAuthorizationScopeDetailTableViewCell *)&v11 layoutSubviews];
  v3 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  [v3 bounds];
  CGFloat v4 = CGRectGetHeight(v12) * 0.5;
  v5 = [(AKAuthorizationScopeDetailTableViewCell *)self scopeImageView];
  id v6 = [v5 layer];
  [v6 setCornerRadius:v4];

  id v7 = [(AKAuthorizationLoginChoiceTableViewCell *)self sharedIconImageView];
  [v7 bounds];
  CGFloat v8 = CGRectGetHeight(v13) * 0.5;
  v9 = [(AKAuthorizationLoginChoiceTableViewCell *)self sharedIconImageView];
  objc_super v10 = [v9 layer];
  [v10 setCornerRadius:v8];
}

- (void)setLoginChoice:(id)a3
{
  CGFloat v4 = (AKAuthorizationLoginChoice *)[a3 copy];
  loginChoice = self->_loginChoice;
  self->_loginChoice = v4;

  [(AKAuthorizationLoginChoiceTableViewCell *)self _setupContent];
}

- (UIImage)iconImage
{
  v2 = [(AKAuthorizationLoginChoiceTableViewCell *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setIconImage:(id)a3
{
  id v7 = a3;
  CGFloat v4 = [(AKAuthorizationLoginChoiceTableViewCell *)self loginChoice];
  char v5 = [v4 isAppleIDAuthorization];

  if ((v5 & 1) == 0)
  {
    id v6 = [(AKAuthorizationLoginChoiceTableViewCell *)self imageView];
    [v6 setImage:v7];
  }
}

- (void)_setupContent
{
  v3 = [(AKAuthorizationScopeDetailTableViewCell *)self mainLabel];
  CGFloat v4 = [(AKAuthorizationLoginChoiceTableViewCell *)self loginChoice];
  char v5 = [v4 user];
  [v3 setText:v5];

  [(AKAuthorizationLoginChoiceTableViewCell *)self setAccessoryType:0];
  id v6 = [(AKAuthorizationLoginChoiceTableViewCell *)self loginChoice];
  LODWORD(v4) = [v6 shouldCreateAppleID];

  if (v4)
  {
    id v7 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
    CGFloat v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = v8;
    objc_super v10 = @"AUTHORIZE_CREATE_ACCOUNT_LOGIN_CHOICE_SUBTITLE";
  }
  else
  {
    objc_super v11 = [(AKAuthorizationLoginChoiceTableViewCell *)self loginChoice];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v7 = [(AKAuthorizationScopeDetailTableViewCell *)self mainDetailLabel];
    CGFloat v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v9 = v8;
    if (isKindOfClass) {
      objc_super v10 = @"AUTHORIZE_SHARED_ACCOUNT_LOGIN_CHOICE_SUBTITLE";
    }
    else {
      objc_super v10 = @"AUTHORIZE_EXISTING_ACCOUNT_LOGIN_CHOICE_SUBTITLE";
    }
  }
  CGRect v13 = [v8 localizedStringForKey:v10 value:&stru_1F1EE8138 table:@"Localizable"];
  [v7 setText:v13];

  +[AKAuthorizationPaneMetrics cellIconSize];
  v14 = +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", @"blackLogo");
  v15 = [v14 automaskedImage];
  [(AKAuthorizationScopeDetailTableViewCell *)self setScopeImage:v15];

  [(AKAuthorizationScopeDetailTableViewCell *)self _setSeparatorIndentToMainLabel];
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (UIImageView)sharedIconImageView
{
  return self->_sharedIconImageView;
}

- (void)setSharedIconImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedIconImageView, 0);

  objc_storeStrong((id *)&self->_loginChoice, 0);
}

@end