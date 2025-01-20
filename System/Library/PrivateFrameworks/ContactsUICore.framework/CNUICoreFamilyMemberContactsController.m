@interface CNUICoreFamilyMemberContactsController
+ (NSArray)propertyKeysContainingSenstiveData;
+ (id)contactByRemovingSensitiveDataFromContact:(id)a3;
- (CNCancelable)contactStoreDidChangeToken;
- (CNFuture)countOfFamilyMemberContactsFuture;
- (CNFuture)updateContactListByAddingContactsFuture;
- (CNFuture)updateContactListByRemovingContactsFuture;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreFamilyMemberContactsController)init;
- (CNUICoreFamilyMemberContactsController)initWithFamilyMember:(id)a3 modelFetcher:(id)a4 familyMemberContactsUpdator:(id)a5 schedulerProvider:(id)a6;
- (CNUICoreFamilyMemberContactsController)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4;
- (CNUICoreFamilyMemberContactsModelFetching)modelFetcher;
- (CNUICoreFamilyMemberContactsObserver)observer;
- (CNUICoreFamilyMemberContactsUpdating)familyMemberContactsUpdator;
- (FAFamilyMember)familyMember;
- (NSNumber)countOfFamilyMemberContacts;
- (id)countOfFamilyMemberContactsFutureFromFetcher;
- (int64_t)fetchStatus;
- (void)cancelCountOfFamilyMemberContactsFetch;
- (void)dealloc;
- (void)setContactStoreDidChangeToken:(id)a3;
- (void)setCountOfFamilyMemberContacts:(id)a3;
- (void)setCountOfFamilyMemberContactsFuture:(id)a3;
- (void)setObserver:(id)a3;
- (void)setUpdateContactListByAddingContactsFuture:(id)a3;
- (void)setUpdateContactListByRemovingContactsFuture:(id)a3;
- (void)setupChangeNotificationResponse;
- (void)triggerCountOfFamilyMemberContactsFetch;
- (void)updateListByAddingContacts:(id)a3;
- (void)updateListByRemovingContacts:(id)a3;
@end

@implementation CNUICoreFamilyMemberContactsController

+ (NSArray)propertyKeysContainingSenstiveData
{
  v6[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFDFF8];
  v6[0] = *MEMORY[0x263EFE050];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFE0F8];
  v6[2] = *MEMORY[0x263EFE140];
  v6[3] = v3;
  v6[4] = *MEMORY[0x263EFE060];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:5];
  return (NSArray *)v4;
}

+ (id)contactByRemovingSensitiveDataFromContact:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  v4 = +[CNUICoreContactPropertyFilterBuilder managedContactsFilterBuilder];
  v5 = [v4 build];

  [v5 filterPropertyValuesFromContact:v3];
  return v3;
}

- (CNUICoreFamilyMemberContactsController)init
{
  uint64_t v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsController)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[CNUICoreFamilyMemberContactsModelRetriever alloc] initWithFamilyMember:v7 schedulerProvider:v6];
  v9 = [[CNUICoreFamilyMemberContactsStore alloc] initWithFamilyMember:v7 schedulerProvider:v6];
  v10 = [(CNUICoreFamilyMemberContactsController *)self initWithFamilyMember:v7 modelFetcher:v8 familyMemberContactsUpdator:v9 schedulerProvider:v6];

  return v10;
}

- (CNUICoreFamilyMemberContactsController)initWithFamilyMember:(id)a3 modelFetcher:(id)a4 familyMemberContactsUpdator:(id)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_16 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_144);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberContactsStore initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:]();
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
  if (CNGuardOSLog_cn_once_token_0_16 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_144);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.5();
  }
  if (v13) {
    goto LABEL_14;
  }
LABEL_10:
  if (CNGuardOSLog_cn_once_token_0_16 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_144);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:].cold.4();
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
  if (CNGuardOSLog_cn_once_token_0_16 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_16, &__block_literal_global_144);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_16, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
  }
LABEL_19:
  v19.receiver = self;
  v19.super_class = (Class)CNUICoreFamilyMemberContactsController;
  v15 = [(CNUICoreFamilyMemberContactsController *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyMember, a3);
    objc_storeStrong((id *)&v16->_modelFetcher, a4);
    objc_storeStrong((id *)&v16->_familyMemberContactsUpdator, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    [(CNUICoreFamilyMemberContactsController *)v16 setupChangeNotificationResponse];
    v17 = v16;
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
  v8 = (void *)MEMORY[0x263F33610];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __73__CNUICoreFamilyMemberContactsController_setupChangeNotificationResponse__block_invoke;
  v15 = &unk_264018430;
  objc_copyWeak(&v16, &location);
  v9 = [v8 observerWithResultBlock:&v12];
  objc_msgSend(v7, "subscribe:", v9, v12, v13, v14, v15);
  v10 = (CNCancelable *)objc_claimAutoreleasedReturnValue();
  contactStoreDidChangeToken = self->_contactStoreDidChangeToken;
  self->_contactStoreDidChangeToken = v10;

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __73__CNUICoreFamilyMemberContactsController_setupChangeNotificationResponse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained triggerCountOfFamilyMemberContactsFetch];
}

- (void)dealloc
{
  [(CNUICoreFamilyMemberContactsController *)self cancelCountOfFamilyMemberContactsFetch];
  [(CNCancelable *)self->_contactStoreDidChangeToken cancel];
  [(CNFuture *)self->_countOfFamilyMemberContactsFuture cancel];
  [(CNFuture *)self->_updateContactListByAddingContactsFuture cancel];
  [(CNFuture *)self->_updateContactListByRemovingContactsFuture cancel];
  v3.receiver = self;
  v3.super_class = (Class)CNUICoreFamilyMemberContactsController;
  [(CNUICoreFamilyMemberContactsController *)&v3 dealloc];
}

