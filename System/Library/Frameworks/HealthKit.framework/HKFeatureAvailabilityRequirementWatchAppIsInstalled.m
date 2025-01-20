@interface HKFeatureAvailabilityRequirementWatchAppIsInstalled
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementWatchAppIsInstalled)initWithBundleIdentifier:(id)a3;
- (HKFeatureAvailabilityRequirementWatchAppIsInstalled)initWithCoder:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)requirementDescription;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementWatchAppIsInstalled

- (HKFeatureAvailabilityRequirementWatchAppIsInstalled)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKFeatureAvailabilityRequirementWatchAppIsInstalled;
  v6 = [(HKFeatureAvailabilityRequirementWatchAppIsInstalled *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
  }

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"WatchAppIsInstalled";
}

- (NSString)requirementDescription
{
  return (NSString *)[NSString stringWithFormat:@"The app with the specified bundle ID %@ must be installed on the watch", self->_bundleIdentifier];
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  return (id)[a3 isWatchAppInstalledWithBundleIdentifier:self->_bundleIdentifier error:a4];
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  v7 = [a4 watchAppInstallationDataSource];
  bundleIdentifier = self->_bundleIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__HKFeatureAvailabilityRequirementWatchAppIsInstalled_registerObserver_forDataSource___block_invoke;
  v9[3] = &unk_1E58C0E40;
  v9[4] = self;
  [v7 registerObserver:v6 forKey:bundleIdentifier newValueHandler:v9];
}

void __86__HKFeatureAvailabilityRequirementWatchAppIsInstalled_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v4, objc_msgSend(a3, "BOOLValue"));
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6 = a3;
  id v7 = [a4 watchAppInstallationDataSource];
  [v7 unregisterObserver:v6 forKey:self->_bundleIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    bundleIdentifier = self->_bundleIdentifier;
    id v6 = [v4 bundleIdentifier];
    char v7 = [(NSString *)bundleIdentifier isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
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
}

- (HKFeatureAvailabilityRequirementWatchAppIsInstalled)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];

  NSUInteger v6 = [(HKFeatureAvailabilityRequirementWatchAppIsInstalled *)self initWithBundleIdentifier:v5];
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