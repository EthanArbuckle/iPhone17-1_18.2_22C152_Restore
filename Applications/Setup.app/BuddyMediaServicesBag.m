@interface BuddyMediaServicesBag
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSBag)underlyingBag;
- (BuddyMediaServicesBag)init;
- (id)getAppStoreMessage;
- (id)getAppStoreURL;
- (id)getBundleURL;
- (void)setUnderlyingBag:(id)a3;
@end

@implementation BuddyMediaServicesBag

- (BuddyMediaServicesBag)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMediaServicesBag;
  id location = [(BuddyMediaServicesBag *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = [(id)objc_opt_class() createBagForSubProfile];
    v3 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v2;
  }
  v4 = (BuddyMediaServicesBag *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)getAppStoreURL
{
  SEL v7 = self;
  location[1] = (id)a2;
  location[0] = +[ACAccountStore ams_sharedAccountStore];
  id v5 = [location[0] ams_activeiTunesAccount];
  id v2 = [(BuddyMediaServicesBag *)v7 underlyingBag];
  id v3 = [(AMSBag *)v2 URLForKey:@"postOnboardingUrl" account:v5];

  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);

  return v3;
}

- (id)getAppStoreMessage
{
  id v2 = [(BuddyMediaServicesBag *)self underlyingBag];
  id v3 = [(AMSBag *)v2 stringForKey:@"postOnboardingMessage"];

  return v3;
}

- (id)getBundleURL
{
  id v2 = [(BuddyMediaServicesBag *)self underlyingBag];
  id v3 = [(AMSBag *)v2 URLForKey:@"dynamic-ui-bundle-gdpr-url"];

  return v3;
}

+ (AMSBagKeySet)bagKeySet
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)AMSMutableBagKeySet);
  [location[0] addBagKey:@"guid-urls/regex" valueType:0];
  [location[0] addBagKey:@"guid-urls/schemes" valueType:0];
  [location[0] addBagKey:@"storefront-header-suffix" valueType:4];
  [location[0] addBagKey:@"trustedDomains" valueType:0];
  [location[0] addBagKey:@"sign-sap-setup-cert" valueType:5];
  [location[0] addBagKey:@"sign-sap-setup" valueType:5];
  [location[0] addBagKey:@"signed-actions" valueType:6];
  [location[0] addBagKey:@"sign-sap-request" valueType:6];
  [location[0] addBagKey:@"sign-sap-response" valueType:6];
  [location[0] addBagKey:@"metrics/metricsUrl" valueType:5];
  [location[0] addBagKey:@"metrics" valueType:6];
  [location[0] addBagKey:@"postOnboardingUrl" valueType:5];
  [location[0] addBagKey:@"postOnboardingMessage" valueType:4];
  [location[0] addBagKey:@"dynamic-ui-bundle-gdpr-url" valueType:5];
  id v2 = (AMSBagKeySet *)location[0];
  objc_storeStrong(location, 0);
  return v2;
}

+ (NSString)bagSubProfile
{
  return (NSString *)@"setup";
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)@"1";
}

+ (id)createBagForSubProfile
{
  id v2 = [objc_opt_class() bagKeySet:a2, a1];
  +[AMSBagKeySet registerBagKeySet:v2 forProfile:@"setup" profileVersion:@"1"];

  return +[AMSBag bagForProfile:@"setup" profileVersion:@"1"];
}

- (AMSBag)underlyingBag
{
  return self->_underlyingBag;
}

- (void)setUnderlyingBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end