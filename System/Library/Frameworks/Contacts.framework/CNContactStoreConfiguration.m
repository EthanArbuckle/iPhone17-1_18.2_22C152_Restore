@interface CNContactStoreConfiguration
- (BOOL)includeDonatedContacts;
- (BOOL)includeIncludeManagedAppleIDs;
- (BOOL)includeLocalContacts;
- (BOOL)includeSharedPhotoContacts;
- (BOOL)includeSuggestedContacts;
- (BOOL)isContactProvider;
- (BOOL)leaveSingleStoresUnwrapped;
- (BOOL)useInProcessMapperExclusively;
- (BOOL)useOutOfProcessMapperExclusively;
- (CNContactStoreConfiguration)init;
- (CNContactsEnvironment)environment;
- (CNManagedConfiguration)managedConfiguration;
- (OS_tcc_identity)assumedIdentity;
- (id)description;
- (void)setAssumedIdentity:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setIncludeDonatedContacts:(BOOL)a3;
- (void)setIncludeIncludeManagedAppleIDs:(BOOL)a3;
- (void)setIncludeLocalContacts:(BOOL)a3;
- (void)setIncludeSharedPhotoContacts:(BOOL)a3;
- (void)setIncludeSuggestedContacts:(BOOL)a3;
- (void)setIsContactProvider:(BOOL)a3;
- (void)setLeaveSingleStoresUnwrapped:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setUseInProcessMapperExclusively:(BOOL)a3;
- (void)setUseOutOfProcessMapperExclusively:(BOOL)a3;
@end

@implementation CNContactStoreConfiguration

- (CNContactStoreConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactStoreConfiguration;
  v2 = [(CNContactStoreConfiguration *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[CNContactsEnvironment currentEnvironment];
    environment = v2->_environment;
    v2->_environment = (CNContactsEnvironment *)v3;

    v2->_includeLocalContacts = 1;
    v2->_includeSharedPhotoContacts = 1;
    v5 = v2;
  }

  return v2;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (CNManagedConfiguration)managedConfiguration
{
  return self->_managedConfiguration;
}

- (BOOL)isContactProvider
{
  return self->_isContactProvider;
}

- (OS_tcc_identity)assumedIdentity
{
  return self->_assumedIdentity;
}

- (BOOL)includeSuggestedContacts
{
  return self->_includeSuggestedContacts;
}

- (BOOL)includeLocalContacts
{
  return self->_includeLocalContacts;
}

- (BOOL)includeIncludeManagedAppleIDs
{
  return self->_includeIncludeManagedAppleIDs;
}

- (BOOL)includeDonatedContacts
{
  return self->_includeDonatedContacts;
}

- (BOOL)includeSharedPhotoContacts
{
  return self->_includeSharedPhotoContacts;
}

- (BOOL)useOutOfProcessMapperExclusively
{
  return self->_useOutOfProcessMapperExclusively;
}

- (BOOL)useInProcessMapperExclusively
{
  return self->_useInProcessMapperExclusively;
}

- (BOOL)leaveSingleStoresUnwrapped
{
  return self->_leaveSingleStoresUnwrapped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);

  objc_storeStrong((id *)&self->_assumedIdentity, 0);
}

- (void)setEnvironment:(id)a3
{
}

- (void)setIncludeLocalContacts:(BOOL)a3
{
  self->_includeLocalContacts = a3;
}

- (void)setUseInProcessMapperExclusively:(BOOL)a3
{
  self->_useInProcessMapperExclusively = a3;
}

- (void)setIncludeSuggestedContacts:(BOOL)a3
{
  self->_includeSuggestedContacts = a3;
}

- (void)setIncludeDonatedContacts:(BOOL)a3
{
  self->_includeDonatedContacts = a3;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (void)setIncludeIncludeManagedAppleIDs:(BOOL)a3
{
  self->_includeIncludeManagedAppleIDs = a3;
}

- (void)setAssumedIdentity:(id)a3
{
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"includeLocalContacts" BOOLValue:self->_includeLocalContacts];
  id v5 = (id)[v3 appendName:@"includeSuggestedContacts" BOOLValue:self->_includeSuggestedContacts];
  id v6 = (id)[v3 appendName:@"includeDonatedContacts" BOOLValue:self->_includeDonatedContacts];
  id v7 = (id)[v3 appendName:@"includeIncludeManagedAppleIDs" BOOLValue:self->_includeIncludeManagedAppleIDs];
  id v8 = (id)[v3 appendName:@"includeSharedPhotoContacts" BOOLValue:self->_includeSharedPhotoContacts];
  id v9 = (id)[v3 appendName:@"useOutOfProcessMapperExclusively" BOOLValue:self->_useOutOfProcessMapperExclusively];
  id v10 = (id)[v3 appendName:@"useInProcessMapperExclusively" BOOLValue:self->_useInProcessMapperExclusively];
  id v11 = (id)[v3 appendObject:self->_assumedIdentity withName:@"assumedIdentity"];
  id v12 = (id)[v3 appendObject:self->_environment withName:@"environment"];
  id v13 = (id)[v3 appendObject:self->_managedConfiguration withName:@"managedConfiguration"];
  id v14 = (id)[v3 appendName:@"isContactProvider" BOOLValue:self->_isContactProvider];
  v15 = [v3 build];

  return v15;
}

- (void)setIncludeSharedPhotoContacts:(BOOL)a3
{
  self->_includeSharedPhotoContacts = a3;
}

- (void)setUseOutOfProcessMapperExclusively:(BOOL)a3
{
  self->_useOutOfProcessMapperExclusively = a3;
}

- (void)setIsContactProvider:(BOOL)a3
{
  self->_isContactProvider = a3;
}

- (void)setLeaveSingleStoresUnwrapped:(BOOL)a3
{
  self->_leaveSingleStoresUnwrapped = a3;
}

@end