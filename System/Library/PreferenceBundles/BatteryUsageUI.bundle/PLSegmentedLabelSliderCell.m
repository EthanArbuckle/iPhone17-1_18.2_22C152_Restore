@interface PLSegmentedLabelSliderCell
- (BOOL)canReload;
- (NSMutableDictionary)labelMap;
- (PLHighlightableSegmentableSlider)slider;
- (PLSegmentedLabelSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (PLSegmentedLabelSliderCellDelegate)delegate;
- (UIColor)tickColor;
- (UIStackView)labelStack;
- (id)createLabelStack;
- (id)createSlider;
- (id)currentTickColor;
- (int)maxValue;
- (int)minValue;
- (int)segments;
- (void)darkenValue:(float)a3;
- (void)drawRect:(CGRect)a3;
- (void)hideLabelsIfNecessary;
- (void)highlightValue:(float)a3;
- (void)refreshView;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)removeHighlight;
- (void)removeHighlight:(BOOL)a3;
- (void)setCurrentValue:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setLabelMap:(id)a3;
- (void)setLabelStack:(id)a3;
- (void)setMaxValue:(int)a3;
- (void)setMinValue:(int)a3;
- (void)setSegments:(int)a3;
- (void)setSlider:(id)a3;
- (void)setTickColor:(id)a3;
- (void)sliderValueChanged:(float)a3;
- (void)sliderValueChangedWithSlider:(id)a3;
- (void)sliderValueChangingSlider:(id)a3;
@end

@implementation PLSegmentedLabelSliderCell

- (id)createSlider
{
  v3 = [PLHighlightableSegmentableSlider alloc];
  v4 = +[UIColor systemFillColor];
  v5 = [(PLSegmentedLabelSliderCell *)self tickColor];
  v6 = +[UIColor systemGreenColor];
  v7 = [(PLHighlightableSegmentableSlider *)v3 initWithColors:v4 tickColor:v5 highlightColor:v6];

  v8 = [(PLSegmentedLabelSliderCell *)self delegate];
  [(PLHighlightableSegmentableSlider *)v7 setDelegate:v8];

  [(PLHighlightableSegmentableSlider *)v7 setContinuous:1];
  [(PLHighlightableSegmentableSlider *)v7 setSegmented:1];
  [(PLHighlightableSegmentableSlider *)v7 setSnapsToSegment:1];
  [(PLHighlightableSegmentableSlider *)v7 setSegmentCount:[(PLSegmentedLabelSliderCell *)self segments]];
  *(float *)&double v9 = (float)[(PLSegmentedLabelSliderCell *)self maxValue];
  [(PLHighlightableSegmentableSlider *)v7 setMaximumValue:v9];
  *(float *)&double v10 = (float)[(PLSegmentedLabelSliderCell *)self minValue];
  [(PLHighlightableSegmentableSlider *)v7 setMinimumValue:v10];
  [(PLHighlightableSegmentableSlider *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PLHighlightableSegmentableSlider *)v7 addTarget:self action:"sliderValueChangingSlider:" forControlEvents:4096];
  [(PLHighlightableSegmentableSlider *)v7 addTarget:self action:"sliderValueChangedWithSlider:" forControlEvents:192];
  [(PLHighlightableSegmentableSlider *)v7 setAccessibilityIdentifier:@"CHARGING_LIMIT_SLIDER"];

  return v7;
}

- (void)sliderValueChangingSlider:(id)a3
{
  id v9 = a3;
  v4 = [(PLSegmentedLabelSliderCell *)self slider];
  [v4 rtlConsideredValue];
  -[PLSegmentedLabelSliderCell darkenValue:](self, "darkenValue:");

  v5 = [(PLSegmentedLabelSliderCell *)self delegate];
  [v9 rtlConsideredValue];
  unsigned int v6 = objc_msgSend(v5, "shouldShowHighLight:");

  if (v6)
  {
    v7 = [(PLSegmentedLabelSliderCell *)self delegate];
    [v7 getHighlightValue];
    -[PLSegmentedLabelSliderCell highlightValue:](self, "highlightValue:");
  }
  else
  {
    [(PLSegmentedLabelSliderCell *)self removeHighlight:1];
  }
  if (![v9 state] && (objc_msgSend(v9, "isTracking") & 1) == 0)
  {
    v8 = [(PLSegmentedLabelSliderCell *)self slider];
    [v8 rtlConsideredValue];
    -[PLSegmentedLabelSliderCell sliderValueChanged:](self, "sliderValueChanged:");
  }
}

