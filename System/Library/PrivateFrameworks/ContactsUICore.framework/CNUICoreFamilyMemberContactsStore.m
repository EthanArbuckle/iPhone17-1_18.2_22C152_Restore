@interface CNUICoreFamilyMemberContactsStore
- (CNScheduler)backgroundOrImmediateScheduler;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactStoreFacade)familyMemberScopedContactStore;
- (CNUICoreContactsSyncTrigger)contactsSyncTrigger;
- (CNUICoreFamilyMemberContactsStore)init;
- (CNUICoreFamilyMemberContactsStore)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4;
- (CNUICoreFamilyMemberContactsStore)initWithFamilyMemberScopedContactStoreFacade:(id)a3 familyMember:(id)a4 contactsSyncTrigger:(id)a5 schedulerProvider:(id)a6;
- (FAFamilyMember)familyMember;
- (id)contactsFoundAndNotFoundInFamilyMemberContainerFuture:(id)a3;
- (id)contactsInsertedIntoFamilyMemberContainerIfMissingFuture:(id)a3 preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore:(BOOL)a4;
- (id)updateContactListByAddingContacts:(id)a3;
- (id)updateContactListByRemovingContacts:(id)a3;
- (id)updateContactListByUpdatingContacts:(id)a3;
- (id)updateContactWhitelistByAddingContacts:(id)a3;
- (id)updateContactWhitelistByRemovingContacts:(id)a3;
- (void)triggerContactsSyncRequest;
@end

@implementation CNUICoreFamilyMemberContactsStore

- (CNUICoreFamilyMemberContactsStore)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactsStore)initWithFamilyMember:(id)a3 schedulerProvider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CNUICoreContactStoreProductionFacade alloc];
  v9 = [MEMORY[0x263EFEA58] storeForFamilyMember:v7];
  v10 = [(CNUICoreContactStoreProductionFacade *)v8 initWithContactStore:v9];

  v11 = objc_alloc_init(CNUICoreContactsSyncProductionTrigger);
  v12 = [(CNUICoreFamilyMemberContactsStore *)self initWithFamilyMemberScopedContactStoreFacade:v10 familyMember:v7 contactsSyncTrigger:v11 schedulerProvider:v6];

  return v12;
}

- (CNUICoreFamilyMemberContactsStore)initWithFamilyMemberScopedContactStoreFacade:(id)a3 familyMember:(id)a4 contactsSyncTrigger:(id)a5 schedulerProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
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
  if (CNGuardOSLog_cn_once_token_0_9 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberContactsStore initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:]();
  }
LABEL_10:
  if (!v14)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberWhitelistedContactsController initWithModelFetcher:familyMemberContactsUpdator:familyMemberScopedContactStoreFacade:mainContactStoreFacade:schedulerProvider:]();
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CNUICoreFamilyMemberContactsStore;
  v15 = [(CNUICoreFamilyMemberContactsStore *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_familyMemberScopedContactStore, a3);
    objc_storeStrong((id *)&v16->_familyMember, a4);
    objc_storeStrong((id *)&v16->_contactsSyncTrigger, a5);
    objc_storeStrong((id *)&v16->_schedulerProvider, a6);
    v17 = v16;
  }

  return v16;
}

- (CNScheduler)backgroundOrImmediateScheduler
{
  char v3 = [MEMORY[0x263F08B88] isMainThread];
  v4 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
  v5 = v4;
  if (v3) {
    [v4 backgroundScheduler];
  }
  else {
  id v6 = [v4 immediateScheduler];
  }

  return (CNScheduler *)v6;
}

- (id)updateContactListByAddingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactScratchpad scratchpadByAddingContacts:]();
    }
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    v5 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    id v6 = [(CNUICoreFamilyMemberContactsStore *)self familyMember];
    id v7 = [(CNUICoreFamilyMemberContactsStore *)self familyMemberScopedContactStore];
    v8 = (void *)MEMORY[0x263F335E0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke;
    v20[3] = &unk_264018588;
    id v21 = v4;
    v9 = [(CNUICoreFamilyMemberContactsStore *)self backgroundOrImmediateScheduler];
    v10 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
    id v11 = [v8 futureWithBlock:v20 scheduler:v9 schedulerProvider:v10];

    uint64_t v16 = MEMORY[0x263EF8330];
    id v17 = v7;
    v18 = self;
    id v19 = v6;
    id v12 = v6;
    id v13 = v7;
    id v14 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
    v5 = [v11 flatMap:&v16 schedulerProvider:v14];
  }
  return v5;
}

