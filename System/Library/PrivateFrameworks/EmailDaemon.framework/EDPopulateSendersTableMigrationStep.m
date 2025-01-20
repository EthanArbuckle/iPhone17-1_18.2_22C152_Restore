@interface EDPopulateSendersTableMigrationStep
+ (BOOL)_clearSendersAddressesTableWithConnection:(id)a3;
+ (BOOL)_clearSendersTableWithConnection:(id)a3;
+ (BOOL)_insertGroupedSendersWithoutContact:(id)a3 withConnection:(id)a4;
+ (BOOL)_insertSenderWithAddresses:(id)a3 contact:(id)a4 connection:(id)a5 error:(id *)a6;
+ (BOOL)_insertSendersGroupedByContact:(id)a3 withConnection:(id)a4;
+ (BOOL)runWithConnection:(id)a3 sentMailboxURLs:(id)a4 contactStore:(id)a5;
+ (id)_addressesForSenderIDs:(id)a3 withConnection:(id)a4;
+ (id)_allSenderAddressIDsWithConnection:(id)a3 sentMailboxURLStrings:(id)a4;
+ (id)_combineDictionary:(id)a3 withDictionary:(id)a4;
+ (id)_senderIDsGroupedByContactsForEmailAddressesByContact:(id)a3 withConnection:(id)a4;
+ (id)_senderIDsGroupedByContactsForSenderAddressesToIDs:(id)a3 withContactStore:(id)a4 unmatchedEmailAddresses:(id *)a5 otherEmailAddressesByContact:(id *)a6;
+ (id)_senderIDsGroupedBySimpleAddressForEmailAddresses:(id)a3 senderIDsByEmailAddress:(id)a4;
@end

@implementation EDPopulateSendersTableMigrationStep

void ___ef_log_EDPopulateSendersTableMigrationStep_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDPopulateSendersTableMigrationStep");
  v1 = (void *)_ef_log_EDPopulateSendersTableMigrationStep_log;
  _ef_log_EDPopulateSendersTableMigrationStep_log = (uint64_t)v0;
}

+ (BOOL)runWithConnection:(id)a3 sentMailboxURLs:(id)a4 contactStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 _clearSendersAddressesTableWithConnection:v8]
    && [a1 _clearSendersTableWithConnection:v8])
  {
    v11 = objc_msgSend(v9, "ef_compactMapSelector:", sel_absoluteString);
    v12 = [a1 _allSenderAddressIDsWithConnection:v8 sentMailboxURLStrings:v11];
    if (v12)
    {
      v13 = [a1 _addressesForSenderIDs:v12 withConnection:v8];
      if (v13)
      {
        id v22 = 0;
        id v23 = 0;
        v14 = [a1 _senderIDsGroupedByContactsForSenderAddressesToIDs:v13 withContactStore:v10 unmatchedEmailAddresses:&v23 otherEmailAddressesByContact:&v22];
        id v21 = v23;
        id v20 = v22;
        v15 = objc_msgSend(a1, "_senderIDsGroupedByContactsForEmailAddressesByContact:withConnection:");
        v16 = [a1 _combineDictionary:v14 withDictionary:v15];

        if ([a1 _insertSendersGroupedByContact:v16 withConnection:v8])
        {
          v17 = [a1 _senderIDsGroupedBySimpleAddressForEmailAddresses:v21 senderIDsByEmailAddress:v13];
          char v18 = [a1 _insertGroupedSendersWithoutContact:v17 withConnection:v8];
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

+ (id)_allSenderAddressIDsWithConnection:(id)a3 sentMailboxURLStrings:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EF8]) initWithResultColumn:@"address" table:@"recipients"];
  uint64_t v8 = *MEMORY[0x1E4F60D08];
  id v9 = (id)[v7 join:@"addresses" sourceColumn:@"address" targetColumn:*MEMORY[0x1E4F60D08]];
  id v10 = [v7 join:@"messages" sourceColumn:@"message" targetColumn:v8];
  id v11 = (id)[v10 join:@"mailboxes" sourceColumn:@"mailbox" targetColumn:v8];
  v12 = [MEMORY[0x1E4F60E78] table:@"mailboxes" column:@"url"];
  v13 = [v12 in:v6];
  [v7 setWhere:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__EDPopulateSendersTableMigrationStep__allSenderAddressIDsWithConnection_sentMailboxURLStrings___block_invoke;
  v22[3] = &unk_1E6BFF3B0;
  id v15 = v14;
  id v23 = v15;
  id v21 = 0;
  char v16 = [v5 executeSelectStatement:v7 withBlock:v22 error:&v21];
  id v17 = v21;
  if (v16)
  {
    char v18 = [v15 allObjects];
  }
  else
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _allSenderAddressIDsWithConnection:sentMailboxURLStrings:]();
    }

    char v18 = 0;
  }

  return v18;
}

