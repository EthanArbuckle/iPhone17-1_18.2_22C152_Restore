@interface CADOperationGroupUtil
+ (id)defaultCalendarForNewEventsInDelegateSource:(id)a3 withConnection:(id)a4 limitedAccess:(BOOL)a5;
+ (id)defaultCalendarIDForNewEventsInStoreWithID:(id)a3 connection:(id)a4 inDatabase:(CalDatabase *)a5 defaultExists:(BOOL *)a6;
@end

@implementation CADOperationGroupUtil

+ (id)defaultCalendarForNewEventsInDelegateSource:(id)a3 withConnection:(id)a4 limitedAccess:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__8;
  v45 = __Block_byref_object_dispose__8;
  id v46 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  char v40 = 0;
  if (v5)
  {
    uint64_t v11 = *MEMORY[0x1E4F574B8];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke;
    v38[3] = &unk_1E624DDF0;
    v38[4] = &v41;
    [v9 withDatabaseID:v11 perform:v38];
  }
  else
  {
    if (v8)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_5;
      v17[3] = &unk_1E624F3B0;
      v20 = &v41;
      id v21 = a1;
      id v18 = v8;
      id v19 = v10;
      [v19 withDatabaseForObject:v18 perform:v17];

      v12 = v18;
    }
    else
    {
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__8;
      v36[4] = __Block_byref_object_dispose__8;
      v37 = 0;
      uint64_t v13 = *MEMORY[0x1E4F574B8];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_2;
      v31[3] = &unk_1E624F360;
      id v14 = v9;
      id v32 = v14;
      v33 = &v41;
      v34 = v39;
      id v35 = a1;
      [v14 withDatabaseID:v13 perform:v31];
      if (!v42[5])
      {
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x2020000000;
        int v30 = 0;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_4;
        v22[3] = &unk_1E624F388;
        v24 = &v41;
        id v28 = a1;
        id v23 = v14;
        v25 = v29;
        v26 = v39;
        v27 = v36;
        [v23 withAllDatabasesPerform:v22];

        _Block_object_dispose(v29, 8);
      }

      _Block_object_dispose(v36, 8);
      v12 = v37;
    }
  }
  id v15 = (id)v42[5];
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  return v15;
}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v5 = CalDatabaseGetPreferences();
  uint64_t v6 = objc_msgSend(v5, "get_defaultCalendarDatabaseID");
  if (v6)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_3;
    v16[3] = &unk_1E624F338;
    uint64_t v19 = *(void *)(a1 + 56);
    long long v14 = *(_OWORD *)(a1 + 32);
    id v7 = (id)v14;
    long long v17 = v14;
    uint64_t v18 = *(void *)(a1 + 48);
    [v7 withDatabaseID:v6 perform:v16];
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    char v15 = 0;
    uint64_t v8 = [*(id *)(a1 + 56) defaultCalendarIDForNewEventsInStoreWithID:0 connection:*(void *)(a1 + 32) inDatabase:a3 defaultExists:&v15];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v11 + 24))
    {
      char v12 = 1;
    }
    else
    {
      if (v6) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v15 == 0;
      }
      char v12 = !v13;
    }
    *(unsigned char *)(v11 + 24) = v12;
  }
}

+ (id)defaultCalendarIDForNewEventsInStoreWithID:(id)a3 connection:(id)a4 inDatabase:(CalDatabase *)a5 defaultExists:(BOOL *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t DefaultCalendarForNewEvents = CalDatabaseCopyOrCreateDefaultCalendarForNewEvents();
    if (DefaultCalendarForNewEvents)
    {
      BOOL v13 = (const void *)DefaultCalendarForNewEvents;
      uint64_t v11 = 0;
      goto LABEL_7;
    }
    v25 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      v26 = "NULL calendar returned by CalDatabaseCopyOrCreateDefaultCalendarForNewEvents";
      goto LABEL_28;
    }
LABEL_29:
    char v15 = 0;
    BOOL v28 = 0;
    goto LABEL_40;
  }
  [v8 entityID];
  uint64_t v10 = CalDatabaseCopyStoreWithUID();
  if (!v10)
  {
    v25 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      v26 = "NULL source returned by CalDatabaseCopyStoreWithUID";
LABEL_28:
      _os_log_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v32, 2u);
      goto LABEL_29;
    }
    goto LABEL_29;
  }
  uint64_t v11 = (const void *)v10;
  uint64_t v12 = CalDatabaseCopyDefaultOrAnyReadWriteCalendarForNewEvents();
  if (!v12)
  {
    v27 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_ERROR, "NULL calendar returned by CalDatabaseCopyDefaultOrAnyReadWriteCalendarForNewEvents", (uint8_t *)&v32, 2u);
    }
    char v15 = 0;
    BOOL v13 = 0;
    CFArrayRef v20 = 0;
    BOOL v28 = 0;
    goto LABEL_35;
  }
  BOOL v13 = (const void *)v12;