- (void)sliderValueChangedWithSlider:(id)a3
{
  [a3 rtlConsideredValue];

  -[PLSegmentedLabelSliderCell sliderValueChanged:](self, "sliderValueChanged:");
}

- (void)sliderValueChanged:(float)a3
{
  v5 = [(PLSegmentedLabelSliderCell *)self delegate];
  *(float *)&double v6 = a3;
  [v5 setSegmentedControlValue:v6];

  v7 = [(PLSegmentedLabelSliderCell *)self slider];
  [v7 maximumValue];
  float v9 = v8;

  if (v9 != a3)
  {
    double v10 = [(PLSegmentedLabelSliderCell *)self delegate];
    *(float *)&double v11 = a3;
    unsigned int v12 = [v10 shouldShowHighLight:v11];

    if (v12)
    {
      v13 = [(PLSegmentedLabelSliderCell *)self delegate];
      [v13 getHighlightValue];
      -[PLSegmentedLabelSliderCell highlightValue:](self, "highlightValue:");
    }
    else
    {
      [(PLSegmentedLabelSliderCell *)self removeHighlight:1];
    }
    v14 = [(PLSegmentedLabelSliderCell *)self delegate];
    [v14 getSegmentedControlValue];
    int v16 = v15;

    LODWORD(v17) = v16;
    [(PLSegmentedLabelSliderCell *)self setCurrentValue:v17];
  }
}

- (void)darkenValue:(float)a3
{
  v5 = [(PLSegmentedLabelSliderCell *)self labelMap];
  *(float *)&double v6 = a3;
  v7 = +[NSNumber numberWithFloat:v6];
  float v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    float v9 = [(PLSegmentedLabelSliderCell *)self labelStack];
    double v10 = [v9 arrangedSubviews];

    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v16 = [v15 textColor];
          double v17 = +[UIColor systemGreenColor];

          if (v16 != v17)
          {
            v18 = +[UIColor systemGrayColor];
            [v15 setTextColor:v18];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    v19 = [v8 textColor];
    v20 = +[UIColor systemGreenColor];

    if (v19 != v20)
    {
      v21 = +[UIColor labelColor];
      [v8 setTextColor:v21];
    }
  }
}

- (void)highlightValue:(float)a3
{
  v5 = [(PLSegmentedLabelSliderCell *)self labelMap];
  *(float *)&double v6 = a3;
  v7 = +[NSNumber numberWithFloat:v6];
  id v11 = [v5 objectForKeyedSubscript:v7];

  if (v11)
  {
    [(PLSegmentedLabelSliderCell *)self removeHighlight];
    float v8 = +[UIColor systemGreenColor];
    [v11 setTextColor:v8];

    float v9 = [(PLSegmentedLabelSliderCell *)self slider];
    *(float *)&double v10 = a3;
    [v9 drawHighLightForValue:v10];
  }
}

- (void)removeHighlight
{
}

- (void)removeHighlight:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PLSegmentedLabelSliderCell *)self slider];
  [v5 removeHighlight:v3];

  double v6 = [(PLSegmentedLabelSliderCell *)self labelMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_22400;
  v7[3] = &unk_BF078;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)setCurrentValue:(float)a3
{
  v5 = [(PLSegmentedLabelSliderCell *)self slider];
  double v6 = [(PLSegmentedLabelSliderCell *)self slider];
  *(float *)&double v7 = a3;
  [v6 rtlConsideredValue:v7];
  objc_msgSend(v5, "setValue:animated:", 1);

  *(float *)&double v8 = a3;

  [(PLSegmentedLabelSliderCell *)self darkenValue:v8];
}

