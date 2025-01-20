@interface CNUICoreFamilyMemberContactsModelRetriever
+ (NSArray)keysToFetch;
+ (int64_t)contactFormatterStyle;
- (CNDowntimeWhitelistContainerFetching)downtimeContainerFetcher;
- (CNScheduler)backgroundOrImmediateScheduler;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactStoreFacade)contactStore;
- (CNUICoreFamilyInfoFetching)familyInfoFetcher;
- (CNUICoreFamilyMemberContactsModelRetriever)init;
- (CNUICoreFamilyMemberContactsModelRetriever)initWithContactStoreFacade:(id)a3 familyInfoFetcher:(id)a4 downtimeContainerFetcher:(id)a5 schedulerProvider:(id)a6;
- (CNUICoreFamilyMemberContactsModelRetriever)initWithDowntimeContainerFetcher:(id)a3 schedulerProvider:(id)a4;
- (CNUICoreFamilyMemberContactsModelRetriever)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4;
- (id)allContacts;
- (id)allContactsModel;
- (id)modelBuilderForContacts:(id)a3 familyInfo:(id)a4;
- (id)modelBuilderForWhitelistedContacts:(id)a3 familyInfo:(id)a4;
- (id)whitelistedContactsModel;
@end

@implementation CNUICoreFamilyMemberContactsModelRetriever

+ (int64_t)contactFormatterStyle
{
  return 0;
}

+ (NSArray)keysToFetch
{
  v11[9] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263EFEA20], "descriptorForRequiredKeysForStyle:", objc_msgSend(a1, "contactFormatterStyle"));
  v3 = +[CNUICoreFamilyInfoRetriever keysToFetch];
  uint64_t v4 = *MEMORY[0x263EFDFF8];
  v11[1] = v3;
  v11[2] = v4;
  uint64_t v5 = *MEMORY[0x263EFDF60];
  v11[3] = *MEMORY[0x263EFE140];
  v11[4] = v5;
  uint64_t v6 = *MEMORY[0x263EFE070];
  v11[5] = *MEMORY[0x263EFDFF0];
  v11[6] = v6;
  uint64_t v7 = *MEMORY[0x263EFDF78];
  v11[7] = *MEMORY[0x263EFDF80];
  v11[8] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:9];
  v9 = objc_msgSend(v8, "_cn_flatten");

  return (NSArray *)v9;
}

- (CNUICoreFamilyMemberContactsModelRetriever)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsModelRetriever)initWithDowntimeContainerFetcher:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  id v9 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v10 = [(CNUICoreContactStoreProductionFacade *)v8 initWithContactStore:v9];

  v11 = [[CNUICoreFamilyInfoRetriever alloc] initWithMainContactStoreFacade:v10 matchFamilyMembersWithContacts:0 schedulerProvider:v6];
  v12 = [(CNUICoreFamilyMemberContactsModelRetriever *)self initWithContactStoreFacade:v10 familyInfoFetcher:v11 downtimeContainerFetcher:v7 schedulerProvider:v6];

  return v12;
}

- (CNUICoreFamilyMemberContactsModelRetriever)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  id v9 = [MEMORY[0x263EFEA58] storeForFamilyMember:v7];

  v10 = [(CNUICoreContactStoreProductionFacade *)v8 initWithContactStore:v9];
  v11 = [CNUICoreContactStoreProductionFacade alloc];
  id v12 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v13 = [(CNUICoreContactStoreProductionFacade *)v11 initWithContactStore:v12];

  v14 = [[CNUICoreFamilyInfoRetriever alloc] initWithMainContactStoreFacade:v13 matchFamilyMembersWithContacts:0 schedulerProvider:v6];
  v15 = [(CNUICoreFamilyMemberContactsModelRetriever *)self initWithContactStoreFacade:v10 familyInfoFetcher:v14 downtimeContainerFetcher:0 schedulerProvider:v6];

  return v15;
}

- (CNUICoreFamilyMemberContactsModelRetriever)initWithContactStoreFacade:(id)a3 familyInfoFetcher:(id)a4 downtimeContainerFetcher:(id)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_106);
  }
  v15 = CNGuardOSLog_cn_once_object_0_3;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreContactRefetcher initWithContactStore:contactsToRefetch:keysToFetch:](v15, v16, v17, v18, v19, v20, v21, v22);
    if (v12) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v12) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_106);
  }
  v23 = CNGuardOSLog_cn_once_object_0_3;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](v23, v24, v25, v26, v27, v28, v29, v30);
  }
LABEL_10:
  if (!v14)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_106);
    }
    v31 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  v43.receiver = self;
  v43.super_class = (Class)CNUICoreFamilyMemberContactsModelRetriever;
  v39 = [(CNUICoreFamilyMemberContactsModelRetriever *)&v43 init];
  v40 = v39;
  if (v39)
  {
    objc_storeStrong((id *)&v39->_contactStore, a3);
    objc_storeStrong((id *)&v40->_familyInfoFetcher, a4);
    objc_storeStrong((id *)&v40->_downtimeContainerFetcher, a5);
    objc_storeStrong((id *)&v40->_schedulerProvider, a6);
    v41 = v40;
  }

  return v40;
}

- (CNScheduler)backgroundOrImmediateScheduler
{
  char v3 = [MEMORY[0x263F08B88] isMainThread];
  uint64_t v4 = [(CNUICoreFamilyMemberContactsModelRetriever *)self schedulerProvider];
  uint64_t v5 = v4;
  if (v3) {
    [v4 backgroundScheduler];
  }
  else {
  id v6 = [v4 immediateScheduler];
  }

  return (CNScheduler *)v6;
}

