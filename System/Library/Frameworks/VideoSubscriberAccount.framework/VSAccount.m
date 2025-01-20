@interface VSAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynchronizable;
- (NSData)channelsData;
- (NSNumber)legacyItemHash;
- (NSString)accountDescription;
- (NSString)accountTypeDescription;
- (NSString)identityProviderDisplayName;
- (NSString)preferredAppID;
- (NSString)username;
- (VSAccount)init;
- (VSAccount)initWithCoder:(id)a3;
- (VSAccountStore)accountStore;
- (VSKeychainGenericPassword)keychainItem;
- (VSKeychainGenericPassword)legacyKeychainItem;
- (VSOptional)authenticationToken;
- (VSOptional)identityProviderID;
- (VSOptional)optionalIdentityProviderDisplayName;
- (id)description;
- (id)effectiveModificationDate;
- (unint64_t)contentsHash;
- (unint64_t)hash;
- (unint64_t)version;
- (void)effectiveModificationDate;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountDescription:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAccountTypeDescription:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setChannelsData:(id)a3;
- (void)setIdentityProviderID:(id)a3;
- (void)setKeychainItem:(id)a3;
- (void)setLegacyItemHash:(id)a3;
- (void)setLegacyKeychainItem:(id)a3;
- (void)setOptionalIdentityProviderDisplayName:(id)a3;
- (void)setPreferredAppID:(id)a3;
- (void)setSynchronizable:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation VSAccount

- (VSAccount)init
{
  v10.receiver = self;
  v10.super_class = (Class)VSAccount;
  v2 = [(VSAccount *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSOptional);
    optionalIdentityProviderDisplayName = v2->_optionalIdentityProviderDisplayName;
    v2->_optionalIdentityProviderDisplayName = v3;

    v5 = objc_alloc_init(VSOptional);
    identityProviderID = v2->_identityProviderID;
    v2->_identityProviderID = v5;

    v7 = objc_alloc_init(VSOptional);
    authenticationToken = v2->_authenticationToken;
    v2->_authenticationToken = v7;

    v2->_version = 1;
  }
  return v2;
}

- (unint64_t)contentsHash
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v3 = [(VSAccount *)self username];
  uint64_t v4 = [v3 hash];

  uint64_t v15 = v4;
  v5 = [(VSAccount *)self preferredAppID];
  uint64_t v6 = [v5 hash];
  v13[3] ^= v6;

  v7 = [(VSAccount *)self authenticationToken];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __25__VSAccount_contentsHash__block_invoke;
  v11[3] = &unk_1E6BD41C8;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25__VSAccount_contentsHash__block_invoke_2;
  v10[3] = &unk_1E6BD29A8;
  v10[4] = self;
  [v7 conditionallyUnwrapObject:v11 otherwise:v10];

  unint64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __25__VSAccount_contentsHash__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 body];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= [v4 hash];

  id v5 = [v3 expirationDate];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) ^= [v5 hash];
}

void __25__VSAccount_contentsHash__block_invoke_2(uint64_t a1)
{
  v2 = VSErrorLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __25__VSAccount_contentsHash__block_invoke_2_cold_1(a1, v2);
  }
}

- (id)effectiveModificationDate
{
  id v3 = [(VSAccount *)self keychainItem];
  uint64_t v4 = [v3 modificationDate];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    uint64_t v6 = [(VSAccount *)self legacyKeychainItem];
    v7 = [v6 modificationDate];

    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      v9 = VSErrorLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(VSAccount *)(uint64_t)self effectiveModificationDate];
      }

      id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v5 = v8;
  }

  return v5;
}

- (NSString)identityProviderDisplayName
{
  v2 = [(VSAccount *)self optionalIdentityProviderDisplayName];
  id v3 = [v2 object];

  return (NSString *)v3;
}

