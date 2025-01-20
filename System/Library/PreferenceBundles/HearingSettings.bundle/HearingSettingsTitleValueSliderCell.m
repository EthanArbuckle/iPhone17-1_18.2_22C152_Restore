@interface HearingSettingsTitleValueSliderCell
- (BOOL)isAccessibilityElement;
- (HearingSettingsTitleValueSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)sliderValue;
- (id)_accessibilityUserTestingChildren;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)control;
- (id)slider;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)sliderValueDidChange:(id)a3;
@end

@implementation HearingSettingsTitleValueSliderCell

- (HearingSettingsTitleValueSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v7 = a5;
  v54.receiver = self;
  v54.super_class = (Class)HearingSettingsTitleValueSliderCell;
  v8 = [(HearingSettingsTitleValueSliderCell *)&v54 initWithStyle:1 reuseIdentifier:a4 specifier:v7];
  v9 = v8;
  if (v8)
  {
    [(HearingSettingsTitleValueSliderCell *)v8 setShouldHideTitle:1];
    v10 = (HUITitleValueSlider *)[objc_alloc((Class)HUITitleValueSlider) initWithEffect:0];
    slider = v9->_slider;
    v9->_slider = v10;

    v12 = [(HUITitleValueSlider *)v9->_slider slider];
    [v12 setDrawsEndTicks:0];

    [(HUITitleValueSlider *)v9->_slider setIsAccessibilityElement:0];
    v13 = [(HUITitleValueSlider *)v9->_slider slider];
    [v13 setMinimumValue:0.0];

    v14 = [(HUITitleValueSlider *)v9->_slider slider];
    LODWORD(v15) = 1.0;
    [v14 setMaximumValue:v15];

    v16 = [(HUITitleValueSlider *)v9->_slider slider];
    [v16 setContinuous:1];

    v17 = [(HUITitleValueSlider *)v9->_slider slider];
    [v17 addTarget:v9 action:"sliderValueDidChange:" forControlEvents:4096];

    [(HUITitleValueSlider *)v9->_slider setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(HUITitleValueSlider *)v9->_slider slider];
    v19 = [v7 performGetter];
    [v19 doubleValue];
    *(float *)&double v20 = v20;
    [v18 setValue:v20];

    uint64_t v21 = +[UIColor systemGrayColor];
    v22 = +[UIImage _systemImageNamed:@"speaker.fill"];
    v53 = (void *)v21;
    v52 = [v22 imageWithTintColor:v21 renderingMode:1];

    v23 = +[UIImage _systemImageNamed:@"speaker.wave.3.fill"];
    v51 = [v23 imageWithTintColor:v21 renderingMode:1];

    v24 = [(HUITitleValueSlider *)v9->_slider slider];
    [v24 setMinimumValueImage:v52];

    v25 = [(HUITitleValueSlider *)v9->_slider slider];
    [v25 setMaximumValueImage:v51];

    v26 = [(HUITitleValueSlider *)v9->_slider titleLabel];
    v27 = [v7 name];
    [v26 setText:v27];

    v28 = +[UIColor systemGrayColor];
    v29 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout addingSymbolicTraits:0x8000 options:0];
    v30 = [(HUITitleValueSlider *)v9->_slider slider];
    [v30 setMinimumTrackTintColor:0];

    v31 = [(HUITitleValueSlider *)v9->_slider titleLabel];
    [v31 setTextColor:v28];

    v32 = [(HUITitleValueSlider *)v9->_slider valueLabel];
    [v32 setTextColor:v28];

    v33 = [(HUITitleValueSlider *)v9->_slider titleLabel];
    [v29 pointSize];
    v34 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v29);
    [v33 setFont:v34];

    v35 = [(HUITitleValueSlider *)v9->_slider valueLabel];
    [v29 pointSize];
    v36 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v29);
    [v35 setFont:v36];

    v37 = [(HUITitleValueSlider *)v9->_slider valueLabel];
    [v7 performGetter];
    v39 = id v38 = v7;
    [v39 doubleValue];
    v41 = +[NSNumber numberWithDouble:v40 * 100.0];
    v42 = AXFormatNumberWithOptions();
    [v37 setText:v42];

    v43 = [(HearingSettingsTitleValueSliderCell *)v9 contentView];
    [v43 addSubview:v9->_slider];

    v44 = [(HearingSettingsTitleValueSliderCell *)v9 contentView];
    v45 = _NSDictionaryOfVariableBindings(@"_slider", v9->_slider, 0);
    v46 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(8.0)-[_slider]-(8.0)-|", 0, 0, v45);
    [v44 addConstraints:v46];

    id v7 = v38;
    v47 = [(HearingSettingsTitleValueSliderCell *)v9 contentView];
    v48 = _NSDictionaryOfVariableBindings(@"_slider", v9->_slider, 0);
    v49 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[_slider]-|", 0, 0, v48);
    [v47 addConstraints:v49];
  }
  return v9;
}

- (id)_accessibilityUserTestingChildren
{
  slider = self->_slider;
  v2 = +[NSArray arrayWithObjects:&slider count:1];

  return v2;
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

- (void)sliderValueDidChange:(id)a3
{
  slider = self->_slider;
  id v5 = a3;
  v6 = [(HUITitleValueSlider *)slider valueLabel];
  [v5 value];
  *(float *)&double v8 = v7 * 100.0;
  v9 = +[NSNumber numberWithFloat:v8];
  v10 = AXFormatNumberWithOptions();
  [v6 setText:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  [v5 value];
  int v12 = v11;

  LODWORD(v13) = v12;
  v14 = +[NSNumber numberWithFloat:v13];
  [WeakRetained performSetterWithValue:v14];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier]);
  v3 = [WeakRetained name];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(HUITitleValueSlider *)self->_slider valueLabel];
  v3 = [v2 text];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return (unint64_t)[(HUITitleValueSlider *)self->_slider accessibilityTraits];
}

- (id)accessibilityHint
{
  return [(HUITitleValueSlider *)self->_slider accessibilityHint];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void).cxx_destruct
{
}

@end