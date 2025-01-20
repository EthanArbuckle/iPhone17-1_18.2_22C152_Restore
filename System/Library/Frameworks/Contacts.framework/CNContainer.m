@interface CNContainer
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)predicateForContainerOfContactWithIdentifier:(NSString *)contactIdentifier;
+ (NSPredicate)predicateForContainerOfGroupWithIdentifier:(NSString *)groupIdentifier;
+ (NSPredicate)predicateForContainersWithIdentifiers:(NSArray *)identifiers;
+ (id)descriptionForContainerType:(int64_t)a3;
+ (id)identifierProvider;
+ (id)makeDefaultContainerPermissions;
+ (id)makeIdentifierString;
+ (id)predicateForContainerWithExternalIdentifier:(id)a3;
+ (id)predicateForContainerWithProviderIdentifier:(id)a3;
+ (id)predicateForContainersInAccountWithExternalIdentifier:(id)a3;
+ (id)predicateForContainersInAccountWithIdentifier:(id)a3;
+ (id)predicateForContainersInAccountWithIdentifier:(id)a3 includingDisabledContainers:(BOOL)a4;
+ (id)predicateForContainersIncludingDisabled:(BOOL)a3;
+ (id)predicateForContainersWithType:(int64_t)a3;
+ (id)predicateForContainersWithType:(int64_t)a3 includingDisabledContainers:(BOOL)a4;
+ (id)predicateForDefaultContainerForAccountWithIdentifier:(id)a3;
+ (id)predicateForLocalContainerIncludingDisabled:(BOOL)a3;
+ (id)predicateForiOSLegacyIdentifier:(int)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGuardianRestricted;
- (BOOL)isGuardianStateDirty;
- (CNContainer)init;
- (CNContainer)initWithCoder:(id)a3;
- (CNContainer)initWithContainer:(id)a3;
- (CNContainer)initWithIdentifier:(id)a3 accountIdentifier:(id)a4 name:(id)a5 type:(int64_t)a6 permissions:(id)a7 externalIdentifier:(id)a8;
- (CNContainer)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5;
- (CNContainer)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 iOSLegacyIdentifier:(int)a6 accountIdentifier:(id)a7 enabled:(BOOL)a8 permissions:(id)a9 externalIdentifier:(id)a10 externalModificationTag:(id)a11 externalSyncTag:(id)a12 externalSyncData:(id)a13 constraintsPath:(id)a14 meIdentifier:(id)a15 restrictions:(unint64_t)a16 guardianRestricted:(BOOL)a17 lastSyncDate:(id)a18 providerIdentifier:(id)a19 providerMetadata:(id)a20;
- (CNContainer)initWithName:(id)a3;
- (CNContainer)initWithName:(id)a3 type:(int64_t)a4;
- (CNContainer)initWithName:(id)a3 type:(int64_t)a4 externalIdentifier:(id)a5;
- (CNContainer)snapshot;
- (CNContainerPermissions)permissions;
- (CNContainerType)type;
- (CNProviderMetadata)providerMetadata;
- (NSData)externalSyncData;
- (NSDate)lastSyncDate;
- (NSString)accountIdentifier;
- (NSString)constraintsPath;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)externalSyncTag;
- (NSString)identifier;
- (NSString)meIdentifier;
- (NSString)name;
- (NSString)providerIdentifier;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)iOSLegacyIdentifier;
- (unint64_t)hash;
- (unint64_t)restrictions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContainer

+ (NSPredicate)predicateForContainersWithIdentifiers:(NSArray *)identifiers
{
  v3 = identifiers;
  v4 = [[CNiOSABContainerIdentifiersPredicate alloc] initWithIdentifiers:v3];

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContainerOfContactWithIdentifier:(NSString *)contactIdentifier
{
  v3 = contactIdentifier;
  v4 = [[CNiOSABContainerOfContactPredicate alloc] initWithContactIdentifier:v3];

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContainerOfGroupWithIdentifier:(NSString *)groupIdentifier
{
  v3 = groupIdentifier;
  v4 = [[CNiOSABContainerOfGroupPredicate alloc] initWithGroupIdentifier:v3];

  return (NSPredicate *)v4;
}

+ (id)predicateForContainersInAccountWithIdentifier:(id)a3 includingDisabledContainers:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[CNiOSABContainersForAccountPredicate alloc] initWithAccountIdentifier:v5 includingDisabledContainers:v4];

  return v6;
}

