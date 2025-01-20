@interface EKConferenceUtils
+ (NSString)FacetimeAppBundleID;
+ (NSString)FacetimeConferenceExtensionBundleID;
+ (double)conferenceImageSize;
+ (id)_applicationRecordFromAppLink:(id)a3 appLinkError:(id)a4 orCustomScheme:(id)a5;
+ (id)_validURLForConferenceURL:(id)a3 previousURLs:(id)a4 completion:(id)a5;
+ (id)_workQueue;
+ (id)appRecordCache;
+ (id)applicationRecordForURL:(id)a3 incomplete:(BOOL *)a4;
+ (id)logHandle;
+ (id)parentAppBundleIdentifierForExtensionBundleIdentifier:(id)a3;
+ (id)synchronousAppTitleOnlyForURL:(id)a3 incomplete:(BOOL *)a4;
+ (id)validURLForConferenceURL:(id)a3 completion:(id)a4;
+ (void)_findExtensionIdentifierForURL:(id)a3 completionHandler:(id)a4;
+ (void)_findRoomTypeForURL:(id)a3 queue:(id)a4 completionHandler:(id)a5;
+ (void)applicationRecordForURL:(id)a3 completionHandler:(id)a4;
+ (void)clearAppRecordCache;
+ (void)fireAppRecordChangedNotification;
+ (void)invalidateConferenceURL:(id)a3;
+ (void)invalidateConferenceURLIfNeeded:(id)a3 inEventStore:(id)a4;
+ (void)renewConferenceURL:(id)a3 toDate:(id)a4;
+ (void)virtualConference:(id)a3 likelyCameFromRoomTypes:(id)a4 completionHandler:(id)a5;
@end

@implementation EKConferenceUtils

+ (NSString)FacetimeAppBundleID
{
  return (NSString *)@"com.apple.facetime";
}

+ (NSString)FacetimeConferenceExtensionBundleID
{
  return (NSString *)@"com.apple.mobilecal.FacetimeExtension";
}

+ (id)logHandle
{
  return (id)EKLogHandle;
}

+ (id)_workQueue
{
  if (_workQueue_onceToken != -1) {
    dispatch_once(&_workQueue_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)_workQueue_workQueue;

  return v2;
}

uint64_t __31__EKConferenceUtils__workQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("EKConferenceUtils.workQueue", 0);
  uint64_t v1 = _workQueue_workQueue;
  _workQueue_workQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (double)conferenceImageSize
{
  return 35.0;
}

+ (void)virtualConference:(id)a3 likelyCameFromRoomTypes:(id)a4 completionHandler:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v26 = a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
        uint64_t v15 = [v7 title];
        if (v15)
        {
          v16 = (void *)v15;
          v17 = [v7 title];
          v18 = [v14 title];
          int v19 = [v17 isEqualToString:v18];

          if (v19)
          {
            v23 = v26;
            (*((void (**)(id, void *))v26 + 2))(v26, v14);
            v24 = v9;
            goto LABEL_12;
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  v20 = [v7 joinMethods];
  v21 = [v20 firstObject];
  v22 = [v21 URL];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__EKConferenceUtils_virtualConference_likelyCameFromRoomTypes_completionHandler___block_invoke;
  v27[3] = &unk_1E5B9A500;
  id v28 = v9;
  v23 = v26;
  id v30 = a1;
  id v29 = v26;
  [a1 applicationRecordForURL:v22 completionHandler:v27];

  v24 = v28;
LABEL_12:
}

void __81__EKConferenceUtils_virtualConference_likelyCameFromRoomTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [a2 bundleIdentifier];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 48);
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "extensionBundleIdentifier", (void)v12);
        uint64_t v11 = [v9 parentAppBundleIdentifierForExtensionBundleIdentifier:v10];

        if ([v3 isEqual:v11])
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

          goto LABEL_11;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_11:
}

