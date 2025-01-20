@interface HMDHomePrimaryResidentInitialReachabilityManagerDataSource
- (id)dataValueFromNoBackupStoreWithKey:(id)a3;
- (void)persistDataValueToNoBackupStore:(id)a3 withKey:(id)a4;
@end

@implementation HMDHomePrimaryResidentInitialReachabilityManagerDataSource

- (id)dataValueFromNoBackupStoreWithKey:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.homed.notbackedup");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)persistDataValueToNoBackupStore:(id)a3 withKey:(id)a4
{
}

@end