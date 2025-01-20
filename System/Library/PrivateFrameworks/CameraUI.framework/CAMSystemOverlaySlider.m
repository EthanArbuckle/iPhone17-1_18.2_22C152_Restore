@interface CAMSystemOverlaySlider
- (BOOL)enabled;
- (BOOL)feedbackDisabled;
- (CAMOverlayDiscreteFloatRange)magneticRange;
- (CAMOverlayDiscreteFloatRange)protectedRange;
- (CAMOverlayValueRange)valueRange;
- (CAMSystemOverlaySlider)initWithFrame:(CGRect)a3;
- (CAMSystemOverlaySliderDelegate)delegate;
- (CEKAbstractSlider)_currentSlider;
- (CEKDiscreteSlider)_discreteSlider;
- (CEKSlider)_continuousSlider;
- (CGAffineTransform)_orientationTransform;
- (NSArray)_selectorConfigurations;
- (NSNumber)currentNumber;
- (double)_longestSelectorConfigurationDimension;
- (double)_tickMarkSpacingForStyle:(unint64_t)a3;
- (id)_displayValueRange;
- (id)configurationAtIndex:(unint64_t)a3;
- (int64_t)orientation;
- (unint64_t)_effectiveStyle;
- (unint64_t)alignment;
- (unint64_t)style;
- (void)_configureWithRange:(id)a3 magneticRange:(id)a4 protectedRange:(id)a5 style:(unint64_t)a6 enabled:(BOOL)a7;
- (void)_handleContinuousSliderValueChanged:(id)a3;
- (void)_handleDiscreteSliderValueChanged:(id)a3;
- (void)_setContinuousSlider:(id)a3;
- (void)_setCurrentSlider:(id)a3;
- (void)_setDiscreteSlider:(id)a3;
- (void)_setLongestSelectorConfigurationDimension:(double)a3;
- (void)_setSelectorConfigurations:(id)a3;
- (void)_updateInternalSlider;
- (void)_updateSelectorConfigurations;
- (void)_updateSliderData;
- (void)_updateSliderEnabled;
- (void)_updateSliderValue;
- (void)configureWithRange:(id)a3 magneticRange:(id)a4 style:(unint64_t)a5 enabled:(BOOL)a6;
- (void)configureWithRange:(id)a3 protectedRange:(id)a4 style:(unint64_t)a5 enabled:(BOOL)a6;
- (void)layoutSubviews;
- (void)performWaveAnimation;
- (void)setAlignment:(unint64_t)a3;
- (void)setCurrentNumber:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFeedbackDisabled:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
@end

@implementation CAMSystemOverlaySlider