+ (id)synchronousAppTitleOnlyForURL:(id)a3 incomplete:(BOOL *)a4
{
  id v4 = [a1 applicationRecordForURL:a3 incomplete:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 bundleIdentifier];
    uint64_t v7 = [v5 localizedName];
    if ([v6 isEqualToString:@"com.microsoft.lync2013.iphone"])
    {
      uint64_t v8 = EKBundle();
      uint64_t v9 = [v8 localizedStringForKey:@"Skype" value:&stru_1EF932508 table:0];

      uint64_t v7 = (void *)v9;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (void)applicationRecordForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (objc_msgSend(v6, "cal_hasSchemeTel"))
  {
    v7[2](v7, 0);
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F22398];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke;
    v9[3] = &unk_1E5B9A550;
    id v12 = a1;
    id v10 = v6;
    uint64_t v11 = v7;
    [v8 getAppLinksWithURL:v10 completionHandler:v9];
  }
}

void __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[6] _workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E5B9A528;
  id v15 = a1[6];
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[4];
  id v14 = a1[5];
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __63__EKConferenceUtils_applicationRecordForURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "targetApplicationRecord", (void)v13);
        id v9 = [v8 bundleIdentifier];
        char v10 = [v9 containsString:@"com.apple.internal"];

        if ((v10 & 1) == 0)
        {
          id v11 = v7;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  id v12 = [*(id *)(a1 + 64) _applicationRecordFromAppLink:v11 appLinkError:*(void *)(a1 + 40) orCustomScheme:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)clearAppRecordCache
{
  id v2 = [a1 appRecordCache];
  [v2 removeAllObjects];
}

+ (id)appRecordCache
{
  if (appRecordCache_onceToken != -1) {
    dispatch_once(&appRecordCache_onceToken, &__block_literal_global_36_0);
  }
  id v2 = (void *)appRecordCache_cache;

  return v2;
}

uint64_t __35__EKConferenceUtils_appRecordCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = (void *)appRecordCache_cache;
  appRecordCache_cache = (uint64_t)v0;

  [(id)appRecordCache_cache setCountLimit:100];
  id v2 = (const char *)*MEMORY[0x1E4F4B7A8];

  return notify_register_check(v2, &apHiddenAppsNotifyToken);
}

+ (void)fireAppRecordChangedNotification
{
  if (fireAppRecordChangedNotification_postBlock) {
    dispatch_block_cancel((dispatch_block_t)fireAppRecordChangedNotification_postBlock);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__EKConferenceUtils_fireAppRecordChangedNotification__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
  uint64_t v4 = (void *)fireAppRecordChangedNotification_postBlock;
  fireAppRecordChangedNotification_postBlock = (uint64_t)v3;

  dispatch_time_t v5 = dispatch_time(0, 100000000);
  dispatch_after(v5, MEMORY[0x1E4F14428], (dispatch_block_t)fireAppRecordChangedNotification_postBlock);
}

void __53__EKConferenceUtils_fireAppRecordChangedNotification__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"EKConferenceUtilsAppRecordChangedNotification" object:*(void *)(a1 + 32)];

  dispatch_block_t v3 = (void *)fireAppRecordChangedNotification_postBlock;
  fireAppRecordChangedNotification_postBlock = 0;
}

+ (id)applicationRecordForURL:(id)a3 incomplete:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6 && (objc_msgSend(v6, "cal_hasSchemeTel") & 1) == 0)
  {
    int check = 0;
    notify_check(apHiddenAppsNotifyToken, &check);
    if (check) {
      [a1 clearAppRecordCache];
    }
    id v9 = [a1 appRecordCache];
    id v10 = [v9 objectForKey:v7];

    if (!v10)
    {
      id v11 = objc_opt_new();
      id v12 = [a1 appRecordCache];
      [v12 setObject:v11 forKey:v7];

      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __56__EKConferenceUtils_applicationRecordForURL_incomplete___block_invoke;
      v15[3] = &unk_1E5B9A578;
      id v10 = v11;
      id v16 = v10;
      id v17 = a1;
      [a1 applicationRecordForURL:v7 completionHandler:v15];
    }
    id v8 = [v10 record];
    BOOL v13 = v8 == 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      id v8 = 0;
    }
    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __56__EKConferenceUtils_applicationRecordForURL_incomplete___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setRecord:a2];
    dispatch_block_t v3 = *(void **)(a1 + 40);
    [v3 fireAppRecordChangedNotification];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    [*(id *)(a1 + 32) setRecord:v4];
  }
}

