@interface FBKUploadStatusManager
- (BOOL)isTrackingTask:(id)a3;
- (BOOL)shouldGiveUpOnUploadWithPromises:(id)a3;
- (BOOL)shouldGiveUpOnUploadWithPromises:(id)a3 stalenessDate:(id)a4;
- (BOOL)shouldLogProgress;
- (DEDController)ded;
- (FBKData)data;
- (FBKDeviceManager)deviceManager;
- (FBKUploadStatusManager)initWithData:(id)a3 ded:(id)a4 deviceManager:(id)a5;
- (NSMutableDictionary)submissionTimers;
- (NSMutableSet)trackedTasks;
- (id)configureSubmissionTimerForTask:(id)a3 timeout:(double)a4;
- (id)workingFilePromisesFromSet:(id)a3 stalenessDate:(id)a4;
- (void)deleteAndNotifyUploadTaskWithTask:(id)a3;
- (void)didFailToConnectToSessionsOnTask:(id)a3;
- (void)didFailToGetUploadUpdatesForUploadTask:(id)a3;
- (void)didFailToGetUploadUpdatesForUploadTask:(id)a3 shouldTryServerUpdates:(BOOL)a4;
- (void)didGetSessionStateUpdate:(id)a3 uploadTask:(id)a4 newState:(int64_t)a5 sessionInfo:(id)a6;
- (void)didLogOutWithCompletion:(id)a3;
- (void)fallbackToServerSideUploadUpdatesForTask:(id)a3;
- (void)fallbackToServerSideUploadUpdatesForTask:(id)a3 attempts:(unint64_t)a4;
- (void)getAllBugSessionsForTask:(id)a3 completion:(id)a4;
- (void)pollDEDForSessionsStateOnActiveSession:(id)a3 uploadTask:(id)a4 isCurrentDeviceSession:(BOOL)a5;
- (void)pollDEDForSessionsStateOnActiveSession:(id)a3 uploadTask:(id)a4 isCurrentDeviceSession:(BOOL)a5 totalQueryCount:(unint64_t)a6 lastState:(int64_t)a7 lastInfo:(id)a8;
- (void)pollDEDForSessionsStateOnTask:(id)a3 sessions:(id)a4;
- (void)reloadFilerFormForFinishedTask:(id)a3;
- (void)setData:(id)a3;
- (void)setDed:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setShouldLogProgress:(BOOL)a3;
- (void)setSubmissionTimers:(id)a3;
- (void)setTrackedTasks:(id)a3;
- (void)stopTrackingAllTasks;
- (void)stopTrackingTaskIfDeleted:(id)a3;
- (void)stopTrackingUploadTask:(id)a3;
- (void)timer:(id)a3 didTimeoutForTask:(id)a4;
- (void)trackUploadIfNeeded:(id)a3;
- (void)trackUploadTask:(id)a3;
- (void)trackUploadTask:(id)a3 attempt:(int64_t)a4;
- (void)updateUploadTask:(id)a3 withUploadProgress:(unint64_t)a4 uploadSize:(unint64_t)a5 onBugSession:(id)a6 state:(int64_t)a7;
- (void)uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5;
- (void)waitOnUpdatesForTask:(id)a3 withSessions:(id)a4;
@end

@implementation FBKUploadStatusManager

- (void)pollDEDForSessionsStateOnTask:(id)a3 sessions:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        v13 = [(FBKUploadStatusManager *)self deviceManager];
        v14 = [v12 deviceFromManager:v13];

        -[FBKUploadStatusManager pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:](self, "pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:", v12, v6, [v14 isCurrentDevice]);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)pollDEDForSessionsStateOnActiveSession:(id)a3 uploadTask:(id)a4 isCurrentDeviceSession:(BOOL)a5
{
}

- (void)pollDEDForSessionsStateOnActiveSession:(id)a3 uploadTask:(id)a4 isCurrentDeviceSession:(BOOL)a5 totalQueryCount:(unint64_t)a6 lastState:(int64_t)a7 lastInfo:(id)a8
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  [(FBKUploadStatusManager *)self stopTrackingTaskIfDeleted:v14];
  BOOL v16 = [(FBKUploadStatusManager *)self isTrackingTask:v14];
  long long v17 = Log_2();
  long long v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = [v13 identifier];
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_22A36D000, v18, OS_LOG_TYPE_INFO, "Polling session [%{public}@]", buf, 0xCu);
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke;
    v20[3] = &unk_264874CD0;
    v21 = v13;
    v22 = self;
    id v23 = v14;
    id v24 = v15;
    unint64_t v25 = a6;
    BOOL v26 = a5;
    +[FBKDEDHelper getStateOnSession:v21 withCompletion:v20];

    long long v18 = v21;
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    -[FBKUploadStatusManager(DEDPolling) pollDEDForSessionsStateOnActiveSession:uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:](v14, v18);
  }
}

void __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 domain];
    if ([v10 isEqualToString:@"com.apple.fbk.ded"])
    {
      uint64_t v11 = [v9 code];

      if (v11 == 105)
      {
        v12 = Log_2();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "Session polling timed out. Session might be finished and gone", buf, 2u);
        }

        id v13 = [MEMORY[0x263F3A150] sharedInstance];
        id v14 = [*(id *)(a1 + 32) identifier];
        int v15 = [v13 hasRecentlyFinishedSessionWithIdentifier:v14];

        BOOL v16 = Log_2();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v17)
          {
            long long v18 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138543362;
            v39 = v18;
            _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "DED has recently finished session [%{public}@]. Will report .uploadsFinished", buf, 0xCu);
          }
          [*(id *)(a1 + 40) didGetSessionStateUpdate:*(void *)(a1 + 32) uploadTask:*(void *)(a1 + 48) newState:7 sessionInfo:*(void *)(a1 + 56)];
        }
        else
        {
          if (v17)
          {
            id v23 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138543362;
            v39 = v23;
            _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "DED has NOT recently finished session [%{public}@]. Will report .uploadsFinished", buf, 0xCu);
          }
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v20 = Log_2();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v39 = v9;
      _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_DEFAULT, "Error getting session state [%{public}@]", buf, 0xCu);
    }
