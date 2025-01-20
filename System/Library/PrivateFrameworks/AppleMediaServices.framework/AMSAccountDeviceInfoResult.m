@interface AMSAccountDeviceInfoResult
- (ACAccount)account;
- (AMSAccountDeviceInfoResult)initWithAccount:(id)a3 responseDictionary:(id)a4;
- (NSDictionary)rawResult;
- (NSNumber)isBundleOwner;
- (id)description;
@end

@implementation AMSAccountDeviceInfoResult

- (AMSAccountDeviceInfoResult)initWithAccount:(id)a3 responseDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAccountDeviceInfoResult;
  v9 = [(AMSAccountDeviceInfoResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_rawResult, a4);
  }

  return v10;
}

- (NSNumber)isBundleOwner
{
  v2 = [(AMSAccountDeviceInfoResult *)self rawResult];
  v3 = [v2 objectForKeyedSubscript:@"isBundleOwner"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (id)description
{
  v2 = [(AMSAccountDeviceInfoResult *)self rawResult];
  v3 = [v2 description];

  return v3;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSDictionary)rawResult
{
  return self->_rawResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawResult, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end