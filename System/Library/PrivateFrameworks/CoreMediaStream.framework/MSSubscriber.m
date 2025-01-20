@interface MSSubscriber
+ (BOOL)isInRetryState;
+ (id)_clearInstantiatedSubscribersByPersonID;
+ (id)_descriptionForRetrievalState:(int)a3;
+ (id)_descriptionForState:(int)a3;
+ (id)existingSubscriberForPersonID:(id)a3;
+ (id)nextActivityDate;
+ (id)nextActivityDateForPersonID:(id)a3;
+ (id)personIDsWithOutstandingActivities;
+ (id)subscriberForPersonID:(id)a3;
+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4;
+ (void)forgetPersonID:(id)a3;
+ (void)stopAllActivities;
- (BOOL)_hasOutstandingPoll;
- (BOOL)_isAllowedToDownload;
- (BOOL)_isInRetryState;
- (MSMediaStreamDaemon)daemon;
- (MSSubscriber)initWithPersonID:(id)a3 baseURL:(id)a4;
- (MSSubscriberDelegate)delegate;
- (id)_subscriptionsByStreamID;
- (id)ownSubscribedStream;
- (id)subscribedStreams;
- (int)retrievalBatchSize;
- (int64_t)targetRetrievalByteCount;
- (void)_abort;
- (void)_changeRetrievalStateTo:(int)a3;
- (void)_changeStateTo:(int)a3;
- (void)_checkForNewAssetCollections;
- (void)_didFinishRetrievingSubscriptionUpdate;
- (void)_didReceiveAuthenticationError:(id)a3;
- (void)_finishedRetrievingAsset:(id)a3;
- (void)_forget;
- (void)_reauthorizeAssets;
- (void)_refreshServerSideConfigurationParameters;
- (void)_retrieveAssets;
- (void)_retrieveNextAssets;
- (void)_serverSideConfigurationDidChange:(id)a3;
- (void)_setHasOutstandingPoll:(BOOL)a3;
- (void)_setSubscriptionsByStreamID:(id)a3;
- (void)_stopOutSubscriberState:(int *)a3 outRetrievalState:(int *)a4;
- (void)_updateMasterManifest;
- (void)checkForNewAssetCollections;
- (void)checkForNewAssetCollectionsIfMissingCtag;
- (void)checkForOutstandingActivities;
- (void)deactivate;
- (void)dealloc;
- (void)reauthorizationProtocol:(id)a3 didReceiveAuthenticationError:(id)a4;
- (void)reauthorizationProtocol:(id)a3 reauthorizedAssets:(id)a4 rejectedAssets:(id)a5 error:(id)a6;
- (void)resetSync;
- (void)retrieveAssets:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRetrievalBatchSize:(int)a3;
- (void)setTargetRetrievalByteCount:(int64_t)a3;
- (void)stop;
- (void)subscribeStorageProtocol:(id)a3 didFinishRetrievingAsset:(id)a4 error:(id)a5;
- (void)subscribeStorageProtocolDidFinishRetrievingAllAssets:(id)a3;
- (void)subscribeStreamsProtocol:(id)a3 didFindDisappearedSubscriptionForPersonID:(id)a4;
- (void)subscribeStreamsProtocol:(id)a3 didFindTemporarilyUnavailableSubscriptionForPersonID:(id)a4;
- (void)subscribeStreamsProtocol:(id)a3 didFinishError:(id)a4;
- (void)subscribeStreamsProtocol:(id)a3 didFinishReceivingUpdatesForPersonID:(id)a4 ctag:(id)a5;
- (void)subscribeStreamsProtocol:(id)a3 didReceiveAssetCollections:(id)a4 forPersonID:(id)a5;
- (void)subscribeStreamsProtocol:(id)a3 didReceiveAuthenticationError:(id)a4;
- (void)subscribeStreamsProtocol:(id)a3 willReceiveUpdatesForPersonID:(id)a4 wasReset:(BOOL)a5 metadata:(id)a6;
@end

@implementation MSSubscriber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsBeingRetrieved, 0);
  objc_storeStrong((id *)&self->_retrievalQueue, 0);
  objc_storeStrong((id *)&self->_reauthProtocol, 0);
  objc_storeStrong((id *)&self->_storageProtocol, 0);
  objc_storeStrong((id *)&self->_newSubscriptionsByStreamID, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
}

- (void)setRetrievalBatchSize:(int)a3
{
  self->_retrievalBatchSize = a3;
}

- (int)retrievalBatchSize
{
  return self->_retrievalBatchSize;
}

- (void)setTargetRetrievalByteCount:(int64_t)a3
{
  self->_targetRetrievalByteCount = a3;
}

- (int64_t)targetRetrievalByteCount
{
  return self->_targetRetrievalByteCount;
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
  self->_delegate = (MSSubscriberDelegate *)a3;
}

- (MSSubscriberDelegate)delegate
{
  return self->_delegate;
}

