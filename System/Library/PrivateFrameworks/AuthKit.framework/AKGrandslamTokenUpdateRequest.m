@interface AKGrandslamTokenUpdateRequest
- (ACAccount)aidaAccount;
- (AKAccountManager)accountManager;
- (AKAppleIDAuthenticationContext)context;
- (AKGrandslamTokenUpdateRequest)initWithTokens:(id)a3 accountManager:(id)a4 context:(id)a5 altDSID:(id)a6;
- (NSDictionary)tokensById;
- (NSNumber)dsid;
- (NSString)altDSID;
- (NSString)appleIDUsername;
- (void)setAppleIDUsername:(id)a3;
- (void)setDsid:(id)a3;
@end

@implementation AKGrandslamTokenUpdateRequest

- (AKGrandslamTokenUpdateRequest)initWithTokens:(id)a3 accountManager:(id)a4 context:(id)a5 altDSID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AKGrandslamTokenUpdateRequest;
  v15 = [(AKGrandslamTokenUpdateRequest *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_tokensById, a3);
    objc_storeStrong((id *)&v16->_accountManager, a4);
    objc_storeStrong((id *)&v16->_context, a5);
    objc_storeStrong((id *)&v16->_altDSID, a6);
    uint64_t v17 = [(AKAccountManager *)v16->_accountManager appleIDAccountWithAltDSID:v14];
    aidaAccount = v16->_aidaAccount;
    v16->_aidaAccount = (ACAccount *)v17;
  }
  return v16;
}

- (NSDictionary)tokensById
{
  return self->_tokensById;
}

- (AKAccountManager)accountManager
{
  return self->_accountManager;
}

- (AKAppleIDAuthenticationContext)context
{
  return self->_context;
}

- (ACAccount)aidaAccount
{
  return self->_aidaAccount;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)appleIDUsername
{
  return self->_appleIDUsername;
}

- (void)setAppleIDUsername:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDUsername, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_aidaAccount, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);

  objc_storeStrong((id *)&self->_tokensById, 0);
}

@end