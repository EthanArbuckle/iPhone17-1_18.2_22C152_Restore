@interface HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask
- (HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask)initWithDaemon:(id)a3;
- (void)main;
@end

@implementation HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask

- (HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask)initWithDaemon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask;
  v5 = [(HDCloudSyncManagerTask *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_daemon, v4);
  }

  return v6;
}

- (void)main
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  p_daemon = &self->_daemon;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  v5 = objc_msgSend(WeakRetained, "profileManager", 0);
  v6 = [v5 allProfileIdentifiers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained((id *)p_daemon);
        v13 = [v12 profileManager];
        v14 = [v13 profileForIdentifier:v11];

        v15 = [v14 cloudSyncManager];
        v16 = [v15 ownerIdentifierManager];
        [v16 discardCachedIdentifiers];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [(HDCloudSyncManagerTask *)self finish];
}

- (void).cxx_destruct
{
}

@end