LABEL_22:

    goto LABEL_23;
  }
  v19 = (id *)(a1 + 32);
  [*(id *)(a1 + 40) didGetSessionStateUpdate:*(void *)(a1 + 32) uploadTask:*(void *)(a1 + 48) newState:a2 sessionInfo:v7];
  if (*(void *)(a1 + 64) >= 0x96uLL)
  {
    uint64_t v20 = Log_2();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v21 = [*v19 identifier];
    *(_DWORD *)buf = 138543362;
    v39 = v21;
    v22 = "Maxed out state polling on session [%{public}@]";
LABEL_21:
    _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);

    goto LABEL_22;
  }
  if (a2 == 1 || a2 == 7 || [*(id *)(a1 + 48) isDeleted])
  {
    uint64_t v20 = Log_2();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    v21 = [*v19 identifier];
    *(_DWORD *)buf = 138543362;
    v39 = v21;
    v22 = "State polling done on session [%{public}@]";
    goto LABEL_21;
  }
  uint64_t v24 = *(void *)(a1 + 64) + 1;
  unint64_t v25 = Log_2();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_cold_1((id *)(a1 + 32), v24, v25);
  }

  if (*(unsigned char *)(a1 + 72)) {
    int64_t v26 = 5000000000;
  }
  else {
    int64_t v26 = 15000000000;
  }
  dispatch_time_t v27 = dispatch_time(0, v26);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_29;
  block[3] = &unk_264874CA8;
  int8x16_t v30 = *(int8x16_t *)(a1 + 32);
  id v28 = (id)v30.i64[0];
  int8x16_t v32 = vextq_s8(v30, v30, 8uLL);
  id v29 = *(id *)(a1 + 48);
  char v37 = *(unsigned char *)(a1 + 72);
  id v33 = v29;
  uint64_t v35 = v24;
  uint64_t v36 = a2;
  id v34 = v7;
  dispatch_after(v27, MEMORY[0x263EF83A0], block);

LABEL_23:
}

uint64_t __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) pollDEDForSessionsStateOnActiveSession:*(void *)(a1 + 40) uploadTask:*(void *)(a1 + 48) isCurrentDeviceSession:*(unsigned __int8 *)(a1 + 80) totalQueryCount:*(void *)(a1 + 64) lastState:*(void *)(a1 + 72) lastInfo:*(void *)(a1 + 56)];
}

- (FBKUploadStatusManager)initWithData:(id)a3 ded:(id)a4 deviceManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)FBKUploadStatusManager;
  uint64_t v11 = [(FBKUploadStatusManager *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_data, v8);
    objc_storeStrong((id *)&v12->_ded, a4);
    objc_storeStrong((id *)&v12->_deviceManager, a5);
    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    submissionTimers = v12->_submissionTimers;
    v12->_submissionTimers = (NSMutableDictionary *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:5];
    trackedTasks = v12->_trackedTasks;
    v12->_trackedTasks = (NSMutableSet *)v15;

    BOOL v17 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v12->_shouldLogProgress = [v17 BOOLForKey:@"SpamLogsWithUploadProgress"];
  }
  return v12;
}

- (void)trackUploadIfNeeded:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 uploadTask];
  id v6 = Log_4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      uint64_t v11 = [v4 filerFormID];
      int v16 = 67109120;
      LODWORD(v17) = [v11 intValue];
      uint64_t v13 = "filer form [%i] has no upload tasks";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_14;
  }
  if (v7)
  {
    id v8 = [v4 filerFormID];
    int v16 = 136315394;
    BOOL v17 = "-[FBKUploadStatusManager trackUploadIfNeeded:]";
    __int16 v18 = 1024;
    int v19 = [v8 intValue];
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "%s [%i]", (uint8_t *)&v16, 0x12u);
  }
  BOOL v9 = [(FBKUploadStatusManager *)self isTrackingTask:v5];
  id v6 = Log_4();
  BOOL v10 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      uint64_t v11 = [v4 filerFormID];
      int v12 = [v11 intValue];
      int v16 = 67109120;
      LODWORD(v17) = v12;
      uint64_t v13 = "Already tracking upload task for form [%i]";
LABEL_9:
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 8u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v10)
  {
    id v14 = [v4 filerFormID];
    int v15 = [v14 intValue];
    int v16 = 67109120;
    LODWORD(v17) = v15;
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Will track upload task for form [%i]", (uint8_t *)&v16, 8u);
  }
  [(FBKUploadStatusManager *)self trackUploadTask:v5];
LABEL_14:
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(FBKUploadStatusManager *)self stopTrackingAllTasks];
  v4[2]();
}

- (void)trackUploadTask:(id)a3
{
}

- (void)trackUploadTask:(id)a3 attempt:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 1)
  {
    BOOL v9 = Log_4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [v6 taskIdentifier];
      *(_DWORD *)buf = 138543362;
      id v34 = v10;
      _os_log_impl(&dword_22A36D000, v9, OS_LOG_TYPE_DEFAULT, "recursive attempt to track upload task [%{public}@]", buf, 0xCu);
    }
    goto LABEL_8;
  }
  if (!a4)
  {
    BOOL v7 = Log_4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 taskIdentifier];
      *(_DWORD *)buf = 138543362;
      id v34 = v8;
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "will track upload task [%{public}@]", buf, 0xCu);
    }
    BOOL v9 = [(FBKUploadStatusManager *)self trackedTasks];
    [v9 addObject:v6];
LABEL_8:

