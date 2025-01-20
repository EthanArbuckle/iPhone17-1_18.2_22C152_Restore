@interface IDSService(MSPExtras)
+ (id)_msp_IDSIdentifierFor:()MSPExtras;
+ (id)_msp_IDSIdentifiersFor:()MSPExtras;
- (BOOL)_msp_hasValidIDSAccount;
- (id)_msp_accountFromIdentifier:()MSPExtras;
- (id)_msp_currentAccount;
- (id)_msp_currentAccountIdentifier;
- (id)_msp_removeSelfFrom:()MSPExtras;
@end

@implementation IDSService(MSPExtras)

- (BOOL)_msp_hasValidIDSAccount
{
  v1 = objc_msgSend(a1, "_msp_currentAccount");
  BOOL v2 = v1 != 0;

  return v2;
}

- (id)_msp_currentAccountIdentifier
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v2 = MSPGetSharedTripLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1, "_msp_currentAccount");
    v4 = [v3 aliasStrings];
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEFAULT, "_msp_currentAccountIdentifier choosing from aliasStrings %@", buf, 0xCu);
  }
  v5 = objc_msgSend(a1, "_msp_currentAccount");
  v6 = [v5 aliasStrings];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v8 = objc_msgSend(a1, "_msp_currentAccount");
    v9 = [v8 aliasStrings];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v15 = objc_msgSend(a1, "_msp_currentAccount");
          v16 = [v15 loginID];
          LOBYTE(v14) = [v14 isEqualToString:v16];

          if (v14)
          {
            v23 = objc_msgSend(a1, "_msp_currentAccount");
            uint64_t v24 = [v23 loginID];
            goto LABEL_22;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v17 = objc_msgSend(a1, "_msp_currentAccount", 0);
    v9 = [v17 aliasStrings];

    uint64_t v18 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v9);
          }
          v22 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          if ([v22 containsString:@"@"])
          {
            id v26 = v22;
            goto LABEL_25;
          }
        }
        uint64_t v19 = [v9 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v9 = objc_msgSend(a1, "_msp_currentAccount");
    v23 = [v9 aliasStrings];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
LABEL_22:
    v25 = (void *)v24;
  }
  else
  {
    v9 = objc_msgSend(a1, "_msp_currentAccount");
    id v26 = [v9 loginID];
LABEL_25:
    v25 = v26;
  }

  return v25;
}

- (id)_msp_currentAccount
{
  v1 = [a1 accounts];
  BOOL v2 = [v1 allObjects];

  uint64_t v3 = [v2 count];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4;
  uint64_t v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__IDSService_MSPExtras___msp_currentAccount__block_invoke;
  v6[3] = &unk_1E617E138;
  v6[4] = &v7;
  v6[5] = v3;
  [v2 enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_msp_accountFromIdentifier:()MSPExtras
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 accounts];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uniqueID == %@", v4];
  uint64_t v7 = [v5 filteredSetUsingPredicate:v6];

  v8 = [v7 allObjects];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = MSPGetSharedTripLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_INFO, "_msp_accountFromIdentifier foundAccount %@ for identifier %@ from set %@", buf, 0x20u);
    }

    id v12 = v9;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_INFO, "_msp_accountFromIdentifier no account for identifier %@ from set %@", buf, 0x16u);
    }

    v13 = [v5 allObjects];
    id v12 = [v13 firstObject];
  }

  return v12;
}

- (id)_msp_removeSelfFrom:()MSPExtras
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v4 = (void *)[v21 mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [a1 activeAliases];
  v6 = (void *)[v5 copy];

  obuint64_t j = v6;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = v21;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              __int16 v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if ([v17 containsString:v11]) {
                [v4 removeObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v14);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  id v18 = (void *)[v4 copy];

  return v18;
}

+ (id)_msp_IDSIdentifiersFor:()MSPExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend((id)objc_opt_class(), "_msp_IDSIdentifierFor:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

+ (id)_msp_IDSIdentifierFor:()MSPExtras
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F64860] sharedPlatform];
  if ([v4 isInternalInstall])
  {
    int IsValid = MSPSharedTripVirtualReceiverIsValid(v3);

    if (IsValid) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  if (IDSIDHasToken())
  {
LABEL_6:
    id v6 = v3;
    goto LABEL_8;
  }
  id v6 = (id)IDSCopyBestGuessIDForID();
LABEL_8:
  uint64_t v7 = v6;

  return v7;
}

@end