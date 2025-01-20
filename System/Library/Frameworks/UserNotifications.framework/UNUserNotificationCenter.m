@interface UNUserNotificationCenter
+ (BOOL)supportsContentExtensions;
+ (UNUserNotificationCenter)currentNotificationCenter;
- (BOOL)supportsContentExtensions;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)queue;
- (UNUserNotificationCenter)init;
- (UNUserNotificationCenter)initWithBundleIdentifier:(id)a3;
- (UNUserNotificationCenter)initWithBundleIdentifier:(id)a3 queue:(id)a4;
- (UNUserNotificationCenterDelegatePrivate)privateDelegate;
- (id)badgeNumber;
- (id)clearedInfoForDataProviderMigration;
- (id)delegate;
- (id)deliveredNotifications;
- (id)notificationCategories;
- (id)notificationSettings;
- (id)notificationSettingsForTopics;
- (id)notificationTopics;
- (id)pendingNotificationRequests;
- (void)addNotificationRequest:(UNNotificationRequest *)request withCompletionHandler:(void *)completionHandler;
- (void)addNotificationRequest:(id)a3;
- (void)didChangeSettings:(id)a3;
- (void)didOpenApplicationForResponse:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 withCompletionHandler:(id)a4;
- (void)getBadgeNumberWithCompletionHandler:(id)a3;
- (void)getDeliveredNotificationsWithCompletionHandler:(void *)completionHandler;
- (void)getNotificationCategoriesWithCompletionHandler:(void *)completionHandler;
- (void)getNotificationSettingsForTopicsWithCompletionHandler:(id)a3;
- (void)getNotificationSettingsWithCompletionHandler:(void *)completionHandler;
- (void)getNotificationTopicsWithCompletionHandler:(id)a3;
- (void)getPendingNotificationRequestsWithCompletionHandler:(void *)completionHandler;
- (void)removeAllDeliveredNotifications;
- (void)removeAllPendingNotificationRequests;
- (void)removeDeliveredNotificationsWithIdentifiers:(NSArray *)identifiers;
- (void)removePendingNotificationRequestsWithIdentifiers:(NSArray *)identifiers;
- (void)removeSimilarNotificationRequests:(id)a3;
- (void)replaceContentForRequestWithIdentifier:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5;
- (void)requestAuthorizationWithOptions:(UNAuthorizationOptions)options completionHandler:(void *)completionHandler;
- (void)requestRemoveAuthorizationWithCompletionHandler:(id)a3;
- (void)setBadgeCount:(NSInteger)newBadgeCount withCompletionHandler:(void *)completionHandler;
- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4;
- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4;
- (void)setBundleIdentifier:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setNotificationCategories:(NSSet *)categories;
- (void)setNotificationRequests:(id)a3;
- (void)setNotificationRequests:(id)a3 completionHandler:(id)a4;
- (void)setNotificationTopics:(id)a3 withCompletionHandler:(id)a4;
- (void)setPrivateDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWantsNotificationResponsesDelivered;
@end

@implementation UNUserNotificationCenter

