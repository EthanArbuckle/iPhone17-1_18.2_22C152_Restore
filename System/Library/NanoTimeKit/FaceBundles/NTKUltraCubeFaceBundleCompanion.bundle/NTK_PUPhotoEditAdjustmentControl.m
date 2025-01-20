@interface NTK_PUPhotoEditAdjustmentControl
- (BOOL)_setContentPropertyKey:(id)a3 withValue:(id)a4 forState:(unint64_t)a5;
- (BOOL)displayMappedValue;
- (BOOL)shouldScaleDownImage;
- (BOOL)shouldShowCircularRing;
- (BOOL)shouldShowValueLabel;
- (BOOL)valueChanged;
- (NSMapTable)stateToContentMap;
- (NSNumberFormatter)formatter;
- (NTK_PUPhotoEditAdjustmentControl)initWithFrame:(CGRect)a3;
- (NTK_PUPhotoEditCircularIndicatorView)circularIndicatorView;
- (UIColor)alternateColor;
- (UIColor)defaultColor;
- (UIImageView)imageView;
- (UILabel)valueLabel;
- (double)defaultValue;
- (double)identityValue;
- (double)maxValue;
- (double)minValue;
- (double)value;
- (id)_contentForState:(unint64_t)a3;
- (id)_currentImage;
- (id)colorForState:(unint64_t)a3;
- (id)imageForState:(unint64_t)a3;
- (void)_layoutImageView;
- (void)_resetAllValues;
- (void)_setContent:(id)a3 forState:(unint64_t)a4;
- (void)_setup;
- (void)_setupImageView;
- (void)_updateFormatter;
- (void)_updateImageView;
- (void)_updateRingVisibility;
- (void)_updateSubviewColors;
- (void)_updateSubviewValues;
- (void)_updateSubviewVisibility;
- (void)_updateSubviews;
- (void)layoutSubviews;
- (void)resetToDefaults;
- (void)setAlternateColor:(id)a3;
- (void)setCircularIndicatorView:(id)a3;
- (void)setColor:(id)a3 forState:(unint64_t)a4;
- (void)setDefaultColor:(id)a3;
- (void)setDefaultValue:(double)a3;
- (void)setDisplayMappedValue:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFormatter:(id)a3;
- (void)setIdentityValue:(double)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setImageView:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShouldScaleDownImage:(BOOL)a3;
- (void)setShouldShowCircularRing:(BOOL)a3;
- (void)setShouldShowValueLabel:(BOOL)a3;
- (void)setStateToContentMap:(id)a3;
- (void)setValue:(double)a3;
- (void)setValueChanged:(BOOL)a3;
- (void)setValueLabel:(id)a3;
@end

@implementation NTK_PUPhotoEditAdjustmentControl

- (NTK_PUPhotoEditAdjustmentControl)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTK_PUPhotoEditAdjustmentControl;
  v3 = -[NTK_PUPhotoEditAdjustmentControl initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_minValue = -1.0;
    v3->_maxValue = 1.0;
    v3->_value = 0.0;
    v3->_defaultValue = 0.0;
    v3->_identityValue = 0.0;
    [(NTK_PUPhotoEditAdjustmentControl *)v3 _setup];
    [(NTK_PUPhotoEditAdjustmentControl *)v4 setContentMode:3];
  }
  return v4;
}

