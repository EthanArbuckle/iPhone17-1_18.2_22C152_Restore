@interface StorageDataAppsWrapper
- (void)dealloc;
- (void)startObservingWithUpdateHandler:(id)a3;
- (void)stopObserving;
- (void)updateApps:(id)a3;
@end

@implementation StorageDataAppsWrapper

- (void)dealloc
{
  [(StorageDataAppsWrapper *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)StorageDataAppsWrapper;
  [(StorageDataAppsWrapper *)&v3 dealloc];
}

- (void)startObservingWithUpdateHandler:(id)a3
{
  if (!self->isMonitoring)
  {
    self->isMonitoring = 1;
    id v4 = objc_retainBlock(a3);
    id updateHandler = self->updateHandler;
    self->id updateHandler = v4;

    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"updateApps:" name:STNotifyAppSizesChanged object:0];
    [v9 addObserver:self selector:"updateApps:" name:STStoragePurgeableChangedNotification object:0];
    v6 = +[STStorageDiskMonitor sharedMonitor];
    [v6 startMonitor];

    v7 = +[STStorageAppsMonitor sharedMonitor];
    [v7 startMonitor];

    id v8 = +[STStorageCacheDelete sharedMonitor];
  }
}

- (void)stopObserving
{
  if (self->isMonitoring)
  {
    self->isMonitoring = 0;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self name:STNotifyAppSizesChanged object:0];
    [v5 removeObserver:self name:STStoragePurgeableChangedNotification object:0];
    objc_super v3 = +[STStorageDiskMonitor sharedMonitor];
    [v3 stopMonitor];

    id v4 = +[STStorageAppsMonitor sharedMonitor];
    [v4 stopMonitor];
  }
}

- (void)updateApps:(id)a3
{
  id v39 = objc_alloc_init((Class)SAAppSizerResults);
  objc_super v3 = +[STStorageAppsMonitor sharedMonitor];
  id v4 = [v3 apps];

  id v5 = +[NSMutableDictionary dictionary];
  v6 = +[STStorageDataNotifier sharedNotifier];
  [v6 postLoadingComplete];

  v7 = +[STStorageDiskMonitor sharedMonitor];
  id v8 = [v7 storageSpace];
  id v37 = [v8 totalBytes];

  id v9 = +[STStorageDiskMonitor sharedMonitor];
  v10 = [v9 storageSpace];
  v36 = (char *)[v10 usedBytes];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v4;
  v11 = &_s7SwiftUI17EnvironmentValuesV15foregroundColorAA0F0VSgvg_ptr_0;
  id v43 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  uint64_t v12 = 0;
  if (v43)
  {
    uint64_t v42 = *(void *)v49;
    v40 = v5;
    do
    {
      for (i = 0; i != v43; i = (char *)i + 1)
      {
        if (*(void *)v49 != v42) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        id v15 = objc_alloc_init((Class)v11[175]);
        v16 = [v14 appSize];
        objc_msgSend(v15, "setFixedSize:", objc_msgSend(v16, "fixed"));

        v17 = [v14 appSize];
        objc_msgSend(v15, "setDataSize:", objc_msgSend(v17, "docsAndData"));

        v18 = [v14 appSize];
        id v19 = [v18 userTotal];

        v20 = +[NSMutableSet set];
        v21 = [v14 childApps];
        id v22 = [v21 count];

        if (v22)
        {
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v23 = [v14 childApps];
          id v24 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v24)
          {
            id v25 = v24;
            uint64_t v26 = *(void *)v45;
            do
            {
              for (j = 0; j != v25; j = (char *)j + 1)
              {
                if (*(void *)v45 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * (void)j), "bundleIdentifier", v36);
                [v20 addObject:v28];
              }
              id v25 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
            }
            while (v25);
            id v5 = v40;
            v11 = &_s7SwiftUI17EnvironmentValuesV15foregroundColorAA0F0VSgvg_ptr_0;
          }
        }
        else
        {
          v23 = [v14 bundleIdentifier];
          [v20 addObject:v23];
        }
        v12 += (uint64_t)v19;

        [v5 setObject:v15 forKey:v20];
      }
      id v43 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v43);
  }

  v29 = v5;
  id v30 = objc_alloc_init((Class)v11[175]);
  [v30 setDataSize:STSizeOfSystemVolume()];
  uint64_t v31 = STSizeOfSystemVolume();
  v32 = +[NSSet setWithObject:@"com.apple.fakeapp.System"];
  [v29 setObject:v30 forKey:v32];

  v33 = &v36[-v12 - v31];
  id v34 = objc_alloc_init((Class)v11[175]);
  [v34 setDataSize:v33];
  v35 = +[NSSet setWithObject:@"com.apple.fakeapp.SystemData"];
  [v29 setObject:v34 forKey:v35];

  [v39 setAppData:v29];
  [v39 setDiskUsed:v36];
  [v39 setDiskCapacity:v37];
  (*((void (**)(void))self->updateHandler + 2))();
}

- (void).cxx_destruct
{
}

@end