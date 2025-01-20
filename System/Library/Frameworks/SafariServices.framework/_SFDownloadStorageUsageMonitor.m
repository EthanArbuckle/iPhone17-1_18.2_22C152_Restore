@interface _SFDownloadStorageUsageMonitor
- (_SFDownloadStorageUsageMonitor)init;
- (int64_t)usage;
- (void)_reloadDownloadHistory;
- (void)downloadFileContentsDidChange:(id)a3;
- (void)entryDidChangeUsage:(id)a3;
@end

@implementation _SFDownloadStorageUsageMonitor

- (_SFDownloadStorageUsageMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)_SFDownloadStorageUsageMonitor;
  v2 = [(_SFDownloadStorageUsageMonitor *)&v17 init];
  if (v2)
  {
    v3 = [SFDownloadFile alloc];
    v4 = +[_SFDownloadManager defaultDownloadsHistoryURL];
    uint64_t v5 = [(SFDownloadFile *)v3 initWithURL:v4];
    historyFile = v2->_historyFile;
    v2->_historyFile = (SFDownloadFile *)v5;

    [(SFDownloadFile *)v2->_historyFile setDelegate:v2];
    dispatch_queue_t v7 = dispatch_queue_create("_SFDownloadStorageUsageMonitor internal queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    entries = v2->_entries;
    v2->_entries = v9;

    v11 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38___SFDownloadStorageUsageMonitor_init__block_invoke;
    block[3] = &unk_1E5C724D8;
    v12 = v2;
    v16 = v12;
    dispatch_async(v11, block);
    v13 = v12;
  }
  return v2;
}

- (int64_t)usage
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39___SFDownloadStorageUsageMonitor_usage__block_invoke;
  v5[3] = &unk_1E5C72E38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_reloadDownloadHistory
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isMobileSafariInstalled"))
  {
    int64_t v3 = [(SFDownloadFile *)self->_historyFile URL];
    v4 = +[_SFDownloadManager downloadRepresentationsAtURL:v3];

    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = [(NSMutableDictionary *)self->_entries allKeys];
    dispatch_queue_t v7 = (void *)[v5 initWithArray:v6];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v13 = objc_alloc(MEMORY[0x1E4F29128]);
          v14 = objc_msgSend(v12, "safari_stringForKey:", @"Identifier");
          v15 = (void *)[v13 initWithUUIDString:v14];

          v16 = [(NSMutableDictionary *)self->_entries objectForKeyedSubscript:v15];
          objc_super v17 = [(NSMutableDictionary *)self->_entries objectForKeyedSubscript:v15];

          if (!v17)
          {
            v18 = [[SFDownloadStorageUsageMonitorEntry alloc] initWithIdentifier:v15];

            [(SFDownloadStorageUsageMonitorEntry *)v18 setDelegate:self];
            [(NSMutableDictionary *)self->_entries setObject:v18 forKeyedSubscript:v15];
            v16 = v18;
          }
          [v16 updateWithDictionaryRepresentation:v12];
          [v7 removeObject:v15];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v9);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          v26 = [(NSMutableDictionary *)self->_entries objectForKeyedSubscript:v25];
          v22 += [v26 cachedUsage];

          [(NSMutableDictionary *)self->_entries removeObjectForKey:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v21);

      if (v22)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56___SFDownloadStorageUsageMonitor__reloadDownloadHistory__block_invoke;
        block[3] = &unk_1E5C724D8;
        void block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
    }
  }
}

- (void)entryDidChangeUsage:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54___SFDownloadStorageUsageMonitor_entryDidChangeUsage___block_invoke;
  block[3] = &unk_1E5C724D8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)downloadFileContentsDidChange:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64___SFDownloadStorageUsageMonitor_downloadFileContentsDidChange___block_invoke;
  block[3] = &unk_1E5C724D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_historyFile, 0);

  objc_storeStrong((id *)&self->_entries, 0);
}

@end