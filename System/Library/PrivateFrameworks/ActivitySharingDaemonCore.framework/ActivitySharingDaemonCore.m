__CFString *NSStringFromASMessageType(uint64_t a1)
{
  char v1;
  char v2;
  uint64_t v3;
  int v4;
  __CFString *v6;

  v4 = a1 - 1;
  if (!(!v2 & v1))
  {
    v6 = @"ASMessageTypeInviteRequest";
    switch(v4)
    {
      case 0:
        goto LABEL_12;
      case 1:
        v6 = @"ASMessageTypeInviteResponse";
        return v6;
      case 2:
        v6 = @"ASMessageTypeFinalizeHandshake";
        return v6;
      case 3:
        v6 = @"ASMessageTypeWithdrawInviteRequest";
        return v6;
      default:
        JUMPOUT(0);
    }
  }
  switch((int)a1)
  {
    case 'd':
      v6 = @"ASMessageTypeSecureCloudInviteRequest";
      break;
    case 'e':
      v6 = @"ASMessageTypeSecureCloudInviteResponse";
      break;
    case 'f':
      v6 = @"ASMessageTypeSecureCloudUpgradeRequest";
      break;
    case 'g':
      v6 = @"ASMessageTypeSecureCloudUpgradeResponse";
      break;
    default:
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", a1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      break;
  }
  return v6;
}

void sub_2474CBF64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2474CC5E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2474CC9EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2474CD110(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2474CD38C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2474CDEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2474CEB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2474CF2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2474CF7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2474CFB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2474CFE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2474D00F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2474D05C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2474D0928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_2474D0BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2474D0EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2474D12A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

id ASInsertInviteForContact(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v9 destinations];
  [v10 setAddresses:v13];

  v14 = ASSanitizedContactDestination();

  [v10 setPreferredReachableAddress:v14];
  [v10 setPreferredReachableService:v11];

  uint64_t v15 = [v10 outgoingHandshakeToken];

  if (v15)
  {
    ASLoggingInitialize();
    v16 = (void *)*MEMORY[0x263F23AE0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v17 = v16;
    v18 = [v10 outgoingHandshakeToken];
    *(_DWORD *)v25 = 138412290;
    *(void *)&v25[4] = v18;
    v19 = "Outgoing handshake token already exists for this person: %@";
  }
  else
  {
    v20 = [MEMORY[0x263F08C38] UUID];
    v21 = [v20 UUIDString];
    [v10 setOutgoingHandshakeToken:v21];

    ASLoggingInitialize();
    v22 = (void *)*MEMORY[0x263F23AE0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v17 = v22;
    v18 = [v10 outgoingHandshakeToken];
    *(_DWORD *)v25 = 138412290;
    *(void *)&v25[4] = v18;
    v19 = "Creating new outgoing handshake token: %@";
  }
  _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, v19, v25, 0xCu);

LABEL_7:
  objc_msgSend(v10, "insertEventWithType:", a5, *(_OWORD *)v25);
  v23 = [v9 relationshipStorage];
  objc_msgSend(v23, "updateRelationship:cloudType:", v10, objc_msgSend(v10, "cloudType"));
  [v9 setRelationshipStorage:v23];

  return v9;
}

id ASSaveRelationshipRecordForContact(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = ASRelationshipForRecords(a1);
  v8 = v7;
  if (!v7)
  {
LABEL_10:
    id v12 = 0;
    goto LABEL_11;
  }
  if (!v5)
  {
    id v9 = [v7 UUID];
    id v5 = [v6 contactWithUUID:v9];

    if (!v5)
    {
      ASLoggingInitialize();
      uint64_t v13 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Failed to save relationship, no matching contact %@", (uint8_t *)&v15, 0xCu);
      }
      id v5 = 0;
      goto LABEL_10;
    }
  }
  ASLoggingInitialize();
  id v10 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Successfully saved relationship record in CloudKit", (uint8_t *)&v15, 2u);
  }
  id v11 = [v5 relationshipStorage];
  objc_msgSend(v11, "updateRelationship:cloudType:", v8, objc_msgSend(v8, "cloudType"));
  [v5 setRelationshipStorage:v11];
  [v6 saveContact:v5];
  id v12 = v8;

LABEL_11:
  return v12;
}

id ASRelationshipForRecords(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F23BF0] relationshipsWithRelationshipAndEventRecords:a1];
  if ([v1 count] == 1)
  {
    uint64_t v2 = [v1 firstObject];
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
      ASRelationshipForRecords_cold_1();
    }
    uint64_t v2 = 0;
  }

  return v2;
}

id ASMakeActivityDataPreviewWithManager(void *a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 currentActivitySnapshot];
  v3 = [v2 codableSnapshot];

  v4 = [v1 currentWorkouts];
  id v5 = ASCodableWorkoutsFromWorkouts();

  id v6 = [v1 currentAchievements];

  v7 = ASCodableAchievementsFromAchievements();

  id v8 = objc_alloc_init(MEMORY[0x263F23B18]);
  [v8 setActivitySnapshot:v3];
  id v9 = [v5 allObjects];
  id v10 = (void *)[v9 mutableCopy];
  [v8 setWorkouts:v10];

  id v11 = [v7 allObjects];
  id v12 = (void *)[v11 mutableCopy];
  [v8 setAchievements:v12];

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v8, "setDate:");
  ASLoggingInitialize();
  uint64_t v13 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    v34 = v5;
    v14 = NSNumber;
    log = v13;
    v33 = [v8 activitySnapshot];
    [v33 energyBurned];
    v29 = objc_msgSend(v14, "numberWithDouble:");
    int v15 = NSNumber;
    v32 = [v8 activitySnapshot];
    [v32 energyBurnedGoal];
    uint64_t v27 = objc_msgSend(v15, "numberWithDouble:");
    v16 = NSNumber;
    v30 = [v8 activitySnapshot];
    [v30 mmv];
    v28 = objc_msgSend(v16, "numberWithDouble:");
    uint64_t v17 = NSNumber;
    [v8 activitySnapshot];
    v18 = v35 = v3;
    [v18 mmg];
    v19 = objc_msgSend(v17, "numberWithDouble:");
    v20 = NSNumber;
    v21 = [v8 workouts];
    v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "count"));
    v23 = NSNumber;
    v24 = [v8 achievements];
    v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    *(_DWORD *)buf = 138413570;
    uint64_t v37 = v29;
    __int16 v38 = 2112;
    v39 = v27;
    __int16 v40 = 2112;
    v41 = v28;
    __int16 v42 = 2112;
    v43 = v19;
    __int16 v44 = 2112;
    v45 = v22;
    __int16 v46 = 2112;
    v47 = v25;
    _os_log_impl(&dword_2474C9000, log, OS_LOG_TYPE_DEFAULT, "Generated activity data preview: %@/%@ calories, %@/%@ moveMinutes, %@ workouts, %@ achievements", buf, 0x3Eu);

    id v5 = v34;
    v3 = v35;
  }
  return v8;
}

id ASDeviceBuildNumber()
{
  if (ASDeviceBuildNumber_onceToken != -1) {
    dispatch_once(&ASDeviceBuildNumber_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)ASDeviceBuildNumber_buildNumber;
  return v0;
}

uint64_t __ASDeviceBuildNumber_block_invoke()
{
  ASDeviceBuildNumber_buildNumber = MGCopyAnswer();
  return MEMORY[0x270F9A758]();
}

void ASProcessActivityDataPreviewWithManager(void *a1, void *a2, void *a3)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v5 activitySnapshot];
  ASLoggingInitialize();
  id v9 = *MEMORY[0x263F23AE0];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager message included a snapshot, processing", buf, 2u);
    }
    id v11 = (void *)MEMORY[0x263EFF910];
    [v5 date];
    v24 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    id v12 = [MEMORY[0x263F0A9D0] fitnessFriendActivitySnapshotWithCodableSnapshot:v8 friendUUID:v6 uploadedDate:v24];
    uint64_t v13 = (void *)MEMORY[0x263EFFA08];
    v14 = [v5 workouts];
    int v15 = [v13 setWithArray:v14];
    v16 = ASWorkoutsFromCodableWorkouts();

    uint64_t v17 = (void *)MEMORY[0x263EFFA08];
    v18 = [v5 achievements];
    v19 = [v17 setWithArray:v18];
    v20 = ASAchievementsFromCodableAchievements();

    v26[0] = v12;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    v22 = [v16 allObjects];
    v23 = [v20 allObjects];
    [v7 saveActivitySnapshots:v21 workouts:v22 achievements:v23 isInvitationData:1];
  }
  else if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager message didn't include an activity snapshot preview, not processing", buf, 2u);
  }
}

id ASContactForIncomingHandshakeTokenWithManager(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __ASContactForIncomingHandshakeTokenWithManager_block_invoke;
  v9[3] = &unk_265215C08;
  id v10 = v5;
  uint64_t v11 = a3;
  id v6 = v5;
  id v7 = [a2 contactMatchingCriteriaBlock:v9];

  return v7;
}

uint64_t __ASContactForIncomingHandshakeTokenWithManager_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 relationshipStorage];
  v4 = [v3 relationshipForCloudType:*(void *)(a1 + 40)];

  id v5 = [v4 incomingHandshakeToken];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

id ASContactForOutgoingHandshakeTokenWithManager(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __ASContactForOutgoingHandshakeTokenWithManager_block_invoke;
  v9[3] = &unk_265215C08;
  id v10 = v5;
  uint64_t v11 = a3;
  id v6 = v5;
  id v7 = [a2 contactMatchingCriteriaBlock:v9];

  return v7;
}

uint64_t __ASContactForOutgoingHandshakeTokenWithManager_block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 relationshipStorage];
  v4 = [v3 relationshipForCloudType:*(void *)(a1 + 40)];

  id v5 = [v4 outgoingHandshakeToken];
  uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  return v6;
}

id ASContactForSecureCloudRelationshipZone(void *a1, void *a2)
{
  id v3 = a1;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __ASContactForSecureCloudRelationshipZone_block_invoke;
  v7[3] = &unk_265215C30;
  id v8 = v3;
  id v4 = v3;
  id v5 = [a2 contactMatchingCriteriaBlock:v7];

  return v5;
}

uint64_t __ASContactForSecureCloudRelationshipZone_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 relationshipStorage];
  id v5 = [v4 secureCloudRelationship];
  uint64_t v6 = [v5 remoteRelationshipZoneShareID];
  id v7 = [v6 zoneID];
  if ([v7 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [v3 relationshipStorage];
    id v10 = [v9 secureCloudRemoteRelationship];
    uint64_t v11 = [v10 secureCloudZoneName];
    id v12 = [*(id *)(a1 + 32) zoneName];
    uint64_t v8 = [v11 isEqualToString:v12];
  }
  return v8;
}

id ASReconcileCloudKitRelationshipsForCloudType(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  if (a3)
  {
    uint64_t v8 = ASAllRelationshipsByRecordIDForCloudType(a2, a4);
  }
  else
  {
    ASLoggingInitialize();
    id v9 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v9, OS_LOG_TYPE_DEFAULT, "RelationshipManager current fetch is full, overwrite instead of merging", buf, 2u);
    }
    uint64_t v8 = (void *)MEMORY[0x263EFFA78];
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __ASReconcileCloudKitRelationshipsForCloudType_block_invoke;
  v14[3] = &__block_descriptor_40_e39_B24__0__CKRecordID_8__ASRelationship_16l;
  v14[4] = a4;
  id v10 = objc_msgSend(v7, "hk_filter:", v14);

  uint64_t v11 = ASMergeCloudKitRelationshipWithExistingRelationships(v10, v8);

  id v12 = ASResolveDuplicateRelationshipByCloudKitAddress(v11);

  return v12;
}

