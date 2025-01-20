@interface CNUIContactStoreSaveExecutor
- (BOOL)handleContainerContextForSaveConfiguration:(id)a3 contactToSave:(id)a4 saveDelegate:(id)a5 issuedRequestIdentifiers:(id)a6 additionalLinkedContacts:(id)a7;
- (BOOL)performSaveForMutableContact:(id)a3 group:(id)a4 container:(id)a5 saveConfiguration:(id)a6 issuedRequestIdentifiers:(id)a7;
- (BOOL)saveShadowContactForSaveConfiguration:(id)a3;
- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4;
- (id)saveLinkedContactsWithSaveConfiguration:(id)a3 contactToSave:(id)a4 additionalLinkedContacts:(id)a5 issuedRequestIdentifiers:(id)a6 saveDelegate:(id)a7;
- (id)validatedContactForSaveConfiguration:(id)a3 preservingIdentifier:(BOOL)a4;
- (void)handleGroupContextForSaveConfiguration:(id)a3 contactToSave:(id)a4 issuedRequestIdentifiers:(id)a5 saveDelegate:(id)a6;
@end

@implementation CNUIContactStoreSaveExecutor

- (BOOL)performSaveForMutableContact:(id)a3 group:(id)a4 container:(id)a5 saveConfiguration:(id)a6 issuedRequestIdentifiers:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = objc_alloc_init(CNUIContactStoreSaveDelegate);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  if ([v11 ignoresParentalRestrictions]) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = [v11 saveWasAuthorized];
  }
  [v17 setIgnoresGuardianRestrictions:v18];
  [v17 setDelegate:v16];
  v19 = [v17 saveRequestIdentifier];
  [v12 addObject:v19];

  v20 = [v11 contactStore];
  LOBYTE(v19) = [v15 saveContactInStore:v20 group:v14 container:v13 request:v17];

  return (char)v19;
}

- (id)saveLinkedContactsWithSaveConfiguration:(id)a3 contactToSave:(id)a4 additionalLinkedContacts:(id)a5 issuedRequestIdentifiers:(id)a6 saveDelegate:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = *MEMORY[0x1E4F5A258];
  if ((*(unsigned int (**)(void, id))(*MEMORY[0x1E4F5A258] + 16))(*MEMORY[0x1E4F5A258], v13)
    && ([v11 editingLinkedContacts],
        id v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17),
        v17,
        v18))
  {
    v19 = (void *)[v12 copy];
  }
  else
  {
    id v20 = v11;
    if ([v13 count])
    {
      v21 = [v20 editingLinkedContacts];
      [v13 addObjectsFromArray:v21];

      uint64_t v22 = [v20 copyWithEditingLinkedContacts:v13];
      id v20 = (id)v22;
    }
    v23 = objc_alloc_init(CNUIContactStoreLinkedContactSaveExecutor);
    v24 = [(CNUIContactStoreLinkedContactSaveExecutor *)v23 executeSaveWithConfiguration:v20 saveDelegate:v15];
    v25 = [v24 identifiersOfIssuedSaveRequests];
    [v14 addObjectsFromArray:v25];

    v26 = [v24 contact];

    if (v26)
    {
      uint64_t v27 = [v24 contact];
    }
    else
    {
      uint64_t v27 = [v12 copy];
    }
    v19 = (void *)v27;
  }

  return v19;
}

- (void)handleGroupContextForSaveConfiguration:(id)a3 contactToSave:(id)a4 issuedRequestIdentifiers:(id)a5 saveDelegate:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v9 groupContext];

  if (v13)
  {
    if ([v9 ignoresParentalRestrictions]) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = [v9 saveWasAuthorized];
    }
    id v15 = [CNUIGroupsAndContainersSaveManager alloc];
    uint64_t v16 = [v9 contactStore];
    id v17 = [v12 contactViewCache];
    int v18 = [(CNUIGroupsAndContainersSaveManager *)v15 initWithContactStore:v16 contactViewCache:v17];

    v22[0] = v10;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v20 = [v9 groupContext];
    id v21 = [(CNUIGroupsAndContainersSaveManager *)v18 updateContacts:v19 forGroupContext:v20 ignoresGuardianRestrictions:v14 issuedRequestIdentifiers:v11];
  }
}