- (void)_setup
{
  v3 = +[UIColor whiteColor];
  defaultColor = self->_defaultColor;
  self->_defaultColor = v3;

  v5 = +[UIColor systemYellowColor];
  alternateColor = self->_alternateColor;
  self->_alternateColor = v5;

  v7 = [NTK_PUPhotoEditCircularIndicatorView alloc];
  [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
  v8 = -[NTK_PUPhotoEditCircularIndicatorView initWithFrame:](v7, "initWithFrame:");
  circularIndicatorView = self->_circularIndicatorView;
  self->_circularIndicatorView = v8;

  [(NTK_PUPhotoEditCircularIndicatorView *)self->_circularIndicatorView setRingColor:self->_defaultColor];
  [(NTK_PUPhotoEditCircularIndicatorView *)self->_circularIndicatorView setUserInteractionEnabled:0];
  [(NTK_PUPhotoEditAdjustmentControl *)self addSubview:self->_circularIndicatorView];
  id v10 = objc_alloc((Class)UILabel);
  [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
  v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:");
  valueLabel = self->_valueLabel;
  self->_valueLabel = v11;

  id v19 = +[NTK_PUPhotoEditSupport photoEditStylisticFontForSize:13.0];
  [(UILabel *)self->_valueLabel setFont:v19];
  [(UILabel *)self->_valueLabel setTextAlignment:1];
  [(UILabel *)self->_valueLabel setTextColor:self->_defaultColor];
  v13 = +[NSLocale currentLocale];
  v14 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
  formatter = self->_formatter;
  self->_formatter = v14;

  [(NSNumberFormatter *)self->_formatter setLocale:v13];
  [(NSNumberFormatter *)self->_formatter setMultiplier:&off_4B770];
  [(NSNumberFormatter *)self->_formatter setRoundingMode:4];
  v16 = self->_formatter;
  v17 = +[NSNumber numberWithDouble:self->_value];
  v18 = [(NSNumberFormatter *)v16 stringFromNumber:v17];
  [(UILabel *)self->_valueLabel setText:v18];

  [(UILabel *)self->_valueLabel setAlpha:0.0];
  [(NTK_PUPhotoEditAdjustmentControl *)self addSubview:self->_valueLabel];
  self->_shouldShowCircularRing = 1;
  self->_shouldScaleDownImage = 1;
  self->_displayMappedValue = 1;
}

- (void)_resetAllValues
{
  [(NTK_PUPhotoEditAdjustmentControl *)self setValue:0.0];
  self->_minValue = -1.0;
  self->_maxValue = 1.0;
  self->_defaultValue = 0.0;
  self->_identityValue = 0.0;
  defaultColor = self->_defaultColor;
  id v4 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v4 setRingColor:defaultColor];
}

- (void)resetToDefaults
{
  v3 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v3 resetToDefaults];

  [(NTK_PUPhotoEditAdjustmentControl *)self _resetAllValues];
}