id ASAllRelationshipsByRecordIDForCloudType(void *a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    id v9 = (os_log_t *)MEMORY[0x263F23AE0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        if (!a2)
        {
          uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v10) relationshipStorage];
          uint64_t v14 = [v13 legacyRelationship];
LABEL_11:
          int v15 = (void *)v14;

          if (v15)
          {
            v16 = [v15 systemFieldsOnlyRecord];
            uint64_t v17 = [v16 recordID];

            if (v17)
            {
              [v4 setObject:v15 forKeyedSubscript:v17];
            }
            else
            {
              ASLoggingInitialize();
              v19 = *v9;
              if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v28 = v15;
                _os_log_error_impl(&dword_2474C9000, v19, OS_LOG_TYPE_ERROR, "RelationshipManager found a relationship that was missing a record ID: %@", buf, 0xCu);
              }
            }
          }
          goto LABEL_19;
        }
        int v12 = ASSecureCloudEnabled();
        if (a2 == 1 && v12)
        {
          uint64_t v13 = [v11 relationshipStorage];
          uint64_t v14 = [v13 secureCloudRelationship];
          goto LABEL_11;
        }
        ASLoggingInitialize();
        v18 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
          ASAllRelationshipsByRecordIDForCloudType_cold_1(&v21, v22, v18);
        }
LABEL_19:
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  return v4;
}

BOOL __ASReconcileCloudKitRelationshipsForCloudType_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cloudType] == *(void *)(a1 + 32);
}

id ASMergeCloudKitRelationshipWithExistingRelationships(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)[a2 mutableCopy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __ASMergeCloudKitRelationshipWithExistingRelationships_block_invoke;
  v7[3] = &unk_265215C78;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

id ASResolveDuplicateRelationshipByCloudKitAddress(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEBUG)) {
    ASResolveDuplicateRelationshipByCloudKitAddress_cold_1(v2);
  }
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke;
  v22[3] = &unk_265215CA0;
  id v5 = v4;
  id v23 = v5;
  id v6 = v3;
  id v24 = v6;
  [v1 enumerateKeysAndObjectsUsingBlock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = objc_msgSend(v6, "allValues", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = [v12 systemFieldsOnlyRecord];
        uint64_t v14 = [v13 recordID];
        [v5 setObject:v12 forKeyedSubscript:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v9);
  }

  int v15 = v24;
  id v16 = v5;

  return v16;
}

void __ASMergeCloudKitRelationshipWithExistingRelationships_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  ASLoggingInitialize();
  uint64_t v8 = (os_log_t *)MEMORY[0x263F23AE0];
  uint64_t v9 = (void *)*MEMORY[0x263F23AE0];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v10)
    {
      long long v19 = v9;
      long long v20 = [v6 preferredReachableAddress];
      long long v21 = [v6 cloudKitAddress];
      int v22 = 138412546;
      id v23 = v20;
      __int16 v24 = 2112;
      long long v25 = v21;
      _os_log_impl(&dword_2474C9000, v19, OS_LOG_TYPE_DEFAULT, "RelationshipManager found a new relationship that doesn't exist locally (%@/%@)", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_11;
  }
  if (v10)
  {
    uint64_t v11 = v9;
    int v12 = [v7 preferredReachableAddress];
    uint64_t v13 = [v7 cloudKitAddress];
    uint64_t v14 = [v6 preferredReachableAddress];
    int v15 = [v6 cloudKitAddress];
    int v22 = 138413058;
    id v23 = v12;
    __int16 v24 = 2112;
    long long v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "RelationshipManager found a conflict (%@/%@ vs %@/%@)", (uint8_t *)&v22, 0x2Au);
  }
  ASMostRecentlyModifiedRelationship(v6, v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  ASLoggingInitialize();
  uint64_t v17 = *v8;
  BOOL v18 = os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT);
  if (v16 == v6)
  {
    if (v18)
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "RelationshipManager determined the cloudKit relationship is newer, taking it", (uint8_t *)&v22, 2u);
    }
LABEL_11:
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
    goto LABEL_12;
  }
  if (v18)
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "RelationshipManager determined cloudKit relationship is older, keeping the existing relationship", (uint8_t *)&v22, 2u);
  }
LABEL_12:
}

id ASMostRecentlyModifiedRelationship(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 systemFieldsOnlyRecord];
  id v6 = [v5 modificationDate];

  uint64_t v7 = [v4 systemFieldsOnlyRecord];
  uint64_t v8 = [v7 modificationDate];

  [v6 timeIntervalSinceReferenceDate];
  double v10 = v9;
  [v8 timeIntervalSinceReferenceDate];
  if (v10 >= v11) {
    int v12 = v3;
  }
  else {
    int v12 = v4;
  }
  id v13 = v12;

  return v13;
}

void __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 cloudKitAddress];
  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
    if (v8)
    {
      ASLoggingInitialize();
      double v9 = (os_log_t *)MEMORY[0x263F23AE0];
      double v10 = *MEMORY[0x263F23AE0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR)) {
        __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_5(v10);
      }
      ASLoggingInitialize();
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
        __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_4();
      }
      ASLoggingInitialize();
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
        __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_3();
      }
      double v11 = ASMostRecentlyModifiedRelationship(v8, v6);
      ASLoggingInitialize();
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
        __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_2();
      }
      [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
    }
    else
    {
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
    }
  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEBUG)) {
      __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_1();
    }
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

id ASInsertPlaceholderRelationshipEventForFriend(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  double v9 = ASContactPreferringPlaceholderForUUID(a2, v7);
  if (v9)
  {
    ASLoggingInitialize();
    double v10 = *MEMORY[0x263F23AE0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v18 = 0;
      _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "Inserting placeholder contact", v18, 2u);
    }
    if (v8)
    {
      uint64_t v11 = [v8 unsignedIntValue];
    }
    else
    {
      id v13 = [v9 relationshipStorage];
      uint64_t v14 = [v13 primaryRelationship];
      uint64_t v11 = [v14 cloudType];
    }
    int v15 = [v9 relationshipStorage];
    id v16 = [v15 relationshipForCloudType:v11];
    [v16 insertEventWithType:a1];
    [v15 updateRelationship:v16 cloudType:v11];
    [v9 setRelationshipStorage:v15];
    int v12 = [v7 savePlaceholderContact:v9];
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

id ASContactPreferringPlaceholderForUUID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 placeholderContactWithUUID:v3];
  if (!v5)
  {
    id v5 = [v4 contactWithUUID:v3];
  }
  id v6 = (void *)[v5 copy];

  return v6;
}

uint64_t ASRemovePlaceholderForToken(uint64_t a1, void *a2)
{
  return [a2 removePlaceholderContactWithToken:a1];
}

id ASContactsPreferringPlaceholders(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [v1 contacts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v9 = [v8 UUID];
        [v2 setObject:v8 forKeyedSubscript:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v10 = objc_msgSend(v1, "placeholderContacts", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        id v16 = [v15 UUID];
        [v2 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [v2 allValues];

  return v17;
}

id ASMostSignificantRelationship(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 UUID];
  uint64_t v6 = [v4 UUID];
  int v7 = [v5 isEqual:v6];

  if ([v3 cloudType] == 1) {
    int v8 = [v3 secureCloudMigrationCompleted];
  }
  else {
    int v8 = 0;
  }
  if ([v4 cloudType] == 1) {
    int v9 = [v4 secureCloudMigrationCompleted];
  }
  else {
    int v9 = 0;
  }
  if (v7 & v8) != 1 || (v9)
  {
    if ((v7 ^ 1 | v8) & 1) != 0 || ((v9 ^ 1))
    {
      ASMostRecentlyModifiedRelationship(v3, v4);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = v4;
    }
  }
  else
  {
    id v10 = v3;
  }
  uint64_t v11 = v10;

  return v11;
}

uint64_t ASIsRelationshipMigrating(void *a1, void *a2)
{
  id v3 = a2;
  if ([a1 cloudType] || objc_msgSend(v3, "cloudType") != 1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v3 secureCloudMigrationCompleted];
  }

  return v4;
}

BOOL ASToggleCloudType(uint64_t a1)
{
  return a1 == 0;
}

id ASAllContactsByRecordID(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v1;
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v23;
    *(void *)&long long v4 = 138412290;
    long long v20 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v9 = objc_msgSend(v8, "relationshipStorage", v20);
        id v10 = [v9 legacyRelationship];

        uint64_t v11 = [v10 systemFieldsOnlyRecord];
        uint64_t v12 = [v11 recordID];

        if (v12)
        {
          [v2 setObject:v8 forKeyedSubscript:v12];
        }
        else
        {
          ASLoggingInitialize();
          uint64_t v13 = *MEMORY[0x263F23AE0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            uint64_t v27 = v10;
            _os_log_error_impl(&dword_2474C9000, v13, OS_LOG_TYPE_ERROR, "RelationshipManager found a contact with legacy relationship missing a record ID: %@", buf, 0xCu);
          }
        }
        if (ASSecureCloudEnabled())
        {
          uint64_t v14 = [v8 relationshipStorage];
          int v15 = [v14 secureCloudRelationship];

          id v16 = [v15 systemFieldsOnlyRecord];
          uint64_t v17 = [v16 recordID];

          if (v17)
          {
            [v2 setObject:v8 forKeyedSubscript:v17];
          }
          else
          {
            ASLoggingInitialize();
            BOOL v18 = *MEMORY[0x263F23AE0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              uint64_t v27 = v15;
              _os_log_error_impl(&dword_2474C9000, v18, OS_LOG_TYPE_ERROR, "RelationshipManager found a contact with secure cloud relationship missing a record ID: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }

  return v2;
}

void ASReconcileRelationshipsAgainstAddressBook(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id val = a2;
  BOOL v18 = v3;
  long long v4 = (void *)[v3 mutableCopy];
  ASLoggingInitialize();
  uint64_t v5 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v30 = (uint64_t)v4;
    _os_log_impl(&dword_2474C9000, v5, OS_LOG_TYPE_DEFAULT, "RelationshipManager preparing to reconcile with address book %@", buf, 0xCu);
  }
  ASLoggingInitialize();
  uint64_t v6 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "RelationshipManager deleting existing friends list", buf, 2u);
  }
  objc_initWeak(&location, val);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __ASReconcileRelationshipsAgainstAddressBook_block_invoke;
  v25[3] = &unk_265215D30;
  objc_copyWeak(&v27, &location);
  id v17 = v4;
  id v26 = v17;
  [val setContactsUsingTransaction:v25];
  long long v19 = [val contacts];
  ASLoggingInitialize();
  int v7 = (id)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v19 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = v8;
    _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "RelationshipManager reconcile complete with %ld contacts", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v9 = [val contacts];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        ASLoggingInitialize();
        uint64_t v14 = (id)*MEMORY[0x263F23AE0];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = [v13 displayName];
          id v16 = [v13 relationshipStorage];
          *(_DWORD *)buf = 138412546;
          uint64_t v30 = (uint64_t)v15;
          __int16 v31 = 2112;
          v32 = v16;
          _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "%@ -> %@", buf, 0x16u);
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v10);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void sub_2474D46BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v4 = [WeakRetained contacts];
  uint64_t v5 = ASAllContactsByRecordID(v4);

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v7 = [MEMORY[0x263EFF9C0] set];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __ASReconcileRelationshipsAgainstAddressBook_block_invoke_2;
  v16[3] = &unk_265215CE8;
  id v17 = *(id *)(a1 + 32);
  id v8 = v6;
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  objc_copyWeak(&v21, v2);
  id v10 = v5;
  id v20 = v10;
  uint64_t v11 = (void (**)(void, void, void, void))MEMORY[0x24C557E50](v16);
  ((void (**)(void, __CFString *, void, void *))v11)[2](v11, @"cloudKitAddress", 0, &__block_literal_global_307);
  ((void (**)(void, __CFString *, void, void *))v11)[2](v11, @"preferredAddress", 0, &__block_literal_global_313);
  ((void (**)(void, __CFString *, void, void *))v11)[2](v11, @"knownAddresses", 0, &__block_literal_global_318);
  ((void (**)(void, __CFString *, uint64_t, void *))v11)[2](v11, @"createCloudKitAddress", 1, &__block_literal_global_323);
  ((void (**)(void, __CFString *, uint64_t, void *))v11)[2](v11, @"createPreferredAddress", 1, &__block_literal_global_328);
  ((void (**)(void, __CFString *, uint64_t, void *))v11)[2](v11, @"createKnownAddresses", 1, &__block_literal_global_333);
  uint64_t v12 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = [v8 allValues];
  uint64_t v14 = [v12 setWithArray:v13];

  objc_destroyWeak(&v21);
  return v14;
}

void sub_2474D4958(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __ASReconcileRelationshipsAgainstAddressBook_block_invoke_2(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v99 = a2;
  id v6 = a4;
  ASLoggingInitialize();
  int v7 = (os_log_t *)MEMORY[0x263F23AE0];
  id v8 = (void *)*MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = v8;
    *(_DWORD *)buf = 138543618;
    id v111 = v99;
    __int16 v112 = 2048;
    uint64_t v113 = [v9 count];
    _os_log_impl(&dword_2474C9000, v10, OS_LOG_TYPE_DEFAULT, "RelationshipManager starting reconcile pass: %{public}@ (%lu remaining relationships)", buf, 0x16u);
  }
  uint64_t v98 = a1;
  ASLoggingInitialize();
  uint64_t v11 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v111) = a3;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "RelationshipManager create person without address book match is %d for this pass", buf, 8u);
  }
  uint64_t v12 = [*(id *)(a1 + 32) allValues];
  uint64_t v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_299];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    id location = (id *)(a1 + 64);
    uint64_t v102 = *(void *)v106;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v98;
      uint64_t v100 = v15;
      do
      {
        if (*(void *)v106 != v102) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v105 + 1) + 8 * v16);
        id v19 = v6[2](v6, v18);
        id v20 = v19;
        if (v19 && [v19 count])
        {
          ASLoggingInitialize();
          id v21 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v111 = v20;
            _os_log_impl(&dword_2474C9000, v21, OS_LOG_TYPE_DEFAULT, "RelationshipManager looking for contact with destinations: %@", buf, 0xCu);
          }
          int v22 = ASSecureCloudEnabled();
          long long v23 = (void *)MEMORY[0x263EFFA08];
          long long v24 = [*(id *)(v17 + 40) allValues];
          long long v25 = [v23 setWithArray:v24];
          if (v22)
          {
            id v26 = [v18 UUID];
            id v27 = ASFindContactWithDestinationsOrIdentifierInContacts(v20, v25, v26);

            __int16 v28 = [v27 relationshipStorage];
            uint64_t v29 = objc_msgSend(v28, "relationshipForCloudType:", objc_msgSend(v18, "cloudType"));

            if (!v29) {
              goto LABEL_17;
            }
            uint64_t v30 = *(void **)(v17 + 48);
            __int16 v31 = _ASProcessedRelationshipIdentifier(v29);
            LOBYTE(v30) = [v30 containsObject:v31];

            if ((v30 & 1) == 0) {
              goto LABEL_17;
            }
LABEL_22:
            v41 = [v27 relationshipStorage];
            __int16 v42 = objc_msgSend(v41, "relationshipForCloudType:", objc_msgSend(v18, "cloudType"));

            ASLoggingInitialize();
            int v7 = (os_log_t *)MEMORY[0x263F23AE0];
            v43 = *MEMORY[0x263F23AE0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v111 = v42;
              _os_log_error_impl(&dword_2474C9000, v43, OS_LOG_TYPE_ERROR, "RelationshipManager contact already has a relationship (possibly from a previous pass): %@", buf, 0xCu);
            }
            ASLoggingInitialize();
            __int16 v44 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
              __ASReconcileRelationshipsAgainstAddressBook_block_invoke_2_cold_1(&v103, v104, v44);
            }