- (CAMSystemOverlaySlider)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMSystemOverlaySlider;
  result = -[CAMSystemOverlaySlider initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (void)layoutSubviews
{
  [(CAMSystemOverlaySlider *)self bounds];
  v3 = [(CAMSystemOverlaySlider *)self _currentSlider];
  [(CAMSystemOverlaySlider *)self alignment];
  unint64_t v4 = [(CAMSystemOverlaySlider *)self alignment];
  if (v4) {
    uint64_t v5 = 4 * (v4 == 1);
  }
  else {
    uint64_t v5 = 3;
  }
  UIRectInsetEdges();
  memset(v12, 0, sizeof(v12));
  CAMViewGeometryForOrientedFrame(v5, (uint64_t)v12, v6, v7, v8, v9);
  CGAffineTransform v11 = v12[1];
  CGAffineTransformScale(v10, &v11, -1.0, 1.0);
  v12[1] = v10[0];
  v10[1] = v10[0];
  v10[0] = v12[0];
  CAMViewSetGeometry(v3, (uint64_t)v10);
  UIEdgeInsetsMakeWithEdges();
  -[CAMSystemOverlaySlider setHitTestInsets:](self, "setHitTestInsets:");
}

- (void)configureWithRange:(id)a3 magneticRange:(id)a4 style:(unint64_t)a5 enabled:(BOOL)a6
{
}

- (void)configureWithRange:(id)a3 protectedRange:(id)a4 style:(unint64_t)a5 enabled:(BOOL)a6
{
}

- (void)_configureWithRange:(id)a3 magneticRange:(id)a4 protectedRange:(id)a5 style:(unint64_t)a6 enabled:(BOOL)a7
{
  BOOL v7 = a7;
  v15 = (CAMOverlayValueRange *)a3;
  v13 = (CAMOverlayDiscreteFloatRange *)a4;
  v14 = (CAMOverlayDiscreteFloatRange *)a5;
  if (self->_valueRange != v15 && !-[CAMOverlayValueRange isEqualToRange:](v15, "isEqualToRange:")
    || self->_magneticRange != v13
    && !-[CAMOverlayDiscreteFloatRange isEqualToRange:](v13, "isEqualToRange:")
    || self->_protectedRange != v14
    && !-[CAMOverlayDiscreteFloatRange isEqualToRange:](v14, "isEqualToRange:")
    || self->_enabled != v7
    || self->_style != a6)
  {
    objc_storeStrong((id *)&self->_valueRange, a3);
    objc_storeStrong((id *)&self->_magneticRange, a4);
    objc_storeStrong((id *)&self->_protectedRange, a5);
    self->_style = a6;
    self->_enabled = v7;
    [(CAMSystemOverlaySlider *)self _updateSelectorConfigurations];
    [(CAMSystemOverlaySlider *)self _updateInternalSlider];
    [(CAMSystemOverlaySlider *)self _updateSliderData];
    [(CAMSystemOverlaySlider *)self _updateSliderValue];
    [(CAMSystemOverlaySlider *)self _updateSliderEnabled];
  }
}

- (void)setCurrentNumber:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_currentNumber != (NSNumber *)v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = objc_msgSend((id)v5, "isEqual:");
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentNumber, a3);
      uint64_t v5 = [(CAMSystemOverlaySlider *)self _updateSliderValue];
      uint64_t v6 = v7;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(CAMSystemOverlaySlider *)self _updateSliderData];
    [(CAMSystemOverlaySlider *)self _updateSliderEnabled];
  }
}

- (void)_updateSliderEnabled
{
  BOOL v3 = [(CAMSystemOverlaySlider *)self enabled];
  unint64_t v4 = [(CAMSystemOverlaySlider *)self _currentSlider];
  uint64_t v5 = [(CAMSystemOverlaySlider *)self _discreteSlider];

  if (v4 == v5)
  {
    id v6 = [(CAMSystemOverlaySlider *)self _discreteSlider];
    [v6 setEnabled:v3];
  }
  else
  {
    id v6 = [(CAMSystemOverlaySlider *)self _continuousSlider];
    [v6 setEnabled:v3 dimmed:v3 ^ 1 animated:0];
  }
}

- (void)setFeedbackDisabled:(BOOL)a3
{
  if (self->_feedbackDisabled != a3)
  {
    self->_feedbackDisabled = a3;
    [(CAMSystemOverlaySlider *)self _updateInternalSlider];
  }
}

- (void)performWaveAnimation
{
  id v2 = [(CAMSystemOverlaySlider *)self _currentSlider];
  [v2 performWaveAnimation];
}

- (void)_handleDiscreteSliderValueChanged:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(CAMSystemOverlaySlider *)self valueRange];
  if ([v4 isDiscrete])
  {
    uint64_t v5 = objc_msgSend(v4, "valueAtIndex:", objc_msgSend(v7, "selectedIndex"));
    [(CAMSystemOverlaySlider *)self setCurrentNumber:v5];

    id v6 = [(CAMSystemOverlaySlider *)self delegate];
    [v6 overlaySliderDidChangeCurrentValue:self];
  }
}

