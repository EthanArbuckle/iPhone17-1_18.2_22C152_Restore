uint64_t sub_2405C6BC8(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2405CD67C();
  }

  [MEMORY[0x263F5ACA0] startSharedContextWithOptions:2056];
  return [*(id *)(a1 + 40) acAccount:*(void *)(a1 + 32) wasDeletedInStore:*(void *)(a1 + 48)];
}

void sub_2405C6E80(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2405CD8C8(a1);
  }

  v3 = (id *)(a1 + 32);
  v4 = [*(id *)(a1 + 32) dirtyProperties];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_2405CD828();
    }
  }
  v7 = [*v3 dirtyAccountProperties];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_2405CD788();
    }
  }
  v10 = [*v3 dirtyDataclassProperties];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_2405CD6E8();
    }
  }
  [MEMORY[0x263F5ACA0] startSharedContextWithOptions:2056];
  [*(id *)(a1 + 40) deleteSpotlightDomainIfNecessaryForAccount:*(void *)(a1 + 48) oldAccount:*(void *)(a1 + 56)];
  int v13 = *(_DWORD *)(a1 + 72);
  if (v13 == 3)
  {
    [*(id *)(a1 + 40) acAccount:*(void *)(a1 + 32) wasDeletedInStore:*(void *)(a1 + 64)];
  }
  else if (v13 == 2 || v13 == 1)
  {
    [*(id *)(a1 + 40) acAccount:*(void *)(a1 + 32) wasModifiedInStore:*(void *)(a1 + 64)];
  }
  v14 = [MEMORY[0x263F5ACA0] sharedContext];
  v15 = [v14 workerManagedObjectContext];

  [MEMORY[0x263F5AC90] updateAllLegacyAccountMigrationStatesInContext:v15];
  dispatch_time_t v16 = dispatch_time(0, 2000000000);
  dispatch_after(v16, MEMORY[0x263EF83A0], &unk_26F4B4010);
}

void sub_2405C70B8()
{
  id v0 = [MEMORY[0x263F5AEC8] sharedWidget];
  [v0 reloadTimelinesWithReason:@"Account has changed"];
}

uint64_t sub_2405C715C()
{
  qword_26AFC7178 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263EFAE50], *MEMORY[0x263EFAE58], *MEMORY[0x263EFAEE8], *MEMORY[0x263EFAEF8], *MEMORY[0x263EFAF08], *MEMORY[0x263EFAF18], *MEMORY[0x263EFAFE0], *MEMORY[0x263EFAEB0], 0);
  return MEMORY[0x270F9A758]();
}

void sub_2405C7AB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = os_log_create("com.apple.notes", "Accounts");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2405CDBE4();
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_2405CDB78();
    }

    [MEMORY[0x263F5AEB0] setObject:0 forKey:*MEMORY[0x263F5AF20]];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_2405C7F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_2405C7FD0(uint64_t a1)
{
  v2 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_2405CDE00();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_2405C802C(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263F5AB58];
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = [v1 accountWithIdentifier:v3 context:*(void *)(v2 + 8)];

  uint64_t v5 = (void *)v4;
  if (v4) {
    goto LABEL_42;
  }
  v6 = os_log_create("com.apple.notes", "Accounts");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_2405CDED0(v2, v6);
  }

  v7 = [MEMORY[0x263F841B0] sharedManager];
  uint64_t v8 = [v7 currentUser];

  v52 = v8;
  uint64_t v9 = [v8 userType];
  v10 = [*(id *)v2 objectForKeyedSubscript:*MEMORY[0x263F5ADE0]];
  uint64_t v11 = [*(id *)v2 objectForKeyedSubscript:*MEMORY[0x263F5ADE8]];
  v12 = [*(id *)v2 objectForKeyedSubscript:*MEMORY[0x263F5ADF0]];
  if (!v10 || !v11 || ![v10 BOOLValue] || (objc_msgSend(v11, "BOOLValue") & 1) == 0)
  {
    int v13 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_2405CDE9C();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  v54 = v12;
  v14 = (void *)MEMORY[0x263F5AB58];
  v15 = [*(id *)(a1 + 32) identifier];
  dispatch_time_t v16 = (void *)[v14 newAccountWithIdentifier:v15 type:1 context:*(void *)(a1 + 40)];

  [v16 setNeedsToBeFetchedFromCloud:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if (v10) {
    objc_msgSend(v16, "setDidChooseToMigrate:", objc_msgSend(v10, "BOOLValue"));
  }
  if (v11) {
    objc_msgSend(v16, "setDidFinishMigration:", objc_msgSend(v11, "BOOLValue"));
  }
  v50 = v11;
  if (v12) {
    objc_msgSend(v16, "setDidMigrateOnMac:", objc_msgSend(v12, "BOOLValue"));
  }
  v51 = v10;
  uint64_t v17 = objc_msgSend(*(id *)v2, "ic_isNotesMigrated");
  int v18 = objc_msgSend(*(id *)v2, "ic_hasICloudEmailAddress");
  v53 = (uint64_t *)v2;
  uint64_t v19 = objc_msgSend(*(id *)v2, "ic_isManagedAppleID");
  if (v9 == 1) {
    int v20 = 1;
  }
  else {
    int v20 = v17 | v19 | v18 ^ 1;
  }
  if ([v16 didChooseToMigrate])
  {
    if ([v16 didFinishMigration] & 1) != 0 || ((v20 ^ 1)) {
      goto LABEL_29;
    }
LABEL_25:
    v21 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *v53;
      BOOL v23 = v9 == 1;
      *(_DWORD *)buf = 67110146;
      int v63 = v17;
      __int16 v64 = 1024;
      int v65 = v18 ^ 1;
      __int16 v66 = 1024;
      int v67 = v19;
      __int16 v68 = 1024;
      BOOL v69 = v9 == 1;
      __int16 v70 = 2112;
      uint64_t v71 = v22;
      _os_log_impl(&dword_2405C4000, v21, OS_LOG_TYPE_DEFAULT, "Automatically upgrading Notes because notesMigrated in account bag (%d), there is no iCloud email address (%d), Apple ID is managed (%d), or user is ephemeral (%d): %@", buf, 0x24u);
    }
    else
    {
      BOOL v23 = v9 == 1;
    }

    NSLog(&cfstr_AutomaticallyU.isa, v17, v18 ^ 1u, v19, v23, *(void *)(a1 + 32));
    [v16 setDidChooseToMigrate:1];
    [v16 setDidFinishMigration:1];
    [v16 setDidMigrateOnMac:1];
    [v16 updateChangeCountWithReason:@"Upgraded account"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_29;
  }
  if (v20) {
    goto LABEL_25;
  }
LABEL_29:
  v24 = v16;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v25 = a1;
  v26 = [MEMORY[0x263F5AB58] allAccountsInContext:*(void *)(a1 + 40)];
  v27 = (void *)[v26 copy];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v57 objects:v61 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v58 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v33 = *(void **)(v25 + 48);
        v34 = [v32 identifier];
        uint64_t v35 = [v33 accountWithIdentifier:v34];

        if ([v32 accountType] == 1)
        {
          v36 = [v32 identifier];
          v37 = [v24 identifier];
          if ([v36 isEqual:v37])
          {

            uint64_t v25 = a1;
          }
          else
          {
            char v38 = objc_msgSend(v35, "ic_isNotesEnabled");

            uint64_t v25 = a1;
            if ((v38 & 1) == 0) {
              [MEMORY[0x263F5AB58] deleteAccount:v32];
            }
          }
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v57 objects:v61 count:16];
    }
    while (v29);
  }

  uint64_t v4 = 0;
  uint64_t v2 = (uint64_t)v53;
  uint64_t v5 = v24;
