@interface CNGroup
+ (BOOL)supportsSecureCoding;
+ (NSPredicate)predicateForGroupsInContainerWithIdentifier:(NSString *)containerIdentifier;
+ (NSPredicate)predicateForGroupsWithIdentifiers:(NSArray *)identifiers;
+ (NSPredicate)predicateForSubgroupsInGroupWithIdentifier:(NSString *)parentGroupIdentifier;
+ (id)identifierProvider;
+ (id)localizedStringForKey:(id)a3;
+ (id)makeIdentifierString;
+ (id)predicateForGroupsWithMemberContact:(id)a3 includeAllParentGroups:(BOOL)a4;
+ (id)predicateForGroupsWithMemberGroup:(id)a3 includeAllParentGroups:(BOOL)a4;
+ (id)predicateForGroupsWithNameMatching:(id)a3;
+ (id)predicateForiOSLegacyIdentifier:(int)a3;
- (BOOL)isEqual:(id)a3;
- (CNGroup)init;
- (CNGroup)initWithCoder:(id)a3;
- (CNGroup)initWithGroup:(id)a3;
- (CNGroup)initWithIdentifier:(id)a3 name:(id)a4;
- (CNGroup)initWithIdentifier:(id)a3 name:(id)a4 creationDate:(id)a5 modificationDate:(id)a6 iOSLegacyIdentifier:(int)a7;
- (CNGroup)initWithName:(id)a3;
- (CNGroup)snapshot;
- (NSData)externalRepresentation;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)externalIdentifier;
- (NSString)externalModificationTag;
- (NSString)externalUUID;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)iOSLegacyIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNGroup

+ (id)localizedStringForKey:(id)a3
{
  return (id)[MEMORY[0x1E4F5A430] localizedStringForString:a3 class:a1 returningNilIfNotFound:1];
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_0_0 != -1) {
    dispatch_once(&identifierProvider_cn_once_token_0_0, &__block_literal_global_61);
  }
  v2 = (void *)identifierProvider_cn_once_object_0_0;

  return v2;
}

uint64_t __29__CNGroup_identifierProvider__block_invoke()
{
  identifierProvider_cn_once_object_0_0 = [[CNUuidIdentifierProvider alloc] initWithSuffix:@"ABGroup"];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeIdentifierString
{
  v2 = [a1 identifierProvider];
  v3 = [v2 makeIdentifier];

  return v3;
}

- (CNGroup)init
{
  return [(CNGroup *)self initWithName:0];
}

- (CNGroup)initWithName:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() makeIdentifier];
  v6 = [(CNGroup *)self initWithIdentifier:v5 name:v4];

  return v6;
}

- (CNGroup)initWithIdentifier:(id)a3 name:(id)a4
{
  return [(CNGroup *)self initWithIdentifier:a3 name:a4 creationDate:0 modificationDate:0 iOSLegacyIdentifier:0xFFFFFFFFLL];
}

- (CNGroup)initWithIdentifier:(id)a3 name:(id)a4 creationDate:(id)a5 modificationDate:(id)a6 iOSLegacyIdentifier:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CNGroup;
  v16 = [(CNGroup *)&v29 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v17;

    uint64_t v19 = *MEMORY[0x1E4F5A1F8];
    v20 = (void *)[v13 copy];
    uint64_t v21 = (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
    name = v16->_name;
    v16->_name = (NSString *)v21;

    uint64_t v23 = [v14 copy];
    creationDate = v16->_creationDate;
    v16->_creationDate = (NSDate *)v23;

    uint64_t v25 = [v15 copy];
    modificationDate = v16->_modificationDate;
    v16->_modificationDate = (NSDate *)v25;

    v16->_iOSLegacyIdentifier = a7;
    v27 = v16;
  }

  return v16;
}

