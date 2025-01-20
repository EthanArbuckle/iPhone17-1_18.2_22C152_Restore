@interface AXSensitivitySliderCell
+ (id)specifierWithSensitivityNames:(id)a3 minimumValue:(float)a4 maximumValue:(float)a5 target:(id)a6 set:(SEL)a7 get:(SEL)a8;
- (AXSensitivitySliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityValue;
- (int64_t)_sliderLevel;
- (int64_t)_sliderLevelForValue:(float)a3;
- (int64_t)sensitivitySliderLevel;
- (void)_accessibilityIncrementOrDecrement:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setSensitivitySliderLevel:(int64_t)a3;
- (void)setSpecifier:(id)a3;
@end

@implementation AXSensitivitySliderCell

+ (id)specifierWithSensitivityNames:(id)a3 minimumValue:(float)a4 maximumValue:(float)a5 target:(id)a6 set:(SEL)a7 get:(SEL)a8
{
  id v13 = a3;
  id v14 = a6;
  v15 = +[PSSpecifier preferenceSpecifierNamed:0 target:v14 set:a7 get:a8 detail:0 cell:5 edit:0];
  [v15 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v15 setProperty:&__kCFBooleanTrue forKey:PSSliderIsSegmented];
  [v15 setProperty:&off_229A98 forKey:PSSliderSegmentCount];
  [v15 setProperty:&__kCFBooleanFalse forKey:PSSliderIsContinuous];
  id v16 = [v14 performSelector:a8 withObject:v15];

  [v15 setProperty:v16 forKey:PSValueKey];
  *(float *)&double v17 = a4;
  v18 = +[NSNumber numberWithFloat:v17];
  [v15 setProperty:v18 forKey:PSControlMinimumKey];

  *(float *)&double v19 = a5;
  v20 = +[NSNumber numberWithFloat:v19];
  [v15 setProperty:v20 forKey:PSControlMaximumKey];

  if ([v13 count] != (char *)&dword_0 + 3)
  {
    id v22 = v13;
    _AXAssert();
  }
  objc_msgSend(v15, "setProperty:forKey:", v13, @"SensitivityNames", v22);

  return v15;
}

- (AXSensitivitySliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v76.receiver = self;
  v76.super_class = (Class)AXSensitivitySliderCell;
  id v70 = a4;
  id v71 = a5;
  v7 = -[AXSensitivitySliderCell initWithStyle:reuseIdentifier:specifier:](&v76, "initWithStyle:reuseIdentifier:specifier:", a3, v70);
  if (v7)
  {
    v8 = (UILabel *)objc_alloc_init((Class)UILabel);
    leftLabel = v7->_leftLabel;
    v7->_leftLabel = v8;

    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v7->_leftLabel setFont:v10];

    [(UILabel *)v7->_leftLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v7->_leftLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_leftLabel sizeToFit];
    v11 = [(AXSensitivitySliderCell *)v7 contentView];
    [v11 addSubview:v7->_leftLabel];

    char IsAccessibilityCategory = AXPreferredContentSizeCategoryIsAccessibilityCategory();
    if ((IsAccessibilityCategory & 1) == 0)
    {
      v12 = (UILabel *)objc_alloc_init((Class)UILabel);
      centerLabel = v7->_centerLabel;
      v7->_centerLabel = v12;

      id v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      [(UILabel *)v7->_centerLabel setFont:v14];

      [(UILabel *)v7->_centerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)v7->_centerLabel setAdjustsFontForContentSizeCategory:1];
      [(UILabel *)v7->_centerLabel sizeToFit];
      v15 = [(AXSensitivitySliderCell *)v7 contentView];
      [v15 addSubview:v7->_centerLabel];
    }
    id v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    rightLabel = v7->_rightLabel;
    v7->_rightLabel = v16;

    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v7->_rightLabel setFont:v18];

    [(UILabel *)v7->_rightLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v7->_rightLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_rightLabel sizeToFit];
    double v19 = [(AXSensitivitySliderCell *)v7 contentView];
    [v19 addSubview:v7->_rightLabel];

    v72 = [(AXSensitivitySliderCell *)v7 control];
    [v72 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_initWeak(&location, v7);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = __67__AXSensitivitySliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
    v73[3] = &unk_209258;
    v39 = &v74;
    objc_copyWeak(&v74, &location);
    [v72 _setAccessibilityValueBlock:v73];
    v64 = [v72 bottomAnchor];
    v66 = [(AXSensitivitySliderCell *)v7 contentView];
    v63 = [v66 bottomAnchor];
    v62 = [v64 constraintEqualToAnchor:v63 constant:-10.0];
    v78[0] = v62;
    v60 = [v72 widthAnchor];
    v61 = [(AXSensitivitySliderCell *)v7 contentView];
    v59 = [v61 widthAnchor];
    v58 = [v60 constraintEqualToAnchor:v59 constant:-60.0];
    v78[1] = v58;
    v56 = [v72 centerXAnchor];
    v57 = [(AXSensitivitySliderCell *)v7 contentView];
    v55 = [v57 centerXAnchor];
    v54 = [v56 constraintEqualToAnchor:v55 constant:0.0];
    v78[2] = v54;
    v53 = [v72 topAnchor];
    v52 = [(UILabel *)v7->_rightLabel lastBaselineAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:5.0];
    v78[3] = v51;
    v50 = [v72 topAnchor];
    v49 = [(UILabel *)v7->_leftLabel lastBaselineAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:5.0];
    v78[4] = v48;
    v46 = [(UILabel *)v7->_rightLabel topAnchor];
    v47 = [(AXSensitivitySliderCell *)v7 contentView];
    v45 = [v47 topAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:10.0];
    v78[5] = v44;
    v42 = [(UILabel *)v7->_rightLabel trailingAnchor];
    v43 = [(AXSensitivitySliderCell *)v7 contentView];
    v41 = [v43 trailingAnchor];
    v40 = [v42 constraintEqualToAnchor:v41 constant:-10.0];
    v78[6] = v40;
    v20 = [(UILabel *)v7->_leftLabel topAnchor];
    v21 = [(AXSensitivitySliderCell *)v7 contentView];
    id v22 = [v21 topAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:10.0];
    v78[7] = v23;
    v24 = [(UILabel *)v7->_leftLabel leadingAnchor];
    v25 = [(AXSensitivitySliderCell *)v7 contentView];
    v26 = [v25 leadingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26 constant:10.0];
    v78[8] = v27;
    v28 = +[NSArray arrayWithObjects:v78 count:9];
    +[NSLayoutConstraint activateConstraints:v28];

    if ((IsAccessibilityCategory & 1) == 0)
    {
      v67 = [(UILabel *)v7->_centerLabel topAnchor];
      v69 = [(AXSensitivitySliderCell *)v7 contentView];
      v65 = [v69 topAnchor];
      v29 = [v67 constraintEqualToAnchor:v65 constant:10.0];
      v77[0] = v29;
      v30 = [(UILabel *)v7->_centerLabel centerXAnchor];
      v31 = [(AXSensitivitySliderCell *)v7 contentView];
      v32 = [v31 centerXAnchor];
      v33 = [v30 constraintEqualToAnchor:v32 constant:0.0];
      v77[1] = v33;
      v34 = [v72 topAnchor];
      v35 = [(UILabel *)v7->_centerLabel lastBaselineAnchor];
      v36 = [v34 constraintEqualToAnchor:v35 constant:5.0];
      v77[2] = v36;
      v37 = +[NSArray arrayWithObjects:v77 count:3];
      +[NSLayoutConstraint activateConstraints:v37];
    }
    objc_destroyWeak(v39);
    objc_destroyWeak(&location);
  }
  return v7;
}

