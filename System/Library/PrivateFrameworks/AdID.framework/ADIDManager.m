@interface ADIDManager
@end

@implementation ADIDManager

void __50__ADIDManager_Private__setDSID_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F241C0] sharedInstance];
  [v2 reloadNoServicesRestrictions];

  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [MEMORY[0x263F241C0] sharedInstance];
  v6 = [v3 stringWithFormat:@"[%@]: Reloaded no services regional restriction: %d", v4, objc_msgSend(v5, "isRestrictedRegion")];
  _ADLog();

  if (ADSimulatedCrashKillCode_InternalInconsistency_block_invoke_settingDSID) {
    goto LABEL_3;
  }
  v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v8 = [*(id *)(a1 + 32) activeDSIDRecord];
  v9 = [v8 DSID];
  LODWORD(v7) = [v7 isEqualToString:v9];

  if (v7)
  {
LABEL_3:
    v10 = [NSString stringWithFormat:@"[%@ setDSID]: DSID already set to %@.", objc_opt_class(), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    _ADLog();

    [*(id *)(a1 + 32) saveDataForPCD];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11)
    {
      v12 = *(void (**)(void))(v11 + 16);
      v12();
    }
    return;
  }
  ADSimulatedCrashKillCode_InternalInconsistency_block_invoke_settingDSID = 1;
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  if (v14)
  {
    if ([v14 length]) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  v15 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = @"0";

LABEL_12:
  id v32 = [*(id *)(a1 + 32) save];
  if (v32)
  {
    v16 = NSString;
    uint64_t v17 = objc_opt_class();
    v18 = [*(id *)(a1 + 32) activeDSIDRecord];
    v19 = [v18 DSID];
    v20 = [v16 stringWithFormat:@"[%@]: Failed to save record for current DSID %@", v17, v19];
    _ADLog();
  }
  v21 = [NSString stringWithFormat:@"[%@]: Request to set DSID to %@", objc_opt_class(), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  _ADLog();

  v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v23 = [*(id *)(a1 + 32) activeDSIDRecord];
  v24 = [v23 DSID];
  LOBYTE(v22) = [v22 isEqualToString:v24];

  if (v22)
  {
    v25 = [NSString stringWithFormat:@"[%@]: DSID already set to %@, skipping.", objc_opt_class(), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    _ADLog();
LABEL_18:

    goto LABEL_19;
  }
  id v26 = (id)[*(id *)(a1 + 32) reloadRecords:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  v27 = [*(id *)(a1 + 32) activeDSIDRecord];

  if (!v27)
  {
    v25 = (void *)[objc_alloc(MEMORY[0x263F24268]) initWithDSID:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) serializedRecord:0 version:3];
    [*(id *)(a1 + 32) setActiveDSIDRecord:v25];
    goto LABEL_18;
  }
LABEL_19:
  v28 = [*(id *)(a1 + 32) activeDSIDRecord];
  v29 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v28, "setPersonalizedAdsTimestamp:", objc_msgSend(v29, "AD_toServerTime"));

  v30 = [*(id *)(a1 + 32) activeDSIDRecord];
  [v30 ensureiAdIDs];

  ADSimulatedCrashKillCode_InternalInconsistency_block_invoke_settingDSID = 0;
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(void))(v31 + 16))();
  }
}

void __28__ADIDManager_Private__init__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [NSString stringWithFormat:@"[%@]: Received clear monthly reset count notification", objc_opt_class()];
  _ADLog();

  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  [*(id *)(a1 + 32) setMonthlyResetArray:v5];

  objc_sync_exit(v4);
  id v6 = (id)[*(id *)(a1 + 32) save];
}

uint64_t __38__ADIDManager_Private__deleteRecords___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActiveDSIDRecord:0];
  v2 = [MEMORY[0x263F241D8] sharedInstance];
  [v2 clearDSIDRecords];

  uint64_t v3 = ADWriteDataToKeychain();
  if (v3)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Error deleting APIDAccountsSettings: %d", v3);
    _ADLog();
  }
  uint64_t v5 = ADWriteDataToKeychain();
  if (v5)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Error deleting DPID: %d", v5);
    _ADLog();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

