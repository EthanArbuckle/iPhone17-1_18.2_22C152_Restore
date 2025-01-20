@interface EDBusinessCommonPrefixGroupingUpgradeStep
+ (BOOL)_deleteExistingBusinessesWithConnection:(id)a3 error:(id *)a4;
+ (BOOL)_persistBusinesses:(id)a3 connection:(id)a4 error:(id *)a5;
+ (BOOL)_shouldUseSimpleAddressForHighLevelDomain:(id)a3 displayName:(id)a4;
+ (BOOL)runWithConnection:(id)a3 error:(id *)a4;
+ (id)_commonDomains;
+ (id)_getGroupableAndUngroupableAddresses:(id *)a3 connection:(id)a4 error:(id *)a5;
+ (id)_groupAddresses:(id)a3;
+ (id)log;
+ (void)_resetGroupingDefault;
@end

@implementation EDBusinessCommonPrefixGroupingUpgradeStep

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EDBusinessCommonPrefixGroupingUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1) {
    dispatch_once(&log_onceToken_14, block);
  }
  v2 = (void *)log_log_14;

  return v2;
}

void __48__EDBusinessCommonPrefixGroupingUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;
}

+ (BOOL)runWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 _deleteExistingBusinessesWithConnection:v6 error:a4])
  {
    id v18 = 0;
    v7 = [a1 _getGroupableAndUngroupableAddresses:&v18 connection:v6 error:a4];
    id v8 = v18;
    if (v7)
    {
      v9 = [a1 _groupAddresses:v7];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __69__EDBusinessCommonPrefixGroupingUpgradeStep_runWithConnection_error___block_invoke;
      v16 = &unk_1E6BFFD30;
      id v10 = v9;
      id v17 = v10;
      [v8 enumerateKeysAndObjectsUsingBlock:&v13];
      char v11 = objc_msgSend(a1, "_persistBusinesses:connection:error:", v10, v6, a4, v13, v14, v15, v16);
      if (v11) {
        [a1 _resetGroupingDefault];
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

void __69__EDBusinessCommonPrefixGroupingUpgradeStep_runWithConnection_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = [v5 emailAddressValue];
  v7 = [v6 simpleAddress];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v5 stringValue];
  }
  id v10 = v9;

  char v11 = (void *)MEMORY[0x1E4F60DF0];
  v12 = [v10 lowercaseString];
  uint64_t v13 = [v11 pairWithFirst:v12 second:&stru_1F3583658];

  uint64_t v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
  v15 = v14;
  if (v14)
  {
    [v14 addObject:v16];
  }
  else
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v16, 0);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
}

+ (BOOL)_deleteExistingBusinessesWithConnection:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"businesses"];
  if ([v5 executeDeleteStatement:v6 error:a4])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"business_categories"];
    if ([v5 executeDeleteStatement:v7 error:a4])
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"business_addresses"];
      char v9 = [v5 executeDeleteStatement:v8 error:a4];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)_getGroupableAndUngroupableAddresses:(id *)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v11 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"ROWID" table:@"addresses"];
  [v11 addResultColumn:@"address"];
  [v11 addResultColumn:@"comment"];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __99__EDBusinessCommonPrefixGroupingUpgradeStep__getGroupableAndUngroupableAddresses_connection_error___block_invoke;
  v16[3] = &unk_1E6BFFD58;
  id v12 = v10;
  id v17 = v12;
  id v19 = a1;
  id v13 = v9;
  id v18 = v13;
  if ([v8 executeSelectStatement:v11 withBlock:v16 error:a5])
  {
    if (a3) {
      *a3 = v12;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
    if (a3) {
      *a3 = 0;
    }
  }

  return v14;
}

void __99__EDBusinessCommonPrefixGroupingUpgradeStep__getGroupableAndUngroupableAddresses_connection_error___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  v4 = [v18 objectAtIndexedSubscript:0];
  id v5 = [v4 numberValue];

  id v6 = [v18 objectAtIndexedSubscript:1];
  v7 = [v6 stringValue];

  id v8 = [v18 objectAtIndexedSubscript:2];
  id v9 = [v8 stringValue];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v7];
  [v10 setDisplayName:v9];
  char v11 = [v10 emailAddressValue];
  id v12 = [v11 simpleAddress];

  if (v12)
  {
    id v13 = [v11 highLevelDomainStrippingTopLevelDomain];
    int v14 = [*(id *)(a1 + 48) _shouldUseSimpleAddressForHighLevelDomain:v13 displayName:v9];
    uint64_t v15 = 40;
    if (v14) {
      uint64_t v15 = 32;
    }
    [*(id *)(a1 + v15) setObject:v11 forKeyedSubscript:v5];
  }
  else
  {
    id v13 = [v11 stringValue];
    id v16 = v13;
    if (!v13)
    {
      uint64_t v17 = [v10 stringValue];
      v2 = (void *)v17;
      if (v17) {
        id v16 = (void *)v17;
      }
      else {
        id v16 = v7;
      }
    }
    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v5];
    if (!v13) {
  }
    }
}