- (void)reauthorizationProtocol:(id)a3 reauthorizedAssets:(id)a4 rejectedAssets:(id)a5 error:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v10 count];
  if (!v11 && v12)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_NOT_AUTH");
    id v11 = [v13 MSErrorWithDomain:@"MSSubscriberErrorDomain" code:3 description:v14];
  }
  if (!v11)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_opt_class();
      id v18 = v17;
      v19 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138543874;
      v55 = v17;
      __int16 v56 = 2112;
      v57 = v19;
      __int16 v58 = 2048;
      uint64_t v59 = [v9 count];
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Successfully reauthorized %lu assets.", buf, 0x20u);
    }
    daemon = self->_daemon;
    v21 = [(MSCupidStateMachine *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v21];

LABEL_28:
    [(MSObjectQueue *)self->_retrievalQueue commitObjectsWrappers:self->_assetsBeingRetrieved];
    [(MSSubscriber *)self _retrieveNextAssets];
    goto LABEL_29;
  }
  int v15 = [v11 MSIsTemporaryNetworkError];
  BOOL v16 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  v48 = v11;
  if (!v15)
  {
    id v45 = v9;
    if (v16)
    {
      v38 = objc_opt_class();
      id v39 = v38;
      v40 = [(MSCupidStateMachine *)self personID];
      id v41 = v10;
      uint64_t v42 = [v10 count];
      v43 = [v48 MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      v55 = v38;
      id v11 = v48;
      __int16 v56 = 2112;
      v57 = v40;
      __int16 v58 = 2048;
      uint64_t v59 = v42;
      id v10 = v41;
      __int16 v60 = 2114;
      v61 = v43;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reauthorization resulted in %lu rejected assets. Error: %{public}@", buf, 0x2Au);
    }
    v46 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v44 = v10;
    id obj = v10;
    uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v50;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v50 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * v25);
          if ([(NSMutableArray *)self->_assetsBeingRetrieved count])
          {
            uint64_t v27 = 0;
            while (1)
            {
              v28 = [(NSMutableArray *)self->_assetsBeingRetrieved objectAtIndex:v27];
              v29 = [v28 object];
              int v30 = [v29 isEqual:v26];

              if (v30) {
                break;
              }

              if (++v27 >= (unint64_t)[(NSMutableArray *)self->_assetsBeingRetrieved count]) {
                goto LABEL_25;
              }
            }
            [v46 addObject:v28];
            [(NSMutableArray *)self->_assetsBeingRetrieved removeObjectAtIndex:v27];
          }
LABEL_25:
          [(MSSubscriber *)self _finishedRetrievingAsset:v26];
          id v11 = v48;
          [(MSSubscriberDelegate *)self->_delegate subscriber:self didFinishRetrievingAsset:v26 error:v48];
          ++v25;
        }
        while (v25 != v23);
        uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v23);
    }

    storageProtocol = self->_storageProtocol;
    v32 = +[MSObjectWrapper objectsFromWrappers:v46];
    [(MSSubscribeStorageProtocol *)storageProtocol didFinishUsingAssets:v32];

    [(MSObjectQueue *)self->_retrievalQueue removeObjectWrappersFromQueue:v46];
    [(MSSubscriber *)self _updateMasterManifest];

    id v10 = v44;
    id v9 = v45;
    goto LABEL_28;
  }
  if (v16)
  {
    v33 = objc_opt_class();
    id v34 = v33;
    v35 = [(MSCupidStateMachine *)self personID];
    [v48 MSVerboseDescription];
    v37 = id v36 = v10;
    *(_DWORD *)buf = 138543874;
    v55 = v33;
    __int16 v56 = 2112;
    v57 = v35;
    __int16 v58 = 2114;
    uint64_t v59 = (uint64_t)v37;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered temporary network error during subscription update. Trying again later. Error :%{public}@", buf, 0x20u);

    id v10 = v36;
    id v11 = v48;
  }
  [(MSObjectQueue *)self->_retrievalQueue commitObjectsWrappers:self->_assetsBeingRetrieved];
  [(MSSubscriber *)self _changeRetrievalStateTo:1];
  [(MSDaemon *)self->_daemon releaseBusy];
LABEL_29:
}

- (void)reauthorizationProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v8 = a4;
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = [(MSCupidStateMachine *)self personID];
    uint64_t v12 = [v8 MSVerboseDescription];

    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    BOOL v16 = v11;
    __int16 v17 = 2114;
    id v18 = v12;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Reauthorization protocol received authentication error: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  daemon = self->_daemon;
  v7 = [(MSCupidStateMachine *)self personID];
  [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v7];

  [(MSSubscriber *)self _changeRetrievalStateTo:3];
  [(MSDaemon *)self->_daemon releaseBusy];
}

- (void)subscribeStorageProtocolDidFinishRetrievingAllAssets:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    v6 = [(MSCupidStateMachine *)self personID];
    uint64_t v7 = [(NSMutableArray *)self->_assetsBeingRetrieved count];
    *(_DWORD *)buf = 138543874;
    v80 = v4;
    __int16 v81 = 2112;
    v82 = v6;
    __int16 v83 = 2048;
    uint64_t v84 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Finished retrieving assets. Checking for errors on %lu assets...", buf, 0x20u);
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[MSObjectQueue count](self->_retrievalQueue, "count", 120));
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = self->_assetsBeingRetrieved;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v73 objects:v78 count:16];
  v64 = v8;
  if (v9)
  {
    uint64_t v10 = v9;
    char v66 = 0;
    int v63 = 0;
    int v65 = 0;
    id v11 = MEMORY[0x1E4F14500];
    uint64_t v12 = *(void *)v74;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v74 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        __int16 v15 = [v14 object];
        BOOL v16 = [v15 error];
        __int16 v17 = v16;
        if (v16)
        {
          if ([v16 MSCanBeIgnored])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v42 = objc_opt_class();
              id v43 = v42;
              id v44 = [(MSCupidStateMachine *)self personID];
              id v45 = [v17 MSVerboseDescription];
              *(_DWORD *)buf = 138543874;
              v80 = v42;
              __int16 v81 = 2112;
              v82 = v44;
              __int16 v83 = 2114;
              uint64_t v84 = (uint64_t)v45;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Ignoring error: %{public}@", buf, 0x20u);
            }
            goto LABEL_65;
          }
          if ([v17 MSIsTemporaryNetworkError])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              id v18 = objc_opt_class();
              id v19 = v18;
              v20 = [(MSCupidStateMachine *)self personID];
              *(_DWORD *)buf = 138543618;
              v80 = v18;
              __int16 v81 = 2112;
              v82 = v20;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered temporary network error.", buf, 0x16u);

              id v11 = MEMORY[0x1E4F14500];
            }
            char v66 = 1;
          }
          else if ([v17 MSIsAuthError])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              v21 = objc_opt_class();
              id v22 = v21;
              uint64_t v23 = [(MSCupidStateMachine *)self personID];
              *(_DWORD *)buf = 138543618;
              v80 = v21;
              id v11 = MEMORY[0x1E4F14500];
              __int16 v81 = 2112;
              v82 = v23;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered authentication error.", buf, 0x16u);
            }
            int v65 = 1;
          }
          else if ([v17 MSIsBadTokenError])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = objc_opt_class();
              id v25 = v24;
              uint64_t v26 = [(MSCupidStateMachine *)self personID];
              *(_DWORD *)buf = 138543618;
              v80 = v24;
              id v11 = MEMORY[0x1E4F14500];
              __int16 v81 = 2112;
              v82 = v26;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered bad asset retrieval token.", buf, 0x16u);

              id v8 = v64;
            }
            objc_msgSend(v14, "setErrorCount:", objc_msgSend(v14, "errorCount") + 1);
            if (self->_maxErrorCount <= (int)[v14 errorCount])
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                id v39 = objc_opt_class();
                id v40 = v39;
                id v41 = [(MSCupidStateMachine *)self personID];
                *(_DWORD *)buf = 138543874;
                v80 = v39;
                __int16 v81 = 2112;
                v82 = v41;
                __int16 v83 = 2114;
                uint64_t v84 = (uint64_t)v15;
                _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Too many errors encountered for asset. Aborting download. %{public}@", buf, 0x20u);
              }
              delegate = self->_delegate;
              v28 = (void *)MEMORY[0x1E4F28C58];
              v29 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_CANNOT_RETRIEVE");
              int v30 = [v28 MSErrorWithDomain:@"MSSubscriberErrorDomain" code:5 description:v29];
              [(MSSubscriberDelegate *)delegate subscriber:self didFinishRetrievingAsset:v15 error:v30];

              id v8 = v64;
              [v64 addObject:v15];
              int v63 = 1;
              id v11 = MEMORY[0x1E4F14500];
            }
            else
            {
              int v63 = 1;
            }
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v35 = objc_opt_class();
              id v36 = v35;
              v37 = [(MSCupidStateMachine *)self personID];
              v38 = [v17 MSVerboseDescription];
              *(_DWORD *)buf = 138543874;
              v80 = v35;
              id v8 = v64;
              __int16 v81 = 2112;
              v82 = v37;
              __int16 v83 = 2114;
              uint64_t v84 = (uint64_t)v38;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Asset retrieval failed with error: %{public}@", buf, 0x20u);

              id v11 = MEMORY[0x1E4F14500];
            }
            [v8 addObject:v15];
            [(MSSubscriberDelegate *)self->_delegate subscriber:self didFinishRetrievingAsset:v15 error:v17];
          }
          if ([v17 MSNeedsBackoff]) {
            [(MSCupidStateMachine *)self _backoffMMCSBackoffTimer];
          }
          v31 = [v17 MSMMCSRetryAfterDate];
          if (v31) {
            [(MSCupidStateMachine *)self _didReceiveMMCSRetryAfterDate:v31];
          }
        }
        else
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v32 = objc_opt_class();
            id v33 = v32;
            id v34 = [(MSCupidStateMachine *)self personID];
            *(_DWORD *)buf = 138543874;
            v80 = v32;
            id v8 = v64;
            __int16 v81 = 2112;
            v82 = v34;
            __int16 v83 = 2114;
            uint64_t v84 = (uint64_t)v15;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found orphaned asset. Ignoring. %{public}@", buf, 0x20u);

            id v11 = MEMORY[0x1E4F14500];
          }
          [v8 addObject:v15];
        }
      }
      uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v73 objects:v78 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v66 = 0;
    int v63 = 0;
    int v65 = 0;
  }

  [*(id *)((char *)&self->super.super.isa + v61) commitErrorCountsForObjectWrappers:self->_assetsBeingRetrieved];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v46 = v8;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v48; ++j)
      {
        if (*(void *)v70 != v49) {
          objc_enumerationMutation(v46);
        }
        [(MSSubscriber *)self _finishedRetrievingAsset:*(void *)(*((void *)&v69 + 1) + 8 * j)];
      }
      uint64_t v48 = [v46 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v48);
  }

  if (((v63 | v65) & 1) == 0) {
    [(MSCupidStateMachine *)self _resetMMCSBackoffTimer];
  }
  daemon = self->_daemon;
  long long v52 = [(MSCupidStateMachine *)self personID];
  if (v65) {
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v52];
  }
  else {
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v52];
  }

  id v8 = v64;
  if (v63)
  {
    uint64_t v53 = 3;
  }
  else
  {
    [(NSMutableArray *)self->_assetsBeingRetrieved removeAllObjects];
    uint64_t v53 = 1;
  }
  [(MSSubscriber *)self _changeRetrievalStateTo:v53];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v54 = objc_opt_class();
    id v55 = v54;
    __int16 v56 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543618;
    v80 = v54;
    __int16 v81 = 2112;
    v82 = v56;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ ...Finished handling errors.", buf, 0x16u);

    id v8 = v64;
  }
  [(MSDaemon *)self->_daemon releaseBusy];
  if (v66)
  {
    v57 = v62;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v58 = objc_opt_class();
      id v59 = v58;
      __int16 v60 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138543618;
      v80 = v58;
      __int16 v81 = 2112;
      v82 = v60;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found temporary network errors during asset downloading. Trying again later.", buf, 0x16u);

      id v8 = v64;
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MSSubscriber_subscribeStorageProtocolDidFinishRetrievingAllAssets___block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_65:
    v57 = v62;
  }
}

