@interface HMUserCloudShareClientInfo
+ (BOOL)supportsSecureCoding;
- (HMUserCloudShareClientInfo)initWithAccountAuthToken:(id)a3;
- (HMUserCloudShareClientInfo)initWithCoder:(id)a3;
- (NSData)accountAuthToken;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMUserCloudShareClientInfo

- (void).cxx_destruct
{
}

- (NSData)accountAuthToken
{
  return self->_accountAuthToken;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserCloudShareClientInfo *)self accountAuthToken];
  [v4 encodeObject:v5 forKey:@"authToken"];
}

- (HMUserCloudShareClientInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authToken"];

  v6 = [(HMUserCloudShareClientInfo *)self initWithAccountAuthToken:v5];
  return v6;
}

- (HMUserCloudShareClientInfo)initWithAccountAuthToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMUserCloudShareClientInfo;
  v6 = [(HMUserCloudShareClientInfo *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountAuthToken, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end