- (CNGroup)initWithGroup:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CNGroup;
  v5 = [(CNGroup *)&v37 init];
  if (v5)
  {
    v6 = [v4 identifier];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = *MEMORY[0x1E4F5A1F8];
    v10 = [v4 name];
    v11 = (void *)[v10 copy];
    uint64_t v12 = (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v11);
    name = v5->_name;
    v5->_name = (NSString *)v12;

    v5->_iOSLegacyIdentifier = [v4 iOSLegacyIdentifier];
    id v14 = [v4 creationDate];
    uint64_t v15 = [v14 copy];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v15;

    uint64_t v17 = [v4 modificationDate];
    uint64_t v18 = [v17 copy];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v18;

    v20 = [v4 externalIdentifier];
    uint64_t v21 = [v20 copy];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 externalRepresentation];
    uint64_t v24 = [v23 copy];
    externalRepresentation = v5->_externalRepresentation;
    v5->_externalRepresentation = (NSData *)v24;

    v26 = [v4 externalModificationTag];
    uint64_t v27 = [v26 copy];
    externalModificationTag = v5->_externalModificationTag;
    v5->_externalModificationTag = (NSString *)v27;

    objc_super v29 = [v4 externalUUID];
    uint64_t v30 = [v29 copy];
    externalUUID = v5->_externalUUID;
    v5->_externalUUID = (NSString *)v30;

    v32 = [v4 snapshot];
    uint64_t v33 = [v32 copy];
    snapshot = v5->_snapshot;
    v5->_snapshot = (CNGroup *)v33;

    v35 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CNGroup;
  v5 = [(CNGroup *)&v37 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    uint64_t v10 = [v9 copy];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    if (!v5->_name)
    {
      v5->_name = (NSString *)&stru_1EE052B80;
    }
    v5->_iOSLegacyIdentifier = [v4 decodeInt32ForKey:@"iOSLegacyIdentifier"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    uint64_t v13 = [v12 copy];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
    uint64_t v16 = [v15 copy];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalIdentifier"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v18;

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalRepresentation"];
    uint64_t v21 = [v20 copy];
    externalRepresentation = v5->_externalRepresentation;
    v5->_externalRepresentation = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalModificationTag"];
    uint64_t v24 = [v23 copy];
    externalModificationTag = v5->_externalModificationTag;
    v5->_externalModificationTag = (NSString *)v24;

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalUUID"];
    uint64_t v27 = [v26 copy];
    externalUUID = v5->_externalUUID;
    v5->_externalUUID = (NSString *)v27;

    objc_super v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v32 = [v4 decodeObjectOfClasses:v31 forKey:@"snapshot"];
    uint64_t v33 = [v32 copy];
    snapshot = v5->_snapshot;
    v5->_snapshot = (CNGroup *)v33;

    v35 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"_name"];
  [v5 encodeInt32:self->_iOSLegacyIdentifier forKey:@"iOSLegacyIdentifier"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_modificationDate forKey:@"modificationDate"];
  [v5 encodeObject:self->_externalIdentifier forKey:@"externalIdentifier"];
  [v5 encodeObject:self->_externalRepresentation forKey:@"externalRepresentation"];
  [v5 encodeObject:self->_externalModificationTag forKey:@"externalModificationTag"];
  [v5 encodeObject:self->_externalUUID forKey:@"externalUUID"];
  [v5 encodeObject:self->_snapshot forKey:@"snapshot"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(CNGroup *)[CNMutableGroup alloc] initWithGroup:self];
  snapshot = self->_snapshot;
  v6 = [MEMORY[0x1E4F1CA98] null];

  if (snapshot == v6) {
    [(CNMutableGroup *)v4 setSnapshot:self];
  }
  return v4;
}

- (CNGroup)snapshot
{
  v3 = self->_snapshot;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4)
  {
    id v5 = self;

    v3 = v5;
  }

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v5 = (id)[v3 appendObject:self->_name withName:@"name"];
  v6 = [NSNumber numberWithInt:self->_iOSLegacyIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"iOSLegacyIdentifier"];

  id v8 = (id)[v3 appendObject:self->_creationDate withName:@"creationDate"];
  id v9 = (id)[v3 appendObject:self->_modificationDate withName:@"modificationDate"];
  id v10 = (id)[v3 appendObject:self->_externalIdentifier withName:@"externalURI"];
  id v11 = (id)[v3 appendObject:self->_externalRepresentation withName:@"externalRepresentation"];
  id v12 = (id)[v3 appendObject:self->_externalModificationTag withName:@"externalModificationTag"];
  id v13 = (id)[v3 appendObject:self->_externalUUID withName:@"externalUUID"];
  id v14 = [v3 build];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v23 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v22 = objc_opt_class();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __19__CNGroup_isEqual___block_invoke;
  v40[3] = &unk_1E56B3E18;
  v40[4] = self;
  id v41 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNGroup_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v5 = v41;
  id v39 = v5;
  v6 = _Block_copy(aBlock);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __19__CNGroup_isEqual___block_invoke_3;
  v36[3] = &unk_1E56B3E18;
  v36[4] = self;
  id v7 = v5;
  id v37 = v7;
  id v8 = _Block_copy(v36);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __19__CNGroup_isEqual___block_invoke_4;
  v34[3] = &unk_1E56B3E18;
  v34[4] = self;
  id v9 = v7;
  id v35 = v9;
  id v10 = _Block_copy(v34);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __19__CNGroup_isEqual___block_invoke_5;
  v32[3] = &unk_1E56B3E18;
  v32[4] = self;
  id v11 = v9;
  id v33 = v11;
  id v12 = _Block_copy(v32);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __19__CNGroup_isEqual___block_invoke_6;
  v30[3] = &unk_1E56B3E18;
  v30[4] = self;
  id v13 = v11;
  id v31 = v13;
  id v14 = _Block_copy(v30);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __19__CNGroup_isEqual___block_invoke_7;
  v28[3] = &unk_1E56B3E18;
  v28[4] = self;
  id v15 = v13;
  id v29 = v15;
  uint64_t v16 = _Block_copy(v28);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __19__CNGroup_isEqual___block_invoke_8;
  v26[3] = &unk_1E56B3E18;
  v26[4] = self;
  id v17 = v15;
  id v27 = v17;
  uint64_t v18 = _Block_copy(v26);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __19__CNGroup_isEqual___block_invoke_9;
  v24[3] = &unk_1E56B3E18;
  v24[4] = self;
  id v25 = v17;
  id v19 = v17;
  v20 = _Block_copy(v24);
  LOBYTE(self) = objc_msgSend(v23, "isObject:kindOfClass:andEqualToObject:withBlocks:", v19, v22, self, v40, v6, v8, v10, v12, v14, v16, v18, v20, 0);

  return (char)self;
}