+ (id)predicateForContainersInAccountWithIdentifier:(id)a3
{
  return (id)[a1 predicateForContainersInAccountWithIdentifier:a3 includingDisabledContainers:0];
}

+ (id)predicateForContainersInAccountWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CNiOSABContainersForAccountExternalIdentifierPredicate alloc] initWithAccountExternalIdentifier:v3];

  return v4;
}

+ (id)predicateForDefaultContainerForAccountWithIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CNiOSABDefaultContainerForAccountPredicate alloc] initWithAccountIdentifier:v3];

  return v4;
}

+ (id)predicateForContainersWithType:(int64_t)a3
{
  return (id)[a1 predicateForContainersWithType:a3 includingDisabledContainers:0];
}

+ (id)predicateForContainersWithType:(int64_t)a3 includingDisabledContainers:(BOOL)a4
{
  BOOL v4 = [[CNiOSABContainersForTypePredicate alloc] initWithType:a3 includingDisabledContainers:a4];

  return v4;
}

+ (id)predicateForContainerWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CNiOSABContainerExternalIdentifierPredicate alloc] initWithExternalIdentifier:v3];

  return v4;
}

+ (id)predicateForContainerWithProviderIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CNiOSABContainerProviderIdentifierPredicate alloc] initWithProviderIdentifier:v3];

  return v4;
}

+ (id)predicateForContainersIncludingDisabled:(BOOL)a3
{
  id v3 = [[CNiOSABDisabledContainersPredicate alloc] initWithDisabledContainersIncluded:a3];

  return v3;
}

+ (id)predicateForLocalContainerIncludingDisabled:(BOOL)a3
{
  id v3 = [[CNiOSABLocalContainerPredicate alloc] initWithDisabledContainerIncluded:a3];

  return v3;
}

+ (id)predicateForiOSLegacyIdentifier:(int)a3
{
  id v3 = [[CNiOSABContaineriOSLegacyIdentifierPredicate alloc] initWithiOSLegacyIdentifier:*(void *)&a3];

  return v3;
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_0_1 != -1) {
    dispatch_once(&identifierProvider_cn_once_token_0_1, &__block_literal_global_72);
  }
  v2 = (void *)identifierProvider_cn_once_object_0_1;

  return v2;
}

uint64_t __33__CNContainer_identifierProvider__block_invoke()
{
  identifierProvider_cn_once_object_0_1 = [[CNUuidIdentifierProvider alloc] initWithSuffix:@"ABContainer"];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeIdentifierString
{
  v2 = [a1 identifierProvider];
  id v3 = [v2 makeIdentifier];

  return v3;
}

+ (id)makeDefaultContainerPermissions
{
  if (makeDefaultContainerPermissions_cn_once_token_1 != -1) {
    dispatch_once(&makeDefaultContainerPermissions_cn_once_token_1, &__block_literal_global_3_0);
  }
  v2 = (void *)makeDefaultContainerPermissions_cn_once_object_1;

  return v2;
}

uint64_t __46__CNContainer_makeDefaultContainerPermissions__block_invoke()
{
  makeDefaultContainerPermissions_cn_once_object_1 = [[CNContainerPermissions alloc] initWithCanCreateContacts:0 canDeleteContacts:0 canCreateGroups:0];

  return MEMORY[0x1F41817F8]();
}

- (CNContainer)init
{
  id v3 = [(id)objc_opt_class() makeIdentifier];
  BOOL v4 = [(id)objc_opt_class() makeDefaultContainerPermissions];
  id v5 = [(CNContainer *)self initWithIdentifier:v3 accountIdentifier:0 name:&stru_1EE052B80 type:0 permissions:v4 externalIdentifier:0];

  return v5;
}

- (CNContainer)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() makeIdentifier];
  v6 = [(id)objc_opt_class() makeDefaultContainerPermissions];
  v7 = [(CNContainer *)self initWithIdentifier:v5 accountIdentifier:0 name:v4 type:0 permissions:v6 externalIdentifier:0];

  return v7;
}