LABEL_9:
    uint64_t v11 = [v6 formResponse];
    uint64_t v12 = [v6 feedbackFollowup];
    uint64_t v13 = Log_4();
    id v14 = v13;
    if (v11 | v12)
    {
      BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        int v16 = (void *)v12;
        if (v15)
        {
          BOOL v17 = [v6 taskIdentifier];
          int v18 = [v17 intValue];
          *(_DWORD *)buf = 67109120;
          LODWORD(v34) = v18;
          _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "tracking FFU backed task [%i]", buf, 8u);

          int v16 = (void *)v12;
        }
      }
      else
      {
        int v16 = (void *)v11;
        if (v15)
        {
          uint64_t v20 = [v6 taskIdentifier];
          int v21 = [v20 intValue];
          *(_DWORD *)buf = 67109120;
          LODWORD(v34) = v21;
          _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_DEFAULT, "tracking FR backed task [%i]", buf, 8u);

          int v16 = (void *)v11;
        }
      }

      id v19 = v16;
      if (([v19 isServerSideComplete] & 1) != 0
        || ([v19 promises],
            v22 = objc_claimAutoreleasedReturnValue(),
            BOOL v23 = [(FBKUploadStatusManager *)self shouldGiveUpOnUploadWithPromises:v22], v22, v23))
      {
        uint64_t v24 = Log_4();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v25 = [v19 filerFormID];
          int v26 = [v25 intValue];
          *(_DWORD *)buf = 67109120;
          LODWORD(v34) = v26;
          _os_log_impl(&dword_22A36D000, v24, OS_LOG_TYPE_DEFAULT, "task.form is complete according to server data. Deleting upload task on FilerForm [%i]", buf, 8u);
        }
        [(FBKUploadStatusManager *)self stopTrackingUploadTask:v6];
        [(FBKUploadStatusManager *)self reloadFilerFormForFinishedTask:v6];
      }
      else
      {
        dispatch_time_t v27 = Log_4();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v28 = [v6 taskIdentifier];
          unint64_t v29 = [v6 taskState];
          if (v29 > 8) {
            int8x16_t v30 = "Unknown";
          }
          else {
            int8x16_t v30 = off_264875D98[v29];
          }
          *(_DWORD *)buf = 138543618;
          id v34 = v28;
          __int16 v35 = 2082;
          uint64_t v36 = v30;
          _os_log_impl(&dword_22A36D000, v27, OS_LOG_TYPE_DEFAULT, "upload task [%{public}@ | %{public}s] is not done, will poll (and wait) for DED for updates", buf, 0x16u);
        }
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __50__FBKUploadStatusManager_trackUploadTask_attempt___block_invoke;
        v31[3] = &unk_264875B98;
        v31[4] = self;
        id v32 = v6;
        [(FBKUploadStatusManager *)self getAllBugSessionsForTask:v32 completion:v31];
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[FBKUploadStatusManager trackUploadTask:attempt:](v6);
      }

      [(FBKUploadStatusManager *)self stopTrackingUploadTask:v6];
      id v19 = [(FBKUploadStatusManager *)self data];
      [v19 deleteUploadForTask:v6 completion:0];
    }

    goto LABEL_33;
  }
  if (a4 < 2) {
    goto LABEL_9;
  }
  uint64_t v11 = Log_4();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
    -[FBKUploadStatusManager trackUploadTask:attempt:]((os_log_t)v11);
  }
LABEL_33:
}

void __50__FBKUploadStatusManager_trackUploadTask_attempt___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) waitOnUpdatesForTask:*(void *)(a1 + 40) withSessions:v5];
    [*(id *)(a1 + 32) pollDEDForSessionsStateOnTask:*(void *)(a1 + 40) sessions:v5];
  }
  else
  {
    id v6 = Log_4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [*(id *)(a1 + 40) taskIdentifier];
      int v12 = 134217984;
      uint64_t v13 = [v7 unsignedLongValue];
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Could not get all DED sessions for upload task [%lu]", (uint8_t *)&v12, 0xCu);
    }
    [*(id *)(a1 + 32) fallbackToServerSideUploadUpdatesForTask:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) didFailToConnectToSessionsOnTask:*(void *)(a1 + 40)];
  }
  id v8 = Log_4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [*(id *)(a1 + 40) taskIdentifier];
    int v10 = [v9 intValue];
    int v12 = 67109120;
    LODWORD(v13) = v10;
    _os_log_impl(&dword_22A36D000, v8, OS_LOG_TYPE_DEFAULT, "file promises might be collecting or compressing, will set long timeout for upload task [%i]", (uint8_t *)&v12, 8u);
  }
  id v11 = (id)[*(id *)(a1 + 32) configureSubmissionTimerForTask:*(void *)(a1 + 40) timeout:300.0];
}

- (BOOL)shouldGiveUpOnUploadWithPromises:(id)a3
{
  return [(FBKUploadStatusManager *)self shouldGiveUpOnUploadWithPromises:a3 stalenessDate:0];
}

- (BOOL)shouldGiveUpOnUploadWithPromises:(id)a3 stalenessDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v10 setDay:-1];
      id v11 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v12 = objc_alloc_init(MEMORY[0x263EFF910]);
      id v8 = [v11 dateByAddingComponents:v10 toDate:v12 options:0];
    }
    uint64_t v13 = [(FBKUploadStatusManager *)self workingFilePromisesFromSet:v6 stalenessDate:v8];
    BOOL v9 = [v13 count] == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)workingFilePromisesFromSet:(id)a3 stalenessDate:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__FBKUploadStatusManager_workingFilePromisesFromSet_stalenessDate___block_invoke;
  v9[3] = &unk_264875BC0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "ded_selectItemsPassingTest:", v9);

  return v7;
}

BOOL __67__FBKUploadStatusManager_workingFilePromisesFromSet_stalenessDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ((unint64_t)([v3 state] - 1) > 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v4 = [v3 updatedAt];
    BOOL v5 = [v4 compare:*(void *)(a1 + 32)] == 1;
  }
  id v6 = Log_4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v3 formResponse];
    id v8 = [v7 ID];
    int v9 = [v8 intValue];
    id v10 = [v3 uuid];
    uint64_t v11 = [v3 state];
    id v12 = "user_canceled";
    switch(v11)
    {
      case 0:
        break;
      case 1:
        id v12 = "promised";
        break;
      case 2:
        id v12 = "collected";
        break;
      case 3:
        id v12 = "uploading";
        break;
      case 4:
        id v12 = "uploaded";
        break;
      case 5:
        id v12 = "received";
        break;
      case 6:
        id v12 = "virus_scanning";
        break;
      case 7:
        id v12 = "analyzing:";
        break;
      case 8:
        id v12 = "done";
        break;
      case 9:
      case 10:
      case 11:
      case 12:
        goto LABEL_9;
      case 13:
        id v12 = "deleted";
        break;
      case 14:
        id v12 = "user_delete_requested";
        break;
      case 15:
        id v12 = "user_deleted";
        break;
      default:
        if (v11 == 99) {
          id v12 = "upload_error";
        }
        else {
LABEL_9:
        }
          id v12 = "Unknown";
        break;
    }
    v14[0] = 67109890;
    v14[1] = v9;
    __int16 v15 = 2114;
    int v16 = v10;
    __int16 v17 = 2082;
    int v18 = v12;
    __int16 v19 = 1024;
    BOOL v20 = !v5;
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "File promise for FR [%i] [%{public}@ - %{public}s] done? [%i]", (uint8_t *)v14, 0x22u);
  }
  return v5;
}

