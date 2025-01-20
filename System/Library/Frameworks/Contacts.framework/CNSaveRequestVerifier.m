@interface CNSaveRequestVerifier
+ (BOOL)_areDirectPropertiesOfSaveRequest:(id)a3 authorizedForSavingWithContext:(id)a4 error:(id *)a5;
+ (BOOL)_arePropertiesOfContacts:(id)a3 inSaveRequest:(id)a4 authorizedForSavingWithContext:(id)a5 error:(id *)a6;
+ (BOOL)_isEditingOfContacts:(id)a3 inSaveRequest:(id)a4 authorizedForSavingWithContext:(id)a5 error:(id *)a6;
+ (BOOL)isSaveRequest:(id)a3 authorizedForSavingWithContext:(id)a4 error:(id *)a5;
+ (BOOL)isValidSaveRequest:(id)a3 error:(id *)a4;
+ (id)insertedAndUpdatedContactsForSaveRequest:(id)a3;
+ (id)os_log;
@end

@implementation CNSaveRequestVerifier

+ (id)os_log
{
  if (os_log_cn_once_token_0_11 != -1) {
    dispatch_once(&os_log_cn_once_token_0_11, &__block_literal_global_69);
  }
  v2 = (void *)os_log_cn_once_object_0_11;

  return v2;
}

uint64_t __31__CNSaveRequestVerifier_os_log__block_invoke()
{
  os_log_cn_once_object_0_11 = (uint64_t)os_log_create("com.apple.contacts", "CNSaveRequestVerifier");

  return MEMORY[0x1F41817F8]();
}

+ (id)insertedAndUpdatedContactsForSaveRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [v3 updatedContacts];
  v6 = [v4 arrayWithArray:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = objc_msgSend(v3, "addedContactsByContainerIdentifier", 0);
  v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 addObjectsFromArray:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v6;
}

+ (BOOL)isValidSaveRequest:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [a1 insertedAndUpdatedContactsForSaveRequest:a3];
  v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {

    goto LABEL_13;
  }
  uint64_t v9 = *(void *)v20;
  char v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
      id v18 = 0;
      BOOL v13 = +[CNContactVerifier isValidContact:v12 error:&v18];
      id v14 = v18;
      if (!v13)
      {
        objc_msgSend(v6, "_cn_addNonNilObject:", v14);
        char v10 = 0;
      }
    }
    id v8 = (id)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);

  if (v10)
  {
    id v8 = 0;
LABEL_13:
    BOOL v15 = 1;
    goto LABEL_17;
  }
  id v16 = +[CNErrorFactory validationErrorByAggregatingValidationErrors:v6];
  id v8 = v16;
  if (a4)
  {
    id v8 = v16;
    BOOL v15 = 0;
    *a4 = v8;
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_17:

  return v15;
}

+ (BOOL)isSaveRequest:(id)a3 authorizedForSavingWithContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v21 = 0;
  int v10 = [a1 _areDirectPropertiesOfSaveRequest:v8 authorizedForSavingWithContext:v9 error:&v21];
  id v11 = v21;
  if (v10)
  {
    uint64_t v12 = [a1 insertedAndUpdatedContactsForSaveRequest:v8];
    id v20 = v11;
    int v13 = [a1 _arePropertiesOfContacts:v12 inSaveRequest:v8 authorizedForSavingWithContext:v9 error:&v20];
    id v14 = v20;

    if (v13)
    {
      BOOL v15 = [v8 deletedContacts];
      id v16 = [v12 arrayByAddingObjectsFromArray:v15];

      id v19 = v14;
      char v17 = [a1 _isEditingOfContacts:v16 inSaveRequest:v8 authorizedForSavingWithContext:v9 error:&v19];
      id v11 = v19;

      if (!a5) {
        goto LABEL_10;
      }
    }
    else
    {
      char v17 = 0;
      id v11 = v14;
      if (!a5) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
    char v17 = 0;
    if (!a5) {
      goto LABEL_10;
    }
  }
  if ((v17 & 1) == 0) {
    *a5 = v11;
  }
LABEL_10:

  return v17;
}

+ (BOOL)_areDirectPropertiesOfSaveRequest:(id)a3 authorizedForSavingWithContext:(id)a4 error:(id *)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a4;
  id v11 = [v9 array];
  LOBYTE(v9) = [v10 isClientFirstOrSecondParty];

  if ((v9 & 1) == 0)
  {
    if ([v8 ignoresGuardianRestrictions]) {
      [v11 addObject:@"ignoresGuardianRestrictions"];
    }
    uint64_t v12 = [v8 meCardIdentifier];

    if (v12) {
      [v11 addObject:@"meCardIdentifier"];
    }
    int v13 = [v8 deletedContainers];
    uint64_t v14 = [v13 count];

    if (v14) {
      [v11 addObject:@"deletedContainers"];
    }
    BOOL v15 = [v8 addedContainersByParentContainerIdentifier];
    uint64_t v16 = [v15 count];

    if (v16) {
      [v11 addObject:@"addedContainersByParentContainerIdentifier"];
    }
    char v17 = [v8 addedAccountContainersByParentContainerIdentifier];
    uint64_t v18 = [v17 count];

    if (v18) {
      [v11 addObject:@"addedAccountContainersByParentContainerIdentifier"];
    }
  }
  uint64_t v19 = [v11 count];
  if (v19)
  {
    id v20 = objc_msgSend(a1, "os_log");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      +[CNSaveRequestVerifier _areDirectPropertiesOfSaveRequest:authorizedForSavingWithContext:error:]((uint64_t)v11, v20);
    }

    v29[0] = v11;
    v28[0] = @"CNKeyPaths";
    v28[1] = @"CNInvalidRecords";
    id v27 = v8;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
    v29[1] = v21;
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    v23 = +[CNErrorFactory errorWithCode:102 userInfo:v22];

    id v24 = v23;
    id v25 = v24;
    if (a5)
    {
      id v25 = v24;
      *a5 = v25;
    }
  }
  else
  {
    id v25 = 0;
  }

  return v19 == 0;
}

