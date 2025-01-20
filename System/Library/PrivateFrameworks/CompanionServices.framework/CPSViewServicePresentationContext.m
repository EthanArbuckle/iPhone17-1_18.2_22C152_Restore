@interface CPSViewServicePresentationContext
+ (BOOL)supportsSecureCoding;
- (ACAccount)storeAccount;
- (AMSDelegatePurchaseRequest)delegatePurchaseRequest;
- (CPSDedicatedCameraRequest)dedicatedCameraRequest;
- (CPSLearnMoreRequest)learnMoreRequest;
- (CPSRestrictedAccessRequest)restrictedAccessRequest;
- (CPSStoreAuthenticationRequest)storeAuthenticationRequest;
- (CPSSystemAuthenticationRequest)systemAuthenticationRequest;
- (CPSTVProviderRequest)tvProviderRequest;
- (CPSViewServicePresentationContext)initWithCoder:(id)a3;
- (CPSWebRequest)webAuthenticationRequest;
- (NSArray)proxiedAppDomains;
- (NSData)sharingData;
- (NSDictionary)paymentContext;
- (NSString)deviceName;
- (PKPaymentRequest)paymentRequest;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDedicatedCameraRequest:(id)a3;
- (void)setDelegatePurchaseRequest:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setLearnMoreRequest:(id)a3;
- (void)setPaymentContext:(id)a3;
- (void)setPaymentRequest:(id)a3;
- (void)setProxiedAppDomains:(id)a3;
- (void)setRestrictedAccessRequest:(id)a3;
- (void)setSharingData:(id)a3;
- (void)setStoreAccount:(id)a3;
- (void)setStoreAuthenticationRequest:(id)a3;
- (void)setSystemAuthenticationRequest:(id)a3;
- (void)setTvProviderRequest:(id)a3;
- (void)setWebAuthenticationRequest:(id)a3;
@end

@implementation CPSViewServicePresentationContext

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_deviceName withName:@"deviceName" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_delegatePurchaseRequest withName:@"delegatePurchaseRequest" skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_paymentRequest withName:@"paymentRequest" skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_paymentContext withName:@"paymentContext" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_storeAccount withName:@"storeAccount" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_systemAuthenticationRequest withName:@"systemAuthenticationRequest"];
  id v9 = (id)[v3 appendObject:self->_webAuthenticationRequest withName:@"webAuthenticationRequest" skipIfNil:1];
  id v10 = (id)[v3 appendObject:self->_proxiedAppDomains withName:@"proxiedAppDomains" skipIfNil:1];
  id v11 = (id)[v3 appendObject:self->_restrictedAccessRequest withName:@"restrictedAccessRequest" skipIfNil:1];
  id v12 = (id)[v3 appendObject:self->_storeAuthenticationRequest withName:@"storeAuthenticationRequest" skipIfNil:1];
  id v13 = (id)[v3 appendObject:self->_tvProviderRequest withName:@"tvProviderRequest" skipIfNil:1];
  id v14 = (id)[v3 appendObject:self->_learnMoreRequest withName:@"learnMoreRequest"];
  id v15 = (id)[v3 appendObject:self->_dedicatedCameraRequest withName:@"dedicatedCameraRequest"];
  v16 = [v3 build];

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSViewServicePresentationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)CPSViewServicePresentationContext;
  id v5 = [(CPSViewServicePresentationContext *)&v56 init];
  if (v5)
  {
    id v6 = self;
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    if ([v4 containsValueForKey:@"delegatePurchaseRequest"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:getAMSDelegatePurchaseRequestClass() forKey:@"delegatePurchaseRequest"];
      delegatePurchaseRequest = v5->_delegatePurchaseRequest;
      v5->_delegatePurchaseRequest = (AMSDelegatePurchaseRequest *)v9;
    }
    else
    {
      delegatePurchaseRequest = v5->_delegatePurchaseRequest;
      v5->_delegatePurchaseRequest = 0;
    }

    if ([v4 containsValueForKey:@"paymentRequest"])
    {
      uint64_t v11 = [v4 decodeObjectOfClass:getPKPaymentRequestClass() forKey:@"paymentRequest"];
      paymentRequest = v5->_paymentRequest;
      v5->_paymentRequest = (PKPaymentRequest *)v11;
    }
    else
    {
      paymentRequest = v5->_paymentRequest;
      v5->_paymentRequest = 0;
    }

    id v13 = (void *)MEMORY[0x263EFFA08];
    id v14 = self;
    id v15 = self;
    v16 = self;
    v17 = self;
    v18 = self;
    v19 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"paymentContext"];
    paymentContext = v5->_paymentContext;
    v5->_paymentContext = (NSDictionary *)v20;

    v22 = self;
    uint64_t v23 = [v4 decodeObjectOfClass:v22 forKey:@"storeAccount"];
    storeAccount = v5->_storeAccount;
    v5->_storeAccount = (ACAccount *)v23;

    v25 = self;
    uint64_t v26 = [v4 decodeObjectOfClass:v25 forKey:@"systemAuthenticationRequest"];
    systemAuthenticationRequest = v5->_systemAuthenticationRequest;
    v5->_systemAuthenticationRequest = (CPSSystemAuthenticationRequest *)v26;

    v28 = self;
    uint64_t v29 = [v4 decodeObjectOfClass:v28 forKey:@"webAuthenticationRequest"];
    webAuthenticationRequest = v5->_webAuthenticationRequest;
    v5->_webAuthenticationRequest = (CPSWebRequest *)v29;

    v31 = (void *)MEMORY[0x263EFFA08];
    v32 = self;
    v33 = self;
    v34 = objc_msgSend(v31, "setWithObjects:", v32, v33, 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"proxiedAppDomains"];
    proxiedAppDomains = v5->_proxiedAppDomains;
    v5->_proxiedAppDomains = (NSArray *)v35;

    v37 = self;
    uint64_t v38 = [v4 decodeObjectOfClass:v37 forKey:@"sharingData"];
    sharingData = v5->_sharingData;
    v5->_sharingData = (NSData *)v38;

    v40 = self;
    uint64_t v41 = [v4 decodeObjectOfClass:v40 forKey:@"restrictedAccessRequest"];
    restrictedAccessRequest = v5->_restrictedAccessRequest;
    v5->_restrictedAccessRequest = (CPSRestrictedAccessRequest *)v41;

    v43 = self;
    uint64_t v44 = [v4 decodeObjectOfClass:v43 forKey:@"storeAuthenticationRequest"];
    storeAuthenticationRequest = v5->_storeAuthenticationRequest;
    v5->_storeAuthenticationRequest = (CPSStoreAuthenticationRequest *)v44;

    v46 = self;
    uint64_t v47 = [v4 decodeObjectOfClass:v46 forKey:@"tvProviderRequest"];
    tvProviderRequest = v5->_tvProviderRequest;
    v5->_tvProviderRequest = (CPSTVProviderRequest *)v47;

    v49 = self;
    uint64_t v50 = [v4 decodeObjectOfClass:v49 forKey:@"learnMoreRequest"];
    learnMoreRequest = v5->_learnMoreRequest;
    v5->_learnMoreRequest = (CPSLearnMoreRequest *)v50;

    v52 = self;
    uint64_t v53 = [v4 decodeObjectOfClass:v52 forKey:@"dedicatedCameraRequest"];
    dedicatedCameraRequest = v5->_dedicatedCameraRequest;
    v5->_dedicatedCameraRequest = (CPSDedicatedCameraRequest *)v53;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_delegatePurchaseRequest forKey:@"delegatePurchaseRequest"];
  [v5 encodeObject:self->_paymentRequest forKey:@"paymentRequest"];
  [v5 encodeObject:self->_paymentContext forKey:@"paymentContext"];
  [v5 encodeObject:self->_storeAccount forKey:@"storeAccount"];
  [v5 encodeObject:self->_systemAuthenticationRequest forKey:@"systemAuthenticationRequest"];
  [v5 encodeObject:self->_webAuthenticationRequest forKey:@"webAuthenticationRequest"];
  [v5 encodeObject:self->_proxiedAppDomains forKey:@"proxiedAppDomains"];
  [v5 encodeObject:self->_sharingData forKey:@"sharingData"];
  [v5 encodeObject:self->_restrictedAccessRequest forKey:@"restrictedAccessRequest"];
  [v5 encodeObject:self->_storeAuthenticationRequest forKey:@"storeAuthenticationRequest"];
  [v5 encodeObject:self->_tvProviderRequest forKey:@"tvProviderRequest"];
  [v5 encodeObject:self->_learnMoreRequest forKey:@"learnMoreRequest"];
  [v5 encodeObject:self->_dedicatedCameraRequest forKey:@"dedicatedCameraRequest"];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (AMSDelegatePurchaseRequest)delegatePurchaseRequest
{
  return self->_delegatePurchaseRequest;
}