- (void)stopTrackingTaskIfDeleted:(id)a3
{
  id v4 = a3;
  if ([v4 isDeleted])
  {
    BOOL v5 = Log_4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[FBKUploadStatusManager stopTrackingTaskIfDeleted:](v4);
    }

    [(FBKUploadStatusManager *)self stopTrackingUploadTask:v4];
  }
}

- (void)waitOnUpdatesForTask:(id)a3 withSessions:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setUploadDelegate:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)getAllBugSessionsForTask:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FBKUploadStatusManager *)self deviceManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke;
  v11[3] = &unk_264874388;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 runAfterScan:v11];
}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke(id *a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v2 = dispatch_group_create();
  id v3 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v4 = [a1[4] bugSessions];
  dispatch_time_t v27 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  id v5 = Log_4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_2(a1 + 4, v5);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = [a1[4] bugSessions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
  uint64_t v8 = v27;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v30 = *(void *)v39;
    uint64_t v28 = *MEMORY[0x263F3A0B8];
    unint64_t v29 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
        dispatch_group_enter(v2);
        id v12 = [a1[5] ded];
        long long v13 = [v11 identifier];
        id v14 = [v12 sessionForIdentifier:v13];

        if (v14)
        {
          [v8 addObject:v14];
          dispatch_group_leave(v2);
        }
        else
        {
          uint64_t v15 = [a1[5] deviceManager];
          int v16 = [v11 deviceFromManager:v15];

          if (v16)
          {
            __int16 v17 = [MEMORY[0x263EFFA08] setWithObject:v28];
            char v18 = [v16 hasCapabilities:v17];

            __int16 v19 = Log_4();
            BOOL v20 = v19;
            if (v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
                __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_1(v42, v11, &v43, v20);
              }

              uint64_t v21 = [v11 identifier];
              v22 = [v11 deviceIdentifier];
              v35[0] = MEMORY[0x263EF8330];
              v35[1] = 3221225472;
              v35[2] = __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_41;
              v35[3] = &unk_264875BE8;
              v35[4] = v11;
              uint64_t v36 = v2;
              id v37 = v27;
              +[FBKDEDHelper reconnectWithBugSessionWithIdentifier:v21 deviceIdentifier:v22 completion:v35];

              uint64_t v8 = v27;
            }
            else
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v25 = [v11 identifier];
                *(_DWORD *)buf = 138543362;
                v45 = v25;
                _os_log_impl(&dword_22A36D000, v20, OS_LOG_TYPE_DEFAULT, "Device does not support session restart. Cannot poll session [%{public}@]", buf, 0xCu);
              }
              dispatch_group_leave(v2);
            }
            id v6 = v29;
          }
          else
          {
            BOOL v23 = Log_4();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v11 identifier];
              *(_DWORD *)buf = 138543362;
              v45 = v24;
              _os_log_impl(&dword_22A36D000, v23, OS_LOG_TYPE_DEFAULT, "Could not find active device. Cannot reconnect to session [%{public}@]", buf, 0xCu);
            }
            dispatch_group_leave(v2);
          }
        }
        ++v10;
      }
      while (v9 != v10);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v9);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_43;
  block[3] = &unk_264874388;
  id v32 = a1[4];
  id v33 = v8;
  id v34 = a1[6];
  id v26 = v8;
  dispatch_group_notify(v2, MEMORY[0x263EF83A0], block);
}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = Log_4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      int v10 = 138543362;
      long long v11 = v8;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Failed to reconnect with session [%{public}@]", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 32) identifier];
      int v10 = 138543362;
      long long v11 = v9;
      _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_DEFAULT, "Reconnected with session [%{public}@]", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 48) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_43(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bugSessions];
  uint64_t v3 = [v2 count];
  BOOL v4 = v3 == [*(id *)(a1 + 40) count];

  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [MEMORY[0x263EFFA08] setWithSet:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id, BOOL))(v5 + 16))(v5, v6, v4);
}

- (void)fallbackToServerSideUploadUpdatesForTask:(id)a3
{
}

