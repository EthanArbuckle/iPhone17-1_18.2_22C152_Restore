@interface AMSContractBagShim
+ (id)_callSelector:(SEL)a3 onBagContract:(id)a4;
- (AMSContractBagShim)initWithBagContract:(id)a3;
- (BOOL)isExpired;
- (BOOL)isLoaded;
- (NSDate)expirationDate;
- (NSObject)bagContract;
- (NSString)profile;
- (NSString)profileVersion;
- (SEL)_selectorForBagKey:(id)a3;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)_bagValueForBagKey:(id)a3 bagValueType:(unint64_t)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation AMSContractBagShim

- (AMSContractBagShim)initWithBagContract:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSContractBagShim;
  v6 = [(AMSContractBagShim *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bagContract, a3);
  }

  return v7;
}

- (NSDate)expirationDate
{
  return 0;
}

- (BOOL)isExpired
{
  return 0;
}

- (BOOL)isLoaded
{
  return 1;
}

- (NSString)profile
{
  return (NSString *)@"AMSContractBagShim";
}

- (NSString)profileVersion
{
  return (NSString *)@"1";
}

- (id)arrayForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:0];
}

- (id)BOOLForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:1];
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  AMSError(205, @"Not Supported", @"AMSContractBagShim doesn't support creating a snapshot.", 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v4, 0, v5);
}

- (id)doubleForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:2];
}

- (id)integerForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:3];
}

- (id)stringForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:4];
}

- (id)URLForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:5];
}

- (id)dictionaryForKey:(id)a3
{
  return [(AMSContractBagShim *)self _bagValueForBagKey:a3 bagValueType:6];
}

- (id)_bagValueForBagKey:(id)a3 bagValueType:(unint64_t)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [(AMSContractBagShim *)self bagContract];

  if (v7)
  {
    v8 = [(AMSContractBagShim *)self bagContract];
    [v6 addObject:v8];
  }
  SEL v9 = NSSelectorFromString(&cfstr_Mescalcontract.isa);
  v10 = [(AMSContractBagShim *)self bagContract];
  if (objc_opt_respondsToSelector())
  {
    v11 = objc_opt_class();
    v12 = [(AMSContractBagShim *)self bagContract];
    uint64_t v13 = [v11 _callSelector:v9 onBagContract:v12];

    if (v13) {
      [v6 addObject:v13];
    }
  }
  else
  {

    uint64_t v13 = 0;
  }
  SEL v14 = NSSelectorFromString(&cfstr_Metricscontrac.isa);
  v15 = [(AMSContractBagShim *)self bagContract];
  v32 = (void *)v13;
  if (objc_opt_respondsToSelector())
  {
    v16 = objc_opt_class();
    v17 = [(AMSContractBagShim *)self bagContract];
    uint64_t v18 = [v16 _callSelector:v14 onBagContract:v17];

    if (v18)
    {
      v31 = (void *)v18;
      [v6 addObject:v18];
      goto LABEL_12;
    }
  }
  else
  {
  }
  v31 = 0;
