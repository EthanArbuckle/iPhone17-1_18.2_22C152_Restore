@interface AMSAccountCachedServerDataResponse
+ (BOOL)supportsSecureCoding;
- (AMSAccountCachedServerDataResponse)initWithCoder:(id)a3;
- (NSDictionary)allAccountResults;
- (void)encodeWithCoder:(id)a3;
- (void)setAllAccountResults:(id)a3;
@end

@implementation AMSAccountCachedServerDataResponse

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAccountCachedServerDataResponse *)self allAccountResults];
  [v4 encodeObject:v5 forKey:@"kAllAccountData"];
}

- (AMSAccountCachedServerDataResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AMSAccountCachedServerDataResponse;
  id v5 = [(AMSAccountCachedServerDataResponse *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"kAllAccountData"];
    allAccountResults = v5->_allAccountResults;
    v5->_allAccountResults = (NSDictionary *)v7;
  }
  return v5;
}

- (NSDictionary)allAccountResults
{
  return self->_allAccountResults;
}

- (void)setAllAccountResults:(id)a3
{
}

@end