- (BOOL)handleContainerContextForSaveConfiguration:(id)a3 contactToSave:(id)a4 saveDelegate:(id)a5 issuedRequestIdentifiers:(id)a6 additionalLinkedContacts:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v44 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = [v11 containerContext];
  uint64_t v16 = [v15 addedContainers];

  id obj = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v41 = v14;
    v42 = v12;
    uint64_t v40 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v46 != v40) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v21 = [v44 contactViewCache];
        uint64_t v22 = [v21 policyForContainer:v20];

        v23 = [v20 identifier];
        v24 = [v11 parentContainer];
        v25 = [v24 identifier];
        char v26 = [v23 isEqualToString:v25];

        if (v26)
        {
          id v27 = v42;
          v28 = [v11 parentGroup];
        }
        else
        {
          id v27 = [MEMORY[0x1E4F1B948] contactFromContact:v42 conformingToPolicy:v22 options:5];
          v28 = 0;
        }
        id v29 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
        if ([v11 ignoresParentalRestrictions]) {
          uint64_t v30 = 1;
        }
        else {
          uint64_t v30 = [v11 saveWasAuthorized];
        }
        [v29 setIgnoresGuardianRestrictions:v30];
        v31 = [v29 saveRequestIdentifier];
        [v13 addObject:v31];

        BOOL v32 = [(CNUIContactStoreSaveExecutor *)self performSaveForMutableContact:v27 group:v28 container:v20 saveConfiguration:v11 issuedRequestIdentifiers:v13];
        [v41 addObject:v27];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v18);
    id v14 = v41;
    id v12 = v42;
  }
  else
  {
    BOOL v32 = 0;
  }

  v33 = [v11 containerContext];
  v34 = [v33 originalContainers];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    v36 = [v11 parentGroup];
    v37 = [v11 parentContainer];
    BOOL v32 = [(CNUIContactStoreSaveExecutor *)self performSaveForMutableContact:v12 group:v36 container:v37 saveConfiguration:v11 issuedRequestIdentifiers:v13];

    [v14 addObject:v12];
  }

  return v32;
}

- (id)validatedContactForSaveConfiguration:(id)a3 preservingIdentifier:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 mutableContact];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1BA78]);
  v8 = [v5 parentContainer];
  id v9 = [v8 identifier];
  [v7 setContainerIdentifier:v9];

  if ([v5 ignoresParentalRestrictions]) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v5 saveWasAuthorized];
  }
  [v7 setIgnoresGuardianRestrictions:v10];
  id v11 = [v5 contactStore];
  id v22 = 0;
  id v12 = [v11 policyWithDescription:v7 error:&v22];
  id v13 = v22;

  if (v13)
  {
    id v14 = CNUILogContactCard();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v21 = [v5 parentContainer];
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_error_impl(&dword_18B625000, v14, OS_LOG_TYPE_ERROR, "[CNUIContactStoreExecutor] failed to get policy for container %{public}@", buf, 0xCu);
    }
  }
  else
  {
    [v6 updateContactTypeWithPolicy:v12];
    if (![v6 hasBeenPersisted])
    {
      if (v4) {
        uint64_t v17 = 13;
      }
      else {
        uint64_t v17 = 5;
      }
      uint64_t v18 = [MEMORY[0x1E4F1B948] contactFromContact:v6 conformingToPolicy:v12 options:v17];
      v19 = (void *)v18;
      if (v18) {
        id v20 = (void *)v18;
      }
      else {
        id v20 = v6;
      }
      id v15 = v20;

      goto LABEL_10;
    }
  }
  id v15 = v6;
LABEL_10:

  return v15;
}

- (BOOL)saveShadowContactForSaveConfiguration:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 shadowCopyOfReadonlyContact];

  if (v4)
  {
    id v5 = [v3 contactStore];
    v6 = [v5 defaultContainerIdentifier];

    if (!v6)
    {
      id v12 = CNUILogContactCard();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreExecutor] Failed to get default container identifier to save shadow copy of readonly contact", buf, 2u);
      }
      BOOL v14 = 1;
      goto LABEL_17;
    }
    id v7 = (void *)MEMORY[0x1E4F1B9B0];
    v25[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    id v9 = [v7 predicateForContainersWithIdentifiers:v8];

    uint64_t v10 = [v3 contactStore];
    id v22 = 0;
    id v11 = [v10 containersMatchingPredicate:v9 error:&v22];
    id v12 = v22;
    id v13 = [v11 firstObject];

    BOOL v14 = v12 != 0;
    if (v12)
    {
      id v15 = CNUILogContactCard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v12;
        uint64_t v16 = "[CNUIContactStoreExecutor] Failed to get default container to save shadow copy of readonly contact, error %@";
LABEL_14:
        _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v17 = [v3 shadowCopyOfReadonlyContact];
      uint64_t v18 = [v3 contactStore];
      v19 = [v3 parentGroup];
      char v20 = [v17 saveContactInStore:v18 group:v19 container:v13];

      if (v20)
      {
        BOOL v14 = 1;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      id v15 = CNUILogContactCard();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = 0;
        uint64_t v16 = "[CNUIContactStoreExecutor] Failed to save shadow copy of readonly contact, error %@";
        goto LABEL_14;
      }
    }

    goto LABEL_16;
  }
  BOOL v14 = 1;