- (void)_handleContinuousSliderValueChanged:(id)a3
{
  id v8 = a3;
  unint64_t v4 = [(CAMSystemOverlaySlider *)self valueRange];
  if ([v4 isFloatingPoint] && (objc_msgSend(v4, "isDiscrete") & 1) == 0)
  {
    uint64_t v5 = NSNumber;
    [v8 value];
    id v6 = objc_msgSend(v5, "numberWithDouble:");
    [(CAMSystemOverlaySlider *)self setCurrentNumber:v6];

    id v7 = [(CAMSystemOverlaySlider *)self delegate];
    [v7 overlaySliderDidChangeCurrentValue:self];
  }
}

- (void)_updateSliderValue
{
  BOOL v3 = [(CAMSystemOverlaySlider *)self valueRange];

  if (v3)
  {
    id v12 = [(CAMSystemOverlaySlider *)self _discreteSlider];
    unint64_t v4 = [(CAMSystemOverlaySlider *)self _continuousSlider];
    uint64_t v5 = [(CAMSystemOverlaySlider *)self valueRange];
    id v6 = [(CAMSystemOverlaySlider *)self currentNumber];
    if ([v5 isDiscrete])
    {
      uint64_t v7 = [v6 unsignedIntegerValue];
      if ([v5 isFloatingPoint])
      {
        id v8 = v5;
        [v6 doubleValue];
        uint64_t v7 = objc_msgSend(v8, "indexOfValueClosestToValue:");
      }
      [v12 setSelectedIndex:v7];
    }
    else if ([v5 isFloatingPoint])
    {
      id v9 = v5;
      [v6 doubleValue];
      objc_msgSend(v9, "valueClosestToValue:");
      double v11 = v10;

      [v4 setValue:v11];
    }
  }
}

- (id)_displayValueRange
{
  BOOL v3 = [(CAMSystemOverlaySlider *)self valueRange];
  if (![(CAMSystemOverlaySlider *)self enabled]
    && [(CAMSystemOverlaySlider *)self _effectiveStyle] != 6)
  {
    if ([v3 isFloatingPoint])
    {
      id v4 = v3;
      [v4 minimum];
      double v6 = v5;
      [v4 maximum];
      if (v6 == v7)
      {
        if ([v4 isDiscrete])
        {
          uint64_t v8 = [objc_alloc(MEMORY[0x263F30738]) initWithMinimum:-10.0 maximum:10.0 step:1.0];
        }
        else
        {
          unint64_t v9 = [(CAMSystemOverlaySlider *)self _effectiveStyle];
          id v10 = objc_alloc(MEMORY[0x263F30730]);
          if (v9 == 4) {
            double v11 = 1.0;
          }
          else {
            double v11 = 0.0;
          }
          uint64_t v8 = [v10 initWithMinimum:v11 maximum:10.0];
        }
        id v12 = (void *)v8;

        id v4 = v12;
      }
      goto LABEL_15;
    }
    if ([v3 isDiscrete] && (unint64_t)objc_msgSend(v3, "count") <= 1)
    {
      id v4 = (id)[objc_alloc(MEMORY[0x263F30740]) initWithCount:20];
LABEL_15:

      BOOL v3 = v4;
    }
  }
  return v3;
}