- (CNContainer)initWithName:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() makeIdentifier];
  v8 = [(id)objc_opt_class() makeDefaultContainerPermissions];
  v9 = [(CNContainer *)self initWithIdentifier:v7 accountIdentifier:0 name:v6 type:a4 permissions:v8 externalIdentifier:0];

  return v9;
}

- (CNContainer)initWithName:(id)a3 type:(int64_t)a4 externalIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() makeIdentifier];
  v11 = [(id)objc_opt_class() makeDefaultContainerPermissions];
  v12 = [(CNContainer *)self initWithIdentifier:v10 accountIdentifier:0 name:v9 type:a4 permissions:v11 externalIdentifier:v8];

  return v12;
}

- (CNContainer)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(id)objc_opt_class() makeDefaultContainerPermissions];
  v11 = [(CNContainer *)self initWithIdentifier:v9 accountIdentifier:0 name:v8 type:a5 permissions:v10 externalIdentifier:0];

  return v11;
}

- (CNContainer)initWithIdentifier:(id)a3 accountIdentifier:(id)a4 name:(id)a5 type:(int64_t)a6 permissions:(id)a7 externalIdentifier:(id)a8
{
  LOBYTE(v9) = 0;
  return -[CNContainer initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:](self, "initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:", a3, a5, a6, 0xFFFFFFFFLL, a4, 1, a7, a8, 0, 0, 0, 0, 0, 0, v9,
           0,
           0,
           0);
}

- (CNContainer)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 iOSLegacyIdentifier:(int)a6 accountIdentifier:(id)a7 enabled:(BOOL)a8 permissions:(id)a9 externalIdentifier:(id)a10 externalModificationTag:(id)a11 externalSyncTag:(id)a12 externalSyncData:(id)a13 constraintsPath:(id)a14 meIdentifier:(id)a15 restrictions:(unint64_t)a16 guardianRestricted:(BOOL)a17 lastSyncDate:(id)a18 providerIdentifier:(id)a19 providerMetadata:(id)a20
{
  id v22 = a3;
  id v23 = a4;
  id v24 = a7;
  id v69 = a9;
  id v68 = a10;
  id v67 = a11;
  v25 = v24;
  id v66 = a12;
  id v26 = a13;
  id v27 = a14;
  v28 = v23;
  id v29 = a15;
  id v30 = a18;
  id v31 = a19;
  id v32 = a20;
  v70.receiver = self;
  v70.super_class = (Class)CNContainer;
  v33 = [(CNContainer *)&v70 init];
  if (v33)
  {
    uint64_t v34 = [v22 copy];
    identifier = v33->_identifier;
    v33->_identifier = (NSString *)v34;

    uint64_t v36 = [v28 copy];
    name = v33->_name;
    v33->_name = (NSString *)v36;

    v33->_type = a5;
    v33->_iOSLegacyIdentifier = a6;
    v33->_enabled = a8;
    uint64_t v38 = [v25 copy];
    accountIdentifier = v33->_accountIdentifier;
    v33->_accountIdentifier = (NSString *)v38;

    uint64_t v40 = [v69 copy];
    permissions = v33->_permissions;
    v33->_permissions = (CNContainerPermissions *)v40;

    uint64_t v42 = [v68 copy];
    externalIdentifier = v33->_externalIdentifier;
    v33->_externalIdentifier = (NSString *)v42;

    uint64_t v44 = [v67 copy];
    externalModificationTag = v33->_externalModificationTag;
    v33->_externalModificationTag = (NSString *)v44;

    uint64_t v46 = [v66 copy];
    externalSyncTag = v33->_externalSyncTag;
    v33->_externalSyncTag = (NSString *)v46;

    uint64_t v48 = [v26 copy];
    externalSyncData = v33->_externalSyncData;
    v33->_externalSyncData = (NSData *)v48;

    uint64_t v50 = [v27 copy];
    constraintsPath = v33->_constraintsPath;
    v33->_constraintsPath = (NSString *)v50;

    uint64_t v52 = [v29 copy];
    meIdentifier = v33->_meIdentifier;
    v33->_meIdentifier = (NSString *)v52;

    v33->_restrictions = a16;
    v33->_guardianRestricted = a17;
    uint64_t v54 = [v30 copy];
    lastSyncDate = v33->_lastSyncDate;
    v33->_lastSyncDate = (NSDate *)v54;

    uint64_t v56 = [v31 copy];
    providerIdentifier = v33->_providerIdentifier;
    v33->_providerIdentifier = (NSString *)v56;

    uint64_t v58 = [v32 copy];
    providerMetadata = v33->_providerMetadata;
    v33->_providerMetadata = (CNProviderMetadata *)v58;

    v60 = v33;
  }

  return v33;
}

