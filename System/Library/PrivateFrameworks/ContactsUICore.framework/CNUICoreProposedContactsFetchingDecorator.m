@interface CNUICoreProposedContactsFetchingDecorator
+ (id)modelWithProposedContactsFromFamilyInfo:(id)a3;
+ (id)proposedContactsFromFamilyInfo:(id)a3;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreFamilyInfoFetching)familyInfoFetcher;
- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher;
- (CNUICoreProposedContactsFetchingDecorator)initWithModelFetcher:(id)a3 familyInfoFetcher:(id)a4 schedulerProvider:(id)a5;
- (CNUICoreProposedContactsFetchingDecorator)initWithModelFetcher:(id)a3 familyMember:(id)a4 schedulerProvider:(id)a5;
- (id)allContactsModel;
- (id)whitelistedContactsModel;
@end

@implementation CNUICoreProposedContactsFetchingDecorator

- (CNUICoreProposedContactsFetchingDecorator)initWithModelFetcher:(id)a3 familyMember:(id)a4 schedulerProvider:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [CNUICoreContactStoreProductionFacade alloc];
  id v10 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v11 = [(CNUICoreContactStoreProductionFacade *)v9 initWithContactStore:v10];

  v12 = [[CNUICoreFamilyInfoRetriever alloc] initWithMainContactStoreFacade:v11 matchFamilyMembersWithContacts:1 schedulerProvider:v7];
  v13 = [(CNUICoreProposedContactsFetchingDecorator *)self initWithModelFetcher:v8 familyInfoFetcher:v12 schedulerProvider:v7];

  return v13;
}

- (CNUICoreProposedContactsFetchingDecorator)initWithModelFetcher:(id)a3 familyInfoFetcher:(id)a4 schedulerProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_23 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_23, &__block_literal_global_86);
  }
  v12 = CNGuardOSLog_cn_once_object_0_23;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_23, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreProposedContactsFetchingDecorator initWithModelFetcher:familyInfoFetcher:schedulerProvider:](v12, v13, v14, v15, v16, v17, v18, v19);
    if (v10) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v10) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_23 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_23, &__block_literal_global_86);
  }
  v20 = CNGuardOSLog_cn_once_object_0_23;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_23, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](v20, v21, v22, v23, v24, v25, v26, v27);
  }
LABEL_10:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_23 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_23, &__block_literal_global_86);
    }
    v28 = CNGuardOSLog_cn_once_object_0_23;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_23, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)CNUICoreProposedContactsFetchingDecorator;
  v36 = [(CNUICoreProposedContactsFetchingDecorator *)&v40 init];
  v37 = v36;
  if (v36)
  {
    objc_storeStrong((id *)&v36->_modelFetcher, a3);
    objc_storeStrong((id *)&v37->_familyInfoFetcher, a4);
    objc_storeStrong((id *)&v37->_schedulerProvider, a5);
    v38 = v37;
  }

  return v37;
}

- (id)allContactsModel
{
  v2 = [(CNUICoreProposedContactsFetchingDecorator *)self modelFetcher];
  v3 = [v2 allContactsModel];

  return v3;
}

- (id)whitelistedContactsModel
{
  v3 = [(CNUICoreProposedContactsFetchingDecorator *)self modelFetcher];
  v4 = [v3 whitelistedContactsModel];

  v5 = [(CNUICoreProposedContactsFetchingDecorator *)self familyInfoFetcher];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__CNUICoreProposedContactsFetchingDecorator_whitelistedContactsModel__block_invoke;
  v10[3] = &unk_2640195E0;
  id v11 = v5;
  id v6 = v5;
  id v7 = [(CNUICoreProposedContactsFetchingDecorator *)self schedulerProvider];
  id v8 = [v4 flatMap:v10 schedulerProvider:v7];

  return v8;
}

id __69__CNUICoreProposedContactsFetchingDecorator_whitelistedContactsModel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F334B0];
  v5 = [v3 items];
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) familyInfo];
    id v7 = [v6 result:0];

    id v8 = +[CNUICoreProposedContactsFetchingDecorator modelWithProposedContactsFromFamilyInfo:v7];
    id v9 = [v3 items];
    id v10 = [v8 items];
    id v11 = [v9 arrayByAddingObjectsFromArray:v10];

    v12 = (void *)MEMORY[0x263F335E0];
    uint64_t v13 = [[CNUICoreFamilyMemberContactsModel alloc] initWithItems:v11];
    uint64_t v14 = [v12 futureWithResult:v13];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F335E0] futureWithResult:v3];
  }

  return v14;
}

+ (id)modelWithProposedContactsFromFamilyInfo:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CNUICoreFamilyMemberContactsModelBuilder);
  id v6 = [a1 proposedContactsFromFamilyInfo:v4];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v5 setContacts:v6];

  id v7 = [[CNUICoreContactTypeAssessor alloc] initWithFamilyInfo:v4];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v5 setContactTypeAssessor:v7];

  [(CNUICoreFamilyMemberContactsModelBuilder *)v5 setContactFormatterStyle:+[CNUICoreFamilyMemberContactsModelRetriever contactFormatterStyle]];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v5 setSortItemsByName:1];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v5 setMarkItemsAsProposed:1];
  [(CNUICoreFamilyMemberContactsModelBuilder *)v5 setMarkItemsAsPersisted:0];
  id v8 = [(CNUICoreFamilyMemberContactsModelBuilder *)v5 build];

  return v8;
}

+ (id)proposedContactsFromFamilyInfo:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  v5 = [v3 meContact];

  if (v5)
  {
    id v6 = [v3 meContact];
    [v4 addObject:v6];
  }
  uint64_t v7 = *MEMORY[0x263F334B0];
  id v8 = [v3 elements];
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((v7 & 1) == 0)
  {
    id v9 = [v3 elements];
    id v10 = objc_msgSend(v9, "_cn_filter:", &__block_literal_global_13_1);
    id v11 = objc_msgSend(v10, "_cn_compactMap:", &__block_literal_global_75);
    [v4 addObjectsFromArray:v11];
  }
  return v4;
}

- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher
{
  return self->_modelFetcher;
}

- (CNUICoreFamilyInfoFetching)familyInfoFetcher
{
  return self->_familyInfoFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_familyInfoFetcher, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
}

- (void)initWithModelFetcher:(uint64_t)a3 familyInfoFetcher:(uint64_t)a4 schedulerProvider:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end