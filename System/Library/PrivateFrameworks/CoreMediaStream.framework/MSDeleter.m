@interface MSDeleter
+ (BOOL)isInRetryState;
+ (id)_clearInstantiatedDeletersByPersonID;
+ (id)deleterForPersonID:(id)a3;
+ (id)existingDeleterForPersonID:(id)a3;
+ (id)nextActivityDate;
+ (id)nextActivityDateForPersonID:(id)a3;
+ (id)personIDsWithOutstandingActivities;
+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4;
+ (void)abortAllActivities;
+ (void)forgetPersonID:(id)a3;
+ (void)stopAllActivities;
- (BOOL)_isAllowedToDelete;
- (BOOL)_isInRetryState;
- (MSDeleter)initWithPersonID:(id)a3 baseURL:(id)a4;
- (MSDeleterDelegate)delegate;
- (MSMediaStreamDaemon)daemon;
- (id)_abortedError;
- (int)batchSize;
- (void)_abort;
- (void)_forget;
- (void)_sendDeleteRequest;
- (void)_stop;
- (void)_updateMasterManifest;
- (void)deactivate;
- (void)dealloc;
- (void)deleteAssetCollections:(id)a3;
- (void)deleteProtocol:(id)a3 didFinishSuccessfulCollections:(id)a4 failedCollections:(id)a5 error:(id)a6;
- (void)deleteProtocol:(id)a3 didReceiveAuthenticationError:(id)a4;
- (void)performOutstandingActivities;
- (void)setBatchSize:(int)a3;
- (void)setDaemon:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSDeleter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedDeleteWrappers, 0);
  objc_storeStrong((id *)&self->_deleteQueue, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

- (void)setBatchSize:(int)a3
{
  self->_batchSize = a3;
}

- (int)batchSize
{
  return self->_batchSize;
}

- (void)setDaemon:(id)a3
{
  self->_daemon = (MSMediaStreamDaemon *)a3;
}

- (MSMediaStreamDaemon)daemon
{
  return self->_daemon;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSDeleterDelegate *)a3;
}

- (MSDeleterDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)_isInRetryState
{
  return self->_state == 1;
}

- (void)_forget
{
  self->_deleteQueue = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_abort
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(MSDeleter *)self _stop];
  v3 = [(MSDeleter *)self _abortedError];
  v4 = [(MSObjectQueue *)self->_deleteQueue allObjectWrappersMaxCount:5];
  while ([v4 count])
  {
    v5 = (void *)MEMORY[0x1E019E3B0]();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          delegate = self->_delegate;
          v12 = [*(id *)(*((void *)&v13 + 1) + 8 * i) object];
          [(MSDeleterDelegate *)delegate deleter:self didFinishDeletingAssetCollection:v12 error:v3];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(MSObjectQueue *)self->_deleteQueue removeObjectWrappersFromQueue:v6];
    v4 = [(MSObjectQueue *)self->_deleteQueue allObjectWrappersMaxCount:5];
  }
  [(MSDeleter *)self _updateMasterManifest];
}

- (id)_abortedError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_DELETER_ABORTED");
  v4 = [v2 MSErrorWithDomain:@"MSDeleterErrorDomain" code:0 description:v3];

  return v4;
}

- (void)_stop
{
  int state = self->_state;
  if (state == 3)
  {
    [(MSDeleteStreamsProtocol *)self->_protocol abort];
    int state = self->_state;
  }
  if ((state & 0xFFFFFFFE) == 2) {
    [(MSDaemon *)self->_daemon releaseBusy];
  }
  [(NSMutableArray *)self->_requestedDeleteWrappers removeAllObjects];
  self->_int state = 0;
}

