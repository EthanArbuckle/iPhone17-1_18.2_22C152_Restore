@interface AFSiriAnnouncementRequestCapabilityManager
+ (BOOL)_supportsAnnouncementType:(int64_t)a3 forSupportedIntents:(id)a4 forBundleId:(id)a5 onPlatform:(int64_t)a6;
+ (Class)_classForPlatform:(int64_t)a3;
+ (id)_candidateAnnounceNotificationTypesFromApp:(id)a3 withIntentIDs:(id)a4 notificationContentType:(id)a5 onPlatform:(int64_t)a6;
+ (id)_requiredBundleIDsForNotificationAnnouncementType:(int64_t)a3;
+ (id)_requiredPlatformsForNotificationAnnouncementType:(int64_t)a3;
+ (id)supportedAnnouncementTypesForBundleId:(id)a3 onPlatform:(int64_t)a4;
+ (int64_t)notificationAnnouncementTypeForNotificationFromApp:(id)a3 withIntentIDs:(id)a4 notificationContent:(id)a5 onPlatform:(int64_t)a6;
- (AFSiriAnnouncementRequestCapabilityManager)initWithPlatform:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3;
- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation AFSiriAnnouncementRequestCapabilityManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)provider:(id)a3 availableAnnouncementRequestTypesChanged:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[AFSiriAnnouncementRequestCapabilityManager provider:availableAnnouncementRequestTypesChanged:]";
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s Notifying observers available announcement request types changed: %lu", location, 0x16u);
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__AFSiriAnnouncementRequestCapabilityManager_provider_availableAnnouncementRequestTypesChanged___block_invoke;
  block[3] = &unk_1E59296A8;
  objc_copyWeak(v12, (id *)location);
  v12[1] = (id)a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)location);
}

void __96__AFSiriAnnouncementRequestCapabilityManager_provider_availableAnnouncementRequestTypesChanged___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = WeakRetained[2];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "availableAnnouncementRequestTypesChanged:onPlatform:", *(void *)(a1 + 48), objc_msgSend((id)objc_opt_class(), "platform", (void)v9));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)provider:(id)a3 eligibleAnnouncementRequestTypesChanged:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[AFSiriAnnouncementRequestCapabilityManager provider:eligibleAnnouncementRequestTypesChanged:]";
    __int16 v14 = 2048;
    unint64_t v15 = a4;
    _os_log_debug_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEBUG, "%s Notifying observers eligible announcement request types changed: %lu", location, 0x16u);
  }
  objc_initWeak((id *)location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__AFSiriAnnouncementRequestCapabilityManager_provider_eligibleAnnouncementRequestTypesChanged___block_invoke;
  block[3] = &unk_1E59296A8;
  objc_copyWeak(v12, (id *)location);
  v12[1] = (id)a4;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak((id *)location);
}

void __95__AFSiriAnnouncementRequestCapabilityManager_provider_eligibleAnnouncementRequestTypesChanged___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = WeakRetained[2];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "eligibleAnnouncementRequestTypesChanged:onPlatform:", *(void *)(a1 + 48), objc_msgSend((id)objc_opt_class(), "platform", (void)v9));
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AFSiriAnnouncementRequestCapabilityManager_removeObserver___block_invoke;
  block[3] = &unk_1E5929FC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__AFSiriAnnouncementRequestCapabilityManager_removeObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] removeObject:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__AFSiriAnnouncementRequestCapabilityManager_addObserver___block_invoke;
  block[3] = &unk_1E5929FC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__AFSiriAnnouncementRequestCapabilityManager_addObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[2] addObject:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

- (void)fetchAvailableAnnouncementRequestTypesWithCompletion:(id)a3
{
  if (a3) {
    -[AFAnnouncementRequestCapabilityProviding fetchAvailableAnnouncementRequestTypesWithCompletion:](self->_capabilityProvider, "fetchAvailableAnnouncementRequestTypesWithCompletion:");
  }
}

- (void)fetchEligibleAnnouncementRequestTypesWithCompletion:(id)a3
{
  if (a3) {
    -[AFAnnouncementRequestCapabilityProviding fetchEligibleAnnouncementRequestTypesWithCompletion:](self->_capabilityProvider, "fetchEligibleAnnouncementRequestTypesWithCompletion:");
  }
}

- (AFSiriAnnouncementRequestCapabilityManager)initWithPlatform:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AFSiriAnnouncementRequestCapabilityManager;
  id v4 = [(AFSiriAnnouncementRequestCapabilityManager *)&v13 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("AFSiriAnnouncementRequestCapabilityManager", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v7;

    id v9 = (void *)[(id)objc_opt_class() _classForPlatform:a3];
    v4->_platform = [v9 platform];
    uint64_t v10 = [v9 provider];
    capabilityProvider = v4->_capabilityProvider;
    v4->_capabilityProvider = (AFAnnouncementRequestCapabilityProviding *)v10;

    [(AFAnnouncementRequestCapabilityProviding *)v4->_capabilityProvider addDelegate:v4];
  }
  return v4;
}