uint64_t __69__MSSubscriber_subscribeStorageProtocolDidFinishRetrievingAllAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retrieveAssets];
}

- (void)subscribeStorageProtocol:(id)a3 didFinishRetrievingAsset:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    [v9 setError:v10];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      int v13 = [(MSCupidStateMachine *)self personID];
      int v16 = 138543618;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished retrieving asset.", (uint8_t *)&v16, 0x16u);
    }
    v14 = [v9 path];
    [(MSSubscriber *)self _finishedRetrievingAsset:v9];
    [(MSSubscriberDelegate *)self->_delegate subscriber:self didFinishRetrievingAsset:v9 error:0];
    __int16 v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtPath:v14 error:0];
  }
}

- (void)_finishedRetrievingAsset:(id)a3
{
  int64_t v4 = +[MSObjectWrapper indexOfObject:a3 inWrapperArray:self->_assetsBeingRetrieved];
  if (v4 != -1)
  {
    int64_t v5 = v4;
    id v11 = [(NSMutableArray *)self->_assetsBeingRetrieved objectAtIndex:v4];
    v6 = [v11 object];
    storageProtocol = self->_storageProtocol;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
    [(MSSubscribeStorageProtocol *)storageProtocol didFinishUsingAssets:v8];

    retrievalQueue = self->_retrievalQueue;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v11];
    [(MSObjectQueue *)retrievalQueue removeObjectWrappersFromQueue:v10];

    [(NSMutableArray *)self->_assetsBeingRetrieved removeObjectAtIndex:v5];
    [(MSSubscriber *)self _updateMasterManifest];
  }
}

- (BOOL)_isInRetryState
{
  return self->_state == 1 || ((self->_retrievalState - 1) & 0xFFFFFFFD) == 0;
}

- (void)_forget
{
  retrievalQueue = self->_retrievalQueue;
  self->_retrievalQueue = 0;

  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

  reauthProtocol = self->_reauthProtocol;
  self->_reauthProtocol = 0;
}

- (void)_abort
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  [(MSSubscriber *)self _stopOutSubscriberState:(char *)&v20 + 4 outRetrievalState:&v20];
  [(MSSubscriber *)self _setHasOutstandingPoll:0];
  self->_checkOneMoreTime = 0;
  v3 = (void *)MEMORY[0x1E4F28C58];
  int64_t v4 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_ABORTED");
  int64_t v5 = [v3 MSErrorWithDomain:@"MSSubscriberErrorDomain" code:4 description:v4];

  if (HIDWORD(v20))
  {
    [(MSSubscriberDelegate *)self->_delegate subscriber:self didFailToRetriveSubscriptionUpdateWithError:v5];
    if (objc_opt_respondsToSelector()) {
      [(MSSubscriberDelegate *)self->_delegate subscriberDidCompleteCheckForNewAssetCollections:self];
    }
  }
  [(NSMutableArray *)self->_assetsBeingRetrieved removeAllObjects];
  v6 = [(MSObjectQueue *)self->_retrievalQueue allObjectWrappersMaxCount:5];
  uint64_t v7 = v6;
  while ([v6 count])
  {
    id v8 = (void *)MEMORY[0x1E019E3B0]();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          delegate = self->_delegate;
          __int16 v15 = [*(id *)(*((void *)&v16 + 1) + 8 * i) object];
          [(MSSubscriberDelegate *)delegate subscriber:self didFinishRetrievingAsset:v15 error:v5];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    [(MSObjectQueue *)self->_retrievalQueue removeObjectWrappersFromQueue:v9];
    uint64_t v7 = [(MSObjectQueue *)self->_retrievalQueue allObjectWrappersMaxCount:5];

    v6 = v7;
  }
  [(MSSubscriber *)self _updateMasterManifest];
}

