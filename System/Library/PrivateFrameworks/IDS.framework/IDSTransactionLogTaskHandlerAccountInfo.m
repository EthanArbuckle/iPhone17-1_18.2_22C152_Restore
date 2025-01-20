@interface IDSTransactionLogTaskHandlerAccountInfo
- (ENAccountIdentity)accountIdentity;
- (IDSTransactionLogTaskHandlerAccountInfo)initWithAccountIdentity:(id)a3 aliasToAccountsMap:(id)a4 serviceName:(id)a5;
- (NSDictionary)aliasToAccountsMap;
- (NSString)serviceName;
- (id)accountForAlias:(id)a3;
@end

@implementation IDSTransactionLogTaskHandlerAccountInfo

- (IDSTransactionLogTaskHandlerAccountInfo)initWithAccountIdentity:(id)a3 aliasToAccountsMap:(id)a4 serviceName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSTransactionLogTaskHandlerAccountInfo;
  v12 = [(IDSTransactionLogTaskHandlerAccountInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accountIdentity, a3);
    objc_storeStrong((id *)&v13->_aliasToAccountsMap, a4);
    objc_storeStrong((id *)&v13->_serviceName, a5);
  }

  return v13;
}

- (id)accountForAlias:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(IDSTransactionLogTaskHandlerAccountInfo *)self aliasToAccountsMap];
    v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ENAccountIdentity)accountIdentity
{
  return self->_accountIdentity;
}

- (NSDictionary)aliasToAccountsMap
{
  return self->_aliasToAccountsMap;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_aliasToAccountsMap, 0);

  objc_storeStrong((id *)&self->_accountIdentity, 0);
}

@end