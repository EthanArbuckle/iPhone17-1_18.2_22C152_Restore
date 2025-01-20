@interface CTCarrierSpaceDataPlanMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTCarrierSpaceDataPlanMetrics)init;
- (CTCarrierSpaceDataPlanMetrics)initWithCoder:(id)a3;
- (CTCarrierSpaceDataPlanMetricsItem)domestic;
- (NSDate)billingCycleEndDate;
- (NSNumber)domesticCapacity;
- (id)description;
- (int64_t)regStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setBillingCycleEndDate:(id)a3;
- (void)setDomestic:(id)a3;
- (void)setDomesticCapacity:(id)a3;
- (void)setRegStatus:(int64_t)a3;
@end

@implementation CTCarrierSpaceDataPlanMetrics

- (CTCarrierSpaceDataPlanMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)CTCarrierSpaceDataPlanMetrics;
  v2 = [(CTCarrierSpaceDataPlanMetrics *)&v8 init];
  v3 = v2;
  if (v2)
  {
    billingCycleEndDate = v2->_billingCycleEndDate;
    v2->_billingCycleEndDate = 0;

    domestic = v3->_domestic;
    v3->_domestic = 0;

    domesticCapacity = v3->_domesticCapacity;
    v3->_regStatus = 0;
    v3->_domesticCapacity = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTCarrierSpaceDataPlanMetrics *)self billingCycleEndDate];
  [v3 appendFormat:@", billingCycleEndDate=%@", v4];

  [v3 appendFormat:@", regStatus=%s", CTCarrierSpaceRegistrationStatusAsString(-[CTCarrierSpaceDataPlanMetrics regStatus](self, "regStatus"))];
  v5 = [(CTCarrierSpaceDataPlanMetrics *)self domesticCapacity];
  [v3 appendFormat:@", domesticCapacity=%@", v5];

  v6 = [(CTCarrierSpaceDataPlanMetrics *)self domestic];
  [v3 appendFormat:@", domestic=%@", v6];

  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (CTCarrierSpaceDataPlanMetrics *)a3;
  if (v6 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(CTCarrierSpaceDataPlanMetrics *)self billingCycleEndDate];
      objc_super v8 = [(CTCarrierSpaceDataPlanMetrics *)v6 billingCycleEndDate];
      if (v7 == v8
        || ([(CTCarrierSpaceDataPlanMetrics *)self billingCycleEndDate],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(CTCarrierSpaceDataPlanMetrics *)v6 billingCycleEndDate],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqualToDate:v4]))
      {
        int64_t v10 = [(CTCarrierSpaceDataPlanMetrics *)self regStatus];
        if (v10 == [(CTCarrierSpaceDataPlanMetrics *)v6 regStatus])
        {
          v11 = [(CTCarrierSpaceDataPlanMetrics *)self domesticCapacity];
          uint64_t v12 = [(CTCarrierSpaceDataPlanMetrics *)v6 domesticCapacity];
          if (v11 == (void *)v12)
          {

            char v9 = 1;
          }
          else
          {
            v13 = (void *)v12;
            v14 = [(CTCarrierSpaceDataPlanMetrics *)self domesticCapacity];
            v15 = [(CTCarrierSpaceDataPlanMetrics *)v6 domesticCapacity];
            char v9 = [v14 isEqualToNumber:v15];
          }
        }
        else
        {
          char v9 = 0;
        }
        if (v7 == v8) {
          goto LABEL_15;
        }
      }
      else
      {
        char v9 = 0;
      }

LABEL_15:
      goto LABEL_16;
    }
    char v9 = 0;
  }
LABEL_16:

  return v9;
}

- (CTCarrierSpaceDataPlanMetricsItem)domestic
{
  if (self->_regStatus == 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_alloc_init(CTCarrierSpaceDataPlanMetricsItem);
    [(CTCarrierSpaceDataPlanMetricsItem *)v2 setCapacityBytes:self->_domesticCapacity];
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  billingCycleEndDate = self->_billingCycleEndDate;
  id v5 = a3;
  [v5 encodeObject:billingCycleEndDate forKey:@"billingCycleEndDate"];
  [v5 encodeInteger:self->_regStatus forKey:@"regStatus"];
  [v5 encodeObject:self->_domesticCapacity forKey:@"domesticCapacity"];
}

- (CTCarrierSpaceDataPlanMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CTCarrierSpaceDataPlanMetrics;
  id v5 = [(CTCarrierSpaceDataPlanMetrics *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingCycleEndDate"];
    billingCycleEndDate = v5->_billingCycleEndDate;
    v5->_billingCycleEndDate = (NSDate *)v6;

    v5->_regStatus = [v4 decodeIntegerForKey:@"regStatus"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domesticCapacity"];
    domesticCapacity = v5->_domesticCapacity;
    v5->_domesticCapacity = (NSNumber *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)billingCycleEndDate
{
  return self->_billingCycleEndDate;
}

- (void)setBillingCycleEndDate:(id)a3
{
}

- (void)setDomestic:(id)a3
{
}

- (int64_t)regStatus
{
  return self->_regStatus;
}

- (void)setRegStatus:(int64_t)a3
{
  self->_regStatus = a3;
}

- (NSNumber)domesticCapacity
{
  return self->_domesticCapacity;
}

- (void)setDomesticCapacity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domesticCapacity, 0);
  objc_storeStrong((id *)&self->_domestic, 0);
  objc_storeStrong((id *)&self->_billingCycleEndDate, 0);
}

@end