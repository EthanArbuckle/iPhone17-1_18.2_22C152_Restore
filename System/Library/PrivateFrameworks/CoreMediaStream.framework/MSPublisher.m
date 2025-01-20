@interface MSPublisher
+ (BOOL)isInRetryState;
+ (id)_clearInstantiatedPublishersByPersonID;
+ (id)existingPublisherForPersonID:(id)a3;
+ (id)nextActivityDate;
+ (id)nextActivityDateForPersonID:(id)a3;
+ (id)personIDsWithOutstandingActivities;
+ (id)publisherForPersonID:(id)a3;
+ (void)_setMasterNextActivityDate:(id)a3 forPersonID:(id)a4;
+ (void)forgetPersonID:(id)a3;
+ (void)stopAllActivities;
- (BOOL)_isAllowedToUpload;
- (BOOL)_isInRetryState;
- (BOOL)_verifyAssetFile:(id)a3;
- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 outError:(id *)a4;
- (BOOL)enqueueAssetCollections:(id)a3 outError:(id *)a4;
- (MSMediaStreamDaemon)daemon;
- (MSPublisher)initWithPersonID:(id)a3 baseURL:(id)a4;
- (MSPublisherDelegate)delegate;
- (NSURL)storageProtocolURL;
- (id)_abortedError;
- (id)_checkAssetCollectionFiles:(id)a3;
- (id)_checkObjectWrappers:(id)a3;
- (id)_collectionWithNoDerivatives:(id)a3;
- (id)_invalidStreamsResponseErrorUnderlyingError:(id)a3;
- (int)_stop;
- (int)publishBatchSize;
- (int)publishStorageProtocol:(id)a3 didRequestFDForAsset:(id)a4;
- (int64_t)publishTargetByteCount;
- (void)_abort;
- (void)_addAssetToFileHashMap:(id)a3;
- (void)_categorizeError:(id)a3 setOutIsIgnorable:(BOOL *)a4 setOutIsCounted:(BOOL *)a5 setOutIsFatal:(BOOL *)a6 setOutNeedsBackoff:(BOOL *)a7 setOutIsTemporary:(BOOL *)a8 setOutIsTokenAuth:(BOOL *)a9 setOutIsAuthError:(BOOL *)a10;
- (void)_didFinishUsingAssetCollections:(id)a3;
- (void)_forget;
- (void)_quarantineOrDiscardWrappers:(id)a3 withError:(id)a4;
- (void)_refreshServerSideConfiguredParameters;
- (void)_registerAllAssetsForWrapper:(id)a3;
- (void)_registerAsset:(id)a3;
- (void)_removeAssetFromFileHashMap:(id)a3;
- (void)_removeAssetsInAssetCollectionWrappersFromAssetMap:(id)a3;
- (void)_requestDerivatives;
- (void)_sendFilesToMMCS;
- (void)_sendMetadataToStreams;
- (void)_sendUploadComplete;
- (void)_serverSideConfigurationDidChange:(id)a3;
- (void)_updateMasterManifest;
- (void)computeHashForAsset:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)publish;
- (void)publishStorageProtocol:(id)a3 didFinishUploadingAsset:(id)a4 error:(id)a5;
- (void)publishStorageProtocol:(id)a3 didFinishUsingFD:(int)a4 forAsset:(id)a5;
- (void)publishStorageProtocolDidFinishPublishingAllAssets:(id)a3;
- (void)publishStreamsProtocol:(id)a3 didFinishSendingUploadCompleteError:(id)a4;
- (void)publishStreamsProtocol:(id)a3 didFinishUploadingMetadataResponse:(id)a4 error:(id)a5;
- (void)publishStreamsProtocol:(id)a3 didReceiveAuthenticationError:(id)a4;
- (void)reenqueueQuarantinedAssetCollections;
- (void)setDaemon:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPublishBatchSize:(int)a3;
- (void)setPublishTargetByteCount:(int64_t)a3;
- (void)setStorageProtocolURL:(id)a3;
- (void)submitAssetCollectionsForPublication:(id)a3 skipAssetCollections:(id)a4;
@end

@implementation MSPublisher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSizeByUTI, 0);
  objc_storeStrong((id *)&self->_tempFiles, 0);
  objc_storeStrong((id *)&self->_storageProtocolURL, 0);
  objc_storeStrong((id *)&self->_storageProtocol, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_fileHashToAssetMap, 0);
  objc_storeStrong((id *)&self->_sendingQueue, 0);
  objc_storeStrong((id *)&self->_requestAuthQueue, 0);
  objc_storeStrong((id *)&self->_pendingDerivativesQueue, 0);
  objc_storeStrong((id *)&self->_quarantinedQueue, 0);
  objc_storeStrong((id *)&self->_derivativesQueue, 0);
  objc_storeStrong((id *)&self->_uploadQueue, 0);
}

- (void)setPublishBatchSize:(int)a3
{
  self->_publishBatchSize = a3;
}

- (int)publishBatchSize
{
  return self->_publishBatchSize;
}

- (void)setPublishTargetByteCount:(int64_t)a3
{
  self->_publishTargetByteCount = a3;
}

- (int64_t)publishTargetByteCount
{
  return self->_publishTargetByteCount;
}

- (void)setStorageProtocolURL:(id)a3
{
}

- (NSURL)storageProtocolURL
{
  return self->_storageProtocolURL;
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
  self->_delegate = (MSPublisherDelegate *)a3;
}

- (MSPublisherDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)_isInRetryState
{
  return (self->_state < 0xBu) & (0x492u >> self->_state);
}

- (void)_forget
{
  uploadQueue = self->_uploadQueue;
  self->_uploadQueue = 0;

  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;
}

- (void)_abort
{
  [(MSPublisher *)self _stop];
  id v13 = [(MSPublisher *)self _abortedError];
  v3 = [(MSObjectQueue *)self->_uploadQueue allObjectWrappersMaxCount:5];
  if ([v3 count])
  {
    do
    {
      v4 = (void *)MEMORY[0x1E019E3B0]();
      if (objc_opt_respondsToSelector())
      {
        delegate = self->_delegate;
        v6 = +[MSObjectWrapper objectsFromWrappers:v3];
        [(MSPublisherDelegate *)delegate publisher:self didEncounterError:v13 publishingAssetCollections:v6];
      }
      [(MSObjectQueue *)self->_uploadQueue removeObjectWrappersFromQueue:v3];
      v7 = [(MSObjectQueue *)self->_uploadQueue allObjectWrappersMaxCount:5];

      v3 = v7;
    }
    while ([v7 count]);
  }
  else
  {
    v7 = v3;
  }
  v8 = [(MSObjectQueue *)self->_quarantinedQueue allObjectWrappersMaxCount:5];

  if ([v8 count])
  {
    do
    {
      v9 = (void *)MEMORY[0x1E019E3B0]();
      if (objc_opt_respondsToSelector())
      {
        v10 = self->_delegate;
        v11 = +[MSObjectWrapper objectsFromWrappers:v8];
        [(MSPublisherDelegate *)v10 publisher:self didEncounterError:v13 publishingAssetCollections:v11];
      }
      [(MSObjectQueue *)self->_quarantinedQueue removeObjectWrappersFromQueue:v8];
      v12 = [(MSObjectQueue *)self->_quarantinedQueue allObjectWrappersMaxCount:5];

      v8 = v12;
    }
    while ([v12 count]);
  }
  else
  {
    v12 = v8;
  }
  [(MSPublisher *)self _updateMasterManifest];
}

- (id)_abortedError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_ABORTED");
  v4 = [v2 MSErrorWithDomain:@"MSPublisherErrorDomain" code:7 description:v3];

  return v4;
}

- (int)_stop
{
  unsigned int state = self->_state;
  if (state == 6 || state == 12)
  {
    v5 = &OBJC_IVAR___MSPublisher__protocol;
  }
  else
  {
    if (state != 9) {
      goto LABEL_10;
    }
    v5 = &OBJC_IVAR___MSPublisher__storageProtocol;
  }
  [*(id *)((char *)&self->super.super.isa + *v5) abort];
  unsigned int state = self->_state;
LABEL_10:
  BOOL v6 = state > 0xC;
  int v7 = (1 << state) & 0x1B6C;
  if (!v6 && v7 != 0) {
    [(MSDaemon *)self->_daemon releaseBusy];
  }
  [(NSMutableArray *)self->_requestAuthQueue removeAllObjects];
  [(NSMutableArray *)self->_sendingQueue removeAllObjects];
  [(NSMutableDictionary *)self->_fileHashToAssetMap removeAllObjects];
  int result = self->_state;
  self->_unsigned int state = 0;
  return result;
}

- (void)publishStreamsProtocol:(id)a3 didFinishSendingUploadCompleteError:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  int state = self->_state;
  if (state == 12)
  {
    unint64_t v10 = 0x1EAA94000uLL;
    if (v7)
    {
      if ([v7 MSIsTemporaryNetworkError])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_opt_class();
          id v12 = v11;
          id v13 = [(MSCupidStateMachine *)self personID];
          *(_DWORD *)buf = 138543618;
          *(void *)v44 = v11;
          *(_WORD *)&v44[8] = 2112;
          v45 = v13;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Encountered temporary error. Will try again later...", buf, 0x16u);
        }
        self->_int state = 10;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v27 = objc_opt_class();
          id v28 = v27;
          v29 = [(MSCupidStateMachine *)self personID];
          v30 = [v8 MSVerboseDescription];
          *(_DWORD *)buf = 138543874;
          *(void *)v44 = v27;
          *(_WORD *)&v44[8] = 2112;
          v45 = v29;
          __int16 v46 = 2114;
          uint64_t v47 = (uint64_t)v30;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error sending upload complete: %{public}@", buf, 0x20u);

          unint64_t v10 = 0x1EAA94000uLL;
        }
        if ([v8 MSNeedsBackoff]) {
          [(MSCupidStateMachine *)self _backoffStreamsBackoffTimer];
        }
        if ([v8 MSIsCounted])
        {
          id v36 = v6;
          v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_sendingQueue, "count"));
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v21 = self->_sendingQueue;
          uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v40 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                objc_msgSend(v26, "setErrorCount:", objc_msgSend(v26, "errorCount") + 1);
                if ((int)[v26 errorCount] >= self->_maxErrorCount) {
                  [v20 addObject:v26];
                }
              }
              uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v39 objects:v50 count:16];
            }
            while (v23);
          }

          [(MSObjectQueue *)self->_uploadQueue commitErrorCountsForObjectWrappers:self->_sendingQueue];
          id v6 = v36;
          unint64_t v10 = 0x1EAA94000uLL;
          if ([v20 count])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v31 = objc_opt_class();
              id v35 = v31;
              v32 = [(MSCupidStateMachine *)self personID];
              uint64_t v34 = [v20 count];
              v33 = [v8 MSVerboseDescription];
              *(_DWORD *)buf = 138544130;
              *(void *)v44 = v31;
              *(_WORD *)&v44[8] = 2112;
              v45 = v32;
              __int16 v46 = 2048;
              uint64_t v47 = v34;
              __int16 v48 = 2114;
              v49 = v33;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed to send upload complete for %lu asset collections. Error: %{public}@", buf, 0x2Au);

              unint64_t v10 = 0x1EAA94000;
            }
            [(MSObjectQueue *)self->_uploadQueue removeObjectWrappersFromQueue:v20];
            [(MSPublisher *)self _updateMasterManifest];
            [(MSPublisher *)self _quarantineOrDiscardWrappers:v20 withError:v8];
          }
        }
        [(NSMutableArray *)self->_sendingQueue removeAllObjects];
        self->_int state = 4;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke;
        v38[3] = &unk_1E6C3DA38;
        v38[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v38);
      }
    }
    else
    {
      daemon = self->_daemon;
      v15 = [(MSCupidStateMachine *)self personID];
      [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v15];

      [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
      v16 = +[MSObjectWrapper objectsFromWrappers:self->_sendingQueue];
      if (objc_opt_respondsToSelector()) {
        [(MSPublisherDelegate *)self->_delegate publisher:self didFinishPublishingAssetCollections:v16];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v17 = objc_opt_class();
        id v18 = v17;
        v19 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        *(void *)v44 = v17;
        *(_WORD *)&v44[8] = 2112;
        v45 = v19;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Finished sending upload complete.", buf, 0x16u);

        unint64_t v10 = 0x1EAA94000uLL;
      }
      [(MSPublisher *)self _didFinishUsingAssetCollections:v16];
      [(MSObjectQueue *)self->_uploadQueue removeObjectWrappersFromQueue:self->_sendingQueue];
      [(MSPublisher *)self _updateMasterManifest];
      [(NSMutableArray *)self->_sendingQueue removeAllObjects];
      self->_int state = 4;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke_115;
      block[3] = &unk_1E6C3DA38;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    [*(id *)((char *)&self->super.super.isa + *(int *)(v10 + 3852)) releaseBusy];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v44 = 12;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = state;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }
}

uint64_t __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