LABEL_42:
  v39 = [v5 name];
  v40 = [*(id *)v2 accountDescription];
  char v41 = [v39 isEqualToString:v40];

  if (v41)
  {
    v42 = [MEMORY[0x263F5ABE8] sharedController];
    uint64_t v43 = a1;
    [v42 batchUpdateTopicSubscriptionsAllAccountsInContext:*(void *)(a1 + 40)];

    if (v4) {
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v43 = a1;
    v44 = [*(id *)(a1 + 32) accountDescription];
    [v5 setName:v44];

    v45 = [MEMORY[0x263F5ABE8] sharedController];
    [v45 batchUpdateTopicSubscriptionsAllAccountsInContext:*(void *)(a1 + 40)];
  }
  v46 = *(void **)(v43 + 40);
  id v56 = 0;
  char v47 = [v46 save:&v56];
  id v48 = v56;
  if ((v47 & 1) == 0)
  {
    v49 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_2405CDE34();
    }
  }
LABEL_51:
}

void sub_2405C86C0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F5AB58];
  id v3 = [*(id *)(a1 + 32) identifier];
  uint64_t v4 = [v2 accountWithIdentifier:v3 context:*(void *)(a1 + 40)];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    [*(id *)(a1 + 48) fetchAndSetMigrationStateForACAccount:*(void *)(a1 + 32) inStore:*(void *)(a1 + 56)];
    uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F5ADE0]];
    v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F5ADE8]];
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x263F5ADF0]];
    objc_msgSend(v4, "setDidChooseToMigrate:", objc_msgSend(v5, "BOOLValue"));
    objc_msgSend(v4, "setDidFinishMigration:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v4, "setDidMigrateOnMac:", objc_msgSend(v7, "BOOLValue"));
    [v4 updateChangeCountWithReason:@"Set migration state"];

    uint64_t v8 = a1 + 80;
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      goto LABEL_14;
    }
LABEL_7:
    v12 = [MEMORY[0x263F5AC20] currentDeviceMigrationStateForAccount:v4];
    if ([v4 didFinishMigration])
    {
      if ([v12 state] != 7)
      {
        int v13 = @"Finished migration";
        uint64_t v14 = 7;
LABEL_12:
        [v12 setState:v14];
        v15 = [MEMORY[0x263EFF910] date];
        [v12 setStateModificationDate:v15];

        [v12 updateChangeCountWithReason:v13];
      }
    }
    else if ([v4 didChooseToMigrate])
    {
      int v13 = @"Set migration state";
      uint64_t v14 = 2;
      goto LABEL_12;
    }

LABEL_14:
    dispatch_time_t v16 = *(void **)(a1 + 40);
    id v21 = 0;
    int v17 = [v16 save:&v21];
    id v18 = v21;
    if (v17)
    {
      uint64_t v19 = [MEMORY[0x263F5ACA0] sharedContext];
      int v20 = [v19 crossProcessChangeCoordinator];
      [v20 postAccountDidChangeNotification];
    }
    else
    {
      uint64_t v19 = os_log_create("com.apple.notes", "Accounts");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_2405CDE34();
      }
    }

    if (*(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24)) {
      [MEMORY[0x263F5ACC8] updateNotesOnLockScreenWhenAccountSupportingLockScreenAdded];
    }

    goto LABEL_21;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(a1 + 32) reload];
    uint64_t v9 = MEMORY[0x263EFFA88];
    [*(id *)(a1 + 32) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F5ADE0]];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*MEMORY[0x263F5ADE8]];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*MEMORY[0x263F5ADF0]];
    v10 = *(void **)(a1 + 56);
    uint64_t v11 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2405C8A38;
    v22[3] = &unk_2650C50E0;
    id v23 = v11;
    [v10 saveAccount:v23 withCompletionHandler:v22];
  }
  uint64_t v8 = a1 + 80;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    goto LABEL_7;
  }
LABEL_21:
}

void sub_2405C8A38(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v5 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_2405CDF5C();
    }
  }
}

void sub_2405C8C50(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F5AB58];
  id v3 = [*(id *)(a1 + 32) identifier];
  id v5 = [v2 accountWithIdentifier:v3 context:*(void *)(a1 + 40)];

  if (v5)
  {
    id v4 = [MEMORY[0x263F5ABE8] sharedController];
    [v4 removeAllTopicSubscriptionsForAccount:v5];
  }
}

void sub_2405C8CF0(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x263F5AB58];
  uint64_t v3 = a1 + 32;
  id v4 = [*(id *)(a1 + 32) identifier];
  id v5 = [v2 accountWithIdentifier:v4 context:*(void *)(v3 + 8)];

  if (v5)
  {
    v6 = [MEMORY[0x263F5ABF8] sharedController];
    [v6 clearCachedDevicesForAccount:v5];

    [MEMORY[0x263F5AB58] deleteAccountWithBatchDelete:v5];
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_2405CE04C();
    }
  }
  [*(id *)(a1 + 48) cleanupAdditionalPersistentStores];
  uint64_t v8 = [*(id *)(a1 + 48) crossProcessChangeCoordinator];
  [v8 postAccountDidChangeNotification];

  [MEMORY[0x263F5ACC8] disableNotesOnLockScreenIfNecessary];
}