- (int64_t)fetchStatus
{
  objc_super v3 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];

  if (!v3) {
    return 0;
  }
  v4 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];
  int v5 = [v4 isFinished];

  if (!v5) {
    return 2;
  }
  id v6 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];
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

- (NSNumber)countOfFamilyMemberContacts
{
  objc_super v3 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];

  if (!v3) {
    [(CNUICoreFamilyMemberContactsController *)self triggerCountOfFamilyMemberContactsFetch];
  }
  countOfFamilyMemberContacts = self->_countOfFamilyMemberContacts;
  return countOfFamilyMemberContacts;
}

- (void)setCountOfFamilyMemberContacts:(id)a3
{
  objc_storeStrong((id *)&self->_countOfFamilyMemberContacts, a3);
  id v4 = [(CNUICoreFamilyMemberContactsController *)self observer];
  [v4 familyMemberContactItemsDidChange];
}

- (void)triggerCountOfFamilyMemberContactsFetch
{
  [(CNUICoreFamilyMemberContactsController *)self cancelCountOfFamilyMemberContactsFetch];
  objc_super v3 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFutureFromFetcher];
  [(CNUICoreFamilyMemberContactsController *)self setCountOfFamilyMemberContactsFuture:v3];

  objc_initWeak(&location, self);
  id v4 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke;
  v12[3] = &unk_264018E38;
  objc_copyWeak(&v13, &location);
  int v5 = [(CNUICoreFamilyMemberContactsController *)self schedulerProvider];
  id v6 = [v5 mainThreadScheduler];
  [v4 addSuccessBlock:v12 scheduler:v6];

  id v7 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke_2;
  v10[3] = &unk_264018480;
  objc_copyWeak(&v11, &location);
  id v8 = [(CNUICoreFamilyMemberContactsController *)self schedulerProvider];
  int64_t v9 = [v8 mainThreadScheduler];
  [v7 addFailureBlock:v10 scheduler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setCountOfFamilyMemberContacts:v3];
}

void __81__CNUICoreFamilyMemberContactsController_triggerCountOfFamilyMemberContactsFetch__block_invoke_2(uint64_t a1, void *a2)
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
    [WeakRetained setCountOfFamilyMemberContactsFuture:0];
}

- (void)cancelCountOfFamilyMemberContactsFetch
{
  id v3 = [(CNUICoreFamilyMemberContactsController *)self countOfFamilyMemberContactsFuture];
  [v3 cancel];

  [(CNUICoreFamilyMemberContactsController *)self setCountOfFamilyMemberContactsFuture:0];
}

- (id)countOfFamilyMemberContactsFutureFromFetcher
{
  id v3 = [(CNUICoreFamilyMemberContactsController *)self modelFetcher];
  id v4 = [v3 allContactsModel];
  int v5 = [(CNUICoreFamilyMemberContactsController *)self schedulerProvider];
  uint64_t v6 = [v4 flatMap:&__block_literal_global_54 schedulerProvider:v5];

  return v6;
}

id __86__CNUICoreFamilyMemberContactsController_countOfFamilyMemberContactsFutureFromFetcher__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F335E0];
  id v3 = NSNumber;
  id v4 = [a2 items];
  int v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  uint64_t v6 = [v2 futureWithResult:v5];

  return v6;
}

- (void)updateListByAddingContacts:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUICoreFamilyMemberContactsController *)self updateContactListByAddingContactsFuture];
  [v5 cancel];

  id v7 = [(CNUICoreFamilyMemberContactsController *)self familyMemberContactsUpdator];
  uint64_t v6 = [v7 updateContactListByAddingContacts:v4];

  [(CNUICoreFamilyMemberContactsController *)self setUpdateContactListByAddingContactsFuture:v6];
}

- (void)updateListByRemovingContacts:(id)a3
{
  id v4 = a3;
  int v5 = [(CNUICoreFamilyMemberContactsController *)self updateContactListByRemovingContactsFuture];
  [v5 cancel];

  id v7 = [(CNUICoreFamilyMemberContactsController *)self familyMemberContactsUpdator];
  uint64_t v6 = [v7 updateContactListByRemovingContacts:v4];

  [(CNUICoreFamilyMemberContactsController *)self setUpdateContactListByRemovingContactsFuture:v6];
}

- (CNUICoreFamilyMemberContactsObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (CNUICoreFamilyMemberContactsObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
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

- (CNFuture)countOfFamilyMemberContactsFuture
{
  return self->_countOfFamilyMemberContactsFuture;
}

- (void)setCountOfFamilyMemberContactsFuture:(id)a3
{
}

- (CNFuture)updateContactListByAddingContactsFuture
{
  return self->_updateContactListByAddingContactsFuture;
}

- (void)setUpdateContactListByAddingContactsFuture:(id)a3
{
}

- (CNFuture)updateContactListByRemovingContactsFuture
{
  return self->_updateContactListByRemovingContactsFuture;
}

- (void)setUpdateContactListByRemovingContactsFuture:(id)a3
{
}

- (CNCancelable)contactStoreDidChangeToken
{
  return self->_contactStoreDidChangeToken;
}

- (void)setContactStoreDidChangeToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStoreDidChangeToken, 0);
  objc_storeStrong((id *)&self->_updateContactListByRemovingContactsFuture, 0);
  objc_storeStrong((id *)&self->_updateContactListByAddingContactsFuture, 0);
  objc_storeStrong((id *)&self->_countOfFamilyMemberContactsFuture, 0);
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_familyMemberContactsUpdator, 0);
  objc_storeStrong((id *)&self->_modelFetcher, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_countOfFamilyMemberContacts, 0);
}

@end