uint64_t __74__MSPublisher_publishStreamsProtocol_didFinishSendingUploadCompleteError___block_invoke_115(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (void)_sendUploadComplete
{
  self->_int state = 12;
  protocol = self->_protocol;
  id v3 = +[MSObjectWrapper objectsFromWrappers:self->_sendingQueue];
  [(MSPublishStreamsProtocol *)protocol sendUploadCompleteForAssetCollections:v3];
}

- (void)publishStorageProtocolDidFinishPublishingAllAssets:(id)a3
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  __int16 v140 = 0;
  __int16 v139 = 0;
  __int16 v138 = 0;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = self->_sendingQueue;
  uint64_t v107 = [(NSMutableArray *)obj countByEnumeratingWithState:&v134 objects:v155 count:16];
  int v4 = 0;
  v5 = 0;
  if (v107)
  {
    uint64_t v105 = *(void *)v135;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v135 != v105) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v134 + 1) + 8 * (void)v6) object];
        v8 = [v7 masterAsset];
        v9 = [v8 error];

        [(MSPublisher *)self _categorizeError:v9 setOutIsIgnorable:(char *)&v140 + 1 setOutIsCounted:&v140 setOutIsFatal:(char *)&v139 + 1 setOutNeedsBackoff:&v139 setOutIsTemporary:(char *)&v138 + 1 setOutIsTokenAuth:0 setOutIsAuthError:&v138];
        uint64_t v10 = [v9 MSMMCSRetryAfterDate];
        if (v10) {
          [(MSCupidStateMachine *)self _didReceiveMMCSRetryAfterDate:v10];
        }
        v109 = (void *)v10;
        v111 = v7;
        v114 = v6;
        v4 |= v9 != 0;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        v11 = [v7 derivedAssets];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v130 objects:v154 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v131;
          v5 = v9;
          do
          {
            uint64_t v15 = 0;
            v16 = v5;
            do
            {
              if (*(void *)v131 != v14) {
                objc_enumerationMutation(v11);
              }
              v5 = [*(id *)(*((void *)&v130 + 1) + 8 * v15) error];

              [(MSPublisher *)self _categorizeError:v5 setOutIsIgnorable:(char *)&v140 + 1 setOutIsCounted:&v140 setOutIsFatal:(char *)&v139 + 1 setOutNeedsBackoff:&v139 setOutIsTemporary:(char *)&v138 + 1 setOutIsTokenAuth:0 setOutIsAuthError:&v138];
              v17 = [v5 MSMMCSRetryAfterDate];
              if (v17) {
                [(MSCupidStateMachine *)self _didReceiveMMCSRetryAfterDate:v17];
              }
              v4 |= v5 != 0;

              ++v15;
              v16 = v5;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v130 objects:v154 count:16];
          }
          while (v13);
        }
        else
        {
          v5 = v9;
        }

        id v6 = v114 + 1;
      }
      while (v114 + 1 != (char *)v107);
      uint64_t v107 = [(NSMutableArray *)obj countByEnumeratingWithState:&v134 objects:v155 count:16];
    }
    while (v107);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v18 = self->_tempFiles;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v126 objects:v153 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v127 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v126 + 1) + 8 * i);
        uint64_t v24 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v24 removeItemAtPath:v23 error:0];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v126 objects:v153 count:16];
    }
    while (v20);
  }

  [(NSMutableArray *)self->_tempFiles removeAllObjects];
  [(NSMutableDictionary *)self->_fileHashToAssetMap removeAllObjects];
  uint64_t v25 = [(NSMutableArray *)self->_sendingQueue count];
  unint64_t sendingQueueCount = self->_sendingQueueCount;
  if (v25 != sendingQueueCount)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v78 = objc_opt_class();
      id v79 = v78;
      v80 = [(MSCupidStateMachine *)self personID];
      unint64_t v81 = self->_sendingQueueCount;
      uint64_t v82 = [(NSMutableArray *)self->_sendingQueue count];
      *(_DWORD *)buf = 138544130;
      v143 = v78;
      __int16 v144 = 2112;
      uint64_t v145 = (uint64_t)v80;
      __int16 v146 = 2048;
      unint64_t v147 = v81;
      __int16 v148 = 2048;
      uint64_t v149 = v82;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found mismatch between expecting sending queue count and actual count. Expected %lu, actually %lu.", buf, 0x2Au);
    }
    v31 = (void *)MEMORY[0x1E4F28C58];
    v32 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_SEND_QUEUE_MISMATCH");
    uint64_t v33 = [v31 MSErrorWithDomain:@"MSPublisherErrorDomain" code:8 description:v32];

    __int16 v138 = 0;
    LOBYTE(v139) = 0;
    v5 = (void *)v33;
    __int16 v140 = 1;
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v74 = objc_opt_class();
      id v75 = v74;
      v76 = [(MSCupidStateMachine *)self personID];
      uint64_t v77 = [(NSMutableArray *)self->_sendingQueue count];
      *(_DWORD *)buf = 138543874;
      v143 = v74;
      __int16 v144 = 2112;
      uint64_t v145 = (uint64_t)v76;
      __int16 v146 = 2048;
      unint64_t v147 = v77;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error uploading %lu asset collections.", buf, 0x20u);
    }
    if ((_BYTE)v140)
    {
      unint64_t v102 = sendingQueueCount;
      uint64_t v103 = v25;
      uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_sendingQueue, "count"));
      v108 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_sendingQueue, "count"));
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      v115 = self->_sendingQueue;
      uint64_t v35 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v122 objects:v152 count:16];
      v106 = v34;
      if (!v35) {
        goto LABEL_56;
      }
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v123;
      while (1)
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v123 != v37) {
            objc_enumerationMutation(v115);
          }
          long long v39 = *(void **)(*((void *)&v122 + 1) + 8 * j);
          long long v40 = [v39 object];
          long long v41 = [v40 masterAsset];
          long long v42 = [v41 error];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v45 = objc_opt_class();
            id v112 = v45;
            uint64_t v46 = [(MSCupidStateMachine *)self personID];
            v110 = [v42 domain];
            uint64_t v47 = [v42 code];
            *(_DWORD *)buf = 138544386;
            v143 = v45;
            __int16 v144 = 2112;
            uint64_t v145 = v46;
            __int16 v48 = (void *)v46;
            __int16 v146 = 2114;
            unint64_t v147 = (unint64_t)v40;
            __int16 v148 = 2114;
            uint64_t v149 = (uint64_t)v110;
            __int16 v150 = 2048;
            uint64_t v151 = v47;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ error uploading %{public}@: %{public}@ %ld.", buf, 0x34u);

            uint64_t v34 = v106;
          }
          if (HIBYTE(v139))
          {
            [v39 setErrorCount:self->_maxErrorCount];
            v43 = v34;
          }
          else
          {
            objc_msgSend(v39, "setErrorCount:", objc_msgSend(v39, "errorCount") + 1);
            int v44 = [v39 errorCount];
            v43 = v34;
            if (v44 < self->_maxErrorCount)
            {
              if (![v42 MSIsRegistrationError]) {
                goto LABEL_54;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v49 = objc_opt_class();
                id v113 = v49;
                v50 = [(MSCupidStateMachine *)self personID];
                *(_DWORD *)buf = 138543874;
                v143 = v49;
                __int16 v144 = 2112;
                uint64_t v145 = (uint64_t)v50;
                __int16 v146 = 2114;
                unint64_t v147 = (unint64_t)v40;
                _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ needs to re-register %{public}@.", buf, 0x20u);

                uint64_t v34 = v106;
              }
              [(MSPublisher *)self _registerAllAssetsForWrapper:v39];
              v43 = v108;
            }
          }
          [v43 addObject:v39];
LABEL_54:
        }
        uint64_t v36 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v122 objects:v152 count:16];
        if (!v36)
        {
LABEL_56:

          uint64_t v51 = v108;
          if ([v108 count]) {
            [(MSObjectQueue *)self->_uploadQueue commitObjectsWrappers:v108];
          }
          [(MSObjectQueue *)self->_uploadQueue commitErrorCountsForObjectWrappers:self->_sendingQueue];
          if ([v34 count])
          {
            [(MSObjectQueue *)self->_uploadQueue removeObjectWrappersFromQueue:v34];
            [(MSPublisher *)self _updateMasterManifest];
            long long v120 = 0u;
            long long v121 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id v116 = v34;
            uint64_t v52 = [v116 countByEnumeratingWithState:&v118 objects:v141 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              uint64_t v54 = *(void *)v119;
              do
              {
                for (uint64_t k = 0; k != v53; ++k)
                {
                  if (*(void *)v119 != v54) {
                    objc_enumerationMutation(v116);
                  }
                  v56 = *(void **)(*((void *)&v118 + 1) + 8 * k);
                  v57 = [v56 object];
                  v58 = [v57 masterAsset];
                  v59 = [v58 error];

                  v60 = [MEMORY[0x1E4F1C978] arrayWithObject:v56];
                  [(MSPublisher *)self _quarantineOrDiscardWrappers:v60 withError:v59];
                }
                uint64_t v53 = [v116 countByEnumeratingWithState:&v118 objects:v141 count:16];
              }
              while (v53);
            }

            uint64_t v34 = v106;
            uint64_t v51 = v108;
          }
          if ([v34 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v86 = objc_opt_class();
            id v87 = v86;
            v88 = [(MSCupidStateMachine *)self personID];
            uint64_t v89 = [v34 count];
            *(_DWORD *)buf = 138543874;
            v143 = v86;
            __int16 v144 = 2112;
            uint64_t v145 = (uint64_t)v88;
            __int16 v146 = 2048;
            unint64_t v147 = v89;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Gave up uploading %lu asset collections.", buf, 0x20u);
          }
          uint64_t v61 = [(NSMutableArray *)self->_sendingQueue count];
          unint64_t sendingQueueCount = v102;
          uint64_t v25 = v103;
          if (v61 != [v34 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v90 = objc_opt_class();
            id v91 = v90;
            v92 = [(MSCupidStateMachine *)self personID];
            uint64_t v93 = [(NSMutableArray *)self->_sendingQueue count];
            uint64_t v94 = v93 - [v106 count];
            uint64_t v34 = v106;
            *(_DWORD *)buf = 138543874;
            v143 = v90;
            __int16 v144 = 2112;
            uint64_t v145 = (uint64_t)v92;
            __int16 v146 = 2048;
            unint64_t v147 = v94;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Will retry uploading %ld asset collections.", buf, 0x20u);
          }
          break;
        }
      }
    }
    self->_int state = 4;
    [(NSMutableArray *)self->_sendingQueue removeAllObjects];
    if (v25 != sendingQueueCount)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v83 = objc_opt_class();
        id v84 = v83;
        v85 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        v143 = v83;
        __int16 v144 = 2112;
        uint64_t v145 = (uint64_t)v85;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Detected an inconsistent state.", buf, 0x16u);
      }
      v62 = MSPlatform();
      char v63 = objc_opt_respondsToSelector();

      if (v63)
      {
        v64 = MSPlatform();
        [v64 didDetectUnrecoverableCondition];
      }
    }
    p_daemon = &self->_daemon;
LABEL_83:
    [(MSDaemon *)*p_daemon releaseBusy];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MSPublisher_publishStorageProtocolDidFinishPublishingAllAssets___block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_84;
  }
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      v66 = objc_opt_class();
      id v67 = v66;
      v68 = [(MSCupidStateMachine *)self personID];
      uint64_t v69 = [(NSMutableArray *)self->_sendingQueue count];
      *(_DWORD *)buf = 138543874;
      v143 = v66;
      __int16 v144 = 2112;
      uint64_t v145 = (uint64_t)v68;
      __int16 v146 = 2048;
      unint64_t v147 = v69;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Successfully uploaded %lu asset collections.", buf, 0x20u);
    }
    p_daemon = &self->_daemon;
    daemon = self->_daemon;
    v71 = [(MSCupidStateMachine *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v71];

    [(MSCupidStateMachine *)self _resetMMCSBackoffTimer];
    self->_int state = 10;
    goto LABEL_83;
  }
  if (!HIBYTE(v140))
  {
    if (HIBYTE(v138))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v95 = objc_opt_class();
        id v96 = v95;
        v97 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        v143 = v95;
        __int16 v144 = 2112;
        uint64_t v145 = (uint64_t)v97;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered temporary network issues during upload. Will try again later...", buf, 0x16u);
      }
      self->_int state = 7;
LABEL_93:
      [(MSDaemon *)self->_daemon releaseBusy];
      goto LABEL_84;
    }
    if ((_BYTE)v138)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v98 = objc_opt_class();
        id v99 = v98;
        v100 = [(MSCupidStateMachine *)self personID];
        uint64_t v101 = [(NSMutableArray *)self->_sendingQueue count];
        *(_DWORD *)buf = 138543874;
        v143 = v98;
        __int16 v144 = 2112;
        uint64_t v145 = (uint64_t)v100;
        __int16 v146 = 2048;
        unint64_t v147 = v101;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Received auth error. Resending metadata for %lu asset collections.", buf, 0x20u);
      }
      [(NSMutableArray *)self->_sendingQueue removeAllObjects];
      self->_int state = 4;
      v72 = self->_daemon;
      v73 = [(MSCupidStateMachine *)self personID];
      [(MSMediaStreamDaemon *)v72 didReceiveAuthenticationFailureForPersonID:v73];

      goto LABEL_93;
    }
    if ((_BYTE)v139) {
      [(MSCupidStateMachine *)self _backoffMMCSBackoffTimer];
    }
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_opt_class();
    id v28 = v27;
    v29 = [(MSCupidStateMachine *)self personID];
    uint64_t v30 = [(NSMutableArray *)self->_sendingQueue count];
    *(_DWORD *)buf = 138543874;
    v143 = v27;
    __int16 v144 = 2112;
    uint64_t v145 = (uint64_t)v29;
    __int16 v146 = 2048;
    unint64_t v147 = v30;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Ignoring errors for %lu asset collections.", buf, 0x20u);
  }
LABEL_84:
}