- (void)deleteProtocol:(id)a3 didFinishSuccessfulCollections:(id)a4 failedCollections:(id)a5 error:(id)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int state = self->_state;
  if (state == 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      v45 = objc_opt_class();
      id v46 = v10;
      id v47 = v45;
      v48 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138544130;
      *(void *)v84 = v45;
      *(_WORD *)&v84[8] = 2112;
      v85 = v48;
      __int16 v86 = 2114;
      uint64_t v87 = (uint64_t)v11;
      __int16 v88 = 2114;
      id v89 = v12;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Received delete response. Successful deletes: %{public}@\n\nFailed deletes: %{public}@", buf, 0x2Au);

      id v10 = v46;
    }
    long long v15 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
    if (v13)
    {
      int v16 = [v13 MSIsTemporaryNetworkError];
      BOOL v17 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        if (v17)
        {
          v49 = objc_opt_class();
          id v50 = v10;
          id v51 = v49;
          v52 = [(MSCupidStateMachine *)self personID];
          *(_DWORD *)buf = 138543618;
          *(void *)v84 = v49;
          *(_WORD *)&v84[8] = 2112;
          v85 = v52;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered temporary network issues during deletion. Will retry later.", buf, 0x16u);

          long long v15 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
          id v10 = v50;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v84 = v13;
          _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "... Error: %{public}@", buf, 0xCu);
        }
        char v18 = 1;
      }
      else
      {
        if (v17)
        {
          v53 = objc_opt_class();
          id v61 = v53;
          v54 = [(MSCupidStateMachine *)self personID];
          [v13 MSVerboseDescription];
          v56 = id v55 = v10;
          *(_DWORD *)buf = 138543874;
          *(void *)v84 = v53;
          *(_WORD *)&v84[8] = 2112;
          v85 = v54;
          __int16 v86 = 2114;
          uint64_t v87 = (uint64_t)v56;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error sending delete request: %{public}@", buf, 0x20u);

          id v10 = v55;
          long long v15 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
        }
        v23 = [MEMORY[0x1E4F1CA48] array];
        if ([v13 MSNeedsBackoff]) {
          [(MSCupidStateMachine *)self _backoffStreamsBackoffTimer];
        }
        id v65 = v12;
        if ([v13 MSIsCounted])
        {
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          id v63 = v10;
          v24 = self->_requestedDeleteWrappers;
          uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v72 objects:v81 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v73;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v73 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v72 + 1) + 8 * i);
                objc_msgSend(v29, "setErrorCount:", objc_msgSend(v29, "errorCount") + 1);
                if ((int)[v29 errorCount] >= self->_maxErrorCount) {
                  [v23 addObject:v29];
                }
              }
              uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v72 objects:v81 count:16];
            }
            while (v26);
          }

          [(MSObjectQueue *)self->_deleteQueue commitErrorCountsForObjectWrappers:self->_requestedDeleteWrappers];
          id v10 = v63;
          id v12 = v65;
          long long v15 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
        }
        if ([v23 count])
        {
          id v30 = v10;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v57 = objc_opt_class();
            id v58 = v57;
            v59 = [(MSCupidStateMachine *)self personID];
            uint64_t v60 = [v23 count];
            *(_DWORD *)buf = 138543874;
            *(void *)v84 = v57;
            *(_WORD *)&v84[8] = 2112;
            v85 = v59;
            __int16 v86 = 2048;
            uint64_t v87 = v60;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Giving up sending %lu delete requests.", buf, 0x20u);
          }
          [(NSMutableArray *)self->_requestedDeleteWrappers removeObjectsInArray:v23];
          [(MSObjectQueue *)self->_deleteQueue removeObjectWrappersFromQueue:v23];
          [(MSDeleter *)self _updateMasterManifest];
          v31 = +[MSObjectWrapper objectsFromWrappers:v23];
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v80 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v69;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v69 != v34) {
                  objc_enumerationMutation(v31);
                }
                [(MSDeleterDelegate *)self->_delegate deleter:self didFinishDeletingAssetCollection:*(void *)(*((void *)&v68 + 1) + 8 * j) error:v13];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:v80 count:16];
            }
            while (v33);
          }

          id v10 = v30;
          id v12 = v65;
          long long v15 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
        }

        char v18 = 0;
      }
      v36 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
    }
    else
    {
      id v62 = v10;
      id v64 = v12;
      id v66 = v11;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v19 = objc_opt_class();
        id v20 = v19;
        v21 = [(MSCupidStateMachine *)self personID];
        uint64_t v22 = [(NSMutableArray *)self->_requestedDeleteWrappers count];
        *(_DWORD *)buf = 138543874;
        *(void *)v84 = v19;
        *(_WORD *)&v84[8] = 2112;
        v85 = v21;
        __int16 v86 = 2048;
        uint64_t v87 = v22;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Successfully sent %lu delete requests.", buf, 0x20u);
      }
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      v37 = self->_requestedDeleteWrappers;
      uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v76 objects:v82 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v77;
        do
        {
          for (uint64_t k = 0; k != v39; ++k)
          {
            if (*(void *)v77 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = [*(id *)(*((void *)&v76 + 1) + 8 * k) object];
            [(MSDeleterDelegate *)self->_delegate deleter:self didFinishDeletingAssetCollection:v42 error:0];
          }
          uint64_t v39 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v76 objects:v82 count:16];
        }
        while (v39);
      }

      v36 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
      [(MSObjectQueue *)self->_deleteQueue removeObjectWrappersFromQueue:self->_requestedDeleteWrappers];
      [(NSMutableArray *)self->_requestedDeleteWrappers removeAllObjects];
      long long v15 = &OBJC_IVAR___MSPublishMMCSProtocol__itemFlags;
      daemon = self->_daemon;
      v44 = [(MSCupidStateMachine *)self personID];
      [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v44];

      [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
      char v18 = 0;
      id v10 = v62;
      id v12 = v64;
      id v11 = v66;
    }
    if ([*(id *)((char *)&self->super.super.isa + v36[61]) count])
    {
      self->_int state = 1;
      if ((v18 & 1) == 0)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __83__MSDeleter_deleteProtocol_didFinishSuccessfulCollections_failedCollections_error___block_invoke;
        block[3] = &unk_1E6C3DA38;
        block[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      self->_int state = 0;
    }
    [*(id *)((char *)&self->super.super.isa + v15[67]) releaseBusy];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v84 = 3;
    *(_WORD *)&v84[4] = 1024;
    *(_DWORD *)&v84[6] = state;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }
}

