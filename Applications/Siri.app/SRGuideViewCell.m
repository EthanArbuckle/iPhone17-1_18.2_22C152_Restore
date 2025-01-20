@interface SRGuideViewCell
+ (BOOL)_allowsTextToWrap;
+ (BOOL)chevronBlendEffectEnabled;
+ (BOOL)placesImageAboveText;
+ (UIEdgeInsets)defaultInsets;
+ (double)heightOfCellWithName:(id)a3 tagPhrase:(id)a4 width:(double)a5;
+ (id)_nameLabelFont;
+ (id)_tagPhraseLabelFont;
- (NSString)aceId;
- (NSString)name;
- (NSString)tagPhrase;
- (SRGuideViewCell)initWithFrame:(CGRect)a3;
- (UIImage)iconImage;
- (void)setAceId:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setName:(id)a3;
- (void)setTagPhrase:(id)a3;
- (void)updateConstraints;
@end

@implementation SRGuideViewCell

- (SRGuideViewCell)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SRGuideViewCell;
  v3 = -[SRGuideViewCell initWithFrame:](&v24, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SRGuideViewCell *)v3 setKeylineType:0];
    [(SRGuideViewCell *)v4 setHasChevron:1];
    v5 = [(SRGuideViewCell *)v4 selectedBackgroundView];
    v6 = +[UIColor siriui_lightHighlightColor];
    [v5 setBackgroundColor:v6];

    v7 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v7;

    [(UIImageView *)v4->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_iconImageView setAccessibilityIgnoresInvertColors:1];
    uint64_t v9 = objc_opt_new();
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (SiriSharedUIContentLabel *)v9;

    v11 = v4->_nameLabel;
    v12 = [(id)objc_opt_class() _nameLabelFont];
    [(SiriSharedUIContentLabel *)v11 setFont:v12];

    v13 = v4->_nameLabel;
    v14 = +[UIColor siriui_lightTextColor];
    [(SiriSharedUIContentLabel *)v13 setTextColor:v14];

    [(SiriSharedUIContentLabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v15 = +[SiriSharedUIContentLabel label];
    tagPhraseLabel = v4->_tagPhraseLabel;
    v4->_tagPhraseLabel = (SiriSharedUIContentLabel *)v15;

    v17 = v4->_tagPhraseLabel;
    v18 = [(id)objc_opt_class() _tagPhraseLabelFont];
    [(SiriSharedUIContentLabel *)v17 setFont:v18];

    [(SiriSharedUIContentLabel *)v4->_tagPhraseLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = v4->_tagPhraseLabel;
    v20 = +[UIColor siriui_blendEffectColor];
    [(SiriSharedUIContentLabel *)v19 setTextColor:v20];

    [(SRGuideViewCell *)v4 addSubview:v4->_nameLabel];
    [(SRGuideViewCell *)v4 addSubview:v4->_tagPhraseLabel];
    [(SRGuideViewCell *)v4 addSubview:v4->_iconImageView];
    [(SiriSharedUIContentLabel *)v4->_tagPhraseLabel siriui_setBlendEffectEnabled:1];
    if ([(id)objc_opt_class() _allowsTextToWrap])
    {
      [(SiriSharedUIContentLabel *)v4->_nameLabel setNumberOfLines:0];
      LODWORD(v21) = 1.0;
      [(SiriSharedUIContentLabel *)v4->_nameLabel _setHyphenationFactor:v21];
      [(SiriSharedUIContentLabel *)v4->_tagPhraseLabel setNumberOfLines:0];
      LODWORD(v22) = 1.0;
      [(SiriSharedUIContentLabel *)v4->_tagPhraseLabel _setHyphenationFactor:v22];
    }
  }
  return v4;
}

+ (id)_nameLabelFont
{
  return +[UIFont siriui_dynamicMediumWeightBodySizeFont];
}

+ (id)_tagPhraseLabelFont
{
  return +[UIFont siriui_dynamicLightWeightBodySizeFont];
}

+ (BOOL)_allowsTextToWrap
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

+ (BOOL)placesImageAboveText
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

- (void)updateConstraints
{
  v26.receiver = self;
  v26.super_class = (Class)SRGuideViewCell;
  [(SRGuideViewCell *)&v26 updateConstraints];
  if (!self->_hasCreatedConstraints)
  {
    v27[0] = @"cellHeight";
    v27[1] = @"imageHeight";
    v28[0] = &off_1001499F0;
    v28[1] = &off_100149A00;
    v28[2] = &off_100149A00;
    v27[2] = @"imageWidth";
    v27[3] = @"nameLeading";
    UIFloorToViewScale();
    v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v28[3] = v3;
    v28[4] = &off_100149A10;
    v27[4] = @"nameTop";
    v27[5] = @"imageNameSpacing";
    UIFloorToViewScale();
    v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v28[5] = v4;
    v27[6] = @"leadingPadding";
    [(id)objc_opt_class() defaultInsets];
    v6 = +[NSNumber numberWithDouble:v5];
    v28[6] = v6;
    v27[7] = @"trailingPadding";
    [(SRGuideViewCell *)self chevronTrailingMargin];
    v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v28[7] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:8];

    uint64_t v9 = _NSDictionaryOfVariableBindings(@"_nameLabel, _tagPhraseLabel, _iconImageView", self->_nameLabel, self->_tagPhraseLabel, self->_iconImageView, 0);
    if ([(id)objc_opt_class() placesImageAboveText])
    {
      v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-leadingPadding-[_iconImageView(imageWidth)]", 0, v8, v9);
      [(SRGuideViewCell *)self addConstraints:v10];

      v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-leadingPadding-[_nameLabel]-trailingPadding-|", 0, v8, v9);
      [(SRGuideViewCell *)self addConstraints:v11];

      v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-leadingPadding-[_tagPhraseLabel]-trailingPadding-|", 0, v8, v9);
      [(SRGuideViewCell *)self addConstraints:v12];

      v13 = +[NSLayoutConstraint constraintWithItem:self->_iconImageView attribute:3 relatedBy:0 toItem:self attribute:3 multiplier:1.0 constant:11.0];
      [(SRGuideViewCell *)self addConstraint:v13];

      nameLabel = self->_nameLabel;
      iconImageView = self->_iconImageView;
      double v16 = 1.0;
      double v17 = 2.5;
      uint64_t v18 = 4;
    }
    else
    {
      v19 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-leadingPadding-[_iconImageView(imageWidth)]-imageNameSpacing-[_nameLabel]-trailingPadding-|", 0, v8, v9);
      [(SRGuideViewCell *)self addConstraints:v19];

      v20 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-leadingPadding-[_iconImageView(imageWidth)]-imageNameSpacing-[_tagPhraseLabel]-trailingPadding-|", 0, v8, v9);
      [(SRGuideViewCell *)self addConstraints:v20];

      double v21 = +[NSLayoutConstraint constraintWithItem:self->_nameLabel attribute:5 relatedBy:0 toItem:self->_tagPhraseLabel attribute:5 multiplier:1.0 constant:0.0];
      [(SRGuideViewCell *)self addConstraint:v21];

      double v22 = +[NSLayoutConstraint constraintWithItem:self->_iconImageView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
      [(SRGuideViewCell *)self addConstraint:v22];

      nameLabel = self->_nameLabel;
      double v16 = 1.0;
      double v17 = 19.0;
      iconImageView = self;
      uint64_t v18 = 3;
    }
    v23 = +[NSLayoutConstraint constraintWithItem:nameLabel attribute:3 relatedBy:0 toItem:iconImageView attribute:v18 multiplier:v16 constant:v17];
    [(SRGuideViewCell *)self addConstraint:v23];

    objc_super v24 = +[NSLayoutConstraint constraintWithItem:self->_tagPhraseLabel attribute:3 relatedBy:0 toItem:self->_nameLabel attribute:4 multiplier:1.0 constant:1.5];
    [(SRGuideViewCell *)self addConstraint:v24];

    v25 = +[NSLayoutConstraint constraintWithItem:self->_iconImageView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
    [(SRGuideViewCell *)self addConstraint:v25];

    self->_hasCreatedConstraints = 1;
  }
}

+ (double)heightOfCellWithName:(id)a3 tagPhrase:(id)a4 width:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 _allowsTextToWrap])
  {
    [a1 defaultInsets];
    double v11 = a5 - v10;
    [a1 chevronTrailingMargin];
    double v13 = v11 - v12;
    NSAttributedStringKey v33 = NSFontAttributeName;
    v14 = [a1 _nameLabelFont];
    v34 = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v8 boundingRectWithSize:1 options:v15 attributes:0 context:1.79769313e308];
    double v17 = v16 + 22.0;

    NSAttributedStringKey v31 = NSFontAttributeName;
    uint64_t v18 = [a1 _tagPhraseLabelFont];
    v32 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [v9 boundingRectWithSize:1 options:v19 attributes:0 context:1.79769313e308];
    double v21 = v17 + v20;
  }
  else
  {
    double v22 = +[UIApplication sharedApplication];
    v23 = [v22 preferredContentSizeCategory];
    uint64_t v24 = _UIContentSizeCategoryCompareToContentSizeCategory();

    if (v24 == 1)
    {
      v25 = [a1 _nameLabelFont];
      [v25 lineHeight];
      objc_super v26 = [a1 _tagPhraseLabelFont];
      [v26 lineHeight];

      v27 = +[UIFont siriui_mediumWeightBodySizeFont];
      [v27 lineHeight];
      v28 = +[UIFont siriui_lightWeightBodySubtextSizeFont];
      [v28 lineHeight];

      UIRoundToViewScale();
      double v21 = v29 + 80.0;
    }
    else
    {
      double v21 = 80.0;
    }
  }
  if ([a1 placesImageAboveText]) {
    double v21 = v21 + 42.5;
  }

  return v21;
}

+ (UIEdgeInsets)defaultInsets
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];

  double v3 = 0.0;
  double v4 = 24.0;
  double v5 = 0.0;
  double v6 = 24.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (BOOL)chevronBlendEffectEnabled
{
  return 1;
}

- (void)setIconImage:(id)a3
{
  double v4 = (UIImage *)[a3 copy];
  iconImage = self->_iconImage;
  self->_iconImage = v4;

  iconImageView = self->_iconImageView;
  v7 = self->_iconImage;

  [(UIImageView *)iconImageView setImage:v7];
}

- (void)setName:(id)a3
{
}

- (void)setTagPhrase:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tagPhrase
{
  return self->_tagPhrase;
}

- (NSString)aceId
{
  return self->_aceId;
}

- (void)setAceId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceId, 0);
  objc_storeStrong((id *)&self->_tagPhrase, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_tagPhraseLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end