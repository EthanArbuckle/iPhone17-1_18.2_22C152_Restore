@interface HKFeatureAvailabilityRequirementNotificationAuthorized
+ (BOOL)supportsSecureCoding;
+ (id)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementNotificationAuthorized)initWithBundleIdentifier:(id)a3;
- (HKFeatureAvailabilityRequirementNotificationAuthorized)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)requirementDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementNotificationAuthorized

- (HKFeatureAvailabilityRequirementNotificationAuthorized)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementNotificationAuthorized;
  v5 = [(HKFeatureAvailabilityRequirementNotificationAuthorized *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (id)requirementIdentifier
{
  return @"NotificationAuthorized";
}

- (id)requirementDescription
{
  return (id)[NSString stringWithFormat:@"%@ must be authorized for notification", self->_bundleIdentifier];
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v5 = NSNumber;
  uint64_t v6 = [a3 userNotificationsDataSource];
  v7 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v6, "areNotificationsAuthorizedWithBundleIdentifier:", self->_bundleIdentifier));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSString *)self->_bundleIdentifier isEqualToString:v4[1]];

  return v5;
}

- (unint64_t)hash
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [v4 hash];
  NSUInteger v6 = [(NSString *)self->_bundleIdentifier hash] ^ v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityRequirementNotificationAuthorized;
  id v4 = a3;
  [(HKFeatureAvailabilityBaseRequirement *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, @"bundleIdentifierKey", v5.receiver, v5.super_class);
}

- (HKFeatureAvailabilityRequirementNotificationAuthorized)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifierKey"];

  NSUInteger v6 = [(HKFeatureAvailabilityRequirementNotificationAuthorized *)self initWithBundleIdentifier:v5];
  return v6;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
}

@end