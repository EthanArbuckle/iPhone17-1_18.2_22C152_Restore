@interface HSMatterEcosystem
+ (id)ecosystemForContainingAppBundleURL:(id)a3;
- (BOOL)isAppleHome;
- (BOOL)isTestEcosystemApp;
- (HSMatterEcosystem)initWithApplicationRecord:(id)a3;
- (HSMatterEcosystem)initWithExtensionMessenger:(id)a3;
- (LSApplicationRecord)applicationRecord;
- (MTSDeviceSetupExtensionMessenger)extensionMessenger;
- (NSString)appBundleIdentifier;
- (NSString)developerName;
- (NSString)displayName;
- (NSString)teamIdentifier;
- (void)setApplicationRecord:(id)a3;
@end

@implementation HSMatterEcosystem

+ (id)ecosystemForContainingAppBundleURL:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)MTSDeviceSetupExtensionMessenger) initWithContainingAppBundleURL:v3];

  id v10 = 0;
  unsigned __int8 v5 = [v4 startWithError:&v10];
  id v6 = v10;
  if (v5)
  {
    v7 = [[HSMatterEcosystem alloc] initWithExtensionMessenger:v4];
  }
  else
  {
    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000661E4((uint64_t)v6, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (HSMatterEcosystem)initWithApplicationRecord:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HSMatterEcosystem;
  unsigned __int8 v5 = [(HSMatterEcosystem *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(HSMatterEcosystem *)v5 setApplicationRecord:v4];
  }

  return v6;
}

- (HSMatterEcosystem)initWithExtensionMessenger:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)LSApplicationRecord);
  id v6 = [v4 containingAppBundleURL];
  id v15 = 0;
  id v7 = [v5 initWithURL:v6 allowPlaceholder:0 error:&v15];
  id v8 = v15;

  if (!v7)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006625C(v4, (uint64_t)v8, v9);
    }

    id v10 = [v4 containingAppBundleURL];
    NSLog(@"Failed to create app record from containing app bundle URL %@: %@", v10, v8);
  }
  v11 = [(HSMatterEcosystem *)self initWithApplicationRecord:v7];
  extensionMessenger = v11->_extensionMessenger;
  v11->_extensionMessenger = (MTSDeviceSetupExtensionMessenger *)v4;
  id v13 = v4;

  return v11;
}

- (NSString)displayName
{
  v2 = [(HSMatterEcosystem *)self applicationRecord];
  id v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (NSString)developerName
{
  v2 = [(HSMatterEcosystem *)self applicationRecord];
  id v3 = [v2 iTunesMetadata];
  id v4 = [v3 artistName];

  return (NSString *)v4;
}

- (NSString)appBundleIdentifier
{
  v2 = [(HSMatterEcosystem *)self applicationRecord];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (NSString)teamIdentifier
{
  v2 = [(HSMatterEcosystem *)self applicationRecord];
  id v3 = [v2 teamIdentifier];

  return (NSString *)v3;
}

- (BOOL)isAppleHome
{
  v2 = [(HSMatterEcosystem *)self appBundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.Home"];

  return v3;
}

- (BOOL)isTestEcosystemApp
{
  v2 = [(HSMatterEcosystem *)self appBundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.appleinternal.Chai"];

  return v3;
}

- (MTSDeviceSetupExtensionMessenger)extensionMessenger
{
  return self->_extensionMessenger;
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (void)setApplicationRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecord, 0);

  objc_storeStrong((id *)&self->_extensionMessenger, 0);
}

@end