- (BOOL)isSynchronizable
{
  return ![(VSAccount *)self version] || self->_synchronizable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  id v5 = [(VSAccount *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountTypeDescription"];
    [(VSAccount *)v5 setAccountTypeDescription:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountDescription"];
    [(VSAccount *)v5 setAccountDescription:v7];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityProviderDisplayName"];
    v9 = +[VSOptional optionalWithObject:v8];
    [(VSAccount *)v5 setOptionalIdentityProviderDisplayName:v9];

    objc_super v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identityProviderID"];
    v11 = (void *)[v10 copy];
    uint64_t v12 = +[VSOptional optionalWithObject:v11];
    [(VSAccount *)v5 setIdentityProviderID:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
    [(VSAccount *)v5 setUsername:v13];

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredAppID"];
    [(VSAccount *)v5 setPreferredAppID:v14];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    -[VSAccount setVersion:](v5, "setVersion:", [v15 unsignedIntegerValue]);

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"synchronizable"];
    -[VSAccount setSynchronizable:](v5, "setSynchronizable:", [v16 BOOLValue]);

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
    v18 = v17;
    if (!v17)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v19 = v17;
    uint64_t v20 = [v4 decodeIntegerForKey:@"authenticationTokenKind"];
    if (v20)
    {
      if (v20 != 1)
      {
        v22 = 0;
        goto LABEL_9;
      }
      v21 = off_1E6BD2440;
    }
    else
    {
      v21 = off_1E6BD2490;
    }
    v22 = (void *)[objc_alloc(*v21) initWithSerializedData:v19];
LABEL_9:
    v23 = +[VSOptional optionalWithObject:v22];
    [(VSAccount *)v5 setAuthenticationToken:v23];

    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  id v5 = [(VSAccount *)self accountTypeDescription];
  [v4 encodeObject:v5 forKey:@"accountTypeDescription"];

  uint64_t v6 = [(VSAccount *)self accountDescription];
  [v4 encodeObject:v6 forKey:@"accountDescription"];

  v7 = [(VSAccount *)self identityProviderDisplayName];
  [v4 encodeObject:v7 forKey:@"identityProviderDisplayName"];

  id v8 = [(VSAccount *)self identityProviderID];
  v9 = [v8 object];
  [v4 encodeObject:v9 forKey:@"identityProviderID"];

  objc_super v10 = [(VSAccount *)self username];
  [v4 encodeObject:v10 forKey:@"username"];

  v11 = [(VSAccount *)self preferredAppID];
  [v4 encodeObject:v11 forKey:@"preferredAppID"];

  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VSAccount version](self, "version"));
  [v4 encodeObject:v12 forKey:@"version"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[VSAccount isSynchronizable](self, "isSynchronizable"));
  [v4 encodeObject:v13 forKey:@"synchronizable"];

  uint64_t v14 = [(VSAccount *)self authenticationToken];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __29__VSAccount_encodeWithCoder___block_invoke;
  v16[3] = &unk_1E6BD41F0;
  id v17 = v4;
  id v15 = v4;
  [v14 conditionallyUnwrapObject:v16];
}

void __29__VSAccount_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "encodeInteger:forKey:", objc_msgSend(v3, "isOpaque"), @"authenticationTokenKind");
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 serializedData];

  [v4 encodeObject:v5 forKey:@"authenticationToken"];
}

- (unint64_t)hash
{
  id v3 = [(VSAccount *)self accountTypeDescription];
  uint64_t v4 = [v3 hash];

  id v5 = [(VSAccount *)self accountDescription];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(VSAccount *)self optionalIdentityProviderDisplayName];
  uint64_t v8 = [v7 hash];

  v9 = [(VSAccount *)self identityProviderID];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(VSAccount *)self username];
  uint64_t v12 = [v11 hash];

  v13 = [(VSAccount *)self authenticationToken];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VSAccount *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v18 = 1;
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        char v18 = 0;
LABEL_31:

        goto LABEL_32;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSAccount.", v10 format];
      }
      v11 = v6;
      uint64_t v12 = [(VSAccount *)self accountTypeDescription];
      v13 = [(VSAccount *)v11 accountTypeDescription];
      id v14 = v12;
      id v15 = v13;
      if (v14 == v15)
      {
      }
      else
      {
        v16 = v15;
        if (!v14 || !v15) {
          goto LABEL_28;
        }
        char v17 = [v14 isEqual:v15];

        if ((v17 & 1) == 0) {
          goto LABEL_27;
        }
      }
      id v19 = [(VSAccount *)self accountDescription];
      uint64_t v20 = [(VSAccount *)v11 accountDescription];
      id v14 = v19;
      id v21 = v20;
      if (v14 == v21)
      {
      }
      else
      {
        v16 = v21;
        if (!v14 || !v21) {
          goto LABEL_28;
        }
        char v22 = [v14 isEqual:v21];

        if ((v22 & 1) == 0) {
          goto LABEL_27;
        }
      }
      v23 = [(VSAccount *)self optionalIdentityProviderDisplayName];
      v24 = [(VSAccount *)v11 optionalIdentityProviderDisplayName];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_27;
      }
      v26 = [(VSAccount *)self identityProviderID];
      v27 = [(VSAccount *)v11 identityProviderID];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_27;
      }
      v29 = [(VSAccount *)self username];
      v30 = [(VSAccount *)v11 username];
      id v14 = v29;
      id v31 = v30;
      if (v14 == v31)
      {

LABEL_34:
        id v14 = [(VSAccount *)self authenticationToken];
        v16 = [(VSAccount *)v11 authenticationToken];
        char v18 = [v14 isEqual:v16];
        goto LABEL_29;
      }
      v16 = v31;
      if (v14 && v31)
      {
        char v32 = [v14 isEqual:v31];

        if ((v32 & 1) == 0)
        {
LABEL_27:
          char v18 = 0;
LABEL_30:

          goto LABEL_31;
        }
        goto LABEL_34;
      }
