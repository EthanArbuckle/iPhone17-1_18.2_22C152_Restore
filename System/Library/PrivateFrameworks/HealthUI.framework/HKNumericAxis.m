@interface HKNumericAxis
+ (double)_adjustRangeDownWithStartValue:(double)a3 endValue:(double)a4 factor:(double)a5;
+ (double)_adjustRangeUpWithStartValue:(double)a3 endValue:(double)a4 factor:(double)a5;
+ (double)_roundDownByMultiple:(double)a3 factor:(double)a4;
+ (double)_roundUpByMultiple:(double)a3 factor:(double)a4;
+ (id)preferredAxisStyle;
+ (id)standardNumericYAxisWithConfigurationOverrides:(id)a3;
+ (id)ticksAndLabelsForRangeInModelCoordinates:(id)a3 maximumLabelCount:(int64_t)a4 endingOptions:(int64_t)a5 dimension:(id)a6;
- (HKAxisLabelDimension)labelDimension;
- (HKNumericAxis)initWithConfiguration:(id)a3;
- (double)bottomVerticalLabelPadding;
- (double)labelSpacingFactorForNumberFormatter;
- (double)offsetForLegendView;
- (double)topVerticalLabelPadding;
- (id)adjustValueRangeForLabels:(id)a3;
- (id)adjustedRangeForFittedRange:(id)a3 chartRange:(HKRange)a4;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (id)stringFromNumber:(id)a3;
@end

@implementation HKNumericAxis

+ (id)standardNumericYAxisWithConfigurationOverrides:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HKNumericAxisConfiguration);
  v6 = [a1 preferredAxisStyle];
  [(HKAxisConfiguration *)v5 setPreferredStyle:v6];

  [(HKNumericAxisConfiguration *)v5 setTopVerticalLabelPadding:4.0];
  [(HKNumericAxisConfiguration *)v5 setBottomVerticalLabelPadding:4.0];
  if (v4) {
    [(HKNumericAxisConfiguration *)v5 applyOverridesFromNumericAxisConfiguration:v4];
  }
  v7 = [[HKNumericAxis alloc] initWithConfiguration:v5];

  return v7;
}

- (HKNumericAxis)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [v4 zoomScaleEngine];

  if (!v5)
  {
    v6 = objc_alloc_init(HKScalarZoomScale);
    [v4 setZoomScaleEngine:v6];
  }
  v13.receiver = self;
  v13.super_class = (Class)HKNumericAxis;
  v7 = [(HKAxis *)&v13 initWithConfiguration:v4];
  if (v7)
  {
    v8 = [v4 labelDimension];
    v9 = v8;
    if (!v8) {
      v9 = objc_alloc_init(HKAxisLabelDimensionScalar);
    }
    objc_storeStrong((id *)&v7->_labelDimension, v9);
    if (!v8) {

    }
    [v4 topVerticalLabelPadding];
    v7->_topVerticalLabelPadding = v10;
    [v4 bottomVerticalLabelPadding];
    v7->_bottomVerticalLabelPadding = v11;
  }

  return v7;
}

+ (id)preferredAxisStyle
{
  v2 = objc_alloc_init(HKSolidFillStyle);
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [(HKSolidFillStyle *)v2 setColor:v3];

  id v4 = objc_alloc_init(HKAxisStyle);
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  v7 = +[HKAxisLabelStyle labelStyleWithColor:v5 font:v6 horizontalAlignment:2 verticalAlignment:2 hyphenationFactor:&unk_1F3C22A60];
  [(HKAxisStyle *)v4 setLabelStyle:v7];

  [(HKAxisStyle *)v4 setTickPositions:1];
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  v9 = +[HKStrokeStyle strokeStyleWithColor:v8 lineWidth:2.0];
  [(HKAxisStyle *)v4 setAxisLineStyle:v9];

  [(HKAxisStyle *)v4 setFillStyle:v2];
  double v10 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  double v11 = +[HKStrokeStyle strokeStyleWithColor:v10 lineWidth:HKUIOnePixel()];

  [(HKAxisStyle *)v4 setBorderStyleForFill:v11];
  [(HKAxisStyle *)v4 setFillInnerPadding:4.0];
  [(HKAxisStyle *)v4 setFillOuterPadding:6.0];
  [(HKAxisStyle *)v4 setLocation:1];
  [(HKAxisStyle *)v4 setShowGridLines:1];
  v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  objc_super v13 = [v12 colorWithAlphaComponent:0.5];
  v14 = +[HKStrokeStyle strokeStyleWithColor:v13 lineWidth:0.5];
  [(HKAxisStyle *)v4 setGridLineStyle:v14];

  return v4;
}

- (void).cxx_destruct
{
}

