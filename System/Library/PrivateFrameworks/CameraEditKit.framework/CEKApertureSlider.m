@interface CEKApertureSlider
- (BOOL)includesOffState;
- (BOOL)isSliderOn;
- (CEKApertureSlider)initWithFrame:(CGRect)a3;
- (NSNumberFormatter)_decimalFormatter;
- (NSNumberFormatter)_wholeNumberFormatter;
- (double)apertureValue;
- (double)horizontalValueLabelOffset;
- (double)markedApertureValue;
- (double)maximumApertureValue;
- (double)minimumApertureValue;
- (id)valueText;
- (unint64_t)_discreteIndexForValidApertureIndex:(unint64_t)a3;
- (unint64_t)_maximumApertureIndex;
- (unint64_t)_minimumApertureIndex;
- (unint64_t)_validApertureIndexForDiscreteIndex:(unint64_t)a3;
- (void)_setMaximumApertureIndex:(unint64_t)a3;
- (void)_setMinimumApertureIndex:(unint64_t)a3;
- (void)_updateIndexCount;
- (void)_updateMainTickMarkOffset;
- (void)setApertureValueClosestTo:(double)a3;
- (void)setIncludesOffState:(BOOL)a3;
- (void)setMarkedApertureValueClosestTo:(double)a3;
- (void)setMinimumApertureValueClosestTo:(double)a3 maximumApertureValueClosestTo:(double)a4;
- (void)setSliderOn:(BOOL)a3;
@end

@implementation CEKApertureSlider

- (CEKApertureSlider)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CEKApertureSlider;
  v3 = -[CEKDiscreteSlider initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CEKApertureStops validApertureValues];
    -[CEKDiscreteSlider setIndexCount:](v3, "setIndexCount:", [v4 count]);
    v3->__maximumApertureIndex = [v4 count] - 1;
    v3->__minimumApertureIndex = 0;
    v5 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    decimalFormatter = v3->__decimalFormatter;
    v3->__decimalFormatter = v5;

    [(NSNumberFormatter *)v3->__decimalFormatter setPositiveFormat:@"0.0"];
    v7 = [(NSNumberFormatter *)v3->__decimalFormatter stringFromNumber:&unk_1F1A0F818];
    int v8 = [v7 isEqualToString:@"4,5"];

    if (v8) {
      [(NSNumberFormatter *)v3->__decimalFormatter setDecimalSeparator:@"."];
    }
    v9 = CEKLocalizedFrameworkString(@"DEPTH_SLIDER_VALUE_FORMAT", 0);
    v10 = [NSString stringWithValidatedFormat:v9, @"%@", 0, @"0.0" validFormatSpecifiers error];
    [(NSNumberFormatter *)v3->__decimalFormatter setPositiveFormat:v10];

    v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    wholeNumberFormatter = v3->__wholeNumberFormatter;
    v3->__wholeNumberFormatter = v11;

    v13 = [NSString stringWithValidatedFormat:v9, @"%@", 0, @"0" validFormatSpecifiers error];
    [(NSNumberFormatter *)v3->__wholeNumberFormatter setPositiveFormat:v13];

    v14 = CEKLocalizedFrameworkString(@"DEPTH_SLIDER_TITLE", 0);
    [(CEKDiscreteSlider *)v3 setTitleText:v14];

    [(CEKApertureSlider *)v3 _updateMainTickMarkOffset];
    [(CEKDiscreteSlider *)v3 updateValueLabel];
  }
  return v3;
}

- (double)horizontalValueLabelOffset
{
  return -3.0 - CEKPixelWidthForView(self);
}

- (id)valueText
{
  [(CEKApertureSlider *)self apertureValue];
  double v4 = v3;
  if (v3 >= 10.0) {
    [(CEKApertureSlider *)self _wholeNumberFormatter];
  }
  else {
  v5 = [(CEKApertureSlider *)self _decimalFormatter];
  }
  v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:v4];
  v7 = [v5 stringFromNumber:v6];

  BOOL v8 = [(CEKApertureSlider *)self includesOffState];
  if (v4 == 0.0 && v8)
  {
    uint64_t v9 = CEKLocalizedFrameworkString(@"DEPTH_SLIDER_OFF", 0);

    v7 = (void *)v9;
  }
  return v7;
}

- (void)_updateMainTickMarkOffset
{
  unint64_t v3 = [(CEKApertureSlider *)self _minimumApertureIndex];
  unint64_t v4 = v3
     - +[CEKApertureStops firstFullStopIndexAfterOrIncludingIndex:v3];
  id v5 = [(CEKDiscreteSlider *)self tickMarksConfiguration];
  [v5 setMainTickMarkOffset:v4];
}

- (void)_updateIndexCount
{
  [(CEKApertureSlider *)self minimumApertureValue];
  unint64_t v3 = +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:");
  [(CEKApertureSlider *)self maximumApertureValue];
  unint64_t v4 = +[CEKApertureStops indexOfClosestValidValueForAperture:](CEKApertureStops, "indexOfClosestValidValueForAperture:")- v3;
  BOOL v5 = [(CEKApertureSlider *)self includesOffState];
  uint64_t v6 = 1;
  if (v5) {
    uint64_t v6 = 2;
  }
  [(CEKDiscreteSlider *)self setIndexCount:v4 + v6];
}

- (void)setApertureValueClosestTo:(double)a3
{
  unint64_t v4 = [(CEKApertureSlider *)self _discreteIndexForValidApertureIndex:(unint64_t)CEKClamp((double)+[CEKApertureStops indexOfClosestValidValueForAperture:a3], (double)[(CEKApertureSlider *)self _minimumApertureIndex], (double)[(CEKApertureSlider *)self _maximumApertureIndex])];
  [(CEKDiscreteSlider *)self setSelectedIndex:v4];
}

