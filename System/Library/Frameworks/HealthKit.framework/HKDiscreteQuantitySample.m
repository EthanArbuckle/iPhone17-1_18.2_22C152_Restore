@interface HKDiscreteQuantitySample
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasMaximumQuantity;
- (BOOL)_hasMinimumQuantity;
- (BOOL)_hasMostRecentQuantity;
- (BOOL)_hasMostRecentQuantityDateInterval;
- (HKDiscreteQuantitySample)initWithCoder:(id)a3;
- (HKQuantity)maximumQuantity;
- (HKQuantity)minimumQuantity;
- (HKQuantity)mostRecentQuantity;
- (NSDateInterval)mostRecentQuantityDateInterval;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)asJSONObject;
- (void)_setMaximumQuantity:(id)a3;
- (void)_setMinimumQuantity:(id)a3;
- (void)_setMostRecentQuantity:(id)a3;
- (void)_setMostRecentQuantityDateInterval:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)set_hasMaximumQuantity:(BOOL)a3;
- (void)set_hasMinimumQuantity:(BOOL)a3;
- (void)set_hasMostRecentQuantity:(BOOL)a3;
- (void)set_hasMostRecentQuantityDateInterval:(BOOL)a3;
@end

@implementation HKDiscreteQuantitySample

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  v36.receiver = self;
  v36.super_class = (Class)HKDiscreteQuantitySample;
  v5 = -[HKQuantitySample _validateWithConfiguration:](&v36, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    goto LABEL_13;
  }
  if ([(HKQuantitySample *)self count] < 2) {
    goto LABEL_10;
  }
  v8 = [(HKQuantitySample *)self quantityType];
  uint64_t v9 = 128;
  v10 = [(HKQuantity *)self->_minimumQuantity _unit];
  char v11 = [v8 isCompatibleWithUnit:v10];

  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v9 = 136;
  v12 = [(HKQuantity *)self->_maximumQuantity _unit];
  char v13 = [v8 isCompatibleWithUnit:v12];

  if ((v13 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v9 = 144;
  v14 = [(HKQuantity *)self->_mostRecentQuantity _unit];
  char v15 = [v8 isCompatibleWithUnit:v14];

  if (v15)
  {
    v16 = [(NSDateInterval *)self->_mostRecentQuantityDateInterval startDate];
    [v16 timeIntervalSinceReferenceDate];
    double v18 = v17;
    [(HKSample *)self _startTimestamp];
    if (v18 < v19)
    {
    }
    else
    {
      v20 = [(NSDateInterval *)self->_mostRecentQuantityDateInterval endDate];
      [v20 timeIntervalSinceReferenceDate];
      double v22 = v21;
      [(HKSample *)self _endTimestamp];
      double v24 = v23;

      if (v22 <= v24)
      {

LABEL_10:
        id v7 = 0;
        goto LABEL_13;
      }
    }
    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    mostRecentQuantityDateInterval = self->_mostRecentQuantityDateInterval;
    v28 = [(HKSample *)self startDate];
    v29 = [(HKSample *)self endDate];
    objc_msgSend(v31, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v32, a2, @"%@ %@ most recent quantity interval %@ falls outside the range of the sample: %@ - %@"", v33, self, mostRecentQuantityDateInterval, v28, v29);
  }
  else
  {
LABEL_11:
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    v28 = [v8 dimension];
    v29 = [*(id *)((char *)&self->super.super.super.super.isa + v9) _unit];
    objc_msgSend(v25, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", v26, a2, @"%@ %@ requires unit of type %@. Incompatible unit: %@"", v27, self, v28, v29, v35);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKDiscreteQuantitySample;
  id v4 = a3;
  [(HKQuantitySample *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_minimumQuantity, @"Min", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_maximumQuantity forKey:@"Max"];
  [v4 encodeObject:self->_mostRecentQuantity forKey:@"Recent"];
  [v4 encodeObject:self->_mostRecentQuantityDateInterval forKey:@"RecentDate"];
}

- (HKDiscreteQuantitySample)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKDiscreteQuantitySample;
  objc_super v5 = [(HKQuantitySample *)&v16 initWithCoder:v4];
  v6 = v5;
  if (v5 && [(HKQuantitySample *)v5 count] >= 2)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Min"];
    minimumQuantity = v6->_minimumQuantity;
    v6->_minimumQuantity = (HKQuantity *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Max"];
    maximumQuantity = v6->_maximumQuantity;
    v6->_maximumQuantity = (HKQuantity *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Recent"];
    mostRecentQuantity = v6->_mostRecentQuantity;
    v6->_mostRecentQuantity = (HKQuantity *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecentDate"];
    mostRecentQuantityDateInterval = v6->_mostRecentQuantityDateInterval;
    v6->_mostRecentQuantityDateInterval = (NSDateInterval *)v13;
  }
  return v6;
}

- (HKQuantity)minimumQuantity
{
  minimumQuantity = self->_minimumQuantity;
  if (minimumQuantity)
  {
    v3 = minimumQuantity;
  }
  else
  {
    v3 = [(HKQuantitySample *)self quantity];
  }

  return v3;
}

- (BOOL)_hasMinimumQuantity
{
  return self->_minimumQuantity != 0;
}

- (HKQuantity)maximumQuantity
{
  maximumQuantity = self->_maximumQuantity;
  if (maximumQuantity)
  {
    v3 = maximumQuantity;
  }
  else
  {
    v3 = [(HKQuantitySample *)self quantity];
  }

  return v3;
}

- (BOOL)_hasMaximumQuantity
{
  return self->_maximumQuantity != 0;
}

- (HKQuantity)mostRecentQuantity
{
  mostRecentQuantity = self->_mostRecentQuantity;
  if (mostRecentQuantity)
  {
    v3 = mostRecentQuantity;
  }
  else
  {
    v3 = [(HKQuantitySample *)self quantity];
  }

  return v3;
}

- (BOOL)_hasMostRecentQuantity
{
  return self->_mostRecentQuantity != 0;
}

- (NSDateInterval)mostRecentQuantityDateInterval
{
  mostRecentQuantityDateInterval = self->_mostRecentQuantityDateInterval;
  if (mostRecentQuantityDateInterval)
  {
    v3 = mostRecentQuantityDateInterval;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
    v6 = [(HKSample *)self startDate];
    uint64_t v7 = [(HKSample *)self endDate];
    v3 = (NSDateInterval *)[v5 initWithStartDate:v6 endDate:v7];
  }

  return v3;
}

- (BOOL)_hasMostRecentQuantityDateInterval
{
  return self->_mostRecentQuantityDateInterval != 0;
}

- (void)_setMinimumQuantity:(id)a3
{
}

- (void)_setMaximumQuantity:(id)a3
{
}

- (void)_setMostRecentQuantity:(id)a3
{
}

- (void)_setMostRecentQuantityDateInterval:(id)a3
{
}

- (void)set_hasMinimumQuantity:(BOOL)a3
{
  self->__hasMinimumQuantity = a3;
}

- (void)set_hasMaximumQuantity:(BOOL)a3
{
  self->__hasMaximumQuantity = a3;
}

- (void)set_hasMostRecentQuantity:(BOOL)a3
{
  self->__hasMostRecentQuantity = a3;
}

- (void)set_hasMostRecentQuantityDateInterval:(BOOL)a3
{
  self->__hasMostRecentQuantityDateInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentQuantityDateInterval, 0);
  objc_storeStrong((id *)&self->_mostRecentQuantity, 0);
  objc_storeStrong((id *)&self->_maximumQuantity, 0);

  objc_storeStrong((id *)&self->_minimumQuantity, 0);
}

- (id)asJSONObject
{
  v4.receiver = self;
  v4.super_class = (Class)HKDiscreteQuantitySample;
  v2 = [(HKQuantitySample *)&v4 asJSONObject];

  return v2;
}

@end