- (CNContainer)initWithContainer:(id)a3
{
  id v3 = a3;
  id v22 = [v3 identifier];
  v21 = [v3 name];
  uint64_t v20 = [v3 type];
  unsigned int v19 = [v3 iOSLegacyIdentifier];
  v18 = [v3 accountIdentifier];
  unsigned int v17 = [v3 isEnabled];
  v25 = [v3 permissions];
  v16 = [v3 externalIdentifier];
  v14 = [v3 externalModificationTag];
  v15 = [v3 externalSyncTag];
  v13 = [v3 externalSyncData];
  id v4 = [v3 constraintsPath];
  id v5 = [v3 meIdentifier];
  uint64_t v6 = [v3 restrictions];
  char v7 = [v3 isGuardianRestricted];
  id v8 = [v3 lastSyncDate];
  uint64_t v9 = [v3 providerIdentifier];
  v10 = [v3 providerMetadata];

  LOBYTE(v12) = v7;
  id v24 = -[CNContainer initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:](self, "initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:", v22, v21, v20, v19, v18, v17, v25, v16, v14, v15, v13, v4, v5, v6, v12,
          v8,
          v9,
          v10);

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  [v3 decodeIntegerForKey:@"type"];
  [v3 decodeInt32ForKey:@"iOSLegacyIdentifier"];
  id v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
  [v3 decodeBoolForKey:@"enabled"];
  id v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"permissions"];
  v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
  uint64_t v36 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"externalModificationTag"];
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"externalSyncTag"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"externalSyncData"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"constraintsPath"];
  char v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"meIdentifier"];
  id v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"restrictions"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  char v10 = [v3 decodeBoolForKey:@"guardianRestricted"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"lastSyncDate"];
  uint64_t v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"providerIdentifier"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"providerMetadata"];
  id v29 = (void *)v11;
  uint64_t v28 = v11;
  LOBYTE(v27) = v10;
  v33 = (void *)v4;
  uint64_t v26 = v4;
  v14 = (void *)v34;
  v15 = (void *)v32;
  v16 = -[CNContainer initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:](self, "initWithIdentifier:name:type:iOSLegacyIdentifier:accountIdentifier:enabled:permissions:externalIdentifier:externalModificationTag:externalSyncTag:externalSyncData:constraintsPath:meIdentifier:restrictions:guardianRestricted:lastSyncDate:providerIdentifier:providerMetadata:", v30, v37, v36, v26, v5, v6, v7, v9, v27, v28, v12, v13);
  if (v16)
  {
    unsigned int v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = v18;
    v14 = (void *)v34;
    v15 = (void *)v32;
    v21 = objc_msgSend(v17, "setWithObjects:", v20, v19, 0);
    uint64_t v22 = [v3 decodeObjectOfClasses:v21 forKey:@"snapshot"];
    snapshot = v16->_snapshot;
    v16->_snapshot = (CNContainer *)v22;

    id v24 = v16;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [v6 encodeObject:self->_name forKey:@"name"];
  [v6 encodeInteger:self->_type forKey:@"type"];
  [v6 encodeInt32:self->_iOSLegacyIdentifier forKey:@"iOSLegacyIdentifier"];
  [v6 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v6 encodeBool:self->_enabled forKey:@"enabled"];
  [v6 encodeObject:self->_permissions forKey:@"permissions"];
  [v6 encodeObject:self->_externalIdentifier forKey:@"externalIdentifier"];
  [v6 encodeObject:self->_externalModificationTag forKey:@"externalModificationTag"];
  [v6 encodeObject:self->_externalSyncTag forKey:@"externalSyncTag"];
  [v6 encodeObject:self->_externalSyncData forKey:@"externalSyncData"];
  [v6 encodeObject:self->_constraintsPath forKey:@"constraintsPath"];
  [v6 encodeObject:self->_meIdentifier forKey:@"meIdentifier"];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_restrictions];
  [v6 encodeObject:v5 forKey:@"restrictions"];

  [v6 encodeObject:self->_snapshot forKey:@"snapshot"];
  [v6 encodeBool:self->_guardianRestricted forKey:@"guardianRestricted"];
  [v6 encodeObject:self->_lastSyncDate forKey:@"lastSyncDate"];
  [v6 encodeObject:self->_providerIdentifier forKey:@"providerIdentifier"];
  [v6 encodeObject:self->_providerMetadata forKey:@"providerMetadata"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(CNContainer *)[CNMutableContainer alloc] initWithContainer:self];
  snapshot = self->_snapshot;
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (snapshot == v6) {
    [(CNMutableContainer *)v4 setSnapshot:self];
  }
  return v4;
}

