@interface HearingSettingsValueSliderCell
+ (BOOL)shouldAppearAsListForWidth:(double)a3;
+ (id)valueLabels;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (HearingSettingsValueSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)sliderValue;
- (id)accessibilityHint;
- (id)control;
- (id)description;
- (id)slider;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)sliderValueDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation HearingSettingsValueSliderCell

+ (BOOL)shouldAppearAsListForWidth:(double)a3
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  id v5 = objc_alloc_init((Class)UILabel);
  v6 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
  [v5 setFont:v6];

  v7 = [(id)objc_opt_class() valueLabels];
  id v8 = [v7 count];

  uint64_t v20 = 0;
  v21 = (double *)&v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v9 = [a1 valueLabels];
  double v10 = (double)(unint64_t)v8;
  if (!v8) {
    double v10 = 3.0;
  }
  double v11 = a3 / v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1CDDC;
  v15[3] = &unk_3CD98;
  id v12 = v5;
  id v16 = v12;
  v17 = &v20;
  double v19 = v11;
  v18 = &v24;
  [v9 enumerateObjectsUsingBlock:v15];

  if (v21[3] >= a3)
  {
    char v13 = 1;
    *((unsigned char *)v25 + 24) = 1;
  }
  else
  {
    char v13 = *((unsigned char *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v13;
}

- (HearingSettingsValueSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v40.receiver = self;
  v40.super_class = (Class)HearingSettingsValueSliderCell;
  id v5 = [(HearingSettingsValueSliderCell *)&v40 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (PSSegmentableSlider *)objc_alloc_init((Class)PSSegmentableSlider);
    slider = v5->_slider;
    v5->_slider = v6;

    [(PSSegmentableSlider *)v5->_slider setIsAccessibilityElement:0];
    [(PSSegmentableSlider *)v5->_slider setMinimumValue:0.0];
    LODWORD(v8) = 1.0;
    [(PSSegmentableSlider *)v5->_slider setMaximumValue:v8];
    [(PSSegmentableSlider *)v5->_slider setContinuous:1];
    [(PSSegmentableSlider *)v5->_slider addTarget:v5 action:"sliderValueDidChange:" forControlEvents:4096];
    [(PSSegmentableSlider *)v5->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 0.5;
    [(PSSegmentableSlider *)v5->_slider setValue:v9];
    double v10 = [(HearingSettingsValueSliderCell *)v5 contentView];
    [v10 addSubview:v5->_slider];

    double v11 = [(id)objc_opt_class() valueLabels];
    if ([v11 count])
    {
      [(PSSegmentableSlider *)v5->_slider setSegmentCount:2];
      [(PSSegmentableSlider *)v5->_slider setSegmented:1];
      [(PSSegmentableSlider *)v5->_slider setLocksToSegment:0];
      id v12 = [v11 firstObject];
      char v13 = [v11 lastObject];
      if ((unint64_t)[v11 count] < 3)
      {
        v14 = 0;
      }
      else
      {
        v14 = [v11 objectAtIndex:1];
      }
      v18 = (UILabel *)objc_alloc_init((Class)UILabel);
      valueLeft = v5->_valueLeft;
      v5->_valueLeft = v18;

      uint64_t v20 = v5->_valueLeft;
      v21 = +[UIColor clearColor];
      [(UILabel *)v20 setBackgroundColor:v21];

      uint64_t v22 = v5->_valueLeft;
      uint64_t v23 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
      [(UILabel *)v22 setFont:v23];

      [(UILabel *)v5->_valueLeft setTextAlignment:0];
      [(UILabel *)v5->_valueLeft setText:v12];
      [(UILabel *)v5->_valueLeft setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v24 = [(HearingSettingsValueSliderCell *)v5 contentView];
      [v24 addSubview:v5->_valueLeft];

      if ((unint64_t)[v11 count] >= 3)
      {
        v25 = (UILabel *)objc_alloc_init((Class)UILabel);
        valueCenter = v5->_valueCenter;
        v5->_valueCenter = v25;

        char v27 = v5->_valueCenter;
        v28 = +[UIColor clearColor];
        [(UILabel *)v27 setBackgroundColor:v28];

        v29 = v5->_valueCenter;
        v30 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
        [(UILabel *)v29 setFont:v30];

        [(UILabel *)v5->_valueCenter setTextAlignment:1];
        [(UILabel *)v5->_valueCenter setText:v14];
        [(UILabel *)v5->_valueCenter setTranslatesAutoresizingMaskIntoConstraints:0];
        v31 = [(HearingSettingsValueSliderCell *)v5 contentView];
        [v31 addSubview:v5->_valueCenter];
      }
      v32 = (UILabel *)objc_alloc_init((Class)UILabel);
      valueRight = v5->_valueRight;
      v5->_valueRight = v32;

      v34 = v5->_valueRight;
      v35 = +[UIColor clearColor];
      [(UILabel *)v34 setBackgroundColor:v35];

      v36 = v5->_valueRight;
      v37 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody maximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
      [(UILabel *)v36 setFont:v37];

      [(UILabel *)v5->_valueRight setTextAlignment:2];
      [(UILabel *)v5->_valueRight setText:v13];
      [(UILabel *)v5->_valueRight setTranslatesAutoresizingMaskIntoConstraints:0];
      v38 = [(HearingSettingsValueSliderCell *)v5 contentView];
      [v38 addSubview:v5->_valueRight];

      [(HearingSettingsValueSliderCell *)v5 setNeedsUpdateConstraints];
    }
    else
    {
      v15 = [(HearingSettingsValueSliderCell *)v5 contentView];
      id v16 = _NSDictionaryOfVariableBindings(@"_slider", v5->_slider, 0);
      v17 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_slider]-|", 0, 0, v16);
      [v15 addConstraints:v17];

      id v12 = [(HearingSettingsValueSliderCell *)v5 contentView];
      char v13 = _NSDictionaryOfVariableBindings(@"_slider", v5->_slider, 0);
      v14 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_slider]-|", 0, 0, v13);
      [v12 addConstraints:v14];
    }
  }
  return v5;
}

- (id)slider
{
  return self->_slider;
}

- (id)control
{
  return self->_slider;
}

- (double)sliderValue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v3 = [WeakRetained performGetter];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

+ (id)valueLabels
{
  return &__NSArray0__struct;
}

- (void)sliderValueDidChange:(id)a3
{
  v3 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v4 value];
  int v6 = v5;

  LODWORD(v7) = v6;
  double v8 = +[NSNumber numberWithFloat:v7];
  [WeakRetained performSetterWithValue:v8];
}

- (void)updateConstraints
{
  v3 = [(id)objc_opt_class() valueLabels];
  if ([v3 count])
  {
    id v4 = [(HearingSettingsValueSliderCell *)self constraints];
    [(HearingSettingsValueSliderCell *)self removeConstraints:v4];

    v34.receiver = self;
    v34.super_class = (Class)HearingSettingsValueSliderCell;
    [(HearingSettingsValueSliderCell *)&v34 updateConstraints];
    if ([v3 count] == (char *)&dword_0 + 3
      || (int v5 = objc_opt_class(),
          [(HearingSettingsValueSliderCell *)self frame],
          [v5 shouldAppearAsListForWidth:CGRectGetWidth(v35)]))
    {
      int v6 = [(HearingSettingsValueSliderCell *)self contentView];
      double v7 = _NSDictionaryOfVariableBindings(@"_slider", self->_slider, 0);
      double v8 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_slider]-|", 0, 0, v7);
      [v6 addConstraints:v8];

      double v9 = [(HearingSettingsValueSliderCell *)self contentView];
      double v10 = _NSDictionaryOfVariableBindings(@"_valueLeft, _slider", self->_valueLeft, self->_slider, 0);
      double v11 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_valueLeft]-[_slider]-|", 0, 0, v10);
      [v9 addConstraints:v11];

      id v12 = [(HearingSettingsValueSliderCell *)self contentView];
      char v13 = +[NSLayoutConstraint constraintWithItem:self->_valueRight attribute:10 relatedBy:0 toItem:self->_valueLeft attribute:10 multiplier:1.0 constant:0.0];
      [v12 addConstraint:v13];

      valueCenter = self->_valueCenter;
      v15 = [(HearingSettingsValueSliderCell *)self contentView];
      if (valueCenter)
      {
        id v16 = self->_valueCenter;
        v17 = [(HearingSettingsValueSliderCell *)self contentView];
        v18 = +[NSLayoutConstraint constraintWithItem:v16 attribute:9 relatedBy:0 toItem:v17 attribute:9 multiplier:1.0 constant:0.0];
        [v15 addConstraint:v18];

        double v19 = [(HearingSettingsValueSliderCell *)self contentView];
        uint64_t v20 = +[NSLayoutConstraint constraintWithItem:self->_valueCenter attribute:10 relatedBy:0 toItem:self->_valueLeft attribute:10 multiplier:1.0 constant:0.0];
        [v19 addConstraint:v20];

        v15 = [(HearingSettingsValueSliderCell *)self contentView];
        v21 = _NSDictionaryOfVariableBindings(@"_valueLeft, _valueRight", self->_valueLeft, self->_valueRight, 0);
        CFStringRef v22 = @"H:|-[_valueLeft(100.0)]-[_valueRight(100.0)]-|";
      }
      else
      {
        v21 = _NSDictionaryOfVariableBindings(@"_valueLeft, _valueRight", self->_valueLeft, self->_valueRight, 0);
        CFStringRef v22 = @"H:|-[_valueLeft(150.0)]-[_valueRight(150.0)]-|";
      }
    }
    else
    {
      uint64_t v23 = [(HearingSettingsValueSliderCell *)self contentView];
      uint64_t v24 = _NSDictionaryOfVariableBindings(@"_valueLeft", self->_valueLeft, 0);
      v25 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_valueLeft]-|", 0, 0, v24);
      [v23 addConstraints:v25];

      uint64_t v26 = [(HearingSettingsValueSliderCell *)self contentView];
      char v27 = _NSDictionaryOfVariableBindings(@"_valueRight", self->_valueRight, 0);
      v28 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_valueRight]-|", 0, 0, v27);
      [v26 addConstraints:v28];

      v29 = [(HearingSettingsValueSliderCell *)self contentView];
      v30 = _NSDictionaryOfVariableBindings(@"_slider", self->_slider, 0);
      v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_slider]-|", 0, 0, v30);
      [v29 addConstraints:v31];

      v15 = [(HearingSettingsValueSliderCell *)self contentView];
      v21 = _NSDictionaryOfVariableBindings(@"_valueLeft, _slider, _valueRight", self->_valueLeft, self->_slider, self->_valueRight, 0);
      CFStringRef v22 = @"V:|-[_valueLeft]-[_slider]-[_valueRight]-|";
    }
    v32 = +[NSLayoutConstraint constraintsWithVisualFormat:v22 options:0 metrics:0 views:v21];
    [v15 addConstraints:v32];
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)HearingSettingsValueSliderCell;
    [(HearingSettingsValueSliderCell *)&v33 updateConstraints];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HearingSettingsValueSliderCell;
  [(HearingSettingsValueSliderCell *)&v4 layoutSubviews];
  [(HearingSettingsValueSliderCell *)self sliderValue];
  *(float *)&double v3 = v3;
  [(PSSegmentableSlider *)self->_slider setValue:v3];
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3 = (unint64_t)[(PSSegmentableSlider *)self->_slider accessibilityTraits];
  objc_super v4 = [(HearingSettingsValueSliderCell *)self specifier];
  int v5 = [v4 propertyForKey:PSEnabledKey];
  unsigned int v6 = [v5 BOOLValue];

  UIAccessibilityTraits v7 = UIAccessibilityTraitNotEnabled;
  if (v6) {
    UIAccessibilityTraits v7 = 0;
  }
  return v7 | v3;
}

- (id)accessibilityHint
{
  return [(PSSegmentableSlider *)self->_slider accessibilityHint];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (CGPoint)accessibilityActivationPoint
{
  [(PSSegmentableSlider *)self->_slider accessibilityActivationPoint];
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)description
{
  double v3 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = [WeakRetained propertyForKey:PSKeyNameKey];

  if (!v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    int v5 = [v6 propertyForKey:PSIDKey];
  }
  v12.receiver = self;
  v12.super_class = (Class)HearingSettingsValueSliderCell;
  UIAccessibilityTraits v7 = [(HearingSettingsValueSliderCell *)&v12 description];
  id v8 = objc_loadWeakRetained(v3);
  double v9 = [v8 userInfo];
  double v10 = +[NSString stringWithFormat:@"%@ (%@) - [%@]", v7, v5, v9];

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueRight, 0);
  objc_storeStrong((id *)&self->_valueCenter, 0);
  objc_storeStrong((id *)&self->_valueLeft, 0);

  objc_storeStrong((id *)&self->_slider, 0);
}

@end