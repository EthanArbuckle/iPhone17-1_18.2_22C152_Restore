@interface HKAppleWalkingSteadinessAxis
+ (id)standardAxisWithDisplayType:(id)a3;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (HKAppleWalkingSteadinessAxis)initWithDisplayType:(id)a3;
- (HKDisplayType)displayType;
- (NSArray)cachedAxisLabels;
- (id)_axisLabelsForClassificationsWithDisplayType:(id)a3;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (void)setCachedAxisLabels:(id)a3;
- (void)setDisplayType:(id)a3;
@end

@implementation HKAppleWalkingSteadinessAxis

+ (id)standardAxisWithDisplayType:(id)a3
{
  id v3 = a3;
  v4 = [[HKAppleWalkingSteadinessAxis alloc] initWithDisplayType:v3];

  return v4;
}

- (HKAppleWalkingSteadinessAxis)initWithDisplayType:(id)a3
{
  id v5 = a3;
  v6 = objc_alloc_init(HKNumericAxisConfiguration);
  v7 = +[HKNumericAxis preferredAxisStyle];
  [(HKAxisConfiguration *)v6 setPreferredStyle:v7];

  [(HKNumericAxisConfiguration *)v6 setTopVerticalLabelPadding:5.0];
  [(HKNumericAxisConfiguration *)v6 setBottomVerticalLabelPadding:5.0];
  v13.receiver = self;
  v13.super_class = (Class)HKAppleWalkingSteadinessAxis;
  v8 = [(HKNumericAxis *)&v13 initWithConfiguration:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayType, a3);
    uint64_t v10 = [(HKAppleWalkingSteadinessAxis *)v9 _axisLabelsForClassificationsWithDisplayType:v9->_displayType];
    cachedAxisLabels = v9->_cachedAxisLabels;
    v9->_cachedAxisLabels = (NSArray *)v10;
  }
  return v9;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5 = a3;
  v6 = [v5 minValue];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v5 maxValue];

  [v9 doubleValue];
  double v11 = v10;

  v12 = 0;
  if (fabs(v8) != INFINITY && fabs(v11) != INFINITY)
  {
    double v13 = fabs(v11 - v8);
    BOOL v14 = (unint64_t)(*(void *)&v13 - 1) < 0xFFFFFFFFFFFFFLL;
    BOOL v15 = (unint64_t)(*(void *)&v13 - 0x10000000000000) >> 53 < 0x3FF;
    if (COERCE__INT64(v11 - v8) >= 0)
    {
      BOOL v15 = 0;
      BOOL v14 = 0;
    }
    uint64_t v16 = fabs(v11 - v8);
    if (!v16) {
      BOOL v14 = 1;
    }
    int v17 = v16 == 0x7FF0000000000000 || v14;
    if (v16 > 0x7FF0000000000000) {
      int v17 = 1;
    }
    if ((v17 | v15)) {
      v12 = 0;
    }
    else {
      v12 = self->_cachedAxisLabels;
    }
  }
  return v12;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  v11.receiver = self;
  v11.super_class = (Class)HKAppleWalkingSteadinessAxis;
  -[HKAxis renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:](&v11, sel_renderPositionForLabelLocation_rect_zoomScale_contentOffset_constantOffset_isHorizontal_optionalOffset_, a3, a8, *(void *)&a9.x, *(void *)&a9.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5, a6.x, a6.y, a7, v12, v13);
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)_axisLabelsForClassificationsWithDisplayType:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  BOOL v14 = __Block_byref_object_copy__21;
  BOOL v15 = __Block_byref_object_dispose__21;
  id v16 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__HKAppleWalkingSteadinessAxis__axisLabelsForClassificationsWithDisplayType___block_invoke;
  v8[3] = &unk_1E6D55C18;
  id v4 = v3;
  id v9 = v4;
  double v10 = &v11;
  id v5 = (void (**)(void *, uint64_t, uint64_t, void))_Block_copy(v8);
  v5[2](v5, 3, 1, 0);
  v5[2](v5, 2, 1, 0);
  v5[2](v5, 1, 1, 1);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __77__HKAppleWalkingSteadinessAxis__axisLabelsForClassificationsWithDisplayType___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4)
{
  hk_minWalkingSteadinessValueForClassification();
  double v9 = v8;
  hk_maxWalkingSteadinessValueForClassification();
  double v11 = v10;
  double v12 = v9 + (v10 - v9) * 0.5;
  id v25 = +[HKMobilityUtilities localizedAxisLabelStringForClassification:a2];
  if (a3)
  {
    uint64_t v13 = objc_alloc_init(HKAxisLabel);
    [(HKAxisLabel *)v13 setLabelType:1];
    BOOL v14 = NSNumber;
    BOOL v15 = [*(id *)(a1 + 32) presentation];
    [v15 adjustedDoubleForDaemonDouble:v9];
    id v16 = objc_msgSend(v14, "numberWithDouble:");
    [(HKAxisLabel *)v13 setLocation:v16];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v13];
  }
  int v17 = objc_alloc_init(HKAxisLabel);
  [(HKAxisLabel *)v17 setLabelType:0];
  v18 = NSNumber;
  v19 = [*(id *)(a1 + 32) presentation];
  [v19 adjustedDoubleForDaemonDouble:v12];
  v20 = objc_msgSend(v18, "numberWithDouble:");
  [(HKAxisLabel *)v17 setLocation:v20];

  [(HKAxisLabel *)v17 setText:v25];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v17];
  if (a4)
  {
    v21 = objc_alloc_init(HKAxisLabel);
    [(HKAxisLabel *)v21 setLabelType:1];
    v22 = NSNumber;
    v23 = [*(id *)(a1 + 32) presentation];
    [v23 adjustedDoubleForDaemonDouble:v11];
    v24 = objc_msgSend(v22, "numberWithDouble:");
    [(HKAxisLabel *)v21 setLocation:v24];

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v21];
  }
}

- (NSArray)cachedAxisLabels
{
  return self->_cachedAxisLabels;
}

- (void)setCachedAxisLabels:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_cachedAxisLabels, 0);
}

@end