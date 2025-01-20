@interface ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput
+ (BOOL)supportsSecureCoding;
+ (id)_outputWithIsSupported:(BOOL)a3;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)initWithCoder:(id)a3;
- (BOOL)isSupported;
- (id)_initWithIsSupported:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput

+ (id)_outputWithIsSupported:(BOOL)a3
{
  v3 = (void *)[objc_alloc((Class)a1) _initWithIsSupported:a3];

  return v3;
}

- (id)_initWithIsSupported:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput;
  v4 = [(ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_isSupported = a3;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput allocWithZone:a3];
  BOOL isSupported = self->_isSupported;

  return [(ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)v4 _initWithIsSupported:isSupported];
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"isSupported"];

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)[(ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput *)self _initWithIsSupported:v4];
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

@end