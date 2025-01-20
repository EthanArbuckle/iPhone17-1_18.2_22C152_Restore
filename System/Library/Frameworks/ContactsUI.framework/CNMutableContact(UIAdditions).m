@interface CNMutableContact(UIAdditions)
- (id)addAllPropertiesFromContact:()UIAdditions;
- (id)addProperties:()UIAdditions excludingProperties:fromContact:;
- (uint64_t)addContactToGroups:()UIAdditions inStore:request:;
- (uint64_t)deleteContactFromStore:()UIAdditions request:;
- (uint64_t)hasNonPersistedData;
- (uint64_t)removeContactFromGroups:()UIAdditions inStore:request:;
- (uint64_t)removePhoto;
- (uint64_t)saveContactInStore:()UIAdditions group:container:;
- (uint64_t)saveContactInStore:()UIAdditions group:container:request:;
- (uint64_t)saveContactInStore:()UIAdditions groups:container:request:;
- (void)setBirthdays:()UIAdditions;
- (void)updateContactTypeWithPolicy:()UIAdditions;
- (void)updateImageInfoWithType:()UIAdditions;
@end

@implementation CNMutableContact(UIAdditions)

- (void)updateImageInfoWithType:()UIAdditions
{
  objc_msgSend(MEMORY[0x1E4F1B8F8], "stringIdentifierForImageType:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setImageType:v2];
}

- (uint64_t)removePhoto
{
  [a1 setImageData:0];
  [a1 setThumbnailImageData:0];
  [a1 setFullscreenImageData:0];
  [a1 setImageType:0];
  [a1 setImageHash:0];
  objc_msgSend(a1, "setCropRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [a1 setMemojiMetadata:0];

  return [a1 setImageBackgroundColorsData:0];
}

- (void)setBirthdays:()UIAdditions
{
  v4 = objc_msgSend(a3, "_cn_filter:", &__block_literal_global_139);
  if ([v4 count] == 2)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    v6 = [v5 value];
    v7 = [v6 calendar];
    v8 = [v7 calendarIdentifier];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1C318]];

    v10 = [v4 objectAtIndexedSubscript:1];
    uint64_t v11 = [v10 value];

    if (v9) {
      v12 = (void *)v11;
    }
    else {
      v12 = v6;
    }
    if (v9) {
      v13 = v6;
    }
    else {
      v13 = (void *)v11;
    }
LABEL_15:
    id v21 = v13;

    v18 = v21;
    goto LABEL_17;
  }
  if ([v4 count] == 1)
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    v14 = [v5 value];
    v15 = [v14 calendar];
    v16 = [v15 calendarIdentifier];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1C318]];

    if (v17) {
      v12 = 0;
    }
    else {
      v12 = v14;
    }
    if (v17) {
      v13 = v14;
    }
    else {
      v13 = 0;
    }
    goto LABEL_15;
  }
  v12 = 0;
  v18 = 0;
LABEL_17:
  id v22 = v18;
  if ([v18 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = 0;
  }
  else if ([v22 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = 0;
  }
  else
  {
    id v19 = v22;
  }
  [a1 setBirthday:v19];
  if ([v12 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = 0;
  }
  else if ([v12 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = 0;
  }
  else
  {
    v20 = v12;
  }
  [a1 setNonGregorianBirthday:v20];
}

- (uint64_t)deleteContactFromStore:()UIAdditions request:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"CNContact+UIAdditions.m" lineNumber:636 description:@"A store is needed here"];
  }
  int v9 = CNUILogContactCard();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349314;
    v18 = a1;
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl(&dword_18B625000, v9, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Deleting contact %{public}p from store %{public}@", buf, 0x16u);
  }

  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  }
  [v8 deleteContact:a1];
  id v16 = 0;
  uint64_t v10 = [v7 executeSaveRequest:v8 error:&v16];
  id v11 = v16;
  if ((v10 & 1) == 0)
  {
    v12 = CNUILogContactCard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [a1 identifier];
      *(_DWORD *)buf = 138544130;
      v18 = v14;
      __int16 v19 = 2114;
      id v20 = v11;
      __int16 v21 = 2114;
      id v22 = v7;
      __int16 v23 = 2112;
      v24 = a1;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not delete contact with identifer %{public}@, error %{public}@, store %{public}@, full contact %@", buf, 0x2Au);
    }
  }

  return v10;
}