LABEL_18:

  return v14;
}

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = CNUILogContactCard();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 134349056;
    uint64_t v30 = self;
    _os_log_impl(&dword_18B625000, v8, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreExecutor] %{public}p will execute save…", (uint8_t *)&v29, 0xCu);
  }

  if (![(CNUIContactStoreSaveExecutor *)self saveShadowContactForSaveConfiguration:v6])
  {
    uint64_t v17 = [CNUIContactSaveResult alloc];
    id v9 = [v6 mutableContact];
    uint64_t v18 = [(CNUIContactSaveResult *)v17 initWithSuccess:0 contact:v9 identifiersOfIssuedSaveRequests:MEMORY[0x1E4F1CBF0]];
    goto LABEL_19;
  }
  id v9 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [(CNUIContactStoreSaveExecutor *)self validatedContactForSaveConfiguration:v6 preservingIdentifier:1];
  if (![(CNUIContactStoreSaveExecutor *)v11 isSuggestedMe])
  {
    v19 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    char v20 = [v19 featureFlags];
    if ([v20 isFeatureEnabled:6])
    {
      id v21 = [v6 containerContext];

      if (v21)
      {
        if ([(CNUIContactStoreSaveExecutor *)self handleContainerContextForSaveConfiguration:v6 contactToSave:v11 saveDelegate:v7 issuedRequestIdentifiers:v9 additionalLinkedContacts:v10])
        {
          goto LABEL_17;
        }
        goto LABEL_13;
      }
    }
    else
    {
    }
    v23 = [v6 parentGroup];
    v24 = [v6 parentContainer];
    BOOL v25 = [(CNUIContactStoreSaveExecutor *)self performSaveForMutableContact:v11 group:v23 container:v24 saveConfiguration:v6 issuedRequestIdentifiers:v9];

    if (v25) {
      goto LABEL_17;
    }
LABEL_13:
    uint64_t v22 = 0;
    id v13 = v11;
    goto LABEL_18;
  }
  id v12 = +[CNDonatedMeCardPersistenceHelper defaultKeysForValuesToPersist];
  id v13 = +[CNDonatedMeCardPersistenceHelper mutableCopyOfContact:v11 byCopyingModificationsAndValuesForKeysOnly:v12];

  BOOL v14 = CNUILogContactCard();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 134349056;
    uint64_t v30 = v13;
    _os_log_impl(&dword_18B625000, v14, OS_LOG_TYPE_DEFAULT, "[CNUIContactStoreExecutor] creating new me contact %{public}p", (uint8_t *)&v29, 0xCu);
  }

  id v15 = [v6 contactStore];
  BOOL v16 = +[CNDonatedMeCardPersistenceHelper createNewMeContact:v13 inStore:v15];

  if (v16)
  {
    id v11 = v13;
LABEL_17:
    id v13 = [(CNUIContactStoreSaveExecutor *)self saveLinkedContactsWithSaveConfiguration:v6 contactToSave:v11 additionalLinkedContacts:v10 issuedRequestIdentifiers:v9 saveDelegate:v7];

    [(CNUIContactStoreSaveExecutor *)self handleGroupContextForSaveConfiguration:v6 contactToSave:v13 issuedRequestIdentifiers:v9 saveDelegate:v7];
    uint64_t v22 = 1;
    goto LABEL_18;
  }
  uint64_t v22 = 0;
LABEL_18:
  char v26 = [CNUIContactSaveResult alloc];
  id v27 = (void *)[v9 copy];
  uint64_t v18 = [(CNUIContactSaveResult *)v26 initWithSuccess:v22 contact:v13 identifiersOfIssuedSaveRequests:v27];

LABEL_19:

  return v18;
}

@end