id __67__AXSensitivitySliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained accessibilityValue];

  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXSensitivitySliderCell;
  [(AXSensitivitySliderCell *)&v10 setSpecifier:v4];
  if (v4)
  {
    v5 = [v4 propertyForKey:@"SensitivityNames"];
    if ([v5 count] != (char *)&dword_0 + 3)
    {
      uint64_t v9 = 3;
      _AXAssert();
    }
    if (objc_msgSend(v5, "count", v9) == (char *)&dword_0 + 3)
    {
      v6 = [v5 objectAtIndexedSubscript:0];
      [(UILabel *)self->_leftLabel setText:v6];

      v7 = [v5 objectAtIndexedSubscript:1];
      [(UILabel *)self->_centerLabel setText:v7];

      v8 = [v5 objectAtIndexedSubscript:2];
      [(UILabel *)self->_rightLabel setText:v8];
    }
  }
}

- (void)setAccessibilityLabel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXSensitivitySliderCell;
  id v4 = a3;
  [(AXSensitivitySliderCell *)&v5 setAccessibilityLabel:v4];
  objc_msgSend(*(id *)&self->PSSliderTableCell_opaque[OBJC_IVAR___PSControlTableCell__control], "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);
}

- (void)_accessibilityIncrementOrDecrement:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(AXSensitivitySliderCell *)self control];
  [v12 minimumValue];
  float v6 = v5;
  [v12 maximumValue];
  float v8 = v7;
  float v9 = (float)(v6 + v7) * 0.5;
  int64_t v10 = [(AXSensitivitySliderCell *)self _sliderLevel];
  if (v10 == 2)
  {
    if (v3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v10 == 1)
  {
    if (v3) {
      float v9 = v8;
    }
    else {
      float v9 = v6;
    }
    goto LABEL_11;
  }
  if (!v10 && v3)
  {
LABEL_11:
    *(float *)&double v11 = v9;
    [v12 setValue:v11];
  }
LABEL_12:
  [v12 sendActionsForControlEvents:4096];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)accessibilityValue
{
  BOOL v3 = [(AXSensitivitySliderCell *)self specifier];
  id v4 = [v3 propertyForKey:@"SensitivityNames"];

  if ([v4 count] == (char *)&dword_0 + 3)
  {
    int64_t v5 = [(AXSensitivitySliderCell *)self _sliderLevel];
    switch(v5)
    {
      case 2:
        float v6 = v4;
        uint64_t v7 = 2;
        goto LABEL_11;
      case 1:
        float v6 = v4;
        uint64_t v7 = 1;
        goto LABEL_11;
      case 0:
        float v6 = v4;
        uint64_t v7 = 0;
LABEL_11:
        uint64_t v9 = [v6 objectAtIndexedSubscript:v7];
        goto LABEL_12;
    }
  }
  float v8 = [(AXSensitivitySliderCell *)self specifier];

  if (v8)
  {
    id v12 = self;
    id v13 = v4;
    _AXAssert();
  }
  v14.receiver = self;
  v14.super_class = (Class)AXSensitivitySliderCell;
  uint64_t v9 = [(AXSensitivitySliderCell *)&v14 accessibilityValue];
LABEL_12:
  int64_t v10 = (void *)v9;

  return v10;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AXSensitivitySliderCell;
  [(AXSensitivitySliderCell *)&v11 layoutSubviews];
  BOOL v3 = [(AXSensitivitySliderCell *)self control];
  [v3 frame];

  [(UILabel *)self->_leftLabel _lastLineBaselineFrameOriginY];
  double v5 = v4 + 5.0;
  float v6 = [(AXSensitivitySliderCell *)self contentView];
  [v6 bounds];
  CGFloat v7 = CGRectGetWidth(v12) + -60.0;

  float v8 = [(AXSensitivitySliderCell *)self contentView];
  [v8 bounds];
  CGFloat v9 = CGRectGetMaxY(v13) + -10.0 - v5;

  int64_t v10 = [(AXSensitivitySliderCell *)self control];
  objc_msgSend(v10, "setFrame:", 30.0, v5, v7, v9);
}

