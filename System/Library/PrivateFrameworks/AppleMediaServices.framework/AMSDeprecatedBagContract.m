@interface AMSDeprecatedBagContract
- (AMSBagProtocol)bag;
- (AMSBagValue)TFOSamplingPercentage;
- (AMSBagValue)TFOSamplingSessionDuration;
- (AMSBagValue)TLSSamplingPercentage;
- (AMSBagValue)TLSSamplingSessionDuration;
- (AMSBagValue)appleMusicDeviceOfferDeepLink;
- (AMSBagValue)apsAllowedProductTypes;
- (AMSBagValue)apsEnabledPatterns;
- (AMSBagValue)apsSamplingPercent;
- (AMSBagValue)guidRegexes;
- (AMSBagValue)guidSchemes;
- (AMSBagValue)iCloudDeviceOfferDeepLink;
- (AMSBagValue)mescalCertificateURL;
- (AMSBagValue)mescalSetupURL;
- (AMSBagValue)mescalSignSapRequests;
- (AMSBagValue)mescalSignSapResponses;
- (AMSBagValue)mescalSignedActions;
- (AMSBagValue)metricsDictionary;
- (AMSBagValue)metricsURL;
- (AMSBagValue)metricsUrl;
- (AMSBagValue)personalizedLookupURL;
- (AMSBagValue)storefrontSuffix;
- (AMSBagValue)trustedDomains;
- (AMSBagValue)unpersonalizedLookupURL;
- (AMSDeprecatedBagContract)initWithBag:(id)a3;
- (void)setBag:(id)a3;
@end

@implementation AMSDeprecatedBagContract

- (void).cxx_destruct
{
}

- (AMSDeprecatedBagContract)initWithBag:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDeprecatedBagContract;
  v6 = [(AMSDeprecatedBagContract *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bag, a3);
  }

  return v7;
}

- (AMSBagValue)metricsDictionary
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag dictionaryForKey:@"metrics"];
}

- (AMSBagValue)appleMusicDeviceOfferDeepLink
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"appleMusicDeviceOfferDeepLink"];
}

- (AMSBagValue)iCloudDeviceOfferDeepLink
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"iCloudDeviceOfferDeepLink"];
}

- (AMSBagValue)personalizedLookupURL
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"storeplatform-lookup-url"];
}

- (AMSBagValue)unpersonalizedLookupURL
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"storeplatform-lookup-url-unpersonalized"];
}

- (AMSBagValue)metricsUrl
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"metrics/metricsUrl"];
}

- (AMSBagValue)metricsURL
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"metrics/metricsUrl"];
}

- (AMSBagValue)mescalCertificateURL
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"sign-sap-setup-cert"];
}

- (AMSBagValue)mescalSetupURL
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag URLForKey:@"sign-sap-setup"];
}

- (AMSBagValue)mescalSignedActions
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag dictionaryForKey:@"signed-actions"];
}

- (AMSBagValue)mescalSignSapRequests
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag dictionaryForKey:@"sign-sap-request"];
}

- (AMSBagValue)mescalSignSapResponses
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag dictionaryForKey:@"sign-sap-response"];
}

- (AMSBagValue)apsEnabledPatterns
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag arrayForKey:@"aps-enabled-patterns"];
}

- (AMSBagValue)apsSamplingPercent
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag doubleForKey:@"aps-sampling-percentage"];
}

- (AMSBagValue)apsAllowedProductTypes
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag arrayForKey:@"aps-allowed-product-type"];
}

- (AMSBagValue)guidRegexes
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag arrayForKey:@"guid-urls/regex"];
}

- (AMSBagValue)guidSchemes
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag arrayForKey:@"guid-urls/schemes"];
}

- (AMSBagValue)storefrontSuffix
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag stringForKey:@"storefront-header-suffix"];
}

- (AMSBagValue)TLSSamplingPercentage
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag doubleForKey:@"TLSSamplingPercentage"];
}

- (AMSBagValue)TLSSamplingSessionDuration
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag integerForKey:@"TLSSamplingSessionDuration"];
}

- (AMSBagValue)TFOSamplingPercentage
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag doubleForKey:@"TFOSamplingPercentage"];
}

- (AMSBagValue)TFOSamplingSessionDuration
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag integerForKey:@"TFOSamplingSessionDuration"];
}

- (AMSBagValue)trustedDomains
{
  return (AMSBagValue *)[(AMSBagProtocol *)self->_bag arrayForKey:@"trustedDomains"];
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

@end