LABEL_28:

      char v18 = 0;
LABEL_29:

      goto LABEL_30;
    }
    char v18 = 0;
  }
LABEL_32:

  return v18;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = NSString;
  id v5 = [(VSAccount *)self accountTypeDescription];
  uint64_t v6 = [v4 stringWithFormat:@"%@ = %@", @"accountTypeDescription", v5];
  [v3 addObject:v6];

  v7 = NSString;
  uint64_t v8 = [(VSAccount *)self accountDescription];
  v9 = [v7 stringWithFormat:@"%@ = %@", @"accountDescription", v8];
  [v3 addObject:v9];

  uint64_t v10 = NSString;
  v11 = [(VSAccount *)self identityProviderDisplayName];
  uint64_t v12 = [v10 stringWithFormat:@"%@ = %@", @"identityProviderDisplayName", v11];
  [v3 addObject:v12];

  v13 = NSString;
  id v14 = [(VSAccount *)self identityProviderID];
  id v15 = [v13 stringWithFormat:@"%@ = %@", @"identityProviderID", v14];
  [v3 addObject:v15];

  v16 = NSString;
  char v17 = [(VSAccount *)self username];
  char v18 = [v16 stringWithFormat:@"%@ = %@", @"username", v17];
  [v3 addObject:v18];

  id v19 = NSString;
  uint64_t v20 = [(VSAccount *)self authenticationToken];
  id v21 = [v19 stringWithFormat:@"%@ = %@", @"authenticationToken", v20];
  [v3 addObject:v21];

  char v22 = NSString;
  v27.receiver = self;
  v27.super_class = (Class)VSAccount;
  v23 = [(VSAccount *)&v27 description];
  v24 = [v3 componentsJoinedByString:@", "];
  int v25 = [v22 stringWithFormat:@"<%@ %@>", v23, v24];

  return v25;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (VSAccountStore)accountStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountStore);

  return (VSAccountStore *)WeakRetained;
}

- (void)setAccountStore:(id)a3
{
}

- (NSString)accountTypeDescription
{
  return self->_accountTypeDescription;
}

- (void)setAccountTypeDescription:(id)a3
{
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
}

- (VSOptional)optionalIdentityProviderDisplayName
{
  return self->_optionalIdentityProviderDisplayName;
}

- (void)setOptionalIdentityProviderDisplayName:(id)a3
{
}

- (VSOptional)identityProviderID
{
  return self->_identityProviderID;
}

- (void)setIdentityProviderID:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)preferredAppID
{
  return self->_preferredAppID;
}

- (void)setPreferredAppID:(id)a3
{
}

- (VSOptional)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (void)setSynchronizable:(BOOL)a3
{
  self->_synchronizable = a3;
}

- (VSKeychainGenericPassword)keychainItem
{
  return self->_keychainItem;
}

- (void)setKeychainItem:(id)a3
{
}

- (VSKeychainGenericPassword)legacyKeychainItem
{
  return self->_legacyKeychainItem;
}

- (void)setLegacyKeychainItem:(id)a3
{
}

- (NSNumber)legacyItemHash
{
  return self->_legacyItemHash;
}

- (void)setLegacyItemHash:(id)a3
{
}

- (NSData)channelsData
{
  return self->_channelsData;
}

- (void)setChannelsData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelsData, 0);
  objc_storeStrong((id *)&self->_legacyItemHash, 0);
  objc_storeStrong((id *)&self->_legacyKeychainItem, 0);
  objc_storeStrong((id *)&self->_keychainItem, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_preferredAppID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_identityProviderID, 0);
  objc_storeStrong((id *)&self->_optionalIdentityProviderDisplayName, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountTypeDescription, 0);

  objc_destroyWeak((id *)&self->_accountStore);
}

void __25__VSAccount_contentsHash__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1DA674000, a2, OS_LOG_TYPE_FAULT, "Attempted to calculate contents hash for account with no authenticationToken: %@", (uint8_t *)&v3, 0xCu);
}

- (void)effectiveModificationDate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1DA674000, a2, OS_LOG_TYPE_FAULT, "VSAccount has neither a legacy or modern item with a modification date: %@", (uint8_t *)&v2, 0xCu);
}

@end