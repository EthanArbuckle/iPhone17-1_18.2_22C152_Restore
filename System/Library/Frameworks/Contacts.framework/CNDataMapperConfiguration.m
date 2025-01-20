@interface CNDataMapperConfiguration
- (BOOL)isContactProvider;
- (CNAuthorizationContext)authorizationContext;
- (CNContactProviderSupportManager)contactProviderManager;
- (CNContactsEnvironment)environment;
- (CNDataMapperConfiguration)initWithContactStoreConfiguration:(id)a3;
- (CNManagedConfiguration)managedConfiguration;
- (OS_tcc_identity)assumedIdentity;
- (id)description;
- (int64_t)identifierAuditMode;
- (void)setAssumedIdentity:(id)a3;
- (void)setAuthorizationContext:(id)a3;
- (void)setContactProviderManager:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setIdentifierAuditMode:(int64_t)a3;
- (void)setIsContactProvider:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
@end

@implementation CNDataMapperConfiguration

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (BOOL)isContactProvider
{
  return self->_isContactProvider;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (int64_t)identifierAuditMode
{
  return self->_identifierAuditMode;
}

- (CNAuthorizationContext)authorizationContext
{
  return self->_authorizationContext;
}

- (CNDataMapperConfiguration)initWithContactStoreConfiguration:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNDataMapperConfiguration;
  v5 = [(CNDataMapperConfiguration *)&v11 init];
  if (v5)
  {
    v6 = [v4 environment];
    [(CNDataMapperConfiguration *)v5 setEnvironment:v6];

    v7 = [v4 managedConfiguration];
    [(CNDataMapperConfiguration *)v5 setManagedConfiguration:v7];

    v8 = [v4 assumedIdentity];
    [(CNDataMapperConfiguration *)v5 setAssumedIdentity:v8];

    -[CNDataMapperConfiguration setIsContactProvider:](v5, "setIsContactProvider:", [v4 isContactProvider]);
    v9 = v5;
  }

  return v5;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setEnvironment:(id)a3
{
}

- (void)setIsContactProvider:(BOOL)a3
{
  self->_isContactProvider = a3;
}

- (void)setAssumedIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactProviderManager, 0);
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_assumedIdentity, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)setIdentifierAuditMode:(int64_t)a3
{
  self->_identifierAuditMode = a3;
}

- (CNContactProviderSupportManager)contactProviderManager
{
  return self->_contactProviderManager;
}

- (void)setContactProviderManager:(id)a3
{
}

- (void)setAuthorizationContext:(id)a3
{
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_environment withName:@"environment"];
  id v5 = (id)[v3 appendObject:self->_managedConfiguration withName:@"managedConfiguration"];
  id v6 = (id)[v3 appendObject:self->_assumedIdentity withName:@"assumedIdentity"];
  id v7 = (id)[v3 appendName:@"identifierAuditMode" unsignedInteger:self->_identifierAuditMode];
  id v8 = (id)[v3 appendObject:self->_authorizationContext withName:@"authorizationContext"];
  id v9 = (id)[v3 appendName:@"isContactProvider" BOOLValue:self->_isContactProvider];
  id v10 = (id)[v3 appendObject:self->_contactProviderManager withName:@"contactProviderManager"];
  objc_super v11 = [v3 build];

  return v11;
}

@end