void __53__UNUserNotificationCenter_currentNotificationCenter__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  if (!v2)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"UNUserNotificationCenter.m" lineNumber:41 description:@"mainBundle is nil"];
  }
  v3 = [v2 objectForInfoDictionaryKey:@"CFBundlePackageType"];
  if (![v3 isEqualToString:@"APPL"])
  {
    v9 = [v2 bundleURL];
    id v27 = 0;
    int v10 = [v9 getResourceValue:&v27 forKey:*MEMORY[0x1E4F1C618] error:0];
    id v11 = v27;
    v12 = v11;
    if (!v10)
    {
LABEL_18:

      goto LABEL_19;
    }
    if ([v11 BOOLValue])
    {
      v4 = [v2 bundleIdentifier];
      if (!v4)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:*(void *)(a1 + 32), *(void *)(a1 + 40), @"UNUserNotificationCenter.m", 56, @"UNUserNotificationCenter could not determine bundleIdentifier of the application: bundleURL=%@", v9 object file lineNumber description];
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F223F0] bundleProxyForCurrentProcess];
      if (!v13)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v19 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 40);
        v21 = [v2 bundleURL];
        [v18 handleFailureInMethod:v19, v20, @"UNUserNotificationCenter.m", 63, @"bundleProxyForCurrentProcess is nil: mainBundle.bundleURL %@", v21 object file lineNumber description];
      }
      uint64_t v14 = objc_msgSend(v13, "un_applicationBundleIdentifier");
      if (!v14)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v24 = *(void *)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v25 = objc_opt_class();
        v26 = [v13 bundleIdentifier];
        [v22 handleFailureInMethod:v24, v23, @"UNUserNotificationCenter.m", 66, @"application bundle identifier for %@ with bundle identifier %@", v25, v26 object file lineNumber description];

        goto LABEL_17;
      }
      v4 = (void *)v14;
    }
    goto LABEL_15;
  }
  v4 = [v2 bundleIdentifier];
  if (v4)
  {
LABEL_15:
    v15 = [[UNUserNotificationCenter alloc] initWithBundleIdentifier:v4];
    v16 = (void *)currentNotificationCenter___sharedInstance;
    currentNotificationCenter___sharedInstance = (uint64_t)v15;

    goto LABEL_19;
  }
  v5 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v8 = [v2 bundleURL];
  [v5 handleFailureInMethod:v7, v6, @"UNUserNotificationCenter.m", 47, @"mainBundle.bundleIdentifier is nil: mainBundle.bundleURL %@", v8 object file lineNumber description];

LABEL_19:
}

- (UNUserNotificationCenter)initWithBundleIdentifier:(id)a3 queue:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UNUserNotificationCenter.m", 101, @"Invalid parameter not satisfying: %@", @"bundleIdentifier != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)UNUserNotificationCenter;
  v9 = [(UNUserNotificationCenter *)&v15 init];
  if (v9)
  {
    UNRegisterUserNotificationsLogging();
    int v10 = UNLogConnections;
    if (os_log_type_enabled((os_log_t)UNLogConnections, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_1AE729000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating a user notification center", buf, 0xCu);
    }
    uint64_t v11 = [v7 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v11;

    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (UNUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  return [(UNUserNotificationCenter *)self initWithBundleIdentifier:a3 queue:MEMORY[0x1E4F14428]];
}

- (void)setDelegate:(id)delegate
{
}

+ (UNUserNotificationCenter)currentNotificationCenter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__UNUserNotificationCenter_currentNotificationCenter__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (currentNotificationCenter_onceToken != -1) {
    dispatch_once(&currentNotificationCenter_onceToken, v4);
  }
  v2 = (void *)currentNotificationCenter___sharedInstance;

  return (UNUserNotificationCenter *)v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privateDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)getNotificationCategoriesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getNotificationCategoriesForBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

- (void)getBadgeNumberWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getBadgeNumberForBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

- (void)setNotificationCategories:(NSSet *)categories
{
  id v4 = categories;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 setNotificationCategories:v4 forBundleIdentifier:self->_bundleIdentifier];
}

- (void)requestAuthorizationWithOptions:(UNAuthorizationOptions)options completionHandler:(void *)completionHandler
{
  uint64_t v6 = completionHandler;
  id v7 = +[UNUserNotificationServiceConnection sharedInstance];
  [v7 requestAuthorizationWithOptions:options forBundleIdentifier:self->_bundleIdentifier completionHandler:v6];
}

- (void)setNotificationTopics:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UNUserNotificationServiceConnection sharedInstance];
  [v8 setNotificationTopics:v7 forBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v6];
}

- (void)setBadgeCount:(NSInteger)newBadgeCount withCompletionHandler:(void *)completionHandler
{
  v9 = completionHandler;
  id v6 = +[UNUserNotificationServiceConnection sharedInstance];
  if (newBadgeCount < 0)
  {
    bundleIdentifier = self->_bundleIdentifier;
    UNLogToDeveloper(@"-[UNUserNotificationCenter setBadgeCount:(NSInteger) error:(NSError *)]", @"[%{public}@] Error received an invalid badge count. %{public}lu");
    if (!v9) {
      goto LABEL_6;
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "un_errorWithUNErrorCode:userInfo:", 1600, 0, bundleIdentifier, newBadgeCount);
    v9[2](v9, v7);
  }
  else
  {
    id v7 = [NSNumber numberWithInteger:newBadgeCount];
    [v6 setBadgeCount:v7 forBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v9];
  }

LABEL_6:
}