+ (id)_applicationRecordFromAppLink:(id)a3 appLinkError:(id)a4 orCustomScheme:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    uint64_t v18 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:]();
    }

    id v31 = 0;
    id v17 = [objc_alloc(MEMORY[0x1E4F22408]) initWithURL:v9 error:&v31];
    id v19 = v31;
    id v16 = v19;
    if (v17)
    {
      v20 = [v17 bundleRecord];
      if (v20)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v20 isWebBrowser] & 1) == 0)
        {
          v20 = v20;
          v21 = [v20 bundleIdentifier];
          int v22 = [v21 isEqualToString:@"com.apple.FaceTimeLinkTrampoline"];

          if (v22)
          {
            id v23 = objc_alloc(MEMORY[0x1E4F223C8]);
            v24 = +[EKConferenceUtils FacetimeAppBundleID];
            id v30 = 0;
            uint64_t v15 = [v23 initWithBundleIdentifier:v24 allowPlaceholder:0 error:&v30];
            id v25 = v30;

            if (!v15)
            {
              id v26 = [(id)objc_opt_class() logHandle];
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:]();
              }
            }
            goto LABEL_22;
          }
          id v28 = [v20 bundleIdentifier];
          int v29 = [v28 containsString:@"com.apple.internal"];

          if (!v29)
          {
            uint64_t v15 = (uint64_t)v20;
            goto LABEL_22;
          }
        }
      }
    }
    else
    {
      if (!v19)
      {
        uint64_t v15 = 0;
        goto LABEL_23;
      }
      v20 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:]();
      }
    }
    uint64_t v15 = 0;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  id v10 = [v7 targetApplicationRecord];
  id v11 = [v10 bundleIdentifier];
  int v12 = [v11 isEqualToString:@"com.apple.FaceTimeLinkTrampoline"];

  if (!v12) {
    goto LABEL_25;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F223C8]);
  long long v14 = +[EKConferenceUtils FacetimeAppBundleID];
  id v32 = 0;
  uint64_t v15 = [v13 initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v32];
  id v16 = v32;

  if (!v15)
  {
    id v17 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[EKConferenceUtils _applicationRecordFromAppLink:appLinkError:orCustomScheme:]();
    }
    goto LABEL_23;
  }
LABEL_24:

  id v10 = (void *)v15;
LABEL_25:

  return v10;
}

+ (id)parentAppBundleIdentifierForExtensionBundleIdentifier:(id)a3
{
  dispatch_block_t v3 = (objc_class *)MEMORY[0x1E4F223A0];
  id v4 = a3;
  id v14 = 0;
  dispatch_time_t v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 error:&v14];

  id v6 = v14;
  if (v5)
  {
    id v7 = [v5 containingBundleRecord];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v8 = [v7 bundleIdentifier];
      id v9 = [v7 bundleIdentifier];
      if ([v9 isEqualToString:@"com.apple.mobilecal"])
      {
      }
      else
      {
        id v11 = [v7 bundleIdentifier];
        int v12 = [v11 isEqualToString:@"com.apple.iCal"];

        if (!v12) {
          goto LABEL_15;
        }
      }
      uint64_t v10 = +[EKConferenceUtils FacetimeAppBundleID];
    }
    else
    {
      id v8 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        +[EKConferenceUtils parentAppBundleIdentifierForExtensionBundleIdentifier:](v8);
      }
      uint64_t v10 = 0;
    }

    id v8 = v10;
  }
  else
  {
    id v7 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[EKConferenceUtils parentAppBundleIdentifierForExtensionBundleIdentifier:]();
    }
    id v8 = 0;
  }
LABEL_15:

  return v8;
}