void sub_2405C91CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2405C91F4(uint64_t a1, char a2, char a3, char a4, void *a5)
{
  id v9 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2405C92F4;
  v14[3] = &unk_2650C5158;
  id v15 = v9;
  v10 = *(NSObject **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  id v18 = v11;
  uint64_t v19 = v12;
  char v20 = a2;
  char v21 = a3;
  char v22 = a4;
  id v13 = v9;
  dispatch_async(v10, v14);
}

void sub_2405C92F4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 56) identifier];
    id v4 = [v2 accountWithIdentifier:v3];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (v5)
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
    else
    {
      [*(id *)(a1 + 56) reload];
      v6 = (void *)MEMORY[0x263F5AC90];
      uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v8 = *(unsigned __int8 *)(a1 + 73);
      uint64_t v9 = *(unsigned __int8 *)(a1 + 74);
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = sub_2405C9440;
      v12[3] = &unk_2650C50E0;
      id v13 = *(id *)(a1 + 40);
      [v6 saveDidChooseToMigrate:v7 didFinishMigration:v8 didMigrateOnMac:v9 toACAccount:v10 inStore:v11 completionHandler:v12];
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

intptr_t sub_2405C9440(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_2405C9448(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v2 = os_log_create("com.apple.notes", "Accounts");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_2405CE154();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_2405C94E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_2405C9500(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_2405C9544(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_2405C955C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_2405C9578(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_2405C95B8(uint64_t a1)
{
  return *(void *)a1;
}

const char *ThumbnailKey.recentObjectId.unsafeMutableAddressor()
{
  return "Recent";
}

uint64_t static ThumbnailKey.recentObjectId.getter()
{
  return 0x746E65636552;
}

uint64_t ThumbnailKey.accountId.getter()
{
  return sub_2405C96B8(&OBJC_IVAR___ICThumbnailKey_accountId);
}

id sub_2405C9640(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(void *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = (void *)sub_2405CE208();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

uint64_t ThumbnailKey.objectId.getter()
{
  return sub_2405C96B8(&OBJC_IVAR___ICThumbnailKey_objectId);
}

uint64_t sub_2405C96B8(void *a1)
{
  uint64_t v2 = *(void *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ThumbnailKey.thumbnailId.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  swift_bridgeObjectRetain();
  return v1;
}

id ThumbnailKey.__allocating_init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = (char *)objc_allocWithZone(v6);
  uint64_t v14 = &v13[OBJC_IVAR___ICThumbnailKey_accountId];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  id v15 = &v13[OBJC_IVAR___ICThumbnailKey_objectId];
  *(void *)id v15 = a3;
  *((void *)v15 + 1) = a4;
  id v16 = &v13[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(void *)id v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.init(accountId:objectId:thumbnailId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v14 = &v6[OBJC_IVAR___ICThumbnailKey_accountId];
  *(void *)uint64_t v14 = a1;
  *((void *)v14 + 1) = a2;
  id v15 = &v6[OBJC_IVAR___ICThumbnailKey_objectId];
  *(void *)id v15 = a3;
  *((void *)v15 + 1) = a4;
  id v16 = &v6[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(void *)id v16 = a5;
  *((void *)v16 + 1) = a6;
  v18.receiver = v6;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, sel_init);
}

id ThumbnailKey.__allocating_init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return ThumbnailKey.init(accountId:objectId:)(a1, a2, a3, a4);
}

id ThumbnailKey.init(accountId:objectId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
    v6 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
LABEL_6:
  uint64_t v8 = (void *)sub_2405CE208();
  id v9 = objc_msgSend(v4, sel_initWithAccountId_objectId_thumbnailId_, v6, v7, v8);

  return v9;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = v9;
  id v18 = objc_allocWithZone(v10);
  if (!a6)
  {
    uint64_t v19 = 0;
    if (a8) {
      goto LABEL_3;
    }
LABEL_5:
    char v20 = 0;
    goto LABEL_6;
  }
  uint64_t v19 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  if (!a8) {
    goto LABEL_5;
  }
LABEL_3:
  char v20 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v23) = 0;
  id v21 = objc_msgSend(v18, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v19, v20, a9, 0, 0, a2, a3, a4, v23);

  return v21;
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:scale:appearance:)(uint64_t a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a6)
  {
    id v16 = 0;
    if (a8) {
      goto LABEL_3;
    }
LABEL_5:
    id v17 = 0;
    goto LABEL_6;
  }
  id v16 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  if (!a8) {
    goto LABEL_5;
  }
LABEL_3:
  id v17 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
LABEL_6:
  LODWORD(v20) = 0;
  id v18 = objc_msgSend(v9, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v16, v17, a9, 0, 0, a2, a3, a4, v20);

  return v18;
}

id ThumbnailKey.__allocating_init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  id v17 = objc_allocWithZone(v8);
  return ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(a1, a7, a8, a2, a3, a4, a5, a6);
}

id ThumbnailKey.init(type:accountId:objectId:preferredSize:traitCollection:)(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (!a5)
  {
    uint64_t v14 = 0;
    if (a7) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = 0;
    goto LABEL_6;
  }
  uint64_t v14 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  if (!a7) {
    goto LABEL_5;
  }
LABEL_3:
  id v15 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
LABEL_6:
  objc_msgSend(a8, sel_displayScale);
  double v17 = v16;
  BOOL v18 = objc_msgSend(a8, sel_userInterfaceStyle) == (id)2;
  BOOL v19 = objc_msgSend(a8, sel_layoutDirection) == (id)1;
  id v20 = objc_msgSend(a8, sel_preferredContentSizeCategory);
  sub_2405CE218();

  id v21 = (void *)sub_2405CE208();
  swift_bridgeObjectRelease();
  BOOL v22 = objc_msgSend(a8, sel_legibilityWeight) == (id)1;
  BYTE3(v25) = 0;
  BYTE2(v25) = objc_msgSend(a8, sel_accessibilityContrast) == (id)1;
  LOWORD(v25) = v22;
  id v23 = objc_msgSend(v8, sel_initWithType_accountId_objectId_preferredSize_scale_appearance_isRTL_contentSizeCategory_hasBoldText_hasButtonShapes_hasDarkerSystemColors_hasBorder_, a1, v14, v15, v18, v19, v21, a2, a3, v17, v25);

  return v23;
}

uint64_t ThumbnailKey.description.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  uint64_t v5 = v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId;
  uint64_t v6 = *(void *)(v0 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  uint64_t v7 = *(void *)(v5 + 8);
  if (!v2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v9 = (char *)MEMORY[0x263F8EE78];
    if (!v3) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v8 = *v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  id v9 = sub_2405CBBB8(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v11 = *((void *)v9 + 2);
  unint64_t v10 = *((void *)v9 + 3);
  if (v11 >= v10 >> 1) {
    id v9 = sub_2405CBBB8((char *)(v10 > 1), v11 + 1, 1, v9);
  }
  *((void *)v9 + 2) = v11 + 1;
  uint64_t v12 = &v9[16 * v11];
  *((void *)v12 + 4) = v8;
  *((void *)v12 + 5) = v2;
  if (v3)
  {
LABEL_7:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      id v9 = sub_2405CBBB8(0, *((void *)v9 + 2) + 1, 1, v9);
    }
    unint64_t v14 = *((void *)v9 + 2);
    unint64_t v13 = *((void *)v9 + 3);
    if (v14 >= v13 >> 1) {
      id v9 = sub_2405CBBB8((char *)(v13 > 1), v14 + 1, 1, v9);
    }
    *((void *)v9 + 2) = v14 + 1;
    id v15 = &v9[16 * v14];
    *((void *)v15 + 4) = v4;
    *((void *)v15 + 5) = v3;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    id v9 = sub_2405CBBB8(0, *((void *)v9 + 2) + 1, 1, v9);
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1) {
    id v9 = sub_2405CBBB8((char *)(v16 > 1), v17 + 1, 1, v9);
  }
  *((void *)v9 + 2) = v17 + 1;
  BOOL v18 = &v9[16 * v17];
  *((void *)v18 + 4) = v6;
  *((void *)v18 + 5) = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2405CBCBC(&qword_268C89CE0);
  sub_2405CBD00();
  uint64_t v19 = sub_2405CE1F8();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t ThumbnailKey.isEqual(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  sub_2405CBCBC(&qword_268C89CF0);
  uint64_t v4 = sub_2405CE248();
  swift_unknownObjectRelease();
  if (v4 == v2)
  {
    char v8 = 1;
    return v8 & 1;
  }
  sub_2405CBDA4(a1, (uint64_t)v13);
  if (!v14)
  {
    sub_2405CBE0C((uint64_t)v13);
    goto LABEL_25;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_25:
    char v8 = 0;
    return v8 & 1;
  }
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  uint64_t v6 = *(void *)&v12[OBJC_IVAR___ICThumbnailKey_accountId + 8];
  if (v5)
  {
    if (!v6) {
      goto LABEL_24;
    }
    BOOL v7 = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_accountId]
      && v5 == v6;
    if (!v7 && (sub_2405CE2D8() & 1) == 0) {
      goto LABEL_24;
    }
  }
  else if (v6)
  {
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  uint64_t v10 = *(void *)&v12[OBJC_IVAR___ICThumbnailKey_objectId + 8];
  if (v9)
  {
    if (v10
      && (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_objectId]
       && v9 == v10
       || (sub_2405CE2D8() & 1) != 0))
    {
      goto LABEL_20;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v10) {
    goto LABEL_24;
  }
LABEL_20:
  if (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId]
    && *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8) == *(void *)&v12[OBJC_IVAR___ICThumbnailKey_thumbnailId
                                                                                     + 8])
  {

    char v8 = 1;
  }
  else
  {
    char v8 = sub_2405CE2D8();
  }
  return v8 & 1;
}

uint64_t ThumbnailKey.hash.getter()
{
  sub_2405CE338();
  if (*(void *)(v0 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    sub_2405CE308();
    swift_bridgeObjectRetain();
    sub_2405CE228();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2405CE308();
  }
  if (*(void *)(v0 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
  {
    sub_2405CE308();
    swift_bridgeObjectRetain();
    sub_2405CE228();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2405CE308();
  }
  swift_bridgeObjectRetain();
  sub_2405CE228();
  swift_bridgeObjectRelease();
  return sub_2405CE318();
}

id ThumbnailKey.copy(with:)@<X0>(void *a1@<X8>)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId);
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_accountId + 8);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_objectId + 8);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___ICThumbnailKey_thumbnailId + 8);
  uint64_t v10 = (char *)objc_allocWithZone(ObjectType);
  unint64_t v11 = &v10[OBJC_IVAR___ICThumbnailKey_accountId];
  *(void *)unint64_t v11 = v5;
  *((void *)v11 + 1) = v4;
  uint64_t v12 = &v10[OBJC_IVAR___ICThumbnailKey_objectId];
  *(void *)uint64_t v12 = v7;
  *((void *)v12 + 1) = v6;
  unint64_t v13 = &v10[OBJC_IVAR___ICThumbnailKey_thumbnailId];
  *(void *)unint64_t v13 = v9;
  *((void *)v13 + 1) = v8;
  v15.receiver = v10;
  v15.super_class = ObjectType;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id result = objc_msgSendSuper2(&v15, sel_init);
  a1[3] = ObjectType;
  *a1 = result;
  return result;
}

uint64_t sub_2405CAA98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v34 = a1;
  uint64_t v3 = sub_2405CE1C8();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)v32 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  unint64_t v13 = (char *)v32 - v12;
  uint64_t v14 = MEMORY[0x270FA5388](v11);
  unint64_t v16 = (char *)v32 - v15;
  MEMORY[0x270FA5388](v14);
  BOOL v18 = (char *)v32 - v17;
  if (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId + 8))
  {
    v32[1] = *(void *)(v2 + OBJC_IVAR___ICThumbnailKey_accountId);
    uint64_t v19 = v3;
    id v20 = objc_msgSend(self, sel_sharedInstance);
    id v21 = (void *)sub_2405CE208();
    id v22 = objc_msgSend(v20, sel_applicationDocumentsURLForAccountIdentifier_, v21);
    uint64_t v33 = v2;
    id v23 = v22;

    sub_2405CE1B8();
    sub_2405CE218();
    sub_2405CE198();
    swift_bridgeObjectRelease();
    v24 = *(void (**)(char *, uint64_t))(v4 + 8);
    v24(v10, v19);
    sub_2405CE198();
    v24(v13, v19);
    sub_2405CE218();
    sub_2405CE198();
    swift_bridgeObjectRelease();
    v24(v16, v19);
    if (*(void *)(v33 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      uint64_t v25 = (void *)sub_2405CE208();
      id v26 = objc_msgSend(v25, sel_ic_sanitizedFilenameString);

      sub_2405CE218();
    }
    sub_2405CE198();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v24)(v18, v19);
  }
  else
  {
    id v27 = objc_msgSend(self, sel_applicationDocumentsURL);
    sub_2405CE1B8();

    sub_2405CE218();
    sub_2405CE198();
    swift_bridgeObjectRelease();
    uint64_t v28 = *(void (**)(char *, uint64_t))(v4 + 8);
    v28(v16, v3);
    if (*(void *)(v2 + OBJC_IVAR___ICThumbnailKey_objectId + 8))
    {
      uint64_t v29 = (void *)sub_2405CE208();
      id v30 = objc_msgSend(v29, sel_ic_sanitizedFilenameString);

      sub_2405CE218();
    }
    sub_2405CE198();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v28)(v7, v3);
  }
}

