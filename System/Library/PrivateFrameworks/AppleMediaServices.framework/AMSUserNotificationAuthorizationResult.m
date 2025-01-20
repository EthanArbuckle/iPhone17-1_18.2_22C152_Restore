@interface AMSUserNotificationAuthorizationResult
+ (BOOL)supportsSecureCoding;
- (AMSEngagementRequest)request;
- (AMSUserNotificationAuthorizationResult)initWithCoder:(id)a3;
- (int64_t)authorizationStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setRequest:(id)a3;
@end

@implementation AMSUserNotificationAuthorizationResult

- (AMSUserNotificationAuthorizationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUserNotificationAuthorizationResult;
  v5 = [(AMSUserNotificationAuthorizationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyRequest"];
    request = v5->_request;
    v5->_request = (AMSEngagementRequest *)v6;

    v5->_authorizationStatus = [v4 decodeIntegerForKey:@"kCodingKeyAuthorizationStatus"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(AMSUserNotificationAuthorizationResult *)self request];
  [v5 encodeObject:v4 forKey:@"kCodingKeyRequest"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[AMSUserNotificationAuthorizationResult authorizationStatus](self, "authorizationStatus"), @"kCodingKeyAuthorizationStatus");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (AMSEngagementRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end