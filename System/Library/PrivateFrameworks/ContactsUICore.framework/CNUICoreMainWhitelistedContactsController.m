@interface CNUICoreMainWhitelistedContactsController
+ (id)controllerWithOptions:(id)a3 schedulerProvider:(id)a4;
- (BOOL)familyMemberContainerIsEmpty;
- (BOOL)hasDowntimeWhitelistContainer;
- (CNCancelable)contactStoreDidChangeToken;
- (CNDowntimeWhitelistContainerFetching)downtimeContainerFetcher;
- (CNFuture)addContactsToWhitelistFuture;
- (CNFuture)deleteContactsFromWhitelistFuture;
- (CNFuture)familyMemberContactItemsFuture;
- (CNFuture)updateContactsInWhitelistFuture;
- (CNScheduler)backgroundOrImmediateScheduler;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactStoreFacade)mainContactStoreFacade;
- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher;
- (CNUICoreFamilyMemberContactsObserver)observer;
- (CNUICoreMainWhitelistedContactsController)init;
- (CNUICoreMainWhitelistedContactsController)initWithModelFetcher:(id)a3 mainContactStoreFacade:(id)a4 downtimeContainerFetcher:(id)a5 schedulerProvider:(id)a6;
- (CNUICoreMainWhitelistedContactsController)initWiththOptions:(id)a3 mainContactStoreFacade:(id)a4 schedulerProvider:(id)a5;
- (NSArray)familyMemberContactItems;
- (id)contactItemFutureFromFetcher;
- (id)contactRepresentingItem:(id)a3;
- (int64_t)fetchStatus;
- (void)cancelContactItemsFetch;
- (void)dealloc;
- (void)setAddContactsToWhitelistFuture:(id)a3;
- (void)setDeleteContactsFromWhitelistFuture:(id)a3;
- (void)setFamilyMemberContactItems:(id)a3;
- (void)setFamilyMemberContactItemsFuture:(id)a3;
- (void)setObserver:(id)a3;
- (void)setUpdateContactsInWhitelistFuture:(id)a3;
- (void)setupChangeNotificationResponse;
- (void)triggerContactItemsFetch;
- (void)updateWhitelistByAddingContacts:(id)a3;
- (void)updateWhitelistByRemovingContacts:(id)a3;
- (void)updateWhitelistByUpdatingContacts:(id)a3;
@end

@implementation CNUICoreMainWhitelistedContactsController

+ (id)controllerWithOptions:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  id v9 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v10 = [(CNUICoreContactStoreProductionFacade *)v8 initWithContactStore:v9];

  v11 = (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)[objc_alloc((Class)a1) initWiththOptions:v7 mainContactStoreFacade:v10 schedulerProvider:v6];
  LODWORD(v9) = [v7 shouldRequireConfirmationOfChanges];

  if (v9)
  {
    v12 = [[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator alloc] initWithDataSource:v11 schedulerProvider:v6];

    v11 = v12;
  }

  return v11;
}

- (CNUICoreMainWhitelistedContactsController)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreMainWhitelistedContactsController)initWiththOptions:(id)a3 mainContactStoreFacade:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x263EFEA90];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  v13 = [[CNUICoreFamilyMemberContactsModelRetriever alloc] initWithDowntimeContainerFetcher:v12 schedulerProvider:v9];
  int v14 = [v11 shouldPrepopulateEmptyWhitelist];

  if (v14)
  {
    v15 = [[CNUICoreFamilyInfoRetriever alloc] initWithMainContactStoreFacade:v8 matchFamilyMembersWithContacts:1 schedulerProvider:v9];
    v16 = [[CNUICoreProposedContactsFetchingDecorator alloc] initWithModelFetcher:v13 familyInfoFetcher:v15 schedulerProvider:v9];

    v13 = (CNUICoreFamilyMemberContactsModelRetriever *)v16;
  }
  v17 = [(CNUICoreMainWhitelistedContactsController *)self initWithModelFetcher:v13 mainContactStoreFacade:v8 downtimeContainerFetcher:v12 schedulerProvider:v9];

  return v17;
}

- (CNUICoreMainWhitelistedContactsController)initWithModelFetcher:(id)a3 mainContactStoreFacade:(id)a4 downtimeContainerFetcher:(id)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_19 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_175);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.5();
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
  if (CNGuardOSLog_cn_once_token_0_19 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_175);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreMainWhitelistedContactsController initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:]();
  }
  if (v13) {
    goto LABEL_14;
  }
