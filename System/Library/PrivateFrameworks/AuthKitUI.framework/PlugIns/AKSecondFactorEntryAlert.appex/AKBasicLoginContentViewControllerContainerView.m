@interface AKBasicLoginContentViewControllerContainerView
- (AKBasicLoginContentViewControllerContainerView)initWithFrame:(CGRect)a3;
- (NSArray)activeConstraints;
- (NSString)messageText;
- (NSString)titleText;
- (UIImage)bannerImage;
- (UIImageView)bannerView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_configureBannerImage;
- (void)_configureMessageLabel;
- (void)setActiveConstraints:(id)a3;
- (void)setBannerImage:(id)a3;
- (void)setBannerView:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setMessageText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)updateConstraints;
@end

@implementation AKBasicLoginContentViewControllerContainerView

- (AKBasicLoginContentViewControllerContainerView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AKBasicLoginContentViewControllerContainerView;
  v3 = -[AKBasicLoginContentViewControllerContainerView initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0 options:2];
    v7 = +[UIFont fontWithDescriptor:v6 size:0.0];
    [(UILabel *)v3->_titleLabel setFont:v7];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v8 = [(AKBasicLoginContentViewControllerContainerView *)v3 titleText];
    [(UILabel *)v3->_titleLabel setText:v8];

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1055286886;
    [(UILabel *)v3->_titleLabel _setHyphenationFactor:v9];
    [(UILabel *)v3->_titleLabel setPreferredMaxLayoutWidth:238.0];
    [(AKBasicLoginContentViewControllerContainerView *)v3 _configureMessageLabel];
    [(AKBasicLoginContentViewControllerContainerView *)v3 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (id)viewForFirstBaselineLayout
{
  return self->_titleLabel;
}

- (id)viewForLastBaselineLayout
{
  messageLabel = self->_messageLabel;
  if (!messageLabel) {
    messageLabel = self->_titleLabel;
  }
  return messageLabel;
}

- (void)updateConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_activeConstraints];
  messageText = self->_messageText;
  if (messageText) {
    BOOL v4 = [(NSString *)messageText length] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  v5 = +[NSMutableArray array];
  titleLabel = self->_titleLabel;
  v7 = &off_10000D000;
  BOOL v45 = v4;
  if (v4) {
    _NSDictionaryOfVariableBindings(@"_titleLabel,_messageLabel", titleLabel, self->_messageLabel, 0);
  }
  else {
  v44 = _NSDictionaryOfVariableBindings(@"_titleLabel", titleLabel, 0);
  }
  v8 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
  double v9 = v8;
  bannerView = self->_bannerView;
  v43 = v8;
  if (bannerView)
  {
    objc_super v11 = +[NSLayoutConstraint constraintWithItem:bannerView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:24.0];
    v12 = self->_bannerView;
    v13 = self->_titleLabel;
    [v9 scaledValueForValue:-36.0];
    v14 = +[UIScreen mainScreen];
    UIRoundToScreenScale();
    v16 = +[NSLayoutConstraint constraintWithItem:v12 attribute:11 relatedBy:0 toItem:v13 attribute:12 multiplier:1.0 constant:v15];

    v17 = +[NSLayoutConstraint constraintWithItem:self->_bannerView attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    v48[0] = v17;
    v48[1] = v11;
    v48[2] = v16;
    v18 = +[NSArray arrayWithObjects:v48 count:3];
    [v5 addObjectsFromArray:v18];

    v7 = &off_10000D000;
  }
  else
  {
    v19 = self->_titleLabel;
    [v8 scaledValueForValue:36.0];
    v20 = +[UIScreen mainScreen];
    UIRoundToScreenScale();
    objc_super v11 = +[NSLayoutConstraint constraintWithItem:v19 attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v21];

    [v5 addObject:v11];
  }

  v22 = self->_titleLabel;
  BOOL v23 = v45;
  if (v45)
  {
    uint64_t v24 = *((int *)v7 + 719);
    uint64_t v25 = *(uint64_t *)((char *)&self->super.super.super.isa + v24);
    [v43 scaledValueForValue:-20.0];
    v26 = +[UIScreen mainScreen];
    UIRoundToScreenScale();
    v28 = +[NSLayoutConstraint constraintWithItem:v22 attribute:11 relatedBy:0 toItem:v25 attribute:12 multiplier:1.0 constant:v27];

    uint64_t v29 = *(uint64_t *)((char *)&self->super.super.super.isa + v24);
    [v43 scaledValueForValue:-24.0];
    v30 = +[UIScreen mainScreen];
    UIRoundToScreenScale();
    v32 = +[NSLayoutConstraint constraintWithItem:v29 attribute:11 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:v31];

    v33 = v43;
    BOOL v23 = v45;
    v47[0] = v28;
    v47[1] = v32;
    v34 = +[NSArray arrayWithObjects:v47 count:2];
    [v5 addObjectsFromArray:v34];
  }
  else
  {
    v33 = v43;
    [v43 scaledValueForValue:-24.0];
    v35 = +[UIScreen mainScreen];
    UIRoundToScreenScale();
    v28 = +[NSLayoutConstraint constraintWithItem:v22 attribute:11 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:v36];

    [v5 addObject:v28];
  }

  v37 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(H_MARGIN)-[_titleLabel]-(H_MARGIN)-|", 0, &off_1000086C8, v44);
  [v5 addObjectsFromArray:v37];
  if (v23)
  {
    v38 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(H_MARGIN)-[_messageLabel]-(H_MARGIN)-|", 0, &off_1000086C8, v44);
    [v5 addObjectsFromArray:v38];
  }
  [v5 addObjectsFromArray:v37];
  +[NSLayoutConstraint activateConstraints:v5];
  LODWORD(v39) = 1144750080;
  [(AKBasicLoginContentViewControllerContainerView *)self setContentCompressionResistancePriority:1 forAxis:v39];
  LODWORD(v40) = 1144750080;
  [(AKBasicLoginContentViewControllerContainerView *)self setContentCompressionResistancePriority:0 forAxis:v40];
  v41 = (NSArray *)[v5 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v41;

  v46.receiver = self;
  v46.super_class = (Class)AKBasicLoginContentViewControllerContainerView;
  [(AKBasicLoginContentViewControllerContainerView *)&v46 updateConstraints];
}

- (void)_configureBannerImage
{
  if (self->_bannerImage)
  {
    id v3 = objc_alloc((Class)UIImageView);
    BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = +[UIScreen mainScreen];
    v6 = [v5 _defaultTraitCollection];
    v7 = +[UIImage imageNamed:@"AppleID" inBundle:v4 compatibleWithTraitCollection:v6];
    v8 = (UIImageView *)[v3 initWithImage:v7];
    bannerView = self->_bannerView;
    self->_bannerView = v8;

    [(UIImageView *)self->_bannerView setContentMode:4];
    [(UIImageView *)self->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v10) = 1144750080;
    [(UIImageView *)self->_bannerView setContentHuggingPriority:1 forAxis:v10];
    LODWORD(v11) = 1144750080;
    [(UIImageView *)self->_bannerView setContentCompressionResistancePriority:1 forAxis:v11];
    [(AKBasicLoginContentViewControllerContainerView *)self addSubview:self->_bannerView];
  }
  else
  {
    v12 = self->_bannerView;
    if (v12)
    {
      [(UIImageView *)v12 removeFromSuperview];
      v13 = self->_bannerView;
    }
    else
    {
      v13 = 0;
    }
    self->_bannerView = 0;
  }

  [(AKBasicLoginContentViewControllerContainerView *)self setNeedsUpdateConstraints];
}

- (void)_configureMessageLabel
{
  messageText = self->_messageText;
  if (messageText && [(NSString *)messageText length])
  {
    if (!self->_messageLabel)
    {
      BOOL v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      messageLabel = self->_messageLabel;
      self->_messageLabel = v4;

      v6 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote addingSymbolicTraits:0x8000 options:2];
      v7 = +[UIFont fontWithDescriptor:v6 size:0.0];
      [(UILabel *)self->_messageLabel setFont:v7];

      [(UILabel *)self->_messageLabel setTextAlignment:1];
      [(UILabel *)self->_messageLabel setNumberOfLines:0];
      [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v8) = 1055286886;
      [(UILabel *)self->_messageLabel _setHyphenationFactor:v8];
      [(UILabel *)self->_messageLabel setPreferredMaxLayoutWidth:238.0];
      [(AKBasicLoginContentViewControllerContainerView *)self addSubview:self->_messageLabel];
    }
    double v9 = [(AKBasicLoginContentViewControllerContainerView *)self messageText];
    [(UILabel *)self->_messageLabel setText:v9];
  }
  else
  {
    double v10 = self->_messageLabel;
    if (v10)
    {
      [(UILabel *)v10 removeFromSuperview];
      double v9 = self->_messageLabel;
    }
    else
    {
      double v9 = 0;
    }
    self->_messageLabel = 0;
  }

  [(AKBasicLoginContentViewControllerContainerView *)self setNeedsUpdateConstraints];
}

- (void)setTitleText:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  titleText = self->_titleText;
  self->_titleText = v4;

  [(UILabel *)self->_titleLabel setText:self->_titleText];

  [(AKBasicLoginContentViewControllerContainerView *)self setNeedsUpdateConstraints];
}

- (NSString)titleText
{
  id v2 = [(NSString *)self->_titleText copy];

  return (NSString *)v2;
}

- (void)setMessageText:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  messageText = self->_messageText;
  self->_messageText = v4;

  [(AKBasicLoginContentViewControllerContainerView *)self _configureMessageLabel];
}

- (NSString)messageText
{
  id v2 = [(NSString *)self->_messageText copy];

  return (NSString *)v2;
}

- (void)setBannerImage:(id)a3
{
  objc_storeStrong((id *)&self->_bannerImage, a3);

  [(AKBasicLoginContentViewControllerContainerView *)self _configureBannerImage];
}

- (UIImage)bannerImage
{
  return self->_bannerImage;
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIImageView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
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
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_bannerImage, 0);
}

@end