@interface AMSPurchaseSIWA
+ (BOOL)supportsSecureCoding;
- (AKAppleIDAuthenticationContext)authenticationContext;
- (AMSPurchaseSIWA)initWithCoder:(id)a3;
- (AMSPurchaseSIWA)initWithPurchaseType:(int64_t)a3 buyParams:(id)a4;
- (NSString)bundleID;
- (NSString)serviceID;
- (NSString)teamID;
- (id)appProvidedData;
- (id)authenticationContextForRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setTeamID:(id)a3;
@end

@implementation AMSPurchaseSIWA

- (AMSPurchaseSIWA)initWithPurchaseType:(int64_t)a3 buyParams:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)AMSPurchaseSIWA;
  v4 = [(AMSPurchase *)&v7 initWithPurchaseType:a3 buyParams:a4];
  if (v4)
  {
    v8 = @"shouldReturnIsAtbWithPaymentAuth";
    v9[0] = @"true";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [(AMSPurchase *)v4 setAdditionalHeaders:v5];
  }
  return v4;
}

- (id)authenticationContextForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(AMSPurchaseSIWA *)self authenticationContext];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)AMSPurchaseSIWA;
    id v7 = [(AMSPurchase *)&v16 authenticationContextForRequest:v4];
  }
  v8 = v7;

  v9 = [(AMSPurchaseSIWA *)self appProvidedData];
  v10 = [v8 appProvidedData];
  v11 = (void *)[v10 mutableCopy];
  v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  v14 = v13;

  [v14 addEntriesFromDictionary:v9];
  [v8 setAppProvidedData:v14];

  return v8;
}

- (id)appProvidedData
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"subscriptionTokenGen";
  v5[0] = MEMORY[0x1E4F1CC38];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AMSPurchaseSIWA;
  id v4 = [(AMSPurchase *)&v15 copyWithZone:a3];
  v5 = [(AMSPurchaseSIWA *)self bundleID];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)v4[22];
  v4[22] = v6;

  v8 = [(AMSPurchaseSIWA *)self serviceID];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[23];
  v4[23] = v9;

  v11 = [(AMSPurchaseSIWA *)self teamID];
  uint64_t v12 = [v11 copy];
  id v13 = (void *)v4[24];
  v4[24] = v12;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AMSPurchaseSIWA;
  id v4 = a3;
  [(AMSPurchase *)&v9 encodeWithCoder:v4];
  v5 = [(AMSPurchaseSIWA *)self authenticationContext];
  [v4 encodeObject:v5 forKey:@"authenticationContext"];

  uint64_t v6 = [(AMSPurchaseSIWA *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleID"];

  id v7 = [(AMSPurchaseSIWA *)self serviceID];
  [v4 encodeObject:v7 forKey:@"serviceID"];

  v8 = [(AMSPurchaseSIWA *)self teamID];
  [v4 encodeObject:v8 forKey:@"teamID"];
}

- (AMSPurchaseSIWA)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSPurchaseSIWA;
  v5 = [(AMSPurchase *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationContext"];
    authenticationContext = v5->_authenticationContext;
    v5->_authenticationContext = (AKAppleIDAuthenticationContext *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceID"];
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return self->_authenticationContext;
}

- (void)setAuthenticationContext:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
}

@end