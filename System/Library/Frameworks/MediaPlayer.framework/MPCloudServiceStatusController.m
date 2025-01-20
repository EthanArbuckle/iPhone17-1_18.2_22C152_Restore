@interface MPCloudServiceStatusController
+ (MPCloudServiceStatusController)cloudServiceStatusControllerWithUserIdentity:(id)a3;
+ (MPCloudServiceStatusController)sharedController;
+ (NSMutableDictionary)controllers;
+ (OS_dispatch_queue)globalSerialQueue;
+ (id)_cloudServiceStatusControllerWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4;
+ (void)_postNotificationName:(id)a3 controller:(id)a4;
+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5;
- (BOOL)_calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:(BOOL *)a3;
- (BOOL)_currentCloudLibraryEnabled;
- (BOOL)_currentPurchaseHistoryEnabled;
- (BOOL)_handlesSameAccountAs:(id)a3;
- (BOOL)hasLoadedSubscriptionAvailability;
- (BOOL)isSubscriptionAvailable;
- (BOOL)shouldPlaybackRequireSubscriptionLease;
- (ICMusicSubscriptionFairPlayKeyStatus)lastKnownSubscriptionFairPlayKeyStatus;
- (ICMusicSubscriptionStatus)musicSubscriptionStatus;
- (ICUserIdentity)userIdentity;
- (MPCloudServiceStatusController)init;
- (NSString)description;
- (OS_dispatch_queue)serialQueue;
- (SSVFairPlaySubscriptionStatus)lastKnownFairPlaySubscriptionStatus;
- (SSVSubscriptionStatus)subscriptionStatus;
- (id)_initWithUserIdentity:(id)a3;
- (unint64_t)matchStatus;
- (void)_allowsMusicSubscriptionDidChange:(id)a3;
- (void)_beginObservingCloudLibraryEnabled;
- (void)_beginObservingMatchStatus;
- (void)_cloudClientAuthenticationDidChange;
- (void)_copyObservationStateFrom:(id)a3;
- (void)_enableICMLErrorReasonChange:(id)a3;
- (void)_endObservingCloudLibraryEnabled;
- (void)_endObservingMatchStatus;
- (void)_performBlockOnControllerHandlingTheSameAccount:(id)a3;
- (void)_updateMatchStatus;
- (void)_updateSubscriptionAvailability;
- (void)_updateSubscriptionAvailabilityWithValue:(BOOL)a3;
- (void)_userIdentityStoreDidChange:(id)a3;
- (void)beginObservingCloudLibraryEnabled;
- (void)beginObservingMatchStatus;
- (void)dealloc;
- (void)endObservingCloudLibraryEnabled;
- (void)endObservingMatchStatus;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)refreshMusicSubscriptionStatus;
@end

@implementation MPCloudServiceStatusController

- (ICMusicSubscriptionStatus)musicSubscriptionStatus
{
  return (ICMusicSubscriptionStatus *)[(ICMusicSubscriptionStatusMonitor *)self->_subscriptionStatusMonitor subscriptionStatus];
}

- (BOOL)hasLoadedSubscriptionAvailability
{
  return self->_hasLoadedSubscriptionAvailability;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)MPCloudServiceStatusController;
  v3 = [(MPCloudServiceStatusController *)&v7 description];
  v4 = [(MPCloudServiceStatusController *)self userIdentity];
  v5 = [v3 stringByAppendingFormat:@" [%@]", v4];

  return (NSString *)v5;
}

- (ICUserIdentity)userIdentity
{
  userIdentity = self->_userIdentity;
  if (userIdentity)
  {
    v3 = userIdentity;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB87B8] activeAccount];
  }

  return v3;
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4
{
}

void __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB87C0];
  id v6 = a2;
  v4 = [v3 defaultIdentityStore];
  [v6 setIdentityStore:v4];

  v5 = [*(id *)(a1 + 32) userIdentity];
  [v6 setIdentity:v5];

  [v6 setAllowsExpiredBags:1];
}

