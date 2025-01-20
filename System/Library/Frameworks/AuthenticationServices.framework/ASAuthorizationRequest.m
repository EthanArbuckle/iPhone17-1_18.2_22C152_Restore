@interface ASAuthorizationRequest
+ (ASAuthorizationRequest)new;
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationRequest)init;
- (ASAuthorizationRequest)initWithProvider:(id)a3;
- (BOOL)supportsStyle:(int64_t)a3;
- (id)provider;
@end

@implementation ASAuthorizationRequest

+ (ASAuthorizationRequest)new
{
  return 0;
}

- (ASAuthorizationRequest)init
{
  return 0;
}

- (ASAuthorizationRequest)initWithProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASAuthorizationRequest;
  v6 = [(ASAuthorizationRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_provider, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return a3 == 0;
}

- (id)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
}

@end