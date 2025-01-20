@interface HKSleepDurationCoordinate
- (BOOL)highlighted;
- (HKSleepDurationCoordinate)initWithStackPoints:(id)a3 goalLineYValue:(id)a4 highlighted:(BOOL)a5 userInfo:(id)a6;
- (NSArray)stackPoints;
- (NSNumber)goalLineYValue;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (void)setGoalLineYValue:(id)a3;
- (void)setStackPoints:(id)a3;
@end

@implementation HKSleepDurationCoordinate

- (HKSleepDurationCoordinate)initWithStackPoints:(id)a3 goalLineYValue:(id)a4 highlighted:(BOOL)a5 userInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if ((unint64_t)[v11 count] >= 2)
  {
    v15 = [v11 firstObject];
    [v15 CGPointValue];
    double v17 = v16;
    double v19 = v18;
    v20 = [v11 lastObject];
    [v20 CGPointValue];
    v25.receiver = self;
    v25.super_class = (Class)HKSleepDurationCoordinate;
    v23 = -[HKMinMaxCoordinate initWithMin:max:userInfo:](&v25, sel_initWithMin_max_userInfo_, v13, v17, v19, v21, v22);

    if (v23)
    {
      objc_storeStrong((id *)&v23->_stackPoints, a3);
      objc_storeStrong((id *)&v23->_goalLineYValue, a4);
      v23->_highlighted = a5;
    }
    self = v23;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F1CA48];
  v8 = [(HKSleepDurationCoordinate *)self stackPoints];
  v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [(HKSleepDurationCoordinate *)self stackPoints];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) CGPointValue];
        float64x2_t v17 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v15), *(float64x2_t *)&a3->a, v16));
        double v18 = v17.f64[1];
        if (v4) {
          v17.f64[0] = HKUIFloorCGPointToScreenScale(v17.f64[0], v17.f64[1]);
        }
        double v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v17.f64[0], v18);
        [v9 addObject:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  goalLineYValue = self->_goalLineYValue;
  if (goalLineYValue)
  {
    [(NSNumber *)goalLineYValue doubleValue];
    double v22 = [NSNumber numberWithDouble:a3->ty + v21 * a3->d + a3->b * 0.0];
  }
  else
  {
    double v22 = 0;
  }
  id v23 = objc_alloc((Class)objc_opt_class());
  BOOL highlighted = self->_highlighted;
  objc_super v25 = [(HKMinMaxCoordinate *)self userInfo];
  v26 = (void *)[v23 initWithStackPoints:v9 goalLineYValue:v22 highlighted:highlighted userInfo:v25];

  return v26;
}

- (NSArray)stackPoints
{
  return self->_stackPoints;
}

- (void)setStackPoints:(id)a3
{
}

- (NSNumber)goalLineYValue
{
  return self->_goalLineYValue;
}

- (void)setGoalLineYValue:(id)a3
{
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalLineYValue, 0);
  objc_storeStrong((id *)&self->_stackPoints, 0);
}

@end