+ (void)invalidateConferenceURLIfNeeded:(id)a3 inEventStore:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7 && [MEMORY[0x1E4F576A0] isTUConversationLink:v7])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_invalidationLock);
    if (!_urlsAwaitingInvalidation)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v10 = (void *)_urlsAwaitingInvalidation;
      _urlsAwaitingInvalidation = (uint64_t)v9;

      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v12 = (void *)_invalidatedURLs;
      _invalidatedURLs = (uint64_t)v11;

      id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v14 = dispatch_queue_create("com.apple.eventkit.ConferenceInvalidationQueue", v13);
      uint64_t v15 = (void *)_invalidationQueue;
      _invalidationQueue = (uint64_t)v14;
    }
    id v16 = [(id)_invalidatedURLs objectForKeyedSubscript:v7];
    id v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 validURL];
      BOOL v19 = 0;
    }
    else
    {
      v20 = [(id)_urlsAwaitingInvalidation objectForKeyedSubscript:v7];
      uint64_t v21 = [v20 integerValue];
      BOOL v19 = v21 != 1;
      if (v21 != 1) {
        [(id)_urlsAwaitingInvalidation setObject:&unk_1EF952F70 forKeyedSubscript:v7];
      }

      uint64_t v18 = 0;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
    if (v18)
    {
      [a1 invalidateConferenceURLIfNeeded:v18 inEventStore:v8];
    }
    else if (v19)
    {
      int v22 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v7;
        _os_log_impl(&dword_1A4E47000, v22, OS_LOG_TYPE_INFO, "Checking if we need to invalidate URL %@", buf, 0xCu);
      }

      dispatch_time_t v23 = dispatch_time(0, 500000000);
      v24 = _invalidationQueue;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __66__EKConferenceUtils_invalidateConferenceURLIfNeeded_inEventStore___block_invoke;
      v25[3] = &unk_1E5B9A5A0;
      id v26 = v7;
      SEL v28 = a2;
      id v29 = a1;
      id v27 = v8;
      dispatch_after(v23, v24, v25);
    }
  }
}

void __66__EKConferenceUtils_invalidateConferenceURLIfNeeded_inEventStore___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_invalidationLock);
  id v2 = [(id)_urlsAwaitingInvalidation objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 integerValue];
  switch(v3)
  {
    case 3:
      [(id)_urlsAwaitingInvalidation removeObjectForKey:*(void *)(a1 + 32)];
      break;
    case 2:
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 56) file:@"EKConferenceUtils.m" lineNumber:410 description:@"invalidation state before search already set to checking"];

      break;
    case 1:
      [(id)_urlsAwaitingInvalidation setObject:&unk_1EF952F88 forKeyedSubscript:*(void *)(a1 + 32)];
      os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
      id v4 = [*(id *)(a1 + 40) predicateForEventsWithConferenceURL:*(void *)(a1 + 32) limit:1];
      dispatch_time_t v5 = [*(id *)(a1 + 40) eventsMatchingPredicate:v4];
      uint64_t v6 = [v5 count];
      os_unfair_lock_lock((os_unfair_lock_t)&_invalidationLock);
      id v7 = [(id)_urlsAwaitingInvalidation objectForKeyedSubscript:*(void *)(a1 + 32)];
      uint64_t v8 = [v7 integerValue];
      uint64_t v9 = v8;
      if (v6 || (unint64_t)(v8 - 1) >= 2)
      {
        uint64_t v15 = [(id)objc_opt_class() logHandle];
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
        if (v9 == 2)
        {
          if (v16)
          {
            uint64_t v17 = *(void *)(a1 + 32);
            int v18 = 138412290;
            uint64_t v19 = v17;
            _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_INFO, "Found uses of %@", (uint8_t *)&v18, 0xCu);
          }

          [(id)_urlsAwaitingInvalidation removeObjectForKey:*(void *)(a1 + 32)];
        }
        else
        {
          if (v16)
          {
            int v18 = 134217984;
            uint64_t v19 = v9;
            _os_log_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_INFO, "Not invalidating because state changed to %li while checking", (uint8_t *)&v18, 0xCu);
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
      }
      else
      {
        uint64_t v10 = [(id)objc_opt_class() logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v18 = 138412290;
          uint64_t v19 = v11;
          _os_log_impl(&dword_1A4E47000, v10, OS_LOG_TYPE_INFO, "No uses found of %@", (uint8_t *)&v18, 0xCu);
        }

        [(id)_urlsAwaitingInvalidation removeObjectForKey:*(void *)(a1 + 32)];
        int v12 = objc_alloc_init(EKConferenceInvalidationRecord);
        [(id)_invalidatedURLs setObject:v12 forKeyedSubscript:*(void *)(a1 + 32)];

        os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
        +[EKConferenceUtils invalidateConferenceURL:*(void *)(a1 + 32)];
      }

      goto LABEL_22;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
  id v4 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v18 = 138412290;
    uint64_t v19 = v14;
    _os_log_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_INFO, "No need to check URL %@", (uint8_t *)&v18, 0xCu);
  }