- (void)stop
{
}

- (void)_stopOutSubscriberState:(int *)a3 outRetrievalState:(int *)a4
{
  if (self->_state == 2) {
    [(MSSubscribeStreamsProtocol *)self->_protocol abort];
  }
  int retrievalState = self->_retrievalState;
  if (retrievalState == 2)
  {
    id v8 = &OBJC_IVAR___MSSubscriber__storageProtocol;
  }
  else
  {
    if (retrievalState != 4) {
      goto LABEL_8;
    }
    id v8 = &OBJC_IVAR___MSSubscriber__reauthProtocol;
  }
  [*(id *)((char *)&self->super.super.isa + *v8) abort];
LABEL_8:
  if (self->_state == 2) {
    [(MSDaemon *)self->_daemon releaseBusy];
  }
  int v9 = self->_retrievalState;
  if (v9 == 4 || v9 == 2) {
    [(MSDaemon *)self->_daemon releaseBusy];
  }
  if (self->_checkOneMoreTime)
  {
    [(MSSubscriber *)self _setHasOutstandingPoll:1];
    self->_checkOneMoreTime = 0;
  }
  if (a3) {
    *a3 = self->_state;
  }
  if (a4) {
    *a4 = self->_retrievalState;
  }
  [(MSSubscriber *)self _changeStateTo:0];
  [(MSSubscriber *)self _changeRetrievalStateTo:0];
  assetsBeingRetrieved = self->_assetsBeingRetrieved;
  [(NSMutableArray *)assetsBeingRetrieved removeAllObjects];
}

- (void)_reauthorizeAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_assetsBeingRetrieved count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v3 = objc_opt_class();
      id v4 = v3;
      int64_t v5 = [(MSCupidStateMachine *)self personID];
      uint64_t v6 = [(NSMutableArray *)self->_assetsBeingRetrieved count];
      int v9 = 138543874;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 2048;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Reauthorizing retrieval of %lu assets...", (uint8_t *)&v9, 0x20u);
    }
    reauthProtocol = self->_reauthProtocol;
    id v8 = +[MSObjectWrapper objectsFromWrappers:self->_assetsBeingRetrieved];
    [(MSReauthorizationProtocol *)reauthProtocol requestReauthorizationForAssets:v8];

    [(MSSubscriber *)self _changeRetrievalStateTo:4];
  }
  else
  {
    [(MSSubscriber *)self _retrieveNextAssets];
  }
}

- (void)_retrieveNextAssets
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [(MSObjectQueue *)self->_retrievalQueue smallestObjectWrappersTargetTotalSize:self->_targetRetrievalByteCount maxCount:self->_retrievalBatchSize];
  if ([v3 count])
  {
    [(NSMutableArray *)self->_assetsBeingRetrieved removeAllObjects];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = 0;
      uint64_t v8 = *(void *)v23;
      do
      {
        uint64_t v9 = 0;
        uint64_t v10 = v7;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v4);
          }
          id v7 = *(id *)(*((void *)&v22 + 1) + 8 * v9);

          __int16 v11 = objc_msgSend(v7, "object", (void)v22);
          uint64_t v12 = [v11 MMCSAccessHeader];

          if (v12) {
            [(NSMutableArray *)self->_assetsBeingRetrieved addObject:v7];
          }

          ++v9;
          uint64_t v10 = v7;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v32 count:16];
      }
      while (v6);
    }
    if ([(NSMutableArray *)self->_assetsBeingRetrieved count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = objc_opt_class();
        id v14 = v13;
        uint64_t v15 = [(MSCupidStateMachine *)self personID];
        uint64_t v16 = [(NSMutableArray *)self->_assetsBeingRetrieved count];
        *(_DWORD *)buf = 138543874;
        uint64_t v27 = v13;
        __int16 v28 = 2112;
        v29 = v15;
        __int16 v30 = 2048;
        uint64_t v31 = v16;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Retrieving %lu assets...", buf, 0x20u);
      }
      -[MSSubscriber _changeRetrievalStateTo:](self, "_changeRetrievalStateTo:", 2, (void)v22);
      storageProtocol = self->_storageProtocol;
      long long v18 = +[MSObjectWrapper objectsFromWrappers:self->_assetsBeingRetrieved];
      [(MSSubscribeStorageProtocol *)storageProtocol retrieveAssets:v18];
    }
    else
    {
      [(NSMutableArray *)self->_assetsBeingRetrieved addObjectsFromArray:v4];
      [(MSSubscriber *)self _reauthorizeAssets];
    }
  }
  else
  {
    [(MSDaemon *)self->_daemon releaseBusy];
    [(MSSubscriber *)self _changeRetrievalStateTo:0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      long long v19 = objc_opt_class();
      id v20 = v19;
      v21 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      v29 = v21;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ No more assets to retrieve.", buf, 0x16u);
    }
    if ([(MSSubscriber *)self _hasOutstandingPoll]) {
      [(MSSubscriber *)self checkForNewAssetCollections];
    }
  }
}

- (void)_retrieveAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(MSCupidStateMachine *)self hasDeactivated])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = objc_opt_class();
      id v4 = [(MSCupidStateMachine *)self personID];
      int v9 = 138543618;
      uint64_t v10 = v3;
      __int16 v11 = 2112;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not retrieving assets because we're shutting down.", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = v5;
      id v7 = [(MSCupidStateMachine *)self personID];
      int retrievalState = self->_retrievalState;
      int v9 = 138543874;
      uint64_t v10 = (uint64_t)v5;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 1024;
      int v14 = retrievalState;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Retrieval state: %d", (uint8_t *)&v9, 0x1Cu);
    }
    switch(self->_retrievalState)
    {
      case 0:
      case 1:
        if ([(MSSubscriber *)self _isAllowedToDownload])
        {
          [(MSDaemon *)self->_daemon retainBusy];
          [(MSSubscriber *)self _changeRetrievalStateTo:2];
          [(MSSubscriber *)self _retrieveNextAssets];
        }
        break;
      case 2:
      case 4:
        return;
      case 3:
        if ([(MSSubscriber *)self _isAllowedToDownload])
        {
          [(MSDaemon *)self->_daemon retainBusy];
          [(MSSubscriber *)self _changeRetrievalStateTo:4];
          [(MSSubscriber *)self _reauthorizeAssets];
        }
        break;
      default:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8] format:@"Unexpected state"];
        break;
    }
  }
}