- (void)_setupImageView
{
  if (!self->_imageView)
  {
    [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
    double v4 = v3;
    [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
    objc_super v6 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v4, v5);
    imageView = self->_imageView;
    self->_imageView = v6;

    [(UIImageView *)self->_imageView setUserInteractionEnabled:0];
    [(UIImageView *)self->_imageView setContentMode:4];
    [(UIImageView *)self->_imageView setTintColor:self->_defaultColor];
    v8 = self->_imageView;
    valueLabel = self->_valueLabel;
    [(NTK_PUPhotoEditAdjustmentControl *)self insertSubview:v8 belowSubview:valueLabel];
  }
}

- (void)_layoutImageView
{
  imageView = self->_imageView;
  if (imageView && ([(UIImageView *)imageView isHidden] & 1) == 0)
  {
    [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
    double v5 = v4;
    [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
    -[UIImageView setFrame:](self->_imageView, "setFrame:", 0.0, 0.0, v5);
    [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
    PXRectGetCenter();
    double v7 = v6;
    double v9 = v8;
    id v10 = [(NTK_PUPhotoEditAdjustmentControl *)self imageView];
    objc_msgSend(v10, "setCenter:", v7, v9);
  }
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)NTK_PUPhotoEditAdjustmentControl;
  [(NTK_PUPhotoEditAdjustmentControl *)&v21 layoutSubviews];
  [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(NTK_PUPhotoEditAdjustmentControl *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(NTK_PUPhotoEditAdjustmentControl *)self valueLabel];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(NTK_PUPhotoEditAdjustmentControl *)self _updateImageView];
  [(NTK_PUPhotoEditAdjustmentControl *)self _layoutImageView];
  [(NTK_PUPhotoEditAdjustmentControl *)self _updateRingVisibility];
}

- (void)_setContent:(id)a3 forState:(unint64_t)a4
{
  id v10 = a3;
  if (!self->_stateToContentMap)
  {
    double v6 = +[NSMapTable weakToStrongObjectsMapTable];
    stateToContentMap = self->_stateToContentMap;
    self->_stateToContentMap = v6;
  }
  double v8 = [(NTK_PUPhotoEditAdjustmentControl *)self stateToContentMap];
  double v9 = +[NSNumber numberWithUnsignedInteger:a4];
  if (v10) {
    [v8 setObject:v10 forKey:v9];
  }
  else {
    [v8 removeObjectForKey:v9];
  }
}

- (id)_contentForState:(unint64_t)a3
{
  if (self->_stateToContentMap)
  {
    double v4 = [(NTK_PUPhotoEditAdjustmentControl *)self stateToContentMap];
    double v5 = +[NSNumber numberWithUnsignedInteger:a3];
    double v6 = [v4 objectForKey:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (BOOL)_setContentPropertyKey:(id)a3 withValue:(id)a4 forState:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NTK_PUPhotoEditAdjustmentControl *)self _contentForState:a5];
  if (!v10)
  {
    id v10 = objc_alloc_init(NTK_PUPhotoEditAdjustmentControlContent);
    [(NTK_PUPhotoEditAdjustmentControl *)self _setContent:v10 forState:a5];
  }
  id v11 = [(NTK_PUPhotoEditAdjustmentControlContent *)v10 valueForKey:v8];
  if (v11 == v9) {
    LOBYTE(v12) = 0;
  }
  else {
    unsigned int v12 = [v9 isEqual:v11] ^ 1;
  }
  [(NTK_PUPhotoEditAdjustmentControlContent *)v10 setValue:v9 forKey:v8];

  return v12;
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  if ([(NTK_PUPhotoEditAdjustmentControl *)self _setContentPropertyKey:@"image" withValue:a3 forState:a4])
  {
    [(NTK_PUPhotoEditAdjustmentControl *)self _updateImageView];
  }
}

- (id)imageForState:(unint64_t)a3
{
  double v4 = [(NTK_PUPhotoEditAdjustmentControl *)self _contentForState:a3];
  double v5 = [v4 image];

  if (!v5)
  {
    double v6 = [(NTK_PUPhotoEditAdjustmentControl *)self _contentForState:0];
    double v5 = [v6 image];
  }

  return v5;
}

- (void)setColor:(id)a3 forState:(unint64_t)a4
{
}

- (id)colorForState:(unint64_t)a3
{
  double v4 = [(NTK_PUPhotoEditAdjustmentControl *)self _contentForState:a3];
  double v5 = [v4 color];

  if (!v5)
  {
    double v6 = [(NTK_PUPhotoEditAdjustmentControl *)self _contentForState:0];
    double v5 = [v6 color];
  }

  return v5;
}

- (id)_currentImage
{
  id v3 = [(NTK_PUPhotoEditAdjustmentControl *)self state];

  return [(NTK_PUPhotoEditAdjustmentControl *)self imageForState:v3];
}

- (void)setDefaultColor:(id)a3
{
  double v5 = (UIColor *)a3;
  p_defaultColor = &self->_defaultColor;
  if (self->_defaultColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_defaultColor, a3);
    p_defaultColor = (UIColor **)[(NTK_PUPhotoEditAdjustmentControl *)self _updateSubviewColors];
    double v5 = v7;
  }

  _objc_release_x1(p_defaultColor, v5);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTK_PUPhotoEditAdjustmentControl *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTK_PUPhotoEditAdjustmentControl;
    [(NTK_PUPhotoEditAdjustmentControl *)&v5 setSelected:v3];
    [(NTK_PUPhotoEditAdjustmentControl *)self setNeedsLayout];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NTK_PUPhotoEditAdjustmentControl *)self isEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTK_PUPhotoEditAdjustmentControl;
    [(NTK_PUPhotoEditAdjustmentControl *)&v5 setEnabled:v3];
    [(NTK_PUPhotoEditAdjustmentControl *)self setNeedsLayout];
  }
}