LABEL_71:
            uint64_t v15 = v100;
            goto LABEL_72;
          }
          id v27 = ASFindContactWithDestinationsInContacts(v20, v25);

          __int16 v38 = [v27 relationshipStorage];
          v39 = [v38 legacyRelationship];
          __int16 v40 = [v39 relationshipShareID];

          if (v40) {
            goto LABEL_22;
          }
LABEL_17:
          int v32 = ASSecureCloudEnabled();
          id WeakRetained = objc_loadWeakRetained(location);
          uint64_t v34 = WeakRetained;
          if (v32)
          {
            v35 = [v18 UUID];
            uint64_t v36 = [v34 createContactWithDestinations:v20 relationshipIdentifier:v35];

            id v27 = (void *)v36;
          }
          else
          {
            [WeakRetained createContactWithDestinations:v20];
            id v27 = v35 = v27;
          }

          v45 = [v27 linkedContactStoreIdentifier];

          ASLoggingInitialize();
          int v7 = (os_log_t *)MEMORY[0x263F23AE0];
          __int16 v46 = *MEMORY[0x263F23AE0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v111) = v45 != 0;
            _os_log_impl(&dword_2474C9000, v46, OS_LOG_TYPE_DEFAULT, "RelationshipManager contact in address book: %d", buf, 8u);
          }
          ASLoggingInitialize();
          v47 = *v7;
          BOOL v48 = os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT);
          if (!v45 && !a3)
          {
            if (v48)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2474C9000, v47, OS_LOG_TYPE_DEFAULT, "RelationshipManager didn't find a match", buf, 2u);
            }
            goto LABEL_71;
          }
          if (v48)
          {
            *(_DWORD *)buf = 138412290;
            id v111 = v18;
            _os_log_impl(&dword_2474C9000, v47, OS_LOG_TYPE_DEFAULT, "RelationshipManager found a match for relationship: %@", buf, 0xCu);
          }
          ASLoggingInitialize();
          os_log_t v49 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            v50 = v49;
            v51 = [v27 UUID];
            *(_DWORD *)buf = 138543618;
            id v111 = v51;
            __int16 v112 = 2112;
            uint64_t v113 = (uint64_t)v27;
            _os_log_impl(&dword_2474C9000, v50, OS_LOG_TYPE_DEFAULT, "RelationshipManager matching contact: %{public}@ - %@", buf, 0x16u);
          }
          v52 = [v18 cloudKitAddress];

          if (v52)
          {
            v53 = [v27 destinations];
            v54 = [v18 cloudKitAddress];
            v55 = [v53 setByAddingObject:v54];
            [v27 setDestinations:v55];
          }
          v56 = [v18 preferredReachableAddress];

          if (v56)
          {
            v57 = [v27 destinations];
            v58 = [v18 preferredReachableAddress];
            v59 = [v57 setByAddingObject:v58];
            [v27 setDestinations:v59];
          }
          v60 = [v18 addresses];

          if (v60)
          {
            v61 = [v27 destinations];
            v62 = [v18 addresses];
            v63 = [v61 setByAddingObjectsFromSet:v62];
            [v27 setDestinations:v63];
          }
          v64 = [v18 systemFieldsOnlyRecord];
          v65 = [v64 recordID];

          if (ASSecureCloudEnabled())
          {
            v66 = (void *)MEMORY[0x263EFFA08];
            v67 = [*(id *)(v17 + 40) allValues];
            v68 = [v66 setWithArray:v67];
            v69 = [v18 UUID];
            v70 = ASFindContactWithDestinationsOrIdentifierInContacts(v20, v68, v69);

            uint64_t v17 = v98;
            if (v70)
            {
              ASLoggingInitialize();
              v71 = *MEMORY[0x263F23AE0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v72 = v71;
                v73 = "Found contact from previous pass with different cloud type";
                goto LABEL_51;
              }
              goto LABEL_56;
            }
          }
          uint64_t v74 = [*(id *)(v17 + 56) objectForKeyedSubscript:v65];
          if (v74)
          {
            v70 = (void *)v74;
            ASLoggingInitialize();
            v75 = *MEMORY[0x263F23AE0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v72 = v75;
              v73 = "Found existing contact from local store with matching recordID";
LABEL_51:
              _os_log_impl(&dword_2474C9000, v72, OS_LOG_TYPE_DEFAULT, v73, buf, 2u);
            }
LABEL_56:
            ASLoggingInitialize();
            v81 = *MEMORY[0x263F23AE0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2474C9000, v81, OS_LOG_TYPE_DEFAULT, "RelationshipManager had previous existing contact for the relationship, putting back the relationship storage", buf, 2u);
            }
            v82 = [v70 relationshipStorage];
            [v27 setRelationshipStorage:v82];

            if (ASSecureCloudEnabled())
            {
              v83 = [v70 pendingRelationshipShareItem];
              [v27 setPendingRelationshipShareItem:v83];

              v84 = [v70 pendingLegacyShareLocations];
              [v27 setPendingLegacyShareLocations:v84];
            }
          }
          else
          {
            v76 = (void *)MEMORY[0x263EFFA08];
            v77 = [*(id *)(v17 + 56) allValues];
            v78 = [v76 setWithArray:v77];
            v79 = [v18 UUID];
            v70 = ASFindContactWithDestinationsOrIdentifierInContacts(v20, v78, v79);

            if (v70)
            {
              ASLoggingInitialize();
              v80 = *MEMORY[0x263F23AE0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2474C9000, v80, OS_LOG_TYPE_DEFAULT, "Found existing contact from local store with matching destination or identifier.", buf, 2u);
              }
              uint64_t v17 = v98;
              goto LABEL_56;
            }
            uint64_t v17 = v98;
          }
          if (ASSecureCloudEnabled())
          {
            if ([v18 cloudType])
            {
              if ([v18 cloudType] == 1)
              {
                v85 = [v27 relationshipStorage];
                [v85 setSecureCloudRelationship:v18];
                goto LABEL_66;
              }
            }
            else
            {
              v85 = [v27 relationshipStorage];
              [v85 setLegacyRelationship:v18];
              v87 = [v85 storageWithSynchronizedRelationshipIdentifiers];
              [v27 setRelationshipStorage:v87];

LABEL_66:
            }
            v88 = *(void **)(v17 + 48);
            v86 = _ASProcessedRelationshipIdentifier(v18);
            [v88 addObject:v86];
          }
          else
          {
            v86 = [v27 relationshipStorage];
            [v86 setLegacyRelationship:v18];
          }

          ASLoggingInitialize();
          v89 = (void *)*MEMORY[0x263F23AE0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
          {
            v90 = v89;
            v91 = [v27 displayName];
            v92 = [v27 relationshipStorage];
            *(_DWORD *)buf = 138412546;
            id v111 = v91;
            __int16 v112 = 2112;
            uint64_t v113 = (uint64_t)v92;
            _os_log_impl(&dword_2474C9000, v90, OS_LOG_TYPE_DEFAULT, "RelationshipManager saving match to %@ with storage %@", buf, 0x16u);

            uint64_t v17 = v98;
          }
          v93 = *(void **)(v17 + 40);
          v94 = [v27 UUID];
          [v93 setObject:v27 forKeyedSubscript:v94];

          uint64_t v17 = v98;
          [*(id *)(v98 + 32) removeObjectForKey:v65];

          int v7 = (os_log_t *)MEMORY[0x263F23AE0];
          goto LABEL_71;
        }
        ASLoggingInitialize();
        uint64_t v37 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v111 = v99;
          _os_log_impl(&dword_2474C9000, v37, OS_LOG_TYPE_DEFAULT, "RelationshipManager reconcile didn't receive destinations, skipping this pass (%{public}@)", buf, 0xCu);
        }