- (id)adjustedRangeForFittedRange:(id)a3 chartRange:(HKRange)a4
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v7 = a3;
  v8 = [v7 minValue];
  [v8 doubleValue];
  double v10 = v9;
  double v11 = [v7 maxValue];

  [v11 doubleValue];
  double v13 = v12;

  if (var1 >= 0.0) {
    double v14 = var0;
  }
  else {
    double v14 = var0 + var1;
  }
  if (var1 >= 0.0) {
    double v15 = var0 + var1;
  }
  else {
    double v15 = var0;
  }
  +[HKAxis expandByPointsLow:high:modelRange:pointRange:](HKAxis, "expandByPointsLow:high:modelRange:pointRange:", self->_bottomVerticalLabelPadding, self->_topVerticalLabelPadding, v10, v13, v14, v15);
  double v17 = v16;
  v18 = objc_msgSend(NSNumber, "numberWithDouble:");
  v19 = [NSNumber numberWithDouble:v17];
  v20 = +[HKValueRange valueRangeWithMinValue:v18 maxValue:v19];

  return v20;
}

- (id)stringFromNumber:(id)a3
{
  return (id)[MEMORY[0x1E4F28EE0] localizedStringFromNumber:a3 numberStyle:1];
}

- (double)labelSpacingFactorForNumberFormatter
{
  return 1.0;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5 = a3;
  v6 = +[HKNumericAxis ticksAndLabelsForRangeInModelCoordinates:v5 maximumLabelCount:[(HKAxis *)self maxLabels] endingOptions:[(HKAxis *)self axisLabelEndings] dimension:self->_labelDimension];

  return v6;
}

- (id)adjustValueRangeForLabels:(id)a3
{
  id v4 = a3;
  id v5 = +[HKNumericAxis ticksAndLabelsForRangeInModelCoordinates:v4 maximumLabelCount:[(HKAxis *)self maxLabels] endingOptions:0 dimension:self->_labelDimension];
  v6 = v5;
  if (v5 && (unint64_t)[v5 count] >= 2)
  {
    id v7 = [v6 firstObject];
    v8 = [v6 lastObject];
    double v9 = [v7 location];
    double v10 = [v8 location];
    id v11 = +[HKValueRange valueRangeWithMinValue:v9 maxValue:v10];
  }
  else
  {
    id v11 = v4;
  }

  return v11;
}

- (double)offsetForLegendView
{
  return self->_topVerticalLabelPadding;
}

