@interface CTCellularPlanSubscription
+ (BOOL)supportsSecureCoding;
- (BOOL)autoRenew;
- (BOOL)isEqualOrNewerThanSubscription:(id)a3;
- (CTCellularPlanSubscription)initWithCoder:(id)a3;
- (CTCellularPlanSubscription)initWithIccid:(id)a3 subscriptionResult:(int)a4 autoRenew:(BOOL)a5 billingStartDate:(double)a6 billingEndDate:(double)a7 carrierName:(id)a8 planType:(int)a9 planDescription:(id)a10 planStatus:(int)a11 accountStatus:(int)a12 accountURL:(id)a13 timestamp:(double)a14 homeCountryList:(id)a15 dataUsage:(id)a16;
- (NSArray)dataUsage;
- (NSArray)homeCountryList;
- (NSString)accountURL;
- (NSString)carrierName;
- (NSString)iccid;
- (NSString)planDescription;
- (double)billingEndDate;
- (double)billingStartDate;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (int)accountStatus;
- (int)planStatus;
- (int)planType;
- (int)subscriptionResult;
- (void)encodeWithCoder:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setPlanStatus:(int)a3;
- (void)setSubscriptionResult:(int)a3;
@end

@implementation CTCellularPlanSubscription

- (CTCellularPlanSubscription)initWithIccid:(id)a3 subscriptionResult:(int)a4 autoRenew:(BOOL)a5 billingStartDate:(double)a6 billingEndDate:(double)a7 carrierName:(id)a8 planType:(int)a9 planDescription:(id)a10 planStatus:(int)a11 accountStatus:(int)a12 accountURL:(id)a13 timestamp:(double)a14 homeCountryList:(id)a15 dataUsage:(id)a16
{
  id v23 = a3;
  id v24 = a8;
  id v25 = a10;
  id v34 = a13;
  id v33 = a15;
  id v32 = a16;
  v35.receiver = self;
  v35.super_class = (Class)CTCellularPlanSubscription;
  v26 = [(CTCellularPlanSubscription *)&v35 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_iccid, a3);
    v27->_subscriptionResult = a4;
    v27->_autoRenew = a5;
    v27->_billingStartDate = a6;
    v27->_billingEndDate = a7;
    objc_storeStrong((id *)&v27->_carrierName, a8);
    v27->_planType = a9;
    objc_storeStrong((id *)&v27->_planDescription, a10);
    v27->_planStatus = a11;
    v27->_accountStatus = a12;
    objc_storeStrong((id *)&v27->_accountURL, a13);
    v27->_timestamp = a14;
    objc_storeStrong((id *)&v27->_homeCountryList, a15);
    objc_storeStrong((id *)&v27->_dataUsage, a16);
  }

  return v27;
}

