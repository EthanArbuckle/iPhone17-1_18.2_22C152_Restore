@interface HKStackedBarCoordinate
- (HKStackedBarCoordinate)initWithStackPoints:(id)a3 userInfo:(id)a4;
- (NSArray)stackPoints;
- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (void)setStackPoints:(id)a3;
@end

@implementation HKStackedBarCoordinate

- (HKStackedBarCoordinate)initWithStackPoints:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 count] >= 2)
  {
    v10 = [v7 firstObject];
    [v10 CGPointValue];
    double v12 = v11;
    double v14 = v13;
    v15 = [v7 lastObject];
    [v15 CGPointValue];
    v20.receiver = self;
    v20.super_class = (Class)HKStackedBarCoordinate;
    v18 = -[HKMinMaxCoordinate initWithMin:max:userInfo:](&v20, sel_initWithMin_max_userInfo_, v8, v12, v14, v16, v17);

    if (v18) {
      objc_storeStrong((id *)&v18->_stackPoints, a3);
    }
    self = v18;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = [(HKStackedBarCoordinate *)self stackPoints];
  v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v10 = [(HKStackedBarCoordinate *)self stackPoints];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) CGPointValue];
        float64x2_t v17 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v15), *(float64x2_t *)&a3->a, v16));
        double v18 = v17.f64[1];
        if (v4) {
          v17.f64[0] = HKUIFloorCGPointToScreenScale(v17.f64[0], v17.f64[1]);
        }
        v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v17.f64[0], v18);
        [v9 addObject:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  id v20 = objc_alloc((Class)objc_opt_class());
  v21 = [(HKMinMaxCoordinate *)self userInfo];
  v22 = (void *)[v20 initWithStackPoints:v9 userInfo:v21];

  return v22;
}

- (NSArray)stackPoints
{
  return self->_stackPoints;
}

- (void)setStackPoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end