- (uint64_t)saveContactInStore:()UIAdditions groups:container:request:
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:a1 file:@"CNContact+UIAdditions.m" lineNumber:602 description:@"A store is needed here"];
  }
  v15 = CNUILogContactCard();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349312;
    v40 = a1;
    __int16 v41 = 1024;
    LODWORD(v42) = v14 != 0;
    _os_log_impl(&dword_18B625000, v15, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Saving contact %{public}p with request? %d", buf, 0x12u);
  }

  if (!v14) {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  }
  if (![a1 hasBeenPersisted] || (objc_msgSend(a1, "isSuggestedMe") & 1) != 0)
  {
    id v16 = CNUILogContactCard();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v13 identifier];
      uint64_t v18 = [v13 type];
      *(_DWORD *)buf = 134349570;
      v40 = a1;
      __int16 v41 = 2114;
      id v42 = v17;
      __int16 v43 = 2048;
      uint64_t v44 = v18;
      _os_log_impl(&dword_18B625000, v16, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Saving contact %{public}p by adding, to container with identifier %{public}@ type %ld", buf, 0x20u);
    }
    __int16 v19 = [v13 identifier];
    [v14 addContact:a1 toContainerWithIdentifier:v19];

    if (!v12) {
      goto LABEL_24;
    }
LABEL_16:
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v36;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v21);
          }
          [v14 addMember:a1 toGroup:*(void *)(*((void *)&v35 + 1) + 8 * v25++)];
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v23);
    }

    goto LABEL_24;
  }
  id v20 = CNUILogContactCard();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v40 = a1;
    _os_log_impl(&dword_18B625000, v20, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Saving contact %{public}p by updating", buf, 0xCu);
  }

  [v14 updateContact:a1];
  if (v12) {
    goto LABEL_16;
  }
LABEL_24:
  v26 = +[CNUIContactsEnvironment currentEnvironment];
  v27 = [v26 authorizationContext];

  id v34 = 0;
  uint64_t v28 = [v11 executeSaveRequest:v14 response:0 authorizationContext:v27 error:&v34];
  id v29 = v34;
  if ((v28 & 1) == 0)
  {
    v30 = CNUILogContactCard();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v32 = [a1 identifier];
      *(_DWORD *)buf = 138544130;
      v40 = v32;
      __int16 v41 = 2114;
      id v42 = v29;
      __int16 v43 = 2114;
      uint64_t v44 = (uint64_t)v11;
      __int16 v45 = 2112;
      v46 = a1;
      _os_log_error_impl(&dword_18B625000, v30, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not save contact with identifer %{public}@, error %{public}@, store %{public}@, full contact %@", buf, 0x2Au);
    }
  }

  return v28;
}

- (uint64_t)saveContactInStore:()UIAdditions group:container:request:
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    int v17 = a4;
    id v13 = (void *)MEMORY[0x1E4F1C978];
    id v14 = a4;
    a4 = [v13 arrayWithObjects:&v17 count:1];
  }
  uint64_t v15 = objc_msgSend(a1, "saveContactInStore:groups:container:request:", v10, a4, v11, v12, v17, v18);

  return v15;
}

- (uint64_t)saveContactInStore:()UIAdditions group:container:
{
  return [a1 saveContactInStore:a3 group:a4 container:a5 request:0];
}

- (uint64_t)removeContactFromGroups:()UIAdditions inStore:request:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9 && [v9 count])
  {
    if (!v10)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:a1 file:@"CNContact+UIAdditions.m" lineNumber:569 description:@"A store is needed here"];
    }
    id v12 = CNUILogContactCard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v30 = a1;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Removing contact %{public}p from groups %@", buf, 0x16u);
    }

    if (!v11) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          [v11 removeMember:a1 fromGroup:*(void *)(*((void *)&v25 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v39 count:16];
      }
      while (v15);
    }

    id v24 = 0;
    uint64_t v18 = [v10 executeSaveRequest:v11 error:&v24];
    id v19 = v24;
    if ((v18 & 1) == 0)
    {
      id v20 = CNUILogContactCard();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [a1 identifier];
        *(_DWORD *)buf = 138544386;
        v30 = v22;
        __int16 v31 = 2112;
        id v32 = v13;
        __int16 v33 = 2114;
        id v34 = v19;
        __int16 v35 = 2114;
        id v36 = v10;
        __int16 v37 = 2112;
        long long v38 = a1;
        _os_log_error_impl(&dword_18B625000, v20, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not remove contact with identifer %{public}@ from groups %@, error %{public}@, store %{public}@, full contact %@", buf, 0x34u);
      }
    }
  }
  else
  {
    uint64_t v18 = 1;
  }

  return v18;
}

