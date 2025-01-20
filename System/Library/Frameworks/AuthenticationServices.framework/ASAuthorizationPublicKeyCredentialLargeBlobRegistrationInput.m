@interface ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)initWithCoder:(id)a3;
- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)initWithSupportRequirement:(ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)requirement;
- (ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)supportRequirement;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportRequirement:(ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)supportRequirement;
@end

@implementation ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)initWithSupportRequirement:(ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)requirement
{
  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput;
  v4 = [(ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_supportRequirement = requirement;
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
  v4 = +[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput allocWithZone:a3];
  int64_t supportRequirement = self->_supportRequirement;

  return [(ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)v4 initWithSupportRequirement:supportRequirement];
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"supportRequirementKey"];

  return [(ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)self initWithSupportRequirement:v4];
}

- (ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)supportRequirement
{
  return self->_supportRequirement;
}

- (void)setSupportRequirement:(ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)supportRequirement
{
  self->_int64_t supportRequirement = supportRequirement;
}

@end