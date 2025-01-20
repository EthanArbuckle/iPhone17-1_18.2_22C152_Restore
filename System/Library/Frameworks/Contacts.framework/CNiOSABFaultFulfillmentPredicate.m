@interface CNiOSABFaultFulfillmentPredicate
+ (BOOL)supportsSecureCoding;
+ (id)os_log;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNiOSABFaultFulfillmentPredicate)initWithCoder:(id)a3;
- (CNiOSABFaultFulfillmentPredicate)initWithLegacyIdentifier:(int)a3 identifier:(id)a4;
- (NSString)description;
- (NSString)identifier;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7;
- (int)legacyIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNiOSABFaultFulfillmentPredicate

+ (id)os_log
{
  if (os_log_cn_once_token_0 != -1) {
    dispatch_once(&os_log_cn_once_token_0, &__block_literal_global_1);
  }
  v2 = (void *)os_log_cn_once_object_0;

  return v2;
}

uint64_t __42__CNiOSABFaultFulfillmentPredicate_os_log__block_invoke()
{
  os_log_cn_once_object_0 = (uint64_t)os_log_create("com.apple.contacts", "predicates");

  return MEMORY[0x1F41817F8]();
}

- (CNiOSABFaultFulfillmentPredicate)initWithLegacyIdentifier:(int)a3 identifier:(id)a4
{
  v6 = (NSString *)a4;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABFaultFulfillmentPredicate;
  v7 = [(CNPredicate *)&v10 initWithPredicate:0];
  v7->_legacyIdentifier = a3;
  identifier = v7->_identifier;
  v7->_identifier = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABFaultFulfillmentPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABFaultFulfillmentPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_legacyIdentifier = [v4 decodeInt32ForKey:@"_legacyIdentifier"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABFaultFulfillmentPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_legacyIdentifier, @"_legacyIdentifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_identifier forKey:@"_identifier"];
}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 1;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v13 = 0;
  v8 = [(CNiOSABFaultFulfillmentPredicate *)self cn_copyPeopleInAddressBook:a3 fetchRequest:a4 matchInfos:a5 environment:a6 nserror:&v13];
  id v9 = v13;
  objc_super v10 = v9;
  if (v8)
  {
    id v11 = v8;
  }
  else if (a7)
  {
    *a7 = (__CFError *)v9;
  }

  return (__CFArray *)v8;
}

- (id)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 nserror:(id *)a7
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  if ([(CNiOSABFaultFulfillmentPredicate *)self legacyIdentifier] <= 0)
  {
    v32 = @"CNKeyPaths";
    v31 = @"iOSLegacyIdentifier";
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v33[0] = v19;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

    CNSetError(a7, 400, (uint64_t)v12);
    PersonWithRecordID = 0;
    goto LABEL_9;
  }
  id v11 = +[CN contactPropertiesByKey];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke;
  aBlock[3] = &unk_1E56B3E68;
  id v12 = v11;
  id v29 = v12;
  id v13 = _Block_copy(aBlock);
  v14 = [v10 keysToFetch];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_2;
  v25 = &unk_1E56B3EE0;
  id v15 = v13;
  v26 = self;
  id v27 = v15;
  int v16 = objc_msgSend(v14, "_cn_any:", &v22);

  ABRecordID v17 = [(CNiOSABFaultFulfillmentPredicate *)self legacyIdentifier];
  if (v16)
  {
    PersonWithRecordID = (void *)ABAddressBookGetPersonWithRecordID(a3, v17);
    if (!PersonWithRecordID) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v20 = [(CNiOSABFaultFulfillmentPredicate *)self identifier];
  PersonWithRecordID = (void *)ABAddressBookPrimePersonContextForIdentifier();

  if (PersonWithRecordID)
  {
LABEL_7:
    v30 = PersonWithRecordID;
    PersonWithRecordID = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  }
LABEL_8:

LABEL_9:

  return PersonWithRecordID;
}

BOOL __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 supportsABLazyLoading])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"iOSLegacyIdentifier"];
    BOOL v4 = v5 != v3;
  }
  return v4;
}

BOOL __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  BOOL v4 = objc_msgSend(v3, "_cn_requiredKeys");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_3;
  v12[3] = &unk_1E56B3E90;
  id v13 = *(id *)(a1 + 40);
  v14 = &v15;
  [v4 enumeratePropertiesUsingBlock:v12];

  if (*((unsigned char *)v16 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "_cn_optionalKeys");
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_4;
    v9[3] = &unk_1E56B3EB8;
    uint64_t v7 = *(void **)(a1 + 40);
    v9[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v11 = &v15;
    [v6 enumeratePropertiesUsingBlock:v9];

    BOOL v5 = *((unsigned char *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  return v5;
}

uint64_t __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __107__CNiOSABFaultFulfillmentPredicate_cn_copyPeopleInAddressBook_fetchRequest_matchInfos_environment_nserror___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1909E3000, v6, OS_LOG_TYPE_INFO, "Using the faultfulfillment predicate with optional keys, this may be slow.", v8, 2u);
  }

  int v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForFaultFulfillmentForLegacyIdentifier:identifier:]"];
  id v5 = (id)objc_msgSend(v3, "appendName:intValue:", @"legacyIdentifier", -[CNiOSABFaultFulfillmentPredicate legacyIdentifier](self, "legacyIdentifier"));
  v6 = [(CNiOSABFaultFulfillmentPredicate *)self identifier];
  id v7 = (id)[v3 appendName:@"identifier" object:v6];

  v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke_2;
  id v12 = &unk_1E56B3E18;
  id v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = (int)[*(id *)(a1 + 32) legacyIdentifier];
  uint64_t v4 = (int)[*(id *)(a1 + 40) legacyIdentifier];

  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __44__CNiOSABFaultFulfillmentPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  void aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = (int)[*(id *)(a1 + 32) legacyIdentifier];

  return [v1 integerHash:v2];
}

uint64_t __40__CNiOSABFaultFulfillmentPredicate_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (int)legacyIdentifier
{
  return self->_legacyIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end