LABEL_10:
  if (CNGuardOSLog_cn_once_token_0_19 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_175);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreMainWhitelistedContactsController initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:]();
    if (v14) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_14:
    if (v14) {
      goto LABEL_19;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_19 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_19, &__block_literal_global_175);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_19, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
  }
LABEL_19:
  v20.receiver = self;
  v20.super_class = (Class)CNUICoreMainWhitelistedContactsController;
  v15 = [(CNUICoreMainWhitelistedContactsController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_modelFetcher, a3);
    objc_storeStrong((id *)&v16->_mainContactStoreFacade, a4);
    objc_storeStrong((id *)&v16->_downtimeContainerFetcher, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    familyMemberContactItems = v16->_familyMemberContactItems;
    v16->_familyMemberContactItems = (NSArray *)MEMORY[0x263EFFA68];

    [(CNUICoreMainWhitelistedContactsController *)v16 setupChangeNotificationResponse];
    v18 = v16;
  }

  return v16;
}

- (void)setupChangeNotificationResponse
{
  id v3 = (void *)MEMORY[0x263F33608];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [v3 observableOnNotificationCenter:v4 withName:*MEMORY[0x263EFE118] object:0];

  id v6 = [(CNSchedulerProvider *)self->_schedulerProvider mainThreadScheduler];
  id v7 = [v5 observeOn:v6];

  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x263F33610];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __76__CNUICoreMainWhitelistedContactsController_setupChangeNotificationResponse__block_invoke;
  v15 = &unk_264018430;
  objc_copyWeak(&v16, &location);
  id v9 = [v8 observerWithResultBlock:&v12];
  objc_msgSend(v7, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (CNCancelable *)objc_claimAutoreleasedReturnValue();
  contactStoreDidChangeToken = self->_contactStoreDidChangeToken;
  self->_contactStoreDidChangeToken = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__CNUICoreMainWhitelistedContactsController_setupChangeNotificationResponse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained triggerContactItemsFetch];
}

- (void)dealloc
{
  [(CNUICoreMainWhitelistedContactsController *)self cancelContactItemsFetch];
  [(CNCancelable *)self->_contactStoreDidChangeToken cancel];
  [(CNFuture *)self->_addContactsToWhitelistFuture cancel];
  [(CNFuture *)self->_updateContactsInWhitelistFuture cancel];
  [(CNFuture *)self->_deleteContactsFromWhitelistFuture cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNUICoreMainWhitelistedContactsController;
  [(CNUICoreMainWhitelistedContactsController *)&v3 dealloc];
}

- (CNScheduler)backgroundOrImmediateScheduler
{
  char v3 = [MEMORY[0x263F08B88] isMainThread];
  v4 = [(CNUICoreMainWhitelistedContactsController *)self schedulerProvider];
  v5 = v4;
  if (v3) {
    [v4 backgroundScheduler];
  }
  else {
  id v6 = [v4 immediateScheduler];
  }

  return (CNScheduler *)v6;
}

- (int64_t)fetchStatus
{
  char v3 = [(CNUICoreMainWhitelistedContactsController *)self familyMemberContactItemsFuture];

  if (!v3) {
    return 0;
  }
  v4 = [(CNUICoreMainWhitelistedContactsController *)self familyMemberContactItemsFuture];
  int v5 = [v4 isFinished];

  if (!v5) {
    return 2;
  }
  id v6 = [(CNUICoreMainWhitelistedContactsController *)self downtimeContainerFetcher];
  id v7 = [v6 downtimeWhitelistContainer];

  if (v7) {
    return 3;
  }
  else {
    return 1;
  }
}

- (NSArray)familyMemberContactItems
{
  char v3 = [(CNUICoreMainWhitelistedContactsController *)self familyMemberContactItemsFuture];

  if (!v3) {
    [(CNUICoreMainWhitelistedContactsController *)self triggerContactItemsFetch];
  }
  familyMemberContactItems = self->_familyMemberContactItems;
  return familyMemberContactItems;
}

- (BOOL)familyMemberContainerIsEmpty
{
  return 0;
}

- (BOOL)hasDowntimeWhitelistContainer
{
  v2 = [(CNUICoreMainWhitelistedContactsController *)self downtimeContainerFetcher];
  char v3 = [v2 downtimeWhitelistContainer];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setFamilyMemberContactItems:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberContactItems, a3);
  id v4 = [(CNUICoreMainWhitelistedContactsController *)self observer];
  [v4 familyMemberContactItemsDidChange];
}

