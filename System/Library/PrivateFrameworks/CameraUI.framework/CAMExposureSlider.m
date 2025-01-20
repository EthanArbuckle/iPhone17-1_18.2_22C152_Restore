@interface CAMExposureSlider
+ (id)decimalFormatter;
+ (id)exposureValues;
- (CAMExposureSlider)initWithFrame:(CGRect)a3;
- (NSNumberFormatter)_decimalFormatter;
- (double)_previousHorizontalLabelOffset;
- (double)exposureValue;
- (double)horizontalValueLabelOffset;
- (id)valueText;
- (unint64_t)_indexOfClosestValidValueForExposureValue:(double)a3;
- (void)setExposureValueClosestTo:(double)a3;
- (void)set_previousHorizontalLabelOffset:(double)a3;
- (void)updateValueLabel;
@end

@implementation CAMExposureSlider

+ (id)exposureValues
{
  if (exposureValues_onceToken != -1) {
    dispatch_once(&exposureValues_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)exposureValues_exposureValues;
  return v2;
}

void __35__CAMExposureSlider_exposureValues__block_invoke()
{
  v0 = (void *)exposureValues_exposureValues;
  exposureValues_exposureValues = (uint64_t)&unk_26BDE04F0;
}

+ (id)decimalFormatter
{
  if (decimalFormatter_onceToken_0 != -1) {
    dispatch_once(&decimalFormatter_onceToken_0, &__block_literal_global_26);
  }
  v2 = (void *)decimalFormatter_decimalFormatter;
  return v2;
}

void __37__CAMExposureSlider_decimalFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)decimalFormatter_decimalFormatter;
  decimalFormatter_decimalFormatter = (uint64_t)v0;

  [(id)decimalFormatter_decimalFormatter setPositiveFormat:@"0.0"];
  [(id)decimalFormatter_decimalFormatter setNegativeFormat:@"0.0"];
  v2 = [(id)decimalFormatter_decimalFormatter stringFromNumber:&unk_26BDDEEC8];
  [(id)decimalFormatter_decimalFormatter setZeroSymbol:v2];

  v3 = [(id)decimalFormatter_decimalFormatter plusSign];
  [(id)decimalFormatter_decimalFormatter setPositivePrefix:v3];

  id v4 = [(id)decimalFormatter_decimalFormatter minusSign];
  [(id)decimalFormatter_decimalFormatter setNegativePrefix:v4];
}

- (CAMExposureSlider)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMExposureSlider;
  v3 = -[CEKDiscreteSlider initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CEKDiscreteSlider *)v3 setColorHighlight:2];
    v5 = [(id)objc_opt_class() exposureValues];
    -[CEKDiscreteSlider setIndexCount:](v4, "setIndexCount:", [v5 count]);

    v6 = CAMLocalizedFrameworkString(@"EXPOSURE_SLIDER_TITLE", 0);
    [(CEKDiscreteSlider *)v4 setTitleText:v6];

    v7 = [(CEKDiscreteSlider *)v4 tickMarksConfiguration];
    [v7 setMainTickMarkInterval:3];

    v8 = [(CEKDiscreteSlider *)v4 tickMarksConfiguration];
    [v8 setTickMarkSpacing:20.0];

    [(CEKDiscreteSlider *)v4 setTickMarkCountBetweenIndexes:0];
  }
  return v4;
}

- (void)setExposureValueClosestTo:(double)a3
{
  unint64_t v4 = [(CAMExposureSlider *)self _indexOfClosestValidValueForExposureValue:a3];
  [(CEKDiscreteSlider *)self setSelectedIndex:v4];
}

- (double)exposureValue
{
  v3 = [(id)objc_opt_class() exposureValues];
  unint64_t v4 = objc_msgSend(v3, "objectAtIndex:", -[CEKDiscreteSlider selectedIndex](self, "selectedIndex"));
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (double)horizontalValueLabelOffset
{
  [(CAMExposureSlider *)self exposureValue];
  double v3 = -3.0;
  BOOL v5 = v4 < 0.0;
  if (v4 > 0.0) {
    return v3 - CAMPixelWidthForView(self);
  }
  double result = 1.0;
  double v3 = -2.0;
  if (v5) {
    return v3 - CAMPixelWidthForView(self);
  }
  return result;
}

- (id)valueText
{
  double v3 = [(id)objc_opt_class() decimalFormatter];
  double v4 = NSNumber;
  [(CAMExposureSlider *)self exposureValue];
  BOOL v5 = objc_msgSend(v4, "numberWithDouble:");
  double v6 = [v3 stringFromNumber:v5];

  return v6;
}

- (void)updateValueLabel
{
  v6.receiver = self;
  v6.super_class = (Class)CAMExposureSlider;
  [(CEKDiscreteSlider *)&v6 updateValueLabel];
  [(CAMExposureSlider *)self horizontalValueLabelOffset];
  double v4 = v3;
  [(CAMExposureSlider *)self _previousHorizontalLabelOffset];
  if (v4 != v5)
  {
    [(CAMExposureSlider *)self setNeedsLayout];
    [(CAMExposureSlider *)self set_previousHorizontalLabelOffset:v4];
  }
}

- (unint64_t)_indexOfClosestValidValueForExposureValue:(double)a3
{
  double v4 = [(id)objc_opt_class() exposureValues];
  uint64_t v9 = 0;
  objc_super v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0x7FEFFFFFFFFFFFFFLL;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CAMExposureSlider__indexOfClosestValidValueForExposureValue___block_invoke;
  v7[3] = &unk_263FA63A8;
  *(double *)&v7[6] = a3;
  v7[4] = v8;
  v7[5] = &v9;
  [v4 enumerateObjectsUsingBlock:v7];
  unint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __63__CAMExposureSlider__indexOfClosestValidValueForExposureValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 doubleValue];
  double v9 = vabdd_f64(v8, *(double *)(a1 + 48));
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v9 >= *(double *)(v10 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v10 + 24) = v9;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (double)_previousHorizontalLabelOffset
{
  return self->__previousHorizontalLabelOffset;
}

- (void)set_previousHorizontalLabelOffset:(double)a3
{
  self->__previousHorizontalLabelOffset = a3;
}

- (NSNumberFormatter)_decimalFormatter
{
  return self->__decimalFormatter;
}

- (void).cxx_destruct
{
}

@end