LABEL_72:

        ++v16;
      }
      while (v15 != v16);
      uint64_t v95 = [obj countByEnumeratingWithState:&v105 objects:v109 count:16];
      uint64_t v15 = v95;
    }
    while (v95);
  }
}

uint64_t __ASReconcileRelationshipsAgainstAddressBook_block_invoke_296(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 timestampForMostRecentRelationshipEvent];
  id v6 = [v4 timestampForMostRecentRelationshipEvent];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id _ASProcessedRelationshipIdentifier(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  id v3 = [v2 UUID];
  id v4 = [v3 UUIDString];
  [v2 cloudType];

  uint64_t v5 = NSStringFromASCloudType();
  id v6 = [v1 stringWithFormat:@"%@-%@", v4, v5];

  return v6;
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke_304(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 cloudKitAddress];
  if (v3)
  {
    id v4 = [v2 cloudKitAddress];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke_2_311(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 preferredReachableAddress];
  if (v3)
  {
    id v4 = [v2 preferredReachableAddress];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 addresses];
  id v3 = [v2 allObjects];

  return v3;
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 cloudKitAddress];
  if (v3)
  {
    id v4 = [v2 cloudKitAddress];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke_5(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 preferredReachableAddress];
  if (v3)
  {
    id v4 = [v2 preferredReachableAddress];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

id __ASReconcileRelationshipsAgainstAddressBook_block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = [a2 addresses];
  id v3 = [v2 allObjects];

  return v3;
}

id ASCompetitionEventsFromRelationship(void *a1)
{
  id v1 = [a1 relationshipEvents];
  id v2 = objc_msgSend(v1, "hk_filter:", &__block_literal_global_337);

  return v2;
}

BOOL __ASCompetitionEventsFromRelationship_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 type] == 10
    || [v2 type] == 105
    || [v2 type] == 12
    || [v2 type] == 11
    || [v2 type] == 106
    || [v2 type] == 14
    || [v2 type] == 13;

  return v3;
}

uint64_t ASFilterInvalidCloudKitRelationships(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hk_filter:", &__block_literal_global_339);
}

uint64_t __ASFilterInvalidCloudKitRelationships_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 cloudType]) {
    goto LABEL_14;
  }
  id v4 = [v3 systemFieldsOnlyRecord];
  uint64_t v5 = [v4 recordID];
  id v6 = [v5 zoneID];
  uint64_t v7 = +[ASCloudKitManager relationshipZone];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    if ([v3 cloudType] != 1) {
      goto LABEL_7;
    }
LABEL_14:
    id v9 = [v3 systemFieldsOnlyRecord];
    id v10 = [v9 recordID];
    uint64_t v11 = [v10 zoneID];
    uint64_t v12 = +[ASCloudKitManager relationshipZone];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      ASLoggingInitialize();
      uint64_t v14 = *MEMORY[0x263F23AE0];
      uint64_t v15 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v3;
        uint64_t v16 = "RelationshipManager filtering invalid secure cloud relationship %@";
LABEL_10:
        _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
        uint64_t v15 = 0;
      }
    }
    else
    {
LABEL_7:
      uint64_t v15 = 1;
    }
  }
  else
  {
    ASLoggingInitialize();
    uint64_t v14 = *MEMORY[0x263F23AE0];
    uint64_t v15 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v3;
      uint64_t v16 = "RelationshipManager filtering invalid legacy relationship %@";
      goto LABEL_10;
    }
  }

  return v15;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2474D71FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_2474D77E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__CFString *ThreadIdentifierForBulletinType(unint64_t a1)
{
  if (a1 > 8) {
    return @"com.apple.ActivityMonitorApp.challenges.thread";
  }
  else {
    return off_265215EC0[a1];
  }
}

id ExpirationDateForBulletinTypeAndPublishDate(unint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1 <= 8)
  {
    if (((1 << a1) & 0x14E) != 0)
    {
      id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v5 = objc_msgSend(v4, "hk_startOfDateByAddingDays:toDate:", 1, v3);

      id v6 = [v3 dateByAddingTimeInterval:7200.0];
      a1 = HKDateMax();
      ASLoggingInitialize();
      uint64_t v7 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        unint64_t v11 = a1;
        _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "Bulletin expiration date is %{public}@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      ASLoggingInitialize();
      char v8 = *MEMORY[0x263F23AD0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "No expiration date for bulletin", (uint8_t *)&v10, 2u);
      }
      a1 = 0;
    }
  }

  return (id)a1;
}

void sub_2474D86E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

id _AchievementsNotIncludedInAnchorToken(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263EFFA08] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v28;
    unint64_t v11 = (os_log_t *)MEMORY[0x263F23AA0];
    *(void *)&long long v8 = 138412290;
    long long v25 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "templateUniqueName", v25);
        if (([v4 containsString:v14] & 1) == 0)
        {
          ASLoggingInitialize();
          os_log_t v15 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = v15;
            [v13 templateUniqueName];
            id v26 = v5;
            uint64_t v17 = v9;
            uint64_t v18 = v10;
            id v19 = v4;
            id v20 = v6;
            v22 = id v21 = v11;
            *(_DWORD *)buf = v25;
            int v32 = v22;
            _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "New achievement not yet pushed: %@", buf, 0xCu);

            unint64_t v11 = v21;
            id v6 = v20;
            id v4 = v19;
            uint64_t v10 = v18;
            uint64_t v9 = v17;
            uint64_t v5 = v26;
          }
          uint64_t v23 = [v5 setByAddingObject:v13];

          uint64_t v5 = (void *)v23;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }

  return v5;
}

void sub_2474DA38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2474DA4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2474DE6E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_2474DED2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2474DF54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void sub_2474DFC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_2474E0F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id ASAllDatabaseCompetitionListEntryKeys()
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = @"friend_uuid";
  v2[1] = @"type";
  v2[2] = @"system_fields";
  v2[3] = @"owner";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  return v0;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id _TopPlaceholderContactInPlaceholderArray(void *a1)
{
  id v1 = [a1 lastObject];
  id v2 = [v1 contact];
  id v3 = (void *)[v2 copy];

  return v3;
}

void sub_2474E4CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASFindContactWithDestinationsInContacts(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v6 = *(void *)v27;
    id v21 = v4;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        long long v8 = ASSanitizedContactDestination();
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = v4;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              os_log_t v15 = [v14 destinations];
              char v16 = [v15 containsObject:v8];

              if (v16)
              {
                id v17 = v14;

                id v4 = v21;
                goto LABEL_19;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        id v4 = v21;
        uint64_t v6 = v19;
      }
      id v17 = 0;
      uint64_t v20 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

id _DestinationsForContactStoreContact(void *a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFFA08] set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [v1 phoneNumbers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      uint64_t v7 = 0;
      long long v8 = v2;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = [*(id *)(*((void *)&v25 + 1) + 8 * v7) value];
        uint64_t v10 = [v9 stringValue];
        uint64_t v11 = ASSanitizedContactDestination();

        id v2 = [v8 setByAddingObject:v11];

        ++v7;
        long long v8 = v2;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = objc_msgSend(v1, "emailAddresses", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      id v17 = v2;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = [*(id *)(*((void *)&v21 + 1) + 8 * v16) value];
        uint64_t v19 = ASSanitizedContactDestination();

        id v2 = [v17 setByAddingObject:v19];

        ++v16;
        id v17 = v2;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  return v2;
}

void sub_2474E5E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id ASFindContactWithDestinationsOrIdentifierInContacts(void *a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    id v28 = v8;
    id v29 = v6;
    uint64_t v26 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = ASSanitizedContactDestination();
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v14 = v6;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v31;
          uint64_t v27 = v10;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * j);
              uint64_t v20 = objc_msgSend(v19, "destinations", v26);
              char v21 = [v20 containsObject:v13];

              if ((v21 & 1) == 0)
              {
                long long v22 = [v19 UUID];
                char v23 = [v22 isEqual:v7];

                if ((v23 & 1) == 0) {
                  continue;
                }
              }
              id v24 = v19;

              id v8 = v28;
              id v6 = v29;
              goto LABEL_20;
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
            id v8 = v28;
            id v6 = v29;
            uint64_t v11 = v26;
            uint64_t v10 = v27;
            if (v16) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      id v24 = 0;
    }
    while (v10);
  }
  else
  {
    id v24 = 0;
  }
LABEL_20:

  return v24;
}

id _MapDataToChangeTokens(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF9A0];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___MapDataToChangeTokens_block_invoke;
  v6[3] = &unk_265216688;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

id _MapChangeTokensToData(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF9A0];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = ___MapChangeTokensToData_block_invoke;
  v6[3] = &unk_2652166B0;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id _DictionaryKeyForDatabase(void *a1)
{
  id v1 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "databaseScope"));
  id v2 = [v1 stringValue];

  return v2;
}

id _DictionaryKeyForRecordZoneID(void *a1)
{
  id v1 = NSString;
  id v2 = a1;
  id v3 = [v2 zoneName];
  id v4 = [v2 ownerName];

  id v5 = [v1 stringWithFormat:@"%@%@", v3, v4];

  return v5;
}

id _ContactsCacheDirectoryPath()
{
  uint64_t v0 = NSURL;
  id v1 = [(id)*MEMORY[0x263F23CC0] stringByAppendingString:@"ContactsCache/"];
  id v2 = [v0 fileURLWithPath:v1 isDirectory:1];

  return v2;
}

id _ContactsCacheFilenames()
{
  uint64_t v0 = (void *)MEMORY[0x263EFFA08];
  id v1 = [MEMORY[0x263F08850] defaultManager];
  id v2 = _ContactsCacheDirectoryPath();
  uint64_t v6 = 0;
  id v3 = [v1 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:0 options:0 error:&v6];
  id v4 = [v0 setWithArray:v3];

  return v4;
}

id _ContactCachePathForUUID(void *a1)
{
  id v1 = [a1 UUIDString];
  id v2 = [v1 stringByAppendingString:@".dat"];

  id v3 = _ContactsCacheDirectoryPath();
  id v4 = [v3 URLByAppendingPathComponent:v2];

  return v4;
}

uint64_t _CreateContactsCacheDirectory()
{
  uint64_t v0 = [MEMORY[0x263F08850] defaultManager];
  id v1 = _ContactsCacheDirectoryPath();
  id v6 = 0;
  uint64_t v2 = [v0 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v6];
  id v3 = v6;

  if ((v2 & 1) == 0)
  {
    ASLoggingInitialize();
    id v4 = (void *)*MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      _CreateContactsCacheDirectory_cold_1(v4);
    }
  }

  return v2;
}

