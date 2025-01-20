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
  v12.receiver = self;
  v12.super_class = (Class)AKBasicLoginContentViewControllerContainerView;
  v3 = -[AKBasicLoginContentViewControllerContainerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    v7 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F438A0] addingSymbolicTraits:0 options:2];
    v8 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v7 size:0.0];
    [(UILabel *)v3->_titleLabel setFont:v8];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v9 = [(AKBasicLoginContentViewControllerContainerView *)v3 titleText];
    [(UILabel *)v3->_titleLabel setText:v9];

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v10) = 1055286886;
    [(UILabel *)v3->_titleLabel _setHyphenationFactor:v10];
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
  v52[3] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_activeConstraints];
  messageText = self->_messageText;
  if (messageText) {
    BOOL v4 = [(NSString *)messageText length] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  titleLabel = self->_titleLabel;
  unint64_t v7 = 0x1EA37F000uLL;
  BOOL v49 = v4;
  if (v4) {
    _NSDictionaryOfVariableBindings(&cfstr_TitlelabelMess.isa, titleLabel, self->_messageLabel, 0);
  }
  else {
  v48 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, titleLabel, 0);
  }
  v8 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43870]];
  v9 = v8;
  bannerView = self->_bannerView;
  v11 = (void *)MEMORY[0x1E4F28DC8];
  v47 = v8;
  if (bannerView)
  {
    objc_super v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:bannerView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:24.0];
    v13 = (void *)MEMORY[0x1E4F28DC8];
    v14 = self->_bannerView;
    v15 = self->_titleLabel;
    [v9 scaledValueForValue:-36.0];
    v16 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    v18 = [v13 constraintWithItem:v14 attribute:11 relatedBy:0 toItem:v15 attribute:12 multiplier:1.0 constant:v17];

    v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_bannerView attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    v52[0] = v19;
    v52[1] = v12;
    v52[2] = v18;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
    [v5 addObjectsFromArray:v20];

    unint64_t v7 = 0x1EA37F000;
  }
  else
  {
    v21 = self->_titleLabel;
    [v8 scaledValueForValue:36.0];
    v22 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    objc_super v12 = [v11 constraintWithItem:v21 attribute:12 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:v23];

    [v5 addObject:v12];
  }

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = self->_titleLabel;
  BOOL v26 = v49;
  if (v49)
  {
    uint64_t v27 = *(int *)(v7 + 1932);
    uint64_t v28 = *(uint64_t *)((char *)&self->super.super.super.isa + v27);
    [v47 scaledValueForValue:-20.0];
    v29 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    v31 = [v24 constraintWithItem:v25 attribute:11 relatedBy:0 toItem:v28 attribute:12 multiplier:1.0 constant:v30];

    v32 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v33 = *(uint64_t *)((char *)&self->super.super.super.isa + v27);
    [v47 scaledValueForValue:-24.0];
    v34 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    v36 = [v32 constraintWithItem:v33 attribute:11 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:v35];

    v37 = v47;
    BOOL v26 = v49;
    v51[0] = v31;
    v51[1] = v36;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
    [v5 addObjectsFromArray:v38];
  }
  else
  {
    v37 = v47;
    [v47 scaledValueForValue:-24.0];
    v39 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    v31 = [v24 constraintWithItem:v25 attribute:11 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:v40];

    [v5 addObject:v31];
  }

  v41 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(H_MARGIN)-[_titleLabel]-(H_MARGIN)-|" options:0 metrics:&unk_1F1F03868 views:v48];
  [v5 addObjectsFromArray:v41];
  if (v26)
  {
    v42 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(H_MARGIN)-[_messageLabel]-(H_MARGIN)-|" options:0 metrics:&unk_1F1F03868 views:v48];
    [v5 addObjectsFromArray:v42];
  }
  [v5 addObjectsFromArray:v41];
  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  LODWORD(v43) = 1144750080;
  [(AKBasicLoginContentViewControllerContainerView *)self setContentCompressionResistancePriority:1 forAxis:v43];
  LODWORD(v44) = 1144750080;
  [(AKBasicLoginContentViewControllerContainerView *)self setContentCompressionResistancePriority:0 forAxis:v44];
  v45 = (NSArray *)[v5 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v45;

  v50.receiver = self;
  v50.super_class = (Class)AKBasicLoginContentViewControllerContainerView;
  [(AKBasicLoginContentViewControllerContainerView *)&v50 updateConstraints];
}

- (void)_configureBannerImage
{
  if (self->_bannerImage)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    BOOL v4 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v6 = [MEMORY[0x1E4F42D90] mainScreen];
    unint64_t v7 = [v6 _defaultTraitCollection];
    v8 = [v4 imageNamed:@"AppleID" inBundle:v5 compatibleWithTraitCollection:v7];
    v9 = (UIImageView *)[v3 initWithImage:v8];
    bannerView = self->_bannerView;
    self->_bannerView = v9;

    [(UIImageView *)self->_bannerView setContentMode:4];
    [(UIImageView *)self->_bannerView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v11) = 1144750080;
    [(UIImageView *)self->_bannerView setContentHuggingPriority:1 forAxis:v11];
    LODWORD(v12) = 1144750080;
    [(UIImageView *)self->_bannerView setContentCompressionResistancePriority:1 forAxis:v12];
    [(AKBasicLoginContentViewControllerContainerView *)self addSubview:self->_bannerView];
  }
  else
  {
    v13 = self->_bannerView;
    if (v13)
    {
      [(UIImageView *)v13 removeFromSuperview];
      v14 = self->_bannerView;
    }
    else
    {
      v14 = 0;
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
      id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
      uint64_t v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      messageLabel = self->_messageLabel;
      self->_messageLabel = v5;

      unint64_t v7 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890] addingSymbolicTraits:0x8000 options:2];
      v8 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v7 size:0.0];
      [(UILabel *)self->_messageLabel setFont:v8];

      [(UILabel *)self->_messageLabel setTextAlignment:1];
      [(UILabel *)self->_messageLabel setNumberOfLines:0];
      [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v9) = 1055286886;
      [(UILabel *)self->_messageLabel _setHyphenationFactor:v9];
      [(UILabel *)self->_messageLabel setPreferredMaxLayoutWidth:238.0];
      [(AKBasicLoginContentViewControllerContainerView *)self addSubview:self->_messageLabel];
    }
    double v10 = [(AKBasicLoginContentViewControllerContainerView *)self messageText];
    [(UILabel *)self->_messageLabel setText:v10];
  }
  else
  {
    double v11 = self->_messageLabel;
    if (v11)
    {
      [(UILabel *)v11 removeFromSuperview];
      double v10 = self->_messageLabel;
    }
    else
    {
      double v10 = 0;
    }
    self->_messageLabel = 0;
  }

  [(AKBasicLoginContentViewControllerContainerView *)self setNeedsUpdateConstraints];
}

- (void)setTitleText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  titleText = self->_titleText;
  self->_titleText = v4;

  [(UILabel *)self->_titleLabel setText:self->_titleText];

  [(AKBasicLoginContentViewControllerContainerView *)self setNeedsUpdateConstraints];
}

- (NSString)titleText
{
  v2 = (void *)[(NSString *)self->_titleText copy];

  return (NSString *)v2;
}

- (void)setMessageText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  messageText = self->_messageText;
  self->_messageText = v4;

  [(AKBasicLoginContentViewControllerContainerView *)self _configureMessageLabel];
}

- (NSString)messageText
{
  v2 = (void *)[(NSString *)self->_messageText copy];

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