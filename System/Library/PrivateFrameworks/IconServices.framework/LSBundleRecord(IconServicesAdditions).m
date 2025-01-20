@interface LSBundleRecord(IconServicesAdditions)
- (id)_IS_iconDictionaryForTag:()IconServicesAdditions tagClass:;
- (id)_IS_iconDictionaryForType:()IconServicesAdditions;
- (id)_IS_iconProvidingLineageForRecord:()IconServicesAdditions;
- (uint64_t)_IS_platformToIFPlatform;
@end

@implementation LSBundleRecord(IconServicesAdditions)

- (id)_IS_iconProvidingLineageForRecord:()IconServicesAdditions
{
  id v4 = a3;
  v5 = [a1 importedTypeRecords];
  v6 = [a1 exportedTypeRecords];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_2;
  v25[3] = &unk_1E5F08EA8;
  id v7 = v6;
  id v26 = v7;
  id v8 = v5;
  id v27 = v8;
  v9 = (void (**)(void, void))MEMORY[0x1B3E71130](v25);
  v10 = objc_opt_new();
  v11 = ((void (**)(void, id))v9)[2](v9, v4);

  if (v11)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    if (__75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke([v10 addObject:v11], v11))
    {
      *((unsigned char *)v22 + 24) = 1;
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_3;
      v15[3] = &unk_1E5F08ED0;
      v18 = v9;
      id v19 = &__block_literal_global_82;
      id v12 = v10;
      id v16 = v12;
      v20 = &v21;
      id v17 = v11;
      [v17 enumeratePedigreeWithBlock:v15];

      if (!*((unsigned char *)v22 + 24)) {
        [v12 removeAllObjects];
      }
    }
    _Block_object_dispose(&v21, 8);
  }
  v13 = (void *)[v10 copy];

  return v13;
}

- (id)_IS_iconDictionaryForTag:()IconServicesAdditions tagClass:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v32 = a1;
  id obj = [a1 claimRecords];
  uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v35)
  {
    v36 = 0;
    uint64_t v34 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        v37 = v9;
        v10 = [v9 typeIdentifiers];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v39;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v39 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:*(void *)(*((void *)&v38 + 1) + 8 * v14)];
            id v16 = objc_msgSend(v15, "_ICP_filenameExtensions");
            char v17 = [v16 containsObject:v6];

            if (v17) {
              break;
            }

            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v38 objects:v48 count:16];
              if (v12) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          id v18 = v37;

          if (v18) {
            goto LABEL_22;
          }
          v36 = v15;
        }
        else
        {
LABEL_14:
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v35);
    id v18 = 0;
    v15 = v36;
  }
  else
  {
    v15 = 0;
    id v18 = 0;
  }
LABEL_22:

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [v18 iconDictionary];
    v20 = objc_msgSend(v19, "_IF_stringForKey:", 0x1F0639250);
    if (v20)
    {
      uint64_t v21 = (void *)[v19 mutableCopy];
      [v21 removeObjectForKey:0x1F0639250];
      [v21 setObject:v20 forKey:0x1F063A2D0];
      uint64_t v22 = [v21 copy];

      id v19 = (void *)v22;
    }
    if (![v19 count] && objc_msgSend(v15, "isDeclared"))
    {
      uint64_t v23 = objc_msgSend(v32, "_IS_iconProvidingLineageForRecord:", v15);
      char v24 = [v23 lastObject];
      v25 = v24;
      if (v24)
      {
        uint64_t v26 = [v24 iconDictionary];

        id v19 = (void *)v26;
      }
    }
    if (![v19 count])
    {
      id v27 = v7;
      id v28 = v32;
      if (objc_opt_respondsToSelector())
      {
        v29 = [v28 iconDictionary];

        uint64_t v46 = 0x1F063A2F0;
        id v47 = v6;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id v19 = objc_msgSend(v29, "_IF_dictionaryAddingEntriesFromDictionary:", v30);
      }
      id v7 = v27;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)_IS_iconDictionaryForType:()IconServicesAdditions
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(MEMORY[0x1E4F22490], "typeRecordWithIdentifier:");
  v3 = objc_msgSend(a1, "_IS_iconProvidingLineageForRecord:", v2);
  id v4 = [v3 lastObject];
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 iconDictionary];
    id v7 = objc_msgSend(v6, "_IF_stringForKey:", 0x1F0639250);
    if (v7)
    {
      id v8 = (void *)[v6 mutableCopy];
      [v8 removeObjectForKey:0x1F0639250];
      [v8 setObject:v7 forKey:0x1F063A310];
      uint64_t v9 = [v8 copy];

      id v6 = (void *)v9;
    }
  }
  else
  {
    id v6 = 0;
  }
  if (![v6 count])
  {
    id v10 = a1;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [v10 iconDictionary];

      id v6 = (void *)v11;
    }
    uint64_t v12 = [v2 preferredTagOfClass:*MEMORY[0x1E4F224F8]];
    uint64_t v13 = (void *)v12;
    if (v12)
    {
      uint64_t v17 = 0x1F063A2F0;
      v18[0] = v12;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v15 = objc_msgSend(v6, "_IF_dictionaryAddingEntriesFromDictionary:", v14);

      id v6 = (void *)v15;
    }
  }
  return v6;
}

- (uint64_t)_IS_platformToIFPlatform
{
  if ([a1 platform] == 1) {
    return 1;
  }
  if ([a1 platform] == 2 || objc_msgSend(a1, "platform") == 7) {
    return 4;
  }
  if ([a1 platform] == 6) {
    return 2;
  }
  if ([a1 platform] == 4 || objc_msgSend(a1, "platform") == 9) {
    return 8;
  }
  if ([a1 platform] == 11 || objc_msgSend(a1, "platform") == 12) {
    return 16;
  }
  if ([a1 platform] == 3) {
    return 32;
  }
  return 32 * ([a1 platform] == 8);
}

@end