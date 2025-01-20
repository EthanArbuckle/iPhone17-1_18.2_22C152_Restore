@interface HKHearingLevelMetrics
+ (HKHearingLevelMetrics)_overallMetricsFromLeftEarMetrics:(void *)a3 rightEarMetrics:;
- (BOOL)isEqual:(id)a3;
- (HKHearingLevelMetrics)initWithAverageSensitivity:(id)a3 minimumSensitivity:(id)a4 maximumSensitivity:(id)a5;
- (HKQuantity)averageSensitivity;
- (HKQuantity)maximumSensitivity;
- (HKQuantity)minimumSensitivity;
- (id)description;
- (uint64_t)isEqualToHearingLevelMetrics:(void *)a1;
- (unint64_t)hash;
@end

@implementation HKHearingLevelMetrics

- (HKHearingLevelMetrics)initWithAverageSensitivity:(id)a3 minimumSensitivity:(id)a4 maximumSensitivity:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKHearingLevelMetrics;
  v12 = [(HKHearingLevelMetrics *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_averageSensitivity, a3);
    objc_storeStrong((id *)&v13->_minimumSensitivity, a4);
    objc_storeStrong((id *)&v13->_maximumSensitivity, a5);
  }

  return v13;
}

+ (HKHearingLevelMetrics)_overallMetricsFromLeftEarMetrics:(void *)a3 rightEarMetrics:
{
  unint64_t v4 = a2;
  unint64_t v5 = a3;
  self;
  if (v4 | v5)
  {
    v7 = [(id)v4 averageSensitivity];
    v8 = [(id)v5 averageSensitivity];
    id v9 = HKQuantityMin(v7, v8);

    id v10 = [(id)v4 minimumSensitivity];
    id v11 = [(id)v5 minimumSensitivity];
    v12 = HKQuantityMin(v10, v11);

    v13 = [(id)v4 maximumSensitivity];
    v14 = [(id)v5 maximumSensitivity];
    objc_super v15 = HKQuantityMax(v13, v14);

    v6 = [[HKHearingLevelMetrics alloc] initWithAverageSensitivity:v9 minimumSensitivity:v12 maximumSensitivity:v15];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKHearingLevelMetrics *)a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = -[HKHearingLevelMetrics isEqualToHearingLevelMetrics:](self, v5);
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToHearingLevelMetrics:(void *)a1
{
  id v4 = a2;
  if (!a1)
  {
    uint64_t v16 = 0;
    goto LABEL_29;
  }
  unint64_t v5 = [a1 averageSensitivity];
  char v6 = [v4 averageSensitivity];
  if (v5 != v6)
  {
    uint64_t v7 = [v4 averageSensitivity];
    if (!v7)
    {
      uint64_t v16 = 0;
      goto LABEL_28;
    }
    v2 = (void *)v7;
    v8 = [a1 averageSensitivity];
    id v9 = [v4 averageSensitivity];
    if (![v8 isEqual:v9])
    {
      uint64_t v16 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v31 = v9;
    v32 = v8;
  }
  id v10 = [a1 minimumSensitivity];
  id v11 = [v4 minimumSensitivity];
  if (v10 != v11)
  {
    uint64_t v12 = [v4 minimumSensitivity];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = [a1 minimumSensitivity];
      objc_super v15 = [v4 minimumSensitivity];
      if ([v14 isEqual:v15])
      {
        v27 = v15;
        v28 = v14;
        v29 = v13;
        goto LABEL_11;
      }
    }
    uint64_t v16 = 0;
LABEL_23:
    BOOL v24 = v5 == v6;
    goto LABEL_26;
  }
LABEL_11:
  v17 = [a1 maximumSensitivity];
  uint64_t v18 = [v4 maximumSensitivity];
  uint64_t v16 = v17 == (void *)v18;
  if (v17 == (void *)v18)
  {

LABEL_20:
    if (v10 != v11)
    {
    }
    goto LABEL_23;
  }
  v19 = (void *)v18;
  v30 = v10;
  uint64_t v20 = [v4 maximumSensitivity];
  if (!v20)
  {

    goto LABEL_20;
  }
  v21 = (void *)v20;
  v26 = v2;
  v22 = [a1 maximumSensitivity];
  v23 = [v4 maximumSensitivity];
  uint64_t v16 = [v22 isEqual:v23];

  if (v30 == v11)
  {
  }
  else
  {
  }
  BOOL v24 = v5 == v6;
  v2 = v26;
LABEL_26:
  id v9 = v31;
  v8 = v32;
  if (!v24) {
    goto LABEL_27;
  }
LABEL_28:

LABEL_29:
  return v16;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  char v6 = [(HKHearingLevelMetrics *)self averageSensitivity];
  uint64_t v7 = [(HKHearingLevelMetrics *)self minimumSensitivity];
  v8 = [(HKHearingLevelMetrics *)self maximumSensitivity];
  id v9 = [v3 stringWithFormat:@"<%@:%p averageValue = %@, minValue = %@, maxValue = %@>", v5, self, v6, v7, v8];

  return v9;
}

- (HKQuantity)averageSensitivity
{
  return self->_averageSensitivity;
}

- (HKQuantity)minimumSensitivity
{
  return self->_minimumSensitivity;
}

- (HKQuantity)maximumSensitivity
{
  return self->_maximumSensitivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumSensitivity, 0);
  objc_storeStrong((id *)&self->_minimumSensitivity, 0);

  objc_storeStrong((id *)&self->_averageSensitivity, 0);
}

@end