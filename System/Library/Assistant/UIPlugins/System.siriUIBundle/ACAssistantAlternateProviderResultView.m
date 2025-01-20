@interface ACAssistantAlternateProviderResultView
- (ACAssistantAlternateProviderResultView)initWithAlternateProviderResult:(id)a3 usingPersistentStore:(id)a4;
- (CGSize)sizeThatFits:(CGSize)result;
- (NSArray)commands;
- (UIEdgeInsets)edgeInsets;
- (void)_configureUsingImage:(id)a3;
- (void)setCommands:(id)a3;
- (void)updateConstraints;
@end

@implementation ACAssistantAlternateProviderResultView

- (ACAssistantAlternateProviderResultView)initWithAlternateProviderResult:(id)a3 usingPersistentStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)ACAssistantAlternateProviderResultView;
  v8 = [(ACAssistantAlternateProviderResultView *)&v38 init];
  if (v8)
  {
    v9 = [v6 commands];
    [(ACAssistantAlternateProviderResultView *)v8 setCommands:v9];

    v10 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v8->_containerView;
    v8->_containerView = v10;

    [(ACAssistantAlternateProviderResultView *)v8 addSubview:v8->_containerView];
    [(UIView *)v8->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [v6 providerName];

    if (v12)
    {
      uint64_t v13 = +[SiriSharedUIContentLabel label];
      providerNameLabel = v8->_providerNameLabel;
      v8->_providerNameLabel = (UILabel *)v13;

      [(UILabel *)v8->_providerNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v15 = v8->_providerNameLabel;
      v16 = +[UIFont siriui_lightWeightFontWithSize:18.0];
      [(UILabel *)v15 setFont:v16];

      v17 = v8->_providerNameLabel;
      v18 = [v6 providerName];
      [(UILabel *)v17 setText:v18];

      v19 = v8->_providerNameLabel;
      v20 = +[UIColor siriui_maskingColor];
      [(UILabel *)v19 setTextColor:v20];

      [(UIView *)v8->_containerView addSubview:v8->_providerNameLabel];
    }
    v21 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    providerLogoImageView = v8->_providerLogoImageView;
    v8->_providerLogoImageView = v21;

    [(UIImageView *)v8->_providerLogoImageView setContentMode:4];
    [(UIImageView *)v8->_providerLogoImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = v8->_providerLogoImageView;
    v24 = +[UIColor clearColor];
    [(UIImageView *)v23 setBackgroundColor:v24];

    [(UIView *)v8->_containerView addSubview:v8->_providerLogoImageView];
    v25 = [v6 providerImage];
    v26 = [v25 resourceUrl];
    v27 = [v26 absoluteString];

    v28 = [v7 imageForKey:v27];
    if (v28)
    {
      [(ACAssistantAlternateProviderResultView *)v8 _configureUsingImage:v28];
    }
    else
    {
      v29 = +[SiriUIURLSession sharedURLSession];
      v30 = [v6 providerImage];
      v31 = [v30 resourceUrl];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_5CD0;
      v34[3] = &unk_18580;
      id v35 = v7;
      id v36 = v27;
      v37 = v8;
      id v32 = [v29 imageTaskWithHTTPGetRequest:v31 client:v37 completionHandler:v34];
    }
    [(ACAssistantAlternateProviderResultView *)v8 setNeedsUpdateConstraints];
  }
  return v8;
}

- (UIEdgeInsets)edgeInsets
{
  double v2 = SiriUIPlatterStyle[32];
  double v3 = SiriUIPlatterStyle[34];
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v3;
  result.bottom = v5;
  result.left = v2;
  result.top = v4;
  return result;
}

- (void)_configureUsingImage:(id)a3
{
  providerLogoImageView = self->_providerLogoImageView;
  id v5 = a3;
  id v6 = +[UIColor siriui_maskingColor];
  id v7 = [v5 _flatImageWithColor:v6];

  [(UIImageView *)providerLogoImageView setImage:v7];
  [(UIImageView *)self->_providerLogoImageView sizeToFit];
  if (v5)
  {
    providerNameLabel = self->_providerNameLabel;
    if (providerNameLabel)
    {
      v9 = +[NSLayoutConstraint constraintWithItem:self->_providerLogoImageView attribute:6 relatedBy:0 toItem:providerNameLabel attribute:5 multiplier:1.0 constant:-6.0];
      LODWORD(v10) = 1144750080;
      [v9 setPriority:v10];
      [(UIView *)self->_containerView addConstraint:v9];
    }
  }

  [(ACAssistantAlternateProviderResultView *)self layoutSubviews];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 44.0;
  result.height = v3;
  return result;
}

- (void)updateConstraints
{
  v21.receiver = self;
  v21.super_class = (Class)ACAssistantAlternateProviderResultView;
  [(ACAssistantAlternateProviderResultView *)&v21 updateConstraints];
  if (self->_hasSetUpConstraints) {
    return;
  }
  double v3 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0);
  double v4 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_containerView]|" options:0 metrics:0 views:v3];
  [(ACAssistantAlternateProviderResultView *)self addConstraints:v4];

  id v5 = _NSDictionaryOfVariableBindings(@"_containerView", self->_containerView, 0);
  id v6 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_containerView(==cellHeight)]|" options:0 metrics:&off_18EE8 views:v5];
  [(ACAssistantAlternateProviderResultView *)self addConstraints:v6];

  providerLogoImageView = self->_providerLogoImageView;
  if (providerLogoImageView)
  {
    v8 = providerLogoImageView;
LABEL_5:
    containerView = self->_containerView;
    double v10 = _NSDictionaryOfVariableBindings(@"leadingView", v8, 0);
    v11 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leadingView]" options:0 metrics:0 views:v10];
    [(UIView *)containerView addConstraints:v11];

    if (self->_providerLogoImageView && self->_providerNameLabel)
    {
      v12 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", 1.0, 0.0);
      LODWORD(v13) = 1132068864;
      [v12 setPriority:v13];
      [(UIView *)self->_containerView addConstraint:v12];
    }
    goto LABEL_8;
  }
  v8 = self->_providerNameLabel;
  if (v8) {
    goto LABEL_5;
  }
LABEL_8:
  providerNameLabel = self->_providerNameLabel;
  if (providerNameLabel)
  {
    v15 = +[UIScreen mainScreen];
    [v15 scale];
    double v16 = 29.0;
    if (v17 >= 2.0) {
      double v16 = 28.5;
    }
    v18 = +[NSLayoutConstraint constraintWithItem:providerNameLabel attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v16];
    [(ACAssistantAlternateProviderResultView *)self addConstraint:v18];
  }
  v19 = self->_providerLogoImageView;
  if (v19)
  {
    v20 = +[NSLayoutConstraint constraintWithItem:v19 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [(ACAssistantAlternateProviderResultView *)self addConstraint:v20];
  }
  self->_hasSetUpConstraints = 1;
}

- (NSArray)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_providerLogoImageView, 0);

  objc_storeStrong((id *)&self->_providerNameLabel, 0);
}

@end