id ASReadContactFromDiskCache(void *a1)
{
  id v1 = a1;
  id v7 = 0;
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v1 options:0 error:&v7];
  id v3 = v7;
  if (v3)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      ASReadContactFromDiskCache_cold_1();
    }
    goto LABEL_4;
  }
  if (!v2)
  {
LABEL_4:
    id v4 = 0;
    goto LABEL_7;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x263F23B40]) initWithData:v2];
  id v4 = [MEMORY[0x263F23BC0] contactWithCodableContact:v5];

LABEL_7:
  return v4;
}

id ASReadContactsFromDiskCache()
{
  uint64_t v0 = _ContactsCacheFilenames();
  id v1 = objc_msgSend(v0, "as_autoreleasingCompactMap:", &__block_literal_global_4);

  return v1;
}

id __ASReadContactsFromDiskCache_block_invoke(uint64_t a1, void *a2)
{
  return ASReadContactFromDiskCache(a2);
}

uint64_t ASWriteContactToDiskCache(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 codableContactIncludingCloudKitFields:1];
  id v3 = [v2 data];
  if (_CreateContactsCacheDirectory())
  {
    id v4 = [v1 UUID];
    id v5 = _ContactCachePathForUUID(v4);

    id v9 = 0;
    uint64_t v6 = [v3 writeToURL:v5 options:1073741825 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
        ASWriteContactToDiskCache_cold_1();
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t ASWriteContactsToDiskCache(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x24C557C30](v2);
        uint64_t v8 = ASWriteContactToDiskCache(v6);
        ++v5;
      }
      while (v3 != v5);
      uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v3 = v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

BOOL ASDeleteContactsFromDiskCache()
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F08850] defaultManager];
  id v1 = _ContactsCacheDirectoryPath();
  id v23 = 0;
  uint64_t v2 = [v0 contentsOfDirectoryAtURL:v1 includingPropertiesForKeys:0 options:0 error:&v23];
  id v3 = v23;
  if (v3)
  {
    ASLoggingInitialize();
    uint64_t v4 = (void *)*MEMORY[0x263F23AC0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_ERROR)) {
      ASDeleteContactsFromDiskCache_cold_1(v4, v1);
    }
  }
  else
  {
    uint64_t v16 = v2;
    uint64_t v17 = v1;
    uint64_t v5 = objc_msgSend(v2, "hk_filter:", &__block_literal_global_300);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = (NSObject **)MEMORY[0x263F23AC0];
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v18 = 0;
          [v0 removeItemAtURL:v11 error:&v18];
          id v12 = v18;
          ASLoggingInitialize();
          long long v13 = *v8;
          id v14 = *v8;
          if (v12)
          {
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v25 = v11;
              __int16 v26 = 2112;
              id v27 = v12;
              _os_log_error_impl(&dword_2474C9000, v13, OS_LOG_TYPE_ERROR, "Failed to delete cache file (%@): %@", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v11;
            _os_log_impl(&dword_2474C9000, v13, OS_LOG_TYPE_DEFAULT, "Deleted contact at URL: %@", buf, 0xCu);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v7);
    }

    uint64_t v2 = v16;
    id v1 = v17;
    id v3 = 0;
  }

  return v3 == 0;
}

uint64_t __ASDeleteContactsFromDiskCache_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"dat"];

  return v3;
}

void ASDeleteDeprecatedContactsCache()
{
  CFStringRef v0 = (const __CFString *)*MEMORY[0x263F23CC8];
  CFPreferencesSetAppValue(@"Contacts", 0, (CFStringRef)*MEMORY[0x263F23CC8]);
  CFPreferencesAppSynchronize(v0);
  id v1 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v2 = [NSURL fileURLWithPath:*MEMORY[0x263F23CC0] isDirectory:1];
  uint64_t v3 = [v2 path];
  uint64_t v4 = [v3 stringByAppendingPathComponent:@"contacts.dat"];
  id v10 = 0;
  [v1 removeItemAtPath:v4 error:&v10];
  id v5 = v10;

  uint64_t v6 = [v2 path];
  uint64_t v7 = [v6 stringByAppendingPathComponent:@"contacts2.dat"];
  id v9 = v5;
  [v1 removeItemAtPath:v7 error:&v9];
  id v8 = v9;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id CodableBulletinForFriends(void *a1)
{
  id v1 = a1;
  uint64_t v2 = ASCodableFriendListFromFriends();
  id v3 = objc_alloc_init(MEMORY[0x263F23B20]);
  if ([v1 count] == 1)
  {
    uint64_t v4 = [v1 anyObject];
    uint64_t v5 = [v4 UUID];
    uint64_t v6 = [v5 UUIDString];
    [v3 setFriendUUID:v6];
  }
  uint64_t v7 = [v2 data];
  [v3 setFriendListData:v7];

  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v3, "setTimestamp:");

  return v3;
}

id _TitleForFriendWorkout(void *a1)
{
  id v1 = a1;
  uint64_t v2 = ActivitySharingBundle();
  id v3 = [v2 localizedStringForKey:@"NOTIFICATION_TITLE_FORMAT_WORKOUT" value:&stru_26FB96980 table:@"Localizable"];

  uint64_t v4 = [v1 seymourMediaType];
  if ([v4 isEqualToString:@"guidedWalk"])
  {
  }
  else
  {
    uint64_t v5 = [v1 seymourMediaType];
    int v6 = [v5 isEqualToString:@"video"];

    if (!v6) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = ActivitySharingBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"NOTIFICATION_TITLE_FORMAT_WORKOUT_VIDEO" value:&stru_26FB96980 table:@"Localizable-seymour"];

  id v3 = (void *)v8;
LABEL_5:
  if ([v1 workoutActivityType] == 84)
  {
    id v9 = ActivitySharingBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"NOTIFICATION_TITLE_FORMAT_WORKOUT_UNDERWATER_DIVING" value:&stru_26FB96980 table:@"Localizable"];

    id v3 = (void *)v10;
  }

  return v3;
}

id CodableWorkoutBulletinForFriendWorkout(void *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  ASLoggingInitialize();
  uint64_t v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    uint64_t v7 = [v3 UUID];
    uint64_t v8 = [v3 displayName];
    *(_DWORD *)buf = 138543874;
    long long v20 = v7;
    __int16 v21 = 2112;
    long long v22 = v8;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Creating workout bulletin for friend: %{public}@ - %@ with workout %@", buf, 0x20u);
  }
  id v9 = [MEMORY[0x263EFFA08] setWithObject:v3];
  uint64_t v10 = CodableBulletinForFriends(v9);

  [v10 setType:2];
  uint64_t v11 = _TitleForFriendWorkout(v4);
  id v12 = NSString;
  long long v13 = [v3 displayName];
  id v14 = objc_msgSend(v12, "localizedStringWithFormat:", v11, v13);
  [v10 setTitle:v14];

  uint64_t v15 = [v4 codableWorkout];
  uint64_t v16 = [v15 data];
  [v10 setWorkoutData:v16];

  uint64_t v17 = [v3 currentCompetition];
  objc_msgSend(v10, "setCompetitionStage:", objc_msgSend(v17, "stage"));

  return v10;
}

id CodableAchievementBulletinForFriendAchievement(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  ASLoggingInitialize();
  uint64_t v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    uint64_t v7 = [v3 UUID];
    uint64_t v8 = [v3 displayName];
    *(_DWORD *)buf = 138543874;
    __int16 v21 = v7;
    __int16 v22 = 2112;
    __int16 v23 = v8;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Creating achievement bulletin for friend: %{public}@ - %@ with achievement %@", buf, 0x20u);
  }
  id v9 = ACHCodableFromAchievement();
  uint64_t v10 = [MEMORY[0x263EFFA08] setWithObject:v3];
  uint64_t v11 = CodableBulletinForFriends(v10);

  [v11 setType:3];
  id v12 = NSString;
  long long v13 = ActivitySharingBundle();
  id v14 = [v13 localizedStringForKey:@"NOTIFICATION_TITLE_FORMAT_ACHIEVEMENT" value:&stru_26FB96980 table:@"Localizable"];
  uint64_t v15 = [v3 displayName];
  uint64_t v16 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v15);
  [v11 setTitle:v16];

  uint64_t v17 = [v9 data];
  [v11 setAchievementData:v17];

  id v18 = [v3 currentCompetition];
  objc_msgSend(v11, "setCompetitionStage:", objc_msgSend(v18, "stage"));

  return v11;
}

id CodableGoalCompletionBulletinForFriendActivitySnapshot(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  ASLoggingInitialize();
  uint64_t v5 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    uint64_t v7 = [v3 UUID];
    uint64_t v8 = [v3 displayName];
    *(_DWORD *)buf = 138543874;
    __int16 v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Creating goal completion bulletin for friend: %{public}@ - %@ with snapshot %@", buf, 0x20u);
  }
  id v9 = [v4 activitySummary];
  int v10 = [v9 _isStandalonePhoneSummary];
  uint64_t v11 = ActivitySharingBundle();
  id v12 = v11;
  if (v10) {
    long long v13 = @"NOTIFICATION_TITLE_FORMAT_GOAL_COMPLETION_MOVE_ONLY";
  }
  else {
    long long v13 = @"NOTIFICATION_TITLE_FORMAT_GOAL_COMPLETION";
  }
  id v14 = [v11 localizedStringForKey:v13 value:&stru_26FB96980 table:@"Localizable"];

  uint64_t v15 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  uint64_t v16 = [MEMORY[0x263EFFA08] setWithObject:v3];
  uint64_t v17 = CodableBulletinForFriends(v16);

  [v17 setType:1];
  id v18 = NSString;
  long long v19 = [v3 displayName];
  long long v20 = objc_msgSend(v18, "localizedStringWithFormat:", v14, v19);
  [v17 setTitle:v20];

  [v17 setSnapshotData:v15];
  __int16 v21 = [v3 currentCompetition];
  objc_msgSend(v17, "setCompetitionStage:", objc_msgSend(v21, "stage"));

  return v17;
}

id CodableCompetitionBulletinForFriendForTypeWithTitle(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  ASLoggingInitialize();
  int v10 = (void *)*MEMORY[0x263F23AD0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    id v12 = [v7 UUID];
    int v24 = 138544130;
    __int16 v25 = v12;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_2474C9000, v11, OS_LOG_TYPE_DEFAULT, "Creating competition bulletin for friend: %{public}@ - %@, title: %@, competition: %@", (uint8_t *)&v24, 0x2Au);
  }
  [v9 victoryBadgeStyle];
  long long v13 = [v7 UUID];
  id v14 = ASEphemeralCompetitionVictoryAchievementForStyle();

  uint64_t v15 = [v9 endDate];
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "victoryBadgeStyle"));
  uint64_t v17 = ASEphemeralEarnedAchievement();

  id v18 = ACHCodableFromAchievement();
  long long v19 = [MEMORY[0x263EFFA08] setWithObject:v7];
  long long v20 = CodableBulletinForFriends(v19);

  [v20 setType:a2];
  [v20 setTitle:v8];
  __int16 v21 = [v18 data];
  [v20 setAchievementData:v21];

  __int16 v22 = [v7 currentCompetition];
  objc_msgSend(v20, "setCompetitionStage:", objc_msgSend(v22, "stage"));

  return v20;
}

id CodableCompetitionRequestBulletinForFriend(void *a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = a1;
  int v6 = ActivitySharingBundle();
  id v7 = [v6 localizedStringForKey:@"BULLETIN_TITLE_COMPETITION_REQUEST" value:&stru_26FB96980 table:@"Localizable"];
  id v8 = [v5 displayName];
  id v9 = objc_msgSend(v3, "stringWithFormat:", v7, v8);

  int v10 = CodableCompetitionBulletinForFriendForTypeWithTitle(v5, 5, v9, v4);

  return v10;
}

