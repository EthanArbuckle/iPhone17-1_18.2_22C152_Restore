@interface NCCNDataclassActionParameters
- (ACAccount)account;
- (NCCNContactsDataclassOwnerImplementation)implementation;
- (NSArray)childAccounts;
- (void)setAccount:(id)a3;
- (void)setChildAccounts:(id)a3;
- (void)setImplementation:(id)a3;
@end

@implementation NCCNDataclassActionParameters

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

- (NCCNContactsDataclassOwnerImplementation)implementation
{
  return self->_implementation;
}

- (void)setImplementation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implementation, 0);
  objc_storeStrong((id *)&self->_childAccounts, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end