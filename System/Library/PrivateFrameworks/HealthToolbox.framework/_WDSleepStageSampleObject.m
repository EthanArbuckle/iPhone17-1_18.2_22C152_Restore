@interface _WDSleepStageSampleObject
- (HKCategorySample)sample;
- (NSDateInterval)dateInterval;
- (_WDSleepStageSampleObject)initWithSample:(id)a3;
- (id)device;
- (id)sourceRevision;
@end

@implementation _WDSleepStageSampleObject

- (_WDSleepStageSampleObject)initWithSample:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDSleepStageSampleObject;
  v6 = [(_WDSleepStageSampleObject *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sample, a3);
  }

  return v7;
}

- (NSDateInterval)dateInterval
{
  id v3 = objc_alloc(MEMORY[0x263F08798]);
  v4 = [(HKCategorySample *)self->_sample startDate];
  id v5 = [(HKCategorySample *)self->_sample endDate];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  return (NSDateInterval *)v6;
}

- (id)sourceRevision
{
  return 0;
}

- (id)device
{
  return 0;
}

- (HKCategorySample)sample
{
  return self->_sample;
}

- (void).cxx_destruct
{
}

@end