- (void)fallbackToServerSideUploadUpdatesForTask:(id)a3 attempts:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (([v6 isDeleted] & 1) != 0
    || ![(FBKUploadStatusManager *)self isTrackingTask:v6])
  {
    uint64_t v8 = Log_4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[FBKUploadStatusManager fallbackToServerSideUploadUpdatesForTask:attempts:](v8);
    }
  }
  else
  {
    if (!a4)
    {
      BOOL v7 = [(FBKUploadStatusManager *)self data];
      [v7 updateTask:v6 withSubmissionStage:8];
    }
    uint64_t v8 = [v6 filerForm];
    if (v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v9 setMinute:-60];
      int v10 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v11 = objc_alloc_init(MEMORY[0x263EFF910]);
      uint64_t v12 = [v10 dateByAddingComponents:v9 toDate:v11 options:0];

      long long v13 = [v8 promises];
      id v14 = [(FBKUploadStatusManager *)self workingFilePromisesFromSet:v13 stalenessDate:v12];
      uint64_t v15 = (void *)[v14 count];

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke;
      aBlock[3] = &unk_264875C38;
      id v16 = v6;
      id v38 = v16;
      objc_copyWeak(v41, &location);
      uint64_t v8 = v8;
      long long v39 = v8;
      id v32 = v12;
      id v40 = v32;
      v41[1] = (id)a4;
      v41[2] = v15;
      __int16 v17 = _Block_copy(aBlock);
      char v18 = [v16 formResponse];

      __int16 v19 = Log_4();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          uint64_t v21 = [v16 formResponse];
          v22 = [v21 ID];
          int v23 = [v22 intValue];
          *(_DWORD *)buf = 67109376;
          int v44 = v23;
          __int16 v45 = 2048;
          unint64_t v46 = a4;
          _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "refreshing FR [%i] for upload tracking, attempt [%lu]", buf, 0x12u);
        }
        uint64_t v24 = [(FBKUploadStatusManager *)self data];
        unint64_t v25 = [v16 formID];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_47;
        v35[3] = &unk_264875C60;
        id v36 = v17;
        [v24 refreshFormResponseOnlyWithID:v25 completion:v35];
        id v26 = &v36;
      }
      else
      {
        if (v20)
        {
          uint64_t v28 = [v16 feedbackFollowup];
          unint64_t v29 = [v28 ID];
          int v30 = [v29 intValue];
          *(_DWORD *)buf = 67109376;
          int v44 = v30;
          __int16 v45 = 2048;
          unint64_t v46 = a4;
          _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "refreshing FFU [%i] for upload tracking, attempt [%lu]", buf, 0x12u);
        }
        uint64_t v24 = [(FBKUploadStatusManager *)self data];
        unint64_t v25 = [v16 feedbackFollowup];
        v31 = [v25 ID];
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_49;
        v33[3] = &unk_264875C88;
        id v34 = v17;
        [v24 feedbackFollowupForID:v31 completion:v33];

        id v26 = &v34;
      }

      objc_destroyWeak(v41);
      objc_destroyWeak(&location);
    }
    else
    {
      dispatch_time_t v27 = Log_4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[FBKUploadStatusManager fallbackToServerSideUploadUpdatesForTask:attempts:](v6);
      }

      [(FBKUploadStatusManager *)self didFailToGetUploadUpdatesForUploadTask:v6 shouldTryServerUpdates:0];
    }
  }
}

void __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = Log_4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_cold_1(a1);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained stopTrackingUploadTask:*(void *)(a1 + 32)];
    goto LABEL_11;
  }
  if (([*(id *)(a1 + 40) isServerSideComplete] & 1) != 0
    || (id v6 = (id *)(a1 + 56),
        id v7 = objc_loadWeakRetained((id *)(a1 + 56)),
        [*(id *)(a1 + 40) promises],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 shouldGiveUpOnUploadWithPromises:v8 stalenessDate:*(void *)(a1 + 48)],
        v8,
        v7,
        v9))
  {
    int v10 = Log_4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [*(id *)(a1 + 40) filerFormID];
      *(_DWORD *)buf = 67109120;
      int v27 = [v11 intValue];
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_DEFAULT, "task FR/FFU is complete or stale according to server data. Deleting upload task on FilerForm [%i]", buf, 8u);
    }
    id v6 = (id *)(a1 + 56);
LABEL_10:
    id v12 = objc_loadWeakRetained(v6);
    [v12 stopTrackingUploadTask:*(void *)(a1 + 32)];

    id WeakRetained = objc_loadWeakRetained(v6);
    [WeakRetained reloadFilerFormForFinishedTask:*(void *)(a1 + 32)];
LABEL_11:

    goto LABEL_12;
  }
  if (*(void *)(a1 + 64) >= 0x14uLL)
  {
    long long v13 = Log_4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [*(id *)(a1 + 40) filerFormID];
      *(_DWORD *)buf = 67109632;
      int v27 = 20;
      __int16 v28 = 1024;
      int v29 = 10;
      __int16 v30 = 1024;
      int v31 = [v14 intValue];
      _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "FR/FFU uploads have not finished after [%d] attempts every [%d] seconds. Deleting upload task on FilerForm [%i]", buf, 0x14u);
    }
    goto LABEL_10;
  }
  id v15 = objc_loadWeakRetained((id *)(a1 + 56));
  id v16 = [*(id *)(a1 + 40) promises];
  __int16 v17 = [v15 workingFilePromisesFromSet:v16 stalenessDate:*(void *)(a1 + 48)];
  unint64_t v18 = [v17 count];

  if (*(void *)(a1 + 72) <= v18)
  {
    uint64_t v21 = *(void *)(a1 + 64) + 1;
  }
  else
  {
    __int16 v19 = Log_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [*(id *)(a1 + 40) filerFormID];
      *(_DWORD *)buf = 67109120;
      int v27 = [v20 intValue];
      _os_log_impl(&dword_22A36D000, v19, OS_LOG_TYPE_DEFAULT, "reseting refresh count for FR/FFU [%i]", buf, 8u);
    }
    uint64_t v21 = 1;
  }
  dispatch_time_t v22 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_45;
  block[3] = &unk_264875C10;
  objc_copyWeak(v25, (id *)(a1 + 56));
  id v24 = *(id *)(a1 + 32);
  v25[1] = (id)v21;
  dispatch_after(v22, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(v25);
LABEL_12:
}

void __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_45(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained fallbackToServerSideUploadUpdatesForTask:*(void *)(a1 + 32) attempts:*(void *)(a1 + 48)];
}

uint64_t __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)configureSubmissionTimerForTask:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  id v7 = [(FBKUploadStatusManager *)self submissionTimers];
  uint64_t v8 = [v6 objectID];
  int v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    int v10 = Log_4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[FBKUploadStatusManager configureSubmissionTimerForTask:timeout:](v10);
    }

    int v9 = [[FBKSubmissionTimer alloc] initWithDelegate:self forTask:v6 initialTimeout:a4];
    id v11 = [(FBKUploadStatusManager *)self submissionTimers];
    id v12 = [v6 objectID];
    [v11 setObject:v9 forKey:v12];
  }

  return v9;
}

- (void)didFailToGetUploadUpdatesForUploadTask:(id)a3 shouldTryServerUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4)
  {
    [(FBKUploadStatusManager *)self fallbackToServerSideUploadUpdatesForTask:v6];
  }
  else
  {
    id v7 = Log_4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 taskIdentifier];
      v9[0] = 67109120;
      v9[1] = [v8 intValue];
      _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "could not get upload updates for task [%i], giving up and deleting upload task", (uint8_t *)v9, 8u);
    }
    [(FBKUploadStatusManager *)self stopTrackingUploadTask:v6];
    [(FBKUploadStatusManager *)self reloadFilerFormForFinishedTask:v6];
  }
}