+ (BOOL)_arePropertiesOfContacts:(id)a3 inSaveRequest:(id)a4 authorizedForSavingWithContext:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (([a5 isClientFirstOrSecondParty] & 1) != 0
    || ([v10 ignoresContactProviderRestrictions] & 1) != 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = v9;
    id v14 = (id)[v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      id v23 = v10;
      id v24 = v9;
      uint64_t v15 = *(void *)v27;
      char v16 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (a6)
          {
            id v25 = 0;
            BOOL v19 = +[CNContactVerifier arePropertiesOfContactAuthorized:v18 error:&v25];
            id v20 = v25;
            if (!v19)
            {
              [v12 addObject:v20];
              char v16 = 0;
            }
          }
          else if (!+[CNContactVerifier arePropertiesOfContactAuthorized:v18 error:0])
          {

            goto LABEL_19;
          }
        }
        id v14 = (id)[v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14) {
          continue;
        }
        break;
      }

      if (v16)
      {
        id v14 = 0;
        BOOL v11 = 1;
        id v10 = v23;
        id v9 = v24;
        goto LABEL_24;
      }
LABEL_19:
      id v21 = +[CNErrorFactory validationErrorByAggregatingValidationErrors:v12];
      id v14 = v21;
      id v10 = v23;
      if (a6)
      {
        id v14 = v21;
        BOOL v11 = 0;
        *a6 = v14;
      }
      else
      {
        BOOL v11 = 0;
      }
      id v9 = v24;
    }
    else
    {

      BOOL v11 = 1;
    }
LABEL_24:
  }
  return v11;
}

+ (BOOL)_isEditingOfContacts:(id)a3 inSaveRequest:(id)a4 authorizedForSavingWithContext:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v34 = a5;
  if ([v34 isClientFirstOrSecondParty]
    && ([v10 ignoresGuardianRestrictions] & 1) != 0)
  {
    id v11 = 0;
LABEL_33:
    long long v26 = 0;
    BOOL v24 = 1;
    goto LABEL_39;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v9;
  id v11 = (id)[v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (!v11)
  {

    goto LABEL_33;
  }
  v33 = a6;
  id v30 = v10;
  id v31 = v9;
  v35 = 0;
  uint64_t v13 = *(void *)v37;
  char v32 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v12);
      }
      uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      v44 = @"downtimeWhitelist";
      char v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v44, 1, v30);
      int v17 = [v15 areKeysAvailable:v16];

      if (v17)
      {
        uint64_t v18 = [v15 snapshot];
        if (+[CNDowntimeWhitelist isWhitelistedContact:v15])
        {
          goto LABEL_13;
        }
        v43 = @"downtimeWhitelist";
        BOOL v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
        if (([v18 areKeysAvailable:v19] & 1) == 0)
        {

          goto LABEL_24;
        }
        BOOL v20 = +[CNDowntimeWhitelist isWhitelistedContact:v18];

        if (v20)
        {
LABEL_13:
          if (![v34 isClientFirstOrSecondParty]) {
            goto LABEL_20;
          }
          if (v18)
          {
            v42 = @"downtimeWhitelist";
            id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
            if ([v18 areKeysAvailable:v21])
            {
              BOOL v22 = +[CNDowntimeWhitelist isWhitelistedContact:v18];

              if (!v22) {
                goto LABEL_24;
              }
            }
            else
            {
            }
LABEL_20:
            if (!v33)
            {

              id v10 = v30;
              id v9 = v31;
              goto LABEL_30;
            }
            id v23 = v35;
            if (!v35)
            {
              id v23 = [MEMORY[0x1E4F1CA48] array];
            }
            v35 = v23;
            [v23 addObject:v15];
            char v32 = 0;
          }
        }
LABEL_24:

        continue;
      }
    }
    id v11 = (id)[v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  id v10 = v30;
  if (v32)
  {
    id v11 = 0;
    BOOL v24 = 1;
    id v9 = v31;
    goto LABEL_38;
  }
  id v9 = v31;
LABEL_30:
  if ([v35 count])
  {
    v40 = @"CNInvalidRecords";
    v41 = v35;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  }
  else
  {
    id v25 = 0;
  }
  long long v27 = +[CNErrorFactory errorWithCode:206 userInfo:v25];

  id v28 = v27;
  id v11 = v28;
  if (v33)
  {
    id v11 = v28;
    BOOL v24 = 0;
    id *v33 = v11;
  }
  else
  {
    BOOL v24 = 0;
  }
LABEL_38:
  long long v26 = v35;
LABEL_39:

  return v24;
}

+ (void)_areDirectPropertiesOfSaveRequest:(uint64_t)a1 authorizedForSavingWithContext:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1909E3000, a2, OS_LOG_TYPE_ERROR, "CNErrorCodeUnauthorizedKeys:%{public}@", (uint8_t *)&v2, 0xCu);
}

@end