- (void)checkForOutstandingActivities
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(MSCupidStateMachine *)self hasDeactivated])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = objc_opt_class();
      id v4 = [(MSCupidStateMachine *)self personID];
      int v5 = 138543618;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not checking for outstanding activities because we're shutting down.", (uint8_t *)&v5, 0x16u);
    }
  }
  else
  {
    if ([(MSObjectQueue *)self->_retrievalQueue count]) {
      [(MSSubscriber *)self _retrieveAssets];
    }
    [(MSSubscriber *)self _updateMasterManifest];
    if ([(MSSubscriber *)self _hasOutstandingPoll])
    {
      [(MSSubscriber *)self checkForNewAssetCollections];
    }
  }
}

- (void)retrieveAssets:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            __assert_rtn("-[MSSubscriber retrieveAssets:]", "MSSubscriber.m", 554, "[asset isKindOfClass:[MSAsset class]]");
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v45 count:16];
      }
      while (v7);
    }
    id v29 = v4;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [(MSCupidStateMachine *)self personID];
      uint64_t v13 = [v5 count];
      *(_DWORD *)buf = 138543874;
      id v40 = v10;
      __int16 v41 = 2112;
      uint64_t v42 = v12;
      __int16 v43 = 2048;
      uint64_t v44 = v13;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Scheduling retrieval of %ld assets.", buf, 0x20u);
    }
    int v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v5;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if ([v20 _fileSize])
          {
            v21 = [NSString MSMakeUUID];
            [v20 addMetadataValue:v21 forKey:@"MSAssetMetadataAssetFileTransferUUID"];

            long long v22 = +[MSObjectWrapper wrapperWithObject:size:](MSObjectWrapper, "wrapperWithObject:size:", v20, [v20 _fileSize]);
            [v14 addObject:v22];
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v26 = objc_opt_class();
              id v27 = v26;
              __int16 v28 = [(MSCupidStateMachine *)self personID];
              *(_DWORD *)buf = 138543874;
              id v40 = v26;
              __int16 v41 = 2112;
              uint64_t v42 = v28;
              __int16 v43 = 2114;
              uint64_t v44 = (uint64_t)v20;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejected invalid asset %{public}@.", buf, 0x20u);
            }
            delegate = self->_delegate;
            long long v24 = (void *)MEMORY[0x1E4F28C58];
            long long v22 = (void *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_ASSET_INVALID");
            long long v25 = [v24 MSErrorWithDomain:@"MSSubscriberErrorDomain" code:1 description:v22];
            [(MSSubscriberDelegate *)delegate subscriber:self didFinishRetrievingAsset:v20 error:v25];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v17);
    }

    [(MSObjectQueue *)self->_retrievalQueue appendObjectWrappers:v14];
    [(MSSubscriber *)self _updateMasterManifest];
    [(MSSubscriber *)self _retrieveAssets];

    id v4 = v29;
  }
}

- (void)subscribeStreamsProtocol:(id)a3 didFindTemporarilyUnavailableSubscriptionForPersonID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = a4;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [(MSCupidStateMachine *)self personID];

    int v10 = 138543874;
    id v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    id v15 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription stream for person ID %{public}@ is temporarily unavailable.", (uint8_t *)&v10, 0x20u);
  }
}

- (void)subscribeStreamsProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
}

- (void)_didReceiveAuthenticationError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = a3;
    id v8 = objc_opt_class();
    id v9 = v8;
    int v10 = [(MSCupidStateMachine *)self personID];
    id v11 = [v7 MSVerboseDescription];

    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Received authentication error: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  daemon = self->_daemon;
  id v6 = [(MSCupidStateMachine *)self personID];
  [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v6];

  [(MSSubscriber *)self _changeStateTo:1];
  [(MSDaemon *)self->_daemon releaseBusy];
}

- (void)subscribeStreamsProtocol:(id)a3 didFinishError:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7)
  {
    daemon = self->_daemon;
    int v12 = [(MSCupidStateMachine *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v12];

    [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = v13;
      id v15 = [(MSCupidStateMachine *)self personID];
      int v23 = 138543618;
      long long v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished retrieving subscription updates.", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_13;
  }
  int v9 = [v7 MSIsTemporaryNetworkError];
  BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (!v9)
  {
    if (v10)
    {
      id v20 = objc_opt_class();
      id v21 = v20;
      long long v22 = [(MSCupidStateMachine *)self personID];
      int v23 = 138543874;
      long long v24 = v20;
      __int16 v25 = 2112;
      uint64_t v26 = v22;
      __int16 v27 = 2114;
      __int16 v28 = v8;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found error when retrieving subscription updates: %{public}@", (uint8_t *)&v23, 0x20u);
    }
    if ([v8 MSNeedsBackoff]) {
      [(MSCupidStateMachine *)self _backoffStreamsBackoffTimer];
    }
    [(MSSubscriberDelegate *)self->_delegate subscriber:self didFailToRetriveSubscriptionUpdateWithError:v8];
LABEL_13:
    [(MSSubscriber *)self _didFinishRetrievingSubscriptionUpdate];
    goto LABEL_14;
  }
  if (v10)
  {
    __int16 v16 = objc_opt_class();
    id v17 = v16;
    uint64_t v18 = [(MSCupidStateMachine *)self personID];
    long long v19 = [v8 MSVerboseDescription];
    int v23 = 138543874;
    long long v24 = v16;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    __int16 v27 = 2114;
    __int16 v28 = v19;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found temporary network error. Trying again later. Error: %{public}@", (uint8_t *)&v23, 0x20u);
  }
  [(MSSubscriber *)self _changeStateTo:1];
  [(MSDaemon *)self->_daemon releaseBusy];
LABEL_14:
}

- (void)subscribeStreamsProtocol:(id)a3 didFindDisappearedSubscriptionForPersonID:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_opt_class();
    id v9 = v8;
    BOOL v10 = [(MSCupidStateMachine *)self personID];
    int v11 = 138543874;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription for personID %@ is no longer available.", (uint8_t *)&v11, 0x20u);
  }
  [(NSMutableDictionary *)self->_newSubscriptionsByStreamID removeObjectForKey:v7];
  if (objc_opt_respondsToSelector()) {
    [(MSSubscriberDelegate *)self->_delegate subscriber:self didFindDisappearedSubscriptionforStreamID:v7];
  }
}

