@interface HKQuantitySeriesSampleBuilderTaskServerConfiguration
+ (BOOL)supportsSecureCoding;
- (HKDevice)device;
- (HKQuantitySeriesSampleBuilderTaskServerConfiguration)initWithCoder:(id)a3;
- (HKQuantitySeriesSampleBuilderTaskServerConfiguration)initWithQuantityType:(id)a3 startDate:(id)a4 device:(id)a5;
- (HKQuantityType)quantityType;
- (NSDate)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDevice:(id)a3;
- (void)setQuantityType:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation HKQuantitySeriesSampleBuilderTaskServerConfiguration

- (HKQuantitySeriesSampleBuilderTaskServerConfiguration)initWithQuantityType:(id)a3 startDate:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  v11 = [(HKQuantitySeriesSampleBuilderTaskServerConfiguration *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    quantityType = v11->_quantityType;
    v11->_quantityType = (HKQuantityType *)v12;

    uint64_t v14 = [v9 copy];
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v14;

    uint64_t v16 = [v10 copy];
    device = v11->_device;
    v11->_device = (HKDevice *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  id v4 = [(HKTaskConfiguration *)&v6 copyWithZone:a3];
  [v4 setQuantityType:self->_quantityType];
  [v4 setStartDate:self->_startDate];
  [v4 setDevice:self->_device];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKQuantitySeriesSampleBuilderTaskServerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  v5 = [(HKTaskConfiguration *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quantity_type"];
    quantityType = v5->_quantityType;
    v5->_quantityType = (HKQuantityType *)v6;

    if (!v5->_quantityType
      || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"start_date"],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          startDate = v5->_startDate,
          v5->_startDate = (NSDate *)v8,
          startDate,
          !v5->_startDate))
    {
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    device = v5->_device;
    v5->_device = (HKDevice *)v10;
  }
  uint64_t v12 = v5;
LABEL_7:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKQuantitySeriesSampleBuilderTaskServerConfiguration;
  id v4 = a3;
  [(HKTaskConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_quantityType, @"quantity_type", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_startDate forKey:@"start_date"];
  [v4 encodeObject:self->_device forKey:@"device"];
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (void)setQuantityType:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (HKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_quantityType, 0);
}

@end