uint64_t __83__MSDeleter_deleteProtocol_didFinishSuccessfulCollections_failedCollections_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performOutstandingActivities];
}

- (void)deleteProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    id v10 = [(MSCupidStateMachine *)self personID];
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2112;
    long long v14 = v10;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found authentication error. Will try again later. %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
  self->_int state = 1;
  daemon = self->_daemon;
  uint64_t v7 = [(MSCupidStateMachine *)self personID];
  [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v7];

  [(MSDaemon *)self->_daemon releaseBusy];
}

- (void)_sendDeleteRequest
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_requestedDeleteWrappers removeAllObjects];
  requestedDeleteWrappers = self->_requestedDeleteWrappers;
  v4 = [(MSObjectQueue *)self->_deleteQueue objectWrappersWithZeroSizeMaxCount:self->_batchSize];
  [(NSMutableArray *)requestedDeleteWrappers addObjectsFromArray:v4];

  if ([(NSMutableArray *)self->_requestedDeleteWrappers count])
  {
    self->_int state = 3;
    protocol = self->_protocol;
    id v9 = +[MSObjectWrapper objectsFromWrappers:self->_requestedDeleteWrappers];
    -[MSDeleteStreamsProtocol sendDeletionRequestForAssetCollections:](protocol, "sendDeletionRequestForAssetCollections:");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      id v7 = v6;
      uint64_t v8 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138543618;
      int v11 = v6;
      __int16 v12 = 2112;
      __int16 v13 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ No outstanding deletes to send.", buf, 0x16u);
    }
    [(MSDeleter *)self _updateMasterManifest];
    self->_int state = 0;
    [(MSDaemon *)self->_daemon releaseBusy];
  }
}

- (void)performOutstandingActivities
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(MSCupidStateMachine *)self hasDeactivated])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = objc_opt_class();
      v4 = [(MSCupidStateMachine *)self personID];
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not deleting because we're shutting down.", (uint8_t *)&v5, 0x16u);
    }
  }
  else if (self->_state <= 1u && [(MSDeleter *)self _isAllowedToDelete])
  {
    [(MSDaemon *)self->_daemon retainBusy];
    self->_int state = 2;
    [(MSDeleter *)self _sendDeleteRequest];
  }
}

- (void)deleteAssetCollections:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v5 = objc_opt_class();
    id v6 = v5;
    __int16 v7 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    v24 = v7;
    __int16 v25 = 2114;
    id v26 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Deleting asset collections: %{public}@", buf, 0x20u);
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = +[MSObjectWrapper wrapperWithObject:*(void *)(*((void *)&v16 + 1) + 8 * v13) size:0];
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(MSObjectQueue *)self->_deleteQueue appendObjectWrappers:v8];
  [(MSDeleter *)self _updateMasterManifest];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__MSDeleter_deleteAssetCollections___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __36__MSDeleter_deleteAssetCollections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performOutstandingActivities];
}

- (BOOL)_isAllowedToDelete
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSPlatform();
  char v4 = objc_opt_respondsToSelector();

  int v5 = MSPlatform();
  id v6 = v5;
  if (v4)
  {
    char v7 = [v5 policyMaySendDelete];

    if ((v7 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    int v8 = [v5 policyMayUpload];

    if (!v8) {
      goto LABEL_6;
    }
  }
  id v9 = [(MSCupidStateMachine *)self _latestNextActivityDate];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v9 compare:v10];

  if (v11 != 1) {
    return 1;
  }
LABEL_6:
  BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v12)
  {
    uint64_t v14 = objc_opt_class();
    id v15 = v14;
    long long v16 = [(MSCupidStateMachine *)self personID];
    int v17 = 138543618;
    long long v18 = v14;
    __int16 v19 = 2112;
    id v20 = v16;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not sending delete request at this time.", (uint8_t *)&v17, 0x16u);

    return 0;
  }
  return result;
}