id sub_2405CAEE8(void *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = sub_2405CE1C8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a1;
  sub_2405CB000(a3, (uint64_t)v8);

  uint64_t v10 = (void *)sub_2405CE188();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

uint64_t sub_2405CB000@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X8>)
{
  v18[1] = a2;
  v18[0] = sub_2405CE1E8();
  uint64_t v3 = *(void *)(v18[0] - 8);
  MEMORY[0x270FA5388](v18[0]);
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2405CE1C8();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v18 - v11;
  sub_2405CAA98((uint64_t)v10);
  unint64_t v13 = (void *)sub_2405CE208();
  id v14 = objc_msgSend(v13, sel_ic_sanitizedFilenameString);

  sub_2405CE218();
  sub_2405CE198();
  swift_bridgeObjectRelease();
  uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  uint64_t v16 = v15(v10, v6);
  a1(v16);
  sub_2405CE1D8();
  (*(void (**)(char *, void))(v3 + 8))(v5, v18[0]);
  sub_2405CE1A8();
  swift_bridgeObjectRelease();
  return v15(v12, v6);
}

id ThumbnailKey.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ThumbnailKey.init()()
{
}

BOOL sub_2405CB2DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2405CB2F0()
{
  return sub_2405CE328();
}

uint64_t sub_2405CB338()
{
  return sub_2405CE2F8();
}