- (uint64_t)addContactToGroups:()UIAdditions inStore:request:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    uint64_t v12 = 1;
  }
  else
  {
    if (!v10)
    {
      uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:a1 file:@"CNContact+UIAdditions.m" lineNumber:545 description:@"A store is needed here"];
    }
    id v13 = CNUILogContactCard();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v30 = a1;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_18B625000, v13, OS_LOG_TYPE_DEFAULT, "[CNContact+UIAdditions] Adding contact %{public}p to groups %@", buf, 0x16u);
    }

    if (!v11) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          [v11 addMember:a1 toGroup:*(void *)(*((void *)&v25 + 1) + 8 * v18++)];
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v39 count:16];
      }
      while (v16);
    }

    id v24 = 0;
    uint64_t v12 = [v10 executeSaveRequest:v11 error:&v24];
    id v19 = v24;
    if ((v12 & 1) == 0)
    {
      id v20 = CNUILogContactCard();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = [a1 identifier];
        *(_DWORD *)buf = 138544386;
        v30 = v22;
        __int16 v31 = 2112;
        id v32 = v14;
        __int16 v33 = 2114;
        id v34 = v19;
        __int16 v35 = 2114;
        id v36 = v10;
        __int16 v37 = 2112;
        long long v38 = a1;
        _os_log_error_impl(&dword_18B625000, v20, OS_LOG_TYPE_ERROR, "[CNContact+UIAdditions] Could not add contact with identifer %{public}@ to groups %@, error %{public}@, store %{public}@, full contact %@", buf, 0x34u);
      }
    }
  }
  return v12;
}

- (void)updateContactTypeWithPolicy:()UIAdditions
{
  id v31 = a3;
  v4 = [a1 organizationName];
  v5 = [a1 snapshot];
  v6 = [v5 organizationName];

  id v7 = [a1 givenName];
  id v8 = [a1 snapshot];
  id v9 = [v8 givenName];

  id v10 = [a1 familyName];
  id v11 = [a1 snapshot];
  uint64_t v12 = [v11 familyName];

  id v13 = [a1 middleName];
  id v14 = [a1 snapshot];
  uint64_t v15 = [v14 middleName];

  if (v4 == v6 && v7 == v9 && v10 == v12 && v13 == v15) {
    goto LABEL_23;
  }
  uint64_t v16 = [a1 snapshot];
  if (v16)
  {
    uint64_t v17 = [a1 snapshot];
    uint64_t v18 = [v17 contactType];
  }
  else
  {
    uint64_t v18 = [a1 contactType];
  }

  uint64_t v19 = *MEMORY[0x1E4F5A298];
  id v20 = [a1 givenName];
  if ((*(unsigned int (**)(uint64_t, void *))(v19 + 16))(v19, v20))
  {
    id v21 = [a1 familyName];
    if ((*(unsigned int (**)(uint64_t, void *))(v19 + 16))(v19, v21))
    {
      uint64_t v22 = [a1 middleName];
      int v23 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v22) ^ 1;
    }
    else
    {
      int v23 = 1;
    }
  }
  else
  {
    int v23 = 1;
  }

  id v24 = [a1 organizationName];
  int v25 = (*(uint64_t (**)(uint64_t, void *))(v19 + 16))(v19, v24);

  if (v18 == 1)
  {
    int v26 = v23 & v25;
  }
  else
  {
    if (v18)
    {
      unsigned int v27 = 0;
      goto LABEL_20;
    }
    int v26 = v23 | v25;
  }
  unsigned int v27 = v26 ^ 1;
LABEL_20:
  uint64_t v28 = v27;
  if (!v31
    || ([NSNumber numberWithInteger:v27],
        id v29 = objc_claimAutoreleasedReturnValue(),
        int v30 = [v31 shouldSetValue:v29 property:*MEMORY[0x1E4F1AFA8] contact:a1 replacementValue:0],
        v29,
        v30))
  {
    [a1 setContactType:v28];
  }
