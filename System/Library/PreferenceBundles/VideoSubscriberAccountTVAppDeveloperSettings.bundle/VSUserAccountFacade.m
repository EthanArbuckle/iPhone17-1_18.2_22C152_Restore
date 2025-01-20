@interface VSUserAccountFacade
- (VSUserAccount)account;
- (VSUserAccountFacade)initWithAccount:(id)a3;
- (id)_synchedToThisDeviceIndicator;
- (id)accountType;
- (id)authenticationDataString;
- (id)billingCycleEndDate;
- (id)billingIdentifier;
- (id)created;
- (id)deviceCategory;
- (id)displayName;
- (id)displayNameWithSynchedToThisDeviceIndicator;
- (id)fromThisDevice;
- (id)identifier;
- (id)lastModified;
- (id)lastModifiedLong;
- (id)requiresSystemTrust;
- (id)sourceIdentifier;
- (id)tierIdentifiers;
- (id)tvProviderIdentifier;
- (id)updateURLString;
- (void)setAccount:(id)a3;
@end

@implementation VSUserAccountFacade

- (VSUserAccountFacade)initWithAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSUserAccountFacade;
  v5 = [(VSUserAccountFacade *)&v8 init];
  v6 = v5;
  if (v5) {
    [(VSUserAccountFacade *)v5 setAccount:v4];
  }

  return v6;
}

- (id)displayName
{
  v3 = [(VSUserAccountFacade *)self account];
  uint64_t v4 = [v3 deviceName];
  v5 = (void *)v4;
  v6 = &stru_83C0;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  objc_super v8 = [(VSUserAccountFacade *)self account];
  unsigned int v9 = [v8 isDeveloperCreated];

  if (v9)
  {
    uint64_t v10 = [(__CFString *)v7 stringByAppendingString:@" 🚧"];

    v7 = (__CFString *)v10;
  }

  return v7;
}

- (id)displayNameWithSynchedToThisDeviceIndicator
{
  v3 = [(VSUserAccountFacade *)self displayName];
  uint64_t v4 = [(VSUserAccountFacade *)self _synchedToThisDeviceIndicator];
  v5 = [v3 stringByAppendingString:v4];

  return v5;
}

- (id)_synchedToThisDeviceIndicator
{
  v2 = [(VSUserAccountFacade *)self account];
  if ([v2 isFromCurrentDevice]) {
    v3 = &stru_83C0;
  }
  else {
    v3 = @"☁️";
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)lastModified
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 modified];
  uint64_t v4 = +[VSTVAppDeveloperSettingsUtilities stringFromDate:v3];

  return v4;
}

- (id)lastModifiedLong
{
  v3 = +[NSBundle vs_frameworkBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"TV_APP_DEVELOPER_LAST_MODIFIED" value:0 table:0];

  v5 = [(VSUserAccountFacade *)self account];
  v6 = [v5 modified];
  v7 = +[VSTVAppDeveloperSettingsUtilities stringFromDate:v6];
  objc_super v8 = +[NSString stringWithFormat:@"%@: %@", v4, v7];

  return v8;
}

- (id)created
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 created];
  uint64_t v4 = +[VSTVAppDeveloperSettingsUtilities stringFromDate:v3];

  return v4;
}

- (id)deviceCategory
{
  v2 = [(VSUserAccountFacade *)self account];
  if ([v2 deviceCategory]) {
    v3 = @"Other";
  }
  else {
    v3 = @"Mobile";
  }
  uint64_t v4 = v3;

  return v4;
}

- (id)fromThisDevice
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = +[NSString vs_localizedStringFromBool:](NSString, "vs_localizedStringFromBool:", [v2 isFromCurrentDevice]);

  return v3;
}

- (id)sourceIdentifier
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 sourceIdentifier];

  return v3;
}

- (id)identifier
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 identifier];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = &stru_83C0;
  }
  v5 = v3;

  return v5;
}

- (id)tvProviderIdentifier
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 accountProviderIdentifier];

  return v3;
}

- (id)requiresSystemTrust
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = +[NSString vs_localizedStringFromBool:](NSString, "vs_localizedStringFromBool:", [v2 requiresSystemTrust]);

  return v3;
}

- (id)accountType
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = (char *)[v2 accountType];

  if (v3 == (unsigned char *)&dword_0 + 1)
  {
    uint64_t v4 = +[NSBundle vs_frameworkBundle];
    v5 = v4;
    CFStringRef v6 = @"TV_APP_DEVELOPER_ACCOUNT_TYPE_PAID";
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    uint64_t v4 = +[NSBundle vs_frameworkBundle];
    v5 = v4;
    CFStringRef v6 = @"TV_APP_DEVELOPER_ACCOUNT_TYPE_FREE";
  }
  v2 = [v4 localizedStringForKey:v6 value:0 table:0];

LABEL_6:

  return v2;
}

- (id)billingIdentifier
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 billingIdentifier];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = &stru_83C0;
  }
  v5 = v3;

  return v5;
}

- (id)billingCycleEndDate
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 subscriptionBillingCycleEndDate];
  uint64_t v4 = +[VSTVAppDeveloperSettingsUtilities stringFromDate:v3];

  return v4;
}

- (id)updateURLString
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 updateURL];
  uint64_t v4 = [v3 absoluteString];
  v5 = v4;
  if (!v4) {
    uint64_t v4 = &stru_83C0;
  }
  CFStringRef v6 = v4;

  return v6;
}

- (id)authenticationDataString
{
  v3 = [(VSUserAccountFacade *)self account];
  if ([v3 isFromCurrentDevice])
  {
    uint64_t v4 = [(VSUserAccountFacade *)self account];
    v5 = [v4 authenticationData];
    if (v5)
    {
      CFStringRef v6 = [(VSUserAccountFacade *)self account];
      v7 = [v6 authenticationData];
    }
    else
    {
      v7 = &stru_83C0;
    }
  }
  else
  {
    v7 = &stru_83C0;
  }

  return v7;
}

- (id)tierIdentifiers
{
  v2 = [(VSUserAccountFacade *)self account];
  v3 = [v2 tierIdentifiers];
  uint64_t v4 = v3;
  if (!v3) {
    v3 = &__NSArray0__struct;
  }
  id v5 = v3;

  return v5;
}

- (VSUserAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end