@interface CNDataclassActionParameters
- (ACAccount)account;
- (ACDataclassAction)action;
- (CNACAccountProvider)accountProvider;
- (CNContactsDataclassOwnerImplementation)implementation;
- (NSArray)childAccounts;
- (void)setAccount:(id)a3;
- (void)setAccountProvider:(id)a3;
- (void)setAction:(id)a3;
- (void)setChildAccounts:(id)a3;
- (void)setImplementation:(id)a3;
@end

@implementation CNDataclassActionParameters

- (ACDataclassAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSArray)childAccounts
{
  return self->_childAccounts;
}

- (void)setChildAccounts:(id)a3
{
}

- (CNACAccountProvider)accountProvider
{
  return self->_accountProvider;
}

- (void)setAccountProvider:(id)a3
{
}

- (CNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (void)setImplementation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_accountProvider, 0);
  objc_storeStrong((id *)&self->_childAccounts, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end