@interface ACAssistantDisambiguationCell
+ (double)defaultHeight;
+ (double)defaultHeightWithHeading;
+ (double)defaultHeightWithImageView;
+ (double)defaultHeightWithSubtitle;
- (ACAssistantDisambiguationCell)initWithFrame:(CGRect)a3;
- (BOOL)constraintsCreated;
- (BOOL)hasStarColumn;
- (BOOL)isLastRow;
- (NSLayoutConstraint)extraTitleBaselineConstraint;
- (NSLayoutConstraint)imageLeadingOffsetConstraint;
- (NSLayoutConstraint)secondaryTitleBaselineConstraint;
- (NSLayoutConstraint)titleBaselineConstraint;
- (NSLayoutConstraint)titleLeadingOffsetConstraint;
- (SiriSharedUIContentLabel)extraDisambiguationLabel;
- (SiriSharedUIContentLabel)extraDisambiguationSubTextLabel;
- (SiriSharedUIContentLabel)secondaryTitleLabel;
- (SiriSharedUIContentLabel)titleLabel;
- (SiriUIDisambiguationItem)item;
- (UIImageView)imageView;
- (UIImageView)starView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConstraintsCreated:(BOOL)a3;
- (void)setExtraDisambiguationLabel:(id)a3;
- (void)setExtraDisambiguationSubTextLabel:(id)a3;
- (void)setExtraTitleBaselineConstraint:(id)a3;
- (void)setHasStarColumn:(BOOL)a3;
- (void)setImageLeadingOffsetConstraint:(id)a3;
- (void)setImageView:(id)a3;
- (void)setItem:(id)a3;
- (void)setLastRow:(BOOL)a3;
- (void)setSecondaryTitleBaselineConstraint:(id)a3;
- (void)setSecondaryTitleLabel:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setStarView:(id)a3;
- (void)setTitleBaselineConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLeadingOffsetConstraint:(id)a3;
- (void)updateConstraintConstants;
- (void)updateConstraints;
@end

@implementation ACAssistantDisambiguationCell

