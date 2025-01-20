@interface SFDownloadStorageUsageMonitorEntry
- (NSData)progressData;
- (NSProgress)progress;
- (NSString)destinationPath;
- (NSUUID)identifier;
- (SFDownloadStorageUsageMonitorEntry)initWithIdentifier:(id)a3;
- (SFDownloadStorageUsageMonitorEntryDelegate)delegate;
- (id)progressSubscriber;
- (int64_t)cachedUsage;
- (void)_didGainProgress:(id)a3;
- (void)_didLoseProgress:(id)a3;
- (void)_updateProgressSubscriptionWithData:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCachedUsage:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressData:(id)a3;
- (void)setProgressSubscriber:(id)a3;
- (void)updateWithDictionaryRepresentation:(id)a3;
@end

@implementation SFDownloadStorageUsageMonitorEntry

- (SFDownloadStorageUsageMonitorEntry)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v6 = [(SFDownloadStorageUsageMonitorEntry *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_didGainProgress:(id)a3
{
  id v7 = a3;
  id v5 = [v7 fileOperationKind];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F28858]];

  if (v6)
  {
    objc_storeStrong((id *)&self->_progress, a3);
    [v7 addObserver:self forKeyPath:@"completedUnitCount" options:1 context:entryProgressCompletedUnitCountKVOContext];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)entryProgressCompletedUnitCountKVOContext == a6)
  {
    self->_cachedUsage = [(NSProgress *)self->_progress completedUnitCount];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained entryDidChangeUsage:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SFDownloadStorageUsageMonitorEntry;
    -[SFDownloadStorageUsageMonitorEntry observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_didLoseProgress:(id)a3
{
  if (self->_progress == a3)
  {
    [a3 removeObserver:self forKeyPath:@"completedUnitCount" context:entryProgressCompletedUnitCountKVOContext];
    progress = self->_progress;
    self->_progress = 0;

    id v5 = _SFSafariContainerURL();
    id v13 = [v5 URLByAppendingPathComponent:@"/" isDirectory:1];

    int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:self->_destinationPath isDirectory:0 relativeToURL:v13];
    int64_t cachedUsage = self->_cachedUsage;
    objc_super v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [v6 path];
    v10 = [v8 attributesOfItemAtPath:v9 error:0];
    v11 = objc_msgSend(v10, "safari_numberForKey:", *MEMORY[0x1E4F28390]);
    self->_int64_t cachedUsage = [v11 integerValue];

    if (cachedUsage != self->_cachedUsage)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained entryDidChangeUsage:self];
    }
  }
}

- (void)_updateProgressSubscriptionWithData:(id)a3
{
  id v5 = a3;
  id progressSubscriber = self->_progressSubscriber;
  if (progressSubscriber)
  {
    if (self->_progress)
    {
      [(SFDownloadStorageUsageMonitorEntry *)self _didLoseProgress:self->_progress];
      id progressSubscriber = self->_progressSubscriber;
    }
    [MEMORY[0x1E4F28F90] removeSubscriber:progressSubscriber];
    id v7 = self->_progressSubscriber;
    self->_id progressSubscriber = 0;
  }
  objc_storeStrong((id *)&self->_progressData, a3);
  if (v5)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CB10]) initByResolvingBookmarkData:v5 options:0 relativeToURL:0 bookmarkDataIsStale:0 error:0];
    if (v8)
    {
      v9 = (void *)v8;
      objc_initWeak(&location, self);
      v10 = (void *)MEMORY[0x1E4F28F90];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke;
      v13[3] = &unk_1E5C72E08;
      objc_copyWeak(&v14, &location);
      v11 = [v10 addSubscriberForFileURL:v9 withPublishingHandler:v13];
      id v12 = self->_progressSubscriber;
      self->_id progressSubscriber = v11;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

id __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained _didGainProgress:v3];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke_2;
  v8[3] = &unk_1E5C72DE0;
  objc_copyWeak(&v10, a1);
  id v9 = v3;
  id v5 = v3;
  int v6 = (void *)MEMORY[0x1AD0C36A0](v8);

  objc_destroyWeak(&v10);

  return v6;
}

void __74__SFDownloadStorageUsageMonitorEntry__updateProgressSubscriptionWithData___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didLoseProgress:*(void *)(a1 + 32)];
}

- (void)updateWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", @"Path");
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  destinationPath = self->_destinationPath;
  self->_destinationPath = v5;

  objc_msgSend(v4, "safari_dataForKey:", @"PlaceholderBookmarkData");
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if ((WBSIsEqual() & 1) == 0) {
    [(SFDownloadStorageUsageMonitorEntry *)self _updateProgressSubscriptionWithData:v17];
  }
  if (!self->_progress)
  {
    int64_t cachedUsage = self->_cachedUsage;
    int64_t v8 = (int64_t)self->_destinationPath;
    if (v8)
    {
      id v9 = _SFSafariContainerURL();
      id v10 = [v9 URLByAppendingPathComponent:@"/" isDirectory:1];

      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:self->_destinationPath isDirectory:0 relativeToURL:v10];
      id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v13 = [v11 path];
      id v14 = [v12 attributesOfItemAtPath:v13 error:0];
      v15 = objc_msgSend(v14, "safari_numberForKey:", *MEMORY[0x1E4F28390]);
      self->_int64_t cachedUsage = [v15 integerValue];

      int64_t v8 = self->_cachedUsage;
    }
    else
    {
      self->_int64_t cachedUsage = 0;
    }
    if (v8 != cachedUsage)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained entryDidChangeUsage:self];
    }
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (void)setProgressSubscriber:(id)a3
{
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (NSData)progressData
{
  return self->_progressData;
}

- (void)setProgressData:(id)a3
{
}

- (int64_t)cachedUsage
{
  return self->_cachedUsage;
}

- (void)setCachedUsage:(int64_t)a3
{
  self->_int64_t cachedUsage = a3;
}

- (SFDownloadStorageUsageMonitorEntryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDownloadStorageUsageMonitorEntryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressData, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end