uint64_t __66__MSPublisher_publishStorageProtocolDidFinishPublishingAllAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (void)_categorizeError:(id)a3 setOutIsIgnorable:(BOOL *)a4 setOutIsCounted:(BOOL *)a5 setOutIsFatal:(BOOL *)a6 setOutNeedsBackoff:(BOOL *)a7 setOutIsTemporary:(BOOL *)a8 setOutIsTokenAuth:(BOOL *)a9 setOutIsAuthError:(BOOL *)a10
{
  id v15 = a3;
  if (v15)
  {
    v29 = a8;
    id v30 = v15;
    int v16 = [v15 MSCanBeIgnored];
    char v17 = [v30 MSIsCounted];
    char v18 = [v30 MSIsFatal];
    char v19 = [v30 MSNeedsBackoff];
    char v20 = [v30 MSIsTemporaryNetworkError];
    char v21 = [v30 MSIsBadTokenError];
    char v22 = [v30 MSIsAuthError];
    if (a4 && v16) {
      *a4 = 1;
    }
    char v23 = v17 ^ 1;
    if (!a5) {
      char v23 = 1;
    }
    if ((v23 & 1) == 0) {
      *a5 = 1;
    }
    char v24 = v18 ^ 1;
    if (!a6) {
      char v24 = 1;
    }
    if ((v24 & 1) == 0) {
      *a6 = 1;
    }
    char v25 = v19 ^ 1;
    if (!a7) {
      char v25 = 1;
    }
    if ((v25 & 1) == 0) {
      *a7 = 1;
    }
    char v26 = v20 ^ 1;
    if (!v29) {
      char v26 = 1;
    }
    if ((v26 & 1) == 0) {
      BOOL *v29 = 1;
    }
    char v27 = v21 ^ 1;
    if (!a9) {
      char v27 = 1;
    }
    if ((v27 & 1) == 0) {
      *a9 = 1;
    }
    char v28 = v22 ^ 1;
    if (!a10) {
      char v28 = 1;
    }
    id v15 = v30;
    if ((v28 & 1) == 0) {
      *a10 = 1;
    }
  }
}

- (void)publishStorageProtocol:(id)a3 didFinishUsingFD:(int)a4 forAsset:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = [(MSCupidStateMachine *)self personID];
    int v14 = 138544130;
    id v15 = v11;
    __int16 v16 = 2112;
    char v17 = v13;
    __int16 v18 = 1024;
    int v19 = v6;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Closing FD %d for asset %{public}@", (uint8_t *)&v14, 0x26u);
  }
  uint64_t v10 = [v9 fileData];

  if (v10 || (objc_opt_respondsToSelector() & 1) == 0) {
    close(v6);
  }
  else {
    [(MSPublisherDelegate *)self->_delegate publisher:self didRequestCloseFileDescriptor:v6 forAsset:v9];
  }
}

- (int)publishStorageProtocol:(id)a3 didRequestFDForAsset:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fileData];

  if (v8)
  {
    id v9 = [v7 fileData];
    id v33 = 0;
    uint64_t v10 = [NSString MSTempFileOutFileName:&v33];
    id v11 = v33;
    if (v10 == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = objc_opt_class();
        id v15 = v14;
        __int16 v16 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        uint64_t v35 = v14;
        __int16 v36 = 2112;
        uint64_t v37 = v16;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Failed to create temp file.", buf, 0x16u);
      }
    }
    else
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v10 closeOnDealloc:0];
      uint64_t v13 = v12;
      if (v12)
      {
        [v12 writeData:v9];
        [(NSMutableArray *)self->_tempFiles addObject:v11];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        id v23 = v22;
        char v24 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v22;
        __int16 v36 = 2112;
        uint64_t v37 = v24;
        __int16 v38 = 2112;
        id v39 = v11;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Failed to write temp file at path %@.", buf, 0x20u);
      }
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    LODWORD(v10) = [(MSPublisherDelegate *)self->_delegate publisher:self didRequestOpenFileDescriptorForAsset:v7];
  }
  else
  {
    char v17 = [v7 path];

    if (v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        char v26 = objc_opt_class();
        id v27 = v26;
        char v28 = [(MSCupidStateMachine *)self personID];
        v29 = [v7 path];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v26;
        __int16 v36 = 2112;
        uint64_t v37 = v28;
        __int16 v38 = 2112;
        id v39 = v29;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Opening asset file at path %@...", buf, 0x20u);
      }
      id v18 = [v7 path];
      LODWORD(v10) = open((const char *)[v18 fileSystemRepresentation], 0);

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v19 = objc_opt_class();
        id v20 = v19;
        id v21 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v19;
        __int16 v36 = 2112;
        uint64_t v37 = v21;
        __int16 v38 = 1024;
        LODWORD(v39) = v10;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ ... got FD %d.", buf, 0x1Cu);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v30 = objc_opt_class();
        id v31 = v30;
        v32 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543874;
        uint64_t v35 = v30;
        __int16 v36 = 2112;
        uint64_t v37 = v32;
        __int16 v38 = 2114;
        id v39 = v7;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot retrieve file descriptor for asset: %{public}@", buf, 0x20u);
      }
      LODWORD(v10) = -1;
    }
  }

  return v10;
}

- (void)publishStorageProtocol:(id)a3 didFinishUploadingAsset:(id)a4 error:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    [v9 setError:v10];
  }
  if (objc_opt_respondsToSelector()) {
    [(MSPublisherDelegate *)self->_delegate publisher:self didRequestCloseFileDescriptor:0xFFFFFFFFLL forAsset:v9];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = [(MSCupidStateMachine *)self personID];
    int v14 = [v10 MSVerboseDescription];
    int v15 = 138543874;
    __int16 v16 = v11;
    __int16 v17 = 2112;
    id v18 = v13;
    __int16 v19 = 2114;
    id v20 = v14;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Finished uploading asset. Error: %{public}@", (uint8_t *)&v15, 0x20u);
  }
}

- (void)_sendFilesToMMCS
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    id v4 = v3;
    v5 = [(MSCupidStateMachine *)self personID];
    uint64_t v6 = [(NSMutableArray *)self->_sendingQueue count];
    *(_DWORD *)buf = 138543874;
    *(void *)uint64_t v47 = v3;
    *(_WORD *)&v47[8] = 2112;
    __int16 v48 = v5;
    __int16 v49 = 2048;
    uint64_t v50 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ uploading %ld assets...", buf, 0x20u);
  }
  int state = self->_state;
  if (state == 8)
  {
    if (objc_opt_respondsToSelector())
    {
      delegate = self->_delegate;
      id v9 = +[MSObjectWrapper objectsFromWrappers:self->_sendingQueue];
      [(MSPublisherDelegate *)delegate publisher:self willPublishAssetCollections:v9];
    }
    self->_unint64_t sendingQueueCount = [(NSMutableArray *)self->_sendingQueue count];
    [(NSMutableDictionary *)self->_fileHashToAssetMap removeAllObjects];
    id v10 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    obuint64_t j = self->_sendingQueue;
    uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v41;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v41 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v11;
          id v12 = [*(id *)(*((void *)&v40 + 1) + 8 * v11) object];
          uint64_t v13 = [v12 masterAsset];
          int v14 = [NSString MSMakeUUID];
          [v13 addMetadataValue:v14 forKey:@"MSAssetMetadataAssetFileTransferUUID"];

          [v10 addObject:v13];
          id v33 = v13;
          [(MSPublisher *)self _addAssetToFileHashMap:v13];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v34 = v12;
          int v15 = [v12 derivedAssets];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v37 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v21 = [NSString MSMakeUUID];
                [v20 addMetadataValue:v21 forKey:@"MSAssetMetadataAssetFileTransferUUID"];

                [v10 addObject:v20];
                [(MSPublisher *)self _addAssetToFileHashMap:v20];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
            }
            while (v17);
          }

          uint64_t v11 = v35 + 1;
        }
        while (v35 + 1 != v32);
        uint64_t v32 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v32);
    }

    self->_int state = 9;
    uint64_t v22 = MSPlatform();
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      char v24 = MSPlatform();
      char v25 = [(MSCupidStateMachine *)self personID];
      char v26 = [v24 contentURLForPersonID:v25];

      if (v26)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          id v27 = objc_opt_class();
          id v28 = v27;
          v29 = [(MSCupidStateMachine *)self personID];
          *(_DWORD *)buf = 138543874;
          *(void *)uint64_t v47 = v27;
          *(_WORD *)&v47[8] = 2112;
          __int16 v48 = v29;
          __int16 v49 = 2114;
          uint64_t v50 = (uint64_t)v26;
          _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Using contentURL %{public}@ from MSPlatform for upload.", buf, 0x20u);
        }
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get contentURL from MSPlatform. Using URL from metadata for upload", buf, 2u);
      }
    }
    char v26 = self->_storageProtocolURL;
LABEL_29:
    [(MSPublishStorageProtocol *)self->_storageProtocol publishAssets:v10 URL:v26];

    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)uint64_t v47 = 8;
    *(_WORD *)&v47[4] = 1024;
    *(_DWORD *)&v47[6] = state;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }
}

- (void)publishStreamsProtocol:(id)a3 didReceiveAuthenticationError:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(MSCupidStateMachine *)self personID];
    int v10 = 138543618;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Found authentication error. Will try again later...", (uint8_t *)&v10, 0x16u);
  }
  [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
  self->_int state = 4;
  daemon = self->_daemon;
  uint64_t v6 = [(MSCupidStateMachine *)self personID];
  [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationFailureForPersonID:v6];

  [(MSDaemon *)self->_daemon releaseBusy];
}

- (void)publishStreamsProtocol:(id)a3 didFinishUploadingMetadataResponse:(id)a4 error:(id)a5
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int state = self->_state;
  if (state != 6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v204 = 6;
      *(_WORD *)&v204[4] = 1024;
      *(_DWORD *)&v204[6] = state;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
    }
    goto LABEL_150;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v59 = objc_opt_class();
    id v60 = v59;
    uint64_t v61 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    *(void *)v204 = v59;
    *(_WORD *)&v204[8] = 2112;
    v205 = v61;
    __int16 v206 = 2114;
    uint64_t v207 = (uint64_t)v9;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ received metadata upload response: %{public}@", buf, 0x20u);
  }
  uint64_t v145 = self;
  if (v10) {
    goto LABEL_55;
  }
  __int16 v12 = [v9 objectForKey:@"assets"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v58 = (void *)MEMORY[0x1E4F28C58];
    id v30 = (void *)MSCFCopyLocalizedString(@"ERROR_PUT_CONNECTION_INVALID_ASSET_HASH");
    id v33 = [v58 MSErrorWithDomain:@"MSStreamsPutConnectionErrorDomain" code:3 description:v30];
    id v10 = [(MSPublisher *)self _invalidStreamsResponseErrorUnderlyingError:v33];
    goto LABEL_54;
  }
  id v136 = v9;
  id v139 = v8;
  long long v192 = 0u;
  long long v193 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  v143 = v12;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v190 objects:v202 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v191;
    uint64_t v17 = MEMORY[0x1E4F14500];
    id v146 = v13;
    uint64_t v144 = *(void *)v191;
    do
    {
      uint64_t v18 = 0;
      id v149 = (id)v15;
      do
      {
        if (*(void *)v191 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v152 = v18;
        __int16 v19 = *(void **)(*((void *)&v190 + 1) + 8 * v18);
        id v20 = [v13 objectForKey:v19];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          fileHashToAssetMap = v145->_fileHashToAssetMap;
          uint64_t v22 = [v19 MSHexData];
          char v23 = [(NSMutableDictionary *)fileHashToAssetMap objectForKey:v22];

          long long v188 = 0u;
          long long v189 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v186 objects:v201 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v187;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v187 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = *(void **)(*((void *)&v186 + 1) + 8 * i);
                [v29 setMMCSAccessHeader:v20];
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)v204 = v29;
                  _os_log_debug_impl(&dword_1DC434000, v17, OS_LOG_TYPE_DEBUG, "Setting MMCS header in asset %{public}@", buf, 0xCu);
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v186 objects:v201 count:16];
            }
            while (v26);
          }

          id v13 = v146;
          uint64_t v15 = (uint64_t)v149;
          uint64_t v16 = v144;
        }

        uint64_t v18 = v152 + 1;
      }
      while (v152 + 1 != v15);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v190 objects:v202 count:16];
    }
    while (v15);
  }

  id v30 = [v9 objectForKey:@"mmcsurl"];
  self = v145;
  if (v30)
  {
    uint64_t v31 = [MEMORY[0x1E4F1CB10] URLWithString:v30];
    if (!v31)
    {
      v62 = (void *)MEMORY[0x1E4F28C58];
      CFStringRef v150 = MSCFCopyLocalizedString(@"ERROR_PUT_CONNECTION_INVALID_STORAGE_URL");
      uint64_t v53 = objc_msgSend(v62, "MSErrorWithDomain:code:description:", @"MSStreamsPutConnectionErrorDomain", 4);
      id v10 = [(MSPublisher *)v145 _invalidStreamsResponseErrorUnderlyingError:v53];
LABEL_53:

      __int16 v12 = v143;
      id v33 = (__CFString *)v150;
      goto LABEL_54;
    }
    uint64_t v32 = (void *)v31;
    [(MSPublisher *)v145 setStorageProtocolURL:v31];
  }
  unint64_t v147 = v30;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  obuint64_t j = v145->_requestAuthQueue;
  uint64_t v34 = [(NSMutableArray *)obj countByEnumeratingWithState:&v182 objects:v200 count:16];
  CFStringRef v150 = v33;
  if (!v34) {
    goto LABEL_46;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)v183;
  do
  {
    uint64_t v37 = 0;
    uint64_t v153 = v35;
    do
    {
      if (*(void *)v183 != v36) {
        objc_enumerationMutation(obj);
      }
      long long v38 = *(void **)(*((void *)&v182 + 1) + 8 * v37);
      long long v39 = [v38 object];
      long long v40 = [v39 masterAsset];
      long long v41 = [v40 MMCSAccessHeader];

      sendingQueue = v33;
      if (v41)
      {
        long long v43 = [v39 derivedAssets];
        long long v178 = 0u;
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v178 objects:v199 count:16];
        if (!v44)
        {

LABEL_43:
          sendingQueue = v145->_sendingQueue;
          goto LABEL_44;
        }
        uint64_t v45 = v44;
        uint64_t v46 = v36;
        uint64_t v47 = *(void *)v179;
        char v48 = 1;
        do
        {
          for (uint64_t j = 0; j != v45; ++j)
          {
            if (*(void *)v179 != v47) {
              objc_enumerationMutation(v43);
            }
            uint64_t v50 = [*(id *)(*((void *)&v178 + 1) + 8 * j) MMCSAccessHeader];
            BOOL v51 = v50 != 0;

            v48 &= v51;
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v178 objects:v199 count:16];
        }
        while (v45);

        id v33 = (__CFString *)v150;
        sendingQueue = (void *)v150;
        uint64_t v36 = v46;
        uint64_t v35 = v153;
        if (v48) {
          goto LABEL_43;
        }
      }
LABEL_44:
      [sendingQueue addObject:v38];

      ++v37;
    }
    while (v37 != v35);
    uint64_t v35 = [(NSMutableArray *)obj countByEnumeratingWithState:&v182 objects:v200 count:16];
  }
  while (v35);