+ (BOOL)_supportsAnnouncementType:(int64_t)a3 forSupportedIntents:(id)a4 forBundleId:(id)a5 onPlatform:(int64_t)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  long long v12 = objc_msgSend((id)objc_msgSend(a1, "_classForPlatform:", a6), "requiredIntentIdentifiersForUserNotificationAnnouncementType:", a3);
  if (v12)
  {
    objc_super v13 = [(id)objc_opt_class() _requiredBundleIDsForNotificationAnnouncementType:a3];
    if ([v13 count] && !objc_msgSend(v13, "containsObject:", v11))
    {
      BOOL v21 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v29 = v11;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v31;
LABEL_6:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v31 != v17) {
          objc_enumerationMutation(v14);
        }
        if (![v10 containsObject:*(void *)(*((void *)&v30 + 1) + 8 * v18)]) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v40 count:16];
          if (v16) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:

      id v14 = [(id)objc_opt_class() _requiredPlatformsForNotificationAnnouncementType:a3];
      if (![v14 count]
        || ([MEMORY[0x1E4F28ED0] numberWithInteger:a6],
            v19 = objc_claimAutoreleasedReturnValue(),
            char v20 = [v14 containsObject:v19],
            v19,
            (v20 & 1) != 0))
      {
        BOOL v21 = 1;
LABEL_19:
        id v11 = v29;
LABEL_20:

        goto LABEL_21;
      }
      v22 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        v24 = v22;
        id v11 = v29;
        if ((unint64_t)a3 > 9) {
          v25 = @"(unknown)";
        }
        else {
          v25 = off_1E5924D80[a3];
        }
        v26 = v25;
        if ((unint64_t)a6 > 4) {
          v27 = @"(unknown)";
        }
        else {
          v27 = off_1E592A030[a6];
        }
        v28 = v27;
        *(_DWORD *)buf = 136315650;
        v35 = "+[AFSiriAnnouncementRequestCapabilityManager _supportsAnnouncementType:forSupportedIntents:forBundleId:onPlatform:]";
        __int16 v36 = 2112;
        v37 = v26;
        __int16 v38 = 2112;
        v39 = v28;
        _os_log_debug_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_DEBUG, "%s rejecting announcementType %@ by platform %@", buf, 0x20u);

        BOOL v21 = 0;
        goto LABEL_20;
      }
    }
    BOOL v21 = 0;
    goto LABEL_19;
  }
  BOOL v21 = 0;
LABEL_22:

  return v21;
}

+ (id)_requiredPlatformsForNotificationAnnouncementType:(int64_t)a3
{
  if (a3 == 7)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE97B80, 0);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_requiredBundleIDsForNotificationAnnouncementType:(int64_t)a3
{
  if ((unint64_t)a3 > 9 || (unint64_t)(a3 - 2) > 4) {
    return 0;
  }
  else {
    return (id)qword_1E59296F8[a3 - 2];
  }
}