void __61__MPCloudServiceStatusController__currentCloudLibraryEnabled__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v2 == -1)
  {
    v3 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    v4 = [*(id *)(a1 + 32) userIdentity];
    id v7 = 0;
    v5 = [v3 getPropertiesForUserIdentity:v4 error:&v7];
    id v6 = v7;

    if (!v6 && v5) {
      *(void *)(*(void *)(a1 + 32) + 32) = [v5 isActiveLocker];
    }

    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 1;
}

- (BOOL)isSubscriptionAvailable
{
  if (self->_hasLoadedSubscriptionAvailability) {
    return self->_subscriptionAvailable;
  }
  v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"_MPCloudServiceStatusControllerSubscriptionAvailability"];

  [(MPCloudServiceStatusController *)self _updateSubscriptionAvailability];
  return v5;
}

+ (void)_postNotificationName:(id)a3 controller:(id)a4 userInfo:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    v10 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting notification [%@]", buf, 0x16u);
    }

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:v7 object:v8 userInfo:v9];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__MPCloudServiceStatusController__postNotificationName_controller_userInfo___block_invoke;
    v13[3] = &unk_1E57F3E68;
    id v14 = v7;
    id v15 = v9;
    [v8 _performBlockOnControllerHandlingTheSameAccount:v13];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:v7 object:0 userInfo:v9];
  }
}

+ (MPCloudServiceStatusController)cloudServiceStatusControllerWithUserIdentity:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543618;
    id v11 = a1;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Request for a controller with user identity %@", (uint8_t *)&v10, 0x16u);
  }

  id v6 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  char v7 = [v6 supportsMultipleITunesAccounts];

  if (v7) {
    +[MPCloudServiceStatusController _cloudServiceStatusControllerWithUserIdentity:v4 createIfRequired:1];
  }
  else {
  id v8 = +[MPCloudServiceStatusController sharedController];
  }

  return (MPCloudServiceStatusController *)v8;
}

- (void)beginObservingCloudLibraryEnabled
{
  v3 = +[MPCloudServiceStatusController sharedController];

  if (v3 == self)
  {
    [(MPCloudServiceStatusController *)self _beginObservingCloudLibraryEnabled];
    [(MPCloudServiceStatusController *)self _performBlockOnControllerHandlingTheSameAccount:&__block_literal_global_71_30839];
  }
}

- (void)_performBlockOnControllerHandlingTheSameAccount:(id)a3
{
  __int16 v12 = (void (**)(id, void *))a3;
  id v4 = +[MPCloudServiceStatusController sharedController];
  if (v4 == self)
  {
  }
  else
  {
    char v5 = v4;
    id v6 = +[MPCloudServiceStatusController sharedController];
    BOOL v7 = [(MPCloudServiceStatusController *)self _handlesSameAccountAs:v6];

    if (v7)
    {
      id v8 = +[MPCloudServiceStatusController sharedController];
      if (!v8) {
        goto LABEL_9;
      }
LABEL_8:
      v12[2](v12, v8);

      goto LABEL_9;
    }
  }
  id v9 = +[MPCloudServiceStatusController sharedController];

  if (v9 == self)
  {
    int v10 = +[MPCloudServiceStatusController sharedController];
    id v11 = [v10 userIdentity];
    id v8 = +[MPCloudServiceStatusController _cloudServiceStatusControllerWithUserIdentity:v11 createIfRequired:0];

    if (v8) {
      goto LABEL_8;
    }
  }
LABEL_9:
}

+ (MPCloudServiceStatusController)sharedController
{
  if (sharedController_onceToken_30894 != -1) {
    dispatch_once(&sharedController_onceToken_30894, &__block_literal_global_39);
  }
  uint64_t v2 = (void *)sharedController___controller;

  return (MPCloudServiceStatusController *)v2;
}

+ (id)_cloudServiceStatusControllerWithUserIdentity:(id)a3 createIfRequired:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__30885;
  v25 = __Block_byref_object_dispose__30886;
  id v26 = 0;
  BOOL v7 = [a1 globalSerialQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __97__MPCloudServiceStatusController__cloudServiceStatusControllerWithUserIdentity_createIfRequired___block_invoke;
  v16 = &unk_1E57F3E18;
  id v8 = v6;
  BOOL v20 = v4;
  __int16 v18 = &v21;
  id v19 = a1;
  id v17 = v8;
  dispatch_sync(v7, &v13);

  if (v4)
  {
    id v9 = (void *)v22[5];
    int v10 = +[MPCloudServiceStatusController sharedController];
    [v9 _copyObservationStateFrom:v10];
  }
  id v11 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v11;
}

