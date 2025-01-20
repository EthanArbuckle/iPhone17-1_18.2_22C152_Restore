@interface CNUICoreFamilyMemberWhitelistedContactsController
+ (NSArray)propertyKeysContainingSenstiveData;
+ (id)contactByRemovingSensitiveDataFromContact:(id)a3;
+ (id)controllerWithFamilyMember:(id)a3 options:(id)a4 schedulerProvider:(id)a5;
- (BOOL)familyMemberContainerIsEmpty;
- (CNCancelable)contactStoreDidChangeToken;
- (CNFuture)addContactsToWhitelistFuture;
- (CNFuture)deleteContactsFromWhitelistFuture;
- (CNFuture)familyMemberContactItemsFuture;
- (CNFuture)updateContactsInWhitelistFuture;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactStoreFacade)familyMemberScopedContactStore;
- (CNUICoreContactStoreFacade)mainContactStoreFacade;
- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher;
- (CNUICoreFamilyMemberContactsObserver)observer;
- (CNUICoreFamilyMemberContactsUpdating)familyMemberContactsUpdator;
- (CNUICoreFamilyMemberWhitelistedContactsController)init;
- (CNUICoreFamilyMemberWhitelistedContactsController)initWithFamilyMember:(id)a3 options:(id)a4 schedulerProvider:(id)a5;
- (CNUICoreFamilyMemberWhitelistedContactsController)initWithModelFetcher:(id)a3 familyMemberContactsUpdator:(id)a4 familyMemberScopedContactStoreFacade:(id)a5 mainContactStoreFacade:(id)a6 schedulerProvider:(id)a7;
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

@implementation CNUICoreFamilyMemberWhitelistedContactsController

+ (NSArray)propertyKeysContainingSenstiveData
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

+ (id)contactByRemovingSensitiveDataFromContact:(id)a3
{
  v3 = (void *)[a3 mutableCopy];
  v4 = +[CNUICoreContactPropertyFilterBuilder whitelistedContactsFilterBuilder];
  v5 = [v4 build];

  [v5 filterPropertyValuesFromContact:v3];
  return v3;
}

+ (id)controllerWithFamilyMember:(id)a3 options:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (CNUICoreInMemoryWhitelistedContactsDataSourceDecorator *)[objc_alloc((Class)a1) initWithFamilyMember:v10 options:v9 schedulerProvider:v8];

  LODWORD(v10) = [v9 shouldRequireConfirmationOfChanges];
  if (v10)
  {
    v12 = [[CNUICoreInMemoryWhitelistedContactsDataSourceDecorator alloc] initWithDataSource:v11 schedulerProvider:v8];

    v11 = v12;
  }

  return v11;
}

- (CNUICoreFamilyMemberWhitelistedContactsController)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberWhitelistedContactsController)initWithFamilyMember:(id)a3 options:(id)a4 schedulerProvider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [[CNUICoreFamilyMemberContactsModelRetriever alloc] initWithFamilyMember:v8 schedulerProvider:v9];
  v12 = [[CNUICoreFamilyMemberContactsStore alloc] initWithFamilyMember:v8 schedulerProvider:v9];
  v13 = [CNUICoreContactStoreProductionFacade alloc];
  v14 = [MEMORY[0x263EFEA58] storeForFamilyMember:v8];
  v15 = [(CNUICoreContactStoreProductionFacade *)v13 initWithContactStore:v14];

  v16 = [CNUICoreContactStoreProductionFacade alloc];
  id v17 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v18 = [(CNUICoreContactStoreProductionFacade *)v16 initWithContactStore:v17];

  LODWORD(v17) = [v10 shouldPrepopulateEmptyWhitelist];
  if (v17)
  {
    v19 = [[CNUICoreProposedContactsFetchingDecorator alloc] initWithModelFetcher:v11 familyMember:v8 schedulerProvider:v9];

    v11 = (CNUICoreFamilyMemberContactsModelRetriever *)v19;
  }
  v20 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self initWithModelFetcher:v11 familyMemberContactsUpdator:v12 familyMemberScopedContactStoreFacade:v15 mainContactStoreFacade:v18 schedulerProvider:v9];

  return v20;
}

- (CNUICoreFamilyMemberWhitelistedContactsController)initWithModelFetcher:(id)a3 familyMemberContactsUpdator:(id)a4 familyMemberScopedContactStoreFacade:(id)a5 mainContactStoreFacade:(id)a6 schedulerProvider:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_170);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.5();
    if (v13) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v13) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_170);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.4();
  }
  if (v14) {
    goto LABEL_14;
  }
LABEL_10:
  if (CNGuardOSLog_cn_once_token_0_8 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_170);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
    if (v15) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_14:
    if (v15) {
      goto LABEL_19;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_8 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_170);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
  }