- (id)createLabelStack
{
  id v3 = objc_alloc_init((Class)UIStackView);
  [v3 setAxis:0];
  [v3 setDistribution:4];
  [v3 setAlignment:4];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = objc_opt_new();
  [(PLSegmentedLabelSliderCell *)self setLabelMap:v4];

  if ([(PLSegmentedLabelSliderCell *)self segments]) {
    signed int v5 = [(PLSegmentedLabelSliderCell *)self segments];
  }
  else {
    signed int v5 = 1;
  }
  unsigned int v6 = [(PLSegmentedLabelSliderCell *)self maxValue];
  unsigned int v7 = [(PLSegmentedLabelSliderCell *)self minValue];
  uint64_t v8 = [(PLSegmentedLabelSliderCell *)self minValue];
  if ((int)v8 <= [(PLSegmentedLabelSliderCell *)self maxValue])
  {
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    int v12 = (int)(v6 - v7) / v5;
    do
    {
      id v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      v14 = +[PLBatteryUIUtilities localizedStringWithPercentage:(double)(int)v8];
      [v13 setText:v14];

      int v15 = +[UIColor systemGrayColor];
      [v13 setTextColor:v15];

      int v16 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightSemibold];
      [v13 setFont:v16];

      [v13 setAdjustsFontForContentSizeCategory:1];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v13 setNumberOfLines:1];
      double v17 = [(PLSegmentedLabelSliderCell *)self labelMap];
      v18 = +[NSNumber numberWithInt:v8];
      [v17 setObject:v13 forKeyedSubscript:v18];

      [v3 addArrangedSubview:v13];
      uint64_t v8 = (v8 + v12);
    }
    while ((int)v8 <= [(PLSegmentedLabelSliderCell *)self maxValue]);
  }

  return v3;
}

- (void)refreshView
{
  id v3 = [(PLSegmentedLabelSliderCell *)self slider];
  v4 = [(PLSegmentedLabelSliderCell *)self tickColor];
  [v3 changeTickColor:v4];

  [(PLSegmentedLabelSliderCell *)self setNeedsDisplay];
}

- (id)currentTickColor
{
  v2 = +[UITraitCollection currentTraitCollection];
  if ([v2 userInterfaceStyle] == (char *)&dword_0 + 2) {
    +[UIColor systemGrayColor];
  }
  else {
  id v3 = +[UIColor systemGray3Color];
  }

  return v3;
}