LABEL_22:
}

+ (void)invalidateConferenceURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [MEMORY[0x1E4F576A0] isTUConversationLink:v4])
  {
    dispatch_time_t v5 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_DEFAULT, "Going to invalidate the URL %@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__EKConferenceUtils_invalidateConferenceURL___block_invoke;
    v6[3] = &unk_1E5B9A5F0;
    id v8 = a1;
    id v7 = v4;
    [a1 _findExtensionIdentifierForURL:v7 completionHandler:v6];
  }
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke(uint64_t a1, void *a2)
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v20 = 0;
    id v4 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v3 error:&v20];
    dispatch_time_t v5 = v20;
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      uint64_t v14 = v5;
      id v7 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_2();
      }
    }
    else
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_69;
      v18[3] = &unk_1E5B9A5C8;
      long long v16 = *(_OWORD *)(a1 + 32);
      id v8 = (id)v16;
      long long v19 = v16;
      [v4 setRequestCompletionBlock:v18];
      id v9 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      v28[0] = @"_EKVirtualConferenceRequestTypeKey";
      v28[1] = @"_EKVirtualConferenceRequestURLParameterForInvalidation";
      uint64_t v10 = *(void *)(a1 + 32);
      v29[0] = @"_EKVirtualConferenceRequestTypeURLInvalidate";
      v29[1] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      [v9 setUserInfo:v11];

      id v27 = v9;
      int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      id v17 = 0;
      id v13 = [v4 beginExtensionRequestWithOptions:1 inputItems:v12 error:&v17];
      uint64_t v14 = v17;

      if (v14)
      {
        uint64_t v15 = [(id)objc_opt_class() logHandle];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          int v22 = v4;
          __int16 v23 = 2112;
          v24 = v13;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_error_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_ERROR, "Failed to invalidate virtual conference URL, extension = %@ request = %@ error = %@", buf, 0x20u);
        }
      }
      id v7 = v19;
    }
  }
  else
  {
    uint64_t v14 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_1();
    }
  }
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 firstObject];
  dispatch_time_t v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKey:@"_EKVirtualConferenceInvalidationResultKey"];

  if (v6
    && [v6 isEqualToString:@"_EKVirtualConferenceInvalidationResultSucceeded"])
  {
    id v7 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_INFO, "URL invalidated successfully: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_69_cold_1();
    }
  }
}

+ (id)validURLForConferenceURL:(id)a3 completion:(id)a4
{
  return (id)[a1 _validURLForConferenceURL:a3 previousURLs:0 completion:a4];
}