void __50__ADIDManager_Private__incrementMonthlyResetCount__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 doubleValue];
  if (v3 > *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __54__ADIDManager_Private__finishedReconciling_withError___block_invoke()
{
  id v0 = +[ADAdTrackingSchedulingManager sharedInstance];
  [v0 handleAccountChange];
}

void __42__ADIDManager_Private__updateAccountData___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (v3)
    {
LABEL_3:
      id v5 = a1[5];
      id v6 = WeakRetained;
      id v7 = v3;
LABEL_8:
      [v6 finishedReconciling:v5 withError:v7];
      goto LABEL_9;
    }
  }
  else
  {
    ADSimulateCrash();
    if (v3) {
      goto LABEL_3;
    }
  }
  v8 = +[ADAdTrackingSchedulingManager sharedInstance];
  char v9 = [v8 isAdEnabledLocality];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [a1[4] activeDSIDRecord];
    v14 = [v13 DSID];
    v15 = [MEMORY[0x263F241C0] sharedInstance];
    v16 = [v15 iTunesStorefront];
    uint64_t v17 = [v11 stringWithFormat:@"[%@]: Not reconciling DPID nor sending segments to Ad Platforms. This is not an Ad-enabled locality (dsid: %@ storefront: %@)", v12, v14, v16];
    _ADLog();

    id v6 = a1[4];
    id v5 = a1[5];
    id v7 = 0;
    goto LABEL_8;
  }
  v10 = +[ADClientDPIDManager sharedInstance];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__ADIDManager_Private__updateAccountData___block_invoke_2;
  v18[3] = &unk_264669D18;
  objc_copyWeak(&v20, a1 + 6);
  id v19 = a1[5];
  [v10 reconcileDPID:v18];

  objc_destroyWeak(&v20);
LABEL_9:
}

void __42__ADIDManager_Private__updateAccountData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    ADSimulateCrash();
  }
  if (v3)
  {
    id v5 = [NSString stringWithFormat:@"[%@]: Error reconciling DPID - %@", objc_opt_class(), v3];
    _ADLog();
  }
  id v6 = [WeakRetained activeDSIDRecord];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ADIDManager_Private__updateAccountData___block_invoke_3;
  v8[3] = &unk_264669CF0;
  id v7 = v3;
  id v9 = v7;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v10 = *(id *)(a1 + 32);
  [v6 sendPersonalizedAdsStatusToAdPlatforms:v8];

  objc_destroyWeak(&v11);
}

void __42__ADIDManager_Private__updateAccountData___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = a1[4];
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained) {
    ADSimulateCrash();
  }
  id v5 = [WeakRetained activeDSIDRecord];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ADIDManager_Private__updateAccountData___block_invoke_4;
  v7[3] = &unk_264669CF0;
  id v6 = v3;
  id v8 = v6;
  objc_copyWeak(&v10, a1 + 6);
  id v9 = a1[5];
  [v5 sendSegmentDataToAdPlatforms:v7];

  objc_destroyWeak(&v10);
}

void __42__ADIDManager_Private__updateAccountData___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = *(id *)(a1 + 32);
  }
  id v5 = v3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained finishedReconciling:*(void *)(a1 + 40) withError:v5];
}

void __34__ADIDManager_Private__reconcile___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (!WeakRetained)
  {
    v15 = [NSString stringWithFormat:@"weakSelf is nil in setDSID completionHandler"];
    _ADLog();

    v16 = [NSString stringWithFormat:@"[%@]: weakSelf was nil in reconcile", objc_opt_class()];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:13 andDescription:v16];
    objc_msgSend(v17, "AD_Log:", @"iAdInternalLogging");
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);
    }

    goto LABEL_12;
  }
  id v5 = [WeakRetained activeDSIDRecord];

  id v6 = NSString;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = v7;
  if (!v5)
  {
    v16 = [v6 stringWithFormat:@"[%@]: Failed to get or create record for DSID %@", v7, *(void *)(a1 + 32)];
    uint64_t v19 = [objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:0 andDescription:v16];
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "AD_Log:", @"iAdInternalLogging");
    [v4 finishedReconciling:*(void *)(a1 + 40) withError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
LABEL_12:

    goto LABEL_13;
  }
  id v9 = [v4 activeDSIDRecord];
  id v10 = [v9 DSID];
  id v11 = [v6 stringWithFormat:@"[%@]: Set current DSID to %@. Beginning reconciliation process.", v8, v10];
  _ADLog();

  uint64_t v12 = [MEMORY[0x263F241C0] sharedInstance];
  uint64_t v13 = [v12 iTunesStorefront];

  if (!v13
    || ([v13 isEqualToString:@"NONE"] & 1) != 0
    || [v13 isEqualToString:@"ERROR"])
  {
    v14 = [MEMORY[0x263F241C0] sharedInstance];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __34__ADIDManager_Private__reconcile___block_invoke_2;
    v22[3] = &unk_264669D68;
    objc_copyWeak(&v25, v2);
    id v24 = *(id *)(a1 + 40);
    id v23 = v13;
    [v14 reloadStorefront:v22];

    objc_destroyWeak(&v25);
  }
  else
  {
    [v4 updateAccountData:*(void *)(a1 + 40)];
    if (([v13 isEqualToString:@"NONE"] & 1) == 0) {
      ADSaveToPromotedContentKeychain();
    }
  }