- (void)_updateSliderData
{
  BOOL v3 = [(CAMSystemOverlaySlider *)self valueRange];

  if (v3)
  {
    id v4 = [(CAMSystemOverlaySlider *)self _discreteSlider];
    double v5 = [(CAMSystemOverlaySlider *)self _continuousSlider];
    double v6 = [v4 tickMarksConfiguration];
    double v7 = [v5 tickMarksConfiguration];
    uint64_t v8 = [(CAMSystemOverlaySlider *)self _currentSlider];
    unint64_t v9 = [(CAMSystemOverlaySlider *)self _displayValueRange];
    id v10 = [(CAMSystemOverlaySlider *)self magneticRange];
    v44 = [(CAMSystemOverlaySlider *)self protectedRange];
    unint64_t v11 = [(CAMSystemOverlaySlider *)self _effectiveStyle];
    if ([v9 isDiscrete])
    {
      v41 = v8;
      v42 = v6;
      id v12 = v7;
      objc_msgSend(v4, "setIndexCount:", objc_msgSend(v9, "count"));
      if ([v9 isFloatingPoint])
      {
        v13 = v9;
        id v14 = v9;
        v15 = [v14 indexesOfValuesInRange:v10];
        v16 = [v14 indexesOfValuesInRange:v44];

        unint64_t v9 = v13;
      }
      else
      {
        v16 = 0;
        v15 = 0;
      }
      [v4 setMagneticIndexes:v15];
      [v4 setProtectedIndexes:v16];

      double v7 = v12;
      uint64_t v8 = v41;
      double v6 = v42;
    }
    else if ([v9 isFloatingPoint])
    {
      if (v11 == 3) {
        double v17 = 0.1;
      }
      else {
        double v17 = 10.0;
      }
      v43 = v9;
      id v18 = v9;
      [v5 tickMarksConfiguration];
      v19 = v10;
      v20 = v6;
      v21 = v8;
      v23 = v22 = v7;
      [v23 setMainTickMarkInterval:10];

      double v7 = v22;
      uint64_t v8 = v21;
      double v6 = v20;
      id v10 = v19;
      [v18 minimum];
      double v25 = v24;
      [v18 maximum];
      double v27 = v26;

      unint64_t v9 = v43;
      [v7 setMainTickMarkInterval:10];
      [v7 setMainTickMarkOffset:(uint64_t)((ceil(v25) - v25) * 10.0)];
      [v5 setTickMarkCount:(uint64_t)((v27 - v25) * v17 + 1.0)];
      [v5 setMinimumValue:v25];
      [v5 setMaximumValue:v27];
      [v5 setMagneticRange:v19];
    }
    if (v8 == v5) {
      v28 = v7;
    }
    else {
      v28 = v6;
    }
    id v29 = v28;
    [(CAMSystemOverlaySlider *)self _tickMarkSpacingForStyle:v11];
    objc_msgSend(v29, "setTickMarkSpacing:");
    if (v11 < 5)
    {
      [v29 setEndTickMarksProminent:1];
      if (v8 == v5)
      {
        [v5 setLogarithmic:v11 == 4];
      }
      else if (v8 == v4)
      {
        [v4 cellDataConfiguration];
        v30 = v10;
        v32 = v31 = v9;
        [v32 setCellDataProvider:0];

        unint64_t v9 = v31;
        id v10 = v30;
        [v4 setLevelIndicatorHeight:10.0];
        [v4 setBiasScrollingToCurrentSelection:1];
        [v6 setTickMarkWidth:2.0];
        [v6 setMainTickMarkInterval:3];
        [v6 setMainTickMarkColor:0];
      }
      goto LABEL_25;
    }
    if (v11 == 5)
    {
      [v4 cellDataConfiguration];
      v38 = v10;
      v40 = v39 = v9;
      [v40 setCellDataProvider:0];

      unint64_t v9 = v39;
      id v10 = v38;
      [v4 setLevelIndicatorHeight:10.0];
      [v4 setBiasScrollingToCurrentSelection:0];
      [v4 setMagneticIndexes:0];
      [v6 setTickMarkWidth:4.0];
      [v6 setMainTickMarkInterval:1];
      [v6 setMainTickMarkColor:0];
    }
    else
    {
      if (v11 != 6)
      {
LABEL_25:

        return;
      }
      [v4 cellDataConfiguration];
      v33 = v10;
      v35 = v34 = v9;
      [v35 setCellDataProvider:self];

      [(CAMSystemOverlaySlider *)self _orientationTransform];
      v36 = [v4 cellDataConfiguration];
      v45[0] = *(_OWORD *)((char *)&v45[3] + 8);
      v45[1] = *(_OWORD *)((char *)&v45[4] + 8);
      v45[2] = *(_OWORD *)((char *)&v45[5] + 8);
      [v36 setContentTransform:v45];

      [(CAMSystemOverlaySlider *)self _longestSelectorConfigurationDimension];
      objc_msgSend(v4, "setLevelIndicatorHeight:");
      [v4 setBiasScrollingToCurrentSelection:0];
      [v4 setMagneticIndexes:0];
      [v6 setTickMarkWidth:20.0];
      [v6 setMainTickMarkInterval:1];
      v37 = [MEMORY[0x263F825C8] whiteColor];
      [v6 setMainTickMarkColor:v37];

      unint64_t v9 = v34;
      id v10 = v33;
    }
    [v6 setEndTickMarksProminent:0];
    goto LABEL_25;
  }
}