- (BOOL)isEqualOrNewerThanSubscription:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v4 = a3;
  LODWORD(self) = [(CTCellularPlanSubscription *)self subscriptionResult];
  unsigned int v5 = [v4 subscriptionResult];

  return self >= v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v4 = (void *)[(NSString *)self->_iccid copy];
  unsigned int subscriptionResult = self->_subscriptionResult;
  BOOL autoRenew = self->_autoRenew;
  double billingStartDate = self->_billingStartDate;
  double billingEndDate = self->_billingEndDate;
  v8 = (void *)[(NSString *)self->_carrierName copy];
  uint64_t planType = self->_planType;
  v10 = (void *)[(NSString *)self->_planDescription copy];
  int planStatus = self->_planStatus;
  int accountStatus = self->_accountStatus;
  v13 = (void *)[(NSString *)self->_accountURL copy];
  double timestamp = self->_timestamp;
  v15 = (void *)[(NSArray *)self->_homeCountryList copy];
  v16 = (void *)[(NSArray *)self->_dataUsage copy];
  v17 = (void *)[v20 initWithIccid:v4 subscriptionResult:subscriptionResult autoRenew:autoRenew billingStartDate:v8 billingEndDate:planType carrierName:v10 planType:billingStartDate planDescription:billingEndDate planStatus:timestamp accountStatus:__PAIR64__(accountStatus accountURL:planStatus) timestamp:v13 homeCountryList:v15 dataUsage:v16];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CTCellularPlanSubscription;
  unsigned int v5 = [(CTCellularPlanSubscription *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCID"];
    iccid = v5->_iccid;
    v5->_iccid = (NSString *)v6;

    v5->_unsigned int subscriptionResult = [v4 decodeIntForKey:@"subscriptionResult"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoRenew"];
    v5->_BOOL autoRenew = [v8 BOOLValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingEndDate"];
    [v9 doubleValue];
    v5->_double billingEndDate = v10;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"billingStartDate"];
    [v11 doubleValue];
    v5->_double billingStartDate = v12;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carrier"];
    carrierName = v5->_carrierName;
    v5->_carrierName = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planType"];
    v5->_uint64_t planType = [v15 intValue];

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planDescription"];
    planDescription = v5->_planDescription;
    v5->_planDescription = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planStatus"];
    v5->_int planStatus = [v18 intValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountStatus"];
    v5->_int accountStatus = [v19 intValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountURL"];
    accountURL = v5->_accountURL;
    v5->_accountURL = (NSString *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    [v22 doubleValue];
    v5->_double timestamp = v23;

    id v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"homeCountryIso"];
    homeCountryList = v5->_homeCountryList;
    v5->_homeCountryList = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"dataUsage"];
    dataUsage = v5->_dataUsage;
    v5->_dataUsage = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  iccid = self->_iccid;
  id v12 = a3;
  [v12 encodeObject:iccid forKey:@"ICCID"];
  [v12 encodeInt:self->_subscriptionResult forKey:@"subscriptionResult"];
  unsigned int v5 = [NSNumber numberWithBool:self->_autoRenew];
  [v12 encodeObject:v5 forKey:@"autoRenew"];

  uint64_t v6 = [NSNumber numberWithDouble:self->_billingEndDate];
  [v12 encodeObject:v6 forKey:@"billingEndDate"];

  v7 = [NSNumber numberWithDouble:self->_billingStartDate];
  [v12 encodeObject:v7 forKey:@"billingStartDate"];

  [v12 encodeObject:self->_carrierName forKey:@"carrier"];
  v8 = [NSNumber numberWithInt:self->_planType];
  [v12 encodeObject:v8 forKey:@"planType"];

  [v12 encodeObject:self->_planDescription forKey:@"planDescription"];
  v9 = [NSNumber numberWithInt:self->_planStatus];
  [v12 encodeObject:v9 forKey:@"planStatus"];

  double v10 = [NSNumber numberWithInt:self->_accountStatus];
  [v12 encodeObject:v10 forKey:@"accountStatus"];

  [v12 encodeObject:self->_accountURL forKey:@"accountURL"];
  v11 = [NSNumber numberWithDouble:self->_timestamp];
  [v12 encodeObject:v11 forKey:@"timestamp"];

  [v12 encodeObject:self->_homeCountryList forKey:@"homeCountryIso"];
  [v12 encodeObject:self->_dataUsage forKey:@"dataUsage"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<subscription: iccid:%@, complete:%d, autoRenew:%d, billingEnd:%f billingStart:%f carrierName:%@ planType:%d planDescription:%@ planStatus:%d accountStatus:%d, accountURL:%@, timestamp:%f, homeCountryList: %@ dataUsage %@ >", self->_iccid, self->_subscriptionResult, self->_autoRenew, *(void *)&self->_billingEndDate, *(void *)&self->_billingStartDate, self->_carrierName, self->_planType, self->_planDescription, self->_planStatus, self->_accountStatus, self->_accountURL, *(void *)&self->_timestamp, self->_homeCountryList, self->_dataUsage];
}

- (id)redactedDescription
{
  return (id)[NSString stringWithFormat:@"<subscription: complete:%d, autoRenew:%d, billingEnd:%f billingStart:%f carrierName:%@ planType:%d planDescription:%@ planStatus:%d accountStatus:%d, accountURL:%@, timestamp:%f, homeCountryList: %@ dataUsage %@ >", self->_subscriptionResult, self->_autoRenew, *(void *)&self->_billingEndDate, *(void *)&self->_billingStartDate, self->_carrierName, self->_planType, self->_planDescription, self->_planStatus, self->_accountStatus, self->_accountURL, *(void *)&self->_timestamp, self->_homeCountryList, self->_dataUsage];
}

- (NSString)iccid
{
  return self->_iccid;
}

- (BOOL)autoRenew
{
  return self->_autoRenew;
}

- (double)billingStartDate
{
  return self->_billingStartDate;
}

- (double)billingEndDate
{
  return self->_billingEndDate;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (int)planType
{
  return self->_planType;
}

- (NSString)planDescription
{
  return self->_planDescription;
}

- (int)planStatus
{
  return self->_planStatus;
}

- (void)setPlanStatus:(int)a3
{
  self->_int planStatus = a3;
}

- (int)accountStatus
{
  return self->_accountStatus;
}

- (NSString)accountURL
{
  return self->_accountURL;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSArray)homeCountryList
{
  return self->_homeCountryList;
}

- (NSArray)dataUsage
{
  return self->_dataUsage;
}

- (int)subscriptionResult
{
  return self->_subscriptionResult;
}

- (void)setSubscriptionResult:(int)a3
{
  self->_unsigned int subscriptionResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataUsage, 0);
  objc_storeStrong((id *)&self->_homeCountryList, 0);
  objc_storeStrong((id *)&self->_accountURL, 0);
  objc_storeStrong((id *)&self->_planDescription, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

@end