uint64_t sub_2405CB364()
{
  return sub_2405CE328();
}

uint64_t sub_2405CB3A8()
{
  uint64_t v1 = 0x64497463656A626FLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x69616E626D756874;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x49746E756F636361;
  }
}

uint64_t sub_2405CB410@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_2405CD398(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2405CB438()
{
  return 0;
}

void sub_2405CB444(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2405CB450(uint64_t a1)
{
  unint64_t v2 = sub_2405CBE6C();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_2405CB48C(uint64_t a1)
{
  unint64_t v2 = sub_2405CBE6C();
  return MEMORY[0x270FA00B8](a1, v2);
}

id ThumbnailKey.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ThumbnailKey.encode(to:)(void *a1)
{
  uint64_t v3 = sub_2405CBCBC(&qword_268C89CF8);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2405CD514(a1, a1[3]);
  sub_2405CBE6C();
  sub_2405CE358();
  v8[15] = 0;
  sub_2405CE298();
  if (!v1)
  {
    v8[14] = 1;
    sub_2405CE298();
    v8[13] = 2;
    sub_2405CE2A8();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

id ThumbnailKey.__allocating_init(from:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  return ThumbnailKey.init(from:)(a1);
}

id ThumbnailKey.init(from:)(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v21 = sub_2405CBCBC(&qword_268C89D00);
  uint64_t v4 = *(void *)(v21 - 8);
  MEMORY[0x270FA5388](v21);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2405CD514(a1, a1[3]);
  sub_2405CBE6C();
  uint64_t v7 = v1;
  sub_2405CE348();
  if (v2)
  {
    id v20 = ObjectType;
    sub_2405CD558((uint64_t)a1);

    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v8 = v4;
    char v24 = 0;
    uint64_t v9 = v21;
    uint64_t v10 = sub_2405CE278();
    uint64_t v12 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_accountId];
    uint64_t *v12 = v10;
    v12[1] = v13;
    char v24 = 1;
    uint64_t v14 = sub_2405CE278();
    uint64_t v15 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_objectId];
    uint64_t *v15 = v14;
    v15[1] = v16;
    char v24 = 2;
    uint64_t v17 = sub_2405CE288();
    BOOL v18 = (uint64_t *)&v7[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *BOOL v18 = v17;
    v18[1] = v19;

    v23.receiver = v7;
    v23.super_class = ObjectType;
    id v20 = objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v9);
    sub_2405CD558((uint64_t)a1);
  }
  return v20;
}

id sub_2405CBA20@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = ThumbnailKey.init(from:)(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_2405CBA70(void *a1)
{
  return ThumbnailKey.encode(to:)(a1);
}

char *sub_2405CBA94(char *a1, int64_t a2, char a3)
{
  id result = sub_2405CBAB4(a1, a2, a3, *v3);
  void *v3 = result;
  return result;
}

char *sub_2405CBAB4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_2405CBCBC(&qword_268C89D68);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2405CBBB8(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_2405CBCBC(&qword_268C89D68);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2405CBCBC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2405CBD00()
{
  unint64_t result = qword_268C89CE8;
  if (!qword_268C89CE8)
  {
    sub_2405CBD5C(&qword_268C89CE0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C89CE8);
  }
  return result;
}

uint64_t sub_2405CBD5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2405CBDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2405CBCBC(&qword_268C89CF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2405CBE0C(uint64_t a1)
{
  uint64_t v2 = sub_2405CBCBC(&qword_268C89CF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2405CBE6C()
{
  unint64_t result = qword_268C89D70[0];
  if (!qword_268C89D70[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268C89D70);
  }
  return result;
}

uint64_t type metadata accessor for ThumbnailKey()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for ThumbnailKey.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ThumbnailKey.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for ThumbnailKey.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x2405CC050);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_2405CC078(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_2405CC084(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailKey.CodingKeys()
{
  return &type metadata for ThumbnailKey.CodingKeys;
}

unint64_t sub_2405CC0A0()
{
  unint64_t result = qword_268C89F80[0];
  if (!qword_268C89F80[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268C89F80);
  }
  return result;
}

unint64_t sub_2405CC0F8()
{
  unint64_t result = qword_268C8A090;
  if (!qword_268C8A090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268C8A090);
  }
  return result;
}

unint64_t sub_2405CC150()
{
  unint64_t result = qword_268C8A098[0];
  if (!qword_268C8A098[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268C8A098);
  }
  return result;
}

id sub_2405CC1A4(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a5 + 16);
  if (v5)
  {
    id v6 = result;
    BOOL v7 = (uint64_t *)(a5 + 40);
    uint64_t v8 = MEMORY[0x263F8EE78];
    do
    {
      uint64_t v12 = *(v7 - 1);
      uint64_t v13 = *v7;
      uint64_t v14 = HIBYTE(*v7) & 0xF;
      if ((*v7 & 0x2000000000000000) == 0) {
        uint64_t v14 = v12 & 0xFFFFFFFFFFFFLL;
      }
      if (v14)
      {
        swift_bridgeObjectRetain();
        uint64_t v27 = v8;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2405CBA94(0, *(void *)(v8 + 16) + 1, 1);
          uint64_t v8 = v27;
        }
        unint64_t v10 = *(void *)(v8 + 16);
        unint64_t v9 = *(void *)(v8 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_2405CBA94((char *)(v9 > 1), v10 + 1, 1);
          uint64_t v8 = v27;
        }
        *(void *)(v8 + 16) = v10 + 1;
        uint64_t v11 = v8 + 16 * v10;
        *(void *)(v11 + 32) = v12;
        *(void *)(v11 + 40) = v13;
      }
      v7 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    uint64_t v27 = v8;
    sub_2405CBCBC(&qword_268C89CE0);
    sub_2405CBD00();
    uint64_t v15 = sub_2405CE1F8();
    uint64_t v17 = v16;
    swift_release();
    BOOL v18 = (objc_class *)type metadata accessor for ThumbnailKey();
    uint64_t v19 = (char *)objc_allocWithZone(v18);
    id v20 = &v19[OBJC_IVAR___ICThumbnailKey_accountId];
    *(void *)id v20 = v6;
    *((void *)v20 + 1) = a2;
    uint64_t v21 = &v19[OBJC_IVAR___ICThumbnailKey_objectId];
    *(void *)uint64_t v21 = a3;
    *((void *)v21 + 1) = a4;
    id v22 = (uint64_t *)&v19[OBJC_IVAR___ICThumbnailKey_thumbnailId];
    *id v22 = v15;
    v22[1] = v17;
    v26.receiver = v19;
    v26.super_class = v18;
    return objc_msgSendSuper2(&v26, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2405CC350()
{
}

void sub_2405CC524(double a1, double a2)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  sub_2405CE2B8();
  sub_2405CE238();
  if ((~*(void *)&a2 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (a2 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (a2 < 9.22337204e18)
  {
    sub_2405CE2B8();
    sub_2405CE238();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_13:
  __break(1u);
}

uint64_t sub_2405CC640(double a1)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a1 < 9.22337204e18)
  {
    sub_2405CE2B8();
    sub_2405CE238();
    swift_bridgeObjectRelease();
    sub_2405CE238();
    return 64;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2405CC6F8(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v2 = (id)sub_2405CE208();
  }
  else {
    id v2 = (id)*MEMORY[0x263F83490];
  }
  int v3 = v2;
  uint64_t v4 = sub_2405CE218();
  uint64_t v6 = v5;
  if (v4 == sub_2405CE218() && v6 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  char v9 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
LABEL_18:

    return 21336;
  }
  uint64_t v10 = sub_2405CE218();
  uint64_t v12 = v11;
  if (v10 == sub_2405CE218() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  char v15 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15)
  {
LABEL_21:

    return 83;
  }
  uint64_t v16 = sub_2405CE218();
  uint64_t v18 = v17;
  if (v16 == sub_2405CE218() && v18 == v19) {
    goto LABEL_16;
  }
  char v22 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v22) {
    goto LABEL_23;
  }
  uint64_t v23 = sub_2405CE218();
  uint64_t v25 = v24;
  if (v23 == sub_2405CE218() && v25 == v26)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
LABEL_23:

    return 77;
  }
  char v27 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v27) {
    goto LABEL_23;
  }
  uint64_t v28 = sub_2405CE218();
  uint64_t v30 = v29;
  if (v28 == sub_2405CE218() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:

    return 76;
  }
  char v32 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v32) {
    goto LABEL_31;
  }
  uint64_t v33 = sub_2405CE218();
  uint64_t v35 = v34;
  if (v33 == sub_2405CE218() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
LABEL_36:

    return 19544;
  }
  char v37 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v37) {
    goto LABEL_36;
  }
  uint64_t v38 = sub_2405CE218();
  uint64_t v40 = v39;
  if (v38 == sub_2405CE218() && v40 == v41) {
    goto LABEL_39;
  }
  char v42 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v42) {
    goto LABEL_41;
  }
  uint64_t v43 = sub_2405CE218();
  uint64_t v45 = v44;
  if (v43 == sub_2405CE218() && v45 == v46)
  {
LABEL_39:
    swift_bridgeObjectRelease_n();
LABEL_41:
    uint64_t v20 = 5003314;

    return v20;
  }
  char v47 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v47) {
    goto LABEL_41;
  }
  uint64_t v48 = sub_2405CE218();
  uint64_t v50 = v49;
  if (v48 == sub_2405CE218() && v50 == v51)
  {
    swift_bridgeObjectRelease_n();
LABEL_49:

    return 19777;
  }
  char v52 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v52) {
    goto LABEL_49;
  }
  uint64_t v53 = sub_2405CE218();
  uint64_t v55 = v54;
  if (v53 == sub_2405CE218() && v55 == v56)
  {
    swift_bridgeObjectRelease_n();
LABEL_54:

    return 19521;
  }
  char v57 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v57) {
    goto LABEL_54;
  }
  uint64_t v58 = sub_2405CE218();
  uint64_t v60 = v59;
  if (v58 == sub_2405CE218() && v60 == v61)
  {
    swift_bridgeObjectRelease_n();
LABEL_59:

    return 5003329;
  }
  char v62 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v62) {
    goto LABEL_59;
  }
  uint64_t v20 = 1280848705;
  uint64_t v63 = sub_2405CE218();
  uint64_t v65 = v64;
  if (v63 == sub_2405CE218() && v65 == v66)
  {
    swift_bridgeObjectRelease_n();
LABEL_64:

    return 1280848449;
  }
  char v67 = sub_2405CE2D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v67) {
    goto LABEL_64;
  }
  uint64_t v68 = sub_2405CE218();
  uint64_t v70 = v69;
  if (v68 == sub_2405CE218() && v70 == v71)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v72 = sub_2405CE2D8();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v72 & 1) == 0) {
      return 0;
    }
  }
  return v20;
}