+ (OS_dispatch_queue)globalSerialQueue
{
  if (globalSerialQueue_onceToken_30901 != -1) {
    dispatch_once(&globalSerialQueue_onceToken_30901, &__block_literal_global_30902);
  }
  uint64_t v2 = (void *)globalSerialQueue___globalSerialQueue_30903;

  return (OS_dispatch_queue *)v2;
}

- (void)_beginObservingCloudLibraryEnabled
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MPCloudServiceStatusController__beginObservingCloudLibraryEnabled__block_invoke;
  block[3] = &unk_1E57F9EA8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (BOOL)_currentCloudLibraryEnabled
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  cloudLibraryStatusAccessQueue = self->_cloudLibraryStatusAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MPCloudServiceStatusController__currentCloudLibraryEnabled__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(cloudLibraryStatusAccessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__MPCloudServiceStatusController__updateSubscriptionAvailabilityWithValue___block_invoke(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerSubscriptionAvailabilityDidChangeNotification" controller:*(void *)(a1 + 32)];
}

uint64_t __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke_2(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerSubscriptionStatusDidChangeNotification" controller:*(void *)(a1 + 32)];
}

uint64_t __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v4 = result;
    char v5 = [a2 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
    BOOL v6 = v5 != 0;

    BOOL v7 = *(void **)(v4 + 32);
    return [v7 _updateSubscriptionAvailabilityWithValue:v6];
  }
  return result;
}

void __45__MPCloudServiceStatusController_controllers__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)controllers___controllers_30898;
  controllers___controllers_30898 = (uint64_t)v0;
}

void __97__MPCloudServiceStatusController__cloudServiceStatusControllerWithUserIdentity_createIfRequired___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) accountDSID];
  if (![(__CFString *)v2 length])
  {

    uint64_t v2 = @"NoDSID";
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = [*(id *)(a1 + 48) controllers];
    uint64_t v4 = [v3 objectForKeyedSubscript:v2];

    if (!v4)
    {
      char v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 32);
        int v14 = 138543618;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pre-existing controller for user identity %@", (uint8_t *)&v14, 0x16u);
      }

      id v8 = [[MPCloudServiceStatusController alloc] _initWithUserIdentity:*(void *)(a1 + 32)];
      char v9 = [*(id *)(a1 + 48) controllers];
      [v9 setObject:v8 forKeyedSubscript:v2];
    }
  }
  int v10 = [*(id *)(a1 + 48) controllers];
  uint64_t v11 = [v10 objectForKeyedSubscript:v2];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

+ (NSMutableDictionary)controllers
{
  if (controllers_onceToken_30896 != -1) {
    dispatch_once(&controllers_onceToken_30896, &__block_literal_global_37_30897);
  }
  uint64_t v2 = (void *)controllers___controllers_30898;

  return (NSMutableDictionary *)v2;
}

- (void)_updateSubscriptionAvailabilityWithValue:(BOOL)a3
{
  self->_hasLoadedSubscriptionAvailability = 1;
  if (self->_subscriptionAvailable != a3)
  {
    BOOL v3 = a3;
    self->_subscriptionAvailable = a3;
    char v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v5 setBool:v3 forKey:@"_MPCloudServiceStatusControllerSubscriptionAvailability"];

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MPCloudServiceStatusController__updateSubscriptionAvailabilityWithValue___block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_async(calloutQueue, block);
  }
}

void __68__MPCloudServiceStatusController__beginObservingCloudLibraryEnabled__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (++*(void *)(*(void *)(a1 + 32) + 40) == 1)
  {
    uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - beginObservingCloudLibraryEnabled - Registering for ICCloudClientIsAuthenticatedDidChangeNotification", (uint8_t *)&v5, 0xCu);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_CloudClientAuthenticationDidChangeCallback, (CFStringRef)*MEMORY[0x1E4FB83F0], 0, (CFNotificationSuspensionBehavior)0);
  }
}