LABEL_46:

  if ([(__CFString *)v33 count])
  {
    self = v145;
    [(MSPublisher *)v145 _removeAssetsInAssetCollectionWrappersFromAssetMap:v33];
    +[MSObjectWrapper objectsFromWrappers:v33];
    v53 = uint64_t v52 = v33;
    [(MSPublisher *)v145 _didFinishUsingAssetCollections:v53];
    delegate = v145->_delegate;
    v55 = (void *)MEMORY[0x1E4F28C58];
    v56 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_ASSET_REJECTED");
    v57 = [v55 MSErrorWithDomain:@"MSPublisherErrorDomain" code:1 description:v56];
    [(MSPublisherDelegate *)delegate publisher:v145 didEncounterError:v57 publishingAssetCollections:v53];

    [(MSObjectQueue *)v145->_uploadQueue removeObjectWrappersFromQueue:v52];
    [(MSPublisher *)v145 _updateMasterManifest];
    id v10 = 0;
    id v8 = v139;
    id v9 = v136;
    id v30 = v147;
    goto LABEL_53;
  }
  id v10 = 0;
  id v8 = v139;
  id v9 = v136;
  self = v145;
  id v30 = v147;
  __int16 v12 = v143;
LABEL_54:

  if (!v10)
  {
    daemouint64_t n = self->_daemon;
    v76 = [(MSCupidStateMachine *)self personID];
    [(MSMediaStreamDaemon *)daemon didReceiveAuthenticationSuccessForPersonID:v76];

    [(MSCupidStateMachine *)self _resetStreamsBackoffTimer];
    [(MSPublisher *)self _removeAssetsInAssetCollectionWrappersFromAssetMap:self->_requestAuthQueue];
    if ([(NSMutableArray *)self->_sendingQueue count])
    {
      int v77 = 7;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        long long v129 = objc_opt_class();
        id v130 = v129;
        long long v131 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        *(void *)v204 = v129;
        *(_WORD *)&v204[8] = 2112;
        v205 = v131;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Nothing to upload.", buf, 0x16u);
      }
      int v77 = 0;
    }
    self->_int state = v77;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MSPublisher_publishStreamsProtocol_didFinishUploadingMetadataResponse_error___block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v10 = 0;
    goto LABEL_149;
  }
LABEL_55:
  if ([v10 MSIsTemporaryNetworkError])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v78 = objc_opt_class();
      id v79 = v78;
      v80 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138543618;
      *(void *)v204 = v78;
      *(_WORD *)&v204[8] = 2112;
      v205 = v80;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Encountered network issues during upload. Will try again later...", buf, 0x16u);
    }
    self->_int state = 4;
    goto LABEL_149;
  }
  char v63 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_requestAuthQueue, "count"));
  int v64 = [v10 MSIsQuotaError];
  BOOL v65 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (!v64)
  {
    if (v65)
    {
      id v84 = objc_opt_class();
      id v85 = v84;
      v86 = [(MSCupidStateMachine *)self personID];
      id v87 = [v10 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      *(void *)v204 = v84;
      *(_WORD *)&v204[8] = 2112;
      v205 = v86;
      __int16 v206 = 2114;
      uint64_t v207 = (uint64_t)v87;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Error uploading metadata to Streams server: %{public}@", buf, 0x20u);
    }
    if ([v10 MSNeedsBackoff]) {
      [(MSCupidStateMachine *)self _backoffStreamsBackoffTimer];
    }
    if ([v10 MSIsCounted])
    {
      long long v160 = 0u;
      long long v161 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      uint64_t v69 = self->_requestAuthQueue;
      uint64_t v70 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v158 objects:v194 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v159;
        do
        {
          for (uint64_t k = 0; k != v71; ++k)
          {
            if (*(void *)v159 != v72) {
              objc_enumerationMutation(v69);
            }
            v74 = *(void **)(*((void *)&v158 + 1) + 8 * k);
            objc_msgSend(v74, "setErrorCount:", objc_msgSend(v74, "errorCount") + 1);
            if ((int)[v74 errorCount] >= self->_maxErrorCount) {
              [v63 addObject:v74];
            }
          }
          uint64_t v71 = [(NSMutableArray *)v69 countByEnumeratingWithState:&v158 objects:v194 count:16];
        }
        while (v71);
      }

      [(MSObjectQueue *)self->_uploadQueue commitErrorCountsForObjectWrappers:self->_requestAuthQueue];
    }
    goto LABEL_141;
  }
  if (v65)
  {
    unint64_t v81 = objc_opt_class();
    id v82 = v81;
    v83 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543618;
    *(void *)v204 = v81;
    *(_WORD *)&v204[8] = 2112;
    v205 = v83;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Received a quota error.", buf, 0x16u);
  }
  __int16 v138 = [v9 objectForKey:@"code"];
  if (!v138 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_128:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v123 = objc_opt_class();
      id v124 = v123;
      long long v125 = [(MSCupidStateMachine *)self personID];
      *(_DWORD *)buf = 138543618;
      *(void *)v204 = v123;
      *(_WORD *)&v204[8] = 2112;
      v205 = v125;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not parse the server's response.", buf, 0x16u);
    }
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id v112 = self->_requestAuthQueue;
    uint64_t v113 = [(NSMutableArray *)v112 countByEnumeratingWithState:&v162 objects:v195 count:16];
    if (v113)
    {
      uint64_t v114 = v113;
      uint64_t v115 = *(void *)v163;
      do
      {
        for (uint64_t m = 0; m != v114; ++m)
        {
          if (*(void *)v163 != v115) {
            objc_enumerationMutation(v112);
          }
          v117 = *(void **)(*((void *)&v162 + 1) + 8 * m);
          objc_msgSend(v117, "setErrorCount:", objc_msgSend(v117, "errorCount") + 1);
          if ((int)[v117 errorCount] >= self->_maxErrorCount) {
            [v63 addObject:v117];
          }
        }
        uint64_t v114 = [(NSMutableArray *)v112 countByEnumeratingWithState:&v162 objects:v195 count:16];
      }
      while (v114);
    }

    [(MSCupidStateMachine *)self _backoffStreamsBackoffTimer];
    goto LABEL_140;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v126 = objc_opt_class();
    id v127 = v126;
    long long v128 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    *(void *)v204 = v126;
    *(_WORD *)&v204[8] = 2112;
    v205 = v128;
    __int16 v206 = 2114;
    uint64_t v207 = (uint64_t)v138;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Quota error code: %{public}@", buf, 0x20u);
  }
  v66 = [v9 objectForKey:@"retryafter"];
  objc_opt_class();
  long long v132 = v66;
  if (objc_opt_isKindOfClass())
  {
    int v67 = [v66 intValue];
    if (v67 < 1)
    {
      [(MSCupidStateMachine *)self _backoffStreamsBackoffTimer];
    }
    else
    {
      v68 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v67];
      [(MSCupidStateMachine *)self _didReceiveStreamsRetryAfterDate:v68];
    }
    v88 = self->_daemon;
    uint64_t v89 = [(MSCupidStateMachine *)self personID];
    v90 = [(MSCupidStateMachine *)self personID];
    id v91 = +[MSPublisher nextActivityDateForPersonID:v90];
    [(MSMediaStreamDaemon *)v88 didExceedPublishQuotaForPersonID:v89 retryDate:v91];
  }
  if (([v138 isEqualToString:@"4034"] & 1) == 0)
  {

    goto LABEL_140;
  }
  v92 = [v9 objectForKey:@"assets"];
  if (v92)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_127:

      goto LABEL_128;
    }
  }
  id v137 = v9;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v133 = v92;
  uint64_t v135 = [v133 countByEnumeratingWithState:&v174 objects:v198 count:16];
  if (v135)
  {
    uint64_t v134 = *(void *)v175;
    id v140 = v8;
    id v142 = v10;
    __int16 v148 = v63;
    while (2)
    {
      uint64_t v93 = 0;
      do
      {
        if (*(void *)v175 != v134) {
          objc_enumerationMutation(v133);
        }
        uint64_t v94 = *(void **)(*((void *)&v174 + 1) + 8 * v93);
        objc_opt_class();
        self = v145;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v92 = v133;

          id v9 = v137;
          goto LABEL_127;
        }
        uint64_t v141 = v93;
        v95 = [v94 MSHexData];
        long long v170 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        uint64_t v151 = v145->_requestAuthQueue;
        uint64_t obja = [(NSMutableArray *)v151 countByEnumeratingWithState:&v170 objects:v197 count:16];
        if (obja)
        {
          uint64_t v154 = *(void *)v171;
          do
          {
            for (uint64_t n = 0; n != obja; ++n)
            {
              if (*(void *)v171 != v154) {
                objc_enumerationMutation(v151);
              }
              v97 = *(void **)(*((void *)&v170 + 1) + 8 * n);
              v98 = [v97 object];
              id v99 = [v98 masterAsset];
              v100 = [v99 fileHash];
              int v101 = [v100 isEqualToData:v95];

              if (v101)
              {
                [v63 addObject:v97];
LABEL_118:
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  v109 = objc_opt_class();
                  id v110 = v109;
                  v111 = [(MSCupidStateMachine *)v145 personID];
                  *(_DWORD *)buf = 138543874;
                  *(void *)v204 = v109;
                  *(_WORD *)&v204[8] = 2112;
                  v205 = v111;
                  __int16 v206 = 2114;
                  uint64_t v207 = (uint64_t)v98;
                  _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Server reject asset collection because it is too large: %{public}@", buf, 0x20u);
                }
              }
              else
              {
                long long v168 = 0u;
                long long v169 = 0u;
                long long v166 = 0u;
                long long v167 = 0u;
                unint64_t v102 = [v98 derivedAssets];
                uint64_t v103 = [v102 countByEnumeratingWithState:&v166 objects:v196 count:16];
                if (v103)
                {
                  uint64_t v104 = v103;
                  uint64_t v105 = *(void *)v167;
                  while (2)
                  {
                    for (iuint64_t i = 0; ii != v104; ++ii)
                    {
                      if (*(void *)v167 != v105) {
                        objc_enumerationMutation(v102);
                      }
                      uint64_t v107 = [*(id *)(*((void *)&v166 + 1) + 8 * ii) fileHash];
                      int v108 = [v107 isEqualToData:v95];

                      if (v108)
                      {
                        char v63 = v148;
                        [v148 addObject:v97];

                        goto LABEL_118;
                      }
                    }
                    uint64_t v104 = [v102 countByEnumeratingWithState:&v166 objects:v196 count:16];
                    if (v104) {
                      continue;
                    }
                    break;
                  }
                }

                char v63 = v148;
              }
            }
            uint64_t obja = [(NSMutableArray *)v151 countByEnumeratingWithState:&v170 objects:v197 count:16];
          }
          while (obja);
        }

        id v8 = v140;
        uint64_t v93 = v141 + 1;
        id v10 = v142;
      }
      while (v141 + 1 != v135);
      uint64_t v135 = [v133 countByEnumeratingWithState:&v174 objects:v198 count:16];
      if (v135) {
        continue;
      }
      break;
    }
  }

  id v9 = v137;
  self = v145;
LABEL_140:

LABEL_141:
  if ([v63 count])
  {
    [(NSMutableArray *)self->_requestAuthQueue removeObjectsInArray:v63];
    [(MSObjectQueue *)self->_uploadQueue removeObjectWrappersFromQueue:v63];
    [(MSObjectQueue *)self->_uploadQueue commitErrorCountsForObjectWrappers:self->_requestAuthQueue];
    [(MSPublisher *)self _updateMasterManifest];
    [(MSPublisher *)self _removeAssetsInAssetCollectionWrappersFromAssetMap:v63];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v119 = objc_opt_class();
      id v120 = v119;
      long long v121 = [(MSCupidStateMachine *)self personID];
      uint64_t v122 = [v63 count];
      *(_DWORD *)buf = 138543874;
      *(void *)v204 = v119;
      *(_WORD *)&v204[8] = 2112;
      v205 = v121;
      __int16 v206 = 2048;
      uint64_t v207 = v122;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Too many errors encountered while uploading %ld asset collections. Aborting.", buf, 0x20u);
    }
    [(MSPublisher *)self _quarantineOrDiscardWrappers:v63 withError:v10];
  }
  if ([(NSMutableArray *)self->_requestAuthQueue count]) {
    int v118 = 4;
  }
  else {
    int v118 = 1;
  }
  self->_int state = v118;

