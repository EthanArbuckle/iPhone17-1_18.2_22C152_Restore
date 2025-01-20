@interface CNAccount
+ (BOOL)ios_requestAccountSyncWithOptions:(unint64_t)a3;
+ (BOOL)requestAccountSyncWithDefaultOptions;
+ (BOOL)supportsSecureCoding;
+ (id)identifierProvider;
+ (id)localAccount;
+ (id)makeIdentifierString;
+ (id)os_log;
+ (id)predicateForAccountForContainerWithIdentifier:(id)a3;
+ (id)predicateForAccountWithExternalIdentifier:(id)a3;
+ (id)predicateForAccountsWithIdentifiers:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNAccount)init;
- (CNAccount)initWithCoder:(id)a3;
- (CNAccount)initWithExternalIdentifier:(id)a3;
- (CNAccount)initWithIdentifier:(id)a3 externalIdentifier:(id)a4;
- (CNAccount)initWithIdentifier:(id)a3 externalIdentifier:(id)a4 iOSLegacyIdentifier:(int)a5;
- (NSString)externalIdentifierString;
- (NSString)identifier;
- (id)description;
- (int)iOSLegacyIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNAccount

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1) {
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_27);
  }
  v2 = (void *)os_log_cn_once_object_1;

  return v2;
}

uint64_t __19__CNAccount_os_log__block_invoke()
{
  os_log_cn_once_object_1 = (uint64_t)os_log_create("com.apple.contacts", "CNAccount");

  return MEMORY[0x1F41817F8]();
}

+ (id)localAccount
{
  if (localAccount_cn_once_token_2 != -1) {
    dispatch_once(&localAccount_cn_once_token_2, &__block_literal_global_4_3);
  }
  v2 = (void *)localAccount_cn_once_object_2;

  return v2;
}

uint64_t __25__CNAccount_localAccount__block_invoke()
{
  localAccount_cn_once_object_2 = [[CNAccount alloc] initWithIdentifier:@"local" externalIdentifier:0];

  return MEMORY[0x1F41817F8]();
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_3 != -1) {
    dispatch_once(&identifierProvider_cn_once_token_3, &__block_literal_global_7);
  }
  v2 = (void *)identifierProvider_cn_once_object_3;

  return v2;
}

uint64_t __31__CNAccount_identifierProvider__block_invoke()
{
  identifierProvider_cn_once_object_3 = [[CNUuidIdentifierProvider alloc] initWithSuffix:@"ABAccount"];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeIdentifierString
{
  v2 = [a1 identifierProvider];
  v3 = [v2 makeIdentifier];

  return v3;
}

+ (BOOL)requestAccountSyncWithDefaultOptions
{
  return [a1 requestAccountSyncWithOptions:1];
}

+ (BOOL)ios_requestAccountSyncWithOptions:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F179C8] defaultStore];
  v5 = [v4 accountIdentifiersEnabledToSyncDataclass:*MEMORY[0x1E4F17A90]];
  uint64_t v6 = [v5 count];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(id)getDADConnectionClass() sharedConnection];
        [v12 updateContentsOfAllFoldersForAccountID:v11 andDataclasses:2 isUserRequested:v3 & 1];

        v13 = [(id)getDADConnectionClass() sharedConnection];
        [v13 updateFolderListForAccountID:v11 andDataclasses:2 isUserRequested:v3 & 1];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v6 != 0;
}

- (CNAccount)init
{
  return [(CNAccount *)self initWithExternalIdentifier:0];
}

- (CNAccount)initWithExternalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() makeIdentifier];
  uint64_t v6 = [(CNAccount *)self initWithIdentifier:v5 externalIdentifier:v4];

  return v6;
}

- (CNAccount)initWithIdentifier:(id)a3 externalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAccount;
  uint64_t v8 = [(CNAccount *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    externalIdentifierString = v8->_externalIdentifierString;
    v8->_externalIdentifierString = (NSString *)v11;

    v8->_iOSLegacyIdentifier = -1;
    v13 = v8;
  }

  return v8;
}

- (CNAccount)initWithIdentifier:(id)a3 externalIdentifier:(id)a4 iOSLegacyIdentifier:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNAccount;
  v10 = [(CNAccount *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    externalIdentifierString = v10->_externalIdentifierString;
    v10->_externalIdentifierString = (NSString *)v13;

    v10->_iOSLegacyIdentifier = a5;
    objc_super v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CNAccount *)self initWithIdentifier:0 externalIdentifier:0];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalIdentifierString"];
    uint64_t v10 = [v9 copy];
    externalIdentifierString = v5->_externalIdentifierString;
    v5->_externalIdentifierString = (NSString *)v10;

    v5->_iOSLegacyIdentifier = [v4 decodeInt32ForKey:@"iOSLegacyIdentifier"];
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_externalIdentifierString forKey:@"_externalIdentifierString"];
  [v5 encodeInt32:self->_iOSLegacyIdentifier forKey:@"iOSLegacyIdentifier"];
}

- (id)description
{
  char v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v5 = (id)[v3 appendObject:self->_externalIdentifierString withName:@"externalIdentifierString"];
  id v6 = [NSNumber numberWithInt:self->_iOSLegacyIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"iOSLegacyIdentifier"];

  id v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __21__CNAccount_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __21__CNAccount_isEqual___block_invoke_2;
  uint64_t v13 = &unk_1E56B3E18;
  v14 = self;
  id v15 = v4;
  id v7 = v4;
  id v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __21__CNAccount_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  char v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __21__CNAccount_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  char v3 = [*(id *)(a1 + 32) externalIdentifierString];
  id v4 = [*(id *)(a1 + 40) externalIdentifierString];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __17__CNAccount_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __17__CNAccount_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  char v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __17__CNAccount_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __17__CNAccount_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) externalIdentifierString];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)externalIdentifierString
{
  return self->_externalIdentifierString;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifierString, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)predicateForAccountWithExternalIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CNiOSABAccountForExternalIdentifierPredicate alloc] initWithAccountExternalIdentifier:v3];

  return v4;
}

+ (id)predicateForAccountForContainerWithIdentifier:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CNiOSABAccountForContainerPredicate alloc] initWithContainerIdentifier:v3];

  return v4;
}

+ (id)predicateForAccountsWithIdentifiers:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[CNiOSABAccountIdentifiersPredicate alloc] initWithIdentifiers:v3];

  return v4;
}

@end