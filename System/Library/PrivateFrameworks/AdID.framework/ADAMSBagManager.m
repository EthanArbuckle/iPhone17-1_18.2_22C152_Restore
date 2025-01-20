@interface ADAMSBagManager
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
+ (id)sharedInstance;
- (BOOL)authenticateAccountThroughAMSOperation:(id)a3;
- (BOOL)retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag;
- (BOOL)retrieveIsSponsoredAdsEnabledValueFromAMSBag;
- (id)retrieveJingleRequestURLFromAMSBagWithPartialityKey:(id)a3;
- (int64_t)retrieveLatestPersonalizedAdsConsentVersionFromAMSBag;
@end

@implementation ADAMSBagManager

void __63__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueFromAMSBag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    v5 = NSString;
    v6 = [a3 localizedDescription];
    v7 = [v5 stringWithFormat:@"Unable to get the 'isSponsoredAdsEnabled' status from the bag. Error: %@", v6];
    _ADLog();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 BOOLValue];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ADAMSBagManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_0 != -1) {
    dispatch_once(&sharedInstance__onceToken_0, block);
  }
  v2 = (void *)sharedInstance__instance_0;

  return v2;
}

- (int64_t)retrieveLatestPersonalizedAdsConsentVersionFromAMSBag
{
  v2 = +[ADAMSBagManager createBagForSubProfile];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 1;
  v4 = [v2 integerForKey:@"latestPersonalizedAdsConsentVersion"];
  v5 = [v4 valuePromise];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __72__ADAMSBagManager_retrieveLatestPersonalizedAdsConsentVersionFromAMSBag__block_invoke;
  v14 = &unk_264669EE8;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  [v5 addFinishBlock:&v11];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get the 'latestPersonalizedAdsConsentVersion' key from the bag in time.", v11, v12, v13, v14);
    _ADLog();
  }
  int64_t v9 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (BOOL)retrieveIsSponsoredAdsEnabledValueFromAMSBag
{
  v2 = +[ADAMSBagManager createBagForSubProfile];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v4 = [v2 BOOLForKey:@"isSponsoredAdsEnabled"];
  v5 = [v4 valuePromise];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __63__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueFromAMSBag__block_invoke;
  v14 = &unk_264669EE8;
  v16 = &v17;
  v6 = v3;
  v15 = v6;
  [v5 addFinishBlock:&v11];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get the 'isSponsoredAdsEnabled' key from the bag in time.", v11, v12, v13, v14);
    _ADLog();
  }
  char v9 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (id)createBagForSubProfile
{
  v2 = [MEMORY[0x263F241C0] sharedInstance];
  dispatch_semaphore_t v3 = [v2 adprivacydBag];

  return v3;
}

intptr_t __72__ADAMSBagManager_retrieveLatestPersonalizedAdsConsentVersionFromAMSBag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    v4 = NSString;
    v5 = [a3 localizedDescription];
    v6 = [v4 stringWithFormat:@"Unable to get 'latestPersonalizedAdsConsentVersion' from the bag. Error: %@", v5];
    _ADLog();

    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = [a2 integerValue];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  id v8 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v8);
}

uint64_t __33__ADAMSBagManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

+ (NSString)bagSubProfile
{
  if (bagSubProfile_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&bagSubProfile_ams_once_token___COUNTER__, &__block_literal_global_4);
  }
  v2 = (void *)bagSubProfile_ams_once_object___COUNTER__;

  return (NSString *)v2;
}

void __32__ADAMSBagManager_bagSubProfile__block_invoke()
{
  v0 = (void *)bagSubProfile_ams_once_object___COUNTER__;
  bagSubProfile_ams_once_object___COUNTER__ = @"adprivacyd";
}

+ (NSString)bagSubProfileVersion
{
  if (bagSubProfileVersion_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&bagSubProfileVersion_ams_once_token___COUNTER__, &__block_literal_global_12_0);
  }
  v2 = (void *)bagSubProfileVersion_ams_once_object___COUNTER__;

  return (NSString *)v2;
}

void __39__ADAMSBagManager_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)bagSubProfileVersion_ams_once_object___COUNTER__;
  bagSubProfileVersion_ams_once_object___COUNTER__ = @"1";
}