id sub_2405CCDC8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, char a12, char a13, char a14)
{
  switch(a1)
  {
    case 0:
      uint64_t v24 = a4;
      uint64_t v23 = a2;
      id v62 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_2405CBCBC(&qword_268C89D68);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2405CEB30;
      *(void *)(inited + 32) = 0x656D686361747441;
      *(void *)(inited + 40) = 0xEA0000000000746ELL;
      sub_2405CC524(a9, a10);
      *(void *)(inited + 48) = v63;
      *(void *)(inited + 56) = v64;
      *(void *)(inited + 64) = sub_2405CC640(a11);
      *(void *)(inited + 72) = v65;
      goto LABEL_28;
    case 1:
    case 2:
    case 3:
      uint64_t v23 = a2;
      uint64_t v24 = a4;
      id v25 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_2405CBCBC(&qword_268C89D68);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2405CEB50;
      sub_2405CC350();
      *(void *)(inited + 32) = v27;
      *(void *)(inited + 40) = v28;
      sub_2405CC524(a9, a10);
      *(void *)(inited + 48) = v29;
      *(void *)(inited + 56) = v30;
      if (!a6)
      {
        unint64_t v31 = 0xE500000000000000;
        uint64_t v32 = 0x746867694CLL;
        goto LABEL_21;
      }
      if (a6 == 1)
      {
        unint64_t v31 = 0xE400000000000000;
        uint64_t v32 = 1802658116;
LABEL_21:
        *(void *)(inited + 64) = v32;
        *(void *)(inited + 72) = v31;
        *(void *)(inited + 80) = sub_2405CC640(a11);
        *(void *)(inited + 88) = v51;
LABEL_28:
        uint64_t v59 = v23;
        uint64_t v60 = a3;
        uint64_t v61 = v24;
LABEL_29:
        uint64_t v66 = a5;
        goto LABEL_37;
      }
      goto LABEL_39;
    case 4:
    case 7:
    case 10:
    case 11:
      swift_getObjectType();
      sub_2405CBCBC(&qword_268C89D68);
      uint64_t v33 = swift_initStackObject();
      *(_OWORD *)(v33 + 16) = xmmword_2405CEB40;
      sub_2405CC350();
      *(void *)(v33 + 32) = v34;
      *(void *)(v33 + 40) = v35;
      if (a6)
      {
        if (a6 == 1)
        {
          unint64_t v36 = 0xE400000000000000;
          uint64_t v37 = 1802658116;
          goto LABEL_8;
        }
        while (1)
        {
LABEL_39:
          sub_2405CE268();
          __break(1u);
        }
      }
      unint64_t v36 = 0xE500000000000000;
      uint64_t v37 = 0x746867694CLL;
LABEL_8:
      *(void *)(v33 + 48) = v37;
      *(void *)(v33 + 56) = v36;
      uint64_t v38 = sub_2405CC6F8(a7, a8);
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      *(void *)(v33 + 64) = v38;
      *(void *)(v33 + 72) = v40;
      uint64_t v41 = 0x5472616C75676552;
      if (a12) {
        uint64_t v41 = 0x74786554646C6F42;
      }
      unint64_t v42 = 0xEB00000000747865;
      if (a12) {
        unint64_t v42 = 0xE800000000000000;
      }
      *(void *)(v33 + 80) = v41;
      *(void *)(v33 + 88) = v42;
      uint64_t v43 = 0x4372616C75676552;
      if (a13) {
        uint64_t v43 = 0x6F4372656B726144;
      }
      unint64_t v44 = 0xED000073726F6C6FLL;
      if (a13) {
        unint64_t v44 = 0xEC00000073726F6CLL;
      }
      *(void *)(v33 + 96) = v43;
      *(void *)(v33 + 104) = v44;
      id v45 = sub_2405CC1A4(a2, a3, a4, a5, v33);
LABEL_38:
      swift_deallocPartialClassInstance();
      return v45;
    case 5:
    case 6:
      id v46 = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_2405CBCBC(&qword_268C89D68);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2405CEB30;
      sub_2405CC350();
      *(void *)(inited + 32) = v47;
      *(void *)(inited + 40) = v48;
      if (a6)
      {
        if (a6 != 1) {
          goto LABEL_39;
        }
        unint64_t v49 = 0xE400000000000000;
        uint64_t v50 = 1802658116;
      }
      else
      {
        unint64_t v49 = 0xE500000000000000;
        uint64_t v50 = 0x746867694CLL;
      }
      *(void *)(inited + 48) = v50;
      *(void *)(inited + 56) = v49;
      uint64_t v67 = 0x4372616C75676552;
      if (a13) {
        uint64_t v67 = 0x6F4372656B726144;
      }
      unint64_t v68 = 0xED000073726F6C6FLL;
      if (a13) {
        unint64_t v68 = 0xEC00000073726F6CLL;
      }
      *(void *)(inited + 64) = v67;
      *(void *)(inited + 72) = v68;
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v66 = 0;
LABEL_37:
      id v45 = sub_2405CC1A4(v59, v60, v61, v66, inited);
      goto LABEL_38;
    case 8:
      id v54 = v14;
      swift_bridgeObjectRelease();
      swift_getObjectType();

      sub_2405CBCBC(&qword_268C89D68);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_2405CEB30;
      *(void *)(inited + 32) = 0x726174617641;
      *(void *)(inited + 40) = 0xE600000000000000;
      sub_2405CC524(a9, a10);
      *(void *)(inited + 48) = v55;
      *(void *)(inited + 56) = v56;
      uint64_t v57 = 0x726564726F426F4ELL;
      if (a14) {
        uint64_t v57 = 0x726564726F42;
      }
      unint64_t v58 = 0xE800000000000000;
      if (a14) {
        unint64_t v58 = 0xE600000000000000;
      }
      *(void *)(inited + 64) = v57;
      *(void *)(inited + 72) = v58;
      uint64_t v59 = a2;
      uint64_t v60 = a3;
      uint64_t v61 = a4;
      goto LABEL_29;
    default:
      goto LABEL_39;
  }
}