id __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __71__CNUICoreFamilyMemberContactsStore_updateContactListByAddingContacts___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v3 = +[CNUICoreFamilyMemberSaveRequestFactory distinctCopiesOfContacts:a2];
  id v4 = *(void **)(a1 + 32);
  v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByAddingContacts:v3];
  id v12 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v12];
  id v7 = v12;

  if (v6)
  {
    [*(id *)(a1 + 40) triggerContactsSyncRequest];
    v8 = +[CNUIDowntimeLogger sharedLogger];
    [v8 logSuccessUpdatingContactListByAddingContacts:v3 ofFamilyMember:*(void *)(a1 + 48)];

    v9 = [MEMORY[0x263F335E0] futureWithResult:v3];
  }
  else
  {
    v10 = +[CNUIDowntimeLogger sharedLogger];
    [v10 logFailure:v7 updatingContactListByAddingContacts:v3 ofFamilyMember:*(void *)(a1 + 48)];

    v9 = [MEMORY[0x263F335E0] futureWithError:v7];
  }
  return v9;
}

- (id)updateContactListByUpdatingContacts:(id)a3
{
  id v4 = a3;
  v5 = [(CNUICoreFamilyMemberContactsStore *)self familyMemberScopedContactStore];
  int v6 = (void *)MEMORY[0x263F335E0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__CNUICoreFamilyMemberContactsStore_updateContactListByUpdatingContacts___block_invoke;
  v13[3] = &unk_2640185D8;
  id v14 = v5;
  id v15 = v4;
  uint64_t v16 = self;
  id v7 = v4;
  id v8 = v5;
  v9 = [(CNUICoreFamilyMemberContactsStore *)self backgroundOrImmediateScheduler];
  v10 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
  id v11 = [v6 futureWithBlock:v13 scheduler:v9 schedulerProvider:v10];

  return v11;
}

id __73__CNUICoreFamilyMemberContactsStore_updateContactListByUpdatingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByUpdatingContacts:*(void *)(a1 + 40)];
  id v11 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v11];
  id v7 = v11;

  if (!v6)
  {
    v9 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [*(id *)(a1 + 48) triggerContactsSyncRequest];
  id v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (a2 && !v8) {
LABEL_6:
  }
    *a2 = v7;
LABEL_7:

  return v9;
}

- (id)updateContactListByRemovingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactScratchpad scratchpadByRemovingContacts:]();
    }
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    v5 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    int v6 = [(CNUICoreFamilyMemberContactsStore *)self familyMember];
    id v7 = [(CNUICoreFamilyMemberContactsStore *)self familyMemberScopedContactStore];
    id v8 = (void *)MEMORY[0x263F335E0];
    uint64_t v14 = MEMORY[0x263EF8330];
    id v15 = v7;
    id v16 = v4;
    id v17 = self;
    id v18 = v6;
    id v9 = v6;
    id v10 = v7;
    id v11 = [(CNUICoreFamilyMemberContactsStore *)self backgroundOrImmediateScheduler];
    id v12 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
    v5 = [v8 futureWithBlock:&v14 scheduler:v11 schedulerProvider:v12];
  }
  return v5;
}

id __73__CNUICoreFamilyMemberContactsStore_updateContactListByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactListByRemovingContacts:*(void *)(a1 + 40)];
  id v13 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v13];
  id v7 = v13;

  if (!v6)
  {
    id v11 = +[CNUIDowntimeLogger sharedLogger];
    [v11 logFailure:v7 updatingContactListByRemovingContacts:*(void *)(a1 + 40) ofFamilyMember:*(void *)(a1 + 56)];

    id v10 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [*(id *)(a1 + 48) triggerContactsSyncRequest];
  id v8 = +[CNUIDowntimeLogger sharedLogger];
  [v8 logSuccessUpdatingContactListByRemovingContacts:*(void *)(a1 + 40) ofFamilyMember:*(void *)(a1 + 56)];

  id v9 = *(id *)(a1 + 40);
  id v10 = v9;
  if (a2 && !v9) {
LABEL_6:
  }
    *a2 = v7;
LABEL_7:

  return v10;
}

- (id)updateContactWhitelistByAddingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberContactsStore updateContactWhitelistByAddingContacts:]();
    }
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    v5 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    int v6 = [(CNUICoreFamilyMemberContactsStore *)self familyMember];
    id v7 = [(CNUICoreFamilyMemberContactsStore *)self familyMemberScopedContactStore];
    id v8 = [(CNUICoreFamilyMemberContactsStore *)self contactsInsertedIntoFamilyMemberContainerIfMissingFuture:v4 preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore:1];
    uint64_t v13 = MEMORY[0x263EF8330];
    id v14 = v7;
    id v15 = self;
    id v16 = v4;
    id v17 = v6;
    id v9 = v6;
    id v10 = v7;
    id v11 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
    v5 = [v8 flatMap:&v13 schedulerProvider:v11];
  }
  return v5;
}

id __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F335E0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke_2;
  v9[3] = &unk_264018628;
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  v5 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = v5;
  id v14 = *(id *)(a1 + 56);
  id v6 = v3;
  id v7 = [v4 futureWithBlock:v9];

  return v7;
}

id __76__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByAddingContacts___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToupdateContactWhitelistByAddingContacts:*(void *)(a1 + 40)];
  id v13 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v13];
  id v7 = v13;

  if (!v6)
  {
    id v11 = +[CNUIDowntimeLogger sharedLogger];
    [v11 logFailure:v7 updatingContactWhitelistByAddingContacts:*(void *)(a1 + 56) ofFamilyMember:*(void *)(a1 + 64)];

    id v10 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [*(id *)(a1 + 48) triggerContactsSyncRequest];
  id v8 = +[CNUIDowntimeLogger sharedLogger];
  [v8 logSuccessUpdatingContactWhitelistByAddingContacts:*(void *)(a1 + 56) ofFamilyMember:*(void *)(a1 + 64)];

  id v9 = *(id *)(a1 + 40);
  id v10 = v9;
  if (a2 && !v9) {
LABEL_6:
  }
    *a2 = v7;
LABEL_7:

  return v10;
}

- (void)triggerContactsSyncRequest
{
  id v2 = [(CNUICoreFamilyMemberContactsStore *)self contactsSyncTrigger];
  [v2 fireSyncRequest];
}

- (id)contactsInsertedIntoFamilyMemberContainerIfMissingFuture:(id)a3 preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
  objc_initWeak(&location, self);
  id v8 = [(CNUICoreFamilyMemberContactsStore *)self contactsFoundAndNotFoundInFamilyMemberContainerFuture:v6];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke;
  v13[3] = &unk_2640186A0;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a4;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v11 = [v8 flatMap:v13 schedulerProvider:v10];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

id __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [v4 first];
  id v7 = [v4 second];

  if (*(unsigned char *)(a1 + 56))
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "_cn_indexBy:", &__block_literal_global_34);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_2;
    v18[3] = &unk_2640176B8;
    id v19 = v8;
    id v9 = v8;
    uint64_t v10 = objc_msgSend(v6, "_cn_map:", v18);

    id v6 = (void *)v10;
  }
  id v11 = [WeakRetained updateContactListByAddingContacts:v7];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_3;
  v16[3] = &unk_264018678;
  id v17 = v6;
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = v6;
  id v14 = [v11 flatMap:v16 schedulerProvider:v12];

  return v14;
}

id __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

id __162__CNUICoreFamilyMemberContactsStore_contactsInsertedIntoFamilyMemberContainerIfMissingFuture_preserveEditsToProvidedContactsOverContactsFoundInFamilyMemberStore___block_invoke_3(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F335E0];
  uint64_t v3 = *(void *)(a1 + 32);
  v10[0] = a2;
  v10[1] = v3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:v10 count:2];
  id v7 = objc_msgSend(v6, "_cn_flatten");
  id v8 = [v2 futureWithResult:v7];

  return v8;
}

