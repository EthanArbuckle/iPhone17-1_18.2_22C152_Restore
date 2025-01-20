@interface SoundActionsPracticeCardCollectionViewCell
+ (double)desiredHeightForData:(id)a3 givenWidth:(double)a4;
+ (id)_labelWithFont:(id)a3 numerOfLines:(int)a4;
+ (id)_nameFont;
+ (id)_tipFont;
- (SoundActionData)soundActionData;
- (SoundActionsPracticeCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)_setupBackgroundView;
- (void)_setupLabels;
- (void)prepareForReuse;
- (void)setSoundActionData:(id)a3;
@end

@implementation SoundActionsPracticeCardCollectionViewCell

- (SoundActionsPracticeCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SoundActionsPracticeCardCollectionViewCell;
  v3 = -[SoundActionsPracticeCardCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SoundActionsPracticeCardCollectionViewCell *)v3 _setupBackgroundView];
    [(SoundActionsPracticeCardCollectionViewCell *)v4 _setupLabels];
  }
  return v4;
}

- (void)setSoundActionData:(id)a3
{
  p_soundActionData = &self->_soundActionData;
  objc_storeStrong((id *)&self->_soundActionData, a3);
  id v6 = a3;
  v7 = [(SoundActionData *)*p_soundActionData tip];
  [(UILabel *)self->_tipLabel setText:v7];

  id v8 = [(SoundActionData *)*p_soundActionData name];
  [(UILabel *)self->_nameLabel setText:v8];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)SoundActionsPracticeCardCollectionViewCell;
  [(SoundActionsPracticeCardCollectionViewCell *)&v4 prepareForReuse];
  v3 = [(UIView *)self->_backgroundView layer];
  [v3 setCornerRadius:10.0];
}

+ (id)_nameFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleHeadline maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
}

+ (id)_tipFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
}

+ (double)desiredHeightForData:(id)a3 givenWidth:(double)a4
{
  NSAttributedStringKey v20 = NSFontAttributeName;
  id v5 = a3;
  id v6 = +[SoundActionsPracticeCardCollectionViewCell _nameFont];
  v21 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  NSAttributedStringKey v18 = NSFontAttributeName;
  id v8 = +[SoundActionsPracticeCardCollectionViewCell _tipFont];
  v19 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

  double v10 = a4 + -40.0 + -24.0;
  v11 = [v5 name];
  objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v7, 0, v10, 1.79769313e308);
  double v13 = v12;

  v14 = [v5 tip];

  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v9, 0, v10, 1.79769313e308);
  double v16 = v15;

  return ceil(v13) + ceil(v16) + 32.0;
}

- (void)_setupBackgroundView
{
  if (!self->_backgroundView)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v3;

    id v5 = +[UIColor secondarySystemBackgroundColor];
    [(UIView *)self->_backgroundView setBackgroundColor:v5];

    [(UIView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(UIView *)self->_backgroundView layer];
    [v6 setCornerRadius:10.0];

    v7 = [(UIView *)self->_backgroundView layer];
    [v7 setMasksToBounds:1];

    id v8 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    [v8 addSubview:self->_backgroundView];

    v9 = self->_backgroundView;
    v21 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    double v10 = +[NSLayoutConstraint constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v21 attribute:3 multiplier:1.0 constant:0.0];
    v22[0] = v10;
    v11 = self->_backgroundView;
    double v12 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    double v13 = +[NSLayoutConstraint constraintWithItem:v11 attribute:4 relatedBy:0 toItem:v12 attribute:4 multiplier:1.0 constant:0.0];
    v22[1] = v13;
    v14 = self->_backgroundView;
    double v15 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    double v16 = +[NSLayoutConstraint constraintWithItem:v14 attribute:5 relatedBy:0 toItem:v15 attribute:5 multiplier:1.0 constant:20.0];
    v22[2] = v16;
    v17 = self->_backgroundView;
    NSAttributedStringKey v18 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:-20.0];
    v22[3] = v19;
    NSAttributedStringKey v20 = +[NSArray arrayWithObjects:v22 count:4];
    +[NSLayoutConstraint activateConstraints:v20];
  }
}

- (void)_setupLabels
{
  if (!self->_nameLabel && !self->_tipLabel)
  {
    v3 = objc_opt_class();
    objc_super v4 = [v3 _nameFont];
    id v5 = [v3 _labelWithFont:v4 numerOfLines:1];
    nameLabel = self->_nameLabel;
    self->_nameLabel = v5;

    v7 = [v3 _tipFont];
    id v8 = [v3 _labelWithFont:v7 numerOfLines:0];
    tipLabel = self->_tipLabel;
    self->_tipLabel = v8;

    [(UILabel *)self->_nameLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_tipLabel setAdjustsFontForContentSizeCategory:1];
    double v10 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    [v10 addSubview:self->_nameLabel];

    v11 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    [v11 addSubview:self->_tipLabel];

    double v12 = self->_nameLabel;
    v32 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    double v13 = +[NSLayoutConstraint constraintWithItem:v12 attribute:3 relatedBy:0 toItem:v32 attribute:3 multiplier:1.0 constant:16.0];
    v34[0] = v13;
    v14 = self->_nameLabel;
    double v15 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    double v16 = +[NSLayoutConstraint constraintWithItem:v14 attribute:5 relatedBy:0 toItem:v15 attribute:5 multiplier:1.0 constant:32.0];
    v34[1] = v16;
    v17 = self->_nameLabel;
    NSAttributedStringKey v18 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:-32.0];
    v34[2] = v19;
    NSAttributedStringKey v20 = +[NSArray arrayWithObjects:v34 count:3];
    +[NSLayoutConstraint activateConstraints:v20];

    v21 = +[NSLayoutConstraint constraintWithItem:self->_tipLabel attribute:3 relatedBy:0 toItem:self->_nameLabel attribute:4 multiplier:1.0 constant:0.0];
    v33[0] = v21;
    v22 = self->_tipLabel;
    v23 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    v24 = +[NSLayoutConstraint constraintWithItem:v22 attribute:5 relatedBy:0 toItem:v23 attribute:5 multiplier:1.0 constant:32.0];
    v33[1] = v24;
    v25 = self->_tipLabel;
    v26 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    v27 = +[NSLayoutConstraint constraintWithItem:v25 attribute:6 relatedBy:0 toItem:v26 attribute:6 multiplier:1.0 constant:-32.0];
    v33[2] = v27;
    v28 = self->_tipLabel;
    v29 = [(SoundActionsPracticeCardCollectionViewCell *)self contentView];
    v30 = +[NSLayoutConstraint constraintWithItem:v28 attribute:4 relatedBy:-1 toItem:v29 attribute:4 multiplier:1.0 constant:-16.0];
    v33[3] = v30;
    v31 = +[NSArray arrayWithObjects:v33 count:4];
    +[NSLayoutConstraint activateConstraints:v31];
  }
}

+ (id)_labelWithFont:(id)a3 numerOfLines:(int)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)UILabel);
  [v6 setFont:v5];

  [v6 setNumberOfLines:a4];
  [v6 setAdjustsFontForContentSizeCategory:1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v6;
}

- (SoundActionData)soundActionData
{
  return self->_soundActionData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundActionData, 0);
  objc_storeStrong((id *)&self->_tipLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end