- (void)setValue:(double)a3
{
  if (self->_value != a3)
  {
    [(NTK_PUPhotoEditAdjustmentControl *)self minValue];
    [(NTK_PUPhotoEditAdjustmentControl *)self maxValue];
    PXClamp();
    self->_value = v4;
    [(NTK_PUPhotoEditAdjustmentControl *)self _updateSubviews];
  }
}

- (void)setShouldShowValueLabel:(BOOL)a3
{
  if (self->_shouldShowValueLabel != a3)
  {
    self->_shouldShowValueLabel = a3;
    [(NTK_PUPhotoEditAdjustmentControl *)self _updateSubviewVisibility];
  }
}

- (void)setDisplayMappedValue:(BOOL)a3
{
  if (self->_displayMappedValue != a3)
  {
    self->_displayMappedValue = a3;
    [(NTK_PUPhotoEditAdjustmentControl *)self _updateFormatter];
  }
}

- (void)setShouldShowCircularRing:(BOOL)a3
{
  if (self->_shouldShowCircularRing != a3)
  {
    self->_shouldShowCircularRing = a3;
    [(NTK_PUPhotoEditAdjustmentControl *)self _updateRingVisibility];
  }
}

- (void)_updateImageView
{
  uint64_t v3 = [(NTK_PUPhotoEditAdjustmentControl *)self imageForState:[(NTK_PUPhotoEditAdjustmentControl *)self state]];
  id v5 = (id)v3;
  if (v3)
  {
    [(NTK_PUPhotoEditAdjustmentControl *)self _setupImageView];
    p_imageView = &self->_imageView;
    [(UIImageView *)*p_imageView setImage:v5];
    uint64_t v3 = (uint64_t)v5;
  }
  else
  {
    p_imageView = &self->_imageView;
  }
  [(UIImageView *)*p_imageView setHidden:v3 == 0];
}

- (void)_updateRingVisibility
{
  if ([(NTK_PUPhotoEditAdjustmentControl *)self shouldShowCircularRing]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v4 setAlpha:v3];
}