void __51__MPCloudServiceStatusController_globalSerialQueue__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaplayer.MPCloudServiceStatusController.global.serial.queue", v2);
  v1 = (void *)globalSerialQueue___globalSerialQueue_30903;
  globalSerialQueue___globalSerialQueue_30903 = (uint64_t)v0;
}

void __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    int v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

void __50__MPCloudServiceStatusController_sharedController__block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v0 = [[MPCloudServiceStatusController alloc] _initWithUserIdentity:0];
  v1 = (void *)sharedController___controller;
  sharedController___controller = (uint64_t)v0;

  uint64_t v2 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138543362;
    uint64_t v4 = sharedController___controller;
    _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ - Singleton", (uint8_t *)&v3, 0xCu);
  }
}

- (id)_initWithUserIdentity:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MPCloudServiceStatusController;
  uint64_t v5 = [(MPCloudServiceStatusController *)&v35 init];
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v5;
      __int16 v38 = 2112;
      id v39 = v4;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating new controller for user identity %@", buf, 0x16u);
    }

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPCloudServiceStatusController.accessQueue", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MediaPlayer.MPCloudServiceStatusController.calloutQueue", 0);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.MediaPlayer.MPCloudServiceStatusController.cloudLibraryStatusAccessQueue", 0);
    cloudLibraryStatusAccessQueue = v5->_cloudLibraryStatusAccessQueue;
    v5->_cloudLibraryStatusAccessQueue = (OS_dispatch_queue *)v11;

    v5->_cloudLibraryStatus = -1;
    uint64_t v13 = [v4 copy];
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    __int16 v16 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
    [v15 addObserver:v5 selector:sel__userIdentityStoreDidChange_ name:*MEMORY[0x1E4FB8578] object:v16];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v5 selector:sel__enableICMLErrorReasonChange_ name:*MEMORY[0x1E4FB83E0] object:0];

    objc_initWeak(&location, v5);
    if (v5->_userIdentity)
    {
      uint64_t v18 = v5->_userIdentity;
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4FB87B8] autoupdatingActiveAccount];
    }
    id v19 = v18;
    uint64_t v20 = [MEMORY[0x1E4FB86A8] sharedMonitorForIdentity:v18];
    subscriptionStatusMonitor = v5->_subscriptionStatusMonitor;
    v5->_subscriptionStatusMonitor = (ICMusicSubscriptionStatusMonitor *)v20;

    v22 = v5->_subscriptionStatusMonitor;
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __56__MPCloudServiceStatusController__initWithUserIdentity___block_invoke;
    v32 = &unk_1E57F3E40;
    objc_copyWeak(&v33, &location);
    uint64_t v23 = [(ICMusicSubscriptionStatusMonitor *)v22 beginObservingSubscriptionStatusWithHandler:&v29];
    subscriptionStatusObservationToken = v5->_subscriptionStatusObservationToken;
    v5->_subscriptionStatusObservationToken = (NSCopying *)v23;

    v25 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v5;
      __int16 v38 = 2112;
      id v39 = v4;
      _os_log_impl(&dword_1952E8000, v25, OS_LOG_TYPE_INFO, "%{public}@ - New instance created for user identity: %@", buf, 0x16u);
    }

    id v26 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v29, v30, v31, v32);
    v27 = +[MPRestrictionsMonitor sharedRestrictionsMonitor];
    [v26 addObserver:v5 selector:sel__allowsMusicSubscriptionDidChange_ name:@"MPRestrictionsMonitorMusicSubscriptionDidChangeNotification" object:v27];

    [(MPCloudServiceStatusController *)v5 _updateSubscriptionAvailability];
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)_updateSubscriptionAvailability
{
  int v3 = +[MPRestrictionsMonitor sharedRestrictionsMonitor];
  char v4 = [v3 allowsMusicSubscription];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB8758]);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke;
    v9[3] = &unk_1E57F7888;
    v9[4] = self;
    uint64_t v6 = (void *)[v5 initWithBlock:v9];
    dispatch_queue_t v7 = [MEMORY[0x1E4FB8788] sharedBagProvider];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65__MPCloudServiceStatusController__updateSubscriptionAvailability__block_invoke_2;
    v8[3] = &unk_1E57FA240;
    v8[4] = self;
    [v7 getBagForRequestContext:v6 withCompletionHandler:v8];
  }
  else
  {
    [(MPCloudServiceStatusController *)self _updateSubscriptionAvailabilityWithValue:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_lastKnownSubscriptionFairPlayKeyStatus, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusObservationToken, 0);
  objc_storeStrong((id *)&self->_subscriptionStatusMonitor, 0);
  objc_storeStrong((id *)&self->_cloudLibraryStatusAccessQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (SSVSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (ICMusicSubscriptionFairPlayKeyStatus)lastKnownSubscriptionFairPlayKeyStatus
{
  return self->_lastKnownSubscriptionFairPlayKeyStatus;
}

- (BOOL)_handlesSameAccountAs:(id)a3
{
  if (self == a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(MPCloudServiceStatusController *)self userIdentity];
  uint64_t v6 = [v5 accountDSID];
  dispatch_queue_t v7 = [v4 userIdentity];

  id v8 = [v7 accountDSID];
  if (v6 == v8) {
    char v9 = 1;
  }
  else {
    char v9 = [v6 isEqual:v8];
  }

  return v9;
}

- (void)_copyObservationStateFrom:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  id v5 = v4[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPCloudServiceStatusController__copyObservationStateFrom___block_invoke;
  block[3] = &unk_1E57F9278;
  dispatch_queue_t v11 = &v17;
  uint64_t v6 = v4;
  id v10 = v6;
  uint64_t v12 = &v13;
  dispatch_sync(v5, block);
  if (v18[3])
  {
    unint64_t v7 = 0;
    do
    {
      [(MPCloudServiceStatusController *)self _beginObservingCloudLibraryEnabled];
      ++v7;
    }
    while (v7 < v18[3]);
  }
  if (v14[3])
  {
    unint64_t v8 = 0;
    do
    {
      [(MPCloudServiceStatusController *)self _beginObservingMatchStatus];
      ++v8;
    }
    while (v8 < v14[3]);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void *__60__MPCloudServiceStatusController__copyObservationStateFrom___block_invoke(void *result)
{
  *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(result[4] + 40);
  *(void *)(*(void *)(result[6] + 8) + 24) = *(void *)(result[4] + 72);
  return result;
}

- (void)_endObservingMatchStatus
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MPCloudServiceStatusController__endObservingMatchStatus__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __58__MPCloudServiceStatusController__endObservingMatchStatus__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 72);
  if (v2) {
    *(void *)(v1 + 72) = v2 - 1;
  }
  return result;
}

- (void)_beginObservingMatchStatus
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MPCloudServiceStatusController__beginObservingMatchStatus__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void *__60__MPCloudServiceStatusController__beginObservingMatchStatus__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 72);
  result = *(void **)(a1 + 32);
  if (result[9] == 1) {
    return (void *)[result _updateMatchStatus];
  }
  return result;
}

- (void)_endObservingCloudLibraryEnabled
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MPCloudServiceStatusController__endObservingCloudLibraryEnabled__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __66__MPCloudServiceStatusController__endObservingCloudLibraryEnabled__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2)
  {
    *(void *)(v1 + 40) = v2 - 1;
    if (!*(void *)(*(void *)(a1 + 32) + 40))
    {
      id v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        int v7 = 138543362;
        uint64_t v8 = v5;
        _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - endObservingCloudLibraryEnabled - Unregistering for ICCloudClientIsAuthenticatedDidChangeNotification", (uint8_t *)&v7, 0xCu);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationName)*MEMORY[0x1E4FB83F0], 0);
    }
  }
}