uint64_t __19__CNGroup_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 40) name];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

BOOL __19__CNGroup_isEqual___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) iOSLegacyIdentifier];
  return v2 == [*(id *)(a1 + 40) iOSLegacyIdentifier];
}

uint64_t __19__CNGroup_isEqual___block_invoke_4(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) creationDate];
  id v4 = [*(id *)(a1 + 40) creationDate];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_5(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) modificationDate];
  id v4 = [*(id *)(a1 + 40) modificationDate];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_6(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) externalIdentifier];
  id v4 = [*(id *)(a1 + 40) externalIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_7(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) externalRepresentation];
  id v4 = [*(id *)(a1 + 40) externalRepresentation];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_8(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) externalModificationTag];
  id v4 = [*(id *)(a1 + 40) externalModificationTag];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __19__CNGroup_isEqual___block_invoke_9(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) externalUUID];
  id v4 = [*(id *)(a1 + 40) externalUUID];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __15__CNGroup_hash__block_invoke;
  v22[3] = &unk_1E56B3E40;
  v22[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __15__CNGroup_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  id v4 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __15__CNGroup_hash__block_invoke_3;
  v20[3] = &unk_1E56B3E40;
  v20[4] = self;
  uint64_t v5 = _Block_copy(v20);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __15__CNGroup_hash__block_invoke_4;
  v19[3] = &unk_1E56B3E40;
  v19[4] = self;
  v6 = _Block_copy(v19);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __15__CNGroup_hash__block_invoke_5;
  v18[3] = &unk_1E56B3E40;
  v18[4] = self;
  id v7 = _Block_copy(v18);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __15__CNGroup_hash__block_invoke_6;
  v17[3] = &unk_1E56B3E40;
  v17[4] = self;
  id v8 = _Block_copy(v17);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __15__CNGroup_hash__block_invoke_7;
  v16[3] = &unk_1E56B3E40;
  v16[4] = self;
  id v9 = _Block_copy(v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __15__CNGroup_hash__block_invoke_8;
  v15[3] = &unk_1E56B3E40;
  v15[4] = self;
  id v10 = _Block_copy(v15);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __15__CNGroup_hash__block_invoke_9;
  v14[3] = &unk_1E56B3E40;
  v14[4] = self;
  id v11 = _Block_copy(v14);
  unint64_t v12 = objc_msgSend(v3, "hashWithBlocks:", v22, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  return v12;
}

uint64_t __15__CNGroup_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  int v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  int v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = (int)[*(id *)(a1 + 32) iOSLegacyIdentifier];

  return [v1 integerHash:v2];
}

uint64_t __15__CNGroup_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) creationDate];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) modificationDate];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_6(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) externalIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_7(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) externalRepresentation];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_8(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) externalModificationTag];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __15__CNGroup_hash__block_invoke_9(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) externalUUID];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSData)externalRepresentation
{
  return self->_externalRepresentation;
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (NSString)externalUUID
{
  return self->_externalUUID;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalUUID, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalRepresentation, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (NSPredicate)predicateForGroupsWithIdentifiers:(NSArray *)identifiers
{
  uint64_t v3 = identifiers;
  id v4 = [[CNiOSABGroupIdentifiersPredicate alloc] initWithIdentifiers:v3];

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForSubgroupsInGroupWithIdentifier:(NSString *)parentGroupIdentifier
{
  uint64_t v3 = parentGroupIdentifier;
  id v4 = [[CNiOSABGroupsInGroupPredicate alloc] initWithParentGroupIdentifier:v3];

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForGroupsInContainerWithIdentifier:(NSString *)containerIdentifier
{
  uint64_t v3 = containerIdentifier;
  id v4 = [[CNiOSABGroupsInContainerPredicate alloc] initWithContainerIdentifier:v3];

  return (NSPredicate *)v4;
}

+ (id)predicateForGroupsWithMemberContact:(id)a3 includeAllParentGroups:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[CNiOSABGroupsWithMembersPredicate alloc] initWithContact:v5 includeAllParentGroups:v4];

  return v6;
}

+ (id)predicateForGroupsWithMemberGroup:(id)a3 includeAllParentGroups:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[CNiOSABGroupsWithMembersPredicate alloc] initWithGroup:v5 includeAllParentGroups:v4];

  return v6;
}

+ (id)predicateForGroupsWithNameMatching:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CNiOSABGroupNameMatchingPredicate alloc] initWithName:v3];

  return v4;
}

+ (id)predicateForiOSLegacyIdentifier:(int)a3
{
  id v3 = [[CNiOSABGroupiOSLegacyIdentifierPredicate alloc] initWithiOSLegacyIdentifier:*(void *)&a3];

  return v3;
}

@end