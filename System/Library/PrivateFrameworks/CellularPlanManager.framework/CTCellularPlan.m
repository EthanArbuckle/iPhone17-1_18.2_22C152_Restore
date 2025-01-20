@interface CTCellularPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)autoRenew;
- (BOOL)isDeleteNotAllowed;
- (BOOL)isDisableNotAllowed;
- (BOOL)isHomePlan;
- (BOOL)isSelectable;
- (BOOL)isSelected;
- (BOOL)requiresUserConsent;
- (CTCellularPlan)init;
- (CTCellularPlan)initWithCoder:(id)a3;
- (CTCellularPlan)initWithProfile:(id)a3 subscription:(id)a4;
- (CTCellularPlanProfile)profile;
- (CTCellularPlanSubscription)subscription;
- (NSArray)dataUsage;
- (NSData)profileId;
- (NSNumber)subscriptionStatusOverride;
- (NSString)accountURL;
- (NSString)carrierName;
- (NSString)iccid;
- (NSString)phoneNumber;
- (NSString)planDescription;
- (double)billingEndDate;
- (double)billingStartDate;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (id)statusAsString:(id)a3;
- (int)accountStatus;
- (int)planStatus;
- (int)planType;
- (int)status;
- (int64_t)planDescriptionCompare:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIsHomePlan:(BOOL)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRequiresUserConsent:(BOOL)a3;
- (void)setSubscription:(id)a3;
- (void)setSubscriptionStatusOverride:(id)a3;
@end

@implementation CTCellularPlan

- (CTCellularPlan)init
{
  return [(CTCellularPlan *)self initWithProfile:0 subscription:0];
}

- (CTCellularPlan)initWithProfile:(id)a3 subscription:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CTCellularPlan;
  v9 = [(CTCellularPlan *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subscription, a4);
    objc_storeStrong((id *)&v10->_profile, a3);
    v10->_isHomePlan = 0;
  }

  return v10;
}

- (int64_t)planDescriptionCompare:(id)a3
{
  id v4 = a3;
  v5 = [(CTCellularPlan *)self planDescription];
  v6 = [v4 planDescription];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSData)profileId
{
  return [(CTCellularPlanProfile *)self->_profile profileId];
}

- (BOOL)isSelected
{
  return 0;
}

- (BOOL)isSelectable
{
  return 1;
}

- (int)status
{
  v2 = [(CTCellularPlan *)self subscriptionStatusOverride];
  int v3 = [v2 intValue];

  return v3;
}

- (id)statusAsString:(id)a3
{
  unsigned int v3 = [a3 intValue];
  if (v3 > 0xE) {
    return @"Unknown";
  }
  else {
    return off_1E6C1EBE8[v3];
  }
}

- (NSString)iccid
{
  profile = self->_profile;
  if (!profile) {
    profile = self->_subscription;
  }
  id v4 = [profile iccid];
  return (NSString *)v4;
}

- (BOOL)autoRenew
{
  return [(CTCellularPlanSubscription *)self->_subscription autoRenew];
}

- (double)timestamp
{
  [(CTCellularPlanSubscription *)self->_subscription timestamp];
  return result;
}

- (double)billingStartDate
{
  [(CTCellularPlanSubscription *)self->_subscription billingStartDate];
  return result;
}

- (double)billingEndDate
{
  [(CTCellularPlanSubscription *)self->_subscription billingEndDate];
  return result;
}

- (NSString)carrierName
{
  return [(CTCellularPlanSubscription *)self->_subscription carrierName];
}

- (int)planType
{
  return [(CTCellularPlanSubscription *)self->_subscription planType];
}

- (NSString)planDescription
{
  v2 = [(CTCellularPlanSubscription *)self->_subscription planDescription];
  unsigned int v3 = v2;
  if (v2 && [v2 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (int)planStatus
{
  return [(CTCellularPlanSubscription *)self->_subscription planStatus];
}

- (int)accountStatus
{
  return [(CTCellularPlanSubscription *)self->_subscription accountStatus];
}

- (NSString)accountURL
{
  return [(CTCellularPlanSubscription *)self->_subscription accountURL];
}

- (BOOL)isDisableNotAllowed
{
  return [(CTCellularPlanProfile *)self->_profile isDisableNotAllowed];
}

- (BOOL)isDeleteNotAllowed
{
  return [(CTCellularPlanProfile *)self->_profile isDeleteNotAllowed];
}

- (BOOL)requiresUserConsent
{
  return [(CTCellularPlanProfile *)self->_profile requiresUserConsent];
}

- (NSArray)dataUsage
{
  return [(CTCellularPlanSubscription *)self->_subscription dataUsage];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(CTCellularPlanProfile *)self->_profile copy];
  v6 = (void *)[(CTCellularPlanSubscription *)self->_subscription copy];
  int64_t v7 = (void *)[v4 initWithProfile:v5 subscription:v6];

  return v7;
}

- (CTCellularPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlan;
  v5 = [(CTCellularPlan *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscription"];
    subscription = v5->_subscription;
    v5->_subscription = (CTCellularPlanSubscription *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profile"];
    profile = v5->_profile;
    v5->_profile = (CTCellularPlanProfile *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subscriptionStatusOverride"];
    [(CTCellularPlan *)v5 setSubscriptionStatusOverride:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    [(CTCellularPlan *)v5 setPhoneNumber:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  subscription = self->_subscription;
  id v5 = a3;
  [v5 encodeObject:subscription forKey:@"subscription"];
  [v5 encodeObject:self->_profile forKey:@"profile"];
  [v5 encodeObject:self->_subscriptionStatusOverride forKey:@"subscriptionStatusOverride"];
  id v6 = [(CTCellularPlan *)self phoneNumber];
  [v5 encodeObject:v6 forKey:@"phoneNumber"];
}

- (id)description
{
  unsigned int v3 = NSString;
  id v4 = [(CTCellularPlan *)self statusAsString:self->_subscriptionStatusOverride];
  id v5 = [v3 stringWithFormat:@"<plan: subscription override:%@, %@ %@>", v4, self->_profile, self->_subscription];

  return v5;
}

- (id)redactedDescription
{
  unsigned int v3 = NSString;
  id v4 = [(CTCellularPlan *)self statusAsString:self->_subscriptionStatusOverride];
  id v5 = [(CTCellularPlanProfile *)self->_profile redactedDescription];
  id v6 = [(CTCellularPlanSubscription *)self->_subscription redactedDescription];
  int64_t v7 = [v3 stringWithFormat:@"<plan: subscription override:%@, %@ %@>", v4, v5, v6];

  return v7;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (BOOL)isHomePlan
{
  return self->_isHomePlan;
}

- (void)setIsHomePlan:(BOOL)a3
{
  self->_isHomePlan = a3;
}

- (CTCellularPlanProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (CTCellularPlanSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (NSNumber)subscriptionStatusOverride
{
  return self->_subscriptionStatusOverride;
}

- (void)setSubscriptionStatusOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionStatusOverride, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end