LABEL_19:
  if (!v16)
  {
    if (CNGuardOSLog_cn_once_token_0_8 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_8, &__block_literal_global_170);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_8, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)CNUICoreFamilyMemberWhitelistedContactsController;
  id v17 = [(CNUICoreFamilyMemberWhitelistedContactsController *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_modelFetcher, a3);
    objc_storeStrong((id *)&v18->_familyMemberContactsUpdator, a4);
    objc_storeStrong((id *)&v18->_familyMemberScopedContactStore, a5);
    objc_storeStrong((id *)&v18->_mainContactStoreFacade, a6);
    objc_storeStrong((id *)&v18->_schedulerProvider, obj);
    familyMemberContactItems = v18->_familyMemberContactItems;
    v18->_familyMemberContactItems = (NSArray *)MEMORY[0x263EFFA68];

    [(CNUICoreFamilyMemberWhitelistedContactsController *)v18 setupChangeNotificationResponse];
    v20 = v18;
  }

  return v18;
}

- (void)setupChangeNotificationResponse
{
  id v3 = (void *)MEMORY[0x263F33608];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  v5 = [v3 observableOnNotificationCenter:v4 withName:*MEMORY[0x263EFE118] object:0];

  v6 = [(CNSchedulerProvider *)self->_schedulerProvider mainThreadScheduler];
  v7 = [v5 observeOn:v6];

  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x263F33610];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __84__CNUICoreFamilyMemberWhitelistedContactsController_setupChangeNotificationResponse__block_invoke;
  id v15 = &unk_264018430;
  objc_copyWeak(&v16, &location);
  id v9 = [v8 observerWithResultBlock:&v12];
  objc_msgSend(v7, "subscribe:", v9, v12, v13, v14, v15);
  id v10 = (CNCancelable *)objc_claimAutoreleasedReturnValue();
  contactStoreDidChangeToken = self->_contactStoreDidChangeToken;
  self->_contactStoreDidChangeToken = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __84__CNUICoreFamilyMemberWhitelistedContactsController_setupChangeNotificationResponse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained triggerContactItemsFetch];
}

- (void)dealloc
{
  [(CNUICoreFamilyMemberWhitelistedContactsController *)self cancelContactItemsFetch];
  [(CNCancelable *)self->_contactStoreDidChangeToken cancel];
  [(CNFuture *)self->_addContactsToWhitelistFuture cancel];
  [(CNFuture *)self->_updateContactsInWhitelistFuture cancel];
  [(CNFuture *)self->_deleteContactsFromWhitelistFuture cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNUICoreFamilyMemberWhitelistedContactsController;
  [(CNUICoreFamilyMemberWhitelistedContactsController *)&v3 dealloc];
}

- (int64_t)fetchStatus
{
  objc_super v3 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];

  if (!v3) {
    return 0;
  }
  v4 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];
  int v5 = [v4 isFinished];

  if (!v5) {
    return 2;
  }
  v6 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];
  id v11 = 0;
  id v7 = (id)[v6 result:&v11];
  id v8 = v11;

  if (v8) {
    int64_t v9 = 1;
  }
  else {
    int64_t v9 = 3;
  }

  return v9;
}

- (NSArray)familyMemberContactItems
{
  objc_super v3 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];

  if (!v3) {
    [(CNUICoreFamilyMemberWhitelistedContactsController *)self triggerContactItemsFetch];
  }
  familyMemberContactItems = self->_familyMemberContactItems;
  return familyMemberContactItems;
}

- (BOOL)familyMemberContainerIsEmpty
{
  v2 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self modelFetcher];
  objc_super v3 = [v2 allContactsModel];
  v4 = [v3 result:0];
  int v5 = [v4 items];
  BOOL v6 = [v5 count] == 0;

  return v6;
}

- (void)setFamilyMemberContactItems:(id)a3
{
  objc_storeStrong((id *)&self->_familyMemberContactItems, a3);
  id v4 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self observer];
  [v4 familyMemberContactItemsDidChange];
}

- (void)triggerContactItemsFetch
{
  [(CNUICoreFamilyMemberWhitelistedContactsController *)self cancelContactItemsFetch];
  objc_super v3 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self contactItemFutureFromFetcher];
  [(CNUICoreFamilyMemberWhitelistedContactsController *)self setFamilyMemberContactItemsFuture:v3];

  objc_initWeak(&location, self);
  id v4 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke;
  v12[3] = &unk_264018458;
  objc_copyWeak(&v13, &location);
  int v5 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self schedulerProvider];
  BOOL v6 = [v5 mainThreadScheduler];
  [v4 addSuccessBlock:v12 scheduler:v6];

  id v7 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke_2;
  v10[3] = &unk_264018480;
  objc_copyWeak(&v11, &location);
  id v8 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self schedulerProvider];
  int64_t v9 = [v8 mainThreadScheduler];
  [v7 addFailureBlock:v10 scheduler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setFamilyMemberContactItems:v3];
}