- (void)didFailToGetUploadUpdatesForUploadTask:(id)a3
{
}

- (void)reloadFilerFormForFinishedTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 feedbackFollowup];
  if (v5
    && (id v6 = (void *)v5,
        [v4 feedbackFollowup],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isDeleted],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    id v14 = [(FBKUploadStatusManager *)self data];
    id v15 = [v4 feedbackFollowup];
    id v16 = [v15 ID];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke;
    v24[3] = &unk_264875CB0;
    v24[4] = self;
    id v25 = v4;
    [v14 feedbackFollowupForID:v16 completion:v24];
  }
  else
  {
    uint64_t v9 = [v4 formResponse];
    if (v9
      && (uint64_t v10 = (void *)v9,
          [v4 formResponse],
          id v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 isDeleted],
          v11,
          v10,
          (v12 & 1) == 0))
    {
      __int16 v17 = [v4 formResponse];
      unint64_t v18 = [v17 contentItem];
      __int16 v19 = [v18 feedback];

      if (v19)
      {
        BOOL v20 = [(FBKUploadStatusManager *)self data];
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke_2;
        v22[3] = &unk_264875CD8;
        v22[4] = self;
        id v23 = v4;
        [v20 getFormResponseStubForFeedback:v19 forceRefresh:1 completion:v22];
      }
      else
      {
        [(FBKUploadStatusManager *)self deleteAndNotifyUploadTaskWithTask:v4];
      }
    }
    else
    {
      long long v13 = Log_4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_DEFAULT, "Upload task somehow has no FB or FFU", v21, 2u);
      }

      [(FBKUploadStatusManager *)self deleteAndNotifyUploadTaskWithTask:v4];
    }
  }
}

uint64_t __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteAndNotifyUploadTaskWithTask:*(void *)(a1 + 40)];
}

uint64_t __57__FBKUploadStatusManager_reloadFilerFormForFinishedTask___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteAndNotifyUploadTaskWithTask:*(void *)(a1 + 40)];
}

- (void)deleteAndNotifyUploadTaskWithTask:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [v4 filerForm];
  id v6 = [(FBKUploadStatusManager *)self data];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke;
  v9[3] = &unk_264875D00;
  id v7 = v4;
  id v10 = v7;
  objc_copyWeak(&v12, &location);
  id v8 = v5;
  id v11 = v8;
  [v6 deleteUploadForTask:v7 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = Log_4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke_cold_1(a1);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained data];
  id v7 = [v6 notificationCenter];
  [v7 postNotificationName:@"FBKFormUploadStatusChangeNotification" object:*(void *)(a1 + 40)];
}

- (BOOL)isTrackingTask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBKUploadStatusManager *)self trackedTasks];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)stopTrackingAllTasks
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(FBKUploadStatusManager *)self trackedTasks];
  id v4 = (void *)[v3 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(FBKUploadStatusManager *)self stopTrackingUploadTask:*(void *)(*((void *)&v12 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  id v10 = Log_4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Removed all tracked tasks.", v11, 2u);
  }
}

- (void)stopTrackingUploadTask:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FBKUploadStatusManager *)self trackedTasks];
  [v5 removeObject:v4];

  uint64_t v6 = Log_4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = [v4 taskIdentifier];
    int v13 = 134217984;
    uint64_t v14 = [v7 unsignedIntegerValue];
    _os_log_impl(&dword_22A36D000, v6, OS_LOG_TYPE_INFO, "Removing tracked task [%lu] from list.", (uint8_t *)&v13, 0xCu);
  }
  uint64_t v8 = [(FBKUploadStatusManager *)self submissionTimers];
  uint64_t v9 = [v4 objectID];
  [v8 removeObjectForKey:v9];

  id v10 = Log_4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v4 taskIdentifier];
    uint64_t v12 = [v11 unsignedIntegerValue];
    int v13 = 134217984;
    uint64_t v14 = v12;
    _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "No longer tracking task [%lu]", (uint8_t *)&v13, 0xCu);
  }
}

- (void)timer:(id)a3 didTimeoutForTask:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(FBKUploadStatusManager *)self isTrackingTask:v7])
  {
    uint64_t v8 = [(FBKUploadStatusManager *)self data];
    uint64_t v9 = [v8 mainQueueContext];
    id v10 = [v7 objectID];
    id v11 = [v9 objectWithID:v10];

    uint64_t v12 = Log_4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      [v6 currentInterval];
      uint64_t v14 = v13;
      uint64_t v15 = [v11 taskIdentifier];
      int v19 = 134218240;
      uint64_t v20 = v14;
      __int16 v21 = 1024;
      int v22 = [v15 intValue];
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "submission timer [%lf] for task id [%i] timed out", (uint8_t *)&v19, 0x12u);
    }
    if (v11)
    {
      [(FBKUploadStatusManager *)self didFailToGetUploadUpdatesForUploadTask:v11];
    }
    else
    {
      id v16 = Log_4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [v7 taskIdentifier];
        int v18 = [v17 intValue];
        int v19 = 67109120;
        LODWORD(v20) = v18;
        _os_log_impl(&dword_22A36D000, v16, OS_LOG_TYPE_DEFAULT, "timer callback with upload task [%i], but task no longer exists in context", (uint8_t *)&v19, 8u);
      }
    }
  }
  else
  {
    id v11 = Log_4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[FBKUploadStatusManager timer:didTimeoutForTask:](v7, v11);
    }
  }
}

- (void)didFailToConnectToSessionsOnTask:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FBKUploadStatusManager *)self deviceManager];
  id v6 = [v5 thisDevice];
  id v7 = [v6 identifier];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [v4 bugSessions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v25 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = [*(id *)(*((void *)&v24 + 1) + 8 * v12) deviceIdentifier];
      int v14 = [v13 isEqualToString:v7];

      if (!v14) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    uint64_t v15 = Log_4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_DEFAULT, "Failed to poll one device local session. Will time out if no upload progress comes in", buf, 2u);
    }

    id v16 = [v4 bytesUploaded];
    uint64_t v17 = [v16 unsignedIntValue];

    dispatch_time_t v18 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__FBKUploadStatusManager_didFailToConnectToSessionsOnTask___block_invoke;
    block[3] = &unk_264875D28;
    __int16 v21 = self;
    uint64_t v22 = v17;
    id v20 = v4;
    dispatch_after(v18, MEMORY[0x263EF83A0], block);
    uint64_t v8 = v20;
  }
}