- (void)subscribeStreamsProtocol:(id)a3 didFinishReceivingUpdatesForPersonID:(id)a4 ctag:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v11 = objc_opt_class();
    id v12 = v11;
    __int16 v13 = [(MSCupidStateMachine *)self personID];
    int v23 = 138543874;
    long long v24 = v11;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = v9;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished receiving updates for personID: %@.", (uint8_t *)&v23, 0x20u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v20 = objc_opt_class();
    id v21 = v20;
    long long v22 = [(MSCupidStateMachine *)self personID];
    int v23 = 138543874;
    long long v24 = v20;
    __int16 v25 = 2112;
    uint64_t v26 = v22;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ New ctag: %{public}@", (uint8_t *)&v23, 0x20u);
  }
  if (objc_opt_respondsToSelector()) {
    [(MSSubscriberDelegate *)self->_delegate subscriber:self didFinishRequestingAssetRetrievalForStreamID:v9];
  }
  id v14 = [(NSMutableDictionary *)self->_newSubscriptionsByStreamID objectForKey:v9];
  __int16 v15 = v14;
  if (v14)
  {
    [v14 setCtag:v10];
  }
  else if (v10)
  {
    id v16 = +[MSSubscribedStream subscribedStreamWithStreamID:v9];
    [v16 setCtag:v10];
    [(NSMutableDictionary *)self->_newSubscriptionsByStreamID setObject:v16 forKey:v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_opt_class();
      id v18 = v17;
      long long v19 = [(MSCupidStateMachine *)self personID];
      int v23 = 138543874;
      long long v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v19;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Received CTAG for new person ID %@.", (uint8_t *)&v23, 0x20u);
    }
  }
}

- (void)subscribeStreamsProtocol:(id)a3 didReceiveAssetCollections:(id)a4 forPersonID:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    id v12 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v10;
    __int16 v30 = 2112;
    long long v31 = v12;
    __int16 v32 = 2048;
    uint64_t v33 = [v8 count];
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Found %ld new asset collections.", buf, 0x20u);
  }
  __int16 v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v14 = [MEMORY[0x1E4F1CA48] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v20 wasDeleted]) {
          id v21 = v14;
        }
        else {
          id v21 = v13;
        }
        [v21 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  if ([v13 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = v13;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "New Collections: %{public}@", buf, 0xCu);
  }
  if ([v14 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v14;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Deleted asset collections: %{public}@", buf, 0xCu);
    }
    if (objc_opt_respondsToSelector()) {
      [(MSSubscriberDelegate *)self->_delegate subscriber:self didReceiveDeleteForAssetCollections:v14 streamID:v9];
    }
  }
  [(MSSubscriberDelegate *)self->_delegate subscriber:self didRequestAssetRetrievalForAssetCollections:v13 streamID:v9];
}

- (void)subscribeStreamsProtocol:(id)a3 willReceiveUpdatesForPersonID:(id)a4 wasReset:(BOOL)a5 metadata:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    __int16 v13 = objc_opt_class();
    id v14 = v13;
    id v15 = [(MSCupidStateMachine *)self personID];
    int v24 = 138543618;
    long long v25 = v13;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Checking for subscription updates...", (uint8_t *)&v24, 0x16u);
  }
  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    id v17 = v16;
    uint64_t v18 = [(MSCupidStateMachine *)self personID];
    int v24 = 138543618;
    long long v25 = v16;
    __int16 v26 = 2112;
    __int16 v27 = v18;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscriber state was reset by the server.", (uint8_t *)&v24, 0x16u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v21 = objc_opt_class();
    id v22 = v21;
    long long v23 = [(MSCupidStateMachine *)self personID];
    int v24 = 138544386;
    long long v25 = v21;
    __int16 v26 = 2112;
    __int16 v27 = v23;
    __int16 v28 = 2112;
    id v29 = v11;
    __int16 v30 = 1024;
    BOOL v31 = v7;
    __int16 v32 = 2114;
    id v33 = v12;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Beginning subscriber updates for personID: %@ wasReset: %d\nMetadata: %{public}@", (uint8_t *)&v24, 0x30u);
  }
  long long v19 = [(NSMutableDictionary *)self->_newSubscriptionsByStreamID objectForKey:v11];
  if (v19)
  {
    if (!v7) {
      goto LABEL_13;
    }
  }
  else
  {
    long long v19 = +[MSSubscribedStream subscribedStreamWithStreamID:v11];
    [(NSMutableDictionary *)self->_newSubscriptionsByStreamID setObject:v19 forKey:v11];
    if (!v7) {
      goto LABEL_13;
    }
  }
  id v20 = [(MSSubscriber *)self daemon];
  [v20 didReceiveGlobalResetSyncForPersonID:v11];

  if (objc_opt_respondsToSelector()) {
    [(MSSubscriberDelegate *)self->_delegate subscriber:self didResetSyncForStreamID:v11];
  }
LABEL_13:
  if (objc_opt_respondsToSelector()) {
    [(MSSubscriberDelegate *)self->_delegate subscriber:self willBeginRequestingAssetRetrievalForStreamID:v11];
  }
}

- (void)_didFinishRetrievingSubscriptionUpdate
{
  [(MSSubscriber *)self _setSubscriptionsByStreamID:self->_newSubscriptionsByStreamID];
  newSubscriptionsByStreamID = self->_newSubscriptionsByStreamID;
  self->_newSubscriptionsByStreamID = 0;

  if (self->_checkOneMoreTime)
  {
    self->_checkOneMoreTime = 0;
    [(MSSubscriber *)self _changeStateTo:1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MSSubscriber__didFinishRetrievingSubscriptionUpdate__block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(MSSubscriber *)self _setHasOutstandingPoll:0];
    [(MSSubscriber *)self _changeStateTo:0];
    if (objc_opt_respondsToSelector()) {
      [(MSSubscriberDelegate *)self->_delegate subscriberDidCompleteCheckForNewAssetCollections:self];
    }
  }
  [(MSDaemon *)self->_daemon releaseBusy];
}

uint64_t __54__MSSubscriber__didFinishRetrievingSubscriptionUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForNewAssetCollections];
}

- (void)_checkForNewAssetCollections
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(MSSubscriber *)self _changeStateTo:2];
  uint64_t v3 = [(MSSubscriber *)self _subscriptionsByStreamID];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v9), (void)v17);
        id v11 = [v10 ctag];

        if (v11)
        {
          id v12 = [v10 ctag];
          __int16 v13 = [v10 streamID];
          [v4 setObject:v12 forKey:v13];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v14 = [(MSSubscriber *)self _subscriptionsByStreamID];
  id v15 = (NSMutableDictionary *)[v14 mutableCopy];
  newSubscriptionsByStreamID = self->_newSubscriptionsByStreamID;
  self->_newSubscriptionsByStreamID = v15;

  [(MSSubscribeStreamsProtocol *)self->_protocol pollForSubscriptionUpdatesWithAccountAnchors:v4];
}

