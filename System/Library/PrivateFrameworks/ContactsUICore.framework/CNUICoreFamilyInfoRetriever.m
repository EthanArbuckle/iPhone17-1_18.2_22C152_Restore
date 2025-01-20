@interface CNUICoreFamilyInfoRetriever
+ (NSArray)keysToFetch;
+ (id)contactsMatchingFamilyMember:(id)a3 inContactStore:(id)a4;
+ (id)familyCircleFromRequest:(id)a3 schedulerProvider:(id)a4;
+ (id)familyInfoWithFamilyMembers:(id)a3 meContact:(id)a4;
+ (id)familyInfoWithFamilyMembers:(id)a3 meContact:(id)a4 matchedWithContactsInContactStore:(id)a5;
+ (id)meContactFromStore:(id)a3 schedulerProvider:(id)a4;
- (BOOL)matchFamilyMembersWithContacts;
- (CNFuture)familyFuture;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactStoreFacade)mainContactStore;
- (CNUICoreFamilyInfoRetriever)init;
- (CNUICoreFamilyInfoRetriever)initWithMainContactStoreFacade:(id)a3 fetchFamilyCircleRequest:(id)a4 matchFamilyMembersWithContacts:(BOOL)a5 schedulerProvider:(id)a6;
- (CNUICoreFamilyInfoRetriever)initWithMainContactStoreFacade:(id)a3 matchFamilyMembersWithContacts:(BOOL)a4 schedulerProvider:(id)a5;
- (FAFetchFamilyCircleRequest)fetchFamilyCircleRequest;
- (id)createFamilyFuture;
- (id)familyInfo;
- (void)setFamilyFuture:(id)a3;
@end

@implementation CNUICoreFamilyInfoRetriever

+ (NSArray)keysToFetch
{
  return +[CNUICoreContactTypeAssessor keysToFetch];
}

- (CNUICoreFamilyInfoRetriever)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyInfoRetriever)initWithMainContactStoreFacade:(id)a3 matchFamilyMembersWithContacts:(BOOL)a4 schedulerProvider:(id)a5
{
  BOOL v5 = a4;
  v8 = (objc_class *)MEMORY[0x263F3BF48];
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(v8);
  [v11 setPromptUserToResolveAuthenticatonFailure:0];
  v12 = [(CNUICoreFamilyInfoRetriever *)self initWithMainContactStoreFacade:v10 fetchFamilyCircleRequest:v11 matchFamilyMembersWithContacts:v5 schedulerProvider:v9];

  return v12;
}

- (CNUICoreFamilyInfoRetriever)initWithMainContactStoreFacade:(id)a3 fetchFamilyCircleRequest:(id)a4 matchFamilyMembersWithContacts:(BOOL)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_12 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_12, &__block_literal_global_133_0);
  }
  v14 = CNGuardOSLog_cn_once_object_0_12;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_12, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:fetchFamilyCircleRequest:matchFamilyMembersWithContacts:schedulerProvider:](v14, v15, v16, v17, v18, v19, v20, v21);
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
  if (CNGuardOSLog_cn_once_token_0_12 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_12, &__block_literal_global_133_0);
  }
  v22 = CNGuardOSLog_cn_once_object_0_12;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_12, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyInfoRetriever initWithMainContactStoreFacade:fetchFamilyCircleRequest:matchFamilyMembersWithContacts:schedulerProvider:](v22, v23, v24, v25, v26, v27, v28, v29);
  }
LABEL_10:
  if (!v13)
  {
    if (CNGuardOSLog_cn_once_token_0_12 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_12, &__block_literal_global_133_0);
    }
    v30 = CNGuardOSLog_cn_once_object_0_12;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_12, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberContactsModelRetriever initWithContactStoreFacade:familyInfoFetcher:downtimeContainerFetcher:schedulerProvider:](v30, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)CNUICoreFamilyInfoRetriever;
  v38 = [(CNUICoreFamilyInfoRetriever *)&v42 init];
  v39 = v38;
  if (v38)
  {
    objc_storeStrong((id *)&v38->_mainContactStore, a3);
    objc_storeStrong((id *)&v39->_fetchFamilyCircleRequest, a4);
    v39->_matchFamilyMembersWithContacts = a5;
    objc_storeStrong((id *)&v39->_schedulerProvider, a6);
    v40 = v39;
  }

  return v39;
}

