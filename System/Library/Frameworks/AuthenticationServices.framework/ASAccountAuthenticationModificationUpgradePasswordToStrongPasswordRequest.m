@interface ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest
- (ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest)initWithUser:(NSString *)user serviceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier userInfo:(NSDictionary *)userInfo;
- (ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest)initWithUser:(id)a3 password:(id)a4 extension:(id)a5 serviceIdentifier:(id)a6 userInfo:(id)a7;
- (ASCredentialServiceIdentifier)serviceIdentifier;
- (NSDictionary)userInfo;
- (NSExtension)extension;
- (NSString)password;
- (NSString)user;
@end

@implementation ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest

- (ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest)initWithUser:(NSString *)user serviceIdentifier:(ASCredentialServiceIdentifier *)serviceIdentifier userInfo:(NSDictionary *)userInfo
{
  v8 = user;
  v9 = serviceIdentifier;
  v10 = userInfo;
  v18.receiver = self;
  v18.super_class = (Class)ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest;
  v11 = [(ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [(NSString *)v8 copy];
    v13 = v11->_user;
    v11->_user = (NSString *)v12;

    objc_storeStrong((id *)&v11->_serviceIdentifier, serviceIdentifier);
    uint64_t v14 = [(NSDictionary *)v10 copy];
    v15 = v11->_userInfo;
    v11->_userInfo = (NSDictionary *)v14;

    v16 = v11;
  }

  return v11;
}

- (ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest)initWithUser:(id)a3 password:(id)a4 extension:(id)a5 serviceIdentifier:(id)a6 userInfo:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest;
  v17 = [(ASAccountAuthenticationModificationUpgradePasswordToStrongPasswordRequest *)&v26 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    user = v17->_user;
    v17->_user = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    password = v17->_password;
    v17->_password = (NSString *)v20;

    objc_storeStrong((id *)&v17->_extension, a5);
    objc_storeStrong((id *)&v17->_serviceIdentifier, a6);
    uint64_t v22 = [v16 copy];
    userInfo = v17->_userInfo;
    v17->_userInfo = (NSDictionary *)v22;

    v24 = v17;
  }

  return v17;
}

- (NSString)user
{
  return self->_user;
}

- (ASCredentialServiceIdentifier)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)password
{
  return self->_password;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);

  objc_storeStrong((id *)&self->_user, 0);
}

@end