LABEL_12:
  v19 = [(AMSContractBagShim *)self _selectorForBagKey:v5];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (!v19 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          if (![v5 isEqualToString:@"metrics/metricsUrl"]) {
            continue;
          }
          v19 = NSSelectorFromString(&cfstr_Metricsurl.isa);
          if (!v19 || (objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        uint64_t v26 = [(id)objc_opt_class() _callSelector:v19 onBagContract:v25];
        if (v26)
        {
          v28 = (void *)v26;
          v27 = v20;
          goto LABEL_27;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  v27 = AMSError(204, @"Bag Value Missing", @"The underlying bag contract returned nil instead of an AMSBagValue instance.", 0);
  v28 = +[AMSBagValue failingBagValueWithKey:v5 valueType:a4 error:v27];
LABEL_27:

  return v28;
}

+ (id)_callSelector:(SEL)a3 onBagContract:(id)a4
{
  id v5 = a4;
  id v6 = ((void (*)(id, SEL))[v5 methodForSelector:a3])(v5, a3);

  return v6;
}

- (SEL)_selectorForBagKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"appleMusicDeviceOfferDeepLink"])
  {
    id v4 = @"appleMusicDeviceOfferDeepLink";
  }
  else if ([v3 isEqualToString:@"iCloudDeviceOfferDeepLink"])
  {
    id v4 = @"iCloudDeviceOfferDeepLink";
  }
  else if ([v3 isEqualToString:@"family-info"])
  {
    id v4 = @"familyInfoURL";
  }
  else if ([v3 isEqualToString:@"storeplatform-lookup-url"])
  {
    id v4 = @"personalizedLookupURL";
  }
  else if ([v3 isEqualToString:@"storeplatform-lookup-url-unpersonalized"])
  {
    id v4 = @"unpersonalizedLookupURL";
  }
  else if ([v3 isEqualToString:@"sign-sap-setup-cert"])
  {
    id v4 = @"mescalCertificateURL";
  }
  else if ([v3 isEqualToString:@"primeUrl"])
  {
    id v4 = @"mescalPrimingURL";
  }
  else if ([v3 isEqualToString:@"sign-sap-setup"])
  {
    id v4 = @"mescalSetupURL";
  }
  else if ([v3 isEqualToString:@"signed-actions"])
  {
    id v4 = @"mescalSignedActions";
  }
  else if ([v3 isEqualToString:@"sign-sap-request"])
  {
    id v4 = @"mescalSignSapRequests";
  }
  else if ([v3 isEqualToString:@"sign-sap-response"])
  {
    id v4 = @"mescalSignSapResponses";
  }
  else if ([v3 isEqualToString:@"metrics"])
  {
    id v4 = @"metricsDictionary";
  }
  else if ([v3 isEqualToString:@"metrics/metricsUrl"])
  {
    id v4 = @"metricsURL";
  }
  else if ([v3 isEqualToString:@"aps-enabled-patterns"])
  {
    id v4 = @"apsEnabledPatterns";
  }
  else if ([v3 isEqualToString:@"aps-sampling-percentage"])
  {
    id v4 = @"apsSamplingPercent";
  }
  else if ([v3 isEqualToString:@"aps-allowed-product-type"])
  {
    id v4 = @"apsAllowedProductTypes";
  }
  else if ([v3 isEqualToString:@"guid-urls/regex"])
  {
    id v4 = @"guidRegexes";
  }
  else if ([v3 isEqualToString:@"guid-urls/schemes"])
  {
    id v4 = @"guidSchemes";
  }
  else if ([v3 isEqualToString:@"storefront-header-suffix"])
  {
    id v4 = @"storefrontSuffix";
  }
  else if ([v3 isEqualToString:@"TLSSamplingPercentage"])
  {
    id v4 = @"TLSSamplingPercentage";
  }
  else if ([v3 isEqualToString:@"TLSSamplingSessionDuration"])
  {
    id v4 = @"TLSSamplingSessionDuration";
  }
  else if ([v3 isEqualToString:@"TFOSamplingPercentage"])
  {
    id v4 = @"TFOSamplingPercentage";
  }
  else if ([v3 isEqualToString:@"TFOSamplingSessionDuration"])
  {
    id v4 = @"TFOSamplingSessionDuration";
  }
  else if ([v3 isEqualToString:@"schemesThatOverrideTrustedDomains"])
  {
    id v4 = @"schemesThatOverrideTrustedDomains";
  }
  else
  {
    if (![v3 isEqualToString:@"trustedDomains"])
    {
      id v5 = 0;
      goto LABEL_52;
    }
    id v4 = @"trustedDomains";
  }
  id v5 = NSSelectorFromString(&v4->isa);
LABEL_52:

  return v5;
}

- (NSObject)bagContract
{
  return self->_bagContract;
}

- (void).cxx_destruct
{
}

@end