- (void)_updateSubviewVisibility
{
  if ([(NTK_PUPhotoEditAdjustmentControl *)self shouldShowValueLabel]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  id v4 = [(NTK_PUPhotoEditAdjustmentControl *)self imageView];
  [v4 setAlpha:v3];

  if ([(NTK_PUPhotoEditAdjustmentControl *)self shouldShowValueLabel]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  id v6 = [(NTK_PUPhotoEditAdjustmentControl *)self valueLabel];
  [v6 setAlpha:v5];
}

- (void)_updateSubviews
{
  [(NTK_PUPhotoEditAdjustmentControl *)self _updateSubviewValues];

  [(NTK_PUPhotoEditAdjustmentControl *)self _updateSubviewColors];
}

- (void)_updateSubviewColors
{
  double v3 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v3 currentValue];
  double v5 = v4;

  if (v5 <= 0.0)
  {
    defaultColor = self->_defaultColor;
    double v7 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
    [v7 setRingColor:defaultColor];
  }
  else
  {
    alternateColor = self->_alternateColor;
    double v7 = [(NTK_PUPhotoEditAdjustmentControl *)self traitCollection];
    id v8 = [(UIColor *)alternateColor resolvedColorWithTraitCollection:v7];
    id v9 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
    [v9 setRingColor:v8];
  }
  [(UIImageView *)self->_imageView setTintColor:self->_defaultColor];
  id v13 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  id v11 = [v13 ringColor];
  unsigned int v12 = [(NTK_PUPhotoEditAdjustmentControl *)self valueLabel];
  [v12 setTextColor:v11];
}

- (void)_updateFormatter
{
  if ([(NTK_PUPhotoEditAdjustmentControl *)self displayMappedValue]) {
    double v3 = &off_4B770;
  }
  else {
    double v3 = &off_4B788;
  }
  id v4 = [(NTK_PUPhotoEditAdjustmentControl *)self formatter];
  [v4 setMultiplier:v3];
}

- (void)_updateSubviewValues
{
  [(NTK_PUPhotoEditAdjustmentControl *)self minValue];
  double v4 = v3;
  [(NTK_PUPhotoEditAdjustmentControl *)self identityValue];
  double v5 = 0.0;
  if (v4 < v6)
  {
    double v7 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
    [v7 minValue];
    double v5 = v8;
  }
  [(NTK_PUPhotoEditAdjustmentControl *)self value];
  double v10 = v9;
  [(NTK_PUPhotoEditAdjustmentControl *)self minValue];
  double v12 = v11;
  [(NTK_PUPhotoEditAdjustmentControl *)self identityValue];
  double v14 = v13;
  [(NTK_PUPhotoEditAdjustmentControl *)self maxValue];
  double v16 = v15;
  double v17 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v17 maxValue];
  if (v16 > v12)
  {
    if (v10 >= v14)
    {
      if (v16 > v14)
      {
        double v19 = (v10 - v14) * v18 / (v16 - v14) + 0.0;
        goto LABEL_10;
      }
    }
    else if (v14 > v12)
    {
      double v19 = v5 + (0.0 - v5) * (v10 - v12) / (v14 - v12);
      goto LABEL_10;
    }
  }
  double v19 = 2.22507386e-308;
LABEL_10:

  if (round(v19 * 100.0) / 100.0 == 0.0) {
    double v19 = 0.0;
  }
  v20 = [(NTK_PUPhotoEditAdjustmentControl *)self circularIndicatorView];
  [v20 setCurrentValue:v19];

  if (![(NTK_PUPhotoEditAdjustmentControl *)self displayMappedValue])
  {
    [(NTK_PUPhotoEditAdjustmentControl *)self value];
    double v19 = v21;
  }
  formatter = self->_formatter;
  id v25 = +[NSNumber numberWithDouble:v19];
  v23 = [(NSNumberFormatter *)formatter stringFromNumber:v25];
  v24 = [(NTK_PUPhotoEditAdjustmentControl *)self valueLabel];
  [v24 setText:v23];
}

- (double)value
{
  return self->_value;
}

- (double)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(double)a3
{
  self->_defaultValue = a3;
}

- (double)identityValue
{
  return self->_identityValue;
}

- (void)setIdentityValue:(double)a3
{
  self->_identityValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (BOOL)shouldShowValueLabel
{
  return self->_shouldShowValueLabel;
}

- (BOOL)displayMappedValue
{
  return self->_displayMappedValue;
}

- (BOOL)shouldShowCircularRing
{
  return self->_shouldShowCircularRing;
}

- (UIColor)defaultColor
{
  return self->_defaultColor;
}

- (UIColor)alternateColor
{
  return self->_alternateColor;
}

- (void)setAlternateColor:(id)a3
{
}

- (BOOL)shouldScaleDownImage
{
  return self->_shouldScaleDownImage;
}

- (void)setShouldScaleDownImage:(BOOL)a3
{
  self->_shouldScaleDownImage = a3;
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NTK_PUPhotoEditCircularIndicatorView)circularIndicatorView
{
  return self->_circularIndicatorView;
}

- (void)setCircularIndicatorView:(id)a3
{
}

- (NSMapTable)stateToContentMap
{
  return self->_stateToContentMap;
}

- (void)setStateToContentMap:(id)a3
{
}

- (BOOL)valueChanged
{
  return self->_valueChanged;
}

- (void)setValueChanged:(BOOL)a3
{
  self->_valueChanged = a3;
}

- (NSNumberFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_stateToContentMap, 0);
  objc_storeStrong((id *)&self->_circularIndicatorView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_alternateColor, 0);

  objc_storeStrong((id *)&self->_defaultColor, 0);
}

@end