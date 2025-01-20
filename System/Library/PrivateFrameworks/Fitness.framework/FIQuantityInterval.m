@interface FIQuantityInterval
- (FIIntervalDefinition)definition;
- (FIQuantityInterval)initWithIntervalDefinition:(id)a3 activityType:(unint64_t)a4 startDate:(id)a5;
- (HKQuantity)threshold;
- (HKQuantityType)trackedQuantityType;
- (NSDate)startDate;
@end

@implementation FIQuantityInterval

- (FIQuantityInterval)initWithIntervalDefinition:(id)a3 activityType:(unint64_t)a4 startDate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)FIQuantityInterval;
  v11 = [(FIQuantityInterval *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_definition, a3);
    objc_storeStrong((id *)&v12->_startDate, a5);
    if (a4 == 13) {
      v13 = (void *)MEMORY[0x263F09DB0];
    }
    else {
      v13 = (void *)MEMORY[0x263F09DE0];
    }
    if (a4 == 46) {
      v13 = (void *)MEMORY[0x263F09DD8];
    }
    uint64_t v14 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:*v13];
    trackedQuantityType = v12->_trackedQuantityType;
    v12->_trackedQuantityType = (HKQuantityType *)v14;
  }
  return v12;
}

- (FIIntervalDefinition)definition
{
  return self->_definition;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HKQuantityType)trackedQuantityType
{
  return self->_trackedQuantityType;
}

- (HKQuantity)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_trackedQuantityType, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_definition, 0);
}

@end