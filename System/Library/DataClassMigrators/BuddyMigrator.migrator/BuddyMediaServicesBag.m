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
  v6.receiver = self;
  v6.super_class = (Class)BuddyMediaServicesBag;
  v2 = [(BuddyMediaServicesBag *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() createBagForSubProfile];
    underlyingBag = v2->_underlyingBag;
    v2->_underlyingBag = (AMSBag *)v3;
  }
  return v2;
}

- (id)getAppStoreURL
{
  uint64_t v3 = +[ACAccountStore ams_sharedAccountStore];
  v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
  v5 = [(BuddyMediaServicesBag *)self underlyingBag];
  objc_super v6 = [v5 URLForKey:@"postOnboardingUrl" account:v4];

  return v6;
}

- (id)getAppStoreMessage
{
  v2 = [(BuddyMediaServicesBag *)self underlyingBag];
  uint64_t v3 = [v2 stringForKey:@"postOnboardingMessage"];

  return v3;
}

- (id)getBundleURL
{
  v2 = [(BuddyMediaServicesBag *)self underlyingBag];
  uint64_t v3 = [v2 URLForKey:@"dynamic-ui-bundle-gdpr-url"];

  return v3;
}

+ (AMSBagKeySet)bagKeySet
{
  id v2 = objc_alloc_init((Class)AMSMutableBagKeySet);
  [v2 addBagKey:@"guid-urls/regex" valueType:0];
  [v2 addBagKey:@"guid-urls/schemes" valueType:0];
  [v2 addBagKey:@"storefront-header-suffix" valueType:4];
  [v2 addBagKey:@"trustedDomains" valueType:0];
  [v2 addBagKey:@"sign-sap-setup-cert" valueType:5];
  [v2 addBagKey:@"sign-sap-setup" valueType:5];
  [v2 addBagKey:@"signed-actions" valueType:6];
  [v2 addBagKey:@"sign-sap-request" valueType:6];
  [v2 addBagKey:@"sign-sap-response" valueType:6];
  [v2 addBagKey:@"metrics/metricsUrl" valueType:5];
  [v2 addBagKey:@"metrics" valueType:6];
  [v2 addBagKey:@"postOnboardingUrl" valueType:5];
  [v2 addBagKey:@"postOnboardingMessage" valueType:4];
  [v2 addBagKey:@"dynamic-ui-bundle-gdpr-url" valueType:5];

  return (AMSBagKeySet *)v2;
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
  id v2 = [(id)objc_opt_class() bagKeySet];
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