- (void)_updateMasterManifest
{
  id v7 = [(MSCupidStateMachine *)self _latestNextActivityDate];
  int64_t v3 = [(MSObjectQueue *)self->_deleteQueue count];
  char v4 = [(MSCupidStateMachine *)self personID];
  if (v3) {
    BOOL v5 = v7 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  +[MSDeleter _setMasterNextActivityDate:v6 forPersonID:v4];

  _commitMasterManifest_3247();
}

- (void)dealloc
{
  [(MSDeleter *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSDeleter;
  [(MSCupidStateMachine *)&v3 dealloc];
}

- (void)deactivate
{
  [(MSDeleter *)self stop];
  protocol = self->_protocol;
  self->_protocol = 0;

  deleteQueue = self->_deleteQueue;
  self->_deleteQueue = 0;

  requestedDeleteWrappers = self->_requestedDeleteWrappers;
  self->_requestedDeleteWrappers = 0;

  v6.receiver = self;
  v6.super_class = (Class)MSDeleter;
  [(MSCupidStateMachine *)&v6 deactivate];
}

- (MSDeleter)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MSDeleter;
  int v8 = [(MSCupidStateMachine *)&v18 initWithPersonID:v6];
  if (v8)
  {
    id v9 = [MSObjectQueue alloc];
    uint64_t v10 = MSPathDeleteQueueForPersonID(v6);
    uint64_t v11 = [(MSObjectQueue *)v9 initWithPath:v10];
    deleteQueue = v8->_deleteQueue;
    v8->_deleteQueue = (MSObjectQueue *)v11;

    uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestedDeleteWrappers = v8->_requestedDeleteWrappers;
    v8->_requestedDeleteWrappers = v13;

    id v15 = [[MSDeleteStreamsProtocol alloc] initWithPersonID:v6 baseURL:v7];
    protocol = v8->_protocol;
    v8->_protocol = v15;

    [(MSStreamsProtocol *)v8->_protocol setDelegate:v8];
    v8->_batchSize = 10;
    v8->_maxErrorCount = 3;
  }

  return v8;
}

+ (BOOL)isInRetryState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_deleterByID, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) _isInRetryState])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (void)abortAllActivities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_deleterByID, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) abort];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (void)stopAllActivities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_deleterByID, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) stop];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)personIDsWithOutstandingActivities
{
  v2 = _masterNextActivityDateByPersonID_3272();
  uint64_t v3 = [v2 allKeys];

  return v3;
}

+ (id)nextActivityDateForPersonID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _masterNextActivityDateByPersonID_3272();
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

+ (id)nextActivityDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _masterNextActivityDateByPersonID_3272();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = [v2 objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        long long v9 = v8;
        if (!v5 || [v8 compare:v5] == -1)
        {
          id v10 = v9;

          uint64_t v5 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    long long v7 = _masterNextActivityDateByPersonID_3272();
    id v8 = v7;
    if (v5) {
      [v7 setObject:v5 forKey:v6];
    }
    else {
      [v7 removeObjectForKey:v6];
    }
    _commitMasterManifest_3247();
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - Found empty person ID.", (uint8_t *)&v9, 0xCu);
LABEL_8:
  }
}

+ (void)forgetPersonID:(id)a3
{
  id v5 = a3;
  uint64_t v3 = objc_msgSend((id)_deleterByID, "objectForKey:");
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 forget];
    [(id)_deleterByID removeObjectForKey:v5];
  }
}

+ (id)_clearInstantiatedDeletersByPersonID
{
  id v2 = (id)_deleterByID;
  uint64_t v3 = (void *)_deleterByID;
  _deleterByID = 0;

  return v2;
}

+ (id)existingDeleterForPersonID:(id)a3
{
  return (id)[(id)_deleterByID objectForKey:a3];
}

+ (id)deleterForPersonID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)_deleterByID;
    if (!_deleterByID)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = (void *)_deleterByID;
      _deleterByID = (uint64_t)v5;

      uint64_t v4 = (void *)_deleterByID;
    }
    long long v7 = [v4 objectForKey:v3];
    if (!v7)
    {
      id v8 = [MSDeleter alloc];
      int v9 = MSPlatform();
      id v10 = [v9 baseURLForPersonID:v3];
      long long v7 = [(MSDeleter *)v8 initWithPersonID:v3 baseURL:v10];

      [(id)_deleterByID setObject:v7 forKey:v3];
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

@end