- (ACAssistantDisambiguationCell)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)ACAssistantDisambiguationCell;
  v3 = -[ACAssistantDisambiguationCell initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriSharedUIContentLabel label];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (SiriSharedUIContentLabel *)v4;

    v6 = v3->_titleLabel;
    v7 = +[UIFont siriui_lightWeightFontWithSize:18.0];
    [(SiriSharedUIContentLabel *)v6 setFont:v7];

    LODWORD(v8) = 1132068864;
    [(SiriSharedUIContentLabel *)v3->_titleLabel setContentCompressionResistancePriority:0 forAxis:v8];
    [(SiriSharedUIContentLabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(ACAssistantDisambiguationCell *)v3 contentView];
    [v9 addSubview:v3->_titleLabel];

    uint64_t v10 = +[SiriSharedUIContentLabel labelWithMediumWeightSubtextFont];
    secondaryTitleLabel = v3->_secondaryTitleLabel;
    v3->_secondaryTitleLabel = (SiriSharedUIContentLabel *)v10;

    [(SiriSharedUIContentLabel *)v3->_secondaryTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1132068864;
    [(SiriSharedUIContentLabel *)v3->_secondaryTitleLabel setContentCompressionResistancePriority:0 forAxis:v12];
    v13 = [(ACAssistantDisambiguationCell *)v3 contentView];
    [v13 addSubview:v3->_secondaryTitleLabel];

    uint64_t v14 = +[SiriSharedUIContentLabel labelWithLightWeightRegularFont];
    extraDisambiguationLabel = v3->_extraDisambiguationLabel;
    v3->_extraDisambiguationLabel = (SiriSharedUIContentLabel *)v14;

    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationLabel setTextAlignment:2];
    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v16) = 1144766464;
    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationLabel setContentCompressionResistancePriority:0 forAxis:v16];
    LODWORD(v17) = 1144750080;
    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationLabel setContentHuggingPriority:0 forAxis:v17];
    v18 = [(ACAssistantDisambiguationCell *)v3 contentView];
    [v18 addSubview:v3->_extraDisambiguationLabel];

    uint64_t v19 = +[SiriSharedUIContentLabel labelWithMediumWeightSubtextFont];
    extraDisambiguationSubTextLabel = v3->_extraDisambiguationSubTextLabel;
    v3->_extraDisambiguationSubTextLabel = (SiriSharedUIContentLabel *)v19;

    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationSubTextLabel setTextAlignment:2];
    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationSubTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v21) = 1144766464;
    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationSubTextLabel setContentCompressionResistancePriority:0 forAxis:v21];
    LODWORD(v22) = 1144750080;
    [(SiriSharedUIContentLabel *)v3->_extraDisambiguationSubTextLabel setContentHuggingPriority:0 forAxis:v22];
    v23 = [(ACAssistantDisambiguationCell *)v3 contentView];
    [v23 addSubview:v3->_extraDisambiguationSubTextLabel];

    id v24 = objc_alloc((Class)UIImageView);
    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = +[UIImage imageNamed:@"VIP" inBundle:v25];
    v27 = +[UIColor siriui_maskingColor];
    v28 = [v26 _flatImageWithColor:v27];
    v29 = (UIImageView *)[v24 initWithImage:v28];
    starView = v3->_starView;
    v3->_starView = v29;

    [(UIImageView *)v3->_starView setTranslatesAutoresizingMaskIntoConstraints:0];
    v31 = [(ACAssistantDisambiguationCell *)v3 contentView];
    [v31 addSubview:v3->_starView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)ACAssistantDisambiguationCell;
  [(ACAssistantDisambiguationCell *)&v10 layoutSubviews];
  [(UIImageView *)self->_starView setHidden:[(SiriUIDisambiguationItem *)self->_item showsFavoriteStar] ^ 1];
  if ([(ACAssistantDisambiguationCell *)self isLastRow])
  {
    v3 = self;
    uint64_t v4 = 0;
LABEL_7:
    [(ACAssistantDisambiguationCell *)v3 setKeylineType:v4];
    return;
  }
  if (![(ACAssistantDisambiguationCell *)self hasStarColumn])
  {
    v3 = self;
    uint64_t v4 = 1;
    goto LABEL_7;
  }
  v5 = [(ACAssistantDisambiguationCell *)self keyline];
  [v5 setKeylineType:4];

  v6 = (int *)[(ACAssistantDisambiguationCell *)self semanticContentAttribute];
  v7 = [(ACAssistantDisambiguationCell *)self keyline];
  double v8 = v7;
  if (v6 == &dword_4)
  {
    [v7 setCustomRightPadding:35.0];

    v9 = [(ACAssistantDisambiguationCell *)self keyline];
    [v9 setCustomLeftPadding:0.0];
  }
  else
  {
    [v7 setCustomLeftPadding:35.0];

    v9 = [(ACAssistantDisambiguationCell *)self keyline];
    [v9 setCustomRightPadding:0.0];
  }
}