LABEL_149:
  [(MSDaemon *)self->_daemon releaseBusy];
LABEL_150:
}

uint64_t __79__MSPublisher_publishStreamsProtocol_didFinishUploadingMetadataResponse_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (id)_invalidStreamsResponseErrorUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F28C58];
  v5 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUT_CONNECTION_INVALID_STREAMS_RESPONSE");
  if (v3) {
    [v4 MSErrorWithDomain:@"MSStreamsPutConnectionErrorDomain" code:1 description:v5 underlyingError:v3];
  }
  else {
  uint64_t v6 = [v4 MSErrorWithDomain:@"MSStreamsPutConnectionErrorDomain" code:1 description:v5];
  }

  return v6;
}

- (void)_sendMetadataToStreams
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = objc_opt_class();
    id v4 = v3;
    v5 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543618;
    *(void *)char v63 = v3;
    *(_WORD *)&v63[8] = 2112;
    uint64_t v64 = (uint64_t)v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Sending metadata...", buf, 0x16u);
  }
  int state = self->_state;
  if (state == 5)
  {
    [(MSPublisher *)self _removeAssetsInAssetCollectionWrappersFromAssetMap:self->_requestAuthQueue];
    [(NSMutableArray *)self->_requestAuthQueue removeAllObjects];
    id v7 = [(MSObjectQueue *)self->_uploadQueue smallestObjectWrappersTargetTotalSize:self->_publishTargetByteCount maxCount:self->_publishBatchSize];
    id v8 = [(MSPublisher *)self _checkObjectWrappers:v7];
    if (v8 == v7)
    {
      [(NSMutableArray *)self->_requestAuthQueue addObjectsFromArray:v7];
      if ([(NSMutableArray *)self->_requestAuthQueue count])
      {
        uint64_t v45 = v8;
        [(NSMutableDictionary *)self->_fileHashToAssetMap removeAllObjects];
        uint64_t v18 = +[MSObjectWrapper objectsFromWrappers:self->_requestAuthQueue];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v52 != v21) {
                objc_enumerationMutation(v18);
              }
              char v23 = *(void **)(*((void *)&v51 + 1) + 8 * i);
              id v24 = [v23 masterAsset];
              [(MSPublisher *)self _addAssetToFileHashMap:v24];

              long long v49 = 0u;
              long long v50 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              uint64_t v25 = [v23 derivedAssets];
              uint64_t v26 = [v25 countByEnumeratingWithState:&v47 objects:v60 count:16];
              if (v26)
              {
                uint64_t v27 = v26;
                uint64_t v28 = *(void *)v48;
                do
                {
                  for (uint64_t j = 0; j != v27; ++j)
                  {
                    if (*(void *)v48 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    [(MSPublisher *)self _addAssetToFileHashMap:*(void *)(*((void *)&v47 + 1) + 8 * j)];
                  }
                  uint64_t v27 = [v25 countByEnumeratingWithState:&v47 objects:v60 count:16];
                }
                while (v27);
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v61 count:16];
          }
          while (v20);
        }
        self->_int state = 6;
        [(MSPublishStreamsProtocol *)self->_protocol sendMetadataForAssetCollections:v18];

        id v8 = v45;
        goto LABEL_48;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = objc_opt_class();
        id v36 = v35;
        uint64_t v37 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        *(void *)char v63 = v35;
        *(_WORD *)&v63[8] = 2112;
        uint64_t v64 = (uint64_t)v37;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ nothing to send.", buf, 0x16u);
      }
      self->_int state = 0;
      [(MSDaemon *)self->_daemon releaseBusy];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __37__MSPublisher__sendMetadataToStreams__block_invoke_75;
      v46[3] = &unk_1E6C3DA38;
      v46[4] = self;
      long long v38 = MEMORY[0x1E4F14428];
      long long v39 = v46;
    }
    else
    {
      int64_t v9 = [(MSObjectQueue *)self->_uploadQueue count];
      [(MSObjectQueue *)self->_uploadQueue removeObjectWrappersFromQueue:v7];
      if ([v8 count]) {
        [(MSObjectQueue *)self->_uploadQueue appendObjectWrappers:v8];
      }
      int64_t v10 = [(MSObjectQueue *)self->_uploadQueue count];
      unint64_t v11 = [v7 count] + v10;
      if (v11 <= [v8 count] + v9)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          id v30 = objc_opt_class();
          id v44 = v30;
          uint64_t v43 = [v7 count];
          uint64_t v31 = [v8 count];
          uint64_t v32 = [v7 count];
          uint64_t v33 = v32 - [v8 count];
          int64_t v34 = [(MSObjectQueue *)self->_uploadQueue count];
          *(_DWORD *)buf = 138544386;
          *(void *)char v63 = v30;
          *(_WORD *)&v63[8] = 2048;
          uint64_t v64 = v43;
          __int16 v65 = 2048;
          uint64_t v66 = v31;
          __int16 v67 = 2048;
          uint64_t v68 = v33;
          __int16 v69 = 2048;
          int64_t v70 = v34;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %lu collections changed (kept %lu / lost %ld - total collections in queue after cleaning: %lld).", buf, 0x34u);
        }
      }
      else
      {
        int64_t v42 = v10;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v12 = v7;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v56 objects:v71 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = 0;
          uint64_t v16 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v14; ++k)
            {
              if (*(void *)v57 != v16) {
                objc_enumerationMutation(v12);
              }
              if (v15) {
                [v15 appendFormat:@", %lld", objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * k), "uniqueID")];
              }
              else {
                uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%lld", objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * k), "uniqueID"));
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v56 objects:v71 count:16];
          }
          while (v14);
        }
        else
        {
          uint64_t v15 = 0;
        }

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          long long v40 = objc_opt_class();
          *(_DWORD *)buf = 138544130;
          *(void *)char v63 = v40;
          *(_WORD *)&v63[8] = 2048;
          uint64_t v64 = v9;
          __int16 v65 = 2048;
          uint64_t v66 = v42;
          __int16 v67 = 2114;
          uint64_t v68 = (uint64_t)v15;
          id v41 = v40;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - failed to properly clean up wrappers from queue (before/after count: %lld/%lld). Wrapper ids that were supposed to be removed: (%{public}@)", buf, 0x2Au);
        }
      }
      self->_int state = 0;
      [(MSDaemon *)self->_daemon releaseBusy];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__MSPublisher__sendMetadataToStreams__block_invoke;
      block[3] = &unk_1E6C3DA38;
      block[4] = self;
      long long v38 = MEMORY[0x1E4F14428];
      long long v39 = block;
    }
    dispatch_async(v38, v39);
LABEL_48:

    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)char v63 = 5;
    *(_WORD *)&v63[4] = 1024;
    *(_DWORD *)&v63[6] = state;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong state detected. Expected %d, actually %d. Not serving message.", buf, 0xEu);
  }
}

uint64_t __37__MSPublisher__sendMetadataToStreams__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

uint64_t __37__MSPublisher__sendMetadataToStreams__block_invoke_75(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (void)submitAssetCollectionsForPublication:(id)a3 skipAssetCollections:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v89 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    int64_t v9 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    id v112 = v7;
    __int16 v113 = 2112;
    uint64_t v114 = v9;
    __int16 v115 = 2048;
    uint64_t v116 = [v6 count];
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Submitting %ld asset collections for publication.", buf, 0x20u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v85 = objc_opt_class();
    id v86 = v85;
    id v87 = [(MSCupidStateMachine *)self personID];
    uint64_t v88 = [v89 count];
    *(_DWORD *)buf = 138543874;
    id v112 = v85;
    __int16 v113 = 2112;
    uint64_t v114 = v87;
    __int16 v115 = 2048;
    uint64_t v116 = v88;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ ...skipping %ld asset collections.", buf, 0x20u);
  }
  [(MSPublisher *)self _didFinishUsingAssetCollections:v89];
  v92 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  obuint64_t j = v6;
  uint64_t v99 = [obj countByEnumeratingWithState:&v106 objects:v121 count:16];
  if (v99)
  {
    int64_t v10 = MEMORY[0x1E4F14500];
    uint64_t v98 = *(void *)v107;
    v97 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v107 != v98) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v106 + 1) + 8 * v11);
        uint64_t v13 = [v12 masterAsset];
        uint64_t v14 = [v13 type];
        v100 = v12;
        if (!v14
          || ([(NSMutableDictionary *)self->_maxSizeByUTI objectForKey:v14],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v55 = objc_opt_class();
            id v56 = v55;
            long long v57 = [(MSCupidStateMachine *)self personID];
            *(_DWORD *)buf = 138544130;
            id v112 = v55;
            __int16 v113 = 2112;
            uint64_t v114 = v57;
            __int16 v115 = 2114;
            uint64_t v116 = (uint64_t)v14;
            __int16 v117 = 2114;
            uint64_t v118 = (uint64_t)v12;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The UTI for “%{public}@” is not accepted by the server. Asset collection: %{public}@", buf, 0x2Au);

            int64_t v10 = MEMORY[0x1E4F14500];
          }
          uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v26 = NSString;
          uint64_t v22 = (void *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_UTI_REJECTED_P_UTI");
          uint64_t v27 = objc_msgSend(v26, "stringWithFormat:", v22, v14);
          uint64_t v28 = [v25 MSErrorWithDomain:@"MSPublisherErrorDomain" code:4 description:v27];

          goto LABEL_24;
        }
        uint64_t v16 = [(NSMutableDictionary *)self->_maxSizeByUTI objectForKey:v14];
        uint64_t v17 = [v16 longLongValue];

        uint64_t v18 = [v13 _fileSize];
        uint64_t v19 = [(MSPublisher *)self publishStorageProtocol:0 didRequestFDForAsset:v13];
        uint64_t v20 = [v13 _fileSizeOnDisk];
        [(MSPublisher *)self publishStorageProtocol:0 didFinishUsingFD:v19 forAsset:v13];
        if (!v20)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v60 = objc_opt_class();
            id v61 = v60;
            v62 = [(MSCupidStateMachine *)self personID];
            *(_DWORD *)buf = 138543618;
            id v112 = v60;
            __int16 v113 = 2112;
            uint64_t v114 = v62;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The master asset has zero size. Rejecting upload.", buf, 0x16u);

            int64_t v10 = MEMORY[0x1E4F14500];
          }
          v29 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = (void *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_ASSET_ZERO_SIZE");
          char v23 = v29;
          uint64_t v24 = 5;
          goto LABEL_23;
        }
        if (v18 > v17)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            uint64_t v66 = objc_opt_class();
            id v67 = v66;
            uint64_t v68 = [(MSCupidStateMachine *)self personID];
            __int16 v69 = [v12 masterAsset];
            *(_DWORD *)buf = 138544386;
            id v112 = v66;
            __int16 v113 = 2112;
            uint64_t v114 = v68;
            __int16 v115 = 2048;
            uint64_t v116 = v18;
            __int16 v117 = 2048;
            uint64_t v118 = v17;
            __int16 v119 = 2114;
            id v120 = v69;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The master asset has size %lld, which is larger than the maximum allowed %lld. %{public}@", buf, 0x34u);

            self = v97;
            int64_t v10 = MEMORY[0x1E4F14500];
          }
          uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = (void *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_ASSET_TOO_LARGE");
          char v23 = v21;
          uint64_t v24 = 6;
LABEL_23:
          uint64_t v28 = [v23 MSErrorWithDomain:@"MSPublisherErrorDomain" code:v24 description:v22];
LABEL_24:
          uint64_t v30 = 0;
          goto LABEL_25;
        }
        uint64_t v34 = [v13 fileHash];
        if (!v34) {
          goto LABEL_49;
        }
        uint64_t v35 = (void *)v34;
        id v36 = [v13 metadata];
        uint64_t v37 = [v36 objectForKey:@"MSAssetMetadataSHA1HashKey"];

        if (v37)
        {
          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          uint64_t v22 = [v12 derivedAssets];
          uint64_t v94 = [v22 countByEnumeratingWithState:&v102 objects:v110 count:16];
          if (v94)
          {
            uint64_t v93 = *(void *)v103;
            uint64_t v90 = v18;
            uint64_t v30 = v18;
            uint64_t v91 = v17;
            while (2)
            {
              for (uint64_t i = 0; i != v94; ++i)
              {
                if (*(void *)v103 != v93) {
                  objc_enumerationMutation(v22);
                }
                long long v39 = *(void **)(*((void *)&v102 + 1) + 8 * i);
                uint64_t v40 = [v39 fileHash];
                if (!v40) {
                  goto LABEL_41;
                }
                id v41 = (void *)v40;
                int64_t v42 = [v39 metadata];
                uint64_t v43 = [v42 objectForKey:@"MSAssetMetadataSHA1HashKey"];

                if (!v43)
                {
LABEL_41:
                  self = v97;
                  [(MSPublishStorageProtocol *)v97->_storageProtocol computeHashForAsset:v39];
                  uint64_t v44 = [v39 fileHash];
                  if (!v44) {
                    goto LABEL_69;
                  }
                  uint64_t v45 = (void *)v44;
                  uint64_t v46 = [v39 metadata];
                  long long v47 = [v46 objectForKey:@"MSAssetMetadataSHA1HashKey"];

                  self = v97;
                  if (!v47)
                  {
LABEL_69:
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      v74 = objc_opt_class();
                      id v75 = v74;
                      v76 = [(MSCupidStateMachine *)v97 personID];
                      *(_DWORD *)buf = 138543874;
                      id v112 = v74;
                      __int16 v113 = 2112;
                      uint64_t v114 = v76;
                      __int16 v115 = 2114;
                      uint64_t v116 = (uint64_t)v39;
                      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not compute hash for derived asset %{public}@. Rejecting asset from publication.", buf, 0x20u);

                      self = v97;
                    }
                    long long v58 = (void *)MEMORY[0x1E4F28C58];
                    long long v59 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_CANNOT_COMPUTE_HASH");
                    uint64_t v28 = [v58 MSErrorWithDomain:@"MSPublisherErrorDomain" code:3 description:v59];
                    goto LABEL_63;
                  }
                  uint64_t v48 = [v39 _fileSize];
                  unsigned int v95 = [(MSPublisher *)v97 publishStorageProtocol:0 didRequestFDForAsset:v39];
                  uint64_t v49 = [v39 _fileSizeOnDisk];
                  [(MSPublisher *)v97 publishStorageProtocol:0 didFinishUsingFD:v95 forAsset:v39];
                  if (!v49)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      int v77 = objc_opt_class();
                      id v78 = v77;
                      id v79 = [(MSCupidStateMachine *)v97 personID];
                      *(_DWORD *)buf = 138543618;
                      id v112 = v77;
                      __int16 v113 = 2112;
                      uint64_t v114 = v79;
                      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The asset has zero size. Rejecting upload.", buf, 0x16u);
                    }
                    char v63 = (void *)MEMORY[0x1E4F28C58];
                    long long v59 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_ASSET_ZERO_SIZE");
                    uint64_t v64 = v63;
                    uint64_t v65 = 5;
                    goto LABEL_62;
                  }
                  if (v48 > v91)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                    {
                      v80 = objc_opt_class();
                      id v81 = v80;
                      id v82 = [(MSCupidStateMachine *)v97 personID];
                      *(_DWORD *)buf = 138544386;
                      id v112 = v80;
                      __int16 v113 = 2112;
                      uint64_t v114 = v82;
                      __int16 v115 = 2048;
                      uint64_t v116 = v90;
                      __int16 v117 = 2048;
                      uint64_t v118 = v91;
                      __int16 v119 = 2114;
                      id v120 = v39;
                      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The asset has size %lld, which is larger than the maximum allowed %lld. %{public}@", buf, 0x34u);
                    }
                    int64_t v70 = (void *)MEMORY[0x1E4F28C58];
                    long long v59 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_ASSET_TOO_LARGE");
                    uint64_t v64 = v70;
                    uint64_t v65 = 6;
LABEL_62:
                    uint64_t v28 = [v64 MSErrorWithDomain:@"MSPublisherErrorDomain" code:v65 description:v59];
                    self = v97;
LABEL_63:

                    goto LABEL_64;
                  }
                  v30 += [v39 _fileSize];
                }
              }
              uint64_t v94 = [v22 countByEnumeratingWithState:&v102 objects:v110 count:16];
              if (v94) {
                continue;
              }
              break;
            }
            uint64_t v28 = 0;
            self = v97;
          }
          else
          {
            uint64_t v28 = 0;
            uint64_t v30 = v18;
          }