void __96__EDPopulateSendersTableMigrationStep__allSenderAddressIDsWithConnection_sentMailboxURLStrings___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  v3 = [v4 numberValue];
  [v2 addObject:v3];
}

+ (id)_addressesForSenderIDs:(id)a3 withConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v8 = *MEMORY[0x1E4F60D08];
  id v9 = (void *)[v7 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"addresses"];
  [v9 addResultColumn:@"comment"];
  [v9 addResultColumn:@"address"];
  id v10 = [MEMORY[0x1E4F60E78] column:v8];
  id v11 = [v10 in:v5];
  [v9 setWhere:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __77__EDPopulateSendersTableMigrationStep__addressesForSenderIDs_withConnection___block_invoke;
  v21[3] = &unk_1E6BFF3B0;
  id v13 = v12;
  id v22 = v13;
  id v20 = 0;
  char v14 = [v6 executeSelectStatement:v9 withBlock:v21 error:&v20];
  id v15 = v20;
  char v16 = v13;
  if ((v14 & 1) == 0)
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _addressesForSenderIDs:withConnection:]();
    }

    char v16 = 0;
  }
  id v18 = v16;

  return v18;
}

void __77__EDPopulateSendersTableMigrationStep__addressesForSenderIDs_withConnection___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 objectAtIndexedSubscript:0];
  id v4 = [v3 numberValue];

  id v5 = [v11 objectAtIndexedSubscript:1];
  id v6 = [v5 stringValue];

  id v7 = [v11 objectAtIndexedSubscript:2];
  uint64_t v8 = [v7 stringValue];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v8];
  [v9 setDisplayName:v6];
  id v10 = [v9 emailAddressValue];
  if (v10) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v10];
  }
}

+ (id)_senderIDsGroupedByContactsForEmailAddressesByContact:(id)a3 withConnection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v8 = (void *)[v7 initWithResultColumn:*MEMORY[0x1E4F60D08] table:@"addresses"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke;
  v13[3] = &unk_1E6C04788;
  id v14 = v8;
  id v9 = v6;
  id v15 = v9;
  id v10 = v8;
  id v11 = objc_msgSend(v5, "ef_mapValues:", v13);

  return v11;
}

id __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = a2;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v19;
  uint64_t v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16, v19);
  if (v3)
  {
    uint64_t v4 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v25 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v7 = [MEMORY[0x1E4F60E78] column:@"address"];
        uint64_t v8 = [v6 simpleAddress];
        id v9 = [v7 equalTo:v8];

        id v10 = [v6 displayName];
        if (v10)
        {
          id v11 = [MEMORY[0x1E4F60E78] column:@"comment"];
          id v12 = [v11 equalTo:v10];

          id v13 = objc_alloc(MEMORY[0x1E4F60E48]);
          v28[0] = v9;
          v28[1] = v12;
          id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
          id v15 = (void *)[v13 initWithExpressions:v14];
          [*(id *)(a1 + 32) setWhere:v15];
        }
        else
        {
          [*(id *)(a1 + 32) setWhere:v9];
        }
        uint64_t v17 = *(void *)(a1 + 32);
        char v16 = *(void **)(a1 + 40);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke_2;
        v22[3] = &unk_1E6BFF3B0;
        id v23 = v21;
        [v16 executeSelectStatement:v17 withBlock:v22 error:0];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v3);
  }

  return v21;
}

void __108__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForEmailAddressesByContact_withConnection___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 objectAtIndexedSubscript:0];
  uint64_t v3 = [v4 numberValue];
  [v2 addObject:v3];
}

+ (BOOL)_insertSendersGroupedByContact:(id)a3 withConnection:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__28;
  id v23 = __Block_byref_object_dispose__28;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __85__EDPopulateSendersTableMigrationStep__insertSendersGroupedByContact_withConnection___block_invoke;
  id v14 = &unk_1E6C047B0;
  char v16 = &v25;
  id v18 = a1;
  id v7 = v6;
  id v15 = v7;
  uint64_t v17 = &v19;
  [a3 enumerateKeysAndObjectsUsingBlock:&v11];
  if (*((unsigned char *)v26 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v20[5], "ef_publicDescription", v11, v12, v13, v14);
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _insertSendersGroupedByContact:withConnection:]();
    }

    BOOL v8 = *((unsigned char *)v26 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v8;
}