- (void)triggerContactItemsFetch
{
  [(CNUICoreMainWhitelistedContactsController *)self cancelContactItemsFetch];
  char v3 = [(CNUICoreMainWhitelistedContactsController *)self contactItemFutureFromFetcher];
  [(CNUICoreMainWhitelistedContactsController *)self setFamilyMemberContactItemsFuture:v3];

  objc_initWeak(&location, self);
  id v4 = [(CNUICoreMainWhitelistedContactsController *)self familyMemberContactItemsFuture];
  uint64_t v7 = MEMORY[0x263EF8330];
  objc_copyWeak(&v8, &location);
  int v5 = [(CNUICoreMainWhitelistedContactsController *)self schedulerProvider];
  id v6 = [v5 mainThreadScheduler];
  [v4 addSuccessBlock:&v7 scheduler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__CNUICoreMainWhitelistedContactsController_triggerContactItemsFetch__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setFamilyMemberContactItems:v3];
}

- (void)cancelContactItemsFetch
{
  id v3 = [(CNUICoreMainWhitelistedContactsController *)self familyMemberContactItemsFuture];
  [v3 cancel];

  [(CNUICoreMainWhitelistedContactsController *)self setFamilyMemberContactItemsFuture:0];
}

- (id)contactItemFutureFromFetcher
{
  id v3 = [(CNUICoreMainWhitelistedContactsController *)self modelFetcher];
  id v4 = [v3 whitelistedContactsModel];
  int v5 = [(CNUICoreMainWhitelistedContactsController *)self schedulerProvider];
  id v6 = [v4 flatMap:&__block_literal_global_67 schedulerProvider:v5];

  return v6;
}

id __73__CNUICoreMainWhitelistedContactsController_contactItemFutureFromFetcher__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F335E0];
  id v3 = [a2 items];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)updateWhitelistByAddingContacts:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))() & 1) == 0)
  {
    int v5 = [(CNUICoreMainWhitelistedContactsController *)self addContactsToWhitelistFuture];
    [v5 cancel];

    id v6 = (void *)MEMORY[0x263F335E0];
    uint64_t v9 = MEMORY[0x263EF8330];
    id v10 = v4;
    uint64_t v7 = [(CNUICoreMainWhitelistedContactsController *)self backgroundOrImmediateScheduler];
    id v8 = [v6 futureWithBlock:&v9 scheduler:v7];
    [(CNUICoreMainWhitelistedContactsController *)self setAddContactsToWhitelistFuture:v8];
  }
}

id __77__CNUICoreMainWhitelistedContactsController_updateWhitelistByAddingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) downtimeContainerFetcher];
  int v5 = [v4 downtimeWhitelistContainer];

  id v6 = objc_msgSend(*(id *)(a1 + 40), "_cn_filter:", &__block_literal_global_24_1);
  if ((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v7 = 0;
    int v8 = 1;
  }
  else
  {
    if (!v5)
    {
      v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFE180] code:1008 userInfo:0];
      v18 = v17;
      if (a2) {
        *a2 = v17;
      }

      goto LABEL_17;
    }
    uint64_t v9 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByAddingContacts:v6 toContainer:v5];
    id v10 = [*(id *)(a1 + 32) mainContactStoreFacade];
    id v21 = 0;
    int v8 = [v10 executeSaveRequest:v9 error:&v21];
    id v7 = v21;
  }
  id v11 = [*(id *)(a1 + 32) mainContactStoreFacade];
  uint64_t v12 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToupdateContactWhitelistByAddingContacts:*(void *)(a1 + 40)];
  id v20 = v7;
  int v13 = [v11 executeSaveRequest:v12 error:&v20];
  id v14 = v20;

  if (!v8 || !v13)
  {
    if (a2) {
      *a2 = v14;
    }

LABEL_17:
    id v16 = 0;
    goto LABEL_18;
  }
  id v15 = *(id *)(a1 + 40);
  id v16 = v15;
  if (a2 && !v15) {
    *a2 = v14;
  }

LABEL_18:
  return v16;
}

uint64_t __77__CNUICoreMainWhitelistedContactsController_updateWhitelistByAddingContacts___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasBeenPersisted] ^ 1;
}

- (void)updateWhitelistByUpdatingContacts:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))() & 1) == 0)
  {
    int v5 = [(CNUICoreMainWhitelistedContactsController *)self updateContactsInWhitelistFuture];
    [v5 cancel];

    id v6 = (void *)MEMORY[0x263F335E0];
    uint64_t v9 = MEMORY[0x263EF8330];
    id v10 = v4;
    id v7 = [(CNUICoreMainWhitelistedContactsController *)self backgroundOrImmediateScheduler];
    int v8 = [v6 futureWithBlock:&v9 scheduler:v7];
    [(CNUICoreMainWhitelistedContactsController *)self setUpdateContactsInWhitelistFuture:v8];
  }
}