uint64_t sub_2405CD398(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x49746E756F636361 && a2 == 0xE900000000000064;
  if (v2 || (sub_2405CE2D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x64497463656A626FLL && a2 == 0xE800000000000000 || (sub_2405CE2D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x69616E626D756874 && a2 == 0xEB0000000064496CLL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_2405CE2D8();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_2405CD514(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2405CD558(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_2405CD5AC()
{
  sub_2405C9538();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "applications installed or uninstalled: %@", v2, v3, v4, v5, v6);
}

void sub_2405CD614()
{
  sub_2405C9538();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "Enabling Notes for ephemeral account %@", v2, v3, v4, v5, v6);
}

void sub_2405CD67C()
{
  sub_2405C95AC();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "Handling deleting account: %@", v2, v3, v4, v5, v6);
}

void sub_2405CD6E8()
{
  sub_2405C95A0();
  uint64_t v2 = [(id)sub_2405C95B8(v1) identifier];
  uint64_t v3 = [*v0 dirtyDataclassProperties];
  sub_2405C9520();
  sub_2405C9500(&dword_2405C4000, v4, v5, "Dirty dataclass properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405CD788()
{
  sub_2405C95A0();
  uint64_t v2 = [(id)sub_2405C95B8(v1) identifier];
  uint64_t v3 = [*v0 dirtyAccountProperties];
  sub_2405C9520();
  sub_2405C9500(&dword_2405C4000, v4, v5, "Dirty account properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405CD828()
{
  sub_2405C95A0();
  uint64_t v2 = [(id)sub_2405C95B8(v1) identifier];
  uint64_t v3 = [*v0 dirtyProperties];
  sub_2405C9520();
  sub_2405C9500(&dword_2405C4000, v4, v5, "Dirty properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405CD8C8(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) accountType];
  uint64_t v8 = [v1 identifier];
  sub_2405C9500(&dword_2405C4000, v2, v3, "Account changed %@ %@", v4, v5, v6, v7, 2u);
}

void sub_2405CD97C()
{
  sub_2405C9538();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "Not processing account with account type identifier %@", v2, v3, v4, v5, v6);
}

void sub_2405CD9E4(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  sub_2405C9538();
  sub_2405C9544(&dword_2405C4000, a2, v4, "Not processing account modified for account identifier %@ because enabledDataclasses did not change", v5);
}

void sub_2405CDA70()
{
  sub_2405C95A0();
  uint64_t v2 = [v1 identifier];
  uint64_t v3 = [v0 dirtyProperties];
  sub_2405C9520();
  sub_2405C9500(&dword_2405C4000, v4, v5, "Dirty properties for %@: %@", v6, v7, v8, v9, v10);
}

void sub_2405CDB10()
{
  sub_2405C9538();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "Deleting search index domains: %@", v2, v3, v4, v5, v6);
}

void sub_2405CDB78()
{
  sub_2405C95AC();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "Deleted search index domains: %@", v2, v3, v4, v5, v6);
}

void sub_2405CDBE4()
{
  sub_2405C9538();
  sub_2405C9578(&dword_2405C4000, v0, v1, "Error deleting search index domain after deleting account: %@", v2, v3, v4, v5, v6);
}

void sub_2405CDC4C()
{
  sub_2405C9594();
  _os_log_error_impl(&dword_2405C4000, v0, OS_LOG_TYPE_ERROR, "No modern persistent stores in accounts plugin", v1, 2u);
}

void sub_2405CDC8C(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F5ACA0] sharedContext];
  uint64_t v3 = [v2 persistentStoresByAccountId];
  sub_2405C9538();
  sub_2405C9544(&dword_2405C4000, a1, v4, "Current persistent stores by account ID = %@", v5);
}

void sub_2405CDD3C()
{
  sub_2405C9594();
  sub_2405C955C(&dword_2405C4000, v0, v1, "Loading persistent stores...", v2, v3, v4, v5, v6);
}

void sub_2405CDD70(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  sub_2405C9538();
  sub_2405C9544(&dword_2405C4000, a2, v4, "Creating modern account if necessary %@", v5);
}

void sub_2405CDE00()
{
  sub_2405C9594();
  sub_2405C955C(&dword_2405C4000, v0, v1, "Finished loading persistent stores.", v2, v3, v4, v5, v6);
}

void sub_2405CDE34()
{
  sub_2405C9538();
  sub_2405C9578(&dword_2405C4000, v0, v1, "Error saving context after adding account: %@", v2, v3, v4, v5, v6);
}

void sub_2405CDE9C()
{
  sub_2405C9594();
  sub_2405C955C(&dword_2405C4000, v0, v1, "No existing ACAccount properties for migration", v2, v3, v4, v5, v6);
}

void sub_2405CDED0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)sub_2405C95B8(a1) identifier];
  sub_2405C9538();
  sub_2405C9544(&dword_2405C4000, a2, v4, "Creating modern account %@", v5);
}