id CodableCompetitionAcceptedBulletinForFriend(void *a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  id v5 = a1;
  int v6 = ActivitySharingBundle();
  id v7 = [v6 localizedStringForKey:@"BULLETIN_TITLE_COMPETITION_ACCEPTED" value:&stru_26FB96980 table:@"Localizable"];
  id v8 = [v5 displayName];
  id v9 = objc_msgSend(v3, "stringWithFormat:", v7, v8);

  int v10 = CodableCompetitionBulletinForFriendForTypeWithTitle(v5, 6, v9, v4);

  return v10;
}

id CodableCompetitionEndedBulletinForFriend(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  if ([v3 isScoreTied])
  {
    id v5 = NSString;
    int v6 = ActivitySharingBundle();
    id v7 = v6;
    id v8 = @"BULLETIN_TITLE_COMPETITION_ENDED_TIED";
  }
  else
  {
    int v9 = [v3 isParticipantWinning:0];
    id v5 = NSString;
    int v6 = ActivitySharingBundle();
    id v7 = v6;
    if (v9) {
      id v8 = @"BULLETIN_TITLE_COMPETITION_ENDED_WINNER";
    }
    else {
      id v8 = @"BULLETIN_TITLE_COMPETITION_ENDED_LOSER";
    }
  }
  int v10 = [v6 localizedStringForKey:v8 value:&stru_26FB96980 table:@"Localizable"];
  uint64_t v11 = [v4 displayName];
  id v12 = objc_msgSend(v5, "stringWithFormat:", v10, v11);

  long long v13 = CodableCompetitionBulletinForFriendForTypeWithTitle(v4, 7, v12, v3);

  return v13;
}

id CodableCompetitionScoreCapCelebrationBulletinForFriends(void *a1)
{
  id v1 = a1;
  uint64_t v2 = ActivitySharingBundle();
  id v3 = [v2 localizedStringForKey:@"BULLETIN_TITLE_COMPETITION_SCORE_CAP_CELEBRATION" value:&stru_26FB96980 table:@"Localizable"];

  id v4 = CodableBulletinForFriends(v1);

  [v4 setType:8];
  [v4 setTitle:v3];
  [v4 setCompetitionStage:1];

  return v4;
}

id _SanitizedSuccessCompletion(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___SanitizedSuccessCompletion_block_invoke;
  v5[3] = &unk_265216718;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)MEMORY[0x24C557E50](v5);

  return v3;
}

id _SanitizedBoolCompletion(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = ___SanitizedBoolCompletion_block_invoke;
  v5[3] = &unk_265216740;
  id v6 = v1;
  id v2 = v1;
  id v3 = (void *)MEMORY[0x24C557E50](v5);

  return v3;
}

id _SanitizedError(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = v1;
    id v3 = (void *)MEMORY[0x263F087E8];
    id v4 = [v1 domain];
    id v5 = objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, objc_msgSend(v2, "code"), 0);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void sub_2474EBC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

BOOL ASAllGoalsMetForSummary(void *a1)
{
  id v1 = a1;
  id v2 = [v1 activeEnergyBurned];
  id v3 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v2 doubleValueForUnit:v3];
  double v5 = v4;

  id v6 = [v1 activeEnergyBurnedGoal];
  id v7 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  int v10 = [v1 appleMoveTime];
  uint64_t v11 = [MEMORY[0x263F0A830] minuteUnit];
  [v10 doubleValueForUnit:v11];
  double v13 = v12;

  id v14 = [v1 appleMoveTimeGoal];
  uint64_t v15 = [MEMORY[0x263F0A830] minuteUnit];
  [v14 doubleValueForUnit:v15];
  double v17 = v9 + v16;

  id v18 = [v1 appleExerciseTime];
  long long v19 = [MEMORY[0x263F0A830] minuteUnit];
  [v18 doubleValueForUnit:v19];
  double v21 = v20;

  __int16 v22 = [v1 appleExerciseTimeGoal];
  __int16 v23 = [MEMORY[0x263F0A830] minuteUnit];
  [v22 doubleValueForUnit:v23];
  double v25 = v24;

  __int16 v26 = [v1 appleStandHours];
  id v27 = [MEMORY[0x263F0A830] countUnit];
  [v26 doubleValueForUnit:v27];
  double v29 = v28;

  __int16 v30 = [v1 appleStandHoursGoal];

  id v31 = [MEMORY[0x263F0A830] countUnit];
  [v30 doubleValueForUnit:v31];
  double v33 = v32;

  BOOL result = 0;
  if (v17 > 0.0 && v25 > 0.0 && (uint64_t)v33 >= 1)
  {
    BOOL v35 = v5 + v13 >= v17;
    if (v21 < v25) {
      BOOL v35 = 0;
    }
    return (uint64_t)v29 >= (uint64_t)v33 && v35;
  }
  return result;
}

void sub_2474ECDCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2474EDD54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Block_object_dispose((const void *)(v67 - 256), 8);
  _Block_object_dispose((const void *)(v67 - 208), 8);
  _Block_object_dispose((const void *)(v67 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_2474EF954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_2474F105C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a12);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a16);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak((id *)(v28 - 112));
  _Unwind_Resume(a1);
}

void sub_2474F1128()
{
}

void sub_2474F1130()
{
}

void sub_2474F1138()
{
}

void sub_2474F1140()
{
}

void sub_2474F1148()
{
}

void sub_2474F1150()
{
}

void sub_2474F1158()
{
}

void sub_2474F1160()
{
}

void sub_2474F1168()
{
}

void sub_2474F1170()
{
}

void sub_2474F1178()
{
}

void sub_2474F1180()
{
}

void sub_2474F1188()
{
}

void sub_2474F1190()
{
}

NSString *ASDatabaseServerTaskIdentifier()
{
  CFStringRef v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

id ASDatabaseServerInterface()
{
  CFStringRef v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FBB32E0];
  id v1 = (void *)MEMORY[0x263EFFA08];
  uint64_t v2 = objc_opt_class();
  id v3 = objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  [v0 setClasses:v3 forSelector:sel_remote_deletedHealthKitWorkoutsWithinLastNumberOfDays_maxBatchSize_anchor_completion_ argumentIndex:0 ofReply:1];

  double v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v0 setClasses:v6 forSelector:sel_remote_insertDataObjects_completion_ argumentIndex:0 ofReply:0];

  id v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  double v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:sel_remote_allCodableDatabaseCompetitionsWithCompletion_ argumentIndex:0 ofReply:1];

  int v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  double v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v0 setClasses:v12 forSelector:sel_remote_saveCodableDatabaseCompetitions_completion_ argumentIndex:0 ofReply:0];

  double v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v0 setClasses:v15 forSelector:sel_remote_allCodableDatabaseCompetitionListEntriesWithCompletion_ argumentIndex:0 ofReply:1];

  return v0;
}

void sub_2474F3E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2474F57E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_2474F6100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

void sub_2474FA204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

uint64_t ASCloudKitShareParticipantsAreEqual(void *a1, void *a2)
{
  id v3 = a2;
  double v4 = [a1 userIdentity];
  uint64_t v5 = [v3 userIdentity];

  uint64_t v6 = [v4 isEquivalentToUserIdentityOrPublicKey:v5];
  return v6;
}

id _MetadataZoneID()
{
  id v0 = objc_alloc(MEMORY[0x263EFD808]);
  id v1 = (void *)[v0 initWithZoneName:*MEMORY[0x263F239B8] ownerName:*MEMORY[0x263EFD488]];
  return v1;
}

uint64_t _ASCloudKitSubscriptionIdentifier(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@-%@", a2, a1];
}

id _CreateSubscription(void *a1, void *a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = (objc_class *)MEMORY[0x263EFD650];
  id v7 = a2;
  uint64_t v8 = (void *)[[v6 alloc] initWithSubscriptionID:v5];
  [v8 setRecordType:v7];

  id v9 = objc_alloc_init(MEMORY[0x263EFD768]);
  int v10 = v9;
  if (a3) {
    [v9 setAlertBody:v5];
  }
  else {
    [v9 setShouldSendContentAvailable:1];
  }
  [v8 setNotificationInfo:v10];

  return v8;
}

id _CreateZoneSubscription(void *a1, uint64_t a2, int a3)
{
  id v4 = a1;
  id v5 = _MetadataZoneID();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFD818]) initWithZoneID:v5 subscriptionID:v4];
  id v7 = objc_alloc_init(MEMORY[0x263EFD768]);
  uint64_t v8 = v7;
  if (a3) {
    [v7 setAlertBody:v4];
  }
  else {
    [v7 setShouldSendContentAvailable:1];
  }
  [v6 setNotificationInfo:v8];

  return v6;
}

void sub_2474FBAC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  if (a2 == 1)
  {
    id v13 = objc_begin_catch(exception_object);
    ASLoggingInitialize();
    uint64_t v14 = (id)*MEMORY[0x263F23AA8];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = [v13 reason];
      __44__ASCloudKitManager_beginHandlingOperations__block_invoke_cold_3(v15, &buf, v14);
    }

    objc_end_catch();
    JUMPOUT(0x2474FB7E4);
  }
  _Unwind_Resume(exception_object);
}

void sub_2474FC120(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2474FCC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2C8], 8);
  _Block_object_dispose((const void *)(v64 - 248), 8);
  _Block_object_dispose((const void *)(v64 - 200), 8);
  _Block_object_dispose((const void *)(v64 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_2475002F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2475013B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_247501E14(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2475044E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v5, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

uint64_t ASRemoveAllActivitySharingUserDefaults()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v1 = *MEMORY[0x263F23CC8];
  uint64_t v2 = (void *)[v0 initWithSuiteName:*MEMORY[0x263F23CC8]];
  [v2 removePersistentDomainForName:v1];
  uint64_t v3 = [v2 synchronize];

  return v3;
}

void sub_247507534(_Unwind_Exception *a1)
{
  uint64_t v6 = v2;
  objc_destroyWeak(v6);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_247507590()
{
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

void OUTLINED_FUNCTION_2_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_247512C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

void sub_247516A7C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_247517610(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_24751BDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
}

void sub_2475230F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

id ASCompetitionPredicateForFriendUUIDAndType(uint64_t a1, uint64_t a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F434A0] predicateWithProperty:@"friend_uuid" equalToValue:a1];
  id v4 = (void *)MEMORY[0x263F434A0];
  uint64_t v5 = [NSNumber numberWithInteger:a2];
  uint64_t v6 = [v4 predicateWithProperty:@"competition_type" equalToValue:v5];

  id v7 = (void *)MEMORY[0x263F434A8];
  v11[0] = v3;
  v11[1] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  id v9 = [v7 predicateMatchingAllPredicates:v8];

  return v9;
}

id ASAllDatabaseCompetitionKeys()
{
  v2[11] = *MEMORY[0x263EF8340];
  v2[0] = @"friend_uuid";
  v2[1] = @"competition_uuid";
  v2[2] = @"competition_type";
  v2[3] = @"current_cache_index";
  v2[4] = @"last_pushed_cache_index";
  void v2[5] = @"scores";
  v2[6] = @"opponent_scores";
  v2[7] = @"start_date_components";
  v2[8] = @"duration_date_components";
  v2[9] = @"preferred_victory_badge_styles";
  v2[10] = @"maximum_points_per_day";
  id v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:11];
  return v0;
}

id _LoadValueFromDefaultsWithFallback(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a1 valueForKey:a2];
  id v7 = v6;
  if (!v6) {
    uint64_t v6 = v5;
  }
  id v8 = v6;

  return v8;
}