- (void)updateConstraints
{
  v30.receiver = self;
  v30.super_class = (Class)ACAssistantDisambiguationCell;
  [(ACAssistantDisambiguationCell *)&v30 updateConstraints];
  if (!self->_constraintsCreated)
  {
    uint64_t v3 = _NSDictionaryOfVariableBindings(@"_titleLabel, _secondaryTitleLabel, _extraDisambiguationLabel, _extraDisambiguationSubTextLabel, _starView", self->_titleLabel, self->_secondaryTitleLabel, self->_extraDisambiguationLabel, self->_extraDisambiguationSubTextLabel, self->_starView, 0);
    uint64_t v4 = [(ACAssistantDisambiguationCell *)self contentView];
    v5 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-starTop-[_starView(==starHeight)]-(>=0)-|", 0, &off_18F10, v3);
    [v4 addConstraints:v5];

    v6 = (void *)v3;
    v7 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-starLeft-[_starView(==starWidth)]-(>=0)-|", 0, &off_18F10, v3);
    [v4 addConstraints:v7];

    double v8 = [(ACAssistantDisambiguationCell *)self keyline];
    v9 = +[NSLayoutConstraint constraintWithItem:v8 attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v9];

    objc_super v10 = [(ACAssistantDisambiguationCell *)self keyline];
    v11 = +[NSLayoutConstraint constraintWithItem:v10 attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v11];

    double v12 = [(ACAssistantDisambiguationCell *)self keyline];
    v13 = +[NSLayoutConstraint constraintWithItem:v12 attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v13];

    uint64_t v14 = +[NSLayoutConstraint constraintWithItem:self->_titleLabel attribute:11 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:28.5];
    titleBaselineConstraint = self->_titleBaselineConstraint;
    self->_titleBaselineConstraint = v14;

    [v4 addConstraint:self->_titleBaselineConstraint];
    double v16 = +[NSLayoutConstraint constraintWithItem:self->_secondaryTitleLabel attribute:11 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:41.0];
    secondaryTitleBaselineConstraint = self->_secondaryTitleBaselineConstraint;
    self->_secondaryTitleBaselineConstraint = v16;

    [v4 addConstraint:self->_secondaryTitleBaselineConstraint];
    v18 = v6;
    uint64_t v19 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:[_titleLabel]-[_extraDisambiguationLabel]-edgePadding-|", 0, &off_18F10, v6);
    [v4 addConstraints:v19];

    v20 = +[NSLayoutConstraint constraintWithItem:self->_titleLabel attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:35.0];
    titleLeadingOffsetConstraint = self->_titleLeadingOffsetConstraint;
    self->_titleLeadingOffsetConstraint = v20;

    LODWORD(v22) = 1144750080;
    [(NSLayoutConstraint *)self->_titleLeadingOffsetConstraint setPriority:v22];
    [v4 addConstraint:self->_titleLeadingOffsetConstraint];
    v23 = +[NSLayoutConstraint constraintWithItem:self->_titleLabel attribute:5 relatedBy:0 toItem:self->_secondaryTitleLabel attribute:5 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v23];

    id v24 = +[NSLayoutConstraint constraintWithItem:self->_extraDisambiguationLabel attribute:5 relatedBy:0 toItem:self->_extraDisambiguationSubTextLabel attribute:5 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v24];

    v25 = +[NSLayoutConstraint constraintWithItem:self->_titleLabel attribute:6 relatedBy:0 toItem:self->_secondaryTitleLabel attribute:6 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v25];

    v26 = +[NSLayoutConstraint constraintWithItem:self->_extraDisambiguationLabel attribute:6 relatedBy:0 toItem:self->_extraDisambiguationSubTextLabel attribute:6 multiplier:1.0 constant:0.0];
    [v4 addConstraint:v26];

    v27 = +[NSLayoutConstraint constraintWithItem:self->_extraDisambiguationLabel attribute:11 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:28.5];
    extraTitleBaselineConstraint = self->_extraTitleBaselineConstraint;
    self->_extraTitleBaselineConstraint = v27;

    [v4 addConstraint:self->_extraTitleBaselineConstraint];
    v29 = +[NSLayoutConstraint constraintWithItem:self->_extraDisambiguationSubTextLabel attribute:11 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:41.0];
    [v4 addConstraint:v29];

    self->_constraintsCreated = 1;
  }
  [(ACAssistantDisambiguationCell *)self updateConstraintConstants];
}