+ (id)_validURLForConferenceURL:(id)a3 previousURLs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  os_unfair_lock_lock((os_unfair_lock_t)&_invalidationLock);
  int v12 = [(id)_urlsAwaitingInvalidation objectForKeyedSubscript:v11];
  if (!v12)
  {
    int v18 = [(id)_invalidatedURLs objectForKeyedSubscript:v11];
    id v13 = v18;
    if (!v18) {
      goto LABEL_3;
    }
    uint64_t v14 = [v18 validURL];

    if (v14) {
      goto LABEL_4;
    }
    long long v19 = [v13 waitingCompletionHandlers];

    if (v19)
    {
      id v20 = [v13 waitingCompletionHandlers];
      uint64_t v21 = (void *)MEMORY[0x1A6266730](v10);
      [v20 addObject:v21];

      if (!v9)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
LABEL_24:
        long long v16 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v13 setWaitingCompletionHandlers:v22];

      __int16 v23 = [v13 waitingCompletionHandlers];
      v24 = (void *)MEMORY[0x1A6266730](v10);
      [v23 addObject:v24];

      __int16 v25 = objc_opt_new();
      [v13 setReplacementForURLs:v25];

      id v26 = [v13 replacementForURLs];
      [v26 addObject:v11];

      if (!v9)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
        goto LABEL_23;
      }
    }
    id v27 = [v13 replacementForURLs];
    [v27 unionSet:v9];

    os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
    if (v19) {
      goto LABEL_24;
    }
LABEL_23:
    [v13 generateNewValidURLForOriginalURL:v11];
    goto LABEL_24;
  }
  [(id)_urlsAwaitingInvalidation setObject:&unk_1EF952FA0 forKeyedSubscript:v11];
  id v13 = 0;
LABEL_3:
  uint64_t v14 = v11;
LABEL_4:
  os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
  if (v14 && v13)
  {
    uint64_t v15 = [v13 replacementForURLs];
    long long v16 = [a1 _validURLForConferenceURL:v14 previousURLs:v15 completion:v10];

    if (v16 && ([v16 isEqual:v14] & 1) == 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_invalidationLock);
      [v13 setValidURL:v16];
      os_unfair_lock_unlock((os_unfair_lock_t)&_invalidationLock);
    }
  }
  else
  {
    long long v16 = v14;
  }
LABEL_11:

  return v16;
}

+ (void)renewConferenceURL:(id)a3 toDate:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1A4E47000, v8, OS_LOG_TYPE_INFO, "ConferenceRenewal: Attempting to extend expiration of URL: %@ to date: %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    if ([MEMORY[0x1E4F576A0] isTUConversationLink:v6])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke;
      v10[3] = &unk_1E5B9A618;
      id v13 = a1;
      id v11 = v6;
      id v12 = v7;
      [a1 _findExtensionIdentifierForURL:v11 completionHandler:v10];

      id v9 = v11;
    }
    else
    {
      id v9 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[EKConferenceUtils renewConferenceURL:toDate:](v9);
      }
    }
  }
  else
  {
    id v9 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[EKConferenceUtils renewConferenceURL:toDate:]();
    }
  }
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke(uint64_t a1, void *a2)
{
  void v29[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v20 = 0;
    id v4 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v3 error:&v20];
    dispatch_time_t v5 = v20;
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      uint64_t v14 = v5;
      id v7 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_2();
      }
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_79;
      v17[3] = &unk_1E5B9A5C8;
      uint64_t v19 = *(void *)(a1 + 48);
      uint64_t v18 = *(id *)(a1 + 32);
      [v4 setRequestCompletionBlock:v17];
      id v8 = objc_alloc_init(MEMORY[0x1E4F28C80]);
      v28[0] = @"_EKVirtualConferenceRequestTypeKey";
      v28[1] = @"_EKVirtualConferenceRequestURLParameterForRenewal";
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      v29[0] = @"_EKVirtualConferenceRequestTypeURLRenew";
      v29[1] = v9;
      void v28[2] = @"_EKVirtualConferenceRequestDateParameterForRenewal";
      v29[2] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
      [v8 setUserInfo:v11];
      id v27 = v8;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      id v16 = 0;
      id v13 = [v4 beginExtensionRequestWithOptions:1 inputItems:v12 error:&v16];
      uint64_t v14 = v16;

      if (v14)
      {
        id v15 = [(id)objc_opt_class() logHandle];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v22 = v4;
          __int16 v23 = 2112;
          v24 = v13;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_error_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Request to renew conference URL failed, extension = %@ request = %@ error = %@", buf, 0x20u);
        }
      }
      id v7 = v18;
    }
  }
  else
  {
    uint64_t v14 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_1();
    }
  }
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_79(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 firstObject];
  dispatch_time_t v5 = [v4 userInfo];
  BOOL v6 = [v5 objectForKey:@"_EKVirtualConferenceRenewalResultKey"];

  if (v6 && [v6 isEqualToString:@"_EKVirtualConferenceRenewalResultSucceeded"])
  {
    id v7 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A4E47000, v7, OS_LOG_TYPE_INFO, "ConferenceRenewal: URL renewed successfully: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = [v4 userInfo];
    id v7 = [v9 objectForKey:@"_EKVirtualConferenceErrorResultKey"];

    uint64_t v10 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_79_cold_1();
    }
  }
}

