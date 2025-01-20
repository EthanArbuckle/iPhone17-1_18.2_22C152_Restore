@interface HKQuantitySeriesSampleEditorTaskServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKQuantitySample)quantitySample;
- (HKQuantitySeriesSampleEditorTaskServerConfiguration)initWithCoder:(id)a3;
- (HKQuantitySeriesSampleEditorTaskServerConfiguration)initWithQuantitySample:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setQuantitySample:(id)a3;
@end

@implementation HKQuantitySeriesSampleEditorTaskServerConfiguration

- (HKQuantitySeriesSampleEditorTaskServerConfiguration)initWithQuantitySample:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  v5 = [(HKQuantitySeriesSampleEditorTaskServerConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    quantitySample = v5->_quantitySample;
    v5->_quantitySample = (HKQuantitySample *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  id v4 = [(HKTaskConfiguration *)&v6 copyWithZone:a3];
  [v4 setQuantitySample:self->_quantitySample];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantitySeriesSampleEditorTaskServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  v5 = [(HKTaskConfiguration *)&v10 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity_sample"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        quantitySample = v5->_quantitySample,
        v5->_quantitySample = (HKQuantitySample *)v6,
        quantitySample,
        !v5->_quantitySample))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySeriesSampleEditorTaskServerConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantitySample, @"quantity_sample", v5.receiver, v5.super_class);
}

- (HKQuantitySample)quantitySample
{
  return self->_quantitySample;
}

- (void)setQuantitySample:(id)a3
{
}

- (void).cxx_destruct
{
}

@end