- (id)contactsFoundAndNotFoundInFamilyMemberContainerFuture:(id)a3
{
  id v4 = a3;
  id v5 = [(CNUICoreFamilyMemberContactsStore *)self familyMember];
  id v6 = [(CNUICoreFamilyMemberContactsStore *)self familyMemberScopedContactStore];
  id v7 = (void *)MEMORY[0x263F335E0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__CNUICoreFamilyMemberContactsStore_contactsFoundAndNotFoundInFamilyMemberContainerFuture___block_invoke;
  v15[3] = &unk_2640186C8;
  id v16 = v6;
  id v17 = v4;
  id v18 = v5;
  id v8 = v5;
  id v9 = v4;
  id v10 = v6;
  id v11 = [(CNUICoreFamilyMemberContactsStore *)self backgroundOrImmediateScheduler];
  uint64_t v12 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
  id v13 = [v7 futureWithBlock:v15 scheduler:v11 schedulerProvider:v12];

  return v13;
}

id __91__CNUICoreFamilyMemberContactsStore_contactsFoundAndNotFoundInFamilyMemberContainerFuture___block_invoke(void *a1, void *a2)
{
  id v4 = [[CNUICoreContactRefetcher alloc] initWithContactStore:a1[4] contactsToRefetch:a1[5]];
  id v5 = [(CNUICoreContactRefetcher *)v4 contactsFoundAndNotFound];
  if ([v5 isSuccess])
  {
    id v6 = [v5 value];
  }
  else
  {
    id v7 = +[CNUIDowntimeLogger sharedLogger];
    id v8 = (void *)MEMORY[0x263F33658];
    id v9 = [v5 error];
    id v10 = [v8 resultWithValue:0 orError:v9];
    [v7 logResultOfFetchingContacts:v10 ofFamilyMember:a1[6]];

    id v11 = [v5 error];
    uint64_t v12 = v11;
    if (a2) {
      *a2 = v11;
    }

    id v6 = 0;
  }

  return v6;
}

- (id)updateContactWhitelistByRemovingContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_9 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_9, &__block_literal_global_60);
    }
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_9, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreFamilyMemberContactsStore updateContactWhitelistByRemovingContacts:]();
    }
  }
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    id v5 = [MEMORY[0x263F335E0] futureWithResult:MEMORY[0x263EFFA68]];
  }
  else
  {
    id v6 = [(CNUICoreFamilyMemberContactsStore *)self familyMember];
    id v7 = [(CNUICoreFamilyMemberContactsStore *)self familyMemberScopedContactStore];
    id v8 = (void *)MEMORY[0x263F335E0];
    uint64_t v14 = MEMORY[0x263EF8330];
    id v15 = v7;
    id v16 = v4;
    id v17 = self;
    id v18 = v6;
    id v9 = v6;
    id v10 = v7;
    id v11 = [(CNUICoreFamilyMemberContactsStore *)self backgroundOrImmediateScheduler];
    uint64_t v12 = [(CNUICoreFamilyMemberContactsStore *)self schedulerProvider];
    id v5 = [v8 futureWithBlock:&v14 scheduler:v11 schedulerProvider:v12];
  }
  return v5;
}

id __78__CNUICoreFamilyMemberContactsStore_updateContactWhitelistByRemovingContacts___block_invoke(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = +[CNUICoreFamilyMemberSaveRequestFactory saveRequestToUpdateContactWhitelistByRemovingContacts:*(void *)(a1 + 40)];
  id v13 = 0;
  int v6 = [v4 executeSaveRequest:v5 error:&v13];
  id v7 = v13;

  if (!v6)
  {
    id v11 = +[CNUIDowntimeLogger sharedLogger];
    [v11 logFailure:v7 updatingContactWhitelistByRemovingContacts:*(void *)(a1 + 40) ofFamilyMember:*(void *)(a1 + 56)];

    id v10 = 0;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [*(id *)(a1 + 48) triggerContactsSyncRequest];
  id v8 = +[CNUIDowntimeLogger sharedLogger];
  [v8 logSuccessUpdatingContactWhitelistByRemovingContacts:*(void *)(a1 + 40) ofFamilyMember:*(void *)(a1 + 56)];

  id v9 = *(id *)(a1 + 40);
  id v10 = v9;
  if (a2 && !v9) {
LABEL_6:
  }
    *a2 = v7;
LABEL_7:

  return v10;
}

- (CNUICoreContactStoreFacade)familyMemberScopedContactStore
{
  return self->_familyMemberScopedContactStore;
}

- (FAFamilyMember)familyMember
{
  return self->_familyMember;
}

- (CNUICoreContactsSyncTrigger)contactsSyncTrigger
{
  return self->_contactsSyncTrigger;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_contactsSyncTrigger, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_familyMemberScopedContactStore, 0);
}

- (void)initWithFamilyMemberScopedContactStoreFacade:familyMember:contactsSyncTrigger:schedulerProvider:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘familyMember’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)updateContactWhitelistByAddingContacts:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘contactsToWhitelist’ must be nonnull", v2, v3, v4, v5, v6);
}

- (void)updateContactWhitelistByRemovingContacts:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_20B704000, v0, v1, "parameter ‘contactsToClearFromWhitelist’ must be nonnull", v2, v3, v4, v5, v6);
}

@end