- (BOOL)authenticateAccountThroughAMSOperation:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  v4 = (void *)MEMORY[0x223CA6640]();
  id v5 = objc_alloc_init(MEMORY[0x263F27B00]);
  [v5 setAuthenticationType:1];
  [v5 setAllowServerDialogs:0];
  v6 = (void *)[objc_alloc(MEMORY[0x263F27B18]) initWithAccount:v3 options:v5];
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  id v8 = [v6 performAuthentication];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __58__ADAMSBagManager_authenticateAccountThroughAMSOperation___block_invoke;
  uint64_t v17 = &unk_264669EC0;
  uint64_t v19 = &v20;
  char v9 = v7;
  v18 = v9;
  [v8 addFinishBlock:&v14];

  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v9, v10))
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"[FILE A RADAR] We failed to authenticate in time.", v14, v15, v16, v17);
    _ADLog();
  }
  BOOL v12 = v21[5] != 0;
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __58__ADAMSBagManager_authenticateAccountThroughAMSOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    v6 = NSString;
    uint64_t v7 = [a3 localizedDescription];
    id v8 = [v6 stringWithFormat:@"Performing the Authentication Returned Error: %@", v7];
    _ADLog();
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v5;
  id v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag
{
  v2 = +[ADAMSBagManager createBagForSubProfile];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v4 = [v2 BOOLForKey:@"isSponsoredAdsEnabledForAdTrackingd"];
  id v5 = [v4 valuePromise];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __77__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag__block_invoke;
  uint64_t v14 = &unk_264669EE8;
  v16 = &v17;
  v6 = v3;
  uint64_t v15 = v6;
  [v5 addFinishBlock:&v11];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get the 'isSponsoredAdsEnabledForAdTrackingd' key from the bag in time.", v11, v12, v13, v14);
    _ADLog();
  }
  char v9 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __77__ADAMSBagManager_retrieveIsSponsoredAdsEnabledValueForAdTrackingdFromAMSBag__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  if (a3)
  {
    id v5 = NSString;
    v6 = [a3 localizedDescription];
    dispatch_time_t v7 = [v5 stringWithFormat:@"Unable to get the 'isSponsoredAdsEnabledForAdTrackingd' status from the bag. Error: %@", v6];
    _ADLog();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 BOOLValue];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)retrieveJingleRequestURLFromAMSBagWithPartialityKey:(id)a3
{
  id v3 = a3;
  v4 = v3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  if (v3 && [v3 length])
  {
    id v5 = +[ADAMSBagManager createBagForSubProfile];
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = v4;
    id v8 = [v5 URLForKey:v7];
    char v9 = [v8 valuePromise];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__ADAMSBagManager_retrieveJingleRequestURLFromAMSBagWithPartialityKey___block_invoke;
    v16[3] = &unk_264669F10;
    uint64_t v19 = &v20;
    id v10 = v7;
    id v17 = v10;
    uint64_t v11 = v6;
    v18 = v11;
    [v9 addFinishBlock:v16];
    dispatch_time_t v12 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      v13 = [NSString stringWithFormat:@"Failed to get the URL key from the bag in time."];
      _ADLog();
    }
    id v14 = (id)v21[5];
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"Error: Key for AMS bag lookup is empty. Cannot return a value."];
    _ADLog();
    id v14 = 0;
  }

  _Block_object_dispose(&v20, 8);

  return v14;
}

void __71__ADAMSBagManager_retrieveJingleRequestURLFromAMSBagWithPartialityKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v6 || (v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) == 0)
  {
    id v7 = NSString;
    uint64_t v8 = *(void *)(a1 + 32);
    char v9 = [v6 localizedDescription];
    id v10 = [v7 stringWithFormat:@"Unable to get the '%@' key for Jingle from the bag. Error: %@. Falling back to value in user defaults.", v8, v9];
    _ADLog();

    uint64_t v11 = [MEMORY[0x263F241B8] sharedInstance];
    dispatch_time_t v12 = [v11 stringForKey:*(void *)(a1 + 32)];

    if (!v12 || ![v12 length])
    {
      id v17 = [NSString stringWithFormat:@"Unable to get Jingle URL for request type '%@' from user defaults. File a radar if you see this message!", *(void *)(a1 + 32)];
      _ADLog();

      goto LABEL_10;
    }
    uint64_t v13 = [NSURL URLWithString:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  v18 = [v16 absoluteString];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    uint64_t v20 = [MEMORY[0x263F241B8] sharedInstance];
    v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) absoluteString];
    [v20 setString:v21 forKey:*(void *)(a1 + 32)];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
LABEL_10:
}

@end