LABEL_64:
          int64_t v10 = MEMORY[0x1E4F14500];
        }
        else
        {
LABEL_49:
          int64_t v10 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v71 = objc_opt_class();
            id v72 = v71;
            v73 = [(MSCupidStateMachine *)self personID];
            *(_DWORD *)buf = 138543874;
            id v112 = v71;
            __int16 v113 = 2112;
            uint64_t v114 = v73;
            __int16 v115 = 2114;
            uint64_t v116 = (uint64_t)v13;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ The master asset in the collection does not have a hash. Rejecting from publication: %{public}@", buf, 0x20u);

            int64_t v10 = MEMORY[0x1E4F14500];
          }
          long long v50 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = (void *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_MISSING_HASH");
          uint64_t v28 = [v50 MSErrorWithDomain:@"MSPublisherErrorDomain" code:2 description:v22];
          uint64_t v30 = v18;
        }
LABEL_25:

        if (v28)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            long long v51 = objc_opt_class();
            id v52 = v51;
            long long v53 = [(MSCupidStateMachine *)self personID];
            long long v54 = [v28 MSVerboseDescription];
            *(_DWORD *)buf = 138544130;
            id v112 = v51;
            __int16 v113 = 2112;
            uint64_t v114 = v53;
            __int16 v115 = 2114;
            uint64_t v116 = (uint64_t)v100;
            __int16 v117 = 2114;
            uint64_t v118 = (uint64_t)v54;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejecting asset collection %{public}@\nError: %{public}@", buf, 0x2Au);

            self = v97;
            int64_t v10 = MEMORY[0x1E4F14500];
          }
          uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObject:v100];
          [(MSPublisher *)self _didFinishUsingAssetCollections:v31];

          delegate = self->_delegate;
          uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObject:v100];
          [(MSPublisherDelegate *)delegate publisher:self didEncounterError:v28 publishingAssetCollections:v33];
        }
        else
        {
          uint64_t v33 = +[MSObjectWrapper wrapperWithObject:v100 size:v30];
          [v92 addObject:v33];
        }

        ++v11;
      }
      while (v11 != v99);
      uint64_t v83 = [obj countByEnumeratingWithState:&v106 objects:v121 count:16];
      uint64_t v99 = v83;
    }
    while (v83);
  }

  [(MSObjectQueue *)self->_uploadQueue appendObjectWrappers:v92];
  [(MSObjectQueue *)self->_derivativesQueue removeObjectWrappersFromQueue:self->_pendingDerivativesQueue];
  pendingDerivativesQueue = self->_pendingDerivativesQueue;
  self->_pendingDerivativesQueue = 0;

  [(MSPublisher *)self _updateMasterManifest];
  self->_int state = 4;
  [(MSDaemon *)self->_daemon releaseBusy];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MSPublisher_submitAssetCollectionsForPublication_skipAssetCollections___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__MSPublisher_submitAssetCollectionsForPublication_skipAssetCollections___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (void)_didFinishUsingAssetCollections:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "masterAsset", (void)v14);
        [v5 addObject:v12];

        uint64_t v13 = [v11 derivedAssets];
        [v5 addObjectsFromArray:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(MSPublishStorageProtocol *)self->_storageProtocol didFinishUsingAssets:v5];
}

- (void)_removeAssetsInAssetCollectionWrappersFromAssetMap:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = a3;
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        id v5 = [*(id *)(*((void *)&v21 + 1) + 8 * v4) object];
        id v6 = [v5 masterAsset];
        uint64_t v7 = [v6 fileHash];

        if (v7) {
          [(NSMutableDictionary *)self->_fileHashToAssetMap removeObjectForKey:v7];
        }
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v8 = [v5 derivedAssets];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v18;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) fileHash];
              if (v13) {
                [(NSMutableDictionary *)self->_fileHashToAssetMap removeObjectForKey:v13];
              }

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v10);
        }

        ++v4;
      }
      while (v4 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)_removeAssetFromFileHashMap:(id)a3
{
  id v4 = a3;
  fileHashToAssetMap = self->_fileHashToAssetMap;
  id v10 = v4;
  id v6 = [v4 fileHash];
  uint64_t v7 = [(NSMutableDictionary *)fileHashToAssetMap objectForKey:v6];

  if (v7)
  {
    [v7 MSRemoveOneObjectByPointerComparison:v10];
    if (![v7 count])
    {
      uint64_t v8 = self->_fileHashToAssetMap;
      uint64_t v9 = [v10 fileHash];
      [(NSMutableDictionary *)v8 removeObjectForKey:v9];
    }
  }
}

- (void)_addAssetToFileHashMap:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 fileHash];

  if (v5)
  {
    fileHashToAssetMap = self->_fileHashToAssetMap;
    uint64_t v7 = [v4 fileHash];
    uint64_t v8 = [(NSMutableDictionary *)fileHashToAssetMap objectForKey:v7];

    if (!v8)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = self->_fileHashToAssetMap;
      id v10 = [v4 fileHash];
      [(NSMutableDictionary *)v9 setObject:v8 forKey:v10];
    }
    [v8 addObject:v4];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v11;
    uint64_t v13 = [(MSCupidStateMachine *)self personID];
    int v14 = 138543874;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    long long v17 = v13;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ No file hash for asset %{public}@", (uint8_t *)&v14, 0x20u);
  }
}

- (void)_requestDerivatives
{
  v2 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v3 = [(MSObjectQueue *)self->_uploadQueue smallestObjectWrappersTargetTotalSize:1 maxCount:1];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v2->_int state = 4;
    [(MSDaemon *)v2->_daemon releaseBusy];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__MSPublisher__requestDerivatives__block_invoke;
    block[3] = &unk_1E6C3DA38;
    block[4] = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    id v5 = [(MSObjectQueue *)v2->_uploadQueue objectWrappersWithZeroSizeMaxCount:v2->_publishBatchSize];
    id v6 = +[MSObjectWrapper objectsFromWrappers:v5];
    if ([v6 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = objc_opt_class();
        id v8 = v7;
        uint64_t v9 = [(MSCupidStateMachine *)v2 personID];
        *(_DWORD *)buf = 138543874;
        long long v54 = v7;
        __int16 v55 = 2112;
        id v56 = v9;
        __int16 v57 = 2048;
        uint64_t v58 = [v5 count];
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Requesting derivatives for %ld files.", buf, 0x20u);
      }
      id v10 = [MEMORY[0x1E4F28E60] indexSet];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __34__MSPublisher__requestDerivatives__block_invoke_50;
      v48[3] = &unk_1E6C3B940;
      id v11 = v10;
      id v49 = v11;
      long long v50 = v2;
      [v6 enumerateObjectsUsingBlock:v48];
      [(MSObjectQueue *)v2->_uploadQueue removeObjectWrappersFromQueue:v5];
      if ([v11 count])
      {
        id v12 = (void *)[v5 mutableCopy];
        [v12 removeObjectsAtIndexes:v11];

        uint64_t v13 = (void *)[v6 mutableCopy];
        [v13 removeObjectsAtIndexes:v11];

        id v6 = v13;
        id v5 = v12;
      }
      [(MSObjectQueue *)v2->_derivativesQueue appendObjectWrappers:v5];
      objc_storeStrong((id *)&v2->_pendingDerivativesQueue, v5);

      int v14 = v5;
    }
    else
    {
      int64_t v42 = v6;
      int v14 = [(MSObjectQueue *)v2->_derivativesQueue allObjectWrappersOrderedByDescendingErrorCountMaxCount:5];

      if ([v14 count])
      {
        uint64_t v15 = MEMORY[0x1E4F14500];
        uint64_t v43 = v2;
        while (1)
        {
          __int16 v16 = [MEMORY[0x1E4F1CA48] array];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v17 = v14;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v45;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v45 != v20) {
                  objc_enumerationMutation(v17);
                }
                long long v22 = *(void **)(*((void *)&v44 + 1) + 8 * i);
                int v23 = [v22 errorCount];
                if (v23 <= 2)
                {
                  int v28 = v23;
                  [v22 setErrorCount:(v23 + 1)];
                  v2 = v43;
                  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                  {
                    v29 = objc_opt_class();
                    id v30 = v29;
                    uint64_t v31 = [v22 object];
                    *(_DWORD *)buf = 138543874;
                    long long v54 = v29;
                    __int16 v55 = 2114;
                    id v56 = v31;
                    __int16 v57 = 1024;
                    LODWORD(v58) = v28;
                    _os_log_impl(&dword_1DC434000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Retrying to get derivative for %{public}@ (error count: %i)", buf, 0x1Cu);
                  }
                  derivativesQueue = v43->_derivativesQueue;
                  uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObject:v22];
                  [(MSObjectQueue *)derivativesQueue commitErrorCountsForObjectWrappers:v33];

                  id v27 = v22;
                  goto LABEL_26;
                }
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  long long v24 = objc_opt_class();
                  id v25 = v24;
                  uint64_t v26 = [v22 object];
                  *(_DWORD *)buf = 138543618;
                  long long v54 = v24;
                  __int16 v55 = 2114;
                  id v56 = v26;
                  _os_log_error_impl(&dword_1DC434000, v15, OS_LOG_TYPE_ERROR, "%{public}@ - unable to generate derivatives for %{public}@ safely.", buf, 0x16u);
                }
                [v16 addObject:v22];
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v44 objects:v52 count:16];
              if (v19) {
                continue;
              }
              break;
            }
            id v27 = 0;
            v2 = v43;
          }
          else
          {
            id v27 = 0;
          }