void __85__EDPopulateSendersTableMigrationStep__insertSendersGroupedByContact_withConnection___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a1[4];
  id v10 = (void *)a1[7];
  uint64_t v11 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v11 + 40);
  char v12 = [v10 _insertSenderWithAddresses:v8 contact:v7 connection:v9 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v12;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
}

+ (BOOL)_insertGroupedSendersWithoutContact:(id)a3 withConnection:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  id v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      uint64_t v12 = 0;
      id v13 = v9;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        id v19 = v13;
        char v15 = [a1 _insertSenderWithAddresses:v14 contact:0 connection:v7 error:&v19];
        id v9 = v19;

        if ((v15 & 1) == 0)
        {

          _ef_log_EDPopulateSendersTableMigrationStep();
          uint64_t v17 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v9, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            +[EDPopulateSendersTableMigrationStep _insertGroupedSendersWithoutContact:withConnection:]();
          }

          BOOL v16 = 0;
          goto LABEL_13;
        }
        ++v12;
        id v13 = v9;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
  uint64_t v17 = v8;
LABEL_13:

  return v16;
}

+ (BOOL)_clearSendersTableWithConnection:(id)a3
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"senders"];
  v9[0] = 0;
  char v5 = [v3 executeDeleteStatement:v4 error:v9];
  id v6 = v9[0];
  if (v6)
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _clearSendersTableWithConnection:]();
    }
  }
  return v5;
}

+ (BOOL)_clearSendersAddressesTableWithConnection:(id)a3
{
  v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F60E98]) initWithTable:@"sender_addresses"];
  v9[0] = 0;
  char v5 = [v3 executeDeleteStatement:v4 error:v9];
  id v6 = v9[0];
  if (v6)
  {
    _ef_log_EDPopulateSendersTableMigrationStep();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EDPopulateSendersTableMigrationStep _clearSendersAddressesTableWithConnection:]();
    }
  }
  return v5;
}

+ (BOOL)_insertSenderWithAddresses:(id)a3 contact:(id)a4 connection:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v24 = a4;
  id v8 = a5;
  long long v23 = v8;
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"senders"];
  [v25 setObject:&unk_1F35BAEB0 forKeyedSubscript:@"bucket"];
  [v25 setObject:&unk_1F35BAEC8 forKeyedSubscript:@"user_initiated"];
  if (v24)
  {
    id v9 = [v24 identifier];
    [v25 setObject:v9 forKeyedSubscript:@"contact_identifier"];
  }
  if (objc_msgSend(v8, "executeInsertStatement:error:", v25, a6, a6))
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"sender_addresses" conflictResolution:4];
    uint64_t v11 = [v8 lastInsertedDatabaseID];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v22;
    uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          BOOL v16 = [v10 addValue];
          [v16 setObject:v15 forKeyedSubscript:@"address"];
          uint64_t v17 = [NSNumber numberWithLongLong:v11];
          [v16 setObject:v17 forKeyedSubscript:@"sender"];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v12);
    }

    char v18 = [v23 executeInsertStatement:v10 error:v21];
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

+ (id)_senderIDsGroupedByContactsForSenderAddressesToIDs:(id)a3 withContactStore:(id)a4 unmatchedEmailAddresses:(id *)a5 otherEmailAddressesByContact:(id *)a6
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = *MEMORY[0x1E4F1ADE0];
  v46[0] = *MEMORY[0x1E4F1ADF0];
  v46[1] = v11;
  v46[2] = *MEMORY[0x1E4F1ADC8];
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  uint64_t v13 = [v9 allKeys];
  v33 = a6;
  v34 = objc_msgSend(v13, "ef_compactMapSelector:", sel_simpleAddress);

  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v34];
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke;
  v38[3] = &unk_1E6C047D8;
  id v16 = v10;
  id v39 = v16;
  id v17 = v12;
  id v40 = v17;
  id v18 = v31;
  id v41 = v18;
  id v19 = v9;
  id v42 = v19;
  id v20 = v32;
  id v43 = v20;
  id v21 = v14;
  id v44 = v21;
  id v22 = v15;
  id v45 = v22;
  [v19 enumerateKeysAndObjectsUsingBlock:v38];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke_2;
  v35[3] = &unk_1E6C04800;
  id v24 = v17;
  id v36 = v24;
  id v37 = v23;
  id v25 = v23;
  [v21 enumerateKeysAndObjectsUsingBlock:v35];
  id v26 = v22;
  *a5 = v26;
  id v27 = v25;
  id *v33 = v27;
  long long v28 = v37;
  id v29 = v18;

  return v29;
}