LABEL_7:
  char v15 = CADEntityCopyObjectID();
  char v16 = [v9 isCalendarRestricted:v13 forAction:1];
  long long v17 = CADLogHandle;
  BOOL v18 = os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO);
  if (v16)
  {
    if (v18)
    {
      int v32 = 138412290;
      v33 = v15;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_INFO, "Calendar does not allow write from unmanaged -> managed. Finding first calendar that allows it. ObjectID: [%@]", (uint8_t *)&v32, 0xCu);
    }
    CFArrayRef v19 = (const __CFArray *)CalDatabaseCopyOfAllCalendarsInStoreWithOptions();
    CFArrayRef v20 = v19;
    if (!v19)
    {

LABEL_31:
      v29 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_INFO, "No calendar allows write from unmanaged -> managed. Will return nil", (uint8_t *)&v32, 2u);
      }
      char v15 = 0;
      goto LABEL_34;
    }
    CFIndex Count = CFArrayGetCount(v19);

    if (Count < 1) {
      goto LABEL_31;
    }
    CFIndex v22 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v20, v22);
      if (CalCalendarCanContainEntityType())
      {
        int UID = CalCalendarGetUID();
        if (UID != CalCalendarGetUID()
          && ([v9 isCalendarRestricted:ValueAtIndex forAction:1] & 1) == 0)
        {
          break;
        }
      }
      if (Count == ++v22) {
        goto LABEL_31;
      }
    }
    char v15 = CADEntityCopyObjectID();
    v31 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      int v32 = 138412290;
      v33 = v15;
      _os_log_impl(&dword_1BBC88000, v31, OS_LOG_TYPE_INFO, "Found calendar that allows write from unmanaged -> managed. ObjectID: [%@]", (uint8_t *)&v32, 0xCu);
    }
    if (!v15) {
      goto LABEL_31;
    }
  }
  else
  {
    if (v18)
    {
      int v32 = 138412290;
      v33 = v15;
      _os_log_impl(&dword_1BBC88000, v17, OS_LOG_TYPE_INFO, "Calendar allows write from unmanaged -> managed. Returning ObjectID: [%@]", (uint8_t *)&v32, 0xCu);
    }
    CFArrayRef v20 = 0;
  }
LABEL_34:
  BOOL v28 = 1;
  if (v11) {
LABEL_35:
  }
    CFRelease(v11);
  if (v13) {
    CFRelease(v13);
  }
  if (v20) {
    CFRelease(v20);
  }
LABEL_40:
  if (a6) {
    *a6 = v28;
  }

  return v15;
}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke(uint64_t a1)
{
  v2 = (const void *)CalDatabaseCopyLimitedAccessVirtualCalendar();
  uint64_t v3 = CADEntityCopyObjectID();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  CFRelease(v2);
}

uint64_t __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 56) defaultCalendarIDForNewEventsInStoreWithID:0 connection:*(void *)(a1 + 32) inDatabase:a3 defaultExists:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  return MEMORY[0x1F41817F8]();
}

void __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_4(uint64_t a1, int a2, uint64_t a3, unsigned char *a4)
{
  if (*MEMORY[0x1E4F574B8] != a2)
  {
    uint64_t v7 = [*(id *)(a1 + 72) defaultCalendarIDForNewEventsInStoreWithID:0 connection:*(void *)(a1 + 32) inDatabase:a3 defaultExists:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) entityID];
        uint64_t v10 = CalDatabaseCopyCalendarWithUID();
        if (v10)
        {
          uint64_t v11 = (const void *)v10;
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "set_defaultCalendarDatabaseID:", a2);
          uint64_t v12 = NSString;
          BOOL v13 = [*(id *)(a1 + 32) identity];
          long long v14 = [v12 stringWithFormat:@"No default found (%@)", v13];
          CalDatabaseSetDefaultCalendarForNewEventsWithReason();

          CFRelease(v11);
        }
      }
      *a4 = 1;
    }
  }
}

uint64_t __98__CADOperationGroupUtil_defaultCalendarForNewEventsInDelegateSource_withConnection_limitedAccess___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 56) defaultCalendarIDForNewEventsInStoreWithID:*(void *)(a1 + 32) connection:*(void *)(a1 + 40) inDatabase:a3 defaultExists:0];
  return MEMORY[0x1F41817F8]();
}

@end