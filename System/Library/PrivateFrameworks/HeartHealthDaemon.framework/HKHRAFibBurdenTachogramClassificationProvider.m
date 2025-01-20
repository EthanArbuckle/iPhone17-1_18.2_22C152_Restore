@interface HKHRAFibBurdenTachogramClassificationProvider
+ (BOOL)supportsSecureCoding;
- (ABTachogramClassification)tachogramClassification;
- (BOOL)isEqual:(id)a3;
- (HKHRAFibBurdenTachogramClassificationProvider)initWithCoder:(id)a3;
- (HKHRAFibBurdenTachogramClassificationProvider)initWithSampleClassification:(id)a3;
- (HKHRAFibBurdenTachogramClassificationProvider)initWithSampleClassification:(id)a3 tachogramClassification:(id)a4;
- (HKHRSampleClassification)sampleClassification;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHRAFibBurdenTachogramClassificationProvider

- (HKHRAFibBurdenTachogramClassificationProvider)initWithSampleClassification:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenTachogramClassificationProvider;
  v6 = [(HKHRAFibBurdenTachogramClassificationProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sampleClassification, a3);
  }

  return v7;
}

- (HKHRAFibBurdenTachogramClassificationProvider)initWithSampleClassification:(id)a3 tachogramClassification:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenTachogramClassificationProvider;
  objc_super v9 = [(HKHRAFibBurdenTachogramClassificationProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sampleClassification, a3);
    objc_storeStrong((id *)&v10->_computedTachogramClassification, a4);
  }

  return v10;
}

- (ABTachogramClassification)tachogramClassification
{
  computedTachogramClassification = self->_computedTachogramClassification;
  if (!computedTachogramClassification)
  {
    v4 = (ABTachogramClassification *)objc_opt_new();
    id v5 = self->_computedTachogramClassification;
    self->_computedTachogramClassification = v4;

    v6 = [(HKHRSampleClassification *)self->_sampleClassification sampleUUID];
    [(ABTachogramClassification *)self->_computedTachogramClassification setUuid:v6];

    id v7 = [(HKHRSampleClassification *)self->_sampleClassification sampleDateInterval];
    id v8 = [v7 endDate];
    [(ABTachogramClassification *)self->_computedTachogramClassification setDate:v8];

    [(ABTachogramClassification *)self->_computedTachogramClassification setAFibDetected:[(HKHRSampleClassification *)self->_sampleClassification classification] == 1];
    computedTachogramClassification = self->_computedTachogramClassification;
  }
  objc_super v9 = computedTachogramClassification;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHRAFibBurdenTachogramClassificationProvider *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      sampleClassification = self->_sampleClassification;
      v6 = [(HKHRAFibBurdenTachogramClassificationProvider *)v4 sampleClassification];
      char v7 = [(HKHRSampleClassification *)sampleClassification isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return [(HKHRSampleClassification *)self->_sampleClassification hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKHRAFibBurdenTachogramClassificationProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenTachogramClassificationProvider;
  id v5 = [(HKHRAFibBurdenTachogramClassificationProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SampleClassification"];
    sampleClassification = v5->_sampleClassification;
    v5->_sampleClassification = (HKHRSampleClassification *)v6;
  }
  return v5;
}

- (HKHRSampleClassification)sampleClassification
{
  return self->_sampleClassification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleClassification, 0);

  objc_storeStrong((id *)&self->_computedTachogramClassification, 0);
}

@end