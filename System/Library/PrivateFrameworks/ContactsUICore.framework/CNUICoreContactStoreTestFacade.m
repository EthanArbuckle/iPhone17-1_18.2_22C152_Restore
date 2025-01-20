@interface CNUICoreContactStoreTestFacade
+ (id)contactsBySimulatingExecutionOfSaveRequest:(id)a3 onContacts:(id)a4;
- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4;
- (CNContact)meContact;
- (CNUICoreContactStoreTestFacade)init;
- (CNUICoreContactStoreTestFacade)initWithContacts:(id)a3;
- (CNUICoreContactStoreTestFacade)initWithMeContact:(id)a3 contacts:(id)a4;
- (CNUICoreContactStoreTestFacade)initWithSaveError:(id)a3 fetchError:(id)a4;
- (NSArray)contacts;
- (NSArray)executedFetchRequests;
- (NSArray)executedSaveRequests;
- (NSError)fetchError;
- (NSError)saveError;
- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4;
- (void)commonInitWithMeContact:(id)a3 contacts:(id)a4 saveError:(id)a5 fetchError:(id)a6;
- (void)setContacts:(id)a3;
- (void)setExecutedFetchRequests:(id)a3;
- (void)setExecutedSaveRequests:(id)a3;
- (void)setFetchError:(id)a3;
- (void)setMeContact:(id)a3;
- (void)setSaveError:(id)a3;
@end

@implementation CNUICoreContactStoreTestFacade

- (CNUICoreContactStoreTestFacade)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreContactStoreTestFacade)initWithSaveError:(id)a3 fetchError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNUICoreContactStoreTestFacade;
  v8 = [(CNUICoreContactStoreTestFacade *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(CNUICoreContactStoreTestFacade *)v8 commonInitWithMeContact:0 contacts:0 saveError:v6 fetchError:v7];
    v10 = v9;
  }

  return v9;
}

- (CNUICoreContactStoreTestFacade)initWithContacts:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_14 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_14, &__block_literal_global_122);
    }
    v5 = CNGuardOSLog_cn_once_object_0_14;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_14, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactStoreTestFacade initWithContacts:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CNUICoreContactStoreTestFacade;
  v13 = [(CNUICoreContactStoreTestFacade *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(CNUICoreContactStoreTestFacade *)v13 commonInitWithMeContact:0 contacts:v4 saveError:0 fetchError:0];
    v15 = v14;
  }

  return v14;
}

- (CNUICoreContactStoreTestFacade)initWithMeContact:(id)a3 contacts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    if (CNGuardOSLog_cn_once_token_0_14 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_14, &__block_literal_global_122);
    }
    uint64_t v8 = CNGuardOSLog_cn_once_object_0_14;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_14, OS_LOG_TYPE_FAULT)) {
      -[CNUICoreContactStoreTestFacade initWithMeContact:contacts:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)CNUICoreContactStoreTestFacade;
  v16 = [(CNUICoreContactStoreTestFacade *)&v20 init];
  objc_super v17 = v16;
  if (v16)
  {
    [(CNUICoreContactStoreTestFacade *)v16 commonInitWithMeContact:v6 contacts:v7 saveError:0 fetchError:0];
    v18 = v17;
  }

  return v17;
}

- (void)commonInitWithMeContact:(id)a3 contacts:(id)a4 saveError:(id)a5 fetchError:(id)a6
{
  uint64_t v10 = (CNContact *)a3;
  uint64_t v11 = (NSArray *)a4;
  uint64_t v12 = (NSError *)a5;
  uint64_t v13 = (NSError *)a6;
  meContact = self->_meContact;
  self->_meContact = v10;
  v25 = v10;

  contacts = self->_contacts;
  self->_contacts = v11;
  v16 = v11;

  saveError = self->_saveError;
  self->_saveError = v12;
  v18 = v12;

  fetchError = self->_fetchError;
  self->_fetchError = v13;
  objc_super v20 = v13;

  v21 = [MEMORY[0x263EFF8C0] array];
  executedSaveRequests = self->_executedSaveRequests;
  self->_executedSaveRequests = v21;

  v23 = [MEMORY[0x263EFF8C0] array];
  executedFetchRequests = self->_executedFetchRequests;
  self->_executedFetchRequests = v23;
}

- (id)_crossPlatformUnifiedMeContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CNUICoreContactStoreTestFacade *)self meContact];

  if (v7)
  {
    uint64_t v8 = [(CNUICoreContactStoreTestFacade *)self meContact];
    uint64_t v9 = (void *)[v8 copyWithPropertyKeys:v6];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F33488] code:1 userInfo:MEMORY[0x263EFFA78]];
    uint64_t v8 = v10;
    uint64_t v9 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v9;
}

- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(CNUICoreContactStoreTestFacade *)v10 fetchError];

  if (v11)
  {
    uint64_t v12 = [(CNUICoreContactStoreTestFacade *)v10 fetchError];
    uint64_t v13 = v12;
    if (a4) {
      *a4 = v12;
    }
  }
  else
  {
    uint64_t v14 = [(CNUICoreContactStoreTestFacade *)v10 executedFetchRequests];
    uint64_t v15 = [v14 arrayByAddingObject:v8];
    [(CNUICoreContactStoreTestFacade *)v10 setExecutedFetchRequests:v15];

    v16 = [(CNUICoreContactStoreTestFacade *)v10 contacts];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __85__CNUICoreContactStoreTestFacade_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke;
    v18[3] = &unk_2640189D0;
    id v19 = v9;
    objc_msgSend(v16, "_cn_each:", v18);
  }
  objc_sync_exit(v10);

  return v11 == 0;
}

uint64_t __85__CNUICoreContactStoreTestFacade_enumerateContactsWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, char *))(result + 16))(result, a2, &v3);
  }
  return result;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(CNUICoreContactStoreTestFacade *)v7 saveError];

  if (v8)
  {
    id v9 = [(CNUICoreContactStoreTestFacade *)v7 saveError];
    id v10 = v9;
    if (a4)
    {
      id v10 = v9;
      *a4 = v10;
    }
  }
  else
  {
    uint64_t v11 = [(CNUICoreContactStoreTestFacade *)v7 executedSaveRequests];
    uint64_t v12 = [v11 arrayByAddingObject:v6];
    [(CNUICoreContactStoreTestFacade *)v7 setExecutedSaveRequests:v12];

    uint64_t v13 = objc_opt_class();
    id v10 = [(CNUICoreContactStoreTestFacade *)v7 contacts];
    uint64_t v14 = [v13 contactsBySimulatingExecutionOfSaveRequest:v6 onContacts:v10];
    [(CNUICoreContactStoreTestFacade *)v7 setContacts:v14];
  }
  objc_sync_exit(v7);

  return v8 == 0;
}

+ (id)contactsBySimulatingExecutionOfSaveRequest:(id)a3 onContacts:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 deletedContacts];
  id v8 = objc_msgSend(v7, "_cn_indexBy:", &__block_literal_global_44);

  id v9 = [v6 updatedContacts];
  id v10 = objc_msgSend(v9, "_cn_indexBy:", &__block_literal_global_44);

  uint64_t v11 = [v6 addedContactsByContainerIdentifier];

  uint64_t v12 = [v11 allValues];
  uint64_t v13 = objc_msgSend(v12, "_cn_flatten");
  uint64_t v14 = objc_msgSend(v13, "_cn_indexBy:", &__block_literal_global_44);

  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_2;
  v27[3] = &unk_2640176E0;
  id v28 = v8;
  id v15 = v8;
  v16 = objc_msgSend(v5, "_cn_filter:", v27);

  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_3;
  v25 = &unk_2640176B8;
  id v26 = v10;
  id v17 = v10;
  v18 = objc_msgSend(v16, "_cn_map:", &v22);
  id v19 = objc_msgSend(v14, "allValues", v22, v23, v24, v25);
  objc_super v20 = [v18 arrayByAddingObjectsFromArray:v19];

  return v20;
}

uint64_t __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

BOOL __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  char v3 = [a2 identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 == 0;

  return v5;
}

id __88__CNUICoreContactStoreTestFacade_contactsBySimulatingExecutionOfSaveRequest_onContacts___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 identifier];
  BOOL v5 = [v2 objectForKeyedSubscript:v4];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (NSArray)executedSaveRequests
{
  return self->_executedSaveRequests;
}

- (void)setExecutedSaveRequests:(id)a3
{
}

- (NSArray)executedFetchRequests
{
  return self->_executedFetchRequests;
}

- (void)setExecutedFetchRequests:(id)a3
{
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
}

- (NSError)saveError
{
  return self->_saveError;
}

- (void)setSaveError:(id)a3
{
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_saveError, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_executedFetchRequests, 0);
  objc_storeStrong((id *)&self->_executedSaveRequests, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)initWithContacts:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithMeContact:(uint64_t)a3 contacts:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end