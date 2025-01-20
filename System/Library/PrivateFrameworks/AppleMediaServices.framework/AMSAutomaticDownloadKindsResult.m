@interface AMSAutomaticDownloadKindsResult
- (ACAccount)account;
- (AMSAutomaticDownloadKindsResult)initWithAccount:(id)a3 andEnabledMediaKinds:(id)a4;
- (NSArray)enabledMediaKinds;
@end

@implementation AMSAutomaticDownloadKindsResult

- (AMSAutomaticDownloadKindsResult)initWithAccount:(id)a3 andEnabledMediaKinds:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSAutomaticDownloadKindsResult;
  v9 = [(AMSAutomaticDownloadKindsResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    uint64_t v11 = [v8 copy];
    enabledMediaKinds = v10->_enabledMediaKinds;
    v10->_enabledMediaKinds = (NSArray *)v11;
  }
  return v10;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSArray)enabledMediaKinds
{
  return self->_enabledMediaKinds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledMediaKinds, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end