- (void)_updateMatchStatus
{
  BOOL hasLoadedMatchStatus = self->_hasLoadedMatchStatus;
  self->_BOOL hasLoadedMatchStatus = 1;
  id v4 = [(MPCloudServiceStatusController *)self musicSubscriptionStatus];
  if ([v4 isMatchEnabled]) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = 0;
  }
  if (!hasLoadedMatchStatus || self->_matchStatus != v5)
  {
    int v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 setInteger:v5 forKey:@"_MPCloudServiceStatusControllerMatchStatus"];

    if (self->_matchStatus != v5)
    {
      self->_matchStatus = v5;
      calloutQueue = self->_calloutQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__MPCloudServiceStatusController__updateMatchStatus__block_invoke;
      block[3] = &unk_1E57F9EA8;
      void block[4] = self;
      dispatch_async(calloutQueue, block);
    }
  }
}

uint64_t __52__MPCloudServiceStatusController__updateMatchStatus__block_invoke(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerMatchStatusDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (BOOL)_currentPurchaseHistoryEnabled
{
  int v3 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  id v4 = [(MPCloudServiceStatusController *)self userIdentity];
  uint64_t v9 = 0;
  unint64_t v5 = [v3 getPropertiesForUserIdentity:v4 error:&v9];
  uint64_t v6 = v9;

  char v7 = 0;
  if (!v6 && v5) {
    char v7 = [v5 isActive];
  }

  return v7;
}

- (BOOL)_calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:(BOOL *)a3
{
  id v4 = [MEMORY[0x1E4FB8618] sharedMonitor];
  char v5 = [v4 isRemoteServerLikelyReachable];

  if (a3) {
    *a3 = v5;
  }
  return v5;
}

- (void)endObservingMatchStatus
{
  int v3 = +[MPCloudServiceStatusController sharedController];

  if (v3 == self)
  {
    [(MPCloudServiceStatusController *)self _endObservingMatchStatus];
    [(MPCloudServiceStatusController *)self _performBlockOnControllerHandlingTheSameAccount:&__block_literal_global_77];
  }
}

uint64_t __57__MPCloudServiceStatusController_endObservingMatchStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _endObservingMatchStatus];
}