- (void)setBadgeNumber:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UNUserNotificationServiceConnection sharedInstance];
  [v8 setBadgeNumber:v7 forBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v6];
}

- (void)getNotificationSettingsForTopicsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getNotificationSettingsForTopicsWithBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

- (id)notificationSettings
{
  v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 notificationSettingsForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (void)getNotificationSettingsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getNotificationSettingsForBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

+ (BOOL)supportsContentExtensions
{
  return 1;
}

- (void)setPrivateDelegate:(id)a3
{
}

- (BOOL)supportsContentExtensions
{
  v2 = objc_opt_class();

  return [v2 supportsContentExtensions];
}

- (UNUserNotificationCenter)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UNUserNotificationCenter.m" lineNumber:92 description:@"use +currentNotificationCenter"];

  return 0;
}

- (void)setWantsNotificationResponsesDelivered
{
  id v3 = +[UNUserNotificationCenterDelegateConnectionListener sharedInstance];
  [v3 setDelegate:self forBundleIdentifier:self->_bundleIdentifier];
}

- (void)requestRemoveAuthorizationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 requestRemoveAuthorizationForBundleIdentifier:self->_bundleIdentifier completionHandler:v4];
}

- (id)notificationCategories
{
  id v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 notificationCategoriesForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (id)pendingNotificationRequests
{
  id v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 pendingNotificationRequestsForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (void)getPendingNotificationRequestsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getPendingNotificationRequestsForBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

- (void)addNotificationRequest:(id)a3
{
}

- (void)addNotificationRequest:(UNNotificationRequest *)request withCompletionHandler:(void *)completionHandler
{
  id v6 = request;
  id v7 = completionHandler;
  id v8 = +[UNUserNotificationServiceConnection sharedInstance];
  [(UNNotificationRequest *)v6 addSecurityScope:@"com.apple.app-sandbox.read-write"];
  bundleIdentifier = self->_bundleIdentifier;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __73__UNUserNotificationCenter_addNotificationRequest_withCompletionHandler___block_invoke;
  objc_super v15 = &unk_1E5F06498;
  v16 = v6;
  id v17 = v7;
  id v10 = v7;
  uint64_t v11 = v6;
  [v8 addNotificationRequest:v11 forBundleIdentifier:bundleIdentifier withCompletionHandler:&v12];
  [(UNNotificationRequest *)v11 removeSecurityScope];
}

void __73__UNUserNotificationCenter_addNotificationRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v6[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    +[UNAttachmentUtilities deleteAttachmentFilesInRequestsIfNecessary:v4];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)replaceContentForRequestWithIdentifier:(id)a3 replacementContent:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = +[UNUserNotificationServiceConnection sharedInstance];
  [v8 addSecurityScope:@"com.apple.app-sandbox.read-write"];
  bundleIdentifier = self->_bundleIdentifier;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __104__UNUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_completionHandler___block_invoke;
  uint64_t v18 = &unk_1E5F06498;
  id v19 = v8;
  id v20 = v9;
  id v13 = v9;
  id v14 = v8;
  [v11 replaceContentForRequestWithIdentifier:v10 bundleIdentifier:bundleIdentifier replacementContent:v14 completionHandler:&v15];

  objc_msgSend(v14, "removeSecurityScope", v15, v16, v17, v18);
}

void __104__UNUserNotificationCenter_replaceContentForRequestWithIdentifier_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    v6[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    +[UNAttachmentUtilities deleteAttachmentFilesInContentsIfNecessary:v4];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)setNotificationRequests:(id)a3
{
}

- (void)setNotificationRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UNUserNotificationServiceConnection sharedInstance];
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_8];
  bundleIdentifier = self->_bundleIdentifier;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke_2;
  uint64_t v15 = &unk_1E5F06498;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 setNotificationRequests:v11 forBundleIdentifier:bundleIdentifier completionHandler:&v12];
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_42, v12, v13, v14, v15);
}