id _FriendUUIDFromDefaults(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F08C38];
  id v2 = a1;
  uint64_t v3 = [v1 UUID];
  id v4 = [v3 UUIDString];
  id v5 = _LoadValueFromDefaultsWithFallback(v2, @"fakeFriendUUID", v4);

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
  return v6;
}

void sub_2475291CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
}

id _ActivitySharingDefaults()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v1 = (void *)[v0 initWithSuiteName:*MEMORY[0x263F23CC8]];
  [v1 synchronize];
  return v1;
}

id ASCloudKitGroupInitialSetup()
{
  if (ASCloudKitGroupInitialSetup_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupInitialSetup_onceToken, &__block_literal_global_18);
  }
  id v0 = (void *)ASCloudKitGroupInitialSetup___group;
  return v0;
}

uint64_t __ASCloudKitGroupInitialSetup_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupInitialSetup___group;
  ASCloudKitGroupInitialSetup___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupInitialSetup___group;
  return [v2 setName:@"InitialSetup"];
}

id ASCloudKitGroupInitialDownload()
{
  if (ASCloudKitGroupInitialDownload_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupInitialDownload_onceToken, &__block_literal_global_12);
  }
  id v0 = (void *)ASCloudKitGroupInitialDownload___group;
  return v0;
}

uint64_t __ASCloudKitGroupInitialDownload_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupInitialDownload___group;
  ASCloudKitGroupInitialDownload___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupInitialDownload___group;
  return [v2 setName:@"InitialDownload"];
}

id ASCloudKitGroupCoreDuetTriggered()
{
  if (ASCloudKitGroupCoreDuetTriggered_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupCoreDuetTriggered_onceToken, &__block_literal_global_17);
  }
  id v0 = (void *)ASCloudKitGroupCoreDuetTriggered___group;
  return v0;
}

uint64_t __ASCloudKitGroupCoreDuetTriggered_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupCoreDuetTriggered___group;
  ASCloudKitGroupCoreDuetTriggered___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupCoreDuetTriggered___group;
  return [v2 setName:@"CoreDuetTriggered"];
}

id ASCloudKitGroupPushTriggered()
{
  if (ASCloudKitGroupPushTriggered_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupPushTriggered_onceToken, &__block_literal_global_22);
  }
  id v0 = (void *)ASCloudKitGroupPushTriggered___group;
  return v0;
}

uint64_t __ASCloudKitGroupPushTriggered_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupPushTriggered___group;
  ASCloudKitGroupPushTriggered___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupPushTriggered___group;
  return [v2 setName:@"PushTriggered"];
}

id ASCloudKitGroupUserActionExplicit()
{
  if (ASCloudKitGroupUserActionExplicit_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupUserActionExplicit_onceToken, &__block_literal_global_27);
  }
  id v0 = (void *)ASCloudKitGroupUserActionExplicit___group;
  return v0;
}

uint64_t __ASCloudKitGroupUserActionExplicit_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupUserActionExplicit___group;
  ASCloudKitGroupUserActionExplicit___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupUserActionExplicit___group;
  return [v2 setName:@"UserActionExplicit"];
}

id ASCloudKitGroupUserActionImplicit()
{
  if (ASCloudKitGroupUserActionImplicit_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupUserActionImplicit_onceToken, &__block_literal_global_32);
  }
  id v0 = (void *)ASCloudKitGroupUserActionImplicit___group;
  return v0;
}

uint64_t __ASCloudKitGroupUserActionImplicit_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupUserActionImplicit___group;
  ASCloudKitGroupUserActionImplicit___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupUserActionImplicit___group;
  return [v2 setName:@"UserActionImplicit"];
}

id ASCloudKitGroupSharingSetup()
{
  if (ASCloudKitGroupSharingSetup_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupSharingSetup_onceToken, &__block_literal_global_37);
  }
  id v0 = (void *)ASCloudKitGroupSharingSetup___group;
  return v0;
}

uint64_t __ASCloudKitGroupSharingSetup_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupSharingSetup___group;
  ASCloudKitGroupSharingSetup___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupSharingSetup___group;
  return [v2 setName:@"SharingSetup"];
}

id ASCloudKitGroupManateeInvitation()
{
  if (ASCloudKitGroupManateeInvitation_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupManateeInvitation_onceToken, &__block_literal_global_42);
  }
  id v0 = (void *)ASCloudKitGroupManateeInvitation___group;
  return v0;
}

uint64_t __ASCloudKitGroupManateeInvitation_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupManateeInvitation___group;
  ASCloudKitGroupManateeInvitation___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupManateeInvitation___group;
  return [v2 setName:@"ManateeInvitation"];
}

id ASCloudKitGroupManateeAddContainer()
{
  if (ASCloudKitGroupManateeAddContainer_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupManateeAddContainer_onceToken, &__block_literal_global_47);
  }
  id v0 = (void *)ASCloudKitGroupManateeAddContainer___group;
  return v0;
}

uint64_t __ASCloudKitGroupManateeAddContainer_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupManateeAddContainer___group;
  ASCloudKitGroupManateeAddContainer___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupManateeAddContainer___group;
  return [v2 setName:@"ManateeAddContainer"];
}

id ASCloudKitGroupManateeMigrate()
{
  if (ASCloudKitGroupManateeMigrate_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupManateeMigrate_onceToken, &__block_literal_global_52);
  }
  id v0 = (void *)ASCloudKitGroupManateeMigrate___group;
  return v0;
}

uint64_t __ASCloudKitGroupManateeMigrate_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupManateeMigrate___group;
  ASCloudKitGroupManateeMigrate___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupManateeMigrate___group;
  return [v2 setName:@"ManateeMigrate"];
}

id ASCloudKitGroupManateeDowngrade()
{
  if (ASCloudKitGroupManateeDowngrade_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupManateeDowngrade_onceToken, &__block_literal_global_57);
  }
  id v0 = (void *)ASCloudKitGroupManateeDowngrade___group;
  return v0;
}

uint64_t __ASCloudKitGroupManateeDowngrade_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupManateeDowngrade___group;
  ASCloudKitGroupManateeDowngrade___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupManateeDowngrade___group;
  return [v2 setName:@"ManateeDowngrade"];
}

id ASCloudKitGroupManateeRepair()
{
  if (ASCloudKitGroupManateeRepair_onceToken != -1) {
    dispatch_once(&ASCloudKitGroupManateeRepair_onceToken, &__block_literal_global_62);
  }
  id v0 = (void *)ASCloudKitGroupManateeRepair___group;
  return v0;
}

uint64_t __ASCloudKitGroupManateeRepair_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFD780]);
  uint64_t v1 = (void *)ASCloudKitGroupManateeRepair___group;
  ASCloudKitGroupManateeRepair___group = (uint64_t)v0;

  id v2 = (void *)ASCloudKitGroupManateeRepair___group;
  return [v2 setName:@"ManateeRepair"];
}

void sub_24752ADF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24752AF68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void _NotifyOnMainQueue(char a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___NotifyOnMainQueue_block_invoke;
    block[3] = &unk_2652162D8;
    id v10 = v6;
    char v11 = a1;
    id v9 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void sub_24752B134(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2475361D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 240), 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
}

void sub_247536C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 248), 8);
  _Block_object_dispose((const void *)(v58 - 200), 8);
  _Block_object_dispose((const void *)(v58 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_2475395CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t _IsRelationshipTransitioningToInactive(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = [a1 isFriendshipActive];
  int v5 = [v3 isFriendshipActive];

  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AE0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AE0], OS_LOG_TYPE_DEBUG)) {
    _IsRelationshipTransitioningToInactive_cold_1(v4, v5, v6);
  }
  return v4 & (v5 ^ 1u);
}

id _DeviceBuildNumber()
{
  if (_DeviceBuildNumber_onceToken != -1) {
    dispatch_once(&_DeviceBuildNumber_onceToken, &__block_literal_global_641);
  }
  id v0 = (void *)_DeviceBuildNumber_buildNumber;
  return v0;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return v0;
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

id _ASOperationConfigurationForPriority(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263EFD778];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setAutomaticallyRetryNetworkFailures:0];
  [v5 setXpcActivity:v4];

  if (a1 != 1)
  {
    if (a1 != 2) {
      goto LABEL_5;
    }
    a1 = 0;
  }
  [v5 setDiscretionaryNetworkBehavior:a1];
LABEL_5:
  return v5;
}

void sub_24753DA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{
}

void sub_24753DF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24753E5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _ASRecordIDsForRecords(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    id v5 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v6 = 0;
      id v7 = v5;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * v6) recordID];
        id v5 = [v7 arrayByAddingObject:v8];

        ++v6;
        id v7 = v5;
      }
      while (v3 != v6);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

void sub_24754021C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v21 - 176));
  _Unwind_Resume(a1);
}

void sub_247541364(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 184));
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void ASRelationshipForRecords_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "Error de-serializing relationships: %@", v2, v3, v4, v5, v6);
}

void ASAllRelationshipsByRecordIDForCloudType_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "RelationshipManager received invalid cloud type for relationships by recordID", buf, 2u);
}

void ASResolveDuplicateRelationshipByCloudKitAddress_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_2474C9000, log, OS_LOG_TYPE_DEBUG, "RelationshipManager checking for duplicate cloudKit addresses", v1, 2u);
}

void __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEBUG, "RelationshipManager found relationship that didn't have a cloudKit address, not checking for duplicates: %@", v1, 0xCu);
}

void __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManger resolved to the newest relationship: %@", v2, v3, v4, v5, v6);
}

void __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager conflicts with %@", v2, v3, v4, v5, v6);
}

void __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2474C9000, v0, v1, "RelationshipManager relationship %@", v2, v3, v4, v5, v6);
}

void __ASResolveDuplicateRelationshipByCloudKitAddress_block_invoke_cold_5(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "RelationshipManager found a conflicting relationship - different share ID with the same cloudKit address", v1, 2u);
}

void __ASReconcileRelationshipsAgainstAddressBook_block_invoke_2_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2474C9000, log, OS_LOG_TYPE_ERROR, "RelationshipManager not matching to avoid clobbering", buf, 2u);
}

void _CreateContactsCacheDirectory_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  uint64_t v2 = _ContactsCacheDirectoryPath();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_2474C9000, v1, v3, "Error creating cache directory (%@): %@", v4);
}

void ASReadContactFromDiskCache_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_2474C9000, v0, (uint64_t)v0, "Error reading from file (%@): %@", v1);
}

void ASWriteContactToDiskCache_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_2474C9000, v0, (uint64_t)v0, "Error writing to file (%@): %@", v1);
}

void ASDeleteContactsFromDiskCache_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 path];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_1(&dword_2474C9000, v3, v5, "Error reading all files at (%@): %@", v6);
}

void _IsRelationshipTransitioningToInactive_cold_1(char a1, char a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl(&dword_2474C9000, log, OS_LOG_TYPE_DEBUG, "RelationshipManager wasPreviouslyActive=%d, isCurrentlyActive=%d", (uint8_t *)v3, 0xEu);
}

uint64_t ACHCodableFromAchievement()
{
  return MEMORY[0x270F0A5D8]();
}

uint64_t ACHIsActivityAchievementSharable()
{
  return MEMORY[0x270F0A698]();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return MEMORY[0x270F0A7B0]();
}

uint64_t ACHTemplateUniqueNameIsMonthlyChallenge()
{
  return MEMORY[0x270F0A820]();
}

