@interface AKCircleRequestContext
+ (BOOL)supportsSecureCoding;
- (AKAppleIDAuthenticationContext)authContext;
- (AKCircleRequestContext)init;
- (AKCircleRequestContext)initWithCoder:(id)a3;
- (AKCircleRequestPayload)payload;
- (BOOL)_notifyOfTimeout;
- (BOOL)waitForReply;
- (NSString)heartbeatTokenValue;
- (NSString)identityTokenValue;
- (NSString)pushToken;
- (double)waitForReplyTimeout;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setHeartbeatTokenValue:(id)a3;
- (void)setIdentityTokenValue:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setWaitForReply:(BOOL)a3;
- (void)setWaitForReplyTimeout:(double)a3;
- (void)set_notifyOfTimeout:(BOOL)a3;
@end

@implementation AKCircleRequestContext

- (AKCircleRequestContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKCircleRequestContext;
  result = [(AKCircleRequestContext *)&v3 init];
  if (result) {
    *(_WORD *)&result->_waitForReply = 257;
  }
  return result;
}

- (AKCircleRequestContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKCircleRequestContext;
  v5 = [(AKCircleRequestContext *)&v18 init];
  if (v5)
  {
    v5->_waitForReply = [v4 decodeBoolForKey:@"_waitForReply"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identityTokenValue"];
    identityTokenValue = v5->_identityTokenValue;
    v5->_identityTokenValue = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_heartbeatTokenValue"];
    heartbeatTokenValue = v5->_heartbeatTokenValue;
    v5->_heartbeatTokenValue = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_payload"];
    payload = v5->_payload;
    v5->_payload = (AKCircleRequestPayload *)v12;

    [v4 decodeDoubleForKey:@"_waitForReplyTimeout"];
    v5->_waitForReplyTimeout = v14;
    v5->__notifyOfTimeout = [v4 decodeBoolForKey:@"__notifyOfTimeout"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_authContext"];
    authContext = v5->_authContext;
    v5->_authContext = (AKAppleIDAuthenticationContext *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL waitForReply = self->_waitForReply;
  id v5 = a3;
  [v5 encodeBool:waitForReply forKey:@"_waitForReply"];
  [v5 encodeObject:self->_identityTokenValue forKey:@"_identityTokenValue"];
  [v5 encodeObject:self->_heartbeatTokenValue forKey:@"_heartbeatTokenValue"];
  [v5 encodeObject:self->_pushToken forKey:@"_pushToken"];
  [v5 encodeObject:self->_payload forKey:@"_payload"];
  [v5 encodeDouble:@"_waitForReplyTimeout" forKey:self->_waitForReplyTimeout];
  [v5 encodeBool:self->__notifyOfTimeout forKey:@"__notifyOfTimeout"];
  [v5 encodeObject:self->_authContext forKey:@"_authContext"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKCircleRequestPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (BOOL)waitForReply
{
  return self->_waitForReply;
}

- (void)setWaitForReply:(BOOL)a3
{
  self->_BOOL waitForReply = a3;
}

- (double)waitForReplyTimeout
{
  return self->_waitForReplyTimeout;
}

- (void)setWaitForReplyTimeout:(double)a3
{
  self->_waitForReplyTimeout = a3;
}

- (NSString)identityTokenValue
{
  return self->_identityTokenValue;
}

- (void)setIdentityTokenValue:(id)a3
{
}

- (NSString)heartbeatTokenValue
{
  return self->_heartbeatTokenValue;
}

- (void)setHeartbeatTokenValue:(id)a3
{
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (BOOL)_notifyOfTimeout
{
  return self->__notifyOfTimeout;
}

- (void)set_notifyOfTimeout:(BOOL)a3
{
  self->__notifyOfTimeout = a3;
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_heartbeatTokenValue, 0);
  objc_storeStrong((id *)&self->_identityTokenValue, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end