- (double)_tickMarkSpacingForStyle:(unint64_t)a3
{
  double v3 = 5.0;
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      id v4 = [(CAMSystemOverlaySlider *)self valueRange];
      if ([v4 isDiscrete]) {
        double v3 = 8.0;
      }
      else {
        double v3 = 9.0;
      }

      break;
    case 1uLL:
      return v3;
    case 2uLL:
      double v3 = 10.0;
      break;
    case 4uLL:
      double v3 = 7.0;
      break;
    case 5uLL:
      double v3 = 30.0;
      break;
    case 6uLL:
      double v3 = 40.0;
      break;
    default:
      double v3 = 0.0;
      break;
  }
  return v3;
}

- (unint64_t)_effectiveStyle
{
  double v3 = [(CAMSystemOverlaySlider *)self valueRange];
  unint64_t v4 = [(CAMSystemOverlaySlider *)self style];
  unint64_t v5 = v4;
  if (v4 - 5 < 2)
  {
    if ([v3 isDiscrete]) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v4 == 4 && (([v3 isDiscrete] & 1) != 0 || (objc_msgSend(v3, "isFloatingPoint") & 1) == 0)) {
LABEL_7:
  }
    unint64_t v5 = 0;
LABEL_8:

  return v5;
}

- (void)_updateSelectorConfigurations
{
  if ([(CAMSystemOverlaySlider *)self _effectiveStyle] == 6)
  {
    id v11 = [(CAMSystemOverlaySlider *)self valueRange];
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    if ([v11 count])
    {
      unint64_t v4 = 0;
      double v5 = 0.0;
      do
      {
        double v6 = [v11 valueAtIndex:v4];
        double v7 = [(CAMSystemOverlaySlider *)self delegate];
        uint64_t v8 = [v7 overlaySlider:self cellConfigurationForValue:v6];

        [v3 addObject:v8];
        [v8 contentSize];
        double v5 = fmax(v5, fmax(v9, v10));

        ++v4;
      }
      while (v4 < [v11 count]);
    }
    UICeilToViewScale();
    -[CAMSystemOverlaySlider _setLongestSelectorConfigurationDimension:](self, "_setLongestSelectorConfigurationDimension:");
    [(CAMSystemOverlaySlider *)self _setSelectorConfigurations:v3];
  }
  else
  {
    [(CAMSystemOverlaySlider *)self _setSelectorConfigurations:0];
  }
}