- (void)endObservingCloudLibraryEnabled
{
  int v3 = +[MPCloudServiceStatusController sharedController];

  if (v3 == self)
  {
    [(MPCloudServiceStatusController *)self _endObservingCloudLibraryEnabled];
    [(MPCloudServiceStatusController *)self _performBlockOnControllerHandlingTheSameAccount:&__block_literal_global_75];
  }
}

uint64_t __65__MPCloudServiceStatusController_endObservingCloudLibraryEnabled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _endObservingCloudLibraryEnabled];
}

- (void)refreshMusicSubscriptionStatus
{
}

- (void)beginObservingMatchStatus
{
  int v3 = +[MPCloudServiceStatusController sharedController];

  if (v3 == self)
  {
    [(MPCloudServiceStatusController *)self _beginObservingMatchStatus];
    [(MPCloudServiceStatusController *)self _performBlockOnControllerHandlingTheSameAccount:&__block_literal_global_73];
  }
}

uint64_t __59__MPCloudServiceStatusController_beginObservingMatchStatus__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _beginObservingMatchStatus];
}

uint64_t __67__MPCloudServiceStatusController_beginObservingCloudLibraryEnabled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _beginObservingCloudLibraryEnabled];
}

- (BOOL)shouldPlaybackRequireSubscriptionLease
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__MPCloudServiceStatusController_shouldPlaybackRequireSubscriptionLease__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

unsigned char *__72__MPCloudServiceStatusController_shouldPlaybackRequireSubscriptionLease__block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[88])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result[90];
  }
  else
  {
    result = (unsigned char *)[result _calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  return result;
}

- (unint64_t)matchStatus
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MPCloudServiceStatusController_matchStatus__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __45__MPCloudServiceStatusController_matchStatus__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(v2 + 80);
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 integerForKey:@"_MPCloudServiceStatusControllerMatchStatus"];
  }
}

- (SSVFairPlaySubscriptionStatus)lastKnownFairPlaySubscriptionStatus
{
  return 0;
}

- (void)_enableICMLErrorReasonChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 name];
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received notification [%{public}@]", (uint8_t *)&v7, 0x16u);
  }
  +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification" controller:self];
}

- (void)_userIdentityStoreDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 name];
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [%{public}@]", buf, 0x16u);
  }
  cloudLibraryStatusAccessQueue = self->_cloudLibraryStatusAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(cloudLibraryStatusAccessQueue, block);
}