void __59__FBKUploadStatusManager_didFailToConnectToSessionsOnTask___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bytesUploaded];
  int v3 = [v2 unsignedIntValue];

  if (*(void *)(a1 + 48) == v3)
  {
    id v4 = Log_4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_22A36D000, v4, OS_LOG_TYPE_DEFAULT, "Failed to poll one device local session. Deleting upload task", v5, 2u);
    }

    [*(id *)(a1 + 40) stopTrackingUploadTask:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) reloadFilerFormForFinishedTask:*(void *)(a1 + 32)];
  }
}

- (void)didGetSessionStateUpdate:(id)a3 uploadTask:(id)a4 newState:(int64_t)a5 sessionInfo:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (char *)a6;
  uint64_t v13 = Log_4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a5 + 1) > 9) {
      int v14 = "Unknown";
    }
    else {
      int v14 = off_264875DE0[a5 + 1];
    }
    uint64_t v15 = [v10 identifier];
    id v16 = [v11 taskIdentifier];
    int v25 = 136446722;
    long long v26 = v14;
    __int16 v27 = 2114;
    __int16 v28 = v15;
    __int16 v29 = 2114;
    __int16 v30 = v16;
    _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_INFO, "Session update: state: [%{public}s], session: [%{public}@], task: [%{public}@]", (uint8_t *)&v25, 0x20u);
  }
  if ([(FBKUploadStatusManager *)self shouldLogProgress])
  {
    uint64_t v17 = Log_4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v25 = 138543362;
      long long v26 = v12;
      _os_log_impl(&dword_22A36D000, v17, OS_LOG_TYPE_INFO, "Session update: state  info: [%{public}@]", (uint8_t *)&v25, 0xCu);
    }
  }
  dispatch_time_t v18 = [v12 objectForKeyedSubscript:@"finisher"];
  int v19 = [v18 objectForKeyedSubscript:@"bytes_uploaded"];
  uint64_t v20 = [v19 unsignedIntValue];

  __int16 v21 = [v12 objectForKeyedSubscript:@"finisher"];
  uint64_t v22 = [v21 objectForKeyedSubscript:@"total_bytes_to_upload"];
  uint64_t v23 = [v22 unsignedIntValue];

  if (a5 == 7) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = v20;
  }
  [(FBKUploadStatusManager *)self updateUploadTask:v11 withUploadProgress:v24 uploadSize:v23 onBugSession:v10 state:a5];
}

- (void)uploadProgress:(unint64_t)a3 total:(int64_t)a4 session:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [v8 identifier];
  id v10 = [(FBKUploadStatusManager *)self data];
  id v11 = [v10 mainQueueContext];

  uint64_t v12 = +[FBKUploadTask fetchRequest];
  uint64_t v13 = (void *)MEMORY[0x263F08A98];
  int v14 = [v8 identifier];
  uint64_t v15 = [v13 predicateWithFormat:@"ANY bugSessions.identifier == %@", v14];
  [v12 setPredicate:v15];

  id v20 = 0;
  id v16 = [v11 executeFetchRequest:v12 error:&v20];
  id v17 = v20;
  dispatch_time_t v18 = [v16 firstObject];

  if (!v18 || v17)
  {
    int v19 = Log_4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FBKUploadStatusManager uploadProgress:total:session:]();
    }

    [v8 setUploadDelegate:0];
  }
  else
  {
    [(FBKUploadStatusManager *)self updateUploadTask:v18 withUploadProgress:a3 uploadSize:a4 onBugSession:v8 state:-2];
  }
}

- (void)updateUploadTask:(id)a3 withUploadProgress:(unint64_t)a4 uploadSize:(unint64_t)a5 onBugSession:(id)a6 state:(int64_t)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  if ([(FBKUploadStatusManager *)self shouldLogProgress])
  {
    int v14 = Log_4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
      id v16 = [NSNumber numberWithUnsignedInteger:a5];
      id v17 = [v13 identifier];
      *(_DWORD *)buf = 136315906;
      v42 = "-[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:]";
      __int16 v43 = 2112;
      int v44 = v15;
      __int16 v45 = 2112;
      unint64_t v46 = v16;
      __int16 v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "%s %@ of %@ for %@", buf, 0x2Au);
    }
  }
  [(FBKUploadStatusManager *)self stopTrackingTaskIfDeleted:v12];
  if ([(FBKUploadStatusManager *)self isTrackingTask:v12])
  {
    dispatch_time_t v18 = [v12 bugSessions];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __92__FBKUploadStatusManager_updateUploadTask_withUploadProgress_uploadSize_onBugSession_state___block_invoke;
    v39[3] = &unk_264875D50;
    id v19 = v13;
    id v40 = v19;
    id v20 = objc_msgSend(v18, "ded_findWithBlock:", v39);

    if (v20)
    {
      __int16 v21 = [NSNumber numberWithUnsignedInteger:a5];
      [v20 setBytesToUpload:v21];

      uint64_t v22 = [NSNumber numberWithUnsignedInteger:a4];
      [v20 setBytesUploaded:v22];

      [v20 setState:a7];
      uint64_t v23 = [(FBKUploadStatusManager *)self configureSubmissionTimerForTask:v12 timeout:30.0];
      [v12 updateBytesToUploadAndUploadedAfterBugSessionUpdate];
      uint64_t v24 = [v12 newSubmissionStageAfterBugSessionUpdate];
      if (v24 != [v12 localSubmissionStage])
      {
        int v25 = [(FBKUploadStatusManager *)self data];
        [v25 updateTask:v12 withSubmissionStage:v24];
      }
      switch(v24)
      {
        case 2:
        case 8:
          double v26 = 300.0;
          goto LABEL_15;
        case 4:
          double v26 = 25.0;
LABEL_15:
          [v23 resetTimerWithInterval:v26];
          break;
        case 6:
          __int16 v29 = Log_4();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v30 = [v12 taskIdentifier];
            int v31 = [v30 intValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = v31;
            _os_log_impl(&dword_22A36D000, v29, OS_LOG_TYPE_DEFAULT, "Finished all uploads for upload task [%i]. Deleting upload task", buf, 8u);
          }
          [v19 setUploadDelegate:0];
          [(FBKUploadStatusManager *)self stopTrackingUploadTask:v12];
          [(FBKUploadStatusManager *)self reloadFilerFormForFinishedTask:v12];
          break;
        default:
          break;
      }
      uint64_t v32 = [(FBKUploadStatusManager *)self data];
      id v33 = [v32 mainQueueContext];

      if ([v33 hasChanges])
      {
        id v34 = Log_4();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:](v19);
        }

        id v38 = 0;
        [v33 save:&v38];
        id v35 = v38;
        if (v35)
        {
          id v36 = v35;
          id v37 = Log_4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[FBKUploadStatusManager updateUploadTask:withUploadProgress:uploadSize:onBugSession:state:](v36);
          }
        }
      }
    }
    else
    {
      __int16 v27 = Log_4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v28 = [v19 identifier];
        *(_DWORD *)buf = 138543362;
        v42 = v28;
        _os_log_impl(&dword_22A36D000, v27, OS_LOG_TYPE_DEFAULT, "FBK bug session is nil for ded session [%{public}@] in upload status callback, upload must be done", buf, 0xCu);
      }
      [v19 setUploadDelegate:0];
    }
  }
}