- (CNContainer)snapshot
{
  id v3 = self->_snapshot;
  uint64_t v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4)
  {
    id v5 = self;

    id v3 = v5;
  }

  return v3;
}

+ (id)descriptionForContainerType:(int64_t)a3
{
  if (a3 <= 999)
  {
    switch(a3)
    {
      case 1:
        return @"Local";
      case 2:
        return @"Exchange";
      case 3:
        return @"CardDAV";
      default:
        return @"<unknown container type>";
    }
  }
  else
  {
    switch(a3)
    {
      case 1000:
        id result = @"CardDAVSearch";
        break;
      case 1001:
        id result = @"ExchangeGAL";
        break;
      case 1002:
        id result = @"LDAP";
        break;
      case 1003:
        id result = @"ContactProvider";
        break;
      default:
        return @"<unknown container type>";
    }
  }
  return result;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  uint64_t v4 = NSString;
  int64_t type = self->_type;
  id v6 = [(id)objc_opt_class() descriptionForContainerType:type];
  char v7 = [v4 stringWithFormat:@"%ld(%@)", type, v6];

  id v8 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v9 = (id)[v3 appendObject:self->_name withName:@"name"];
  id v10 = (id)[v3 appendObject:v7 withName:@"type"];
  uint64_t v11 = [NSNumber numberWithInt:self->_iOSLegacyIdentifier];
  id v12 = (id)[v3 appendObject:v11 withName:@"iOSLegacyIdentifier"];

  id v13 = (id)[v3 appendObject:self->_accountIdentifier withName:@"accountIdentifier"];
  v14 = [NSNumber numberWithBool:self->_enabled];
  id v15 = (id)[v3 appendObject:v14 withName:@"enabled"];

  id v16 = (id)[v3 appendObject:self->_externalIdentifier withName:@"externalIdentifier"];
  id v17 = (id)[v3 appendObject:self->_externalModificationTag withName:@"externalModificationTag"];
  id v18 = (id)[v3 appendObject:self->_externalSyncTag withName:@"externalSyncTag"];
  id v19 = (id)[v3 appendObject:self->_externalSyncData withName:@"externalSyncData"];
  id v20 = (id)[v3 appendObject:self->_constraintsPath withName:@"constraintsPath"];
  id v21 = (id)[v3 appendObject:self->_meIdentifier withName:@"meIdentifier"];
  uint64_t v22 = [NSNumber numberWithUnsignedInteger:self->_restrictions];
  id v23 = (id)[v3 appendObject:v22 withName:@"restrictions"];

  id v24 = [NSNumber numberWithBool:self->_guardianRestricted];
  id v25 = (id)[v3 appendObject:v24 withName:@"guardianRestricted"];

  id v26 = (id)[v3 appendObject:self->_lastSyncDate withName:@"lastSyncDate"];
  id v27 = (id)[v3 appendObject:self->_providerIdentifier withName:@"providerIdentifier"];
  uint64_t v28 = [v3 build];

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CNContainer *)a3;
  if (self == v4) {
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_35;
  }
  unint64_t v5 = (unint64_t)[(CNContainer *)self identifier];
  unint64_t v6 = (unint64_t)[(CNContainer *)v4 identifier];
  if (v5 | v6)
  {
    if (![(id)v5 isEqual:v6]) {
      goto LABEL_35;
    }
  }
  unint64_t v7 = (unint64_t)[(CNContainer *)self name];
  unint64_t v8 = (unint64_t)[(CNContainer *)v4 name];
  if (v7 | v8)
  {
    if (![(id)v7 isEqual:v8]) {
      goto LABEL_35;
    }
  }
  CNContainerType v9 = [(CNContainer *)self type];
  if (v9 != [(CNContainer *)v4 type]) {
    goto LABEL_35;
  }
  int v10 = [(CNContainer *)self iOSLegacyIdentifier];
  if (v10 != [(CNContainer *)v4 iOSLegacyIdentifier]) {
    goto LABEL_35;
  }
  unint64_t v11 = (unint64_t)[(CNContainer *)self accountIdentifier];
  unint64_t v12 = (unint64_t)[(CNContainer *)v4 accountIdentifier];
  if (v11 | v12)
  {
    if (![(id)v11 isEqual:v12]) {
      goto LABEL_35;
    }
  }
  BOOL v13 = [(CNContainer *)self isEnabled];
  if (v13 != [(CNContainer *)v4 isEnabled]) {
    goto LABEL_35;
  }
  unint64_t v14 = (unint64_t)[(CNContainer *)self permissions];
  unint64_t v15 = (unint64_t)[(CNContainer *)v4 permissions];
  if (v14 | v15)
  {
    if (![(id)v14 isEqual:v15]) {
      goto LABEL_35;
    }
  }
  unint64_t v16 = (unint64_t)[(CNContainer *)self externalIdentifier];
  unint64_t v17 = (unint64_t)[(CNContainer *)v4 externalIdentifier];
  if (v16 | v17)
  {
    if (![(id)v16 isEqual:v17]) {
      goto LABEL_35;
    }
  }
  unint64_t v18 = (unint64_t)[(CNContainer *)self externalModificationTag];
  unint64_t v19 = (unint64_t)[(CNContainer *)v4 externalModificationTag];
  if (v18 | v19)
  {
    if (![(id)v18 isEqual:v19]) {
      goto LABEL_35;
    }
  }
  unint64_t v20 = (unint64_t)[(CNContainer *)self externalSyncTag];
  unint64_t v21 = (unint64_t)[(CNContainer *)v4 externalSyncTag];
  if (v20 | v21)
  {
    if (![(id)v20 isEqual:v21]) {
      goto LABEL_35;
    }
  }
  unint64_t v22 = (unint64_t)[(CNContainer *)self externalSyncData];
  unint64_t v23 = (unint64_t)[(CNContainer *)v4 externalSyncData];
  if (v22 | v23)
  {
    if (![(id)v22 isEqual:v23]) {
      goto LABEL_35;
    }
  }
  unint64_t v24 = (unint64_t)[(CNContainer *)self constraintsPath];
  unint64_t v25 = (unint64_t)[(CNContainer *)v4 constraintsPath];
  if (v24 | v25)
  {
    if (![(id)v24 isEqual:v25]) {
      goto LABEL_35;
    }
  }
  unint64_t v26 = (unint64_t)[(CNContainer *)self meIdentifier];
  unint64_t v27 = (unint64_t)[(CNContainer *)v4 meIdentifier];
  if (v26 | v27)
  {
    if (![(id)v26 isEqual:v27]) {
      goto LABEL_35;
    }
  }
  BOOL v28 = [(CNContainer *)self isGuardianRestricted];
  if (v28 != [(CNContainer *)v4 isGuardianRestricted]) {
    goto LABEL_35;
  }
  unint64_t v29 = [(CNContainer *)self restrictions];
  if (v29 != [(CNContainer *)v4 restrictions]) {
    goto LABEL_35;
  }
  unint64_t v30 = (unint64_t)[(CNContainer *)self lastSyncDate];
  unint64_t v31 = (unint64_t)[(CNContainer *)v4 lastSyncDate];
  if (v30 | v31)
  {
    if (![(id)v30 isEqual:v31]) {
      goto LABEL_35;
    }
  }
  if (((unint64_t v32 = (unint64_t)[(CNContainer *)self providerIdentifier],
         unint64_t v33 = (unint64_t)[(CNContainer *)v4 providerIdentifier],
         !(v32 | v33))
     || [(id)v32 isEqual:v33])
    && ((unint64_t v34 = (unint64_t)[(CNContainer *)self providerMetadata],
         unint64_t v35 = (unint64_t)[(CNContainer *)v4 providerMetadata],
         !(v34 | v35))
     || [(id)v34 isEqual:v35]))
  {
LABEL_34:
    BOOL v36 = 1;
  }
  else
  {
LABEL_35:
    BOOL v36 = 0;
  }

  return v36;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v4 = [(CNContainer *)self identifier];
  uint64_t v5 = [v3 objectHash:v4];

  unint64_t v6 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v7 = [(CNContainer *)self name];
  uint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5;

  CNContainerType v9 = [(CNContainer *)self type];
  if (v9 >= CNContainerTypeUnassigned) {
    CNContainerType v10 = v9;
  }
  else {
    CNContainerType v10 = -(uint64_t)v9;
  }
  uint64_t v11 = 31 * (v10 - v8 + 32 * v8);
  int v12 = [(CNContainer *)self iOSLegacyIdentifier];
  if (v12 >= 0) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = -v12;
  }
  uint64_t v14 = v11 + v13;
  unint64_t v15 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v16 = [(CNContainer *)self accountIdentifier];
  uint64_t v17 = 31 * ([v15 objectHash:v16] - v14 + 32 * v14);

  uint64_t v18 = v17 + [(CNContainer *)self isEnabled];
  unint64_t v19 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v20 = [(CNContainer *)self permissions];
  uint64_t v21 = [v19 objectHash:v20] - v18 + 32 * v18;

  unint64_t v22 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v23 = [(CNContainer *)self externalIdentifier];
  uint64_t v24 = [v22 objectHash:v23] - v21 + 32 * v21;

  unint64_t v25 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v26 = [(CNContainer *)self externalModificationTag];
  uint64_t v27 = [v25 objectHash:v26] - v24 + 32 * v24;

  BOOL v28 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v29 = [(CNContainer *)self externalSyncTag];
  uint64_t v30 = [v28 objectHash:v29] - v27 + 32 * v27;

  unint64_t v31 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v32 = [(CNContainer *)self externalSyncData];
  uint64_t v33 = [v31 objectHash:v32] - v30 + 32 * v30;

  unint64_t v34 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v35 = [(CNContainer *)self constraintsPath];
  uint64_t v36 = [v34 objectHash:v35] - v33 + 32 * v33;

  v37 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v38 = [(CNContainer *)self meIdentifier];
  uint64_t v39 = [v37 objectHash:v38] - v36 + 32 * v36;

  unint64_t v40 = 31 * ([(CNContainer *)self restrictions] - v39 + 32 * v39);
  unint64_t v41 = v40 + [(CNContainer *)self isGuardianRestricted];
  uint64_t v42 = (void *)MEMORY[0x1E4F5A418];
  v43 = [(CNContainer *)self lastSyncDate];
  uint64_t v44 = [v42 objectHash:v43] - v41 + 32 * v41;

  v45 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v46 = [(CNContainer *)self providerIdentifier];
  uint64_t v47 = [v45 objectHash:v46] - v44 + 32 * v44;

  uint64_t v48 = (void *)MEMORY[0x1E4F5A418];
  v49 = [(CNContainer *)self providerMetadata];
  unint64_t v50 = [v48 objectHash:v49] - v47 + 32 * v47 + 0x76BB734BA8507DD1;

  return v50;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (CNContainerType)type
{
  return self->_type;
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (NSString)externalSyncTag
{
  return self->_externalSyncTag;
}

- (NSData)externalSyncData
{
  return self->_externalSyncData;
}

- (NSString)constraintsPath
{
  return self->_constraintsPath;
}

- (NSString)meIdentifier
{
  return self->_meIdentifier;
}

- (unint64_t)restrictions
{
  return self->_restrictions;
}

- (BOOL)isGuardianStateDirty
{
  return self->_guardianStateDirty;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CNContainerPermissions)permissions
{
  return self->_permissions;
}

- (BOOL)isGuardianRestricted
{
  return self->_guardianRestricted;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (CNProviderMetadata)providerMetadata
{
  return self->_providerMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerMetadata, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_meIdentifier, 0);
  objc_storeStrong((id *)&self->_constraintsPath, 0);
  objc_storeStrong((id *)&self->_externalSyncData, 0);
  objc_storeStrong((id *)&self->_externalSyncTag, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_permissions, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end