+ (void)_findExtensionIdentifierForURL:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  BOOL v6 = (void (**)(void, void))v5;
  if (v8)
  {
    if (objc_msgSend(MEMORY[0x1E4F576A0], "isTUConversationLink:"))
    {
      id v7 = +[EKConferenceUtils FacetimeConferenceExtensionBundleID];
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
    else
    {
      v6[2](v6, 0);
    }
  }
  else
  {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
}

+ (void)_findRoomTypeForURL:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke;
  v14[3] = &unk_1E5B9A668;
  id v17 = v10;
  id v18 = a1;
  id v15 = v8;
  id v16 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  +[EKConferenceUtils _findExtensionIdentifierForURL:v13 completionHandler:v14];
}

void __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v14 = 0;
    id v4 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v3 error:&v14];
    id v5 = v14;
    if (v5) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v4 == 0;
    }
    if (v6)
    {
      id v7 = [(id)objc_opt_class() logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_2();
      }

      uint64_t v8 = *(void *)(a1 + 48);
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:EKConferenceValidationErrorDomain code:1 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v11);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_82;
      v12[3] = &unk_1E5B9A640;
      id v13 = *(id *)(a1 + 48);
      +[EKVirtualConferenceRoomType virtualConferenceRoomTypesWithCompletion:v12 queue:*(void *)(a1 + 40)];
      id v11 = v13;
    }
  }
  else
  {
    id v9 = [(id)objc_opt_class() logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:EKConferenceValidationErrorDomain code:1 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v5);
  }
}

void __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = (id)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v3, 0);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:EKConferenceValidationErrorDomain code:4 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
  }
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Error getting claim binding for URL, error: %@", v2, v3, v4, v5, v6);
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "URL should be opened with the FaceTime app, but there was an error fetching FaceTime's application record: %@", v2, v3, v4, v5, v6);
}

+ (void)_applicationRecordFromAppLink:appLinkError:orCustomScheme:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "Couldn't find out what app opens URL as a universal link, trying to see what opens it as a custom URL scheme: %@", v1, 0xCu);
}

+ (void)parentAppBundleIdentifierForExtensionBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Failed to find app extension record for extension bundle identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)parentAppBundleIdentifierForExtensionBundleIdentifier:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Containing record for app extension record could not be found or was the wrong type", v1, 2u);
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Unable to find application record for URL %@, not invalidating.", v2, v3, v4, v5, v6);
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "Could not load extension for extensionIdentifier: %@, error = %@");
}

void __45__EKConferenceUtils_invalidateConferenceURL___block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Unable to invalidate URL: %@", v2, v3, v4, v5, v6);
}

+ (void)renewConferenceURL:toDate:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "ConferenceRenewal: Didn't receive required arguments. URL = %@, expirationDate = %@. Stopping.");
}

+ (void)renewConferenceURL:(os_log_t)log toDate:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Unrecognized URL type. Stopping.", v1, 2u);
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "ConferenceRenewal: Unable to find application record for URL %@, not invalidating.", v2, v3, v4, v5, v6);
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "ConferenceRenewal: Could not load extension for extensionIdentifier: %@, error = %@");
}

void __47__EKConferenceUtils_renewConferenceURL_toDate___block_invoke_79_cold_1()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v0, v1, "ConferenceRenewal: Unable to renew URL: %@, error = %@");
}

void __65__EKConferenceUtils__findRoomTypeForURL_queue_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Unable to find application record for URL %@, not generating a new URL.", v2, v3, v4, v5, v6);
}

@end