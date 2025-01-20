@interface _ASAccountManagerTipManager
+ (BOOL)_hasAcknowledgedTip:(int64_t)a3;
+ (id)_defaultKeyForTipType:(int64_t)a3;
+ (id)_refreshDateForTip:(int64_t)a3;
+ (void)_acknowledgeTip:(int64_t)a3;
+ (void)_checkEligibilityForFamilySharingTipWithCompletionHandler:(id)a3;
+ (void)_checkEligibilityForGeneralSharingTipWithCompletionHandler:(id)a3;
+ (void)_checkEligibilityForImportPasswordsTipWithCompletionHandler:(id)a3;
+ (void)_checkEligibilityForiCloudKeychainTipWithCompletionHandler:(id)a3;
+ (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3;
+ (void)fetchTipToShow:(id)a3;
+ (void)userDidAcknowledgeTip:(int64_t)a3;
@end

@implementation _ASAccountManagerTipManager

+ (void)fetchTipToShow:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke;
  v6[3] = &unk_2643958C8;
  id v7 = v4;
  id v8 = a1;
  id v5 = v4;
  [a1 _checkEligibilityForImportPasswordsTipWithCompletionHandler:v6];
}

+ (void)userDidAcknowledgeTip:(int64_t)a3
{
  if (a3 != 1 && a3 != 3)
  {
    if (a3 != 2) {
      return;
    }
    objc_msgSend(a1, "_acknowledgeTip:");
    a3 = 3;
  }

  [a1 _acknowledgeTip:a3];
}

+ (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F3BF48]);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke;
  v6[3] = &unk_264395958;
  id v7 = v3;
  id v5 = v3;
  [v4 startRequestWithCompletionHandler:v6];
}

+ (BOOL)_hasAcknowledgedTip:(int64_t)a3
{
  id v5 = objc_msgSend(a1, "_refreshDateForTip:");
  v6 = [a1 _defaultKeyForTipType:a3];
  if (!v5)
  {
    v10 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    v11 = objc_msgSend(v10, "safari_dateForKey:", v6);
    BOOL v9 = v11 != 0;

LABEL_6:
    goto LABEL_7;
  }
  id v7 = [MEMORY[0x263EFF910] date];
  uint64_t v8 = [v5 compare:v7];

  if (v8 == -1)
  {
    v10 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    [v10 removeObjectForKey:v6];
    BOOL v9 = 0;
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (id)_refreshDateForTip:(int64_t)a3
{
  if (a3 == 1)
  {
    id v3 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    id v4 = objc_msgSend(v3, "safari_dateForKey:", @"iCloudKeychainTipAcknowledgementDate");

    if (v4)
    {
      id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
      v6 = [v5 dateByAddingUnit:16 value:90 toDate:v4 options:0];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_defaultKeyForTipType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_264395A10[a3 - 1];
  }
}

+ (void)_acknowledgeTip:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = [MEMORY[0x263EFF910] date];
      id v4 = @"generalSharingTipAcknowledgementDate";
      break;
    case 2:
      objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = [MEMORY[0x263EFF910] date];
      id v4 = @"familySharingTipAcknowledgementDate";
      break;
    case 1:
      objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      id v3 = [MEMORY[0x263EFF910] date];
      id v4 = @"iCloudKeychainTipAcknowledgementDate";
      break;
    default:
      return;
  }
  objc_msgSend(v5, "safari_setDate:forKey:", v3, v4);
}

+ (void)_checkEligibilityForImportPasswordsTipWithCompletionHandler:(id)a3
{
}

+ (void)_checkEligibilityForiCloudKeychainTipWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [MEMORY[0x263F66348] sharedObserver];
  char v6 = [v5 isUsingICloud];

  if ((v6 & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21918F000, v11, OS_LOG_TYPE_INFO, "Skipping iCloud Keychain tip because no primary iCloud account is present", v13, 2u);
    }
    goto LABEL_9;
  }
  id v7 = [MEMORY[0x263F662C8] sharedMonitor];
  char v8 = [v7 canKeychainSyncBeEnabled];

  if ((v8 & 1) == 0) {
    goto LABEL_9;
  }
  BOOL v9 = [MEMORY[0x263F662C8] sharedMonitor];
  uint64_t v10 = [v9 keychainSyncSettingValue];

  if (v10 == 2)
  {
    v12 = objc_msgSend(MEMORY[0x263EFFA40], "safari_browserDefaults");
    [v12 removeObjectForKey:@"iCloudKeychainTipAcknowledgementDate"];

    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    v4[2](v4, 0);
    goto LABEL_10;
  }
  v4[2](v4, [a1 _hasAcknowledgedTip:1] ^ 1);
LABEL_10:
}

+ (void)_checkEligibilityForFamilySharingTipWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if ([a1 _hasAcknowledgedTip:2])
  {
    v4[2](v4, 0);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263F3BF48]);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke;
    v6[3] = &unk_2643959F0;
    id v7 = v4;
    id v8 = a1;
    [v5 startRequestWithCompletionHandler:v6];
  }
}

+ (void)_checkEligibilityForGeneralSharingTipWithCompletionHandler:(id)a3
{
  id v8 = (void (**)(id, uint64_t))a3;
  if ([a1 _hasAcknowledgedTip:3]) {
    goto LABEL_4;
  }
  id v4 = [MEMORY[0x263F662D8] sharedProvider];
  id v5 = [v4 cachedGroups];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [a1 _acknowledgeTip:3];
LABEL_4:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v7 = 1;
LABEL_6:
  v8[2](v8, v7);
}

@end