uint64_t ASAchievementLocalizationPathForTemplate()
{
  return MEMORY[0x270F0ABB8]();
}

uint64_t ASAchievementsFromCodableAchievements()
{
  return MEMORY[0x270F0ABC8]();
}

uint64_t ASActivitySharingDaemonEnabled()
{
  return MEMORY[0x270F0ABD0]();
}

uint64_t ASAllGoalsMetForSnapshot()
{
  return MEMORY[0x270F0ABD8]();
}

uint64_t ASAlwaysFetchOnPeriodicUpdate()
{
  return MEMORY[0x270F0ABE0]();
}

uint64_t ASAnalyticsUpdateWithFriends()
{
  return MEMORY[0x270F0AC08]();
}

uint64_t ASBestCompetitionVictoryBadgeStyleForPreferredStyles()
{
  return MEMORY[0x270F0AC10]();
}

uint64_t ASCacheIndexForLocalDate()
{
  return MEMORY[0x270F0AC18]();
}

uint64_t ASCleanSnapshotForUpload()
{
  return MEMORY[0x270F0AC20]();
}

uint64_t ASCodableAchievementsFromAchievements()
{
  return MEMORY[0x270F0AC30]();
}

uint64_t ASCodableFriendListFromFriends()
{
  return MEMORY[0x270F0AC38]();
}

uint64_t ASCodableWorkoutsFromWorkouts()
{
  return MEMORY[0x270F0AC40]();
}

uint64_t ASCompetitionCalculateStartDateComponentsForFriend()
{
  return MEMORY[0x270F0AC48]();
}

uint64_t ASCompetitionCalculateStartDateComponentsForFriendWithProposedStartDate()
{
  return MEMORY[0x270F0AC50]();
}

uint64_t ASCompetitionCalculateUpdatedScores()
{
  return MEMORY[0x270F0AC58]();
}

uint64_t ASCompetitionDailyScoreForParticipantWithCacheIndex()
{
  return MEMORY[0x270F0AC68]();
}

uint64_t ASCompetitionDurationDateComponentsForNewCompetitions()
{
  return MEMORY[0x270F0AC78]();
}

uint64_t ASCompetitionIsReadyToComplete()
{
  return MEMORY[0x270F0AC88]();
}

uint64_t ASCompetitionMaximumPointsPerDayForNewCompetitions()
{
  return MEMORY[0x270F0AC90]();
}

uint64_t ASCompetitionNeedsScoreUpdateForSummary()
{
  return MEMORY[0x270F0AC98]();
}

uint64_t ASCompetitionParticipationResourcePath()
{
  return MEMORY[0x270F0ACA8]();
}

uint64_t ASCompetitionParticipationTemplate()
{
  return MEMORY[0x270F0ACB0]();
}

uint64_t ASCompetitionRequestHasExpired()
{
  return MEMORY[0x270F0ACB8]();
}

uint64_t ASCompetitionVictoryPropertyListPathForStyle()
{
  return MEMORY[0x270F0ACE0]();
}

uint64_t ASCompetitionVictoryResourcePathForStyle()
{
  return MEMORY[0x270F0ACE8]();
}

uint64_t ASCompetitionVictoryTemplateForFriend()
{
  return MEMORY[0x270F0ACF0]();
}

uint64_t ASCompetitionVictoryTemplateNameForFriend()
{
  return MEMORY[0x270F0ACF8]();
}

uint64_t ASCompetitionsEligibleForArchival()
{
  return MEMORY[0x270F0AD08]();
}

uint64_t ASCompetitionsSortedByEndDate()
{
  return MEMORY[0x270F0AD10]();
}

uint64_t ASContactStorePredicateForDestination()
{
  return MEMORY[0x270F0AD18]();
}

uint64_t ASDestinationIsEmail()
{
  return MEMORY[0x270F0AD20]();
}

uint64_t ASDestinationIsPhoneNumber()
{
  return MEMORY[0x270F0AD28]();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForFriendAchievement()
{
  return MEMORY[0x270F0AD38]();
}

uint64_t ASEphemeralCompetitionVictoryAchievementForStyle()
{
  return MEMORY[0x270F0AD40]();
}

uint64_t ASEphemeralEarnedAchievement()
{
  return MEMORY[0x270F0AD48]();
}

uint64_t ASEphemeralEarnedAchievementForFriendAchievement()
{
  return MEMORY[0x270F0AD50]();
}

uint64_t ASFormattedSequence()
{
  return MEMORY[0x270F0AD58]();
}

uint64_t ASFriendAchievementFromTemplateAndEarnedInstance()
{
  return MEMORY[0x270F0AD60]();
}

uint64_t ASFriendsFromCodableFriendList()
{
  return MEMORY[0x270F0AD70]();
}

uint64_t ASFriendsSortedByEarliestCompetitionVictoryOrPotentialVictoryDate()
{
  return MEMORY[0x270F0AD78]();
}

uint64_t ASFullNameForContactStoreContact()
{
  return MEMORY[0x270F0AD90]();
}

uint64_t ASIgnoredMostRecentCompetitionRequestFromContact()
{
  return MEMORY[0x270F0AD98]();
}

uint64_t ASIsCompetitionVictoryTemplate()
{
  return MEMORY[0x270F0ADA0]();
}

uint64_t ASLoggingInitialize()
{
  return MEMORY[0x270F0ADA8]();
}

uint64_t ASMaxNumber()
{
  return MEMORY[0x270F0ADB0]();
}

uint64_t ASMessagesIsInstalled()
{
  return MEMORY[0x270F0ADC0]();
}

uint64_t ASNumberOfNewFriendsAllowedForFriends()
{
  return MEMORY[0x270F0ADC8]();
}

uint64_t ASPairedDeviceSupportsCompetitions()
{
  return MEMORY[0x270F0ADD0]();
}

uint64_t ASPreferredCompetitionVictoryBadgeStylesForFriend()
{
  return MEMORY[0x270F0ADD8]();
}

uint64_t ASRelationshipNeedsSupportedFeaturesUpdate()
{
  return MEMORY[0x270F0ADE8]();
}

uint64_t ASRichMessagePayloadForAchievement()
{
  return MEMORY[0x270F0ADF0]();
}

uint64_t ASRichMessagePayloadForGoalCompletion()
{
  return MEMORY[0x270F0ADF8]();
}

uint64_t ASRichMessagePayloadForWorkout()
{
  return MEMORY[0x270F0AE00]();
}

uint64_t ASSanitizedContactDestination()
{
  return MEMORY[0x270F0AE10]();
}

uint64_t ASSanitizedContactDestinations()
{
  return MEMORY[0x270F0AE18]();
}

uint64_t ASSecureCloudEnabled()
{
  return MEMORY[0x270F0AE20]();
}

uint64_t ASSendRichMessagePayloadToDestination()
{
  return MEMORY[0x270F0AE28]();
}

uint64_t ASShortNameForContactStoreContact()
{
  return MEMORY[0x270F0AE38]();
}

uint64_t ASShouldReducePeriodUpdateFrequency()
{
  return MEMORY[0x270F0AE40]();
}

uint64_t ASUpdateSupportedFeaturesForRelationship()
{
  return MEMORY[0x270F0AE58]();
}

uint64_t ASUseLegacyDevelopmentContainer()
{
  return MEMORY[0x270F0AE60]();
}

uint64_t ASValidateEligibilityForAcceptingCompetitionRequest()
{
  return MEMORY[0x270F0AE68]();
}

uint64_t ASValidateEligibilityForIncomingCompetitionRequest()
{
  return MEMORY[0x270F0AE70]();
}

uint64_t ASValidateEligibilityForOutgoingCompetitionRequest()
{
  return MEMORY[0x270F0AE78]();
}

uint64_t ASWorkoutNotificationRecordIDForType()
{
  return MEMORY[0x270F0AE88]();
}

uint64_t ASWorkoutRecordIDForUUID()
{
  return MEMORY[0x270F0AE90]();
}

uint64_t ASWorkoutsFromCodableWorkouts()
{
  return MEMORY[0x270F0AE98]();
}

uint64_t ActivitySharingBundle()
{
  return MEMORY[0x270F0AEA0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CHProfileExtensionForProfile()
{
  return MEMORY[0x270F18410]();
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x270EE3788]();
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x270EE37C0]();
}

uint64_t CMFBlockListIsItemBlocked()
{
  return MEMORY[0x270F183E8]();
}

uint64_t CreateCMFItemFromString()
{
  return MEMORY[0x270F18400]();
}

uint64_t FIDeviceMeetsMinimumOSVersionDaytona()
{
  return MEMORY[0x270F29968]();
}

uint64_t FIIsCategorizedOtherActivityType()
{
  return MEMORY[0x270F29A08]();
}

uint64_t FILocalizedDayName()
{
  return MEMORY[0x270F29A98]();
}

uint64_t HDCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x270F31980]();
}

uint64_t HDDataEntityPredicateForDataUUIDs()
{
  return MEMORY[0x270F31990]();
}

uint64_t HDDataEntityPredicateForOriginProductType()
{
  return MEMORY[0x270F319A0]();
}

uint64_t HDDataEntityPredicateForType()
{
  return MEMORY[0x270F319B8]();
}

uint64_t HDFitnessFriendAchievementEntityPredicateForFriendUUID()
{
  return MEMORY[0x270F319D0]();
}

uint64_t HDFitnessFriendActivitySnapshotEntityPredicateForFriendUUID()
{
  return MEMORY[0x270F319D8]();
}

uint64_t HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID()
{
  return MEMORY[0x270F319E0]();
}

uint64_t HDSQLiteBindDataToProperty()
{
  return MEMORY[0x270F31A48]();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return MEMORY[0x270F31A68]();
}

uint64_t HDSQLiteBindUUIDToProperty()
{
  return MEMORY[0x270F31A88]();
}

uint64_t HDSQLiteColumnWithNameAsData()
{
  return MEMORY[0x270F31AD0]();
}

uint64_t HDSQLiteColumnWithNameAsInt64()
{
  return MEMORY[0x270F31AE8]();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return MEMORY[0x270F31AF8]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x270F31A10]();
}

uint64_t HKCreateConcurrentDispatchQueue()
{
  return MEMORY[0x270EF3658]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x270EF3670]();
}

uint64_t HKDateMax()
{
  return MEMORY[0x270EF3688]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x270EF36F0]();
}

uint64_t HKWithAutoreleasePool()
{
  return MEMORY[0x270EF38B0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x270F3C988]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x270F3C9B0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t NSStringFromASCloudType()
{
  return MEMORY[0x270F0AEA8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t _ASCreateActivityDataRootRecordWithID()
{
  return MEMORY[0x270F0AEB8]();
}

uint64_t _ASCreateRecordsFromCloudKitCodablesAndRecordZoneID()
{
  return MEMORY[0x270F0AEC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HDSQLiteValueForDate()
{
  return MEMORY[0x270F31B08]();
}

uint64_t _HKActivityCacheDateComponentsFromCacheIndex()
{
  return MEMORY[0x270EF38F8]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x270EF3900]();
}

uint64_t _HKCacheIndexFromDate()
{
  return MEMORY[0x270EF3920]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x270EF3928]();
}

uint64_t _HKEndDateForSnapshotIndex()
{
  return MEMORY[0x270EF3950]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

uint64_t _HKMostRecentActivitySnapshotInSnapshots()
{
  return MEMORY[0x270EF3998]();
}

uint64_t _HKStartDateForSnapshotIndex()
{
  return MEMORY[0x270EF39B0]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x270F796D8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x270EDC190](object1, object2);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}