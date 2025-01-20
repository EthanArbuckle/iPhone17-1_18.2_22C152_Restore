@interface _GEOMapDataSubscriptionDownloadState
- (_GEOMapDataSubscriptionDownloadState)init;
- (id)description;
- (id)downloader;
- (os_unfair_lock_s)downloadMode;
- (os_unfair_lock_s)downloadReason;
- (void)_updateExternalState;
- (void)_updateProgressDownloadReason;
- (void)setDownloader:(uint64_t)a1;
- (void)setQueuedForDownload:(uint64_t)a1;
- (void)setWaitingUserInfo:(uint64_t)a1;
@end

@implementation _GEOMapDataSubscriptionDownloadState

- (_GEOMapDataSubscriptionDownloadState)init
{
  v8.receiver = self;
  v8.super_class = (Class)_GEOMapDataSubscriptionDownloadState;
  v2 = [(_GEOMapDataSubscriptionDownloadState *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(GEOMapDataSubscriptionState);
    externalState = v3->_externalState;
    v3->_externalState = v4;

    v6 = v3;
  }

  return v3;
}

- (id)description
{
  v13[2] = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(GEOMapDataSubscriptionDownloader *)self->_downloader description];
  v5 = (void *)v4;
  v6 = @"nil";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  v12[0] = @"downloader";
  v12[1] = @"queuedForDownload";
  v13[0] = v7;
  objc_super v8 = [NSNumber numberWithInt:self->_pendingProgress != 0];
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = [v9 description];

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)downloader
{
  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[11];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)setDownloader:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    [(id)a1 willChangeValueForKey:@"downloader"];
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)(a1 + 88), a2);
    uint64_t v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    -[_GEOMapDataSubscriptionDownloadState _updateExternalState](a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    [(id)a1 didChangeValueForKey:@"downloader"];
  }
}

- (void)_updateExternalState
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (*(unsigned char *)(a1 + 12))
  {
    uint64_t v2 = 2;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 13))
    {
      uint64_t v3 = 0;
      goto LABEL_8;
    }
    uint64_t v2 = 1;
  }
  if (*(unsigned char *)(a1 + 14)) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = v2;
  }
LABEL_8:
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 88);
  if (!v4)
  {
    if (!v5)
    {
      uint64_t v9 = *(void *)(a1 + 64);
      if (v9 == 3)
      {
        id v7 = 0;
        if (*(void *)(a1 + 80)) {
          objc_super v8 = *(void **)(a1 + 80);
        }
        else {
          objc_super v8 = (void *)MEMORY[0x1E4F1CC08];
        }
        uint64_t v6 = 5;
        goto LABEL_16;
      }
      uint64_t v10 = 3;
      if (v9 != 1) {
        uint64_t v10 = 0;
      }
      if (v9 == 2) {
        uint64_t v6 = 4;
      }
      else {
        uint64_t v6 = v10;
      }
      id v7 = 0;
      goto LABEL_14;
    }
    uint64_t v6 = 2;
LABEL_13:
    id v7 = [v5 progress];
LABEL_14:
    objc_super v8 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_16;
  }
  if (v5)
  {
    uint64_t v6 = 1;
    goto LABEL_13;
  }
  id v7 = v4;
  objc_super v8 = (void *)MEMORY[0x1E4F1CC08];
  uint64_t v6 = 1;
LABEL_16:
  id v11 = v7;
  -[GEOMapDataSubscriptionState _setLoadState:downloadState:downloadProgress:lastError:downloadedDataCount:downloadedDataSize:userInfo:](*(void *)(a1 + 96), v3, v6, v7, *(void **)(a1 + 72), *(void *)(a1 + 16), *(void *)(a1 + 24), v8);
}

- (void)setQueuedForDownload:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v5 = *(void **)(a1 + 32);
    if ((((v5 == 0) ^ a2) & 1) == 0)
    {
      if (a2)
      {
        uint64_t v6 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:-1];
        id v7 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v6;

        -[_GEOMapDataSubscriptionDownloadState _updateProgressDownloadReason](a1);
      }
      else
      {
        *(void *)(a1 + 32) = 0;
      }
      -[_GEOMapDataSubscriptionDownloadState _updateExternalState](a1);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_updateProgressDownloadReason
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  result = *(void **)(a1 + 32);
  if (!result) {
    return result;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if ((unint64_t)(v3 - 2) < 2)
  {
    uint64_t v4 = GEOMapDataSubscriptionProgressDownloadReasonForcedUpdate;
  }
  else
  {
    if (!v3)
    {
      id v5 = 0;
      goto LABEL_9;
    }
    if (v3 != 1) {
      return result;
    }
    uint64_t v4 = GEOMapDataSubscriptionProgressDownloadReasonAutomaticUpdate;
  }
  id v5 = *v4;
LABEL_9:

  return (void *)[result setUserInfoObject:v5 forKey:@"GEOMapDataSubscriptionDownloadReasonKey"];
}

- (os_unfair_lock_s)downloadReason
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[12]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (os_unfair_lock_s)downloadMode
{
  v1 = a1;
  if (a1)
  {
    uint64_t v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = *(os_unfair_lock_s **)&v1[10]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)setWaitingUserInfo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(id *)(a1 + 80) != v6 && (objc_msgSend(v6, "isEqualToDictionary:") & 1) == 0)
    {
      uint64_t v4 = [v6 copy];
      id v5 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v4;

      -[_GEOMapDataSubscriptionDownloadState _updateExternalState](a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
    id v3 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalState, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_waitingUserInfo, 0);
  objc_storeStrong((id *)&self->_lastError, 0);

  objc_storeStrong((id *)&self->_pendingProgress, 0);
}

@end