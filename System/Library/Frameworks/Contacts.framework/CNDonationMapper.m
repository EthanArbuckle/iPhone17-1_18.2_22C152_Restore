@interface CNDonationMapper
+ (NSString)mapperIdentifier;
+ (id)log;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6;
- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4;
- (BOOL)shouldLogContactsAccess;
- (CNContactsEnvironment)environment;
- (CNDonationMapper)initWithConfiguration:(id)a3;
- (CNDonationMapper)initWithDonationStore:(id)a3 environment:(id)a4;
- (CNDonationStore)donationStore;
- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4;
- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4;
- (id)contactObservableForFetchRequest:(id)a3;
- (id)containersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)defaultContainerIdentifier;
- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4;
- (id)meContactIdentifiers:(id *)a3;
- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4;
- (id)policyWithDescription:(id)a3 error:(id *)a4;
- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4;
- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4;
- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation CNDonationMapper

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 predicate];
  v6 = &unk_1EE08B7C8;
  if ([v5 conformsToProtocol:v6]) {
    v7 = v5;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = [(CNDonationMapper *)self donationStore];
    v10 = [v8 contactsFromDonationStore:v9];

    if ([v10 isRight])
    {
      v11 = [v10 right];
      if ([v11 code] != 1)
      {
        v12 = [v11 domain];
        uint64_t v33 = 0;
        v34 = &v33;
        uint64_t v35 = 0x2020000000;
        v13 = (void *)getCNDonationErrorDomainSymbolLoc_ptr;
        uint64_t v36 = getCNDonationErrorDomainSymbolLoc_ptr;
        if (!getCNDonationErrorDomainSymbolLoc_ptr)
        {
          uint64_t v28 = MEMORY[0x1E4F143A8];
          uint64_t v29 = 3221225472;
          v30 = __getCNDonationErrorDomainSymbolLoc_block_invoke;
          v31 = &unk_1E56B45C0;
          v32 = &v33;
          v14 = (void *)ContactsDonationLibrary();
          v34[3] = (uint64_t)dlsym(v14, "CNDonationErrorDomain");
          getCNDonationErrorDomainSymbolLoc_ptr = *(void *)(v32[1] + 24);
          v13 = (void *)v34[3];
        }
        _Block_object_dispose(&v33, 8);
        if (!v13)
        {
          v22 = (_Unwind_Exception *)-[CNGeminiManager channelIdentifierForMostRecentSMSFromPhoneNumbers:fromChannelIdentifiers:]();
          _Block_object_dispose(&v33, 8);
          _Unwind_Resume(v22);
        }
        char v15 = [v12 isEqualToString:*v13];

        if ((v15 & 1) == 0)
        {
          v16 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[CNDonationMapper contactObservableForFetchRequest:]((uint64_t)v11, v16);
          }
        }
      }
      v17 = [MEMORY[0x1E4F5A480] emptyObservable];
    }
    else
    {
      v11 = [v10 left];
      v18 = objc_msgSend(v11, "_cn_filter:", &__block_literal_global_52_1);
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __53__CNDonationMapper_contactObservableForFetchRequest___block_invoke;
      v26 = &unk_1E56B8CA0;
      id v27 = v8;
      v19 = objc_msgSend(v18, "_cn_map:", &v23);
      v20 = objc_msgSend(v19, "_cn_map:", &__block_literal_global_58_1, v23, v24, v25, v26);
      v17 = [MEMORY[0x1E4F5A480] observableWithResult:v20];
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F5A480] emptyObservable];
  }

  return v17;
}

- (CNDonationStore)donationStore
{
  return self->_donationStore;
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

+ (NSString)mapperIdentifier
{
  return (NSString *)@"CNDonationMapper";
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (CNDonationMapper)initWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v5 = (void *)getCNDonationStoreClass_softClass;
  uint64_t v15 = getCNDonationStoreClass_softClass;
  if (!getCNDonationStoreClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getCNDonationStoreClass_block_invoke;
    v11[3] = &unk_1E56B45C0;
    v11[4] = &v12;
    __getCNDonationStoreClass_block_invoke((uint64_t)v11);
    v5 = (void *)v13[3];
  }
  v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = objc_alloc_init(v6);
  id v8 = [v4 environment];
  v9 = [(CNDonationMapper *)self initWithDonationStore:v7 environment:v8];

  return v9;
}

- (CNDonationMapper)initWithDonationStore:(id)a3 environment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNDonationMapper;
  v9 = [(CNDonationMapper *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a4);
    objc_storeStrong((id *)&v10->_donationStore, a3);
    v11 = v10;
  }

  return v10;
}

+ (id)log
{
  if (log_cn_once_token_0_13 != -1) {
    dispatch_once(&log_cn_once_token_0_13, &__block_literal_global_122);
  }
  v2 = (void *)log_cn_once_object_0_13;

  return v2;
}

uint64_t __23__CNDonationMapper_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.donation", "analytics");
  uint64_t v1 = log_cn_once_object_0_13;
  log_cn_once_object_0_13 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

id __53__CNDonationMapper_contactObservableForFetchRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNDonatedContactSanitizer sanitizeDonatedContact:a2 matchingPredicate:*(void *)(a1 + 32)];
}

- (id)meContactIdentifiers:(id *)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"2D0447ED-BB88-45F9-909B-EB36C6920675";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  return 1;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(CNPolicyDescription);
  [(CNPolicyDescription *)v7 setContainerIdentifier:v6];

  id v8 = [(CNDonationMapper *)self policyWithDescription:v7 error:a4];

  return v8;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)defaultContainerIdentifier
{
  return 0;
}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  return &unk_1EE089440;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationStore, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)contactObservableForFetchRequest:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "Error retrieving contacts from daemon: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end