LABEL_26:

          if ([v16 count]) {
            [(MSObjectQueue *)v2->_derivativesQueue removeObjectWrappersFromQueue:v16];
          }
          if (v27) {
            break;
          }
          int v14 = [(MSObjectQueue *)v2->_derivativesQueue allObjectWrappersOrderedByDescendingErrorCountMaxCount:5];

          if (![v14 count]) {
            goto LABEL_30;
          }
        }

        uint64_t v37 = (void *)MEMORY[0x1E4F1C978];
        long long v38 = [v27 object];
        uint64_t v39 = [v37 arrayWithObject:v38];

        uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObject:v27];
        pendingDerivativesQueue = v2->_pendingDerivativesQueue;
        v2->_pendingDerivativesQueue = (NSArray *)v40;

        id v6 = (void *)v39;
        int v14 = v17;
      }
      else
      {
LABEL_30:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = objc_opt_class();
          id v35 = v34;
          id v36 = [(MSCupidStateMachine *)v2 personID];
          *(_DWORD *)buf = 138543618;
          long long v54 = v34;
          __int16 v55 = 2112;
          id v56 = v36;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ No more derivatives to request.", buf, 0x16u);
        }
        id v6 = v42;
      }
    }
    [(MSPublisher *)v2 _updateMasterManifest];
    if ([v6 count])
    {
      v2->_int state = 3;
      [(MSPublisherDelegate *)v2->_delegate publisher:v2 didRequestSubmissionOfAssetCollections:v6];
    }
    else
    {
      v2->_int state = 0;
      [(MSDaemon *)v2->_daemon releaseBusy];
    }
  }
}

uint64_t __34__MSPublisher__requestDerivatives__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

void __34__MSPublisher__requestDerivatives__block_invoke_50(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 masterAsset];
  if (v6)
  {
    uint64_t v7 = [v5 masterAssetHash];
    if (!v7) {
      goto LABEL_4;
    }
    id v8 = (void *)v7;
    uint64_t v9 = [v6 metadata];
    id v10 = [v9 objectForKey:@"MSAssetMetadataSHA1HashKey"];

    if (!v10) {
LABEL_4:
    }
      [*(id *)(*(void *)(a1 + 40) + 152) computeHashForAsset:v6];
  }
  else
  {
    [*(id *)(a1 + 32) addIndex:a3];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "masterAsset unavailable for asset collection %@, unable to request derivatives", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)publish
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(MSCupidStateMachine *)self hasDeactivated])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = objc_opt_class();
      uint64_t v4 = [(MSCupidStateMachine *)self personID];
      int v6 = 138543618;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not publishing because we're shutting down.", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    switch(self->_state)
    {
      case 0:
      case 1:
        if ([(MSPublisher *)self _isAllowedToUpload])
        {
          [(MSDaemon *)self->_daemon retainBusy];
          int v5 = 2;
          goto LABEL_23;
        }
        break;
      case 2:
        [(MSPublisher *)self _requestDerivatives];
        break;
      case 4:
        if ([(MSPublisher *)self _isAllowedToUpload])
        {
          [(MSDaemon *)self->_daemon retainBusy];
          int v5 = 5;
          goto LABEL_23;
        }
        break;
      case 5:
        [(MSPublisher *)self _sendMetadataToStreams];
        break;
      case 7:
        if ([(MSPublisher *)self _isAllowedToUpload])
        {
          [(MSDaemon *)self->_daemon retainBusy];
          int v5 = 8;
          goto LABEL_23;
        }
        break;
      case 8:
        [(MSPublisher *)self _sendFilesToMMCS];
        break;
      case 0xA:
        if ([(MSPublisher *)self _isAllowedToUpload])
        {
          [(MSDaemon *)self->_daemon retainBusy];
          int v5 = 11;
LABEL_23:
          self->_int state = v5;
          [(MSPublisher *)self publish];
        }
        break;
      case 0xB:
        [(MSPublisher *)self _sendUploadComplete];
        break;
      default:
        return;
    }
  }
}

- (BOOL)_isAllowedToUpload
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSPlatform();
  if ([v3 policyMayUpload])
  {
    uint64_t v4 = [(MSCupidStateMachine *)self _latestNextActivityDate];
    int v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [v4 compare:v5];

    if (v6 != 1) {
      return 1;
    }
  }
  else
  {
  }
  BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    id v10 = v9;
    int v11 = [(MSCupidStateMachine *)self personID];
    int v12 = 138543618;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Not uploading at this time.", (uint8_t *)&v12, 0x16u);

    return 0;
  }
  return result;
}

- (void)reenqueueQuarantinedAssetCollections
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSObjectQueue *)self->_quarantinedQueue allObjectWrappersMaxCount:10];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([v3 count])
  {
    char v20 = 0;
    int v5 = MEMORY[0x1E4F14500];
    long long v22 = self;
    do
    {
      context = (void *)MEMORY[0x1E019E3B0]();
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v7 = v3;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            int v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v13 = [v12 object];
            __int16 v14 = [v13 assetCollectionID];
            if (v14)
            {
              if ([v4 containsObject:v14])
              {
                if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v15 = objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  int v28 = v15;
                  __int16 v29 = 2114;
                  uint64_t v30 = (uint64_t)v14;
                  id v16 = v15;
                  _os_log_error_impl(&dword_1DC434000, v5, OS_LOG_TYPE_ERROR, "%{public}@ - discarding a collection with identifier %{public}@ that was quarantined too many times.", buf, 0x16u);
                }
              }
              else
              {
                [v4 addObject:v14];
                [v6 addObject:v12];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v9);
      }

      [(MSObjectQueue *)v22->_quarantinedQueue removeObjectWrappersFromQueue:v7];
      if ([v6 count])
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = objc_opt_class();
          id v18 = v17;
          uint64_t v19 = [v6 count];
          *(_DWORD *)buf = 138543618;
          int v28 = v17;
          __int16 v29 = 2048;
          uint64_t v30 = v19;
          _os_log_impl(&dword_1DC434000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - reenqueuing %ld quarantined collections.", buf, 0x16u);
        }
        [(MSObjectQueue *)v22->_uploadQueue appendObjectWrappers:v6];
        char v20 = 1;
      }
      uint64_t v3 = [(MSObjectQueue *)v22->_quarantinedQueue allObjectWrappersMaxCount:10];
    }
    while ([v3 count]);
    if (v20) {
      [(MSPublisher *)v22 _updateMasterManifest];
    }
  }
}

- (id)_checkObjectWrappers:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v21;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "object", (void)v20);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if ([v12 size])
        {
          id v14 = [(MSPublisher *)self _checkAssetCollectionFiles:v13];
        }
        else
        {
          id v14 = v13;
        }
        uint64_t v15 = v14;
        if (!v14) {
          goto LABEL_12;
        }
        if (v14 != v13)
        {
          id v16 = +[MSObjectWrapper wrapperWithObject:v14 size:0];
          [v5 addObject:v16];

LABEL_12:
          char v9 = 1;
          goto LABEL_14;
        }
        [v5 addObject:v12];
LABEL_14:
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (!v8)
      {

        id v17 = v5;
        if (v9) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
  }

LABEL_19:
  id v17 = v6;
LABEL_20:
  id v18 = v17;

  return v18;
}

- (id)_checkAssetCollectionFiles:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 masterAsset];
  if (![(MSPublisher *)self _verifyAssetFile:v5])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v4;
      id v14 = v23;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@ has disappeared.", buf, 0x16u);
    }
    id v13 = 0;
LABEL_21:
    id v7 = v4;
    goto LABEL_22;
  }
  id v6 = [v4 assetCollectionID];

  if (!v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2114;
      id v25 = v4;
      id v7 = v23;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@ has lost his collection ID.", buf, 0x16u);
LABEL_19:
    }
    id v13 = [(MSPublisher *)self _collectionWithNoDerivatives:v4];
    goto LABEL_21;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  objc_msgSend(v4, "derivedAssets", 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (![(MSPublisher *)self _verifyAssetFile:v12])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            id v23 = v15;
            __int16 v24 = 2114;
            id v25 = v12;
            __int16 v26 = 2114;
            id v27 = v4;
            id v16 = v15;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %{public}@ for %{public}@ has disappeared. Will have to recompute derivatives.", buf, 0x20u);
          }
          goto LABEL_19;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = v4;
LABEL_22:

  return v13;
}

- (id)_collectionWithNoDerivatives:(id)a3
{
  id v3 = a3;
  id v4 = [v3 masterAsset];
  id v5 = [v3 fileName];
  id v6 = +[MSAssetCollection collectionWithMasterAsset:v4 fileName:v5];

  id v7 = [v3 assetCollectionID];

  if (!v7)
  {
    id v7 = [NSString MSMakeUUID];
  }
  [v6 setAssetCollectionID:v7];

  return v6;
}

- (BOOL)_verifyAssetFile:(id)a3
{
  id v3 = a3;
  id v4 = [v3 path];
  id v5 = [v3 fileData];

  if (v5) {
    goto LABEL_4;
  }
  if (objc_opt_respondsToSelector())
  {
    id v5 = 0;
LABEL_4:
    char v6 = 1;
    goto LABEL_5;
  }
  if (!v4)
  {
    char v6 = 1;
    goto LABEL_6;
  }
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:0];
LABEL_5:

LABEL_6:
  return v6;
}

- (void)_quarantineOrDiscardWrappers:(id)a3 withError:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  double Current = CFAbsoluteTimeGetCurrent();
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    int v11 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v14 = [v13 object];
        uint64_t v15 = [v14 initialFailureDate];
        if (v15 >= 1 && (unint64_t)((uint64_t)Current - v15) >= 0x93A81)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            id v23 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            uint64_t v34 = v23;
            __int16 v35 = 2114;
            id v36 = v14;
            id v24 = v23;
            _os_log_error_impl(&dword_1DC434000, v11, OS_LOG_TYPE_ERROR, "%{public}@ - quarantine for %{public}@ has been there for too long. Better to just abandon", buf, 0x16u);
          }
          long long v21 = v27;
          long long v22 = v14;
        }
        else
        {
          uint64_t v17 = v15;
          if (!v15) {
            [v14 setInitialFailureDate:(uint64_t)Current];
          }
          [v13 setErrorCount:0];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            long long v18 = objc_opt_class();
            *(_DWORD *)buf = 138543874;
            long long v19 = ", again";
            if (!v17) {
              long long v19 = " for the first time";
            }
            uint64_t v34 = v18;
            __int16 v35 = 2114;
            id v36 = v14;
            __int16 v37 = 2082;
            long long v38 = v19;
            id v20 = v18;
            _os_log_impl(&dword_1DC434000, v11, OS_LOG_TYPE_INFO, "%{public}@ - putting %{public}@ in quarantine%{public}s.", buf, 0x20u);
          }
          long long v21 = v7;
          long long v22 = v13;
        }
        [v21 addObject:v22];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v9);
  }

  if ([v7 count]) {
    [(MSObjectQueue *)self->_quarantinedQueue appendObjectWrappers:v7];
  }
  if ([v27 count])
  {
    [(MSPublisher *)self _didFinishUsingAssetCollections:v27];
    [(MSPublisherDelegate *)self->_delegate publisher:self didEncounterError:v25 publishingAssetCollections:v27];
  }
}

- (void)_registerAllAssetsForWrapper:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 object];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
  [(MSPublisher *)self _didFinishUsingAssetCollections:v5];

  char v6 = [v4 masterAsset];
  [(MSPublisher *)self _registerAsset:v6];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = objc_msgSend(v4, "derivedAssets", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(MSPublisher *)self _registerAsset:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_registerAsset:(id)a3
{
  id v4 = a3;
  [v4 setFileHash:0];
  [v4 setProtocolFileSize:0];
  [(MSPublishStorageProtocol *)self->_storageProtocol computeHashForAsset:v4];
}

- (void)_serverSideConfigurationDidChange:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v14 = a3;
  id v5 = [v4 currentThread];
  char v6 = [MEMORY[0x1E4F29060] mainThread];

  if (v5 == v6)
  {
    id v7 = [v14 userInfo];

    uint64_t v8 = [v7 objectForKey:@"personID"];
    uint64_t v9 = [(MSCupidStateMachine *)self personID];
    int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = objc_opt_class();
        id v12 = v11;
        long long v13 = [(MSCupidStateMachine *)self personID];
        *(_DWORD *)buf = 138543618;
        id v16 = v11;
        __int16 v17 = 2112;
        long long v18 = v13;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Server-side configuration has changed. Reading new values.", buf, 0x16u);
      }
      [(MSPublisher *)self _refreshServerSideConfiguredParameters];
    }
  }
  else
  {
    [(MSPublisher *)self performSelectorOnMainThread:sel__serverSideConfigurationDidChange_ withObject:v14 waitUntilDone:0];
  }
}