- (void)checkForNewAssetCollections
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(MSCupidStateMachine *)self hasDeactivated])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = objc_opt_class();
      id v4 = [(MSCupidStateMachine *)self personID];
      int v7 = 138543618;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not checking for new asset collections because we're shutting down.", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int state = self->_state;
      int v7 = 67109120;
      LODWORD(v8) = state;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "checkForNewAssetCollections called, state: %d", (uint8_t *)&v7, 8u);
    }
    int v5 = self->_state;
    if (v5 == 1)
    {
      [(MSDaemon *)self->_daemon retainBusy];
      [(MSSubscriber *)self _checkForNewAssetCollections];
    }
    else if (v5)
    {
      [(MSSubscriber *)self _setHasOutstandingPoll:1];
      self->_checkOneMoreTime = 1;
    }
    else
    {
      [(MSSubscriber *)self _setHasOutstandingPoll:1];
      if ([(MSSubscriber *)self _isAllowedToDownload]
        && ![(MSObjectQueue *)self->_retrievalQueue count])
      {
        [(MSSubscriber *)self _changeStateTo:1];
        self->_checkOneMoreTime = 0;
        [(MSSubscriber *)self checkForNewAssetCollections];
      }
    }
  }
}

- (void)checkForNewAssetCollectionsIfMissingCtag
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSSubscriber *)self _subscriptionsByStreamID];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    __int16 v13 = self;
    char v6 = 0;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v3 objectForKey:v10];
        id v12 = [v11 ctag];

        if (!v12)
        {
          char v6 = 1;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v10;
            _os_log_impl(&dword_1DC434000, v8, OS_LOG_TYPE_INFO, "will check for new asset collections due to missing ctag for %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
    if (v6) {
      [(MSSubscriber *)v13 checkForNewAssetCollections];
    }
  }
}

- (BOOL)_isAllowedToDownload
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSSubscriber *)self daemon];
  uint64_t v4 = [(MSCupidStateMachine *)self personID];
  if (![v3 mayDownloadPersonID:v4]) {
    goto LABEL_6;
  }
  uint64_t v5 = MSPlatform();
  if (([v5 policyMayDownload] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  char v6 = [(MSCupidStateMachine *)self _latestNextActivityDate];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = [v6 compare:v7];

  if (v8 != 1) {
    return 1;
  }
LABEL_7:
  BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v11;
    __int16 v13 = [(MSCupidStateMachine *)self personID];
    int v14 = 138543618;
    long long v15 = v11;
    __int16 v16 = 2112;
    long long v17 = v13;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not downloading at this time.", (uint8_t *)&v14, 0x16u);

    return 0;
  }
  return result;
}

- (void)resetSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = objc_opt_class();
    id v4 = v3;
    uint64_t v5 = [(MSCupidStateMachine *)self personID];
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    BOOL v10 = v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscriber sync state was reset locally.", (uint8_t *)&v7, 0x16u);
  }
  [(MSSubscriber *)self _stopOutSubscriberState:0 outRetrievalState:0];
  char v6 = [(MSSubscriber *)self _subscriptionsByStreamID];
  [v6 removeAllObjects];

  [(MSCupidStateMachine *)self _commitUserManifest];
}

- (void)_setSubscriptionsByStreamID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSCupidStateMachine *)self _userManifest];
  [v5 setObject:v4 forKey:@"subs"];

  [(MSCupidStateMachine *)self _commitUserManifest];
}

- (id)_subscriptionsByStreamID
{
  uint64_t v3 = [(MSCupidStateMachine *)self _userManifest];
  id v4 = [v3 objectForKey:@"subs"];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [v3 setObject:v4 forKey:@"subs"];
    [(MSCupidStateMachine *)self _commitUserManifest];
  }

  return v4;
}

- (void)_setHasOutstandingPoll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    __int16 v9 = [(MSCupidStateMachine *)self personID];
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    __int16 v14 = 1024;
    BOOL v15 = v3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Setting outstanding poll: %d", (uint8_t *)&v10, 0x1Cu);
  }
  uint64_t v5 = [(MSCupidStateMachine *)self _userManifest];
  char v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKey:@"poll"];

  [(MSCupidStateMachine *)self _commitUserManifest];
}

- (BOOL)_hasOutstandingPoll
{
  v2 = [(MSCupidStateMachine *)self _userManifest];
  BOOL v3 = [v2 objectForKey:@"poll"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)_updateMasterManifest
{
  id v6 = [(MSCupidStateMachine *)self _latestNextActivityDate];
  if ([(MSSubscriber *)self _hasOutstandingPoll])
  {
    if (v6)
    {
LABEL_3:
      BOOL v3 = [(MSCupidStateMachine *)self personID];
      id v4 = v6;
      goto LABEL_10;
    }
  }
  else
  {
    if ([(MSObjectQueue *)self->_retrievalQueue count]) {
      BOOL v5 = v6 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      goto LABEL_3;
    }
  }
  BOOL v3 = [(MSCupidStateMachine *)self personID];
  id v4 = 0;
LABEL_10:
  +[MSSubscriber _setMasterNextActivityDate:v4 forPersonID:v3];

  _commitMasterManifest_265();
}

- (void)_serverSideConfigurationDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v14 = a3;
  BOOL v5 = [v4 currentThread];
  id v6 = [MEMORY[0x1E4F29060] mainThread];

  if (v5 == v6)
  {
    int v7 = [v14 userInfo];

    id v8 = [v7 objectForKey:@"personID"];
    __int16 v9 = [(MSCupidStateMachine *)self personID];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_opt_class();
        id v12 = v11;
        __int16 v13 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Server-side configuration has changed. Reading new values.", buf, 0x16u);
      }
      [(MSSubscriber *)self _refreshServerSideConfigurationParameters];
    }
  }
  else
  {
    [(MSSubscriber *)self performSelectorOnMainThread:sel__serverSideConfigurationDidChange_ withObject:v14 waitUntilDone:0];
  }
}

- (void)_refreshServerSideConfigurationParameters
{
  BOOL v3 = [(MSCupidStateMachine *)self personID];
  self->_targetRetrievalByteCount = +[MSServerSideConfigManager longLongValueForParameter:@"mme.streams.client.subDownloadBatchTargetSize" forPersonID:v3 defaultValue:10485760];

  id v4 = [(MSCupidStateMachine *)self personID];
  self->_retrievalBatchSize = +[MSServerSideConfigManager intValueForParameter:@"mme.streams.client.subMaxDownloadBatchCount" forPersonID:v4 defaultValue:10];

  id v5 = [(MSCupidStateMachine *)self personID];
  self->_maxErrorCount = +[MSServerSideConfigManager intValueForParameter:@"mme.streams.client.subMaxErrorRetryCount" forPersonID:v5 defaultValue:3];
}

