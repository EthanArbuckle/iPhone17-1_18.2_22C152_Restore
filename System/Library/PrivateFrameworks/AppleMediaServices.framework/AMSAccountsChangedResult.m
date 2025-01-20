@interface AMSAccountsChangedResult
- (ACAccount)account;
- (AMSAccountsChangedResult)initWithAccount:(id)a3;
- (NSString)hashedDescription;
@end

@implementation AMSAccountsChangedResult

- (AMSAccountsChangedResult)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSAccountsChangedResult;
  v6 = [(AMSAccountsChangedResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (NSString)hashedDescription
{
  v2 = [(AMSAccountsChangedResult *)self account];
  v3 = [v2 hashedDescription];

  return (NSString *)v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
}

@end