- (void)_refreshServerSideConfiguredParameters
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = [(MSCupidStateMachine *)self personID];
  self->_publishTargetByteCount = +[MSServerSideConfigManager longLongValueForParameter:@"mme.streams.client.pubUploadBatchTargetSize" forPersonID:v3 defaultValue:5242880];

  id v4 = [(MSCupidStateMachine *)self personID];
  self->_publishBatchSize = +[MSServerSideConfigManager intValueForParameter:@"mme.streams.client.pubMaxUploadBatchCount" forPersonID:v4 defaultValue:1];

  id v5 = [(MSCupidStateMachine *)self personID];
  int v28 = self;
  self->_maxErrorCount = +[MSServerSideConfigManager intValueForParameter:@"mme.streams.client.pubMaxErrorRetryCount" forPersonID:v5 defaultValue:3];

  if (_refreshServerSideConfiguredParameters_once != -1) {
    dispatch_once(&_refreshServerSideConfiguredParameters_once, &__block_literal_global);
  }
  char v6 = [(MSCupidStateMachine *)self personID];
  id v7 = +[MSServerSideConfigManager objectForKey:@"supportedAssets" forPersonID:v6 defaultValue:_refreshServerSideConfiguredParameters_defaultSupportedAssetTypes];

  [(NSMutableDictionary *)v28->_maxSizeByUTI removeAllObjects];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v27 = v7;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      uint64_t v11 = @"assetType";
      unint64_t v12 = 0x1E4F29000uLL;
      do
      {
        uint64_t v13 = 0;
        uint64_t v29 = v9;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v31 + 1) + 8 * v13);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v15 = [v14 objectForKey:v11];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = [v14 objectForKey:@"maxFileSizeMB"];
              if (objc_opt_respondsToSelector())
              {
                uint64_t v17 = [v16 longLongValue];
                maxSizeByUTI = v28->_maxSizeByUTI;
                [NSNumber numberWithLongLong:v17 << 20];
                unint64_t v19 = v12;
                v21 = id v20 = v11;
                long long v22 = maxSizeByUTI;
                uint64_t v9 = v29;
                [(NSMutableDictionary *)v22 setObject:v21 forKey:v15];

                uint64_t v11 = v20;
                unint64_t v12 = v19;
              }
              else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v36 = @"maxFileSizeMB";
                _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Server-side configuration key %{public}@ cannot be parsed as a number.", buf, 0xCu);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v36 = v11;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Server-side configuration key %{public}@ is not a string.", buf, 0xCu);
            }
          }
          ++v13;
        }
        while (v9 != v13);
        uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v9);
    }

    id v7 = v27;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = @"supportedAssets";
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Server-side configuration key %{public}@ does not contain an array.", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v23 = (__CFString *)objc_opt_class();
    id v24 = v23;
    id v25 = [(MSCupidStateMachine *)v28 personID];
    __int16 v26 = v28->_maxSizeByUTI;
    *(_DWORD *)buf = 138543874;
    id v36 = v23;
    __int16 v37 = 2112;
    long long v38 = v25;
    __int16 v39 = 2114;
    uint64_t v40 = v26;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ _maxSizeByUTI: %{public}@", buf, 0x20u);
  }
}

void __53__MSPublisher__refreshServerSideConfiguredParameters__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"public.tiff", @"assetType", @"100", @"maxFileSizeMB", 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"public.jpeg", @"assetType", @"50", @"maxFileSizeMB", 0);
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"public.camera-raw-image", @"assetType", @"100", @"maxFileSizeMB", 0);
  id v3 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"public.png", @"assetType", @"50", @"maxFileSizeMB", 0);
  uint64_t v4 = objc_msgSend(v0, "initWithObjects:", v6, v1, v2, v3, 0);
  id v5 = (void *)_refreshServerSideConfiguredParameters_defaultSupportedAssetTypes;
  _refreshServerSideConfiguredParameters_defaultSupportedAssetTypes = v4;
}

- (void)computeHashForAsset:(id)a3
{
}

- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 outError:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    long long v32 = v6;
    __int16 v33 = 2112;
    long long v34 = v8;
    __int16 v35 = 2114;
    uint64_t v36 = (uint64_t)v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ dequeuing asset collections: %{public}@", buf, 0x20u);
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA80] setWithArray:v5];
  id v25 = v5;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v24 = self;
  [(MSObjectQueue *)self->_uploadQueue allObjectWrappersMaxCount:0x7FFFFFFFFFFFFFFFLL];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v17 = [v16 object];
        long long v18 = [v17 assetCollectionID];
        if (v18)
        {
          if ([v9 containsObject:v18])
          {
            [v10 addObject:v16];
            [v9 removeObject:v18];
            if (![v9 count])
            {

              goto LABEL_15;
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if ([v10 count])
  {
    [(MSObjectQueue *)v24->_uploadQueue removeObjectWrappersFromQueue:v10];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      unint64_t v19 = objc_opt_class();
      id v20 = v19;
      long long v21 = [(MSCupidStateMachine *)v24 personID];
      uint64_t v22 = [v10 count];
      *(_DWORD *)buf = 138543874;
      long long v32 = v19;
      __int16 v33 = 2112;
      long long v34 = v21;
      __int16 v35 = 2048;
      uint64_t v36 = v22;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ removed %lu asset collections from upload queue", buf, 0x20u);
    }
  }

  return 1;
}

- (BOOL)enqueueAssetCollections:(id)a3 outError:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [(MSCupidStateMachine *)self personID];
    *(_DWORD *)buf = 138543874;
    long long v27 = v6;
    __int16 v28 = 2112;
    long long v29 = v8;
    __int16 v30 = 2114;
    id v31 = v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ enqueuing asset collections: %{public}@", buf, 0x20u);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v16 = [v15 assetCollectionID];

        if (!v16)
        {
          uint64_t v17 = [NSString MSMakeUUID];
          [v15 setAssetCollectionID:v17];
        }
        long long v18 = +[MSObjectWrapper wrapperWithObject:v15 size:0];
        [v9 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [(MSObjectQueue *)self->_uploadQueue appendObjectWrappers:v9];
  [(MSPublisher *)self _updateMasterManifest];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSPublisher_enqueueAssetCollections_outError___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);

  return 1;
}

uint64_t __48__MSPublisher_enqueueAssetCollections_outError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (void)_updateMasterManifest
{
  id v7 = [(MSCupidStateMachine *)self _latestNextActivityDate];
  if ([(MSObjectQueue *)self->_uploadQueue count])
  {
    if (v7)
    {
LABEL_3:
      id v3 = [(MSCupidStateMachine *)self personID];
      id v4 = v7;
      goto LABEL_12;
    }
  }
  else
  {
    if ([(MSObjectQueue *)self->_derivativesQueue count]) {
      BOOL v5 = v7 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5) {
      goto LABEL_3;
    }
  }
  if ([(MSObjectQueue *)self->_quarantinedQueue count])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:604800.0];
    id v6 = [(MSCupidStateMachine *)self personID];
    +[MSPublisher _setMasterNextActivityDate:v3 forPersonID:v6];

    goto LABEL_13;
  }
  id v3 = [(MSCupidStateMachine *)self personID];
  id v4 = 0;
LABEL_12:
  +[MSPublisher _setMasterNextActivityDate:v4 forPersonID:v3];
LABEL_13:

  _commitMasterManifest();
}

- (void)dealloc
{
  [(MSPublisher *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)MSPublisher;
  [(MSCupidStateMachine *)&v3 dealloc];
}

- (void)deactivate
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(MSPublisher *)self stop];
  tempFiles = self->_tempFiles;
  self->_tempFiles = 0;

  storageProtocolURL = self->_storageProtocolURL;
  self->_storageProtocolURL = 0;

  [(MSPublishStorageProtocol *)self->_storageProtocol deactivateRemoveAllFiles:[(MSObjectQueue *)self->_uploadQueue count] == 0];
  storageProtocol = self->_storageProtocol;
  self->_storageProtocol = 0;

  protocol = self->_protocol;
  self->_protocol = 0;

  fileHashToAssetMap = self->_fileHashToAssetMap;
  self->_fileHashToAssetMap = 0;

  sendingQueue = self->_sendingQueue;
  self->_sendingQueue = 0;

  requestAuthQueue = self->_requestAuthQueue;
  self->_requestAuthQueue = 0;

  pendingDerivativesQueue = self->_pendingDerivativesQueue;
  self->_pendingDerivativesQueue = 0;

  uploadQueue = self->_uploadQueue;
  self->_uploadQueue = 0;

  derivativesQueue = self->_derivativesQueue;
  self->_derivativesQueue = 0;

  quarantinedQueue = self->_quarantinedQueue;
  self->_quarantinedQueue = 0;

  maxSizeByUTI = self->_maxSizeByUTI;
  self->_maxSizeByUTI = 0;

  v16.receiver = self;
  v16.super_class = (Class)MSPublisher;
  [(MSCupidStateMachine *)&v16 deactivate];
}

- (MSPublisher)initWithPersonID:(id)a3 baseURL:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MSPublisher;
  uint64_t v8 = [(MSCupidStateMachine *)&v43 initWithPersonID:v6];
  if (v8)
  {
    uint64_t v9 = [MSObjectQueue alloc];
    id v10 = [(MSCupidStateMachine *)v8 personID];
    uint64_t v11 = MSPathPublishQueueForPersonID(v10);
    uint64_t v12 = [(MSObjectQueue *)v9 initWithPath:v11];
    uploadQueue = v8->_uploadQueue;
    v8->_uploadQueue = (MSObjectQueue *)v12;

    uint64_t v14 = [MSObjectQueue alloc];
    long long v15 = [(MSCupidStateMachine *)v8 personID];
    objc_super v16 = MSPathPublishDerivativesQueueForPersonID(v15);
    uint64_t v17 = [(MSObjectQueue *)v14 initWithPath:v16];
    derivativesQueue = v8->_derivativesQueue;
    v8->_derivativesQueue = (MSObjectQueue *)v17;

    unint64_t v19 = [MSObjectQueue alloc];
    id v20 = [(MSCupidStateMachine *)v8 personID];
    long long v21 = MSPathPublishDiscardedQueueForPersonID(v20);
    uint64_t v22 = [(MSObjectQueue *)v19 initWithPath:v21];
    quarantinedQueue = v8->_quarantinedQueue;
    v8->_quarantinedQueue = (MSObjectQueue *)v22;

    long long v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sendingQueue = v8->_sendingQueue;
    v8->_sendingQueue = v24;

    long long v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestAuthQueue = v8->_requestAuthQueue;
    v8->_requestAuthQueue = v26;

    __int16 v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fileHashToAssetMap = v8->_fileHashToAssetMap;
    v8->_fileHashToAssetMap = v28;

    __int16 v30 = [[MSPublishStreamsProtocol alloc] initWithPersonID:v6 baseURL:v7];
    protocol = v8->_protocol;
    v8->_protocol = v30;

    uint64_t v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tempFiles = v8->_tempFiles;
    v8->_tempFiles = v32;

    [(MSPublishStreamsProtocol *)v8->_protocol setDelegate:v8];
    long long v34 = [[MSPublishMMCSProtocol alloc] initWithPersonID:v6];
    storageProtocol = v8->_storageProtocol;
    v8->_storageProtocol = (MSPublishStorageProtocol *)v34;

    [(MSPublishStorageProtocol *)v8->_storageProtocol setDelegate:v8];
    uint64_t v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v8 selector:sel__serverSideConfigurationDidChange_ name:@"MSServerSideConfigChanged" object:0];

    uint64_t v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    maxSizeByUTI = v8->_maxSizeByUTI;
    v8->_maxSizeByUTI = v37;

    [(MSPublisher *)v8 _refreshServerSideConfiguredParameters];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      __int16 v39 = objc_opt_class();
      id v40 = v39;
      id v41 = [(id)objc_opt_class() nextActivityDateForPersonID:v6];
      *(_DWORD *)buf = 138543618;
      long long v45 = v39;
      __int16 v46 = 2114;
      long long v47 = v41;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: next activity date is %{public}@", buf, 0x16u);
    }
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
  v2 = objc_msgSend((id)_publisherByID, "allValues", 0);
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
  v2 = objc_msgSend((id)_publisherByID, "allValues", 0);
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
  v2 = _masterNextActivityDateByPersonID();
  uint64_t v3 = [v2 allKeys];

  return v3;
}

+ (id)nextActivityDateForPersonID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _masterNextActivityDateByPersonID();
  uint64_t v5 = [v4 objectForKey:v3];

  return v5;
}

+ (id)nextActivityDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = _masterNextActivityDateByPersonID();
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
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    long long v7 = _masterNextActivityDateByPersonID();
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v10 = 138543874;
        *(void *)&v10[4] = objc_opt_class();
        *(_WORD *)&v10[12] = 2112;
        *(void *)&v10[14] = v6;
        *(_WORD *)&v10[22] = 2114;
        id v11 = v5;
        id v9 = *(id *)&v10[4];
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - setting next activity date for %@ to %{public}@.", v10, 0x20u);
      }
      objc_msgSend(v8, "setObject:forKey:", v5, v6, *(_OWORD *)v10, *(void *)&v10[16], v11);
    }
    else
    {
      [v7 removeObjectForKey:v6];
    }
    _commitMasterManifest();
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v10 = 138543362;
    *(void *)&v10[4] = objc_opt_class();
    id v8 = *(id *)&v10[4];
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - Found empty person ID.", v10, 0xCu);
LABEL_10:
  }
}

+ (void)forgetPersonID:(id)a3
{
  id v5 = a3;
  uint64_t v3 = objc_msgSend((id)_publisherByID, "objectForKey:");
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 forget];
    [(id)_publisherByID removeObjectForKey:v5];
  }
}

+ (id)_clearInstantiatedPublishersByPersonID
{
  id v2 = (id)_publisherByID;
  uint64_t v3 = (void *)_publisherByID;
  _publisherByID = 0;

  return v2;
}

+ (id)existingPublisherForPersonID:(id)a3
{
  return (id)[(id)_publisherByID objectForKey:a3];
}

+ (id)publisherForPersonID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = (void *)_publisherByID;
    if (!_publisherByID)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v6 = (void *)_publisherByID;
      _publisherByID = (uint64_t)v5;

      uint64_t v4 = (void *)_publisherByID;
    }
    long long v7 = [v4 objectForKey:v3];
    if (!v7)
    {
      id v8 = [MSPublisher alloc];
      id v9 = MSPlatform();
      id v10 = [v9 baseURLForPersonID:v3];
      long long v7 = [(MSPublisher *)v8 initWithPersonID:v3 baseURL:v10];

      [(id)_publisherByID setObject:v7 forKey:v3];
    }
  }
  else
  {
    long long v7 = 0;
  }

  return v7;
}

@end