LABEL_13:
}

uint64_t __34__ADIDManager_Private__reconcile___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained updateAccountData:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = [(id)result isEqualToString:@"NONE"];
    if ((result & 1) == 0)
    {
      return ADSaveToPromotedContentKeychain();
    }
  }
  return result;
}

void __44__ADIDManager_Private__handleAccountChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activeDSIDRecord];
  id v3 = [v2 DSID];

  id v4 = [MEMORY[0x263F241C0] sharedInstance];
  id v5 = [v4 iTunesAccountDSID];

  id v6 = [*(id *)(a1 + 32) activeDSIDRecord];
  uint64_t v7 = [v6 iCloudDSID];

  uint64_t v8 = [MEMORY[0x263F241C0] sharedInstance];
  id v9 = [v8 iCloudDSID];

  id v10 = [*(id *)(a1 + 32) activeDSIDRecord];
  uint64_t v11 = [v10 lastJingleAccountStatus];

  if (v3 && ![v5 isEqualToString:v3])
  {
    int v13 = 1;
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    if (v3) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v5 == 0;
    }
    int v13 = !v12;
    if (!v7) {
      goto LABEL_13;
    }
  }
  if (![v9 isEqualToString:v7])
  {
    int v15 = 1;
    goto LABEL_20;
  }
LABEL_13:
  if (v7) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v9 == 0;
  }
  int v15 = !v14;
LABEL_20:
  v16 = NSString;
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = &stru_26D5A0810;
  if (v11 == -1) {
    uint64_t v18 = @"not ";
  }
  uint64_t v19 = [v16 stringWithFormat:@"[%@ handleAccountChange]: iTunesAccountDSID is %@, current DSID is %@. iCloudAccountDSID is %@, current iCloud DSID is %@. Account has %@been reconciled once.", v17, v5, v3, v9, v7, v18];
  _ADLog();

  if (((v13 | v15) & 1) != 0 || v11 == -1)
  {
    if (v13)
    {
      v22 = [NSString stringWithFormat:@"[%@ handleAccountChange]: Current iTunes account has changed from %@ to %@.", objc_opt_class(), v3, v5];
      _ADLog();
    }
    if (v15)
    {
      id v23 = [NSString stringWithFormat:@"[%@ handleAccountChange]: Current iCloud account has changed from %@ to %@.", objc_opt_class(), v7, v9];
      _ADLog();
    }
    if (v11 == -1)
    {
      id v24 = [NSString stringWithFormat:@"[%@ handleAccountChange]: Current DSID record has never been through reconcile.", objc_opt_class()];
      _ADLog();
    }
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __44__ADIDManager_Private__handleAccountChange___block_invoke_2;
    v26[3] = &unk_264669850;
    id v25 = *(void **)(a1 + 32);
    id v27 = *(id *)(a1 + 40);
    [v25 reconcile:v26];
  }
  else
  {
    uint64_t v20 = [NSString stringWithFormat:@"[%@] handleAccountChange: Current accounts (iTunes: %@, iCloud: %@) have not changed.", objc_opt_class(), v5, v9];
    _ADLog();

    uint64_t v21 = *(void *)(a1 + 40);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
  }
}

uint64_t __44__ADIDManager_Private__handleAccountChange___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __32__ADIDManager_Private__runTask___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) checkForLateReconcile];
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__ADIDManager_Private__runTask___block_invoke_2;
  v3[3] = &unk_264669DB8;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  [v2 reconcile:v3];
}

void __32__ADIDManager_Private__runTask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = NSString;
  id v4 = a2;
  uint64_t v5 = objc_opt_class();
  id v6 = [*(id *)(a1 + 40) requestIdentifier];
  uint64_t v7 = [v3 stringWithFormat:@"[%@]: Finished task %@ with error %@", v5, v6, v4];

  _ADLog();
  if (([*(id *)(a1 + 40) finishTask] & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:@"[%@] ERROR: Unable to mark the task as finished. Please file a radar...", objc_opt_class()];
    _ADLog();
  }
}

@end