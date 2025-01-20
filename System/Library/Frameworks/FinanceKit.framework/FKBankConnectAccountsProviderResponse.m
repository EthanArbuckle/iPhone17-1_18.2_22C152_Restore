@interface FKBankConnectAccountsProviderResponse
- (FKAccount)account;
- (FKBankConnectAccountsProviderResponse)initWithAccount:(id)a3 consentStatus:(unint64_t)a4 institution:(id)a5;
- (FKInstitution)institution;
- (unint64_t)consentStatus;
@end

@implementation FKBankConnectAccountsProviderResponse

- (FKBankConnectAccountsProviderResponse)initWithAccount:(id)a3 consentStatus:(unint64_t)a4 institution:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FKBankConnectAccountsProviderResponse;
  v10 = [(FKBankConnectAccountsProviderResponse *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    account = v10->_account;
    v10->_account = (FKAccount *)v11;

    v10->_consentStatus = a4;
    uint64_t v13 = [v9 copy];
    institution = v10->_institution;
    v10->_institution = (FKInstitution *)v13;
  }
  return v10;
}

- (FKAccount)account
{
  return self->_account;
}

- (unint64_t)consentStatus
{
  return self->_consentStatus;
}

- (FKInstitution)institution
{
  return self->_institution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_institution, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end