@interface HDDataCollectorConfiguration
+ (HDDataCollectorConfiguration)configurationWithType:(unint64_t)a3 aggregatorConfiguration:(id)a4;
+ (HDDataCollectorConfiguration)configurationWithType:(unint64_t)a3 interval:(double)a4 latency:(double)a5;
+ (id)disabledConfiguration;
- (BOOL)isEqual:(id)a3;
- (HDDataCollectorConfiguration)init;
- (double)collectionInterval;
- (double)collectionLatency;
- (id)description;
- (id)mergedConfiguration:(id)a3;
- (unint64_t)collectionType;
@end

@implementation HDDataCollectorConfiguration

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (HDDataCollectorConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HDDataCollectorConfiguration)configurationWithType:(unint64_t)a3 interval:(double)a4 latency:(double)a5
{
  v8 = [HDDataCollectorConfiguration alloc];
  if (v8)
  {
    v10.receiver = v8;
    v10.super_class = (Class)HDDataCollectorConfiguration;
    v8 = objc_msgSendSuper2(&v10, sel_init);
    if (v8)
    {
      v8->_collectionInterval = fmax(a4, 0.0);
      v8->_collectionLatency = fmax(a5, 0.0);
      v8->_collectionType = a3;
    }
  }

  return v8;
}

+ (HDDataCollectorConfiguration)configurationWithType:(unint64_t)a3 aggregatorConfiguration:(id)a4
{
  id v5 = a4;
  v6 = [HDDataCollectorConfiguration alloc];
  [v5 aggregationInterval];
  double v8 = v7;
  [v5 collectionLatency];
  double v10 = v9;

  if (v6)
  {
    v13.receiver = v6;
    v13.super_class = (Class)HDDataCollectorConfiguration;
    v11 = objc_msgSendSuper2(&v13, sel_init);
    if (v11)
    {
      v11[2] = fmax(v8, 0.0);
      v11[3] = fmax(v10, 0.0);
      *((void *)v11 + 1) = a3;
    }
  }
  else
  {
    v11 = 0;
  }

  return (HDDataCollectorConfiguration *)v11;
}

+ (id)disabledConfiguration
{
  v2 = [HDDataCollectorConfiguration alloc];
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)HDDataCollectorConfiguration;
    v2 = objc_msgSendSuper2(&v5, sel_init);
    if (v2)
    {
      double v3 = fmax(*MEMORY[0x1E4F29970], 0.0);
      v2->_collectionInterval = v3;
      v2->_collectionLatency = v3;
      v2->_collectionType = 0;
    }
  }

  return v2;
}

- (id)mergedConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = [HDDataCollectorConfiguration alloc];
  unint64_t collectionType = self->_collectionType;
  uint64_t v7 = [v4 collectionType];
  BOOL v9 = collectionType == 1 || v7 == 1;
  if (v7 == 2 || collectionType == 2) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = v9;
  }
  double collectionInterval = self->_collectionInterval;
  [v4 collectionInterval];
  if (collectionInterval >= v13) {
    double v14 = v13;
  }
  else {
    double v14 = collectionInterval;
  }
  double collectionLatency = self->_collectionLatency;
  [v4 collectionLatency];
  double v17 = v16;

  if (collectionLatency < v17) {
    double v17 = collectionLatency;
  }
  if (v5)
  {
    v20.receiver = v5;
    v20.super_class = (Class)HDDataCollectorConfiguration;
    v18 = [(HDDataCollectorConfiguration *)&v20 init];
    if (v18)
    {
      v18->_double collectionInterval = fmax(v14, 0.0);
      v18->_double collectionLatency = fmax(v17, 0.0);
      v18->_unint64_t collectionType = v11;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  double v3 = NSString;
  id v4 = HKDataCollectionTypeToString();
  objc_super v5 = [v3 stringWithFormat:@"<%@ Interval: %0.1lfs Latency: %0.1lfs>", v4, *(void *)&self->_collectionInterval, *(void *)&self->_collectionLatency];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_collectionType == *((void *)v4 + 1)
    && vabdd_f64(self->_collectionInterval, *((double *)v4 + 2)) < 2.22044605e-16
    && vabdd_f64(self->_collectionLatency, *((double *)v4 + 3)) < 2.22044605e-16;

  return v5;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (double)collectionLatency
{
  return self->_collectionLatency;
}

@end