- (id)familyInfo
{
  v2 = cn_objectResultWithObjectLock();
  return v2;
}

id __41__CNUICoreFamilyInfoRetriever_familyInfo__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[5];
  if (!v3)
  {
    uint64_t v4 = [v2 createFamilyFuture];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  return v3;
}

- (id)createFamilyFuture
{
  v18[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(CNUICoreFamilyInfoRetriever *)self matchFamilyMembersWithContacts];
  uint64_t v4 = [(CNUICoreFamilyInfoRetriever *)self schedulerProvider];
  uint64_t v5 = [(CNUICoreFamilyInfoRetriever *)self mainContactStore];
  v6 = [(id)objc_opt_class() meContactFromStore:v5 schedulerProvider:v4];
  v18[0] = v6;
  v7 = objc_opt_class();
  v8 = [(CNUICoreFamilyInfoRetriever *)self fetchFamilyCircleRequest];
  id v9 = [v7 familyCircleFromRequest:v8 schedulerProvider:v4];
  v18[1] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

  id v11 = [MEMORY[0x263F335E0] join:v10];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__CNUICoreFamilyInfoRetriever_createFamilyFuture__block_invoke;
  v15[3] = &unk_2640188F0;
  BOOL v17 = v3;
  id v16 = v5;
  id v12 = v5;
  id v13 = [v11 flatMap:v15 schedulerProvider:v4];

  return v13;
}

id __49__CNUICoreFamilyInfoRetriever_createFamilyFuture__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = [v3 lastObject];

  v6 = [v5 members];
  v7 = [MEMORY[0x263EFF9D0] null];

  if (v4 == v7)
  {

    uint64_t v4 = 0;
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {

    v6 = (void *)MEMORY[0x263EFFA68];
  }
  v8 = (void *)MEMORY[0x263F335E0];
  if (*(unsigned char *)(a1 + 40)) {
    +[CNUICoreFamilyInfoRetriever familyInfoWithFamilyMembers:v6 meContact:v4 matchedWithContactsInContactStore:*(void *)(a1 + 32)];
  }
  else {
  id v9 = +[CNUICoreFamilyInfoRetriever familyInfoWithFamilyMembers:v6 meContact:v4];
  }
  id v10 = [v8 futureWithResult:v9];

  return v10;
}

+ (id)meContactFromStore:(id)a3 schedulerProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x263F08B88] isMainThread]) {
    [v6 backgroundScheduler];
  }
  else {
  v7 = [v6 immediateScheduler];
  }
  v8 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__CNUICoreFamilyInfoRetriever_meContactFromStore_schedulerProvider___block_invoke;
  v13[3] = &unk_264018918;
  id v14 = v5;
  id v9 = v5;
  id v10 = [v8 futureWithBlock:v13 scheduler:v7 schedulerProvider:v6];
  id v11 = [v10 recover:&__block_literal_global_41 schedulerProvider:v6];

  return v11;
}

id __68__CNUICoreFamilyInfoRetriever_meContactFromStore_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = +[CNUICoreFamilyInfoRetriever keysToFetch];
  id v10 = 0;
  id v5 = [v3 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v10];
  id v6 = v10;

  (*(void (**)(void))(*MEMORY[0x263F33500] + 16))();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a2 && !v7) {
    *a2 = v6;
  }

  return v8;
}

id __68__CNUICoreFamilyInfoRetriever_meContactFromStore_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUIDowntimeLogger sharedLogger];
  [v3 logFetchingMeError:v2];

  uint64_t v4 = (void *)MEMORY[0x263F335E0];
  id v5 = [MEMORY[0x263EFF9D0] null];
  id v6 = [v4 futureWithResult:v5];

  return v6;
}

+ (id)familyCircleFromRequest:(id)a3 schedulerProvider:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263F33630];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithSchedulerProvider:v6];
  id v9 = [v8 completionHandlerAdapter];
  [v7 startRequestWithCompletionHandler:v9];

  id v10 = [v8 future];
  id v11 = [v10 recover:&__block_literal_global_31 schedulerProvider:v6];

  return v11;
}