- (void)updateConstraintConstants
{
  titleLeadingOffsetConstraint = self->_titleLeadingOffsetConstraint;
  if (self->_hasStarColumn) {
    double v4 = 35.0;
  }
  else {
    double v4 = 15.0;
  }
  [(NSLayoutConstraint *)titleLeadingOffsetConstraint setConstant:v4];
  if (self->_hasStarColumn) {
    double v5 = 35.0;
  }
  else {
    double v5 = 15.0;
  }
  [(NSLayoutConstraint *)self->_imageLeadingOffsetConstraint setConstant:v5];
  imageView = self->_imageView;
  if (imageView) {
    double v7 = 46.0;
  }
  else {
    double v7 = 28.5;
  }
  if (imageView) {
    double v8 = 56.0;
  }
  else {
    double v8 = 41.0;
  }
  v9 = [(ACAssistantDisambiguationCell *)self item];
  objc_super v10 = [v9 subtitle];
  id v11 = [v10 length];

  if (v11)
  {
    if (imageView) {
      double v12 = 34.0;
    }
    else {
      double v12 = 21.0;
    }
  }
  else
  {
    v13 = [(ACAssistantDisambiguationCell *)self item];
    uint64_t v14 = [v13 headingText];
    id v15 = [v14 length];

    if (v15) {
      double v12 = 40.5;
    }
    else {
      double v12 = v7;
    }
    if (v15) {
      double v8 = 19.0;
    }
  }
  double v16 = [(ACAssistantDisambiguationCell *)self item];
  double v17 = [v16 extraDisambiguationSubText];
  id v18 = [v17 length];

  if (v18) {
    double v7 = 21.0;
  }
  [(NSLayoutConstraint *)self->_titleBaselineConstraint setConstant:v12];
  [(NSLayoutConstraint *)self->_secondaryTitleBaselineConstraint setConstant:v8];
  extraTitleBaselineConstraint = self->_extraTitleBaselineConstraint;

  [(NSLayoutConstraint *)extraTitleBaselineConstraint setConstant:v7];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)ACAssistantDisambiguationCell;
  [(ACAssistantDisambiguationCell *)&v3 prepareForReuse];
  [(ACAssistantDisambiguationCell *)self setItem:0];
}

- (void)setItem:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  double v5 = [v20 title];
  id v6 = [v20 titleBoldedRange];
  if (v7)
  {
    id v8 = v6;
    uint64_t v9 = v7;
    id v10 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];
    id v11 = +[UIFont siriui_mediumWeightFontWithSize:18.0];
    objc_msgSend(v10, "addAttribute:value:range:", NSFontAttributeName, v11, v8, v9);
    [(SiriSharedUIContentLabel *)self->_titleLabel setAttributedText:v10];
  }
  else
  {
    [(SiriSharedUIContentLabel *)self->_titleLabel setText:v5];
  }
  double v12 = [v20 subtitle];

  secondaryTitleLabel = self->_secondaryTitleLabel;
  if (v12) {
    [v20 subtitle];
  }
  else {
  uint64_t v14 = [v20 headingText];
  }
  [(SiriSharedUIContentLabel *)secondaryTitleLabel setText:v14];

  extraDisambiguationLabel = self->_extraDisambiguationLabel;
  double v16 = [v20 extraDisambiguationText];
  [(SiriSharedUIContentLabel *)extraDisambiguationLabel setText:v16];

  extraDisambiguationSubTextLabel = self->_extraDisambiguationSubTextLabel;
  id v18 = [v20 extraDisambiguationSubText];
  [(SiriSharedUIContentLabel *)extraDisambiguationSubTextLabel setText:v18];

  uint64_t v19 = [v20 imageView];
  [(ACAssistantDisambiguationCell *)self setImageView:v19];

  [(ACAssistantDisambiguationCell *)self setNeedsUpdateConstraints];
  [(ACAssistantDisambiguationCell *)self setNeedsLayout];
}