- (int64_t)_sliderLevel
{
  BOOL v3 = [(AXSensitivitySliderCell *)self control];
  [v3 value];
  int64_t v4 = -[AXSensitivitySliderCell _sliderLevelForValue:](self, "_sliderLevelForValue:");

  return v4;
}

- (int64_t)_sliderLevelForValue:(float)a3
{
  int64_t v4 = [(AXSensitivitySliderCell *)self control];
  [v4 minimumValue];
  float v6 = v5;
  [v4 maximumValue];
  if (vabds_f32(a3, v6) >= 0.00000011921)
  {
    if (fabsf(a3 + (float)((float)(v6 + v7) * -0.5)) >= 0.00000011921)
    {
      if (vabds_f32(a3, v7) < 0.00000011921)
      {
        int64_t v8 = 2;
        goto LABEL_8;
      }
      _AXAssert();
    }
    int64_t v8 = 1;
    goto LABEL_8;
  }
  int64_t v8 = 0;
LABEL_8:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerLabel, 0);
  objc_storeStrong((id *)&self->_rightLabel, 0);

  objc_storeStrong((id *)&self->_leftLabel, 0);
}

- (void)setSensitivitySliderLevel:(int64_t)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (int64_t)sensitivitySliderLevel
{
  return 1;
}

@end