id __79__CNUICoreMainWhitelistedContactsController_updateWhitelistByUpdatingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) mainContactStoreFacade];
  int v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByUpdatingContacts:*(void *)(a1 + 40)];
  id v11 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v11];
  id v7 = v11;

  if (!v6)
  {
    uint64_t v9 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = v8;
  if (a2 && !v8) {
LABEL_6:
  }
    *a2 = v7;
LABEL_7:

  return v9;
}

- (void)updateWhitelistByRemovingContacts:(id)a3
{
  id v4 = a3;
  if (((*(uint64_t (**)(void))(*MEMORY[0x263F334B0] + 16))() & 1) == 0)
  {
    int v5 = [(CNUICoreMainWhitelistedContactsController *)self deleteContactsFromWhitelistFuture];
    [v5 cancel];

    int v6 = (void *)MEMORY[0x263F335E0];
    uint64_t v9 = MEMORY[0x263EF8330];
    id v10 = v4;
    id v7 = [(CNUICoreMainWhitelistedContactsController *)self backgroundOrImmediateScheduler];
    id v8 = [v6 futureWithBlock:&v9 scheduler:v7];
    [(CNUICoreMainWhitelistedContactsController *)self setDeleteContactsFromWhitelistFuture:v8];
  }
}

id __79__CNUICoreMainWhitelistedContactsController_updateWhitelistByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) mainContactStoreFacade];
  int v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactWhitelistByRemovingContacts:*(void *)(a1 + 40)];
  id v11 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v11];
  id v7 = v11;

  if (!v6)
  {
    uint64_t v9 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = v8;
  if (a2 && !v8) {
LABEL_6:
  }
    *a2 = v7;
LABEL_7:

  return v9;
}

- (id)contactRepresentingItem:(id)a3
{
  v20[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263EFEA18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x263EFEA28] keyVectorWithAllKeys];
  v20[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  uint64_t v9 = (void *)[v6 initWithKeysToFetch:v8];

  id v10 = (void *)MEMORY[0x263EFE9F8];
  id v11 = [v5 contactIdentifier];

  v19 = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  int v13 = [v10 predicateForContactsWithIdentifiers:v12];
  [v9 setPredicate:v13];

  [v9 setUnifyResults:0];
  id v14 = [(CNUICoreMainWhitelistedContactsController *)self mainContactStoreFacade];
  id v15 = +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:v9 fromStore:v14];

  if ([v15 isSuccess])
  {
    id v16 = [v15 value];
    v17 = [v16 firstObject];
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (CNUICoreFamilyMemberContactsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (CNUICoreFamilyMemberContactsObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher
{
  return self->_modelFetcher;
}

- (CNUICoreContactStoreFacade)mainContactStoreFacade
{
  return self->_mainContactStoreFacade;
}

- (CNDowntimeWhitelistContainerFetching)downtimeContainerFetcher
{
  return self->_downtimeContainerFetcher;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNFuture)familyMemberContactItemsFuture
{
  return self->_familyMemberContactItemsFuture;
}

- (void)setFamilyMemberContactItemsFuture:(id)a3
{
}

- (CNFuture)addContactsToWhitelistFuture
{
  return self->_addContactsToWhitelistFuture;
}

- (void)setAddContactsToWhitelistFuture:(id)a3
{
}

- (CNFuture)updateContactsInWhitelistFuture
{
  return self->_updateContactsInWhitelistFuture;
}

- (void)setUpdateContactsInWhitelistFuture:(id)a3
{
}

- (CNFuture)deleteContactsFromWhitelistFuture
{
  return self->_deleteContactsFromWhitelistFuture;
}

- (void)setDeleteContactsFromWhitelistFuture:(id)a3
{
}

- (CNCancelable)contactStoreDidChangeToken
{
  return self->_contactStoreDidChangeToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeToken, 0);
  objc_storeStrong((id *)&self->_deleteContactsFromWhitelistFuture, 0);
  objc_storeStrong((id *)&self->_updateContactsInWhitelistFuture, 0);
  objc_storeStrong((id *)&self->_addContactsToWhitelistFuture, 0);
  objc_storeStrong((id *)&self->_familyMemberContactItemsFuture, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_downtimeContainerFetcher, 0);
  objc_storeStrong((id *)&self->_mainContactStoreFacade, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_familyMemberContactItems, 0);
}

- (void)initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘downtimeContainerFetcher’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)initWithModelFetcher:mainContactStoreFacade:downtimeContainerFetcher:schedulerProvider:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘mainContactStoreFacade’ must be nonnull", v2, v3, v4, v5, v6);
}

@end