- (PLSegmentedLabelSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v94.receiver = self;
  v94.super_class = (Class)PLSegmentedLabelSliderCell;
  id v86 = a4;
  id v90 = a5;
  unsigned int v7 = -[PLSegmentedLabelSliderCell initWithStyle:reuseIdentifier:specifier:](&v94, "initWithStyle:reuseIdentifier:specifier:", a3, v86);
  uint64_t v8 = v7;
  if (v7)
  {
    float v9 = [(PLSegmentedLabelSliderCell *)v7 currentTickColor];
    [(PLSegmentedLabelSliderCell *)v8 setTickColor:v9];

    double v10 = self;
    v96 = v10;
    v85 = +[NSArray arrayWithObjects:&v96 count:1];

    objc_initWeak(&location, v8);
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_231C4;
    v91[3] = &unk_BF0A0;
    v56 = &v92;
    objc_copyWeak(&v92, &location);
    id v11 = [(PLSegmentedLabelSliderCell *)v8 registerForTraitChanges:v85 withHandler:v91];
    int v12 = [v90 propertyForKey:@"PLSegmentedLabelSliderCellSegmentCountKey"];
    -[PLSegmentedLabelSliderCell setSegments:](v8, "setSegments:", [v12 intValue]);

    id v13 = [v90 propertyForKey:@"PLSegmentedLabelSliderCellMaxValueKey"];
    -[PLSegmentedLabelSliderCell setMaxValue:](v8, "setMaxValue:", [v13 intValue]);

    v14 = [v90 propertyForKey:@"PLSegmentedLabelSliderCellMinValueKey"];
    -[PLSegmentedLabelSliderCell setMinValue:](v8, "setMinValue:", [v14 intValue]);

    int v15 = [v90 propertyForKey:@"PLSegmentedLabelSliderCellDelegateKey"];
    [(PLSegmentedLabelSliderCell *)v8 setDelegate:v15];

    int v16 = [(PLSegmentedLabelSliderCell *)v8 createLabelStack];
    [(PLSegmentedLabelSliderCell *)v8 setLabelStack:v16];

    double v17 = [(PLSegmentedLabelSliderCell *)v8 createSlider];
    [(PLSegmentedLabelSliderCell *)v8 setSlider:v17];

    v18 = [(PLSegmentedLabelSliderCell *)v8 delegate];
    [v18 getSegmentedControlValue];
    -[PLSegmentedLabelSliderCell setCurrentValue:](v8, "setCurrentValue:");

    v19 = [(PLSegmentedLabelSliderCell *)v8 delegate];
    v20 = [(PLSegmentedLabelSliderCell *)v8 slider];
    [v20 rtlConsideredValue];
    unsigned int v21 = objc_msgSend(v19, "shouldShowHighLight:");

    if (v21)
    {
      long long v22 = [(PLSegmentedLabelSliderCell *)v8 delegate];
      [v22 getHighlightValue];
      -[PLSegmentedLabelSliderCell highlightValue:](v8, "highlightValue:");
    }
    v89 = [(PLSegmentedLabelSliderCell *)v8 contentView];
    long long v23 = [(PLSegmentedLabelSliderCell *)v8 slider];
    [v89 addSubview:v23];

    long long v24 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    [v89 addSubview:v24];

    long long v25 = [(PLSegmentedLabelSliderCell *)v8 slider];
    [v89 bringSubviewToFront:v25];

    [(PLSegmentedLabelSliderCell *)v8 setSeparatorStyle:1];
    -[PLSegmentedLabelSliderCell setSeparatorInset:](v8, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v26 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    v27 = [v26 arrangedSubviews];
    v88 = [v27 firstObject];

    [v88 sizeToFit];
    v28 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    v29 = [v28 arrangedSubviews];
    v87 = [v29 lastObject];

    [v87 sizeToFit];
    if (+[PLBatteryUIUtilities isDeviceLayoutRTL]) {
      v30 = v87;
    }
    else {
      v30 = v88;
    }
    [v30 frame];
    double v32 = v31;
    v33 = [(PLSegmentedLabelSliderCell *)v8 slider];
    [v33 tickWidth];
    double v35 = v34;

    if (+[PLBatteryUIUtilities isDeviceLayoutRTL]) {
      v36 = v88;
    }
    else {
      v36 = v87;
    }
    [v36 frame];
    double v38 = v37;
    v39 = [(PLSegmentedLabelSliderCell *)v8 slider];
    [v39 tickWidth];
    double v41 = v40;

    float v42 = v32 * 0.5 + v35 * -0.5;
    double v43 = v38 * 0.5 + v41 * -0.5;
    float v44 = v43;
    if (v42 >= v44) {
      float v45 = v42;
    }
    else {
      float v45 = v43;
    }
    v84 = [(PLSegmentedLabelSliderCell *)v8 slider];
    v82 = [v84 topAnchor];
    v83 = [(PLSegmentedLabelSliderCell *)v8 contentView];
    v81 = [v83 topAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 constant:7.0];
    v95[0] = v80;
    v79 = [(PLSegmentedLabelSliderCell *)v8 slider];
    v77 = [v79 leadingAnchor];
    v78 = [(PLSegmentedLabelSliderCell *)v8 contentView];
    v76 = [v78 leadingAnchor];
    v75 = [v77 constraintEqualToAnchor:v76 constant:(float)(v45 + 7.0)];
    v95[1] = v75;
    v74 = [(PLSegmentedLabelSliderCell *)v8 slider];
    v72 = [v74 trailingAnchor];
    v73 = [(PLSegmentedLabelSliderCell *)v8 contentView];
    v71 = [v73 trailingAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:(float)(-7.0 - v45)];
    v95[2] = v70;
    v69 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    v67 = [v69 topAnchor];
    v68 = [(PLSegmentedLabelSliderCell *)v8 slider];
    v66 = [v68 bottomAnchor];
    v65 = [v67 constraintEqualToAnchor:v66 constant:3.0];
    v95[3] = v65;
    v64 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    v62 = [v64 leadingAnchor];
    v63 = [(PLSegmentedLabelSliderCell *)v8 slider];
    v61 = [v63 leadingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:(float)-v42];
    v95[4] = v60;
    v59 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    v46 = [v59 trailingAnchor];
    v47 = [(PLSegmentedLabelSliderCell *)v8 slider];
    v48 = [v47 trailingAnchor];
    v49 = [v46 constraintEqualToAnchor:v48 constant:v44];
    v95[5] = v49;
    v50 = [(PLSegmentedLabelSliderCell *)v8 labelStack];
    v51 = [v50 bottomAnchor];
    v52 = [(PLSegmentedLabelSliderCell *)v8 contentView];
    v53 = [v52 bottomAnchor];
    v54 = [v51 constraintEqualToAnchor:v53 constant:-15.0];
    v95[6] = v54;
    v58 = +[NSArray arrayWithObjects:v95 count:7];

    +[NSLayoutConstraint activateConstraints:v58];
    [(PLSegmentedLabelSliderCell *)v8 setNeedsLayout];

    objc_destroyWeak(v57);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (BOOL)canReload
{
  return 1;
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23334;
  block[3] = &unk_BF0C8;
  id v9 = v6;
  id v7 = v6;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a4;
  double v10 = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)drawRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLSegmentedLabelSliderCell;
  -[PLSegmentedLabelSliderCell drawRect:](&v4, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PLSegmentedLabelSliderCell *)self hideLabelsIfNecessary];
}

- (void)hideLabelsIfNecessary
{
  uint64_t v13 = 0;
  v14 = (float *)&v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  id v3 = [(PLSegmentedLabelSliderCell *)self labelMap];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_23614;
  v12[3] = &unk_BF0F0;
  v12[4] = &v13;
  [v3 enumerateKeysAndObjectsUsingBlock:v12];

  objc_super v4 = [(PLSegmentedLabelSliderCell *)self slider];
  [v4 frame];
  double v6 = v5;
  int v7 = [(PLSegmentedLabelSliderCell *)self segments];
  float v8 = v14[6];

  id v9 = [(PLSegmentedLabelSliderCell *)self labelMap];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_236B0;
  v10[3] = &unk_BF118;
  v10[4] = self;
  BOOL v11 = v6 / (double)v7 < v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v10];

  _Block_object_dispose(&v13, 8);
}

- (int)segments
{
  return self->_segments;
}

- (void)setSegments:(int)a3
{
  self->_segments = a3;
}

- (int)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(int)a3
{
  self->_maxValue = a3;
}

- (int)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(int)a3
{
  self->_minValue = a3;
}

- (NSMutableDictionary)labelMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLabelMap:(id)a3
{
}

- (PLHighlightableSegmentableSlider)slider
{
  return (PLHighlightableSegmentableSlider *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSlider:(id)a3
{
}

- (UIStackView)labelStack
{
  return (UIStackView *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLabelStack:(id)a3
{
}

- (PLSegmentedLabelSliderCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PLSegmentedLabelSliderCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIColor)tickColor
{
  return (UIColor *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTickColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tickColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labelStack, 0);
  objc_storeStrong((id *)&self->_slider, 0);

  objc_storeStrong((id *)&self->_labelMap, 0);
}

@end