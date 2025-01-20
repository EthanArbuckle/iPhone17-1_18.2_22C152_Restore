@interface HKSleepPeriodCoordinate
- (BOOL)highlighted;
- (HKGraphSeriesBlockCoordinateInfo)userInfo;
- (HKSleepPeriodCoordinate)initWithXValue:(double)a3 asleepYValues:(id)a4 inBedYValues:(id)a5 yValues:(id)a6 upperGoalYValue:(id)a7 lowerGoalYValue:(id)a8 highlighted:(BOOL)a9 userInfo:(id)a10;
- (NSArray)asleepYValues;
- (NSArray)inBedYValues;
- (NSArray)yValues;
- (NSNumber)lowerGoalYValue;
- (NSNumber)upperGoalYValue;
- (double)endXValue;
- (double)startXValue;
- (double)xValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
@end

@implementation HKSleepPeriodCoordinate

- (HKSleepPeriodCoordinate)initWithXValue:(double)a3 asleepYValues:(id)a4 inBedYValues:(id)a5 yValues:(id)a6 upperGoalYValue:(id)a7 lowerGoalYValue:(id)a8 highlighted:(BOOL)a9 userInfo:(id)a10
{
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)HKSleepPeriodCoordinate;
  v20 = [(HKSleepPeriodCoordinate *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_xValue = a3;
    objc_storeStrong((id *)&v20->_asleepYValues, a4);
    objc_storeStrong((id *)&v21->_inBedYValues, a5);
    objc_storeStrong((id *)&v21->_yValues, a6);
    objc_storeStrong((id *)&v21->_upperGoalYValue, a7);
    objc_storeStrong((id *)&v21->_lowerGoalYValue, a8);
    v21->_highlighted = a9;
    objc_storeStrong((id *)&v21->_userInfo, a10);
  }

  return v21;
}

- (double)startXValue
{
  return self->_xValue;
}

- (double)endXValue
{
  return self->_xValue;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  asleepYValues = self->_asleepYValues;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke;
  v41[3] = &unk_1E6D55D30;
  v41[4] = self;
  long long v8 = *(_OWORD *)&a3->c;
  long long v42 = *(_OWORD *)&a3->a;
  long long v43 = v8;
  long long v44 = *(_OWORD *)&a3->tx;
  v32 = [(NSArray *)asleepYValues hk_map:v41];
  inBedYValues = self->_inBedYValues;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  long long v10 = *(_OWORD *)&a3->c;
  long long v38 = *(_OWORD *)&a3->a;
  v37[2] = __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke_2;
  v37[3] = &unk_1E6D55D30;
  v37[4] = self;
  long long v39 = v10;
  long long v40 = *(_OWORD *)&a3->tx;
  v11 = [(NSArray *)inBedYValues hk_map:v37];
  double xValue = self->_xValue;
  double a = a3->a;
  double c = a3->c;
  double tx = a3->tx;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v16 = self->_yValues;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        double v21 = self->_xValue;
        [*(id *)(*((void *)&v33 + 1) + 8 * v20) doubleValue];
        v23 = [NSNumber numberWithDouble:a3->ty + v22 * a3->d + a3->b * v21];
        [v6 addObject:v23];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v18);
  }

  upperGoalYValue = self->_upperGoalYValue;
  if (upperGoalYValue)
  {
    [(NSNumber *)upperGoalYValue doubleValue];
    id v26 = [NSNumber numberWithDouble:a3->ty + v25 * a3->d + a3->b * 0.0];
  }
  else
  {
    id v26 = 0;
  }
  lowerGoalYValue = self->_lowerGoalYValue;
  if (lowerGoalYValue)
  {
    [(NSNumber *)lowerGoalYValue doubleValue];
    v29 = [NSNumber numberWithDouble:a3->ty + v28 * a3->d + a3->b * 0.0];
  }
  else
  {
    v29 = 0;
  }
  v30 = (void *)[objc_alloc((Class)objc_opt_class()) initWithXValue:v32 asleepYValues:v11 inBedYValues:v6 yValues:v26 upperGoalYValue:v29 lowerGoalYValue:self->_highlighted highlighted:tx + c * 0.0 + a * xValue userInfo:self->_userInfo];

  return v30;
}

id __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  v5 = [v4 value];
  [v5 doubleValue];
  double v7 = v6;

  long long v8 = [NSNumber numberWithDouble:*(double *)(a1 + 80) + v7 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v3];
  uint64_t v9 = [v4 continuation];

  long long v10 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v8 continuation:v9];

  return v10;
}

id __62__HKSleepPeriodCoordinate_copyWithTransform_roundToViewScale___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(a1 + 32) + 56);
  id v4 = a2;
  v5 = [v4 value];
  [v5 doubleValue];
  double v7 = v6;

  long long v8 = [NSNumber numberWithDouble:*(double *)(a1 + 80) + v7 * *(double *)(a1 + 64) + *(double *)(a1 + 48) * v3];
  uint64_t v9 = [v4 continuation];

  long long v10 = +[HKSleepPeriodChartPointOffset chartPointOffsetWithValue:v8 continuation:v9];

  return v10;
}

- (NSArray)asleepYValues
{
  return self->_asleepYValues;
}

- (NSArray)inBedYValues
{
  return self->_inBedYValues;
}

- (NSArray)yValues
{
  return self->_yValues;
}

- (NSNumber)upperGoalYValue
{
  return self->_upperGoalYValue;
}

- (NSNumber)lowerGoalYValue
{
  return self->_lowerGoalYValue;
}

- (double)xValue
{
  return self->_xValue;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_lowerGoalYValue, 0);
  objc_storeStrong((id *)&self->_upperGoalYValue, 0);
  objc_storeStrong((id *)&self->_yValues, 0);
  objc_storeStrong((id *)&self->_inBedYValues, 0);
  objc_storeStrong((id *)&self->_asleepYValues, 0);
}

@end