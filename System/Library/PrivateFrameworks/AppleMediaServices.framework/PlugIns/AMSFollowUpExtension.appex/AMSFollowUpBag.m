@interface AMSFollowUpBag
+ (id)_keySet;
- (AMSBag)bag;
- (AMSBagValue)mescalCertificateURL;
- (AMSBagValue)mescalSetupURL;
- (AMSBagValue)mescalSignSapRequests;
- (AMSBagValue)mescalSignSapResponses;
- (AMSBagValue)mescalSignedActions;
- (AMSBagValue)metricsDictionary;
- (AMSBagValue)metricsURL;
- (AMSBagValue)trustedDomains;
- (AMSFollowUpBag)init;
- (void)setBag:(id)a3;
@end

@implementation AMSFollowUpBag

- (AMSFollowUpBag)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSFollowUpBag;
  v2 = [(AMSFollowUpBag *)&v7 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() _keySet];
    +[AMSBagKeySet registerBagKeySet:v3 forProfile:@"appstored" profileVersion:@"1"];

    uint64_t v4 = +[AMSBag bagForProfile:@"appstored" profileVersion:@"1"];
    bag = v2->_bag;
    v2->_bag = (AMSBag *)v4;
  }
  return v2;
}

- (AMSBagValue)metricsURL
{
  return (AMSBagValue *)[(AMSBag *)self->_bag URLForKey:@"metrics/metricsUrl"];
}

- (AMSBagValue)metricsDictionary
{
  return (AMSBagValue *)[(AMSBag *)self->_bag dictionaryForKey:@"metrics"];
}

- (AMSBagValue)mescalCertificateURL
{
  return (AMSBagValue *)[(AMSBag *)self->_bag URLForKey:@"sign-sap-setup-cert"];
}

- (AMSBagValue)mescalSetupURL
{
  return (AMSBagValue *)[(AMSBag *)self->_bag URLForKey:@"sign-sap-setup"];
}

- (AMSBagValue)mescalSignedActions
{
  return (AMSBagValue *)[(AMSBag *)self->_bag dictionaryForKey:@"signed-actions"];
}

- (AMSBagValue)mescalSignSapRequests
{
  return (AMSBagValue *)[(AMSBag *)self->_bag dictionaryForKey:@"sign-sap-request"];
}

- (AMSBagValue)mescalSignSapResponses
{
  return (AMSBagValue *)[(AMSBag *)self->_bag dictionaryForKey:@"sign-sap-response"];
}

- (AMSBagValue)trustedDomains
{
  return (AMSBagValue *)[(AMSBag *)self->_bag arrayForKey:@"trustedDomains"];
}

+ (id)_keySet
{
  id v2 = objc_alloc_init((Class)AMSMutableBagKeySet);
  [v2 addBagKey:@"metrics" valueType:6];
  [v2 addBagKey:@"metrics/metricsUrl" valueType:5];
  [v2 addBagKey:@"sign-sap-setup-cert" valueType:5];
  [v2 addBagKey:@"sign-sap-setup" valueType:5];
  [v2 addBagKey:@"signed-actions" valueType:6];
  [v2 addBagKey:@"sign-sap-request" valueType:6];
  [v2 addBagKey:@"sign-sap-response" valueType:6];
  [v2 addBagKey:@"trustedDomains" valueType:0];
  return v2;
}

- (AMSBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end