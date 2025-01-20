@interface DDSAssetObserver
- (DDSAssetObserver)init;
- (DDSAssetObservingDelegate)delegate;
- (NSMutableSet)typesToObserve;
- (NSSet)autoAssetTypes;
- (void)beginObservingType:(id)a3;
- (void)dealloc;
- (void)endObservingTypes:(id)a3;
- (void)notifyObserversAssetsUpdatedForType:(id)a3;
- (void)observeAssetType:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DDSAssetObserver

- (DDSAssetObserver)init
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)DDSAssetObserver;
  v2 = [(DDSAssetObserver *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    typesToObserve = v2->_typesToObserve;
    v2->_typesToObserve = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v11[0] = @"com.apple.MobileAsset.LinguisticDataAuto";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v7 = [v5 setWithArray:v6];
    autoAssetTypes = v2->_autoAssetTypes;
    v2->_autoAssetTypes = (NSSet *)v7;
  }
  return v2;
}

- (void)observeAssetType:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = [(DDSAssetObserver *)self typesToObserve];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = DefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Adding observer for DDS asset update notification for asset type: (%{public}@)", (uint8_t *)&v9, 0xCu);
    }

    v8 = [(DDSAssetObserver *)self typesToObserve];
    [v8 addObject:v4];

    [(DDSAssetObserver *)self beginObservingType:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSMutableSet)typesToObserve
{
  return self->_typesToObserve;
}

- (void)beginObservingType:(id)a3
{
  id v9 = a3;
  id v4 = [v9 stringByAppendingString:@".dds.assets-updated"];
  v5 = [(DDSAssetObserver *)self autoAssetTypes];
  int v6 = [v5 containsObject:v9];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F77FD0] notifyRegistrationName:@"ASSET_VERSION_DOWNLOADED" forAssetType:v9];

    id v4 = (__CFString *)v7;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)assetUpdatedNotificationCallback, v4, 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (NSSet)autoAssetTypes
{
  return self->_autoAssetTypes;
}

- (void)setDelegate:(id)a3
{
}

- (void)endObservingTypes:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "End observing types: %@", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "stringByAppendingString:", @".dds.assets-updated", (void)v17);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v13 = [(DDSAssetObserver *)self autoAssetTypes];
        int v14 = [v13 containsObject:v11];

        if (v14)
        {
          uint64_t v15 = [MEMORY[0x1E4F77FD0] notifyRegistrationName:@"ASSET_VERSION_DOWNLOADED" forAssetType:v11];

          v12 = (__CFString *)v15;
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v12, 0);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

- (void)notifyObserversAssetsUpdatedForType:(id)a3
{
  name = [a3 stringByAppendingString:@".dds.assets-updated"];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (void)dealloc
{
  v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected dealloc for asset observer", buf, 2u);
  }

  [(DDSAssetObserver *)self setDelegate:0];
  id v4 = [(DDSAssetObserver *)self typesToObserve];
  [(DDSAssetObserver *)self endObservingTypes:v4];

  v5.receiver = self;
  v5.super_class = (Class)DDSAssetObserver;
  [(DDSAssetObserver *)&v5 dealloc];
}

- (DDSAssetObservingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSAssetObservingDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetTypes, 0);
  objc_storeStrong((id *)&self->_typesToObserve, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end