- (void)_changeRetrievalStateTo:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    int v7 = [(id)objc_opt_class() _descriptionForRetrievalState:self->_retrievalState];
    id v8 = [(id)objc_opt_class() _descriptionForRetrievalState:v3];
    int v9 = 138543874;
    int v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[RETRIEVALSTATE %{public}@] %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);
  }
  self->_int retrievalState = v3;
}

- (void)_changeStateTo:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    int v7 = [(id)objc_opt_class() _descriptionForState:self->_state];
    id v8 = [(id)objc_opt_class() _descriptionForState:v3];
    int v9 = 138543874;
    int v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[STATE %{public}@] %{public}@ -> %{public}@", (uint8_t *)&v9, 0x20u);
  }
  self->_int state = v3;
}

- (void)dealloc
{
  [(MSSubscriber *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSSubscriber;
  [(MSCupidStateMachine *)&v3 dealloc];
}

- (void)deactivate
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(MSSubscriber *)self stop];
  assetsBeingRetrieved = self->_assetsBeingRetrieved;
  self->_assetsBeingRetrieved = 0;

  reauthProtocol = self->_reauthProtocol;
  self->_reauthProtocol = 0;

  protocol = self->_protocol;
  self->_protocol = 0;

  [(MSSubscribeStorageProtocol *)self->_storageProtocol deactivateRemoveAllFiles:[(MSObjectQueue *)self->_retrievalQueue count] == 0];
  retrievalQueue = self->_retrievalQueue;
  self->_retrievalQueue = 0;

  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

  newSubscriptionsByStreamID = self->_newSubscriptionsByStreamID;
  self->_newSubscriptionsByStreamID = 0;

  v10.receiver = self;
  v10.super_class = (Class)MSSubscriber;
  [(MSCupidStateMachine *)&v10 deactivate];
}

- (MSSubscriber)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MSSubscriber;
  id v8 = [(MSCupidStateMachine *)&v23 initWithPersonID:v6];
  if (v8)
  {
    int v9 = [[MSSubscribeStreamsProtocol alloc] initWithPersonID:v6 baseURL:v7];
    protocol = v8->_protocol;
    v8->_protocol = v9;

    [(MSSubscribeStreamsProtocol *)v8->_protocol setDelegate:v8];
    __int16 v11 = [[MSSubscribeMMCSProtocol alloc] initWithPersonID:v6];
    storageProtocol = v8->_storageProtocol;
    v8->_storageProtocol = (MSSubscribeStorageProtocol *)v11;

    [(MSSubscribeStorageProtocol *)v8->_storageProtocol setDelegate:v8];
    __int16 v13 = [[MSReauthorizationProtocol alloc] initWithPersonID:v6 baseURL:v7];
    reauthProtocol = v8->_reauthProtocol;
    v8->_reauthProtocol = v13;

    [(MSReauthorizationProtocol *)v8->_reauthProtocol setDelegate:v8];
    uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetsBeingRetrieved = v8->_assetsBeingRetrieved;
    v8->_assetsBeingRetrieved = v15;

    __int16 v17 = [MSObjectQueue alloc];
    uint64_t v18 = MSPathSubscriberRetrievalQueueForPersonID(v6);
    uint64_t v19 = [(MSObjectQueue *)v17 initWithPath:v18];
    retrievalQueue = v8->_retrievalQueue;
    v8->_retrievalQueue = (MSObjectQueue *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v8 selector:sel__serverSideConfigurationDidChange_ name:@"MSServerSideConfigChanged" object:0];

    [(MSSubscriber *)v8 _refreshServerSideConfigurationParameters];
  }

  return v8;
}

- (id)ownSubscribedStream
{
  objc_super v3 = [(MSSubscriber *)self _subscriptionsByStreamID];
  id v4 = [(MSCupidStateMachine *)self personID];
  id v5 = [v3 objectForKey:v4];

  return v5;
}

- (id)subscribedStreams
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(MSSubscriber *)self _subscriptionsByStreamID];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(MSSubscriber *)self _subscriptionsByStreamID];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        __int16 v11 = [v6 objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)_descriptionForRetrievalState:(int)a3
{
  if (a3 > 4) {
    return @"???";
  }
  else {
    return off_1E6C3B978[a3];
  }
}

+ (id)_descriptionForState:(int)a3
{
  if (a3 > 2) {
    return @"???";
  }
  else {
    return off_1E6C3B960[a3];
  }
}

+ (BOOL)isInRetryState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_subscriberByID, "allValues", 0);
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

+ (void)stopAllActivities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = objc_msgSend((id)_subscriberByID, "allValues", 0);
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
  v2 = _masterNextActivityDateByPersonID_292();
  uint64_t v3 = [v2 allKeys];

  return v3;
}

+ (id)nextActivityDateForPersonID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _masterNextActivityDateByPersonID_292();
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

+ (id)nextActivityDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _masterNextActivityDateByPersonID_292();
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
    long long v7 = _masterNextActivityDateByPersonID_292();
    id v8 = v7;
    if (v5) {
      [v7 setObject:v5 forKey:v6];
    }
    else {
      [v7 removeObjectForKey:v6];
    }
    _commitMasterManifest_265();
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
  uint64_t v3 = objc_msgSend((id)_subscriberByID, "objectForKey:");
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 forget];
    [(id)_subscriberByID removeObjectForKey:v5];
  }
}

+ (id)_clearInstantiatedSubscribersByPersonID
{
  id v2 = (id)_subscriberByID;
  uint64_t v3 = (void *)_subscriberByID;
  _subscriberByID = 0;

  return v2;
}

+ (id)existingSubscriberForPersonID:(id)a3
{
  return (id)[(id)_subscriberByID objectForKey:a3];
}

+ (id)subscriberForPersonID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)_subscriberByID;
    if (!_subscriberByID)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = (void *)_subscriberByID;
      _subscriberByID = (uint64_t)v5;

      uint64_t v4 = (void *)_subscriberByID;
    }
    long long v7 = [v4 objectForKey:v3];
    if (!v7)
    {
      id v8 = [MSSubscriber alloc];
      int v9 = MSPlatform();
      id v10 = [v9 baseURLForPersonID:v3];
      long long v7 = [(MSSubscriber *)v8 initWithPersonID:v3 baseURL:v10];

      [(id)_subscriberByID setObject:v7 forKey:v3];
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

@end