+ (id)ticksAndLabelsForRangeInModelCoordinates:(id)a3 maximumLabelCount:(int64_t)a4 endingOptions:(int64_t)a5 dimension:(id)a6
{
  char v7 = a5;
  id v9 = a3;
  id v10 = a6;
  id v11 = [v9 minValue];
  [v11 doubleValue];
  double v13 = v12;

  double v14 = [v9 maxValue];
  [v14 doubleValue];
  double v16 = v15;

  id v17 = 0;
  if (fabs(v13) != INFINITY && fabs(v16) != INFINITY)
  {
    id v17 = 0;
    double v18 = fabs(v16 - v13);
    BOOL v19 = (unint64_t)(*(void *)&v18 - 1) >= 0xFFFFFFFFFFFFFLL;
    unint64_t v20 = *(void *)&v18 - 0x10000000000000;
    int v21 = !v19;
    BOOL v22 = v20 >> 53 < 0x3FF;
    if (COERCE__INT64(v16 - v13) >= 0)
    {
      BOOL v22 = 0;
      int v21 = 0;
    }
    uint64_t v23 = fabs(v16 - v13);
    if (!v23) {
      int v21 = 1;
    }
    if (v23 == 0x7FF0000000000000) {
      int v24 = 1;
    }
    else {
      int v24 = v21;
    }
    if (v23 > 0x7FF0000000000000) {
      int v24 = 1;
    }
    if (a4 >= 1 && ((v24 | v22) & 1) == 0)
    {
      [v10 niceStepSizeLargerThan:(v16 - v13) / (double)(a4 + 1)];
      double v26 = v25;
      v27 = [v10 endingLabelsFactorOverride];

      double v28 = v26;
      if (v27)
      {
        v29 = [v10 endingLabelsFactorOverride];
        [v29 floatValue];
        double v28 = v30;
      }
      if (v26 <= 0.0) {
        goto LABEL_50;
      }
      double v31 = 0.0;
      while (1)
      {
        if (v7)
        {
          +[HKNumericAxis _roundUpByMultiple:v13 factor:v28];
          double v33 = v34;
          double v70 = v13;
        }
        else
        {
          +[HKNumericAxis _roundDownByMultiple:v13 factor:v28];
          double v33 = v32;
          double v70 = v32;
        }
        if ((v7 & 2) != 0)
        {
          +[HKNumericAxis _roundDownByMultiple:v16 factor:v28];
          double v36 = v38;
          if (v27)
          {
            +[HKNumericAxis _adjustRangeDownWithStartValue:v33 endValue:v38 factor:v26];
            double v36 = v39;
          }
          double v37 = v16;
        }
        else
        {
          +[HKNumericAxis _roundUpByMultiple:v16 factor:v28];
          double v36 = v35;
          if (v27)
          {
            +[HKNumericAxis _adjustRangeUpWithStartValue:v33 endValue:v35 factor:v26];
            double v36 = v35;
          }
          double v37 = v35;
        }
        int64_t v40 = (uint64_t)rint((v37 - v70) / v26);
        if (a4 == 2 && v40 >= 2)
        {
          double v41 = v33;
          double v43 = v36 - v33;
          goto LABEL_42;
        }
        double v41 = v33;
        if (v40 < a4) {
          break;
        }
        objc_msgSend(v10, "niceStepSizeLargerThan:", v26, v36);
        double v26 = v42;
        double v43 = 0.0;
        if (v42 > 0.0)
        {
          if (!v27) {
            double v28 = v42;
          }
          double v31 = v31 + 1.0;
          if (v31 < 10.0) {
            continue;
          }
        }
        goto LABEL_42;
      }
      double v43 = v26;
LABEL_42:
      if (v31 >= 10.0)
      {
LABEL_50:
        id v17 = 0;
      }
      else
      {
        [v10 ticksPerStepSize:v26];
        if (v44 <= 0.0) {
          double v44 = 1.0;
        }
        double v45 = v26 / v44;
        if (v27) {
          double v46 = v28;
        }
        else {
          double v46 = v26 / v44;
        }
        if (v7)
        {
          +[HKNumericAxis _roundUpByMultiple:v70 factor:v46];
          double v47 = v48;
        }
        else
        {
          double v47 = v70;
        }
        id v68 = v9;
        if ((v7 & 2) != 0)
        {
          +[HKNumericAxis _roundDownByMultiple:v37 factor:v46];
          double v37 = v49;
        }
        v71 = [v10 formatterForLabelStepSize:v26];
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v50 = (uint64_t)rint((v37 - v47) / v45);
        if ((v50 & 0x8000000000000000) == 0)
        {
          uint64_t v51 = 0;
          uint64_t v52 = (uint64_t)rint(v43 / v45);
          uint64_t v53 = (uint64_t)rint((v41 - v47) / v45);
          uint64_t v54 = v50 + 1;
          v55 = &off_1E6D4F000;
          unint64_t v56 = 0x1E4F28000uLL;
          uint64_t v69 = v52;
          do
          {
            id v57 = objc_alloc_init((Class)v55[56]);
            v58 = [*(id *)(v56 + 3792) numberWithDouble:v47 + (double)v51 * v45];
            [v57 setLocation:v58];

            if (v51 % v52 == v53)
            {
              [v57 setLabelType:1];
              v59 = [v57 location];
              [v10 stringForLocation:v59 formatterForStepSize:v71];
              id v60 = v17;
              uint64_t v61 = v54;
              uint64_t v62 = v53;
              id v63 = v10;
              unint64_t v64 = v56;
              v66 = v65 = v55;
              [v57 setText:v66];

              v55 = v65;
              unint64_t v56 = v64;
              id v10 = v63;
              uint64_t v53 = v62;
              uint64_t v54 = v61;
              id v17 = v60;
              uint64_t v52 = v69;
            }
            else
            {
              [v57 setLabelType:2];
              [v57 setText:0];
            }
            [v17 addObject:v57];

            ++v51;
          }
          while (v54 != v51);
        }

        id v9 = v68;
      }
    }
  }

  return v17;
}

+ (double)_roundDownByMultiple:(double)a3 factor:(double)a4
{
  return floor((a4 / 100000000.0 + a3) / a4) * a4;
}

+ (double)_roundUpByMultiple:(double)a3 factor:(double)a4
{
  return ceil((a3 + a4 / -100000000.0) / a4) * a4;
}

+ (double)_adjustRangeDownWithStartValue:(double)a3 endValue:(double)a4 factor:(double)a5
{
  uint64_t v7 = (uint64_t)fmod(a4 - a3, a5);
  double v8 = a5 - (double)v7;
  if (v7 <= 0) {
    double v8 = 0.0;
  }
  return a4 - v8;
}

+ (double)_adjustRangeUpWithStartValue:(double)a3 endValue:(double)a4 factor:(double)a5
{
  uint64_t v7 = (uint64_t)fmod(a4 - a3, a5);
  double v8 = a5 - (double)v7;
  if (v7 <= 0) {
    double v8 = -0.0;
  }
  return v8 + a4;
}

- (HKAxisLabelDimension)labelDimension
{
  return self->_labelDimension;
}

- (double)topVerticalLabelPadding
{
  return self->_topVerticalLabelPadding;
}

- (double)bottomVerticalLabelPadding
{
  return self->_bottomVerticalLabelPadding;
}

@end