void __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v23 = a3;
  char v5 = objc_msgSend(*(id *)(a1 + 32), "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v22, *(void *)(a1 + 40), 0);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];
    if (v6)
    {
      id v21 = v6;
      [v6 addObject:v23];
    }
    else
    {
      id v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v23, 0, 0);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:");
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [v5 emailAddresses];
    id v8 = objc_msgSend(v7, "ef_compactMapSelector:", sel_value);

    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = [*(id *)(*((void *)&v24 + 1) + 8 * i) emailAddressValue];
          uint64_t v13 = v12;
          if (v12)
          {
            id v14 = [v12 displayName];

            if (v14)
            {
              id v15 = [*(id *)(a1 + 56) objectForKeyedSubscript:v13];
              BOOL v16 = v15 == 0;

              if (!v16) {
                goto LABEL_20;
              }
            }
            else
            {
              id v17 = *(void **)(a1 + 64);
              id v18 = [v13 simpleAddress];
              LOBYTE(v17) = [v17 containsObject:v18];

              if (v17) {
                goto LABEL_20;
              }
            }
            id v19 = [*(id *)(a1 + 72) objectForKeyedSubscript:v13];
            id v20 = v19;
            if (v19)
            {
              objc_msgSend(v19, "ef_addObjectIfAbsent:", v5);
            }
            else
            {
              id v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
              objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:");
            }
          }
LABEL_20:
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [*(id *)(a1 + 80) addObject:v22];
  }
}

void __160__EDPopulateSendersTableMigrationStep__senderIDsGroupedByContactsForSenderAddressesToIDs_withContactStore_unmatchedEmailAddresses_otherEmailAddressesByContact___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1B8F8];
  id v7 = [v11 displayName];
  id v8 = objc_msgSend(v6, "em_bestMatchForName:fromContacts:keysToCheck:", v7, v5, *(void *)(a1 + 32));

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    uint64_t v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "ef_addObjectIfAbsent:", v11);
    }
    else
    {
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
    }
  }
}

+ (id)_senderIDsGroupedBySimpleAddressForEmailAddresses:(id)a3 senderIDsByEmailAddress:(id)a4
{
  id v5 = a4;
  id v6 = objc_msgSend(a3, "ef_groupBy:", &__block_literal_global_72_0);
  id v7 = [v6 allValues];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_2;
  v11[3] = &unk_1E6C04870;
  id v8 = v5;
  id v12 = v8;
  uint64_t v9 = objc_msgSend(v7, "ef_compactMap:", v11);

  return v9;
}

id __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 simpleAddress];

  return v2;
}

id __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_3;
  v6[3] = &unk_1E6C04848;
  id v7 = *(id *)(a1 + 32);
  id v3 = objc_msgSend(a2, "ef_compactMap:", v6);
  id v4 = objc_msgSend(v3, "ef_notEmpty");

  return v4;
}

id __113__EDPopulateSendersTableMigrationStep__senderIDsGroupedBySimpleAddressForEmailAddresses_senderIDsByEmailAddress___block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  return v2;
}

+ (id)_combineDictionary:(id)a3 withDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    if ([v6 count])
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke;
      v18[3] = &unk_1E6C04898;
      id v8 = v6;
      id v19 = v8;
      id v9 = v7;
      id v20 = v9;
      [v5 enumerateKeysAndObjectsUsingBlock:v18];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke_2;
      v15[3] = &unk_1E6C04898;
      id v16 = v5;
      id v10 = v9;
      id v17 = v10;
      [v8 enumerateKeysAndObjectsUsingBlock:v15];
      id v11 = v17;
      id v12 = v10;

      goto LABEL_7;
    }
    id v13 = v5;
  }
  else
  {
    id v13 = v6;
  }
  id v12 = v13;
LABEL_7:

  return v12;
}

void __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  id v8 = (void *)v7;
  if (v7)
  {
    v11[0] = v6;
    v11[1] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    id v10 = objc_msgSend(v9, "ef_flatten");
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v5];
  }
  else
  {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

void __73__EDPopulateSendersTableMigrationStep__combineDictionary_withDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

+ (void)_allSenderAddressIDsWithConnection:sentMailboxURLStrings:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to find recipients of sent messages with error: %{public}@", v5);
}

+ (void)_addressesForSenderIDs:withConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to get addresses for recipients of sent messages: %{public}@", v5);
}

+ (void)_insertSendersGroupedByContact:withConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to insert senders with contacts with error: %{public}@", v5);
}

+ (void)_insertGroupedSendersWithoutContact:withConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to insert senders without contacts with error: %{public}@", v5);
}

+ (void)_clearSendersTableWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to clear senders table: %{public}@", v5);
}

+ (void)_clearSendersAddressesTableWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6(&dword_1DB39C000, v3, v4, "Failed to clear sender addresses table: %{public}@", v5);
}

@end