- (id)whitelistedContactsModel
{
  char v3 = [(CNUICoreFamilyMemberContactsModelRetriever *)self familyInfoFetcher];
  uint64_t v4 = [(CNUICoreFamilyMemberContactsModelRetriever *)self allContacts];
  uint64_t v9 = MEMORY[0x263EF8330];
  id v10 = v3;
  id v5 = v3;
  id v6 = [(CNUICoreFamilyMemberContactsModelRetriever *)self schedulerProvider];
  id v7 = [v4 flatMap:&v9 schedulerProvider:v6];

  return v7;
}

id __70__CNUICoreFamilyMemberContactsModelRetriever_whitelistedContactsModel__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  char v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 familyInfo];
  id v6 = [v2 modelBuilderForWhitelistedContacts:v4 familyInfo:v5];

  id v7 = [v6 build];
  v8 = [MEMORY[0x263F335E0] futureWithResult:v7];

  return v8;
}

- (id)allContacts
{
  char v3 = [(CNUICoreFamilyMemberContactsModelRetriever *)self contactStore];
  id v4 = (void *)MEMORY[0x263F335E0];
  uint64_t v10 = MEMORY[0x263EF8330];
  id v11 = v3;
  id v5 = v3;
  id v6 = [(CNUICoreFamilyMemberContactsModelRetriever *)self backgroundOrImmediateScheduler];
  id v7 = [(CNUICoreFamilyMemberContactsModelRetriever *)self schedulerProvider];
  v8 = [v4 futureWithBlock:&v10 scheduler:v6 schedulerProvider:v7];

  return v8;
}

id __57__CNUICoreFamilyMemberContactsModelRetriever_allContacts__block_invoke(uint64_t a1, void *a2)
{
  id v4 = objc_alloc(MEMORY[0x263EFEA18]);
  id v5 = [(id)objc_opt_class() keysToFetch];
  id v6 = (void *)[v4 initWithKeysToFetch:v5];

  [v6 setUnifyResults:0];
  id v7 = [*(id *)(a1 + 32) downtimeContainerFetcher];

  if (!v7) {
    goto LABEL_4;
  }
  v8 = [*(id *)(a1 + 32) downtimeContainerFetcher];
  uint64_t v9 = [v8 downtimeWhitelistContainer];

  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263EFE9F8];
    id v11 = [v9 identifier];
    id v12 = [v10 predicateForContactsInContainerWithIdentifier:v11];
    [v6 setPredicate:v12];

LABEL_4:
    id v13 = +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:v6 fromStore:*(void *)(a1 + 40)];
    id v14 = [v13 value];

    if (v14)
    {
      v15 = [v13 value];
      goto LABEL_12;
    }
    uint64_t v16 = [v13 error];
    uint64_t v17 = v16;
    if (a2) {
      *a2 = v16;
    }

    goto LABEL_11;
  }
  uint64_t v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFE180] code:1008 userInfo:0];
  id v13 = v18;
  if (a2)
  {
    v15 = 0;
    *a2 = v18;
    goto LABEL_12;
  }
LABEL_11:
  v15 = 0;
LABEL_12:

  return v15;
}

- (id)modelBuilderForWhitelistedContacts:(id)a3 familyInfo:(id)a4
{
  id v4 = [(CNUICoreFamilyMemberContactsModelRetriever *)self modelBuilderForContacts:a3 familyInfo:a4];
  [v4 setIncludeWhitelistedContactsOnly:1];
  return v4;
}

- (id)modelBuilderForContacts:(id)a3 familyInfo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(CNUICoreFamilyMemberContactsModelBuilder);
  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setContacts:v6];

  v8 = [[CNUICoreContactTypeAssessor alloc] initWithFamilyInfoFuture:v5];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setContactTypeAssessor:v8];

  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setContactFormatterStyle:+[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle]];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v7 setSortItemsByName:1];
  return v7;
}

- (id)allContactsModel
{
  char v3 = [(CNUICoreFamilyMemberContactsModelRetriever *)self familyInfoFetcher];
  id v4 = [(CNUICoreFamilyMemberContactsModelRetriever *)self allContacts];
  uint64_t v9 = MEMORY[0x263EF8330];
  id v10 = v3;
  id v5 = v3;
  id v6 = [(CNUICoreFamilyMemberContactsModelRetriever *)self schedulerProvider];
  id v7 = [v4 flatMap:&v9 schedulerProvider:v6];

  return v7;
}

id __62__CNUICoreFamilyMemberContactsModelRetriever_allContactsModel__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  char v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 familyInfo];
  id v6 = [v2 modelBuilderForContacts:v4 familyInfo:v5];

  id v7 = [v6 build];
  v8 = [MEMORY[0x263F335E0] futureWithResult:v7];

  return v8;
}

- (CNUICoreContactStoreFacade)contactStore
{
  return self->_contactStore;
}

- (CNUICoreFamilyInfoFetching)familyInfoFetcher
{
  return self->_familyInfoFetcher;
}

- (CNDowntimeWhitelistContainerFetching)downtimeContainerFetcher
{
  return self->_downtimeContainerFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_downtimeContainerFetcher, 0);
  objc_storeStrong((id *)&self->_familyInfoFetcher, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithContactStoreFacade:(uint64_t)a3 familyInfoFetcher:(uint64_t)a4 downtimeContainerFetcher:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithContactStoreFacade:(uint64_t)a3 familyInfoFetcher:(uint64_t)a4 downtimeContainerFetcher:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end