uint64_t __92__FBKUploadStatusManager_updateUploadTask_withUploadProgress_uploadSize_onBugSession_state___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (FBKData)data
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_data);

  return (FBKData *)WeakRetained;
}

- (void)setData:(id)a3
{
}

- (DEDController)ded
{
  return (DEDController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDed:(id)a3
{
}

- (FBKDeviceManager)deviceManager
{
  return (FBKDeviceManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceManager:(id)a3
{
}

- (NSMutableSet)trackedTasks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTrackedTasks:(id)a3
{
}

- (NSMutableDictionary)submissionTimers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubmissionTimers:(id)a3
{
}

- (BOOL)shouldLogProgress
{
  return self->_shouldLogProgress;
}

- (void)setShouldLogProgress:(BOOL)a3
{
  self->_shouldLogProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimers, 0);
  objc_storeStrong((id *)&self->_trackedTasks, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_ded, 0);

  objc_destroyWeak((id *)&self->_data);
}

void __146__FBKUploadStatusManager_DEDPolling__pollDEDForSessionsStateOnActiveSession_uploadTask_isCurrentDeviceSession_totalQueryCount_lastState_lastInfo___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [*a1 identifier];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_22A36D000, a3, OS_LOG_TYPE_DEBUG, "Polling session [%{public}@] again, query count [%lu]", (uint8_t *)&v6, 0x16u);
}

- (void)trackUploadTask:(os_log_t)log attempt:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "failed to refresh stub form for upload tracking", v1, 2u);
}

- (void)trackUploadTask:(void *)a1 attempt:.cold.2(void *a1)
{
  v1 = [a1 taskIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "given task to track [%{public}@] has no parent: deleting", v4, v5, v6, v7, v8);
}

- (void)stopTrackingTaskIfDeleted:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 taskIdentifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_6(&dword_22A36D000, v2, v3, "Upload task [%{public}@] has been deleted. Will stop tracking", v4, v5, v6, v7, v8);
}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_22A36D000, a4, OS_LOG_TYPE_DEBUG, "Will reconnect with session [%{public}@]", a1, 0xCu);
}

void __62__FBKUploadStatusManager_getAllBugSessionsForTask_completion___block_invoke_cold_2(id *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*a1 taskIdentifier];
  uint64_t v5 = [v4 unsignedLongValue];
  uint64_t v6 = [*a1 bugSessions];
  uint64_t v7 = [v6 valueForKey:@"identifier"];
  int v8 = 134218242;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  id v11 = v7;
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "Task [%lu] has sessions [%{public}@]", (uint8_t *)&v8, 0x16u);
}

- (void)fallbackToServerSideUploadUpdatesForTask:(os_log_t)log attempts:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Given task is already deleted or no longer tracked. Server-side updates not needed", v1, 2u);
}

- (void)fallbackToServerSideUploadUpdatesForTask:(void *)a1 attempts:.cold.2(void *a1)
{
  v1 = [a1 taskIdentifier];
  [v1 intValue];
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 8u);
}

void __76__FBKUploadStatusManager_fallbackToServerSideUploadUpdatesForTask_attempts___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) formID];
  [v1 intValue];
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

- (void)configureSubmissionTimerForTask:(os_log_t)log timeout:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22A36D000, log, OS_LOG_TYPE_DEBUG, "creating new timer", v1, 2u);
}

void __60__FBKUploadStatusManager_deleteAndNotifyUploadTaskWithTask___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) taskIdentifier];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_5();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);
}

- (void)timer:(void *)a1 didTimeoutForTask:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  os_log_t v3 = [a1 taskIdentifier];
  v4[0] = 67109120;
  v4[1] = [v3 intValue];
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "Timer fired for task no longer tracked [%i], ignoring it", (uint8_t *)v4, 8u);
}

- (void)uploadProgress:total:session:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_22A36D000, v1, OS_LOG_TYPE_ERROR, "_uploadProgress could not find Upload Task for session [%{public}@], error [%{public}@]", v2, 0x16u);
}

- (void)updateUploadTask:(void *)a1 withUploadProgress:uploadSize:onBugSession:state:.cold.1(void *a1)
{
  os_log_t v1 = [a1 description];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22A36D000, v2, v3, "_uploadProgress error saving [%{public}@]", v4, v5, v6, v7, v8);
}

- (void)updateUploadTask:(void *)a1 withUploadProgress:uploadSize:onBugSession:state:.cold.2(void *a1)
{
  os_log_t v1 = [a1 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_6(&dword_22A36D000, v2, v3, "saving upload progress on session [%{public}@]", v4, v5, v6, v7, v8);
}

@end