void __77__CNUICoreFamilyMemberWhitelistedContactsController_triggerContactItemsFetch__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = v3;
  if (!v7) {
    goto LABEL_6;
  }
  int v5 = [v7 domain];
  if (([v5 isEqualToString:*MEMORY[0x263EFE180]] & 1) == 0)
  {

    goto LABEL_6;
  }
  uint64_t v6 = [v7 code];

  if (v6 != 1007) {
LABEL_6:
  }
    [WeakRetained setFamilyMemberContactItemsFuture:0];
}

- (void)cancelContactItemsFetch
{
  id v3 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactItemsFuture];
  [v3 cancel];

  [(CNUICoreFamilyMemberWhitelistedContactsController *)self setFamilyMemberContactItemsFuture:0];
}

- (id)contactItemFutureFromFetcher
{
  id v3 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self modelFetcher];
  id v4 = [v3 whitelistedContactsModel];
  int v5 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self schedulerProvider];
  uint64_t v6 = [v4 flatMap:&__block_literal_global_32 schedulerProvider:v5];

  return v6;
}

id __81__CNUICoreFamilyMemberWhitelistedContactsController_contactItemFutureFromFetcher__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F335E0];
  id v3 = [a2 items];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (void)updateWhitelistByAddingContacts:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self addContactsToWhitelistFuture];
  [v5 cancel];

  id v7 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactsUpdator];
  uint64_t v6 = [v7 updateContactWhitelistByAddingContacts:v4];

  [(CNUICoreFamilyMemberWhitelistedContactsController *)self setAddContactsToWhitelistFuture:v6];
}

- (void)updateWhitelistByUpdatingContacts:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self updateContactsInWhitelistFuture];
  [v5 cancel];

  id v7 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactsUpdator];
  uint64_t v6 = [v7 updateContactListByUpdatingContacts:v4];

  [(CNUICoreFamilyMemberWhitelistedContactsController *)self setUpdateContactsInWhitelistFuture:v6];
}

- (void)updateWhitelistByRemovingContacts:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self deleteContactsFromWhitelistFuture];
  [v5 cancel];

  id v7 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberContactsUpdator];
  uint64_t v6 = [v7 updateContactWhitelistByRemovingContacts:v4];

  [(CNUICoreFamilyMemberWhitelistedContactsController *)self setDeleteContactsFromWhitelistFuture:v6];
}

- (id)contactRepresentingItem:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263EFEA18];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [MEMORY[0x263EFEA28] keyVectorWithAllKeys];
  v24[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  int64_t v9 = (void *)[v6 initWithKeysToFetch:v8];

  id v10 = (void *)MEMORY[0x263EFE9F8];
  id v11 = [v5 contactIdentifier];

  v23 = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  id v13 = [v10 predicateForContactsWithIdentifiers:v12];
  [v9 setPredicate:v13];

  [v9 setUnifyResults:0];
  id v14 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self familyMemberScopedContactStore];
  id v15 = +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:v9 fromStore:v14];

  if ([v15 isSuccess]
    && (uint64_t v16 = *MEMORY[0x263F334B0],
        [v15 value],
        id v17 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17),
        v17,
        (v16 & 1) == 0))
  {
    v19 = [v15 value];
    v21 = [v19 firstObject];
  }
  else
  {
    v18 = [(CNUICoreFamilyMemberWhitelistedContactsController *)self mainContactStoreFacade];
    v19 = +[CNUICoreContactFetchRequestAccumulator resultOfFetchRequest:v9 fromStore:v18];

    if ([v19 isSuccess])
    {
      v20 = [v19 value];
      v21 = [v20 firstObject];
    }
    else
    {
      v21 = 0;
    }
  }

  return v21;
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

- (CNUICoreFamilyMemberContactsUpdating)familyMemberContactsUpdator
{
  return self->_familyMemberContactsUpdator;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (CNUICoreContactStoreFacade)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (CNUICoreContactStoreFacade)mainContactStoreFacade
{
  return self->_mainContactStoreFacade;
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
  objc_storeStrong((id *)&self->_mainContactStoreFacade, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsUpdator, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_familyMemberContactItems, 0);
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘schedulerProvider’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘mainContactStore’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘familyMemberScopedContactStore’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘familyMemberContactsUpdator’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘modelFetcher’ must be nonnull", v2, v3, v4, v5, v6);
}

@end