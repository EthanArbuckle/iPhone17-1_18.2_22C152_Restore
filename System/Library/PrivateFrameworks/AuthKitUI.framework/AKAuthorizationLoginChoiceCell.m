@interface AKAuthorizationLoginChoiceCell
- (AKAuthorizationLoginChoice)loginChoice;
- (AKAuthorizationLoginChoiceCell)initWithLoginChoice:(id)a3 reuseIdentifier:(id)a4;
- (BOOL)_isSharedAccountLoginChoice;
- (UIImage)iconImage;
- (void)_setupContent;
- (void)_setupFormat;
- (void)layoutSubviews;
- (void)setIconImage:(id)a3;
- (void)setLoginChoice:(id)a3;
@end

@implementation AKAuthorizationLoginChoiceCell

- (AKAuthorizationLoginChoiceCell)initWithLoginChoice:(id)a3 reuseIdentifier:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationLoginChoiceCell;
  v7 = [(AKAuthorizationLoginChoiceCell *)&v10 initWithStyle:3 reuseIdentifier:a4];
  v8 = v7;
  if (v7)
  {
    [(AKAuthorizationLoginChoiceCell *)v7 _setupFormat];
    [(AKAuthorizationLoginChoiceCell *)v8 setLoginChoice:v6];
  }

  return v8;
}

- (void)setLoginChoice:(id)a3
{
  v4 = (AKAuthorizationLoginChoice *)[a3 copy];
  loginChoice = self->_loginChoice;
  self->_loginChoice = v4;

  [(AKAuthorizationLoginChoiceCell *)self _setupContent];
}

- (UIImage)iconImage
{
  v2 = [(AKAuthorizationLoginChoiceCell *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setIconImage:(id)a3
{
  id v7 = a3;
  v4 = [(AKAuthorizationLoginChoiceCell *)self loginChoice];
  char v5 = [v4 isAppleIDAuthorization];

  if ((v5 & 1) == 0)
  {
    id v6 = [(AKAuthorizationLoginChoiceCell *)self imageView];
    [v6 setImage:v7];
  }
}

- (void)_setupFormat
{
  v3 = +[AKAuthorizationAppearance scopeRowBackgroundColor];
  [(AKAuthorizationLoginChoiceCell *)self setBackgroundColor:v3];

  [(AKAuthorizationLoginChoiceCell *)self setSelectionStyle:0];
  v4 = +[AKAuthorizationAppearance scopeTitleTextColor];
  char v5 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  [v5 setTextColor:v4];

  id v6 = +[AKAuthorizationAppearance scopeTitleFont];
  id v7 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  [v7 setFont:v6];

  v8 = +[AKAuthorizationAppearance scopeSubtitleTextColor];
  v9 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
  [v9 setTextColor:v8];

  objc_super v10 = +[AKAuthorizationAppearance scopeSubtitleFont];
  v11 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
  [v11 setFont:v10];

  id v12 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
  [v12 setNumberOfLines:0];
}

- (void)_setupContent
{
  v3 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  v4 = [(AKAuthorizationLoginChoiceCell *)self loginChoice];
  char v5 = [v4 user];
  [v3 setText:v5];

  id v6 = [(AKAuthorizationLoginChoiceCell *)self loginChoice];
  LODWORD(v4) = [v6 isAppleIDAuthorization];

  if (v4)
  {
    id v7 = [(AKAuthorizationLoginChoiceCell *)self loginChoice];
    int v8 = [v7 shouldCreateAppleID];

    if (v8)
    {
      v9 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
      objc_super v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"AUTHORIZE_CREATE_ACCOUNT_LOGIN_CHOICE_SUBTITLE" value:&stru_1F1EE8138 table:@"Localizable"];
      [v9 setText:v11];

      [(AKAuthorizationLoginChoiceCell *)self setSelectionStyle:1];
      [(AKAuthorizationLoginChoiceCell *)self setAccessoryType:1];
    }
    id v18 = [(AKAuthorizationLoginChoiceCell *)self imageView];
    +[AKAuthorizationPaneMetrics iconSize];
    id v12 = +[AKIcon iconWithName:size:](AKIcon, "iconWithName:size:", @"blackLogo");
    v13 = [v12 automaskedImage];
    [v18 setImage:v13];
  }
  else
  {
    id v18 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
    v14 = NSString;
    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"PASSWORD_REQUEST_VIEW_SAVED_FROM" value:&stru_1F1EE8138 table:@"Localizable"];
    v15 = [(AKAuthorizationLoginChoiceCell *)self loginChoice];
    v16 = [v15 site];
    v17 = objc_msgSend(v14, "stringWithFormat:", v13, v16);
    [v18 setText:v17];
  }
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)AKAuthorizationLoginChoiceCell;
  [(AKAuthorizationLoginChoiceCell *)&v24 layoutSubviews];
  +[AKAuthorizationSubPaneMetrics scopeImageViewSize];
  double v4 = v3;
  +[AKAuthorizationSubPaneMetrics scopeImageViewTopSpacing];
  double v6 = v5;
  double v7 = 16.0;
  v25.origin.x = 16.0;
  v25.origin.y = v6;
  v25.size.width = v4;
  v25.size.height = v4;
  double MaxX = CGRectGetMaxX(v25);
  v9 = [(AKAuthorizationLoginChoiceCell *)self contentView];
  [v9 bounds];
  double v10 = CGRectGetMaxX(v26);

  if ([(AKAuthorizationLoginChoiceCell *)self effectiveUserInterfaceLayoutDirection] == 1)
  {
    v11 = [(AKAuthorizationLoginChoiceCell *)self contentView];
    [v11 bounds];
    double v7 = CGRectGetMaxX(v27) + -16.0 - v4;

    v28.origin.x = v7;
    v28.origin.y = v6;
    v28.size.width = v4;
    v28.size.height = v4;
    double v12 = CGRectGetMinX(v28) + -32.0;
    double v13 = 16.0;
  }
  else
  {
    double v13 = MaxX + 16.0;
    double v12 = v10 - (MaxX + 16.0) + -16.0;
  }
  v14 = [(AKAuthorizationLoginChoiceCell *)self imageView];
  objc_msgSend(v14, "setFrame:", v7, v6, v4, v4);

  v15 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  v16 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  [v16 frame];
  double MinY = CGRectGetMinY(v29);
  id v18 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  [v18 frame];
  objc_msgSend(v15, "setFrame:", v13, MinY, v12, CGRectGetHeight(v30));

  v19 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
  v20 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
  [v20 frame];
  double v21 = CGRectGetMinY(v31);
  v22 = [(AKAuthorizationLoginChoiceCell *)self detailTextLabel];
  [v22 frame];
  objc_msgSend(v19, "setFrame:", v13, v21, v12, CGRectGetHeight(v32));

  v23 = [(AKAuthorizationLoginChoiceCell *)self textLabel];
  [v23 frame];
  -[AKAuthorizationLoginChoiceCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, CGRectGetMinX(v33), 0.0, 0.0);
}

- (BOOL)_isSharedAccountLoginChoice
{
  v2 = [(AKAuthorizationLoginChoiceCell *)self loginChoice];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (void).cxx_destruct
{
}

@end