void sub_2405CDF5C()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  sub_2405C95AC();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2405C4000, v1, OS_LOG_TYPE_ERROR, "Error updating migration flags for ACAccount (%@): %@", v2, 0x16u);
}

void sub_2405CDFE4()
{
  sub_2405C9538();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "Deleting modern account if necessary %@", v2, v3, v4, v5, v6);
}

void sub_2405CE04C()
{
  sub_2405C95AC();
  sub_2405C94E4(&dword_2405C4000, v0, v1, "No modern account found for batch delete for ACAccount %@", v2, v3, v4, v5, v6);
}

void sub_2405CE0B8()
{
  sub_2405C9538();
  sub_2405C9578(&dword_2405C4000, v0, v1, "Cannot remove recent System Paper thumbnails {error: %@}", v2, v3, v4, v5, v6);
}

void sub_2405CE120()
{
  sub_2405C9594();
  sub_2405C955C(&dword_2405C4000, v0, v1, "Removing recent System Paper thumbnails", v2, v3, v4, v5, v6);
}

void sub_2405CE154()
{
  sub_2405C9594();
  sub_2405C955C(&dword_2405C4000, v0, v1, "Timed out while fetching migration state", v2, v3, v4, v5, v6);
}

uint64_t sub_2405CE188()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_2405CE198()
{
  return MEMORY[0x270EEFD70]();
}

uint64_t sub_2405CE1A8()
{
  return MEMORY[0x270EEFD90]();
}

uint64_t sub_2405CE1B8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2405CE1C8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2405CE1D8()
{
  return MEMORY[0x270FA1790]();
}

uint64_t sub_2405CE1E8()
{
  return MEMORY[0x270FA1938]();
}

uint64_t sub_2405CE1F8()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_2405CE208()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2405CE218()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2405CE228()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_2405CE238()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2405CE248()
{
  return MEMORY[0x270F9E3B8]();
}

uint64_t sub_2405CE258()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_2405CE268()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2405CE278()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_2405CE288()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_2405CE298()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_2405CE2A8()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_2405CE2B8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2405CE2C8()
{
  return MEMORY[0x270F9F7C0]();
}

uint64_t sub_2405CE2D8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2405CE2E8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2405CE2F8()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2405CE308()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_2405CE318()
{
  return MEMORY[0x270F9FC88]();
}

uint64_t sub_2405CE328()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_2405CE338()
{
  return MEMORY[0x270F9FC98]();
}

uint64_t sub_2405CE348()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_2405CE358()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t ICNotesAppBundleIdentifier()
{
  return MEMORY[0x270F50DF8]();
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  return MEMORY[0x270F50E18]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}