uint64_t __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addSecurityScope:@"com.apple.app-sandbox.read-write"];
}

uint64_t __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    +[UNAttachmentUtilities deleteAttachmentFilesInRequestsIfNecessary:](UNAttachmentUtilities, "deleteAttachmentFilesInRequestsIfNecessary:");
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __70__UNUserNotificationCenter_setNotificationRequests_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeSecurityScope];
}

- (void)removePendingNotificationRequestsWithIdentifiers:(NSArray *)identifiers
{
  id v4 = identifiers;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 removePendingNotificationRequestsWithIdentifiers:v4 forBundleIdentifier:self->_bundleIdentifier completionHandler:0];
}

- (void)removeSimilarNotificationRequests:(id)a3
{
  id v4 = a3;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 removeSimilarNotificationRequests:v4 forBundleIdentifier:self->_bundleIdentifier completionHandler:0];
}

- (void)removeAllPendingNotificationRequests
{
  id v3 = +[UNUserNotificationServiceConnection sharedInstance];
  [v3 removeAllPendingNotificationRequestsForBundleIdentifier:self->_bundleIdentifier completionHandler:0];
}

- (id)deliveredNotifications
{
  id v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 deliveredNotificationsForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (void)getDeliveredNotificationsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getDeliveredNotificationsForBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

- (void)removeDeliveredNotificationsWithIdentifiers:(NSArray *)identifiers
{
  id v4 = identifiers;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 removeDeliveredNotificationsWithIdentifiers:v4 forBundleIdentifier:self->_bundleIdentifier completionHandler:0];
}

- (void)removeAllDeliveredNotifications
{
  id v3 = +[UNUserNotificationServiceConnection sharedInstance];
  [v3 removeAllDeliveredNotificationsForBundleIdentifier:self->_bundleIdentifier completionHandler:0];
}

- (id)badgeNumber
{
  id v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 badgeNumberForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (void)setBadgeString:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[UNUserNotificationServiceConnection sharedInstance];
  [v8 setBadgeString:v7 forBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v6];
}

- (void)didReceiveNotificationResponse:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__UNUserNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5F06100;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __81__UNUserNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = objc_loadWeakRetained((id *)(a1[4] + 8));
    [v5 userNotificationCenter:a1[4] didReceiveNotificationResponse:a1[5] withCompletionHandler:a1[6]];
  }
  else
  {
    id v4 = *(void (**)(void))(a1[6] + 16);
    v4();
  }
}

- (void)didChangeSettings:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__UNUserNotificationCenter_didChangeSettings___block_invoke;
  v7[3] = &unk_1E5F06128;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__UNUserNotificationCenter_didChangeSettings___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 userNotificationCenter:*(void *)(a1 + 32) didChangeSettings:*(void *)(a1 + 40)];
  }
}

- (void)didOpenApplicationForResponse:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UNUserNotificationCenter_didOpenApplicationForResponse___block_invoke;
  v7[3] = &unk_1E5F06128;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __58__UNUserNotificationCenter_didOpenApplicationForResponse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v4 userNotificationCenter:*(void *)(a1 + 32) didOpenApplicationForResponse:*(void *)(a1 + 40)];
  }
}

- (void)getNotificationTopicsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[UNUserNotificationServiceConnection sharedInstance];
  [v5 getNotificationTopicsForBundleIdentifier:self->_bundleIdentifier withCompletionHandler:v4];
}

- (id)notificationTopics
{
  char v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 notificationTopicsForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (id)notificationSettingsForTopics
{
  char v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 notificationSettingsForTopicsWithBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (id)clearedInfoForDataProviderMigration
{
  char v3 = +[UNUserNotificationServiceConnection sharedInstance];
  id v4 = [v3 clearedInfoForBundleIdentifier:self->_bundleIdentifier];

  return v4;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (UNUserNotificationCenterDelegatePrivate)privateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privateDelegate);

  return (UNUserNotificationCenterDelegatePrivate *)WeakRetained;
}

@end