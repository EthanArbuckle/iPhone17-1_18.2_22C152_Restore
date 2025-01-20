@interface LACustomPasswordRequirement
+ (void)requestCreationWithLocalizedReason:(id)a3 completion:(id)a4;
- (LACustomPasswordRequirement)initWithCustomPassword:(id)a3;
- (void)encodeWithACLCoder:(id)a3;
@end

@implementation LACustomPasswordRequirement

- (LACustomPasswordRequirement)initWithCustomPassword:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACustomPasswordRequirement;
  v6 = [(LACustomPasswordRequirement *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_password, a3);
  }

  return v7;
}

+ (void)requestCreationWithLocalizedReason:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[LAAuthorizationError missingImplementation];
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)encodeWithACLCoder:(id)a3
{
  password = self->_password;
  id v4 = a3;
  id v5 = [(NSString *)password dataUsingEncoding:4];
  [v4 addCredential:v5 credentialType:0];
}

- (void).cxx_destruct
{
}

@end