+ (BOOL)_shouldUseSimpleAddressForHighLevelDomain:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length]
    && (objc_msgSend(v7, "ef_stringByTrimmingWhitespaceAndNewlineCharacters"),
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    id v10 = [a1 _commonDomains];
    char v11 = [v10 containsObject:v6];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (id)_commonDomains
{
  if (_commonDomains_onceToken != -1) {
    dispatch_once(&_commonDomains_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)_commonDomains_sCommonDomains;

  return v2;
}

void __59__EDBusinessCommonPrefixGroupingUpgradeStep__commonDomains__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F35BB3D8];
  os_log_t v1 = (void *)_commonDomains_sCommonDomains;
  _commonDomains_sCommonDomains = v0;
}

+ (id)_groupAddresses:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke;
  v11[3] = &unk_1E6BFFD30;
  id v5 = v4;
  id v12 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_2;
  v9[3] = &unk_1E6BFFD80;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [v5 emailAddressValue];
  id v7 = [v6 highLevelDomain];
  id v8 = [v7 lowercaseString];

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:");
  }
  [v9 setObject:v5 forKeyedSubscript:v10];
}

void __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(_EDDisplayNameGroupingTrie);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_3;
  v16[3] = &unk_1E6BFFD30;
  id v8 = v7;
  uint64_t v17 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
  id v9 = [(_EDDisplayNameGroupingTrie *)v8 findGroups];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_4;
  v12[3] = &unk_1E6BFF738;
  id v10 = v6;
  id v13 = v10;
  id v11 = v5;
  id v14 = v11;
  id v15 = *(id *)(a1 + 32);
  [v9 enumerateKeysAndObjectsUsingBlock:v12];
}

void __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = [a3 emailAddressValue];
  id v7 = [v6 displayName];
  [v5 insertDisplayName:v7 addressID:v8];
}

void __61__EDBusinessCommonPrefixGroupingUpgradeStep__groupAddresses___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v6 = [v5 emailAddressValue];
  uint64_t v7 = [v6 displayName];
  id v8 = (void *)v7;
  id v9 = &stru_1F3583658;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  id v10 = v9;

  id v11 = [MEMORY[0x1E4F60DF0] pairWithFirst:*(void *)(a1 + 40) second:v10];
  id v12 = (void *)[v13 mutableCopy];
  [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v11];
}

+ (BOOL)_persistBusinesses:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__EDBusinessCommonPrefixGroupingUpgradeStep__persistBusinesses_connection_error___block_invoke;
  v11[3] = &unk_1E6BFFDA8;
  id v13 = v16;
  id v14 = &v23;
  id v8 = v7;
  id v12 = v8;
  id v15 = &v17;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  if (a5) {
    *a5 = (id) v18[5];
  }
  char v9 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v9;
}

void __81__EDBusinessCommonPrefixGroupingUpgradeStep__persistBusinesses_connection_error___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  v21 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  id v22 = a3;
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"businesses"];
  id v6 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[5] + 8) + 24)];
  [v24 setObject:v6 forKeyedSubscript:@"ROWID"];

  id v7 = [v23 first];
  [v24 setObject:v7 forKeyedSubscript:@"domain"];

  id v8 = [v23 second];
  [v24 setObject:v8 forKeyedSubscript:@"address_comment"];

  char v9 = (void *)a1[4];
  uint64_t v10 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v10 + 40);
  LOBYTE(v8) = [v9 executeInsertStatement:v24 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v8;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"business_addresses"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v22;
    uint64_t v12 = [v25 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v25);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * v14);
          id v16 = objc_msgSend(v11, "addValue", v21);
          uint64_t v17 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[5] + 8) + 24)];
          [v16 setObject:v17 forKeyedSubscript:@"business"];

          [v16 setObject:v15 forKeyedSubscript:@"address"];
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v25 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    id v18 = (void *)a1[4];
    uint64_t v19 = *(void *)(a1[7] + 8);
    id v26 = *(id *)(v19 + 40);
    char v20 = [v18 executeInsertStatement:v11 error:&v26];
    objc_storeStrong((id *)(v19 + 40), v26);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v20;
    if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
      ++*(void *)(*(void *)(a1[5] + 8) + 24);
    }
    else {
      unsigned char *v21 = 1;
    }
  }
  else
  {
    unsigned char *v21 = 1;
  }
}

+ (void)_resetGroupingDefault
{
  if (_resetGroupingDefault_onceToken != -1) {
    dispatch_once(&_resetGroupingDefault_onceToken, &__block_literal_global_90);
  }
  v2 = (void *)_resetGroupingDefault_userDefaults;

  [v2 removeObjectForKey:@"PreferredGroupedSenderGroupingLogic"];
}

void __66__EDBusinessCommonPrefixGroupingUpgradeStep__resetGroupingDefault__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v1 = (id)[v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.mail"];

  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.mail"];
  id v3 = (void *)_resetGroupingDefault_userDefaults;
  _resetGroupingDefault_userDefaults = v2;
}

@end