LABEL_23:
}

- (id)addProperties:()UIAdditions excludingProperties:fromContact:
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  __int16 v41 = v8;
  id v11 = (void *)[v8 mutableCopy];
  uint64_t v40 = v9;
  [v11 removeObjectsInArray:v9];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *MEMORY[0x1E4F5A298];
    uint64_t v46 = *(void *)v60;
    uint64_t v42 = *MEMORY[0x1E4F5A298];
    do
    {
      uint64_t v15 = 0;
      uint64_t v43 = v13;
      do
      {
        if (*(void *)v60 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v15;
        uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * v15);
        v50 = [a1 valueForKey:v16];
        uint64_t v17 = [v47 valueForKey:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v18 = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v17);
          if (!v17) {
            goto LABEL_39;
          }
        }
        else
        {
          char v18 = 0;
          if (!v17) {
            goto LABEL_39;
          }
        }
        if (v18) {
          goto LABEL_39;
        }
        uint64_t v48 = v17;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v19 = (*(uint64_t (**)(uint64_t, void *))(v14 + 16))(v14, v50);
        }
        else {
          int v19 = 0;
        }
        char v20 = objc_opt_respondsToSelector();
        if (!v50 || v19)
        {
          uint64_t v17 = v48;
          id v31 = v48;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v23 = [MEMORY[0x1E4F1B970] contactPropertyWithContactNoCopy:a1 propertyKey:v16 identifier:0];
            [v10 addObject:v23];
LABEL_37:

LABEL_38:
            [a1 setValue:v31 forKey:v16];

            goto LABEL_39;
          }
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v23 = v31;
          uint64_t v32 = [v23 countByEnumeratingWithState:&v55 objects:v64 count:16];
          if (!v32) {
            goto LABEL_37;
          }
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v56;
          do
          {
            for (uint64_t i = 0; i != v33; ++i)
            {
              if (*(void *)v56 != v34) {
                objc_enumerationMutation(v23);
              }
              id v36 = (void *)MEMORY[0x1E4F1B970];
              __int16 v37 = [*(id *)(*((void *)&v55 + 1) + 8 * i) identifier];
              long long v38 = [v36 contactPropertyWithContactNoCopy:a1 propertyKey:v16 identifier:v37];

              [v10 addObject:v38];
            }
            uint64_t v33 = [v23 countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v33);
          id v31 = v23;
        }
        else
        {
          uint64_t v17 = v48;
          if ((v20 & 1) == 0) {
            goto LABEL_39;
          }
          uint64_t v21 = [v50 mutableCopy];
          uint64_t v22 = (void *)[v48 mutableCopy];
          uint64_t v44 = (void *)v21;
          [v22 removeObjectsInArray:v21];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v23 = v22;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v52;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v52 != v26) {
                  objc_enumerationMutation(v23);
                }
                uint64_t v28 = (void *)MEMORY[0x1E4F1B970];
                id v29 = [*(id *)(*((void *)&v51 + 1) + 8 * j) identifier];
                int v30 = [v28 contactPropertyWithContactNoCopy:a1 propertyKey:v16 identifier:v29];

                [v10 addObject:v30];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v51 objects:v63 count:16];
            }
            while (v25);
          }

          id v31 = v44;
          [v44 addObjectsFromArray:v23];
        }

        uint64_t v14 = v42;
        uint64_t v13 = v43;
        uint64_t v17 = v48;
        if (v31) {
          goto LABEL_38;
        }
LABEL_39:

        uint64_t v15 = v49 + 1;
      }
      while (v49 + 1 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)addAllPropertiesFromContact:()UIAdditions
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[CNContactView nameProperties];
  v6 = +[CNContactView allCardProperties];
  v12[1] = v6;
  id v7 = +[CNContactView allImageProperties];
  v12[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  id v9 = objc_msgSend(v8, "_cn_flatten");

  id v10 = [a1 addProperties:v9 excludingProperties:MEMORY[0x1E4F1CBF0] fromContact:v4];

  return v10;
}

- (uint64_t)hasNonPersistedData
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1ED9D4D38;
  if (objc_msgSendSuper2(&v3, sel_hasNonPersistedData)) {
    return 1;
  }
  else {
    return [a1 hasChanges];
  }
}

@end