- (void)_updateInternalSlider
{
  id v3 = [(CAMSystemOverlaySlider *)self valueRange];

  if (!v3) {
    return;
  }
  id v4 = [(CAMSystemOverlaySlider *)self _currentSlider];
  double v5 = [(CAMSystemOverlaySlider *)self _discreteSlider];
  double v6 = [(CAMSystemOverlaySlider *)self _continuousSlider];
  double v7 = [(CAMSystemOverlaySlider *)self valueRange];
  if ([v7 isDiscrete])
  {
    if (v5)
    {
      uint64_t v8 = v5;
    }
    else
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F306A0]) initWithTickMarkStyle:1];
      [v8 setDelegate:self];
      [v8 setSliderVerticalAlignment:1];
      objc_msgSend(v8, "setGradientInsets:", 13.0, 13.0);
      [v8 setSelectionFeedbackProfile:2];
      [(CAMSystemOverlaySlider *)self _orientationTransform];
      double v10 = [v8 cellDataConfiguration];
      v13[0] = v13[3];
      v13[1] = v13[4];
      v13[2] = v13[5];
      [v10 setContentTransform:v13];

      [v8 setTransparentGradients];
      [v8 addTarget:self action:sel__handleDiscreteSliderValueChanged_ forControlEvents:4096];
      [(CAMSystemOverlaySlider *)self _setDiscreteSlider:v8];
      double v5 = v8;
    }
  }
  else
  {
    if (![v7 isFloatingPoint])
    {
      id v9 = 0;
      if (v4) {
        goto LABEL_13;
      }
      goto LABEL_15;
    }
    if (v6)
    {
      uint64_t v8 = v6;
    }
    else
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F306F0]) initWithTickMarkStyle:1];
      [v8 setDelegate:self];
      objc_msgSend(v8, "setTickMarkSize:", 2.0, 10.0);
      [v8 setSliderVerticalAlignment:1];
      objc_msgSend(v8, "setGradientInsets:", 13.0, 13.0);
      [v8 setSelectionFeedbackProfile:2];
      [v8 setTransparentGradients];
      [v8 addTarget:self action:sel__handleContinuousSliderValueChanged_ forControlEvents:4096];
      [(CAMSystemOverlaySlider *)self _setContinuousSlider:v8];
      double v6 = v8;
    }
  }
  id v9 = v8;
  if (v4)
  {
LABEL_13:
    if (v4 != v9) {
      [v4 removeFromSuperview];
    }
  }
LABEL_15:
  id v11 = [v9 superview];

  if (!v11) {
    [(CAMSystemOverlaySlider *)self insertSubview:v9 atIndex:0];
  }
  id v12 = [v9 layer];
  [v12 setHitTestsAsOpaque:1];

  objc_msgSend(v9, "setFeedbackScope:", -[CAMSystemOverlaySlider feedbackDisabled](self, "feedbackDisabled") ^ 1);
  [(CAMSystemOverlaySlider *)self _setCurrentSlider:v9];
}

- (void)sliderWillBeginScrolling:(id)a3
{
  id v4 = [(CAMSystemOverlaySlider *)self delegate];
  [v4 overlaySliderWillBeginScrolling:self];
}

- (void)sliderDidEndScrolling:(id)a3
{
  id v4 = [(CAMSystemOverlaySlider *)self delegate];
  [v4 overlaySliderDidEndScrolling:self];
}

- (id)configurationAtIndex:(unint64_t)a3
{
  id v4 = [(CAMSystemOverlaySlider *)self _selectorConfigurations];
  double v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    double v6 = [(CAMSystemOverlaySlider *)self _discreteSlider];
    double v7 = [v6 cellDataConfiguration];

    if (v7)
    {
      [(CAMSystemOverlaySlider *)self _orientationTransform];
      [v7 setContentTransform:&v8 animated:v4];
    }
  }
}

