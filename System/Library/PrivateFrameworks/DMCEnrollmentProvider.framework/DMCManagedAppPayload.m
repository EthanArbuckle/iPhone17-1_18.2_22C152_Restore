@interface DMCManagedAppPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (DMCManagedAppPayload)initWithManagedAppID:(id)a3 profile:(id)a4;
- (NSString)managedAppID;
- (void)setManagedAppID:(id)a3;
@end

@implementation DMCManagedAppPayload

+ (id)typeStrings
{
  return &unk_26D44B098;
}

+ (id)localizedSingularForm
{
  return DMCEnrollmentLocalizedString(@"DMC_MANAGED_APPS_SINGULAR");
}

+ (id)localizedPluralForm
{
  return DMCEnrollmentLocalizedString(@"DMC_MANAGED_APPS_PLURAL");
}

- (DMCManagedAppPayload)initWithManagedAppID:(id)a3 profile:(id)a4
{
  id v6 = a3;
  v7 = [(DMCManagedAppPayload *)self init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_managedAppID, a3);
  }

  return v8;
}

- (NSString)managedAppID
{
  return self->_managedAppID;
}

- (void)setManagedAppID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end