void __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = -1;
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  id v4 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  char v5 = [*(id *)(a1 + 32) userIdentity];
  id v17 = 0;
  uint64_t v6 = [v4 getPropertiesForUserIdentity:v5 error:&v17];
  id v7 = v17;

  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = *(void **)(a1 + 32);
      id v10 = [v9 userIdentity];
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      unint64_t v23 = (unint64_t)v7;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "%{public}@ - Error retrieving user identity properties [Processing identity change] - identity=%@ - error=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    unint64_t v11 = [v6 isActiveLocker];
    *(void *)(*(void *)(a1 + 32) + 32) = v11;
    if (v3 != (void *)v11)
    {
      uint64_t v12 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v19 = v13;
        __int16 v20 = 2048;
        uint64_t v21 = v3;
        __int16 v22 = 2048;
        unint64_t v23 = v11;
        _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cloud library status changed [%ld -> %ld] - Posting MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification", buf, 0x20u);
      }

      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(NSObject **)(v14 + 16);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke_67;
      v16[3] = &unk_1E57F9EA8;
      v16[4] = v14;
      dispatch_async(v15, v16);
    }
  }
  [*(id *)(a1 + 32) _updateMatchStatus];
  [*(id *)(a1 + 32) _updateSubscriptionAvailability];
}

uint64_t __62__MPCloudServiceStatusController__userIdentityStoreDidChange___block_invoke_67(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (void)_cloudClientAuthenticationDidChange
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [ICCloudClientIsAuthenticatedDidChangeNotification]", buf, 0xCu);
  }

  self->_cloudLibraryStatus = -1;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MPCloudServiceStatusController__cloudClientAuthenticationDidChange__block_invoke;
  block[3] = &unk_1E57F9EA8;
  void block[4] = self;
  dispatch_async(calloutQueue, block);
}

uint64_t __69__MPCloudServiceStatusController__cloudClientAuthenticationDidChange__block_invoke(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (void)_allowsMusicSubscriptionDidChange:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 name];
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_1952E8000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Received notification [%{public}@]", (uint8_t *)&v7, 0x16u);
  }
  self->_hasLoadedSubscriptionAvailability = 0;
  [(MPCloudServiceStatusController *)self _updateSubscriptionAvailability];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  char v8 = 0;
  BOOL v4 = [(MPCloudServiceStatusController *)self _calculateShouldPlaybackRequireSubscriptionLeaseReturningLikelyToReachRemoteServer:&v8];
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke;
  v6[3] = &unk_1E57F9E08;
  v6[4] = self;
  BOOL v7 = v4;
  dispatch_async(accessQueue, v6);
}

void __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 90) != v2)
  {
    *(unsigned char *)(v1 + 90) = v2;
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(NSObject **)(v3 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke_2;
    block[3] = &unk_1E57F9EA8;
    void block[4] = v3;
    dispatch_async(v4, block);
  }
}

uint64_t __81__MPCloudServiceStatusController_environmentMonitorDidChangeNetworkReachability___block_invoke_2(uint64_t a1)
{
  return +[MPCloudServiceStatusController _postNotificationName:@"MPCloudServiceStatusControllerShouldPlaybackRequireSubscriptionLeaseDidChangeNotification" controller:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FB8578];
  char v5 = [MEMORY[0x1E4FB87C0] defaultIdentityStore];
  [v3 removeObserver:self name:v4 object:v5];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E4FB83F0], 0);
  [(ICMusicSubscriptionStatusMonitor *)self->_subscriptionStatusMonitor endObservingSubscriptionStatusWithToken:self->_subscriptionStatusObservationToken];
  BOOL v7 = +[MPRestrictionsMonitor sharedRestrictionsMonitor];
  [v3 removeObserver:self name:@"MPRestrictionsMonitorMusicSubscriptionDidChangeNotification" object:v7];

  v8.receiver = self;
  v8.super_class = (Class)MPCloudServiceStatusController;
  [(MPCloudServiceStatusController *)&v8 dealloc];
}

- (MPCloudServiceStatusController)init
{
  return (MPCloudServiceStatusController *)[(MPCloudServiceStatusController *)self _initWithUserIdentity:0];
}

void __76__MPCloudServiceStatusController__postNotificationName_controller_userInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = os_log_create("com.apple.amp.mediaplayer", "CloudController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1952E8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Related controller posting notification [%@]", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:*(void *)(a1 + 32) object:v3 userInfo:*(void *)(a1 + 40)];
}

@end