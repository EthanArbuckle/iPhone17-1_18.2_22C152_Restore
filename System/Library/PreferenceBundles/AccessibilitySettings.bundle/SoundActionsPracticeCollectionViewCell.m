@interface SoundActionsPracticeCollectionViewCell
+ (BOOL)willTruncateForCellWidth:(double)a3 withText:(id)a4;
+ (double)_horizontalPadding;
+ (double)verticalPadding;
+ (id)_colorHighlighted:(BOOL)a3 background:(BOOL)a4;
+ (id)font;
- (NSString)text;
- (SoundActionsPracticeCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (void)_configureCell;
- (void)prepareForReuse;
- (void)setCornerRadius:(double)a3;
- (void)setDetected:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation SoundActionsPracticeCollectionViewCell

- (SoundActionsPracticeCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SoundActionsPracticeCollectionViewCell;
  v3 = -[SoundActionsPracticeCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SoundActionsPracticeCollectionViewCell *)v3 _configureCell];
  }
  return v4;
}

+ (id)font
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody variant:1024];
}

+ (double)verticalPadding
{
  return 14.0;
}

+ (BOOL)willTruncateForCellWidth:(double)a3 withText:(id)a4
{
  NSAttributedStringKey v12 = NSFontAttributeName;
  id v5 = a4;
  objc_super v6 = +[SoundActionsPracticeCollectionViewCell font];
  v13 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v7, 0, 1.79769313e308, 1.79769313e308);
  double v9 = v8;

  +[SoundActionsPracticeCollectionViewCell _horizontalPadding];
  LOBYTE(v6) = v9 + v10 * 2.0 >= a3;

  return (char)v6;
}

+ (double)_horizontalPadding
{
  return 14.0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SoundActionsPracticeCollectionViewCell;
  [(SoundActionsPracticeCollectionViewCell *)&v3 prepareForReuse];
  [(SoundActionsPracticeCollectionViewCell *)self _configureCell];
}

- (void)setDetected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SoundActionsPracticeCollectionViewCell _colorHighlighted:a3 background:1];
  id v6 = [v5 cgColor];
  v7 = [(SoundActionsPracticeCollectionViewCell *)self layer];
  [v7 setBackgroundColor:v6];

  id v8 = +[SoundActionsPracticeCollectionViewCell _colorHighlighted:v3 background:0];
  [(UILabel *)self->_nameLabel setTextColor:v8];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SoundActionsPracticeCollectionViewCell;
  -[SoundActionsPracticeCollectionViewCell setSelected:](&v6, "setSelected:");
  double v5 = 1.0;
  if (v3) {
    double v5 = 0.5;
  }
  [(SoundActionsPracticeCollectionViewCell *)self setAlpha:v5];
}

+ (id)_colorHighlighted:(BOOL)a3 background:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3) {
    +[UIColor systemGreenColor];
  }
  else {
  double v5 = +[UIColor systemBlueColor];
  }
  objc_super v6 = v5;
  double v7 = 0.16;
  if (!v4) {
    double v7 = 1.0;
  }
  id v8 = [v5 colorWithAlphaComponent:v7];

  return v8;
}

- (void)_configureCell
{
  BOOL v3 = +[SoundActionsPracticeCollectionViewCell _colorHighlighted:0 background:1];
  id v4 = [v3 cgColor];
  double v5 = [(SoundActionsPracticeCollectionViewCell *)self layer];
  [v5 setBackgroundColor:v4];

  [(SoundActionsPracticeCollectionViewCell *)self setClipsToBounds:1];
  if (!self->_nameLabel)
  {
    objc_super v6 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    nameLabel = self->_nameLabel;
    self->_nameLabel = v6;

    [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = +[SoundActionsPracticeCollectionViewCell _colorHighlighted:0 background:0];
    [(UILabel *)self->_nameLabel setTextColor:v8];

    double v9 = +[UIColor clearColor];
    [(UILabel *)self->_nameLabel setBackgroundColor:v9];

    double v10 = +[SoundActionsPracticeCollectionViewCell font];
    [(UILabel *)self->_nameLabel setFont:v10];

    [(UILabel *)self->_nameLabel setNumberOfLines:1];
    [(UILabel *)self->_nameLabel setTextAlignment:1];
    [(UILabel *)self->_nameLabel setAdjustsFontForContentSizeCategory:1];
    v11 = [(SoundActionsPracticeCollectionViewCell *)self contentView];
    [v11 addSubview:self->_nameLabel];

    v26 = +[NSLayoutConstraint constraintWithItem:self->_nameLabel attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    v27[0] = v26;
    NSAttributedStringKey v12 = +[NSLayoutConstraint constraintWithItem:self->_nameLabel attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    v27[1] = v12;
    v13 = self->_nameLabel;
    +[SoundActionsPracticeCollectionViewCell verticalPadding];
    v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:3 relatedBy:1 toItem:self attribute:3 multiplier:1.0 constant:v14];
    v27[2] = v15;
    v16 = self->_nameLabel;
    +[SoundActionsPracticeCollectionViewCell verticalPadding];
    v18 = +[NSLayoutConstraint constraintWithItem:v16 attribute:4 relatedBy:-1 toItem:self attribute:4 multiplier:1.0 constant:-v17];
    v27[3] = v18;
    v19 = self->_nameLabel;
    +[SoundActionsPracticeCollectionViewCell _horizontalPadding];
    v21 = +[NSLayoutConstraint constraintWithItem:v19 attribute:5 relatedBy:1 toItem:self attribute:5 multiplier:1.0 constant:v20];
    v27[4] = v21;
    v22 = self->_nameLabel;
    +[SoundActionsPracticeCollectionViewCell _horizontalPadding];
    v24 = +[NSLayoutConstraint constraintWithItem:v22 attribute:6 relatedBy:1 toItem:self attribute:6 multiplier:1.0 constant:-v23];
    v27[5] = v24;
    v25 = +[NSArray arrayWithObjects:v27 count:6];
    +[NSLayoutConstraint activateConstraints:v25];
  }
  [(SoundActionsPracticeCollectionViewCell *)self setIsAccessibilityElement:1];
}

- (void)setText:(id)a3
{
  nameLabel = self->_nameLabel;
  id v5 = a3;
  [(UILabel *)nameLabel setText:v5];
  [(SoundActionsPracticeCollectionViewCell *)self setAccessibilityLabel:v5];
}

- (NSString)text
{
  return [(UILabel *)self->_nameLabel text];
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(SoundActionsPracticeCollectionViewCell *)self layer];
  [v4 setCornerRadius:a3];
}

- (double)cornerRadius
{
  v2 = [(SoundActionsPracticeCollectionViewCell *)self layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
}

@end