id __73__CNUICoreFamilyInfoRetriever_familyCircleFromRequest_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[CNUIDowntimeLogger sharedLogger];
  [v3 logFetchingFamilyCircleError:v2];

  uint64_t v4 = (void *)MEMORY[0x263F335E0];
  id v5 = objc_alloc_init(MEMORY[0x263F3BF08]);
  id v6 = [v4 futureWithResult:v5];

  return v6;
}

+ (id)familyInfoWithFamilyMembers:(id)a3 meContact:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(a3, "_cn_map:", &__block_literal_global_35_1);
  id v7 = [[CNUICoreFamilyInfo alloc] initWithMeContact:v5 elements:v6];

  return v7;
}

CNUICoreFamilyElement *__69__CNUICoreFamilyInfoRetriever_familyInfoWithFamilyMembers_meContact___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [CNUICoreFamilyElement alloc];
  uint64_t v4 = [(CNUICoreFamilyElement *)v3 initWithFamilyMember:v2 matchingContacts:MEMORY[0x263EFFA68]];

  return v4;
}

+ (id)familyInfoWithFamilyMembers:(id)a3 meContact:(id)a4 matchedWithContactsInContactStore:(id)a5
{
  id v8 = a5;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  BOOL v17 = __103__CNUICoreFamilyInfoRetriever_familyInfoWithFamilyMembers_meContact_matchedWithContactsInContactStore___block_invoke;
  uint64_t v18 = &unk_264018980;
  id v19 = v8;
  id v20 = a1;
  id v9 = v8;
  id v10 = a4;
  id v11 = objc_msgSend(a3, "_cn_map:", &v15);
  id v12 = [CNUICoreFamilyInfo alloc];
  id v13 = -[CNUICoreFamilyInfo initWithMeContact:elements:](v12, "initWithMeContact:elements:", v10, v11, v15, v16, v17, v18);

  return v13;
}

CNUICoreFamilyElement *__103__CNUICoreFamilyInfoRetriever_familyInfoWithFamilyMembers_meContact_matchedWithContactsInContactStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [CNUICoreFamilyElement alloc];
  id v5 = [*(id *)(a1 + 40) contactsMatchingFamilyMember:v3 inContactStore:*(void *)(a1 + 32)];
  id v6 = [(CNUICoreFamilyElement *)v4 initWithFamilyMember:v3 matchingContacts:v5];

  return v6;
}

+ (id)contactsMatchingFamilyMember:(id)a3 inContactStore:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFEA18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = +[CNUICoreFamilyInfoRetriever keysToFetch];
  id v10 = (void *)[v8 initWithKeysToFetch:v9];

  [v10 setUnifyResults:0];
  id v11 = (void *)MEMORY[0x263EFE9F8];
  id v12 = +[CNUICoreContactMatcher nameFromFammilyMember:v7];

  id v13 = [v11 predicateForContactsMatchingName:v12];
  [v10 setPredicate:v13];

  id v14 = +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:v10 fromStore:v6];

  if ([v14 isSuccess])
  {
    uint64_t v15 = [v14 value];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263EFFA68];
  }

  return v15;
}

- (CNUICoreContactStoreFacade)mainContactStore
{
  return self->_mainContactStore;
}

- (FAFetchFamilyCircleRequest)fetchFamilyCircleRequest
{
  return self->_fetchFamilyCircleRequest;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (BOOL)matchFamilyMembersWithContacts
{
  return self->_matchFamilyMembersWithContacts;
}

- (CNFuture)familyFuture
{
  return self->_familyFuture;
}

- (void)setFamilyFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyFuture, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_fetchFamilyCircleRequest, 0);
  objc_storeStrong((id *)&self->_mainContactStore, 0);
}

- (void)initWithMainContactStoreFacade:(uint64_t)a3 fetchFamilyCircleRequest:(uint64_t)a4 matchFamilyMembersWithContacts:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMainContactStoreFacade:(uint64_t)a3 fetchFamilyCircleRequest:(uint64_t)a4 matchFamilyMembersWithContacts:(uint64_t)a5 schedulerProvider:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end