- (CGAffineTransform)_orientationTransform
{
  int64_t orientation = self->_orientation;
  if (orientation == 2)
  {
    double v5 = 3.14159265;
  }
  else if (orientation == 4)
  {
    v14.a = 0.0;
    *(void *)&v14.b = &v14;
    *(void *)&v14.c = 0x2020000000;
    v14.d = 0.0;
    double v7 = [(CAMSystemOverlaySlider *)self _selectorConfigurations];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__CAMSystemOverlaySlider__orientationTransform__block_invoke_2;
    v15[3] = &unk_263FA4520;
    v15[4] = &v14;
    [v7 enumerateObjectsUsingBlock:v15];

    _Block_object_dispose(&v14, 8);
    double v5 = 1.57079633;
  }
  else
  {
    double v5 = 0.0;
    if (orientation == 3)
    {
      v14.a = 0.0;
      *(void *)&v14.b = &v14;
      *(void *)&v14.c = 0x2020000000;
      v14.d = 0.0;
      double v6 = [(CAMSystemOverlaySlider *)self _selectorConfigurations];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __47__CAMSystemOverlaySlider__orientationTransform__block_invoke;
      v16[3] = &unk_263FA4520;
      v16[4] = &v14;
      [v6 enumerateObjectsUsingBlock:v16];

      _Block_object_dispose(&v14, 8);
      double v5 = -1.57079633;
    }
  }
  double v8 = dbl_209C7B260[[(CAMSystemOverlaySlider *)self alignment] == 0];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeRotation(&v14, v5 + v8);
  CGAffineTransform v12 = v14;
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformScale(&v13, &v12, -1.0, 1.0);
  memset(&v12, 0, sizeof(v12));
  UIRoundToViewScale();
  CGAffineTransform v11 = v13;
  CGAffineTransformTranslate(&v12, &v11, 0.0, v9);
  CGAffineTransform v11 = v12;
  return (CGAffineTransform *)UIIntegralTransform();
}

void __47__CAMSystemOverlaySlider__orientationTransform__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 contentSize];
  double v5 = v4;
  [v3 contentSize];
  double v7 = v6;

  double v8 = vabdd_f64(v5, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v8 > *(double *)(v9 + 24)) {
    *(double *)(v9 + 24) = v8;
  }
}

void __47__CAMSystemOverlaySlider__orientationTransform__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 contentSize];
  double v5 = v4;
  [v3 contentSize];
  double v7 = v6;

  double v8 = vabdd_f64(v5, v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v8 > *(double *)(v9 + 24)) {
    *(double *)(v9 + 24) = v8;
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_int64_t orientation = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (NSNumber)currentNumber
{
  return self->_currentNumber;
}

- (CAMOverlayValueRange)valueRange
{
  return self->_valueRange;
}

- (CAMOverlayDiscreteFloatRange)magneticRange
{
  return self->_magneticRange;
}

- (CAMOverlayDiscreteFloatRange)protectedRange
{
  return self->_protectedRange;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)feedbackDisabled
{
  return self->_feedbackDisabled;
}

- (CAMSystemOverlaySliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSystemOverlaySliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CEKAbstractSlider)_currentSlider
{
  return self->__currentSlider;
}

- (void)_setCurrentSlider:(id)a3
{
}

- (CEKDiscreteSlider)_discreteSlider
{
  return self->__discreteSlider;
}

- (void)_setDiscreteSlider:(id)a3
{
}

- (CEKSlider)_continuousSlider
{
  return self->__continuousSlider;
}

- (void)_setContinuousSlider:(id)a3
{
}

- (NSArray)_selectorConfigurations
{
  return self->__selectorConfigurations;
}

- (void)_setSelectorConfigurations:(id)a3
{
}

- (double)_longestSelectorConfigurationDimension
{
  return self->__longestSelectorConfigurationDimension;
}

- (void)_setLongestSelectorConfigurationDimension:(double)a3
{
  self->__longestSelectorConfigurationDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__selectorConfigurations, 0);
  objc_storeStrong((id *)&self->__continuousSlider, 0);
  objc_storeStrong((id *)&self->__discreteSlider, 0);
  objc_storeStrong((id *)&self->__currentSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_protectedRange, 0);
  objc_storeStrong((id *)&self->_magneticRange, 0);
  objc_storeStrong((id *)&self->_valueRange, 0);
  objc_storeStrong((id *)&self->_currentNumber, 0);
}

@end