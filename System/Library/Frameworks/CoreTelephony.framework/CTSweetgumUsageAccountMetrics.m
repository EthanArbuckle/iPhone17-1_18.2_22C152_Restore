@interface CTSweetgumUsageAccountMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)localDevice;
- (CTSweetgumUsageAccountMetrics)init;
- (CTSweetgumUsageAccountMetrics)initWithCoder:(id)a3;
- (NSArray)applicablePlans;
- (NSDate)billingCycleEndDate;
- (NSString)networkUsageLabel;
- (NSString)planType;
- (NSString)subscriptionStatus;
- (id)description;
- (int64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicablePlans:(id)a3;
- (void)setBillingCycleEndDate:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setLocalDevice:(BOOL)a3;
- (void)setNetworkUsageLabel:(id)a3;
- (void)setPlanType:(id)a3;
- (void)setSubscriptionStatus:(id)a3;
@end

@implementation CTSweetgumUsageAccountMetrics

- (CTSweetgumUsageAccountMetrics)init
{
  v10.receiver = self;
  v10.super_class = (Class)CTSweetgumUsageAccountMetrics;
  v2 = [(CTSweetgumUsageAccountMetrics *)&v10 init];
  v3 = v2;
  if (v2)
  {
    networkUsageLabel = v2->_networkUsageLabel;
    v2->_networkUsageLabel = 0;

    subscriptionStatus = v3->_subscriptionStatus;
    v3->_deviceType = 0;
    v3->_subscriptionStatus = 0;
    v3->_localDevice = 0;

    planType = v3->_planType;
    v3->_planType = 0;

    billingCycleEndDate = v3->_billingCycleEndDate;
    v3->_billingCycleEndDate = 0;

    applicablePlans = v3->_applicablePlans;
    v3->_applicablePlans = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTSweetgumUsageAccountMetrics *)self networkUsageLabel];
  [v3 appendFormat:@", networkUsageLabel=%@", v4];

  [v3 appendFormat:@", deviceType=%s", CTSweetgumDeviceTypeAsString(-[CTSweetgumUsageAccountMetrics deviceType](self, "deviceType"))];
  [v3 appendFormat:@", localDevice=%d", -[CTSweetgumUsageAccountMetrics localDevice](self, "localDevice")];
  v5 = [(CTSweetgumUsageAccountMetrics *)self subscriptionStatus];
  [v3 appendFormat:@", subscriptionStatus=%@", v5];

  v6 = [(CTSweetgumUsageAccountMetrics *)self planType];
  [v3 appendFormat:@", planType=%@", v6];

  v7 = [(CTSweetgumUsageAccountMetrics *)self billingCycleEndDate];
  [v3 appendFormat:@", billingCycleEndDate=%@", v7];

  v8 = [(CTSweetgumUsageAccountMetrics *)self applicablePlans];
  [v3 appendFormat:@", applicablePlans=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (CTSweetgumUsageAccountMetrics *)a3;
  if (v7 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [(CTSweetgumUsageAccountMetrics *)self networkUsageLabel];
      v9 = [(CTSweetgumUsageAccountMetrics *)v7 networkUsageLabel];
      if (v8 != v9)
      {
        v3 = [(CTSweetgumUsageAccountMetrics *)self networkUsageLabel];
        v4 = [(CTSweetgumUsageAccountMetrics *)v7 networkUsageLabel];
        if (![v3 isEqualToString:v4])
        {
          char v10 = 0;
          goto LABEL_32;
        }
      }
      int64_t v11 = [(CTSweetgumUsageAccountMetrics *)self deviceType];
      if (v11 != [(CTSweetgumUsageAccountMetrics *)v7 deviceType]
        || (BOOL v12 = [(CTSweetgumUsageAccountMetrics *)self localDevice],
            v12 != [(CTSweetgumUsageAccountMetrics *)v7 localDevice]))
      {
        char v10 = 0;
        goto LABEL_31;
      }
      v13 = [(CTSweetgumUsageAccountMetrics *)self subscriptionStatus];
      v14 = [(CTSweetgumUsageAccountMetrics *)v7 subscriptionStatus];
      if (v13 != v14)
      {
        v5 = [(CTSweetgumUsageAccountMetrics *)self subscriptionStatus];
        v15 = [(CTSweetgumUsageAccountMetrics *)v7 subscriptionStatus];
        if (![v5 isEqualToString:v15])
        {
          char v10 = 0;
          goto LABEL_29;
        }
        v38 = v15;
      }
      uint64_t v16 = [(CTSweetgumUsageAccountMetrics *)self planType];
      [(CTSweetgumUsageAccountMetrics *)v7 planType];
      uint64_t v40 = v39 = v5;
      v41 = (void *)v16;
      if (v16 != v40)
      {
        v17 = [(CTSweetgumUsageAccountMetrics *)self planType];
        v36 = [(CTSweetgumUsageAccountMetrics *)v7 planType];
        v37 = v17;
        if (!objc_msgSend(v17, "isEqualToString:"))
        {
          char v10 = 0;
          v19 = (void *)v40;
          v18 = v41;
LABEL_27:

LABEL_28:
          v15 = v38;
          v5 = v39;
          if (v13 == v14)
          {
LABEL_30:

LABEL_31:
            if (v8 == v9)
            {
LABEL_33:

              goto LABEL_34;
            }
LABEL_32:

            goto LABEL_33;
          }
LABEL_29:

          goto LABEL_30;
        }
      }
      uint64_t v20 = [(CTSweetgumUsageAccountMetrics *)self billingCycleEndDate];
      uint64_t v34 = [(CTSweetgumUsageAccountMetrics *)v7 billingCycleEndDate];
      v35 = (void *)v20;
      if (v20 == v34
        || ([(CTSweetgumUsageAccountMetrics *)self billingCycleEndDate],
            v21 = objc_claimAutoreleasedReturnValue(),
            [(CTSweetgumUsageAccountMetrics *)v7 billingCycleEndDate],
            v32 = objc_claimAutoreleasedReturnValue(),
            v33 = v21,
            objc_msgSend(v21, "isEqualToDate:")))
      {
        v24 = [(CTSweetgumUsageAccountMetrics *)self applicablePlans];
        uint64_t v25 = [(CTSweetgumUsageAccountMetrics *)v7 applicablePlans];
        if (v24 == (void *)v25)
        {

          char v10 = 1;
        }
        else
        {
          v26 = (void *)v25;
          [(CTSweetgumUsageAccountMetrics *)self applicablePlans];
          v27 = v31 = v13;
          [(CTSweetgumUsageAccountMetrics *)v7 applicablePlans];
          v28 = v30 = v14;
          char v10 = [v27 isEqual:v28];

          v14 = v30;
          v13 = v31;
        }
        v23 = (void *)v34;
        v22 = v35;
        if (v35 == (void *)v34)
        {
LABEL_26:

          v19 = (void *)v40;
          v18 = v41;
          if (v41 == (void *)v40) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
      else
      {
        char v10 = 0;
        v23 = (void *)v34;
        v22 = v35;
      }

      goto LABEL_26;
    }
    char v10 = 0;
  }
LABEL_34:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  networkUsageLabel = self->_networkUsageLabel;
  id v5 = a3;
  [v5 encodeObject:networkUsageLabel forKey:@"networkUsageLabel"];
  [v5 encodeInteger:self->_deviceType forKey:@"deviceType"];
  [v5 encodeBool:self->_localDevice forKey:@"localDevice"];
  [v5 encodeObject:self->_subscriptionStatus forKey:@"subscriptionStatus"];
  [v5 encodeObject:self->_planType forKey:@"planType"];
  [v5 encodeObject:self->_billingCycleEndDate forKey:@"billingCycleEndDate"];
  [v5 encodeObject:self->_applicablePlans forKey:@"applicablePlans"];
}

- (CTSweetgumUsageAccountMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CTSweetgumUsageAccountMetrics;
  id v5 = [(CTSweetgumUsageAccountMetrics *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkUsageLabel"];
    networkUsageLabel = v5->_networkUsageLabel;
    v5->_networkUsageLabel = (NSString *)v6;

    v5->_deviceType = [v4 decodeIntegerForKey:@"deviceType"];
    v5->_localDevice = [v4 decodeBoolForKey:@"localDevice"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionStatus"];
    subscriptionStatus = v5->_subscriptionStatus;
    v5->_subscriptionStatus = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planType"];
    planType = v5->_planType;
    v5->_planType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingCycleEndDate"];
    billingCycleEndDate = v5->_billingCycleEndDate;
    v5->_billingCycleEndDate = (NSDate *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"applicablePlans"];
    applicablePlans = v5->_applicablePlans;
    v5->_applicablePlans = (NSArray *)v17;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)networkUsageLabel
{
  return self->_networkUsageLabel;
}

- (void)setNetworkUsageLabel:(id)a3
{
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BOOL)a3
{
  self->_localDevice = a3;
}

- (NSString)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (void)setSubscriptionStatus:(id)a3
{
}

- (NSString)planType
{
  return self->_planType;
}

- (void)setPlanType:(id)a3
{
}

- (NSDate)billingCycleEndDate
{
  return self->_billingCycleEndDate;
}

- (void)setBillingCycleEndDate:(id)a3
{
}

- (NSArray)applicablePlans
{
  return self->_applicablePlans;
}

- (void)setApplicablePlans:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicablePlans, 0);
  objc_storeStrong((id *)&self->_billingCycleEndDate, 0);
  objc_storeStrong((id *)&self->_planType, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);

  objc_storeStrong((id *)&self->_networkUsageLabel, 0);
}

@end