- (void)setMinimumApertureValueClosestTo:(double)a3 maximumApertureValueClosestTo:(double)a4
{
  [(CEKApertureSlider *)self minimumApertureValue];
  double v8 = v7;
  [(CEKApertureSlider *)self maximumApertureValue];
  if (v8 != a3 || v9 != a4)
  {
    [(CEKApertureSlider *)self apertureValue];
    double v12 = v11;
    [(CEKApertureSlider *)self markedApertureValue];
    double v14 = v13;
    unint64_t v15 = +[CEKApertureStops indexOfClosestValidValueForAperture:a3];
    unint64_t v16 = +[CEKApertureStops indexOfClosestValidValueForAperture:a4];
    self->__minimumApertureIndex = v15;
    self->__maximumApertureIndex = v16;
    [(CEKApertureSlider *)self _updateIndexCount];
    [(CEKApertureSlider *)self setApertureValueClosestTo:v12];
    [(CEKApertureSlider *)self setMarkedApertureValueClosestTo:v14];
    [(CEKApertureSlider *)self _updateMainTickMarkOffset];
    [(CEKDiscreteSlider *)self updateValueLabel];
    [(CEKApertureSlider *)self setNeedsLayout];
  }
}

- (double)minimumApertureValue
{
  unint64_t v3 = +[CEKApertureStops validApertureValues];
  unint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[CEKApertureSlider _minimumApertureIndex](self, "_minimumApertureIndex"));
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)maximumApertureValue
{
  unint64_t v3 = +[CEKApertureStops validApertureValues];
  unint64_t v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[CEKApertureSlider _maximumApertureIndex](self, "_maximumApertureIndex"));
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)apertureValue
{
  if ([(CEKApertureSlider *)self includesOffState])
  {
    unint64_t v3 = [(CEKDiscreteSlider *)self selectedIndex];
    if (v3 >= [(CEKDiscreteSlider *)self indexCount] - 1) {
      return 0.0;
    }
  }
  unint64_t v4 = +[CEKApertureStops validApertureValues];
  double v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", -[CEKApertureSlider _validApertureIndexForDiscreteIndex:](self, "_validApertureIndexForDiscreteIndex:", -[CEKDiscreteSlider selectedIndex](self, "selectedIndex")));
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (double)markedApertureValue
{
  unint64_t v3 = [(CEKDiscreteSlider *)self indexCount];
  unint64_t v4 = v3 - [(CEKApertureSlider *)self includesOffState];
  if ([(CEKDiscreteSlider *)self markedIndex] >= v4) {
    return 0.0;
  }
  double v5 = +[CEKApertureStops validApertureValues];
  double v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[CEKApertureSlider _validApertureIndexForDiscreteIndex:](self, "_validApertureIndexForDiscreteIndex:", -[CEKDiscreteSlider markedIndex](self, "markedIndex")));
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (void)setMarkedApertureValueClosestTo:(double)a3
{
  unint64_t v4 = [(CEKApertureSlider *)self _discreteIndexForValidApertureIndex:+[CEKApertureStops indexOfClosestValidValueForAperture:a3]];
  [(CEKDiscreteSlider *)self setMarkedIndex:v4];
}

- (void)setIncludesOffState:(BOOL)a3
{
  if (self->_includesOffState != a3)
  {
    self->_includesOffState = a3;
    [(CEKApertureSlider *)self _updateIndexCount];
  }
}

- (BOOL)isSliderOn
{
  if (![(CEKApertureSlider *)self includesOffState]) {
    return 1;
  }
  unint64_t v3 = [(CEKDiscreteSlider *)self selectedIndex];
  return v3 < [(CEKDiscreteSlider *)self indexCount] - 1;
}

- (void)setSliderOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CEKApertureSlider *)self includesOffState]
    && [(CEKApertureSlider *)self isSliderOn] != v3)
  {
    if (v3)
    {
      [(CEKApertureSlider *)self markedApertureValue];
      if (v5 == 0.0) {
        [(CEKApertureSlider *)self maximumApertureValue];
      }
      -[CEKApertureSlider setApertureValueClosestTo:](self, "setApertureValueClosestTo:");
    }
    else
    {
      unint64_t v6 = [(CEKDiscreteSlider *)self indexCount] - 1;
      [(CEKDiscreteSlider *)self setSelectedIndex:v6];
    }
  }
}

- (unint64_t)_validApertureIndexForDiscreteIndex:(unint64_t)a3
{
  return [(CEKApertureSlider *)self _minimumApertureIndex] + a3;
}

- (unint64_t)_discreteIndexForValidApertureIndex:(unint64_t)a3
{
  return a3 - [(CEKApertureSlider *)self _minimumApertureIndex];
}

- (BOOL)includesOffState
{
  return self->_includesOffState;
}

- (unint64_t)_minimumApertureIndex
{
  return self->__minimumApertureIndex;
}

- (void)_setMinimumApertureIndex:(unint64_t)a3
{
  self->__minimumApertureIndex = a3;
}

- (unint64_t)_maximumApertureIndex
{
  return self->__maximumApertureIndex;
}

- (void)_setMaximumApertureIndex:(unint64_t)a3
{
  self->__maximumApertureIndex = a3;
}

- (NSNumberFormatter)_decimalFormatter
{
  return self->__decimalFormatter;
}

- (NSNumberFormatter)_wholeNumberFormatter
{
  return self->__wholeNumberFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wholeNumberFormatter, 0);
  objc_storeStrong((id *)&self->__decimalFormatter, 0);
}

@end