- (void)setImageView:(id)a3
{
  id v18 = a3;
  p_imageView = &self->_imageView;
  [(UIImageView *)self->_imageView removeFromSuperview];
  imageLeadingOffsetConstraint = self->_imageLeadingOffsetConstraint;
  self->_imageLeadingOffsetConstraint = 0;

  objc_storeStrong((id *)&self->_imageView, a3);
  if (self->_imageView)
  {
    uint64_t v7 = [(ACAssistantDisambiguationCell *)self contentView];
    [v7 addSubview:*p_imageView];

    [(UIImageView *)*p_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(ACAssistantDisambiguationCell *)self contentView];
    uint64_t v9 = _NSDictionaryOfVariableBindings(@"_imageView", *p_imageView, 0);
    id v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_imageView(==imageWidth)]" options:0 metrics:&off_18F38 views:v9];
    [v8 addConstraints:v10];

    id v11 = _NSDictionaryOfVariableBindings(@"_imageView, _titleLabel", *p_imageView, self->_titleLabel, 0);
    double v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-imageTop-[_imageView(==imageHeight)]", 0, &off_18F38, v11);
    [v8 addConstraints:v12];

    v13 = +[NSLayoutConstraint constraintWithItem:self->_titleLabel attribute:5 relatedBy:0 toItem:*p_imageView attribute:6 multiplier:1.0 constant:15.0];
    LODWORD(v14) = 1144766464;
    [v13 setPriority:v14];
    [v8 addConstraint:v13];
    if (self->_hasStarColumn) {
      double v15 = 35.0;
    }
    else {
      double v15 = 15.0;
    }
    double v16 = +[NSLayoutConstraint constraintWithItem:*p_imageView attribute:5 relatedBy:0 toItem:v8 attribute:5 multiplier:1.0 constant:v15];
    double v17 = self->_imageLeadingOffsetConstraint;
    self->_imageLeadingOffsetConstraint = v16;

    [v8 addConstraint:self->_imageLeadingOffsetConstraint];
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  double v5 = [(ACAssistantDisambiguationCell *)self contentView];
  id v6 = [v5 constraints];

  uint64_t v7 = [(ACAssistantDisambiguationCell *)self contentView];
  [v7 removeConstraints:v6];

  v9.receiver = self;
  v9.super_class = (Class)ACAssistantDisambiguationCell;
  [(ACAssistantDisambiguationCell *)&v9 setSemanticContentAttribute:a3];
  id v8 = [(ACAssistantDisambiguationCell *)self contentView];
  [v8 addConstraints:v6];
}

+ (double)defaultHeight
{
  return 44.0;
}

+ (double)defaultHeightWithHeading
{
  return 50.0;
}

+ (double)defaultHeightWithSubtitle
{
  return 55.0;
}

+ (double)defaultHeightWithImageView
{
  return 76.0;
}

- (SiriUIDisambiguationItem)item
{
  return self->_item;
}

- (BOOL)hasStarColumn
{
  return self->_hasStarColumn;
}

- (void)setHasStarColumn:(BOOL)a3
{
  self->_hasStarColumn = a3;
}

- (BOOL)isLastRow
{
  return self->_lastRow;
}

- (void)setLastRow:(BOOL)a3
{
  self->_lastRow = a3;
}

- (SiriSharedUIContentLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (SiriSharedUIContentLabel)secondaryTitleLabel
{
  return self->_secondaryTitleLabel;
}

- (void)setSecondaryTitleLabel:(id)a3
{
}

- (SiriSharedUIContentLabel)extraDisambiguationLabel
{
  return self->_extraDisambiguationLabel;
}

- (void)setExtraDisambiguationLabel:(id)a3
{
}

- (SiriSharedUIContentLabel)extraDisambiguationSubTextLabel
{
  return self->_extraDisambiguationSubTextLabel;
}

- (void)setExtraDisambiguationSubTextLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)starView
{
  return self->_starView;
}

- (void)setStarView:(id)a3
{
}

- (NSLayoutConstraint)titleLeadingOffsetConstraint
{
  return self->_titleLeadingOffsetConstraint;
}

- (void)setTitleLeadingOffsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingOffsetConstraint
{
  return self->_imageLeadingOffsetConstraint;
}

- (void)setImageLeadingOffsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleBaselineConstraint
{
  return self->_titleBaselineConstraint;
}

- (void)setTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryTitleBaselineConstraint
{
  return self->_secondaryTitleBaselineConstraint;
}

- (void)setSecondaryTitleBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)extraTitleBaselineConstraint
{
  return self->_extraTitleBaselineConstraint;
}

- (void)setExtraTitleBaselineConstraint:(id)a3
{
}

- (BOOL)constraintsCreated
{
  return self->_constraintsCreated;
}

- (void)setConstraintsCreated:(BOOL)a3
{
  self->_constraintsCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTitleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingOffsetConstraint, 0);
  objc_storeStrong((id *)&self->_starView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationSubTextLabel, 0);
  objc_storeStrong((id *)&self->_extraDisambiguationLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end