@interface AMSDelegateAuthenticateRequest
+ (BOOL)supportsSecureCoding;
+ (id)preferredUserAgent;
- (AMSDelegateAuthenticateRequest)initWithChallenge:(id)a3 userAgent:(id)a4;
- (AMSDelegateAuthenticateRequest)initWithCoder:(id)a3;
- (NSString)challenge;
- (NSString)userAgent;
- (void)encodeWithCoder:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation AMSDelegateAuthenticateRequest

- (AMSDelegateAuthenticateRequest)initWithChallenge:(id)a3 userAgent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AMSDelegateAuthenticateRequest;
  v8 = [(AMSDelegateAuthenticateRequest *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    challenge = v8->_challenge;
    v8->_challenge = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    userAgent = v8->_userAgent;
    v8->_userAgent = (NSString *)v11;
  }
  return v8;
}

+ (id)preferredUserAgent
{
  v2 = +[AMSProcessInfo currentProcess];
  v3 = +[AMSUserAgent userAgentForProcessInfo:v2];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  challenge = self->_challenge;
  id v5 = a3;
  [v5 encodeObject:challenge forKey:@"ch"];
  [v5 encodeObject:self->_userAgent forKey:@"ua"];
}

- (AMSDelegateAuthenticateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ch"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ua"];

  id v7 = [(AMSDelegateAuthenticateRequest *)self initWithChallenge:v5 userAgent:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end