+ (int64_t)notificationAnnouncementTypeForNotificationFromApp:(id)a3 withIntentIDs:(id)a4 notificationContent:(id)a5 onPlatform:(int64_t)a6
{
  if (!a3) {
    return 0;
  }
  id v10 = a4;
  id v11 = a3;
  long long v12 = [a5 contentType];
  objc_super v13 = [a1 _candidateAnnounceNotificationTypesFromApp:v11 withIntentIDs:v10 notificationContentType:v12 onPlatform:a6];

  if ([v13 containsObject:&unk_1EEE97B80])
  {
    int64_t v14 = 1;
  }
  else if ([v13 containsObject:&unk_1EEE97B98])
  {
    int64_t v14 = 2;
  }
  else if ([v13 containsObject:&unk_1EEE97BE0])
  {
    int64_t v14 = 4;
  }
  else if ([v13 containsObject:&unk_1EEE97BB0])
  {
    int64_t v14 = 5;
  }
  else if ([v13 containsObject:&unk_1EEE97BF8])
  {
    int64_t v14 = 6;
  }
  else if ([v13 containsObject:&unk_1EEE97BC8])
  {
    int64_t v14 = 7;
  }
  else if ([v13 containsObject:&unk_1EEE97B68])
  {
    int64_t v14 = 3;
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

+ (id)_candidateAnnounceNotificationTypesFromApp:(id)a3 withIntentIDs:(id)a4 notificationContentType:(id)a5 onPlatform:(int64_t)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v29 = a5;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = (void *)[a1 _classForPlatform:a6];
  long long v30 = v10;
  [(id)objc_opt_class() supportedAnnouncementTypesForBundleId:v10 onPlatform:a6];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      uint64_t v16 = 0;
      uint64_t v31 = v14;
      do
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = [*(id *)(*((void *)&v38 + 1) + 8 * v16) integerValue];
        uint64_t v18 = [v12 announceableIntentIdentifiersForUserNotificationAnnouncementType:v17];
        v19 = v18;
        if (v18 && ![v18 count])
        {
          id v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:v17];
          [v33 addObject:v20];
        }
        else
        {
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            v23 = v12;
            uint64_t v24 = *(void *)v35;
            while (2)
            {
              for (uint64_t i = 0; i != v22; ++i)
              {
                if (*(void *)v35 != v24) {
                  objc_enumerationMutation(v20);
                }
                if ([v11 containsObject:*(void *)(*((void *)&v34 + 1) + 8 * i)])
                {
                  v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:v17];
                  [v33 addObject:v26];

                  goto LABEL_18;
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
              if (v22) {
                continue;
              }
              break;
            }
LABEL_18:
            long long v12 = v23;
            uint64_t v14 = v31;
          }
        }

        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v14);
  }
  if ((([v29 isEqualToString:*MEMORY[0x1E4F44728]] & 1) != 0
     || [v29 isEqualToString:*MEMORY[0x1E4F44740]])
    && (v27 = &unk_1EEE97B80, ([obj containsObject:&unk_1EEE97B80] & 1) != 0)
    || [v29 isEqualToString:*MEMORY[0x1E4F44718]]
    && (v27 = &unk_1EEE97B98, ([obj containsObject:&unk_1EEE97B98] & 1) != 0)
    || [v29 isEqualToString:*MEMORY[0x1E4F44760]]
    && (v27 = &unk_1EEE97BB0, ([obj containsObject:&unk_1EEE97BB0] & 1) != 0)
    || [v29 isEqualToString:*MEMORY[0x1E4F44708]]
    && (v27 = &unk_1EEE97BC8, [obj containsObject:&unk_1EEE97BC8]))
  {
    [v33 addObject:v27];
  }

  return v33;
}

+ (id)supportedAnnouncementTypesForBundleId:(id)a3 onPlatform:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v7 addObject:&unk_1EEE97B68];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v8 = (void *)getLSApplicationRecordClass_softClass;
  uint64_t v27 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getLSApplicationRecordClass_block_invoke;
    id v29 = &unk_1E592C0B0;
    long long v30 = &v24;
    __getLSApplicationRecordClass_block_invoke((uint64_t)buf);
    id v8 = (void *)v25[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v24, 8);
  id v23 = 0;
  id v10 = (void *)[[v9 alloc] initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v23];
  id v11 = v23;
  if (v11)
  {
    long long v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v29 = v11;
      _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Unable to retrieve LSApplicationRecord for bundle identifier %@: %@", buf, 0x20u);
    }
    id v13 = v7;
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    uint64_t v14 = (void *)getINAppInfoClass_softClass;
    uint64_t v27 = getINAppInfoClass_softClass;
    if (!getINAppInfoClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getINAppInfoClass_block_invoke;
      id v29 = &unk_1E592C0B0;
      long long v30 = &v24;
      __getINAppInfoClass_block_invoke((uint64_t)buf);
      uint64_t v14 = (void *)v25[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v24, 8);
    uint64_t v22 = [v15 appInfoWithApplicationRecord:v10];
    uint64_t v16 = [v22 supportedIntents];
    for (uint64_t i = 0; i != 8; ++i)
    {
      if ([a1 _supportsAnnouncementType:i forSupportedIntents:v16 forBundleId:v6 onPlatform:a4])
      {
        uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:i];
        [v7 addObject:v18];
      }
    }
    v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "+[AFSiriAnnouncementRequestCapabilityManager supportedAnnouncementTypesForBundleId:onPlatform:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v29 = v7;
      _os_log_debug_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEBUG, "%s application: %@ supports %@", buf, 0x20u);
    }
    id v20 = v7;
  }
  return v7;
}

+ (Class)_classForPlatform:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 < 5)
  {
    switch(a3)
    {
      case 0:
        uint64_t v4 = AFSiriLogContextConnection;
        if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          goto LABEL_6;
        }
        int v8 = 136315394;
        id v9 = "+[AFSiriAnnouncementRequestCapabilityManager _classForPlatform:]";
        __int16 v10 = 2048;
        int64_t v11 = 0;
        dispatch_queue_t v5 = v4;
        goto LABEL_11;
      case 1:
      case 2:
      case 3:
      case 4:
        goto LABEL_6;
      default:
        goto LABEL_7;
    }
  }
  uint64_t v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    id v9 = "+[AFSiriAnnouncementRequestCapabilityManager _classForPlatform:]";
    __int16 v10 = 2048;
    int64_t v11 = a3;
    dispatch_queue_t v5 = v6;
LABEL_11:
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s platform %li is not valid, using headphones provider.", (uint8_t *)&v8, 0x16u);
  }
LABEL_6:
  objc_opt_class();
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  return (Class)a1;
}

@end