- (void)setDelegatePurchaseRequest:(id)a3
{
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
}

- (NSDictionary)paymentContext
{
  return self->_paymentContext;
}

- (void)setPaymentContext:(id)a3
{
}

- (ACAccount)storeAccount
{
  return self->_storeAccount;
}

- (void)setStoreAccount:(id)a3
{
}

- (CPSSystemAuthenticationRequest)systemAuthenticationRequest
{
  return self->_systemAuthenticationRequest;
}

- (void)setSystemAuthenticationRequest:(id)a3
{
}

- (CPSWebRequest)webAuthenticationRequest
{
  return self->_webAuthenticationRequest;
}

- (void)setWebAuthenticationRequest:(id)a3
{
}

- (NSArray)proxiedAppDomains
{
  return self->_proxiedAppDomains;
}

- (void)setProxiedAppDomains:(id)a3
{
}

- (NSData)sharingData
{
  return self->_sharingData;
}

- (void)setSharingData:(id)a3
{
}

- (CPSRestrictedAccessRequest)restrictedAccessRequest
{
  return self->_restrictedAccessRequest;
}

- (void)setRestrictedAccessRequest:(id)a3
{
}

- (CPSStoreAuthenticationRequest)storeAuthenticationRequest
{
  return self->_storeAuthenticationRequest;
}

- (void)setStoreAuthenticationRequest:(id)a3
{
}

- (CPSTVProviderRequest)tvProviderRequest
{
  return self->_tvProviderRequest;
}

- (void)setTvProviderRequest:(id)a3
{
}

- (CPSLearnMoreRequest)learnMoreRequest
{
  return self->_learnMoreRequest;
}

- (void)setLearnMoreRequest:(id)a3
{
}

- (CPSDedicatedCameraRequest)dedicatedCameraRequest
{
  return self->_dedicatedCameraRequest;
}

- (void)setDedicatedCameraRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedicatedCameraRequest, 0);
  objc_storeStrong((id *)&self->_learnMoreRequest, 0);
  objc_storeStrong((id *)&self->_tvProviderRequest, 0);
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_restrictedAccessRequest, 0);
  objc_storeStrong((id *)&self->_sharingData, 0);
  objc_storeStrong((id *)&self->_proxiedAppDomains, 0);
  objc_storeStrong((id *)&self->_webAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_storeAccount, 0);
  objc_storeStrong((id *)&self->_paymentContext, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_delegatePurchaseRequest, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end