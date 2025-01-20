@interface MSASStateMachine
- (BOOL)hasEnqueuedActivities;
- (BOOL)hasShutDown;
- (BOOL)isInRetryState;
- (BOOL)isRetryingOutstandingActivities;
- (BOOL)workQueueEndCommandWithError:(id)a3 command:(id)a4 params:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7;
- (MSASPhoneInvitations)phoneInvitations;
- (MSASProtocol)protocol;
- (MSASStateMachine)init;
- (MSASStateMachine)initWithPersonID:(id)a3;
- (MSASStateMachine)initWithPersonID:(id)a3 eventQueue:(id)a4;
- (MSAlbumSharingDaemon)daemon;
- (MSImageScalingSpecification)derivativeImageScalingSpecification;
- (MSImageScalingSpecification)thumbnailImageScalingSpecification;
- (NSArray)derivativeSpecifications;
- (NSDictionary)MMCSBackoffManagerParameters;
- (NSDictionary)metadataBackoffManagerParameters;
- (NSDictionary)serverSideConfiguration;
- (NSMutableArray)_assetInfoToReauthForDownload;
- (NSString)focusAlbumGUID;
- (NSString)focusAssetCollectionGUID;
- (NSString)personID;
- (NSString)serverSideConfigurationVersion;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)memberQueue;
- (OS_dispatch_queue)serverSideConfigQueue;
- (OS_dispatch_queue)workQueue;
- (id)_URLReauthFailureWithUnderlyingError:(id)a3;
- (id)_albumForRequestFromParams:(id)a3;
- (id)_assetCollectionFailedError;
- (id)_assetCollectionRejectedError;
- (id)_assetDownloader;
- (id)_assetUploader;
- (id)_canceledError;
- (id)_createCopiedAssetsInAssetCollections:(id)a3;
- (id)_metadataBackoffManager;
- (id)_model;
- (id)_serverSideConfigDictionaryByApplyingDefaultsToDictionary:(id)a3;
- (id)_stopHandlerBlock;
- (id)_stoppedError;
- (id)delegate;
- (id)latestNextActivityDate;
- (id)memberQueueMetadataBackoffManager;
- (id)migrationCtagToCheckForChanges;
- (id)persistentObjectForKey:(id)a3;
- (id)postCommandCompletionBlock;
- (id)rootCtagToCheckForChanges;
- (id)serverCommunicationBackoffDate;
- (id)serverSideQueueServerSideConfiguration;
- (int)maxMetadataRetryCount;
- (void)MSASAssetDownloader:(id)a3 didFinishDownloadingAsset:(id)a4 inAlbumGUID:(id)a5 error:(id)a6;
- (void)MSASAssetDownloader:(id)a3 willBeginBatchCount:(unint64_t)a4;
- (void)MSASAssetDownloaderDidFinishBatch:(id)a3;
- (void)MSASAssetUploader:(id)a3 didFinishUploadingAssetCollection:(id)a4 intoAlbum:(id)a5 error:(id)a6;
- (void)MSBackoffManagerDidUpdateNextExpiryDate:(id)a3;
- (void)_actionDidFinishWithError:(id)a3 album:(id)a4;
- (void)_addAssetCollectionsDisposition:(int)a3 params:(id)a4;
- (void)_addCommentDisposition:(int)a3 params:(id)a4;
- (void)_addSharingRelationshipsDisposition:(int)a3 params:(id)a4;
- (void)_cancelOutstandingCommandsDisposition:(int)a3 params:(id)a4;
- (void)_checkForAlbumSyncedStateDisposition:(int)a3 params:(id)a4;
- (void)_checkForAssetCollectionUpdatesDisposition:(int)a3 params:(id)a4;
- (void)_checkForChangesDisposition:(int)a3 params:(id)a4;
- (void)_checkForCommentChangesDisposition:(int)a3 params:(id)a4;
- (void)_checkForUpdatesInAlbumDisposition:(int)a3 params:(id)a4;
- (void)_continueAddingAssetCollectionsDisposition:(int)a3 params:(id)a4;
- (void)_createAlbumDisposition:(int)a3 params:(id)a4;
- (void)_deleteAlbumDisposition:(int)a3 params:(id)a4;
- (void)_deleteAssetCollectionsDisposition:(int)a3 params:(id)a4;
- (void)_deleteAssetFilesInAssetCollection:(id)a3;
- (void)_deleteAssetFilesInAssetCollections:(id)a3;
- (void)_deleteCommentDisposition:(int)a3 params:(id)a4;
- (void)_didFinishCheckingUpdatesInAlbumsDisposition:(int)a3 params:(id)a4;
- (void)_getAccessControlsDisposition:(int)a3 params:(id)a4;
- (void)_getAlbumURLDisposition:(int)a3 params:(id)a4;
- (void)_markAsSpamInvitationForAlbumDisposition:(int)a3 params:(id)a4;
- (void)_markAsSpamInvitationForTokenDisposition:(int)a3 params:(id)a4;
- (void)_removeSharingRelationshipsDisposition:(int)a3 params:(id)a4;
- (void)_scheduleEventDisposition:(int)a3 params:(id)a4;
- (void)_sendGetServerSideConfigurationDisposition:(int)a3 params:(id)a4;
- (void)_sendGetUploadTokensDisposition:(int)a3 params:(id)a4;
- (void)_sendPutAssetCollectionsDisposition:(int)a3 params:(id)a4;
- (void)_sendReauthorizeAssetsForDownloadDisposition:(int)a3 params:(id)a4;
- (void)_sendUploadCompleteDisposition:(int)a3 params:(id)a4;
- (void)_setAlbumSyncedStateDisposition:(int)a3 params:(id)a4;
- (void)_setAssetCollectionSyncedStateDisposition:(int)a3 params:(id)a4;
- (void)_setAssetInfoToReauthForDownload:(id)a3;
- (void)_setStopHandlerBlock:(id)a3;
- (void)_subscribeToAlbumDisposition:(int)a3 params:(id)a4;
- (void)_unsubscribeFromAlbumDisposition:(int)a3 params:(id)a4;
- (void)_updateAlbumDisposition:(int)a3 params:(id)a4;
- (void)_workQueueEmptyFileTransferQueuesCompletionBlock:(id)a3;
- (void)acceptInvitationWithToken:(id)a3 info:(id)a4 completionBlock:(id)a5;
- (void)addAssetCollections:(id)a3 toAlbum:(id)a4 info:(id)a5;
- (void)addComments:(id)a3 toAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)addSharingRelationships:(id)a3 toOwnedAlbum:(id)a4 info:(id)a5;
- (void)cancelCompletionBlock:(id)a3;
- (void)cancelOutstandingCommandsForAlbumWithGUID:(id)a3;
- (void)cancelOutstandingCommandsForAssetCollectionWithGUID:(id)a3;
- (void)checkForAlbumSyncedStateChangesInAlbums:(id)a3 info:(id)a4;
- (void)checkForAssetCollectionUpdates:(id)a3 inAlbum:(id)a4 info:(id)a5;
- (void)checkForChangesIfMissingRootCtag;
- (void)checkForChangesResetSync:(BOOL)a3 info:(id)a4;
- (void)checkForCommentChanges:(id)a3 inAlbumWithGUID:(id)a4 withClientOrgKey:(id)a5;
- (void)checkForUpdatesInAlbums:(id)a3 resetSync:(BOOL)a4 info:(id)a5;
- (void)continueAddingAssetCollections:(id)a3 skipAssetCollections:(id)a4 toAlbum:(id)a5 info:(id)a6;
- (void)createAlbum:(id)a3 info:(id)a4;
- (void)deleteAlbum:(id)a3 info:(id)a4;
- (void)deleteAssetCollections:(id)a3 inAlbum:(id)a4 info:(id)a5;
- (void)deleteComments:(id)a3 inAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6;
- (void)getAccessControlsForAlbums:(id)a3 info:(id)a4;
- (void)markAsSpamInvitationForAlbum:(id)a3 invitationGUID:(id)a4 info:(id)a5;
- (void)markAsSpamInvitationForToken:(id)a3 info:(id)a4;
- (void)purgeEverythingCompletionBlock:(id)a3;
- (void)refreshServerSideConfig;
- (void)removeSharingRelationships:(id)a3 fromOwnedAlbum:(id)a4 info:(id)a5;
- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4;
- (void)retryOutstandingActivities;
- (void)scheduleEvent:(id)a3 assetCollectionGUID:(id)a4 albumGUID:(id)a5 info:(id)a6;
- (void)serverSideQueueSetServerSideConfiguration:(id)a3;
- (void)setAlbumSyncedState:(id)a3 forAlbum:(id)a4 info:(id)a5;
- (void)setAssetCollectionSyncedState:(id)a3 forAssetCollection:(id)a4 album:(id)a5 info:(id)a6;
- (void)setDaemon:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setFocusAlbumGUID:(id)a3;
- (void)setFocusAssetCollectionGUID:(id)a3;
- (void)setHasShutDown:(BOOL)a3;
- (void)setIsRetryingOutstandingActivities:(BOOL)a3;
- (void)setMMCSBackoffManagerParameters:(id)a3;
- (void)setMaxMetadataRetryCount:(int)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMetadataBackoffManagerParameters:(id)a3;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbum:(id)a4 info:(id)a5 completionBlock:(id)a6;
- (void)setPendingRootCtag:(id)a3;
- (void)setPersistentObject:(id)a3 forKey:(id)a4;
- (void)setPersonID:(id)a3;
- (void)setPhoneInvitations:(id)a3;
- (void)setPostCommandCompletionBlock:(id)a3;
- (void)setProtocol:(id)a3;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbum:(id)a4 info:(id)a5 completionBlock:(id)a6;
- (void)setRootCtagFromPendingRootCtag;
- (void)setServerSideConfigQueue:(id)a3;
- (void)setServerSideConfiguration:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)start;
- (void)stopAssetDownloadsCompletionBlock:(id)a3;
- (void)subscribeToAlbum:(id)a3 info:(id)a4;
- (void)unsubscribeFromAlbum:(id)a3 info:(id)a4;
- (void)updateAlbum:(id)a3 updateAlbumFlags:(int)a4 info:(id)a5;
- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4;
- (void)videoURLForAssetCollection:(id)a3 inAlbum:(id)a4 completionBlock:(id)a5;
- (void)videoURLsForAssetCollection:(id)a3 forMediaAssetType:(unint64_t)a4 inAlbum:(id)a5 completionBlock:(id)a6;
- (void)workQueueApplyServerSideConfiguration;
- (void)workQueueCancelAllCommandsFilteredByAlbumGUID:(id)a3 assetCollectionGUID:(id)a4;
- (void)workQueueCancelCompletionBlock:(id)a3;
- (void)workQueueCheckForNextCommand;
- (void)workQueueDidFailToFinishCommandDueToTemporaryError:(id)a3;
- (void)workQueueDidFinishCommand;
- (void)workQueueDidFinishCommandByLeavingCommandInQueue;
- (void)workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7;
- (void)workQueueDidFinishCommandDueToCancellation;
- (void)workQueuePerformNextCommand;
- (void)workQueueRefreshServerSideConfig;
- (void)workQueueRetryOutstandingActivities;
- (void)workQueueScheduleReauthForAssets:(id)a3 inAlbum:(id)a4;
- (void)workQueueUpdateNextActivityDate;
@end

@implementation MSASStateMachine

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postCommandCompletionBlock, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_serverSideConfigQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_MMCSBackoffManagerParameters, 0);
  objc_storeStrong((id *)&self->_metadataBackoffManagerParameters, 0);
  objc_storeStrong((id *)&self->_derivativeSpecifications, 0);
  objc_storeStrong((id *)&self->_thumbnailImageScalingSpecification, 0);
  objc_storeStrong((id *)&self->_derivativeImageScalingSpecification, 0);
  objc_storeStrong((id *)&self->_phoneInvitations, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_stopHandlerBlock, 0);
  objc_storeStrong((id *)&self->_assetInfoToReauthForDownload, 0);
  objc_storeStrong((id *)&self->_focusAssetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_focusAlbumGUID, 0);
  objc_storeStrong((id *)&self->_serverSideConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_serverSideConfiguration, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_personID, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_assetDownloader, 0);
  objc_storeStrong((id *)&self->_assetUploader, 0);
  objc_storeStrong((id *)&self->_MMCSBackoffManager, 0);
  objc_storeStrong((id *)&self->_metadataBackoffManager, 0);
  objc_storeStrong((id *)&self->_currentCommandParams, 0);
  objc_storeStrong((id *)&self->_currentCommand, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)setPostCommandCompletionBlock:(id)a3
{
}

- (id)postCommandCompletionBlock
{
  return self->_postCommandCompletionBlock;
}

- (void)setMemberQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setServerSideConfigQueue:(id)a3
{
}

- (OS_dispatch_queue)serverSideConfigQueue
{
  return self->_serverSideConfigQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setMMCSBackoffManagerParameters:(id)a3
{
}

- (NSDictionary)MMCSBackoffManagerParameters
{
  return self->_MMCSBackoffManagerParameters;
}

- (void)setMetadataBackoffManagerParameters:(id)a3
{
}

- (NSDictionary)metadataBackoffManagerParameters
{
  return self->_metadataBackoffManagerParameters;
}

- (void)setHasShutDown:(BOOL)a3
{
  self->_hasShutDown = a3;
}

- (BOOL)hasShutDown
{
  return self->_hasShutDown;
}

- (NSArray)derivativeSpecifications
{
  return self->_derivativeSpecifications;
}

- (MSImageScalingSpecification)thumbnailImageScalingSpecification
{
  return self->_thumbnailImageScalingSpecification;
}

- (MSImageScalingSpecification)derivativeImageScalingSpecification
{
  return self->_derivativeImageScalingSpecification;
}

- (void)setPhoneInvitations:(id)a3
{
}

- (void)setProtocol:(id)a3
{
}

- (void)_setStopHandlerBlock:(id)a3
{
}

- (id)_stopHandlerBlock
{
  return self->_stopHandlerBlock;
}

- (void)_setAssetInfoToReauthForDownload:(id)a3
{
}

- (NSMutableArray)_assetInfoToReauthForDownload
{
  return self->_assetInfoToReauthForDownload;
}

- (void)setIsRetryingOutstandingActivities:(BOOL)a3
{
  self->_isRetryingOutstandingActivities = a3;
}

- (BOOL)isRetryingOutstandingActivities
{
  return self->_isRetryingOutstandingActivities;
}

- (NSString)focusAssetCollectionGUID
{
  return self->_focusAssetCollectionGUID;
}

- (NSString)focusAlbumGUID
{
  return self->_focusAlbumGUID;
}

- (void)setMaxMetadataRetryCount:(int)a3
{
  self->_maxMetadataRetryCount = a3;
}

- (int)maxMetadataRetryCount
{
  return self->_maxMetadataRetryCount;
}

- (void)setDelegate:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setPersonID:(id)a3
{
}

- (NSString)personID
{
  return self->_personID;
}

- (MSAlbumSharingDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (MSAlbumSharingDaemon *)WeakRetained;
}

- (void)MSASAssetDownloaderDidFinishBatch:(id)a3
{
  v4 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSASStateMachine_MSASAssetDownloaderDidFinishBatch___block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __54__MSASStateMachine_MSASAssetDownloaderDidFinishBatch___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _assetInfoToReauthForDownload];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return [*(id *)(v1 + 32) _setAssetInfoToReauthForDownload:0];
  }
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v24 = v1;
  v5 = [*(id *)(v1 + 32) _assetInfoToReauthForDownload];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v26;
  do
  {
    uint64_t v10 = 0;
    v11 = v8;
    do
    {
      if (*(void *)v26 != v9) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
      if (v11
        && ([v11 album],
            v13 = objc_claimAutoreleasedReturnValue(),
            [v12 album],
            v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = [v13 isEqual:v14],
            v14,
            v13,
            !v15))
      {
        if (![v4 count]) {
          goto LABEL_13;
        }
        v17 = *(void **)(v24 + 32);
        v18 = [v11 album];
        [v17 workQueueScheduleReauthForAssets:v4 inAlbum:v18];

        v19 = (void *)MEMORY[0x1E4F1CA48];
        v16 = [v12 asset];
        uint64_t v20 = [v19 arrayWithObject:v16];

        v4 = (void *)v20;
      }
      else
      {
        v16 = [v12 asset];
        [v4 addObject:v16];
      }

LABEL_13:
      id v8 = v12;

      ++v10;
      v11 = v8;
    }
    while (v7 != v10);
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);
LABEL_17:

  uint64_t v1 = v24;
  if ([v4 count])
  {
    v21 = *(void **)(v24 + 32);
    v22 = [v8 album];
    [v21 workQueueScheduleReauthForAssets:v4 inAlbum:v22];
  }
  return [*(id *)(v1 + 32) _setAssetInfoToReauthForDownload:0];
}

- (id)_albumForRequestFromParams:(id)a3
{
  v4 = [a3 objectForKey:@"album"];
  v5 = [(MSASStateMachine *)self delegate];
  uint64_t v6 = [v4 GUID];
  uint64_t v7 = [v5 albumWithGUID:v6];

  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

- (void)_sendReauthorizeAssetsForDownloadDisposition:(int)a3 params:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"assets"];
  id v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v9 = [v6 objectForKey:@"error"];
  uint64_t v10 = (void *)v9;
  if (a3 == 2)
  {
    v12 = [(MSASStateMachine *)self eventQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_320;
    v19[3] = &unk_1E6C3D998;
    id v20 = v7;
    v21 = self;
    id v22 = v8;
    dispatch_async(v12, v19);
  }
  else if (!a3)
  {
    if (v9)
    {
      v11 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D9C0;
      id v29 = v7;
      uint64_t v30 = self;
      id v31 = v8;
      id v32 = v10;
      dispatch_async(v11, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v34 = self;
        __int16 v35 = 2048;
        uint64_t v36 = [v7 count];
        __int16 v37 = 2114;
        v38 = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Reauthorizing %ld assets download from album %{public}@", buf, 0x20u);
      }
      v13 = [(MSASStateMachine *)self protocol];
      v14 = [v13 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v14];

      objc_initWeak((id *)buf, self);
      int v15 = [(MSASStateMachine *)self delegate];
      v16 = [v8 GUID];
      v17 = [v15 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v16 info:0];

      v18 = [(MSASStateMachine *)self protocol];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_316;
      v23[3] = &unk_1E6C3CB70;
      v23[4] = self;
      objc_copyWeak(&v27, (id *)buf);
      id v24 = v6;
      id v25 = v8;
      id v26 = v7;
      [v18 getTokensForAssets:v26 inAlbum:v25 albumURLString:v17 completionBlock:v23];

      objc_destroyWeak(&v27);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v9);
        [v8 MSASStateMachine:*(void *)(a1 + 40) didFinishRetrievingAsset:v7 inAlbum:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_316(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = [a1[4] workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2;
  v16[3] = &unk_1E6C3C908;
  id v17 = v7;
  id v11 = v7;
  objc_copyWeak(&v24, a1 + 8);
  id v18 = a1[5];
  id v19 = a1[6];
  id v12 = a1[7];
  id v13 = a1[4];
  id v20 = v12;
  id v21 = v13;
  id v22 = v9;
  id v23 = v8;
  id v14 = v8;
  id v15 = v9;
  dispatch_async(v10, v16);

  objc_destroyWeak(&v24);
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_320(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v7 = (void *)MEMORY[0x1E019E3B0]();
        id v8 = [*(id *)(a1 + 40) delegate];
        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = [v9 _canceledError];
        [v8 MSASStateMachine:v9 didFinishRetrievingAsset:v6 inAlbum:v10 error:v11];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  v77 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = NSStringFromSelector(sel__sendReauthorizeAssetsForDownloadDisposition_params_);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) GUID];
    LOBYTE(v2) = [WeakRetained workQueueEndCommandWithError:v2 command:v3 params:v4 albumGUID:v5 assetCollectionGUID:0];

    if (v2)
    {
      int v75 = 0;
      goto LABEL_49;
    }
    uint64_t v49 = a1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v71 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v72 = [*(id *)(a1 + 56) count];
      v73 = *(void **)(a1 + 48);
      v74 = [*(id *)(a1 + 32) MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      id v112 = v71;
      __int16 v113 = 2048;
      uint64_t v114 = v72;
      __int16 v115 = 2114;
      v116 = v73;
      __int16 v117 = 2114;
      v118 = v74;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to authorize %ld assets in album %{public}@. Error: %{public}@", buf, 0x2Au);

      uint64_t v49 = a1;
    }
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v50 = *(id *)(v49 + 56);
    uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v110 count:16];
    if (v51)
    {
      uint64_t v52 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v103 != v52) {
            objc_enumerationMutation(v50);
          }
          [v77 setObject:*(void *)(a1 + 32) forKey:*(void *)(*((void *)&v102 + 1) + 8 * i)];
        }
        uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v110 count:16];
      }
      while (v51);
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 64) memberQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_317;
    block[3] = &unk_1E6C3DA38;
    void block[4] = *(void *)(a1 + 64);
    dispatch_barrier_sync(v6, block);

    id v7 = [*(id *)(a1 + 64) eventQueue];
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2_318;
    v99[3] = &unk_1E6C3C220;
    id v8 = (id *)(a1 + 88);
    objc_copyWeak(&v100, (id *)(a1 + 88));
    dispatch_async(v7, v99);

    [v77 addEntriesFromDictionary:*(void *)(a1 + 72)];
    if ([*(id *)(a1 + 72) count])
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v9 = *(id *)(a1 + 72);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v109 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v96;
        id v12 = MEMORY[0x1E4F14500];
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v96 != v11) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v95 + 1) + 8 * v13);
            long long v15 = v12;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              id v16 = objc_loadWeakRetained(v8);
              id v17 = [v14 GUID];
              *(_DWORD *)buf = 138543618;
              id v112 = v16;
              __int16 v113 = 2114;
              uint64_t v114 = (uint64_t)v17;
              _os_log_error_impl(&dword_1DC434000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reauthorize asset GUID %{public}@ for redownload.", buf, 0x16u);
            }
            ++v13;
          }
          while (v10 != v13);
          uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v109 count:16];
        }
        while (v10);
      }
    }
    if ([*(id *)(a1 + 80) count])
    {
      uint64_t v18 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = objc_loadWeakRetained(v8);
        uint64_t v21 = [*(id *)(a1 + 80) count];
        *(_DWORD *)buf = 138543618;
        id v112 = v20;
        __int16 v113 = 2048;
        uint64_t v114 = v21;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully reauthorized the download of %ld assets. Trying download again.", buf, 0x16u);
      }
      id v22 = MSASPlatform();
      int v23 = [v22 shouldLogAtLevel:7];

      if (v23)
      {
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v24 = *(id *)(a1 + 80);
        uint64_t v25 = [v24 countByEnumeratingWithState:&v91 objects:v108 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v92;
          id v27 = MEMORY[0x1E4F14500];
          do
          {
            uint64_t v28 = 0;
            do
            {
              if (*(void *)v92 != v26) {
                objc_enumerationMutation(v24);
              }
              id v29 = *(void **)(*((void *)&v91 + 1) + 8 * v28);
              uint64_t v30 = v27;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                id v31 = [v29 GUID];
                *(_DWORD *)buf = 138543362;
                id v112 = v31;
                _os_log_debug_impl(&dword_1DC434000, v27, OS_LOG_TYPE_DEBUG, " ...Asset GUID %{public}@", buf, 0xCu);
              }
              ++v28;
            }
            while (v25 != v28);
            uint64_t v25 = [v24 countByEnumeratingWithState:&v91 objects:v108 count:16];
          }
          while (v25);
        }
      }
      id v32 = objc_loadWeakRetained(v8);
      v33 = [v32 _model];
      [v33 beginTransaction];

      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v34 = *(id *)(a1 + 80);
      uint64_t v35 = [v34 countByEnumeratingWithState:&v87 objects:v107 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v88;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v88 != v36) {
              objc_enumerationMutation(v34);
            }
            uint64_t v38 = *(void *)(*((void *)&v87 + 1) + 8 * j);
            id v39 = objc_loadWeakRetained(v8);
            v40 = [v39 _model];
            v41 = [*(id *)(a1 + 48) GUID];
            [v40 enqueueAssetForDownload:v38 inAlbumWithGUID:v41];

            id v42 = objc_loadWeakRetained(v8);
            v43 = [v42 _assetDownloader];
            v44 = [*(id *)(a1 + 48) GUID];
            [v43 didEnqueueAsset:v38 forAlbumGUID:v44];
          }
          uint64_t v35 = [v34 countByEnumeratingWithState:&v87 objects:v107 count:16];
        }
        while (v35);
      }

      id v45 = objc_loadWeakRetained(v8);
      v46 = [v45 _model];
      [v46 endTransaction];

      id v47 = objc_loadWeakRetained(v8);
      v48 = [v47 _assetDownloader];
      [v48 retryOutstandingActivities];
    }
    objc_destroyWeak(&v100);
  }
  int v75 = 1;
LABEL_49:
  if ([v77 count])
  {
    v54 = [*(id *)(a1 + 64) eventQueue];
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_319;
    v83[3] = &unk_1E6C3CB48;
    id v55 = v77;
    id v84 = v55;
    v76 = (id *)(a1 + 88);
    objc_copyWeak(&v86, (id *)(a1 + 88));
    id v85 = *(id *)(a1 + 48);
    dispatch_async(v54, v83);

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v56 = v55;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v79 objects:v106 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v80;
      v59 = MEMORY[0x1E4F14500];
      do
      {
        uint64_t v60 = 0;
        do
        {
          if (*(void *)v80 != v58) {
            objc_enumerationMutation(v56);
          }
          v61 = *(void **)(*((void *)&v79 + 1) + 8 * v60);
          v62 = (void *)MEMORY[0x1E019E3B0]();
          v63 = [v56 objectForKey:v61];
          v64 = v59;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            id v65 = objc_loadWeakRetained(v76);
            v66 = [v63 MSVerboseDescription];
            *(_DWORD *)buf = 138543874;
            id v112 = v65;
            __int16 v113 = 2114;
            uint64_t v114 = (uint64_t)v61;
            __int16 v115 = 2114;
            v116 = v66;
            _os_log_error_impl(&dword_1DC434000, v59, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reauthorize asset %{public}@. Error: %{public}@", buf, 0x20u);
          }
          ++v60;
        }
        while (v57 != v60);
        uint64_t v57 = [v56 countByEnumeratingWithState:&v79 objects:v106 count:16];
      }
      while (v57);
    }

    id v67 = objc_loadWeakRetained(v76);
    v68 = [v67 _assetDownloader];
    v69 = [v56 allKeys];
    [v68 unregisterAssets:v69];

    objc_destroyWeak(&v86);
  }
  if (v75)
  {
    id v70 = objc_loadWeakRetained((id *)(a1 + 88));
    [v70 workQueueDidFinishCommand];
  }
}

uint64_t __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_317(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_2_318(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained daemon];
  id v3 = objc_loadWeakRetained(v1);
  uint64_t v4 = [v3 personID];
  [v2 didReceiveAuthSuccessForPersonID:v4];
}

void __72__MSASStateMachine__sendReauthorizeAssetsForDownloadDisposition_params___block_invoke_319(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 32) objectForKey:v6];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        id v9 = [WeakRetained delegate];
        id v10 = objc_loadWeakRetained((id *)(a1 + 48));
        [v9 MSASStateMachine:v10 didFinishRetrievingAsset:v6 inAlbum:*(void *)(a1 + 40) error:v7];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v3);
  }
}

- (void)workQueueScheduleReauthForAssets:(id)a3 inAlbum:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v14 = 138543874;
    long long v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 count];
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling reauthorization for %ld items in album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = v8;
  if (v7) {
    [v8 setObject:v7 forKey:@"album"];
  }
  if (v6) {
    [v9 setObject:v6 forKey:@"assets"];
  }
  id v10 = [(MSASStateMachine *)self _model];
  uint64_t v11 = NSStringFromSelector(sel__sendReauthorizeAssetsForDownloadDisposition_params_);
  long long v12 = [(MSASStateMachine *)self personID];
  long long v13 = [v7 GUID];
  [v10 enqueueCommandAtHeadOfQueue:v11 params:v9 personID:v12 albumGUID:v13 assetCollectionGUID:0];

  [(MSASStateMachine *)self workQueueRetryOutstandingActivities];
}

- (void)MSASAssetDownloader:(id)a3 didFinishDownloadingAsset:(id)a4 inAlbumGUID:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = [(MSASStateMachine *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v9;
  id v13 = v9;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v12, v16);
}

void __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = [v2 MSASStateMachineDidRequestAlbumWithGUID:*(void *)(a1 + 40)];

  if (([*(id *)(a1 + 48) MMCSIsAuthorizationError] & 1) != 0
    || ([*(id *)(a1 + 48) MSContainsErrorWithDomain:@"MSASAssetTransferErrorDomain" code:2] & 1) != 0
    || [*(id *)(a1 + 48) MSContainsErrorWithDomain:@"MSASAssetTransferErrorDomain" code:1])
  {
    uint64_t v4 = objc_alloc_init(MSASAssetInfoToReauthForDownload);
    [(MSASAssetInfoToReauthForDownload *)v4 setAsset:*(void *)(a1 + 56)];
    [(MSASAssetInfoToReauthForDownload *)v4 setAlbum:v3];
    uint64_t v5 = [*(id *)(a1 + 32) _assetInfoToReauthForDownload];
    [v5 addObject:v4];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) _assetDownloader];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:*(void *)(a1 + 56)];
    [v6 unregisterAssets:v7];

    id v8 = [*(id *)(a1 + 32) eventQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke_2;
    v9[3] = &unk_1E6C3D9C0;
    v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    id v11 = v3;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(v8, v9);
  }
}

void __84__MSASStateMachine_MSASAssetDownloader_didFinishDownloadingAsset_inAlbumGUID_error___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishRetrievingAsset:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

- (void)MSASAssetDownloader:(id)a3 willBeginBatchCount:(unint64_t)a4
{
  uint64_t v5 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MSASStateMachine_MSASAssetDownloader_willBeginBatchCount___block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v5, block);
}

void __60__MSASStateMachine_MSASAssetDownloader_willBeginBatchCount___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1CA48] array];
  [v1 _setAssetInfoToReauthForDownload:v2];
}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    id v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = [v6 count];
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving %ld assets in albumGUID %{public}@.", buf, 0x20u);
  }
  id v8 = [(MSASStateMachine *)self _assetDownloader];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke;
  v11[3] = &unk_1E6C3D998;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 registerAssets:v10 completionBlock:v11];
}

void __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_2(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] _model];
  [v2 beginTransaction];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = a1[5];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        id v9 = [a1[4] _model];
        [v9 enqueueAssetForDownload:v8 inAlbumWithGUID:a1[6]];

        id v10 = [a1[4] _assetDownloader];
        [v10 didEnqueueAsset:v8 forAlbumGUID:a1[6]];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  id v11 = [a1[4] _model];
  [v11 endTransaction];

  id v12 = [a1[4] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_3;
  block[3] = &unk_1E6C3D998;
  id v13 = a1[5];
  void block[4] = a1[4];
  id v16 = v13;
  id v17 = a1[6];
  dispatch_async(v12, block);

  if (([a1[4] hasShutDown] & 1) == 0)
  {
    id v14 = [a1[4] _assetDownloader];
    [v14 retryOutstandingActivities];
  }
}

void __51__MSASStateMachine_retrieveAssets_inAlbumWithGUID___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishEnqueueingAssetsForDownload:*(void *)(a1 + 40) inAlbumWithGUID:*(void *)(a1 + 48)];
}

- (void)MSASAssetUploader:(id)a3 didFinishUploadingAssetCollection:(id)a4 intoAlbum:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASStateMachine *)self workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__MSASStateMachine_MSASAssetUploader_didFinishUploadingAssetCollection_intoAlbum_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __88__MSASStateMachine_MSASAssetUploader_didFinishUploadingAssetCollection_intoAlbum_error___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [a1[4] delegate];
  id v4 = a1[4];
  uint64_t v5 = [a1[5] GUID];
  LOBYTE(v4) = [v3 MSASStateMachine:v4 didQueryIsAssetCollectionWithGUIDInModel:v5];

  if (v4)
  {
    id v6 = a1[7];
    if (v6)
    {
      if ([v6 MMCSIsAuthorizationError])
      {
        uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v8 = v7;
        id v9 = a1[6];
        if (v9) {
          [v7 setObject:v9 forKey:@"album"];
        }
        id v10 = a1[5];
        if (v10) {
          [v8 setObject:v10 forKey:@"assetCollection"];
        }
        id v11 = [a1[4] _model];
        id v12 = NSStringFromSelector(sel__sendGetUploadTokensDisposition_params_);
        id v13 = [a1[4] personID];
        id v14 = [a1[6] GUID];
        [v11 enqueueCommand:v12 params:v8 personID:v13 albumGUID:v14 assetCollectionGUID:0];

        goto LABEL_17;
      }
      if ([a1[7] MSContainsErrorWithDomain:@"MSASAssetTransferErrorDomain" code:3])
      {
LABEL_16:
        [v2 setObject:a1[6] forKey:@"album"];
        uint64_t v8 = [a1[4] _model];
        id v11 = NSStringFromSelector(sel__sendUploadCompleteDisposition_params_);
        id v12 = [a1[4] personID];
        id v13 = [a1[6] GUID];
        [v8 enqueueCommandAtHeadOfQueue:v11 params:v2 personID:v12 albumGUID:v13 assetCollectionGUID:0];
LABEL_17:

        goto LABEL_18;
      }
      long long v21 = [MEMORY[0x1E4F1CA60] dictionary];
      [v21 setObject:a1[7] forKey:a1[5]];
      id v22 = kMSASFailedAssetCollectionsAndErrorsKey;
    }
    else
    {
      long long v21 = [MEMORY[0x1E4F1C978] arrayWithObject:a1[5]];
      id v22 = &kMSASSuccessfulAssetCollectionsKey;
    }
    [v2 setObject:v21 forKey:*v22];

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = a1[4];
    id v24 = [a1[5] GUID];
    int v25 = 138543618;
    id v26 = v23;
    __int16 v27 = 2114;
    uint64_t v28 = v24;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: The uploaded asset collection GUID %{public}@ is no longer in the model. Discontiniuing upload.", (uint8_t *)&v25, 0x16u);
  }
  [a1[4] _deleteAssetFilesInAssetCollection:a1[5]];
  uint64_t v8 = [a1[4] delegate];
  id v15 = a1[4];
  id v16 = a1[5];
  id v17 = a1[6];
  id v18 = (void *)MEMORY[0x1E4F28C58];
  id v19 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_PHOTO_NOT_IN_MODEL");
  long long v20 = [v18 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:5 description:v19];
  [v8 MSASStateMachine:v15 didFinishAddingAssetCollection:v16 toAlbum:v17 info:0 error:v20];

LABEL_18:
  [a1[4] workQueueRetryOutstandingActivities];
}

- (void)_deleteAssetFilesInAssetCollections:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_deleteAssetFilesInAssetCollection:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v4 = [v3 GUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = self;
    __int16 v29 = 2114;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Cleaning up files for asset collection %{public}@.", buf, 0x16u);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v20 = v3;
  uint64_t v5 = [v3 assets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    long long v9 = MEMORY[0x1E4F14500];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        long long v12 = (void *)MEMORY[0x1E019E3B0]();
        id v13 = [v11 path];

        if (v13)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            id v17 = [v11 path];
            *(_DWORD *)buf = 138543618;
            uint64_t v28 = self;
            __int16 v29 = 2112;
            uint64_t v30 = v17;
            _os_log_debug_impl(&dword_1DC434000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Deleting asset file: %@", buf, 0x16u);
          }
          uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v15 = [v11 path];
          id v22 = 0;
          [v14 removeItemAtPath:v15 error:&v22];
          id v16 = v22;

          if (v16 && os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            id v18 = [v11 path];
            id v19 = [v16 MSVerboseDescription];
            *(_DWORD *)buf = 138543874;
            uint64_t v28 = self;
            __int16 v29 = 2112;
            uint64_t v30 = v18;
            __int16 v31 = 2114;
            id v32 = v19;
            _os_log_debug_impl(&dword_1DC434000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Failed to delete asset file at path %@. Error: %{public}@", buf, 0x20u);
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v7);
  }
}

- (void)videoURLsForAssetCollection:(id)a3 forMediaAssetType:(unint64_t)a4 inAlbum:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke;
  block[3] = &unk_1E6C3CD88;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v2;
    __int16 v36 = 2114;
    uint64_t v37 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting video URL for asset collection %{public}@.", buf, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = [*(id *)(a1 + 48) GUID];
  uint64_t v6 = [v4 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v5 info:0];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [*(id *)(a1 + 40) assets];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      if ([v11 mediaAssetType] == *(void *)(a1 + 64)) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v12 = v11;

    if (v12) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  id v13 = [*(id *)(a1 + 40) assets];
  id v12 = [v13 lastObject];

LABEL_14:
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v14 = [*(id *)(a1 + 32) protocol];
  id v15 = [*(id *)(a1 + 40) GUID];
  id v16 = [*(id *)(a1 + 48) GUID];
  id v17 = [*(id *)(a1 + 48) clientOrgKey];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_305;
  v22[3] = &unk_1E6C3CB18;
  v22[4] = *(void *)(a1 + 32);
  id v23 = *(id *)(a1 + 48);
  id v18 = v6;
  id v24 = v18;
  id v19 = v12;
  id v25 = v19;
  id v20 = *(id *)(a1 + 40);
  unint64_t v21 = *(void **)(a1 + 64);
  id v26 = v20;
  v28[1] = v21;
  objc_copyWeak(v28, (id *)buf);
  id v27 = *(id *)(a1 + 56);
  [v14 getVideoURL:v19 forAssetCollectionWithGUID:v15 inAlbumWithGUID:v16 albumURLString:v18 withClientOrgKey:v17 completionBlock:v22];

  objc_destroyWeak(v28);
  objc_destroyWeak((id *)buf);
}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_305(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && [v7 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:18])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = [v7 MSVerboseDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v21;
      __int16 v43 = 2114;
      id v44 = v22;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered visitor authentication failure. Getting new album URL. Error: %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [*(id *)(a1 + 32) protocol];
    id v11 = [*(id *)(a1 + 40) GUID];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_306;
    v32[3] = &unk_1E6C3CAF0;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 32);
    id v33 = v12;
    uint64_t v34 = v13;
    id v35 = *(id *)(a1 + 40);
    id v36 = *(id *)(a1 + 56);
    id v14 = *(id *)(a1 + 64);
    id v15 = *(void **)(a1 + 88);
    id v37 = v14;
    v40[1] = v15;
    objc_copyWeak(v40, (id *)(a1 + 80));
    id v38 = v7;
    id v39 = *(id *)(a1 + 72);
    [v10 getAlbumURLForAlbumWithGUID:v11 completionBlock:v32];

    objc_destroyWeak(v40);
    id WeakRetained = v33;
  }
  else
  {
    if ([v8 count])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = *(void *)(a1 + 88);
        *(_DWORD *)buf = 138544386;
        uint64_t v42 = v17;
        __int16 v43 = 2114;
        id v44 = v8;
        __int16 v45 = 2114;
        id v46 = v9;
        __int16 v47 = 2114;
        uint64_t v48 = v18;
        __int16 v49 = 2048;
        uint64_t v50 = v19;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Using video URLs %{public}@ with expiration %{public}@ for asset collection %{public}@ and media asset type %ld.", buf, 0x34u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      id v24 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v23;
      __int16 v43 = 2114;
      id v44 = v24;
      __int16 v45 = 2114;
      id v46 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a working video URL for asset collection %{public}@. Error: %{public}@.", buf, 0x20u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    id v20 = [WeakRetained eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_309;
    block[3] = &unk_1E6C3CA28;
    objc_copyWeak(&v31, (id *)(a1 + 80));
    id v26 = v7;
    id v27 = *(id *)(a1 + 40);
    id v30 = *(id *)(a1 + 72);
    id v28 = v8;
    id v29 = v9;
    dispatch_async(v20, block);

    objc_destroyWeak(&v31);
  }
}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_306(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6 || ([v6 isEqualToString:*(void *)(a1 + 32)] & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v18;
      __int16 v30 = 2114;
      id v31 = v19;
      __int16 v32 = 2114;
      id v33 = v5;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a new album URL for album %{public}@. Error: %{public}@.", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      id v31 = v7;
      __int16 v32 = 2114;
      id v33 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting video URL using new album URL %{public}@ for album %{public}@.", buf, 0x20u);
    }
    uint64_t v10 = [*(id *)(a1 + 40) delegate];
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [*(id *)(a1 + 48) GUID];
    [v10 MSASStateMachine:v11 didFindNewURLString:v7 forAlbumWithGUID:v12 info:0];

    uint64_t v13 = [*(id *)(a1 + 40) protocol];
    uint64_t v21 = *(void *)(a1 + 56);
    id v14 = [*(id *)(a1 + 64) GUID];
    id v15 = [*(id *)(a1 + 48) GUID];
    id v20 = [*(id *)(a1 + 48) clientOrgKey];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_307;
    v22[3] = &unk_1E6C3CAC8;
    v22[4] = *(void *)(a1 + 40);
    id v16 = *(id *)(a1 + 64);
    uint64_t v17 = *(void **)(a1 + 96);
    id v23 = v16;
    v27[1] = v17;
    objc_copyWeak(v27, (id *)(a1 + 88));
    id v24 = *(id *)(a1 + 72);
    id v25 = *(id *)(a1 + 48);
    id v26 = *(id *)(a1 + 80);
    [v13 getVideoURL:v21 forAssetCollectionWithGUID:v14 inAlbumWithGUID:v15 albumURLString:v7 withClientOrgKey:v20 completionBlock:v22];

    objc_destroyWeak(v27);
  }
}

uint64_t __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_309(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _actionDidFinishWithError:*(void *)(a1 + 32) album:*(void *)(a1 + 40)];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v3();
}

void __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_307(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138544386;
      uint64_t v30 = v10;
      __int16 v31 = 2114;
      id v32 = v8;
      __int16 v33 = 2114;
      id v34 = v9;
      __int16 v35 = 2114;
      uint64_t v36 = v11;
      __int16 v37 = 2048;
      uint64_t v38 = v12;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Using video URLs %{public}@ with expiration %{public}@ for asset collection %{public}@ and media asset type %ld.", buf, 0x34u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    id v32 = v20;
    __int16 v33 = 2114;
    id v34 = v7;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a working video URL for asset collection %{public}@. Error: %{public}@.", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v14 = [WeakRetained eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_308;
  block[3] = &unk_1E6C3CAA0;
  objc_copyWeak(&v28, (id *)(a1 + 72));
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v24 = v7;
  id v25 = v8;
  id v26 = v9;
  id v27 = v15;
  id v16 = v9;
  id v17 = v8;
  id v18 = v7;
  dispatch_async(v14, block);

  objc_destroyWeak(&v28);
}

uint64_t __90__MSASStateMachine_videoURLsForAssetCollection_forMediaAssetType_inAlbum_completionBlock___block_invoke_308(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  [WeakRetained _actionDidFinishWithError:*(void *)(a1 + 32) album:*(void *)(a1 + 40)];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
  return v3();
}

- (void)videoURLForAssetCollection:(id)a3 inAlbum:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke;
  v15[3] = &unk_1E6C3CA78;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke(id *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v2 = a1[4];
    id v3 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v36 = v2;
    __int16 v37 = 2114;
    id v38 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting video URL for asset collection %{public}@.", buf, 0x16u);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [a1[5] assets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v9 assetDataAvailableOnServer])
        {
          uint64_t v10 = [v9 mediaAssetType];
          if (v10 == 6)
          {
            id v11 = v9;

            id v6 = v11;
          }
          else if (v10 == 7)
          {
            id v12 = v9;

            id v6 = v12;
            goto LABEL_15;
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v5);
LABEL_15:

    if (v6)
    {
      id v13 = [a1[4] delegate];
      id v14 = [a1[6] GUID];
      id v15 = [v13 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v14 info:0];

      objc_initWeak((id *)buf, a1[4]);
      id v16 = [a1[4] protocol];
      id v17 = [a1[5] GUID];
      id v18 = [a1[6] GUID];
      uint64_t v19 = [a1[6] clientOrgKey];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke_299;
      v25[3] = &unk_1E6C3CA50;
      id v20 = a1[5];
      v25[4] = a1[4];
      id v26 = v20;
      objc_copyWeak(&v29, (id *)buf);
      id v27 = a1[6];
      id v28 = a1[7];
      [v16 getVideoURL:v6 forAssetCollectionWithGUID:v17 inAlbumWithGUID:v18 albumURLString:v15 withClientOrgKey:v19 completionBlock:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);

      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
  id v22 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_SUBSCRIBER_CANNOT_GET_VIDEO");
  id v6 = [v21 MSErrorWithDomain:@"MSASSubscriberErrorDomain" code:2 description:v22];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v23 = a1[4];
    id v24 = a1[5];
    *(_DWORD *)buf = 138543618;
    id v36 = v23;
    __int16 v37 = 2114;
    id v38 = v24;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: No asset has been completely uploaded for asset collection %{public}@.", buf, 0x16u);
  }
  (*((void (**)(void))a1[7] + 2))();
LABEL_21:
}

void __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke_299(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    uint64_t v10 = [v8 objectAtIndex:0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v11;
      __int16 v30 = 2114;
      long long v31 = v10;
      __int16 v32 = 2114;
      id v33 = v12;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Using video URL %{public}@ for asset collection %{public}@.", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v19;
      __int16 v30 = 2114;
      long long v31 = v20;
      __int16 v32 = 2114;
      id v33 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to get a working video URL for asset collection %{public}@. Error:%{public}@", buf, 0x20u);
    }
    uint64_t v10 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v14 = [WeakRetained eventQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke_300;
  v21[3] = &unk_1E6C3CA28;
  objc_copyWeak(&v27, (id *)(a1 + 64));
  id v22 = v7;
  id v23 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v25 = v9;
  id v26 = v15;
  id v24 = v10;
  id v16 = v9;
  id v17 = v10;
  id v18 = v7;
  dispatch_async(v14, v21);

  objc_destroyWeak(&v27);
}

uint64_t __71__MSASStateMachine_videoURLForAssetCollection_inAlbum_completionBlock___block_invoke_300(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _actionDidFinishWithError:*(void *)(a1 + 32) album:*(void *)(a1 + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v3();
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbum:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D218;
  BOOL v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v2 = @"Enabling";
    }
    else {
      id v2 = @"Disabling";
    }
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v3;
    __int16 v15 = 2114;
    id v16 = v2;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: %{public}@ multiple contributors for album %{public}@.", buf, 0x20u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v5 = [*(id *)(a1 + 32) protocol];
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = *(unsigned char *)(a1 + 64) != 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_298;
  v8[3] = &unk_1E6C3CA00;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v5 setMultipleContributorsEnabled:v7 forAlbum:v6 completionBlock:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_298(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v5 = [WeakRetained eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3C9D8;
  objc_copyWeak(&v12, a1 + 7);
  id v8 = v3;
  id v9 = a1[4];
  id v11 = a1[6];
  id v10 = a1[5];
  id v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v12);
}

uint64_t __81__MSASStateMachine_setMultipleContributorsEnabled_forAlbum_info_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _actionDidFinishWithError:*(void *)(a1 + 32) album:*(void *)(a1 + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbum:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D218;
  BOOL v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    if (*(unsigned char *)(a1 + 64)) {
      id v2 = @"Enabling";
    }
    else {
      id v2 = @"Disabling";
    }
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v3;
    __int16 v15 = 2114;
    id v16 = v2;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: %{public}@ public URL sharing for album %{public}@.", buf, 0x20u);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v5 = [*(id *)(a1 + 32) protocol];
  uint64_t v6 = *(void *)(a1 + 40);
  BOOL v7 = *(unsigned char *)(a1 + 64) != 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_297;
  v8[3] = &unk_1E6C3CA00;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  [v5 setPublicAccessEnabled:v7 forAlbum:v6 completionBlock:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_297(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v5 = [WeakRetained eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3C9D8;
  objc_copyWeak(&v12, a1 + 7);
  id v8 = v3;
  id v9 = a1[4];
  id v11 = a1[6];
  id v10 = a1[5];
  id v6 = v3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v12);
}

uint64_t __73__MSASStateMachine_setPublicAccessEnabled_forAlbum_info_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _actionDidFinishWithError:*(void *)(a1 + 32) album:*(void *)(a1 + 40)];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

- (void)_scheduleEventDisposition:(int)a3 params:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  BOOL v7 = [v6 objectForKey:@"event"];
  id v8 = [v6 objectForKey:@"assetCollectionGUID"];
  id v9 = [v6 objectForKey:@"albumGUID"];
  id v10 = [v6 objectForKey:@"info"];

  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Event fired: %{public}@ for assetCollectionGUID: %{public}@, albumGUID: %{public}@", buf, 0x2Au);
    }
    id v11 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASStateMachine__scheduleEventDisposition_params___block_invoke;
    block[3] = &unk_1E6C3D9E8;
    void block[4] = self;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    dispatch_async(v11, block);

    [(MSASStateMachine *)self workQueueDidFinishCommand];
  }
}

void __53__MSASStateMachine__scheduleEventDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFireScheduledEvent:*(void *)(a1 + 40) forAssetCollectionGUID:*(void *)(a1 + 48) albumGUID:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)scheduleEvent:(id)a3 assetCollectionGUID:(id)a4 albumGUID:(id)a5 info:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    uint64_t v25 = self;
    __int16 v26 = 2114;
    id v27 = v10;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling event to fire: %{public}@, asset collection GUID: %{public}@ album GUID: %{public}@", buf, 0x2Au);
  }
  id v14 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MSASStateMachine_scheduleEvent_assetCollectionGUID_albumGUID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __69__MSASStateMachine_scheduleEvent_assetCollectionGUID_albumGUID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _model];
  [v2 beginTransaction];

  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = v3;
  if (v4) {
    [v3 setObject:v4 forKey:@"event"];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    [v12 setObject:v5 forKey:@"assetCollectionGUID"];
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    [v12 setObject:v6 forKey:@"albumGUID"];
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    [v12 setObject:v7 forKey:@"info"];
  }
  id v8 = [*(id *)(a1 + 32) _model];
  id v9 = NSStringFromSelector(sel__scheduleEventDisposition_params_);
  id v10 = [*(id *)(a1 + 32) personID];
  [v8 enqueueCommand:v9 params:v12 personID:v10 albumGUID:*(void *)(a1 + 56) assetCollectionGUID:*(void *)(a1 + 48)];

  id v11 = [*(id *)(a1 + 32) _model];
  [v11 endTransaction];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_addCommentDisposition:(int)a3 params:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v21 = [v6 objectForKey:@"comment"];
  uint64_t v7 = [v6 objectForKey:@"assetCollection"];
  id v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v9 = [v6 objectForKey:@"info"];
  uint64_t v10 = [v6 objectForKey:@"error"];
  id v11 = (void *)v10;
  if (a3 == 2)
  {
    id v13 = [(MSASStateMachine *)self eventQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_3;
    v22[3] = &unk_1E6C3D9E8;
    v22[4] = self;
    id v23 = v21;
    id v24 = v7;
    id v25 = v8;
    id v26 = v9;
    dispatch_async(v13, v22);
  }
  else if (!a3)
  {
    if (v10)
    {
      id v12 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D3A8;
      void block[4] = self;
      id v35 = v21;
      id v36 = v7;
      id v37 = v8;
      id v38 = v9;
      id v39 = v11;
      dispatch_async(v12, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v7 GUID];
        *(_DWORD *)buf = 138544130;
        v41 = self;
        __int16 v42 = 2114;
        __int16 v43 = v21;
        __int16 v44 = 2114;
        __int16 v45 = v14;
        __int16 v46 = 2114;
        __int16 v47 = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding comment %{public}@ to asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
      }
      id v15 = [(MSASStateMachine *)self protocol];
      id v16 = [v15 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v16];

      objc_initWeak((id *)buf, self);
      id v17 = [(MSASStateMachine *)self delegate];
      id v18 = [v8 GUID];
      __int16 v19 = [v17 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v18 info:v9];

      id v20 = [(MSASStateMachine *)self protocol];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      id v27[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_284;
      v27[3] = &unk_1E6C3C9A8;
      objc_copyWeak(&v33, (id *)buf);
      id v28 = v6;
      id v29 = v8;
      id v30 = v7;
      id v31 = v21;
      id v32 = v9;
      [v20 addComment:v31 toAssetCollection:v30 inAlbum:v29 albumURLString:v19 completionBlock:v27];

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishAddingComment:*(void *)(a1 + 40) toAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) info:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_284(id *a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = a1 + 9;
  id WeakRetained = objc_loadWeakRetained(a1 + 9);
  id v8 = [WeakRetained workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C980;
  id v12 = v5;
  id v13 = WeakRetained;
  id v14 = a1[4];
  id v15 = a1[5];
  id v16 = a1[6];
  id v17 = a1[7];
  id v18 = a1[8];
  id v9 = WeakRetained;
  id v10 = v5;
  objc_copyWeak(&v19, v6);
  int v20 = a3;
  dispatch_async(v8, block);

  objc_destroyWeak(&v19);
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_3(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = [v2 _canceledError];
  [v8 MSASStateMachine:v2 didFinishAddingComment:v3 toAssetCollection:v4 inAlbum:v5 info:v6 error:v7];
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = NSStringFromSelector(sel__addCommentDisposition_params_);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 56) GUID];
    uint64_t v7 = [*(id *)(a1 + 64) GUID];
    char v8 = [v3 workQueueEndCommandWithError:v2 command:v4 params:v5 albumGUID:v6 assetCollectionGUID:v7];

    if (v8) {
      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = *(void *)(a1 + 64);
      uint64_t v23 = *(void *)(a1 + 72);
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(a1 + 40);
      id v27 = [*(id *)(a1 + 32) MSVerboseDescription];
      *(_DWORD *)buf = 138544386;
      uint64_t v44 = v26;
      __int16 v45 = 2114;
      uint64_t v46 = v23;
      __int16 v47 = 2114;
      uint64_t v48 = v24;
      __int16 v49 = 2114;
      uint64_t v50 = v25;
      __int16 v51 = 2114;
      uint64_t v52 = v27;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add comment %{public}@ to asset collection %{public}@ in album %{public}@. Error: %{public}@", buf, 0x34u);
    }
    id v9 = [*(id *)(a1 + 40) eventQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_285;
    v36[3] = &unk_1E6C3D3A8;
    id v10 = &v37;
    id v37 = *(id *)(a1 + 40);
    id v11 = &v38;
    id v38 = *(id *)(a1 + 72);
    id v12 = &v39;
    id v39 = *(id *)(a1 + 64);
    id v13 = &v40;
    id v40 = *(id *)(a1 + 56);
    id v14 = &v41;
    id v41 = *(id *)(a1 + 80);
    id v15 = &v42;
    id v42 = *(id *)(a1 + 32);
    id v16 = v36;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 72);
      uint64_t v20 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      uint64_t v44 = v17;
      __int16 v45 = 2114;
      uint64_t v46 = v18;
      __int16 v47 = 2114;
      uint64_t v48 = v19;
      __int16 v49 = 2114;
      uint64_t v50 = v20;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Finished adding comment %{public}@ to asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
    }
    [*(id *)(a1 + 72) setID:*(unsigned int *)(a1 + 96)];
    id v21 = [*(id *)(a1 + 40) memberQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_286;
    block[3] = &unk_1E6C3DA38;
    id v10 = &v35;
    id v35 = *(id *)(a1 + 40);
    dispatch_barrier_sync(v21, block);

    id v9 = [*(id *)(a1 + 40) eventQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    id v28[2] = __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2_287;
    v28[3] = &unk_1E6C3D9E8;
    id v11 = &v29;
    id v29 = *(id *)(a1 + 40);
    id v12 = &v30;
    id v30 = *(id *)(a1 + 72);
    id v13 = &v31;
    id v31 = *(id *)(a1 + 64);
    id v14 = &v32;
    id v32 = *(id *)(a1 + 56);
    id v15 = &v33;
    id v33 = *(id *)(a1 + 80);
    id v16 = v28;
  }
  dispatch_async(v9, v16);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  [WeakRetained workQueueDidFinishCommand];
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_285(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishAddingComment:*(void *)(a1 + 40) toAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) info:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_286(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) memberQueueMetadataBackoffManager];
  [v1 reset];
}

void __50__MSASStateMachine__addCommentDisposition_params___block_invoke_2_287(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) daemon];
  uint64_t v3 = [*(id *)(a1 + 32) personID];
  [v2 didReceiveAuthSuccessForPersonID:v3];

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 MSASStateMachine:*(void *)(a1 + 32) didFinishAddingComment:*(void *)(a1 + 40) toAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) info:*(void *)(a1 + 64) error:0];
}

- (void)addComments:(id)a3 toAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine_addComments_toAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __63__MSASStateMachine_addComments_toAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 40) count];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v2;
    __int16 v31 = 2048;
    uint64_t v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v4;
    __int16 v35 = 2114;
    uint64_t v36 = v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling the addition of %ld comments to asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _model];
  [v6 beginTransaction];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v23 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
        [v11 setObject:v10 forKey:@"comment"];
        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          [v11 setObject:v12 forKey:@"assetCollection"];
        }
        uint64_t v13 = *(void *)(a1 + 56);
        if (v13) {
          [v11 setObject:v13 forKey:@"album"];
        }
        uint64_t v14 = *(void *)(a1 + 64);
        if (v14) {
          [v11 setObject:v14 forKey:@"info"];
        }
        id v15 = [*(id *)(a1 + 32) _model];
        id v16 = NSStringFromSelector(sel__addCommentDisposition_params_);
        id v17 = [*(id *)(a1 + 32) personID];
        id v18 = [*(id *)(a1 + 56) GUID];
        uint64_t v19 = [*(id *)(a1 + 48) GUID];
        [v15 enqueueCommand:v16 params:v11 personID:v17 albumGUID:v18 pendingOnAssetCollectionGUID:v19];

        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  id v20 = [*(id *)(a1 + 32) _model];
  [v20 endTransaction];

  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_removeSharingRelationshipsDisposition:(int)a3 params:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"sharingRelationships"];
  uint64_t v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v9 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    uint64_t v13 = [(MSASStateMachine *)self eventQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_3;
    v14[3] = &unk_1E6C3D9C0;
    id v15 = v7;
    id v16 = self;
    id v17 = v8;
    id v18 = v9;
    dispatch_async(v13, v14);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      long long v26 = self;
      __int16 v27 = 2048;
      uint64_t v28 = [v7 count];
      __int16 v29 = 2114;
      uint64_t v30 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Removing %ld sharing relationships from album %{public}@", buf, 0x20u);
    }
    uint64_t v10 = [(MSASStateMachine *)self protocol];
    id v11 = [v10 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v11];

    objc_initWeak((id *)buf, self);
    uint64_t v12 = [(MSASStateMachine *)self protocol];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke;
    v19[3] = &unk_1E6C3C958;
    void v19[4] = self;
    objc_copyWeak(&v24, (id *)buf);
    id v20 = v6;
    id v21 = v8;
    id v22 = v7;
    id v23 = v9;
    [v12 removeSharingRelationships:v22 fromAlbum:v21 completionBlock:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C778;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v15, a1 + 9);
  id v10 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  id v11 = v6;
  id v12 = v7;
  id v13 = a1[7];
  id v14 = a1[8];
  dispatch_async(v4, block);

  objc_destroyWeak(&v15);
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 40) delegate];
        uint64_t v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        id v11 = [v8 _canceledError];
        [v7 MSASStateMachine:v8 didFinishRemovingSharingRelationship:v6 fromOwnedAlbum:v9 info:v10 error:v11];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    char v3 = [WeakRetained workQueueEndCommandWithError:*(void *)(a1 + 32) command:0 params:*(void *)(a1 + 40) albumGUID:0 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_loadWeakRetained((id *)(a1 + 80));
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v30 = v13;
        __int16 v31 = 2114;
        uint64_t v32 = v14;
        __int16 v33 = 2114;
        uint64_t v34 = v15;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to remove sharing relationships from album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      uint64_t v4 = [*(id *)(a1 + 56) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_279;
      block[3] = &unk_1E6C3C560;
      id v24 = *(id *)(a1 + 64);
      objc_copyWeak(&v28, (id *)(a1 + 80));
      id v25 = *(id *)(a1 + 48);
      id v26 = *(id *)(a1 + 72);
      id v27 = *(id *)(a1 + 32);
      dispatch_async(v4, block);

      id v5 = objc_loadWeakRetained((id *)(a1 + 80));
      [v5 workQueueDidFinishCommand];

      objc_destroyWeak(&v28);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v30 = v6;
      __int16 v31 = 2114;
      uint64_t v32 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully removed sharing relationships from album %{public}@", buf, 0x16u);
    }
    uint64_t v8 = [*(id *)(a1 + 56) memberQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_280;
    v22[3] = &unk_1E6C3DA38;
    v22[4] = *(void *)(a1 + 56);
    dispatch_barrier_sync(v8, v22);

    uint64_t v9 = [*(id *)(a1 + 56) eventQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2_281;
    v16[3] = &unk_1E6C3C560;
    objc_copyWeak(&v21, (id *)(a1 + 80));
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 56);
    id v19 = v10;
    uint64_t v20 = v11;
    dispatch_async(v9, v16);

    id v12 = objc_loadWeakRetained((id *)(a1 + 80));
    [v12 workQueueDidFinishCommand];

    objc_destroyWeak(&v21);
  }
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_279(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        uint64_t v9 = objc_msgSend(WeakRetained, "delegate", (void)v11);
        id v10 = objc_loadWeakRetained((id *)(a1 + 64));
        [v9 MSASStateMachine:v10 didFinishRemovingSharingRelationship:v7 fromOwnedAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_280(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __66__MSASStateMachine__removeSharingRelationshipsDisposition_params___block_invoke_2_281(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        id v13 = objc_loadWeakRetained(v2);
        long long v14 = objc_msgSend(v13, "delegate", (void)v17);
        id v15 = objc_loadWeakRetained(v2);
        [v14 MSASStateMachine:v15 didFinishRemovingSharingRelationship:v12 fromOwnedAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [*(id *)(a1 + 56) phoneInvitations];
  [v16 removeSharingRelationships:*(void *)(a1 + 32) forAlbum:*(void *)(a1 + 40)];
}

- (void)removeSharingRelationships:(id)a3 fromOwnedAlbum:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MSASStateMachine_removeSharingRelationships_fromOwnedAlbum_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  long long v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __67__MSASStateMachine_removeSharingRelationships_fromOwnedAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:@"sharingRelationships"];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [v3 setObject:v5 forKey:@"album"];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    [v3 setObject:v6 forKey:@"info"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v14 = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling removal of sharing relationships %@ from album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v10 = [*(id *)(a1 + 56) _model];
  uint64_t v11 = NSStringFromSelector(sel__removeSharingRelationshipsDisposition_params_);
  id v12 = [*(id *)(a1 + 56) personID];
  id v13 = [*(id *)(a1 + 40) GUID];
  [v10 enqueueCommand:v11 params:v3 personID:v12 albumGUID:v13 assetCollectionGUID:0];

  [*(id *)(a1 + 56) workQueueRetryOutstandingActivities];
}

- (void)_addSharingRelationshipsDisposition:(int)a3 params:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"sharingRelationships"];
  uint64_t v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v9 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v13 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D9C0;
    void block[4] = self;
    id v15 = v7;
    id v16 = v8;
    id v17 = v9;
    dispatch_async(v13, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = self;
      __int16 v26 = 2048;
      uint64_t v27 = [v7 count];
      __int16 v28 = 2114;
      __int16 v29 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding %ld sharing relationships to album %{public}@", buf, 0x20u);
    }
    id v10 = [(MSASStateMachine *)self protocol];
    uint64_t v11 = [v10 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v11];

    objc_initWeak((id *)buf, self);
    id v12 = [(MSASStateMachine *)self protocol];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke;
    v18[3] = &unk_1E6C3C930;
    objc_copyWeak(&v23, (id *)buf);
    id v19 = v6;
    id v20 = v8;
    id v21 = v7;
    id v22 = v9;
    [v12 addSharingRelationships:v21 toAlbum:v20 completionBlock:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  uint64_t v9 = [WeakRetained workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2;
  v13[3] = &unk_1E6C3C908;
  id v14 = v5;
  id v15 = WeakRetained;
  id v16 = a1[4];
  id v17 = a1[5];
  id v18 = a1[6];
  id v19 = a1[7];
  id v10 = WeakRetained;
  id v11 = v5;
  objc_copyWeak(&v21, v7);
  id v20 = v6;
  id v12 = v6;
  dispatch_async(v9, v13);

  objc_destroyWeak(&v21);
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_4;
  v4[3] = &unk_1E6C3D9C0;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_4(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = [v2 _canceledError];
  [v7 MSASStateMachine:v2 didFinishAddingSharingRelationships:v3 toOwnedAlbum:v5 info:v4 error:v6];
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (([*(id *)(a1 + 40) workQueueEndCommandWithError:v2 command:0 params:*(void *)(a1 + 48) albumGUID:0 assetCollectionGUID:0] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 56);
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v16;
        __int16 v34 = 2114;
        uint64_t v35 = v15;
        __int16 v36 = 2114;
        uint64_t v37 = v17;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add sharing relationships to album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      uint64_t v3 = [*(id *)(a1 + 40) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_274;
      block[3] = &unk_1E6C3D9E8;
      id v27 = *(id *)(a1 + 40);
      id v28 = *(id *)(a1 + 64);
      id v29 = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 72);
      id v31 = *(id *)(a1 + 32);
      dispatch_async(v3, block);

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      [WeakRetained workQueueDidFinishCommand];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v5;
      __int16 v34 = 2114;
      uint64_t v35 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully added sharing relationships to album %{public}@", buf, 0x16u);
    }
    if ([*(id *)(a1 + 80) count])
    {
      id v7 = [*(id *)(a1 + 40) phoneInvitations];
      uint64_t v8 = *(void *)(a1 + 80);
      uint64_t v9 = *(void *)(a1 + 56);
      id v10 = objc_loadWeakRetained((id *)(a1 + 88));
      [v7 addPendingPhoneInvitations:v8 toOwnedAlbum:v9 inStateMachin:v10];
    }
    id v11 = [*(id *)(a1 + 40) memberQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_275;
    v24[3] = &unk_1E6C3C220;
    objc_copyWeak(&v25, (id *)(a1 + 88));
    dispatch_barrier_async(v11, v24);

    id v12 = [*(id *)(a1 + 40) eventQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2_276;
    v18[3] = &unk_1E6C3D9E8;
    id v14 = *(void **)(a1 + 40);
    id v13 = (id *)(a1 + 40);
    id v19 = v14;
    id v20 = v13[3];
    id v21 = v13[2];
    id v22 = v13[4];
    id v23 = *(v13 - 1);
    dispatch_async(v12, v18);

    [*v13 workQueueDidFinishCommand];
    objc_destroyWeak(&v25);
  }
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_274(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishAddingSharingRelationships:*(void *)(a1 + 40) toOwnedAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_275(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained memberQueueMetadataBackoffManager];
  [v1 reset];
}

void __63__MSASStateMachine__addSharingRelationshipsDisposition_params___block_invoke_2_276(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) daemon];
  uint64_t v3 = [*(id *)(a1 + 32) personID];
  [v2 didReceiveAuthSuccessForPersonID:v3];

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 MSASStateMachine:*(void *)(a1 + 32) didFinishAddingSharingRelationships:*(void *)(a1 + 40) toOwnedAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)addSharingRelationships:(id)a3 toOwnedAlbum:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__MSASStateMachine_addSharingRelationships_toOwnedAlbum_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __62__MSASStateMachine_addSharingRelationships_toOwnedAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKey:@"sharingRelationships"];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [v3 setObject:v5 forKey:@"album"];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    [v3 setObject:v6 forKey:@"info"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v14 = 138543874;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling addition of sharing relationships %@ to album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v10 = [*(id *)(a1 + 56) _model];
  id v11 = NSStringFromSelector(sel__addSharingRelationshipsDisposition_params_);
  id v12 = [*(id *)(a1 + 56) personID];
  id v13 = [*(id *)(a1 + 40) GUID];
  [v10 enqueueCommand:v11 params:v3 personID:v12 albumGUID:v13 assetCollectionGUID:0];

  [*(id *)(a1 + 56) workQueueRetryOutstandingActivities];
}

- (void)_sendGetUploadTokensDisposition:(int)a3 params:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v31 = [v6 objectForKey:@"assetCollection"];
  id v30 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v29 = [v6 objectForKey:@"info"];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v8 = [v31 assets];
  uint64_t v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = [v31 assets];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v10);
        }
        int v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v15 = [v14 MMCSAccessHeader];
        BOOL v16 = v15 == 0;

        if (v16) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v11);
  }

  if (a3 == 2)
  {
    id v25 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3_271;
    block[3] = &unk_1E6C3D9C0;
    void block[4] = self;
    id v26 = v31;
    id v33 = v26;
    id v34 = v30;
    id v35 = v29;
    dispatch_async(v25, block);

    id v27 = [(MSASStateMachine *)self _model];
    id v28 = [v26 GUID];
    [v27 requeuePendingAssetCollectionGUID:v28];

    [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:v26];
  }
  else if (!a3)
  {
    uint64_t v17 = [(MSASStateMachine *)self protocol];
    __int16 v18 = [v17 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v18];

    objc_initWeak(&location, self);
    uint64_t v19 = [(MSASStateMachine *)self delegate];
    uint64_t v20 = [v30 GUID];
    id v21 = [v19 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v20 info:v29];

    id v22 = [(MSASStateMachine *)self protocol];
    id v23 = [v31 GUID];
    id v24 = [v30 GUID];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke;
    v36[3] = &unk_1E6C3C7C8;
    void v36[4] = self;
    objc_copyWeak(&v42, &location);
    id v37 = v6;
    id v38 = v9;
    id v39 = v31;
    id v40 = v30;
    id v41 = v29;
    [v22 getUploadTokens:v38 forAssetCollectionWithGUID:v23 inAlbumWithGUID:v24 albumURLString:v21 completionBlock:v36];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2;
  v8[3] = &unk_1E6C3C908;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v16, a1 + 10);
  id v10 = a1[5];
  id v11 = a1[6];
  id v6 = a1[7];
  id v7 = a1[4];
  id v12 = v6;
  id v13 = v7;
  id v14 = a1[8];
  id v15 = a1[9];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v16);
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3_271(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteAssetFilesInAssetCollection:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = [v2 _canceledError];
  [v7 MSASStateMachine:v2 didFinishAddingAssetCollection:v3 toAlbum:v5 info:v4 error:v6];
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = NSStringFromSelector(sel__sendGetUploadTokensDisposition_params_);
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:v4 params:*(void *)(a1 + 40) albumGUID:0 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v31 = objc_loadWeakRetained((id *)(a1 + 88));
        uint64_t v32 = *(void *)(a1 + 48);
        id v33 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        id v47 = v31;
        __int16 v48 = 2114;
        uint64_t v49 = v32;
        __int16 v50 = 2114;
        __int16 v51 = v33;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to get upload tokens for assets %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v5 = objc_loadWeakRetained((id *)(a1 + 88));
      [v5 _deleteAssetFilesInAssetCollection:*(void *)(a1 + 56)];

      id v6 = [*(id *)(a1 + 64) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_267;
      block[3] = &unk_1E6C3C560;
      objc_copyWeak(&v45, (id *)(a1 + 88));
      id v41 = *(id *)(a1 + 56);
      id v42 = *(id *)(a1 + 72);
      id v43 = *(id *)(a1 + 80);
      id v44 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

      id v7 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v8 = [v7 _model];
      [v8 beginTransaction];

      id v9 = objc_loadWeakRetained((id *)(a1 + 88));
      id v10 = [v9 _model];
      id v11 = [*(id *)(a1 + 56) GUID];
      [v10 requeuePendingAssetCollectionGUID:v11];

      id v12 = objc_loadWeakRetained((id *)(a1 + 88));
      id v13 = [v12 _model];
      [v13 endTransaction];

      id v14 = objc_loadWeakRetained((id *)(a1 + 88));
      id v15 = [v14 _assetUploader];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_268;
      v37[3] = &unk_1E6C3C8B0;
      objc_copyWeak(&v39, (id *)(a1 + 88));
      id v38 = *(id *)(a1 + 56);
      [v15 stopCompletionBlock:v37];

      objc_destroyWeak(&v39);
      objc_destroyWeak(&v45);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v16 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v17 = [*(id *)(a1 + 48) count];
      __int16 v18 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      id v47 = v16;
      __int16 v48 = 2048;
      uint64_t v49 = v17;
      __int16 v50 = 2114;
      __int16 v51 = v18;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully obtained %ld upload tokens in asset collection %{public}@.", buf, 0x20u);
    }
    uint64_t v19 = [*(id *)(a1 + 64) memberQueue];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_269;
    v36[3] = &unk_1E6C3DA38;
    void v36[4] = *(void *)(a1 + 64);
    dispatch_barrier_sync(v19, v36);

    uint64_t v20 = [*(id *)(a1 + 64) eventQueue];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_270;
    v34[3] = &unk_1E6C3C220;
    id v21 = (id *)(a1 + 88);
    objc_copyWeak(&v35, (id *)(a1 + 88));
    dispatch_async(v20, v34);

    id v22 = objc_loadWeakRetained((id *)(a1 + 88));
    id v23 = [v22 _model];
    [v23 beginTransaction];

    id v24 = objc_loadWeakRetained((id *)(a1 + 88));
    id v25 = [v24 _model];
    [v25 enqueueAssetCollectionForUpload:*(void *)(a1 + 56) album:*(void *)(a1 + 72)];

    id v26 = objc_loadWeakRetained((id *)(a1 + 88));
    id v27 = [v26 _model];
    [v27 endTransaction];

    id v28 = objc_loadWeakRetained(v21);
    id v29 = [v28 _assetUploader];
    [v29 retryOutstandingActivities];

    id v30 = objc_loadWeakRetained(v21);
    [v30 workQueueDidFinishCommand];

    objc_destroyWeak(&v35);
  }
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_267(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishAddingAssetCollection:*(void *)(a1 + 32) toAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_268(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _assetUploader];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:*(void *)(a1 + 32)];
  [v4 unregisterAssetCollections:v5];

  id v6 = objc_loadWeakRetained(v2);
  id v7 = [v6 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3;
  block[3] = &unk_1E6C3C220;
  objc_copyWeak(&v9, v2);
  dispatch_async(v7, block);

  objc_destroyWeak(&v9);
}

uint64_t __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_269(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_2_270(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained daemon];
  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 personID];
  [v2 didReceiveAuthSuccessForPersonID:v4];
}

void __59__MSASStateMachine__sendGetUploadTokensDisposition_params___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained workQueueDidFinishCommand];
}

- (void)_sendPutAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v23 = [v6 objectForKey:@"successfulAssetCollections"];
  id v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v24 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v14 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_7;
    block[3] = &unk_1E6C3D9C0;
    id v15 = v23;
    id v30 = v15;
    id v31 = self;
    id v32 = v7;
    id v33 = v24;
    dispatch_async(v14, block);

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void **)(*((void *)&v25 + 1) + 8 * v19);
          id v21 = [(MSASStateMachine *)self _model];
          id v22 = [v20 GUID];
          [v21 requeuePendingAssetCollectionGUID:v22];

          [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:v20];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v39 count:16];
      }
      while (v17);
    }
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v41 = self;
      __int16 v42 = 2048;
      uint64_t v43 = [v23 count];
      __int16 v44 = 2114;
      id v45 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding %ld photos to album %{public}@.", buf, 0x20u);
    }
    uint64_t v8 = [(MSASStateMachine *)self protocol];
    id v9 = [v8 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v9];

    objc_initWeak((id *)buf, self);
    id v10 = [(MSASStateMachine *)self delegate];
    id v11 = [v7 GUID];
    id v12 = [v10 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v11 info:v24];

    id v13 = [(MSASStateMachine *)self protocol];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke;
    v34[3] = &unk_1E6C3C8D8;
    void v34[4] = self;
    objc_copyWeak(&v38, (id *)buf);
    id v35 = v6;
    id v36 = v7;
    id v37 = v24;
    [v13 putAssetCollections:v23 intoAlbum:v36 albumURLString:v12 completionBlock:v34];

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke(id *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1[4] workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2;
  v16[3] = &unk_1E6C3C908;
  id v17 = v8;
  id v12 = v8;
  objc_copyWeak(&v24, a1 + 8);
  id v18 = a1[5];
  id v19 = a1[6];
  id v20 = v9;
  id v13 = a1[4];
  id v21 = v10;
  id v22 = v13;
  id v23 = a1[7];
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v11, v16);

  objc_destroyWeak(&v24);
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_7(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [*(id *)(a1 + 40) _deleteAssetFilesInAssetCollection:v6];
        id v7 = [*(id *)(a1 + 40) delegate];
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        id v11 = [v8 _canceledError];
        [v7 MSASStateMachine:v8 didFinishAddingAssetCollection:v6 toAlbum:v9 info:v10 error:v11];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = NSStringFromSelector(sel__sendPutAssetCollectionsDisposition_params_);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) GUID];
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:v4 params:v5 albumGUID:v6 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v81 = objc_loadWeakRetained((id *)(a1 + 88));
        uint64_t v82 = *(void *)(a1 + 48);
        v83 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        id v143 = v81;
        __int16 v144 = 2114;
        uint64_t v145 = v82;
        __int16 v146 = 2114;
        v147 = v83;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add photos to album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      id v7 = *(id *)(a1 + 56);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v132 objects:v141 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v133;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v133 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v132 + 1) + 8 * i);
            id v12 = objc_loadWeakRetained((id *)(a1 + 88));
            [v12 _deleteAssetFilesInAssetCollection:v11];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v132 objects:v141 count:16];
        }
        while (v8);
      }

      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v13 = *(id *)(a1 + 64);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v128 objects:v140 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v129;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v129 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v128 + 1) + 8 * j);
            id v18 = objc_loadWeakRetained((id *)(a1 + 88));
            [v18 _deleteAssetFilesInAssetCollection:v17];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v128 objects:v140 count:16];
        }
        while (v14);
      }

      id v19 = [*(id *)(a1 + 72) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_259;
      block[3] = &unk_1E6C3C6C8;
      id v122 = *(id *)(a1 + 56);
      objc_copyWeak(&v127, (id *)(a1 + 88));
      id v123 = *(id *)(a1 + 48);
      id v124 = *(id *)(a1 + 80);
      id v125 = *(id *)(a1 + 32);
      id v126 = *(id *)(a1 + 64);
      dispatch_async(v19, block);

      id v20 = objc_loadWeakRetained((id *)(a1 + 88));
      id v21 = [v20 _model];
      [v21 beginTransaction];

      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v22 = *(id *)(a1 + 56);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v117 objects:v139 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v118;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v118 != v24) {
              objc_enumerationMutation(v22);
            }
            long long v26 = *(void **)(*((void *)&v117 + 1) + 8 * k);
            id v27 = objc_loadWeakRetained((id *)(a1 + 88));
            long long v28 = [v27 _model];
            id v29 = [v26 GUID];
            [v28 requeuePendingAssetCollectionGUID:v29];
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v117 objects:v139 count:16];
        }
        while (v23);
      }

      long long v115 = 0u;
      long long v116 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v30 = *(id *)(a1 + 64);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v113 objects:v138 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v114;
        do
        {
          for (uint64_t m = 0; m != v31; ++m)
          {
            if (*(void *)v114 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = *(void **)(*((void *)&v113 + 1) + 8 * m);
            id v35 = objc_loadWeakRetained((id *)(a1 + 88));
            id v36 = [v35 _model];
            id v37 = [v34 GUID];
            [v36 requeuePendingAssetCollectionGUID:v37];
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v113 objects:v138 count:16];
        }
        while (v31);
      }

      id v38 = objc_loadWeakRetained((id *)(a1 + 88));
      id v39 = [v38 _model];
      [v39 endTransaction];

      id v40 = objc_loadWeakRetained((id *)(a1 + 88));
      id v41 = [v40 _assetUploader];
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_260;
      v109[3] = &unk_1E6C3CB48;
      objc_copyWeak(&v112, (id *)(a1 + 88));
      id v110 = *(id *)(a1 + 56);
      id v111 = *(id *)(a1 + 64);
      [v41 stopCompletionBlock:v109];

      objc_destroyWeak(&v112);
      objc_destroyWeak(&v127);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v42 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v43 = [*(id *)(a1 + 56) count];
      __int16 v44 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v143 = v42;
      __int16 v144 = 2048;
      uint64_t v145 = v43;
      __int16 v146 = 2114;
      v147 = v44;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully enqueued %ld photos for upload to album %{public}@.", buf, 0x20u);
    }
    if ([*(id *)(a1 + 64) count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v84 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v85 = [*(id *)(a1 + 64) count];
      id v86 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v143 = v84;
      __int16 v144 = 2048;
      uint64_t v145 = v85;
      __int16 v146 = 2114;
      v147 = v86;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to enqueue %ld photos for upload to album %{public}@.", buf, 0x20u);
    }
    id v45 = [*(id *)(a1 + 72) memberQueue];
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_261;
    v108[3] = &unk_1E6C3DA38;
    v108[4] = *(void *)(a1 + 72);
    dispatch_barrier_sync(v45, v108);

    uint64_t v46 = [*(id *)(a1 + 72) eventQueue];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_262;
    v106[3] = &unk_1E6C3C220;
    objc_copyWeak(&v107, (id *)(a1 + 88));
    dispatch_async(v46, v106);

    id v47 = objc_loadWeakRetained((id *)(a1 + 88));
    __int16 v48 = [v47 _model];
    [v48 beginTransaction];

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v49 = *(id *)(a1 + 56);
    uint64_t v50 = [v49 countByEnumeratingWithState:&v102 objects:v137 count:16];
    if (v50)
    {
      uint64_t v51 = *(void *)v103;
      do
      {
        for (uint64_t n = 0; n != v50; ++n)
        {
          if (*(void *)v103 != v51) {
            objc_enumerationMutation(v49);
          }
          uint64_t v53 = *(void *)(*((void *)&v102 + 1) + 8 * n);
          id v54 = objc_loadWeakRetained((id *)(a1 + 88));
          id v55 = [v54 _model];
          [v55 enqueueAssetCollectionForUpload:v53 album:*(void *)(a1 + 48)];
        }
        uint64_t v50 = [v49 countByEnumeratingWithState:&v102 objects:v137 count:16];
      }
      while (v50);
    }

    id v56 = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v57 = [v56 _model];
    [v57 endTransaction];

    id v58 = objc_loadWeakRetained((id *)(a1 + 88));
    v59 = [v58 _assetUploader];
    [v59 retryOutstandingActivities];

    uint64_t v60 = [*(id *)(a1 + 72) eventQueue];
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3_263;
    v96[3] = &unk_1E6C3C560;
    id v97 = *(id *)(a1 + 64);
    objc_copyWeak(&v101, (id *)(a1 + 88));
    id v98 = *(id *)(a1 + 48);
    id v61 = *(id *)(a1 + 80);
    uint64_t v62 = *(void *)(a1 + 72);
    id v99 = v61;
    uint64_t v100 = v62;
    dispatch_async(v60, v96);

    BOOL v63 = [*(id *)(a1 + 64) count] == 0;
    id v64 = objc_loadWeakRetained((id *)(a1 + 88));
    id v65 = v64;
    if (v63)
    {
      objc_msgSend(v64, "workQueueDidFinishCommand", &v101, &v107);
    }
    else
    {
      v66 = objc_msgSend(v64, "_model", &v101, &v107);
      [v66 beginTransaction];

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v67 = *(id *)(a1 + 64);
      uint64_t v68 = [v67 countByEnumeratingWithState:&v92 objects:v136 count:16];
      if (v68)
      {
        uint64_t v69 = *(void *)v93;
        do
        {
          for (iuint64_t i = 0; ii != v68; ++ii)
          {
            if (*(void *)v93 != v69) {
              objc_enumerationMutation(v67);
            }
            id v71 = *(void **)(*((void *)&v92 + 1) + 8 * ii);
            id v72 = objc_loadWeakRetained((id *)(a1 + 88));
            v73 = [v72 _model];
            v74 = [v71 GUID];
            [v73 requeuePendingAssetCollectionGUID:v74];

            id v75 = objc_loadWeakRetained((id *)(a1 + 88));
            v76 = [v71 GUID];
            [v75 cancelOutstandingCommandsForAssetCollectionWithGUID:v76];
          }
          uint64_t v68 = [v67 countByEnumeratingWithState:&v92 objects:v136 count:16];
        }
        while (v68);
      }

      id v77 = objc_loadWeakRetained((id *)(a1 + 88));
      v78 = [v77 _model];
      [v78 endTransaction];

      id v79 = objc_loadWeakRetained((id *)(a1 + 88));
      long long v80 = [v79 _assetUploader];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_4;
      v89[3] = &unk_1E6C3C8B0;
      objc_copyWeak(&v91, (id *)(a1 + 88));
      id v90 = *(id *)(a1 + 64);
      [v80 stopCompletionBlock:v89];

      objc_destroyWeak(&v91);
    }

    objc_destroyWeak(v87);
    objc_destroyWeak(location);
  }
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_259(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
        uint64_t v9 = [WeakRetained delegate];
        id v10 = objc_loadWeakRetained((id *)(a1 + 72));
        [v9 MSASStateMachine:v10 didFinishAddingAssetCollection:v7 toAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v4);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = *(id *)(a1 + 64);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * v15);
        id v17 = objc_loadWeakRetained((id *)(a1 + 72));
        id v18 = objc_msgSend(v17, "delegate", (void)v20);
        id v19 = objc_loadWeakRetained((id *)(a1 + 72));
        [v18 MSASStateMachine:v19 didFinishAddingAssetCollection:v16 toAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v13);
  }
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_260(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained _assetUploader];
  [v4 unregisterAssetCollections:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 _assetUploader];
  uint64_t v7 = [*(id *)(a1 + 40) allKeys];
  [v6 unregisterAssetCollections:v7];

  id v8 = objc_loadWeakRetained(v2);
  uint64_t v9 = [v8 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3;
  block[3] = &unk_1E6C3C220;
  objc_copyWeak(&v11, v2);
  dispatch_async(v9, block);

  objc_destroyWeak(&v11);
}

uint64_t __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_261(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_2_262(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained daemon];
  id v3 = objc_loadWeakRetained(v1);
  uint64_t v4 = [v3 personID];
  [v2 didReceiveAuthSuccessForPersonID:v4];
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3_263(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v12 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v12)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v13 + 1) + 8 * v2);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        id v5 = [WeakRetained delegate];
        id v6 = objc_loadWeakRetained((id *)(a1 + 64));
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        uint64_t v9 = [*(id *)(a1 + 56) _assetCollectionRejectedError];
        [v5 MSASStateMachine:v6 didFinishAddingAssetCollection:v3 toAlbum:v7 info:v8 error:v9];

        ++v2;
      }
      while (v12 != v2);
      uint64_t v12 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v12);
  }
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained _assetUploader];
  id v5 = [*(id *)(a1 + 32) allKeys];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_5;
  v6[3] = &unk_1E6C3C8B0;
  id v7 = *(id *)(a1 + 32);
  objc_copyWeak(&v8, v2);
  [v4 unregisterAssetCollections:v5 completionBlock:v6];

  objc_destroyWeak(&v8);
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained _deleteAssetFilesInAssetCollection:v7];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  uint64_t v9 = (id *)(a1 + 40);
  id v10 = objc_loadWeakRetained(v9);
  uint64_t v11 = [v10 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_6;
  block[3] = &unk_1E6C3C220;
  objc_copyWeak(&v13, v9);
  dispatch_async(v11, block);

  objc_destroyWeak(&v13);
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained workQueueDidFinishCommand];
}

void __63__MSASStateMachine__sendPutAssetCollectionsDisposition_params___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained workQueueDidFinishCommand];
}

- (void)_sendUploadCompleteDisposition:(int)a3 params:(id)a4
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v46 = [v6 objectForKey:@"successfulAssetCollections"];
  id v47 = [v6 objectForKey:@"failedAssetCollectionsAndErrors"];
  id v45 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  __int16 v44 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v14 = v46;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v67;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v67 != v16) {
            objc_enumerationMutation(v14);
          }
          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", *(void *)(*((void *)&v66 + 1) + 8 * v17++), v44);
        }
        while (v15 != v17);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v15);
    }

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v18 = v47;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v79 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v63;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v63 != v20) {
            objc_enumerationMutation(v18);
          }
          -[MSASStateMachine _deleteAssetFilesInAssetCollection:](self, "_deleteAssetFilesInAssetCollection:", *(void *)(*((void *)&v62 + 1) + 8 * v21++), v44);
        }
        while (v19 != v21);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v79 count:16];
      }
      while (v19);
    }

    long long v22 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D9E8;
    id v23 = v14;
    id v57 = v23;
    id v58 = self;
    id v59 = v45;
    id v60 = v44;
    id v24 = v18;
    id v61 = v24;
    dispatch_async(v22, block);

    long long v25 = [(MSASStateMachine *)self _model];
    [v25 beginTransaction];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v26 = v23;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v78 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v53;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v53 != v28) {
            objc_enumerationMutation(v26);
          }
          uint64_t v30 = *(void **)(*((void *)&v52 + 1) + 8 * v29);
          uint64_t v31 = [(MSASStateMachine *)self _model];
          uint64_t v32 = [v30 GUID];
          [v31 requeuePendingAssetCollectionGUID:v32];

          [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:v30];
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v78 count:16];
      }
      while (v27);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v33 = v24;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v77 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v49;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v49 != v35) {
            objc_enumerationMutation(v33);
          }
          id v37 = *(void **)(*((void *)&v48 + 1) + 8 * v36);
          id v38 = [(MSASStateMachine *)self _model];
          id v39 = [v37 GUID];
          [v38 requeuePendingAssetCollectionGUID:v39];

          [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:v37];
          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v77 count:16];
      }
      while (v34);
    }

    id v40 = [(MSASStateMachine *)self _model];
    [v40 endTransaction];

    id v41 = [(MSASStateMachine *)self _assetUploader];
    [v41 unregisterAssetCollections:v26];

    id v42 = [(MSASStateMachine *)self _assetUploader];
    uint64_t v43 = [v33 allKeys];
    [v42 unregisterAssetCollections:v43];
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_msgSend(v46, "count", v44);
      uint64_t v8 = [v47 count];
      CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent() - self->_startOfUpload;
      *(_DWORD *)buf = 138544130;
      uint64_t v82 = self;
      __int16 v83 = 2048;
      uint64_t v84 = v7;
      __int16 v85 = 2048;
      uint64_t v86 = v8;
      __int16 v87 = 2048;
      CFAbsoluteTime v88 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Sending upload complete for %ld successful photos, and %ld failed photos. Took %.2fs to upload", buf, 0x2Au);
    }
    id v10 = [(MSASStateMachine *)self protocol];
    uint64_t v11 = [v10 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v11];

    objc_initWeak((id *)buf, self);
    uint64_t v12 = [(MSASStateMachine *)self protocol];
    id v13 = [v47 allKeys];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke;
    v70[3] = &unk_1E6C3C888;
    v70[4] = self;
    objc_copyWeak(&v76, (id *)buf);
    id v71 = v6;
    id v72 = v46;
    id v73 = v45;
    id v74 = v44;
    id v75 = v47;
    [v12 sendUploadCompleteSuccessfulAssetCollections:v72 failedAssetCollections:v13 album:v73 completionBlock:v70];

    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);
  }
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1[4] workQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2;
  v16[3] = &unk_1E6C3C860;
  id v17 = v7;
  id v11 = v7;
  objc_copyWeak(&v26, a1 + 10);
  id v18 = a1[5];
  id v12 = a1[6];
  id v13 = a1[4];
  id v19 = v12;
  id v20 = v13;
  id v21 = a1[7];
  id v22 = a1[8];
  id v23 = a1[9];
  id v24 = v8;
  id v25 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v10, v16);

  objc_destroyWeak(&v26);
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 40) delegate];
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        id v11 = [v8 _canceledError];
        [v7 MSASStateMachine:v8 didFinishAddingAssetCollection:v6 toAlbum:v9 info:v10 error:v11];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v3);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obja = *(id *)(a1 + 64);
  uint64_t v12 = [obja countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obja);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        id v17 = [*(id *)(a1 + 40) delegate];
        uint64_t v18 = *(void *)(a1 + 40);
        uint64_t v19 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
        id v21 = [*(id *)(a1 + 64) objectForKey:v16];
        [v17 MSASStateMachine:v18 didFinishAddingAssetCollection:v16 toAlbum:v19 info:v20 error:v21];
      }
      uint64_t v13 = [obja countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v13);
  }
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (id *)(a1 + 104);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = NSStringFromSelector(sel__sendUploadCompleteDisposition_params_);
    LOBYTE(v4) = [WeakRetained workQueueEndCommandWithError:v4 command:v5 params:*(void *)(a1 + 40) albumGUID:0 assetCollectionGUID:0];

    if ((v4 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v94 = objc_loadWeakRetained((id *)(a1 + 104));
        long long v95 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138543618;
        id v159 = v94;
        __int16 v160 = 2114;
        v161 = v95;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to send upload complete. Error: %{public}@", buf, 0x16u);
      }
      id v6 = objc_loadWeakRetained((id *)(a1 + 104));
      id v7 = [v6 _model];
      [v7 beginTransaction];

      long long v148 = 0u;
      long long v149 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      id obj = *(id *)(a1 + 48);
      uint64_t v8 = [obj countByEnumeratingWithState:&v146 objects:v157 count:16];
      if (v8)
      {
        id location = *(id **)v147;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(id **)v147 != location) {
              objc_enumerationMutation(obj);
            }
            uint64_t v10 = *(void **)(*((void *)&v146 + 1) + 8 * i);
            id v11 = objc_loadWeakRetained((id *)(a1 + 104));
            uint64_t v12 = [v11 _model];
            uint64_t v13 = [v10 GUID];
            [v12 requeuePendingAssetCollectionGUID:v13];

            id v14 = objc_loadWeakRetained((id *)(a1 + 104));
            [v14 _deleteAssetFilesInAssetCollection:v10];

            id v15 = [*(id *)(a1 + 56) eventQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_254;
            block[3] = &unk_1E6C3C560;
            objc_copyWeak(&v145, (id *)(a1 + 104));
            void block[4] = v10;
            id v142 = *(id *)(a1 + 64);
            id v143 = *(id *)(a1 + 72);
            id v144 = *(id *)(a1 + 32);
            dispatch_async(v15, block);

            objc_destroyWeak(&v145);
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v146 objects:v157 count:16];
        }
        while (v8);
      }

      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      id obja = *(id *)(a1 + 80);
      uint64_t v16 = [obja countByEnumeratingWithState:&v137 objects:v156 count:16];
      if (v16)
      {
        locationa = *(id **)v138;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(id **)v138 != locationa) {
              objc_enumerationMutation(obja);
            }
            uint64_t v18 = *(void **)(*((void *)&v137 + 1) + 8 * j);
            id v19 = objc_loadWeakRetained((id *)(a1 + 104));
            uint64_t v20 = [v19 _model];
            id v21 = [v18 GUID];
            [v20 requeuePendingAssetCollectionGUID:v21];

            id v22 = objc_loadWeakRetained((id *)(a1 + 104));
            [v22 _deleteAssetFilesInAssetCollection:v18];

            id v23 = [*(id *)(a1 + 56) eventQueue];
            v132[0] = MEMORY[0x1E4F143A8];
            v132[1] = 3221225472;
            v132[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_255;
            v132[3] = &unk_1E6C3C560;
            objc_copyWeak(&v136, (id *)(a1 + 104));
            v132[4] = v18;
            id v133 = *(id *)(a1 + 64);
            id v134 = *(id *)(a1 + 72);
            id v135 = *(id *)(a1 + 80);
            dispatch_async(v23, v132);

            objc_destroyWeak(&v136);
          }
          uint64_t v16 = [obja countByEnumeratingWithState:&v137 objects:v156 count:16];
        }
        while (v16);
      }

      id v24 = objc_loadWeakRetained((id *)(a1 + 104));
      long long v25 = [v24 _model];
      [v25 endTransaction];

      id v26 = objc_loadWeakRetained((id *)(a1 + 104));
      long long v27 = [v26 _assetUploader];
      [v27 unregisterAssetCollections:*(void *)(a1 + 48)];

      id v28 = objc_loadWeakRetained((id *)(a1 + 104));
      long long v29 = [v28 _assetUploader];
      long long v30 = [*(id *)(a1 + 80) allKeys];
      [v29 unregisterAssetCollections:v30];

      id v31 = objc_loadWeakRetained(v2);
      [v31 workQueueDidFinishCommand];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v32 = objc_loadWeakRetained((id *)(a1 + 104));
      *(_DWORD *)buf = 138543362;
      id v159 = v32;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully sent upload complete.", buf, 0xCu);
    }
    id v33 = [*(id *)(a1 + 56) memberQueue];
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_256;
    v131[3] = &unk_1E6C3DA38;
    v131[4] = *(void *)(a1 + 56);
    dispatch_barrier_sync(v33, v131);

    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    id v34 = *(id *)(a1 + 88);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v127 objects:v155 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v128;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v128 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = *(void *)(*((void *)&v127 + 1) + 8 * k);
          id v39 = objc_loadWeakRetained((id *)(a1 + 104));
          [v39 _deleteAssetFilesInAssetCollection:v38];
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v127 objects:v155 count:16];
      }
      while (v35);
    }

    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v40 = *(id *)(a1 + 96);
    uint64_t v41 = [v40 countByEnumeratingWithState:&v123 objects:v154 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v124;
      do
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          if (*(void *)v124 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void *)(*((void *)&v123 + 1) + 8 * m);
          id v45 = objc_loadWeakRetained((id *)(a1 + 104));
          [v45 _deleteAssetFilesInAssetCollection:v44];
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v123 objects:v154 count:16];
      }
      while (v41);
    }

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    id v46 = *(id *)(a1 + 80);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v119 objects:v153 count:16];
    if (v47)
    {
      uint64_t v48 = *(void *)v120;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v120 != v48) {
            objc_enumerationMutation(v46);
          }
          uint64_t v50 = *(void *)(*((void *)&v119 + 1) + 8 * n);
          id v51 = objc_loadWeakRetained((id *)(a1 + 104));
          [v51 _deleteAssetFilesInAssetCollection:v50];
        }
        uint64_t v47 = [v46 countByEnumeratingWithState:&v119 objects:v153 count:16];
      }
      while (v47);
    }

    long long v52 = [*(id *)(a1 + 56) eventQueue];
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_257;
    v112[3] = &unk_1E6C3C6C8;
    long long v53 = (id *)(a1 + 104);
    objc_copyWeak(&v118, (id *)(a1 + 104));
    id v113 = *(id *)(a1 + 88);
    id v114 = *(id *)(a1 + 64);
    id v115 = *(id *)(a1 + 72);
    id v116 = *(id *)(a1 + 96);
    id v117 = *(id *)(a1 + 80);
    dispatch_async(v52, v112);

    id v54 = objc_loadWeakRetained((id *)(a1 + 104));
    long long v55 = [v54 _model];
    [v55 beginTransaction];

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v56 = *(id *)(a1 + 88);
    uint64_t v57 = [v56 countByEnumeratingWithState:&v108 objects:v152 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v109;
      do
      {
        for (iuint64_t i = 0; ii != v57; ++ii)
        {
          if (*(void *)v109 != v58) {
            objc_enumerationMutation(v56);
          }
          id v60 = *(void **)(*((void *)&v108 + 1) + 8 * ii);
          id v61 = objc_loadWeakRetained((id *)(a1 + 104));
          long long v62 = [v61 _model];
          long long v63 = [v60 GUID];
          [v62 requeuePendingAssetCollectionGUID:v63];

          id v64 = objc_loadWeakRetained((id *)(a1 + 104));
          [v64 _deleteAssetFilesInAssetCollection:v60];
        }
        uint64_t v57 = [v56 countByEnumeratingWithState:&v108 objects:v152 count:16];
      }
      while (v57);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v65 = *(id *)(a1 + 96);
    uint64_t v66 = [v65 countByEnumeratingWithState:&v104 objects:v151 count:16];
    if (v66)
    {
      uint64_t v67 = *(void *)v105;
      do
      {
        for (juint64_t j = 0; jj != v66; ++jj)
        {
          if (*(void *)v105 != v67) {
            objc_enumerationMutation(v65);
          }
          long long v69 = *(void **)(*((void *)&v104 + 1) + 8 * jj);
          id v70 = objc_loadWeakRetained((id *)(a1 + 104));
          id v71 = [v70 _model];
          id v72 = [v69 GUID];
          [v71 requeuePendingAssetCollectionGUID:v72];

          id v73 = objc_loadWeakRetained((id *)(a1 + 104));
          [v73 _deleteAssetFilesInAssetCollection:v69];
        }
        uint64_t v66 = [v65 countByEnumeratingWithState:&v104 objects:v151 count:16];
      }
      while (v66);
    }

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v74 = *(id *)(a1 + 80);
    uint64_t v75 = [v74 countByEnumeratingWithState:&v100 objects:v150 count:16];
    if (v75)
    {
      uint64_t v76 = *(void *)v101;
      do
      {
        for (kuint64_t k = 0; kk != v75; ++kk)
        {
          if (*(void *)v101 != v76) {
            objc_enumerationMutation(v74);
          }
          v78 = *(void **)(*((void *)&v100 + 1) + 8 * kk);
          id v79 = objc_loadWeakRetained((id *)(a1 + 104));
          long long v80 = [v79 _model];
          id v81 = [v78 GUID];
          [v80 requeuePendingAssetCollectionGUID:v81];

          id v82 = objc_loadWeakRetained((id *)(a1 + 104));
          [v82 _deleteAssetFilesInAssetCollection:v78];
        }
        uint64_t v75 = [v74 countByEnumeratingWithState:&v100 objects:v150 count:16];
      }
      while (v75);
    }

    id v83 = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v84 = [v83 _model];
    [v84 endTransaction];

    id v85 = objc_loadWeakRetained((id *)(a1 + 104));
    uint64_t v86 = [v85 _assetUploader];
    [v86 unregisterAssetCollections:*(void *)(a1 + 88)];

    id v87 = objc_loadWeakRetained((id *)(a1 + 104));
    CFAbsoluteTime v88 = [v87 _assetUploader];
    uint64_t v89 = [*(id *)(a1 + 96) allKeys];
    [v88 unregisterAssetCollections:v89];

    id v90 = objc_loadWeakRetained((id *)(a1 + 104));
    id v91 = [v90 _assetUploader];
    long long v92 = [*(id *)(a1 + 80) allKeys];
    [v91 unregisterAssetCollections:v92];

    id v93 = objc_loadWeakRetained(v53);
    [v93 workQueueDidFinishCommand];

    objc_destroyWeak(&v118);
  }
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_254(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishAddingAssetCollection:*(void *)(a1 + 32) toAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_255(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = [*(id *)(a1 + 56) objectForKey:v5];
  [v3 MSASStateMachine:v4 didFinishAddingAssetCollection:v5 toAlbum:v6 info:v7 error:v8];
}

uint64_t __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_256(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __58__MSASStateMachine__sendUploadCompleteDisposition_params___block_invoke_2_257(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * v11);
        id v13 = objc_loadWeakRetained(v2);
        id v14 = [v13 delegate];
        id v15 = objc_loadWeakRetained(v2);
        [v14 MSASStateMachine:v15 didFinishAddingAssetCollection:v12 toAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v9);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = *(id *)(a1 + 56);
  uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v43;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v43 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v42 + 1) + 8 * v16);
        id v18 = objc_loadWeakRetained(v2);
        id v19 = [v18 delegate];
        id v20 = objc_loadWeakRetained(v2);
        uint64_t v21 = *(void *)(a1 + 40);
        uint64_t v22 = *(void *)(a1 + 48);
        id v23 = [*(id *)(a1 + 56) objectForKey:v17];
        [v19 MSASStateMachine:v20 didFinishAddingAssetCollection:v17 toAlbum:v21 info:v22 error:v23];

        ++v16;
      }
      while (v36 != v16);
      uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v36);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = *(id *)(a1 + 64);
  uint64_t v37 = [obja countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v39;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(obja);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * v24);
        id v26 = objc_loadWeakRetained(v2);
        long long v27 = [v26 delegate];
        id v28 = objc_loadWeakRetained(v2);
        uint64_t v29 = *(void *)(a1 + 40);
        uint64_t v30 = *(void *)(a1 + 48);
        id v31 = [*(id *)(a1 + 64) objectForKey:v25];
        [v27 MSASStateMachine:v28 didFinishAddingAssetCollection:v25 toAlbum:v29 info:v30 error:v31];

        ++v24;
      }
      while (v37 != v24);
      uint64_t v37 = [obja countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v37);
  }
}

- (void)_continueAddingAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [v5 objectForKey:@"assetCollections"];
  long long v39 = self;
  uint64_t v36 = [(MSASStateMachine *)self _albumForRequestFromParams:v5];
  id v37 = v5;
  long long v40 = [v5 objectForKey:@"info"];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v6;
  uint64_t v43 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v43)
  {
    uint64_t v42 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v61 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1E019E3B0]();
        uint64_t v10 = [v8 metadata];
        uint64_t v11 = [v10 objectForKey:@"originalPaths"];

        if (v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v69 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v57;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v57 != v16) {
                  objc_enumerationMutation(v13);
                }
                [v12 removeItemAtPath:*(void *)(*((void *)&v56 + 1) + 8 * j) error:0];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v69 count:16];
            }
            while (v15);
          }

          id v18 = [v8 metadata];
          id v19 = (void *)[v18 mutableCopy];

          [v19 removeObjectForKey:@"originalPaths"];
          [v8 setMetadata:v19];
        }
      }
      uint64_t v43 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v43);
  }

  if (a3 == 2)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v27 = obj;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v64 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v46 + 1) + 8 * k);
          [(MSASStateMachine *)v39 _deleteAssetFilesInAssetCollection:v32];
          id v33 = [(MSASStateMachine *)v39 eventQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_253;
          block[3] = &unk_1E6C3D998;
          void block[4] = v39;
          void block[5] = v32;
          id v45 = v40;
          dispatch_async(v33, block);

          uint64_t v34 = [(MSASStateMachine *)v39 _model];
          uint64_t v35 = [v32 GUID];
          [v34 requeuePendingAssetCollectionGUID:v35];
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v64 count:16];
      }
      while (v29);
    }
    uint64_t v21 = v36;
    id v20 = v37;
    goto LABEL_30;
  }
  uint64_t v21 = v36;
  id v20 = v37;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = [obj count];
      *(_DWORD *)buf = 138543618;
      uint64_t v66 = v39;
      __int16 v67 = 2048;
      uint64_t v68 = v22;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Preparing upload of assets for %ld asset collections.", buf, 0x16u);
    }
    id v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v25 = [(MSASStateMachine *)v39 _assetUploader];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke;
    v50[3] = &unk_1E6C3C838;
    v50[4] = v39;
    id v51 = obj;
    id v52 = v23;
    id v53 = v24;
    id v54 = v36;
    id v55 = v40;
    id v26 = v24;
    id v27 = v23;
    [v25 registerAssetCollections:v51 completionBlock:v50];

LABEL_30:
  }
}

void __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C3B8;
  id v9 = a1[5];
  id v10 = v3;
  id v11 = a1[6];
  id v5 = a1[7];
  id v6 = a1[4];
  id v12 = v5;
  id v13 = v6;
  id v14 = a1[8];
  id v15 = a1[9];
  id v7 = v3;
  dispatch_async(v4, block);
}

void __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_253(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishAddingAssetCollection:v3 toAlbum:0 info:v4 error:v5];
}

void __70__MSASStateMachine__continueAddingAssetCollectionsDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = [*(id *)(a1 + 32) objectAtIndex:v2];
      uint64_t v4 = [*(id *)(a1 + 40) objectAtIndex:v2];
      id v5 = [MEMORY[0x1E4F1CA98] null];

      if (v4 == v5) {
        [*(id *)(a1 + 48) addObject:v3];
      }
      else {
        [*(id *)(a1 + 56) setObject:v4 forKey:v3];
      }

      ++v2;
    }
    while (v2 < [*(id *)(a1 + 32) count]);
  }
  if ([*(id *)(a1 + 56) count])
  {
    id v6 = [*(id *)(a1 + 64) _model];
    [v6 beginTransaction];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
          id v13 = objc_msgSend(*(id *)(a1 + 64), "_model", (void)v31);
          id v14 = [v12 GUID];
          [v13 requeuePendingAssetCollectionGUID:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v9);
    }

    id v15 = [*(id *)(a1 + 64) _model];
    [v15 endTransaction];

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    [v16 setObject:*(void *)(a1 + 56) forKey:@"failedAssetCollectionsAndErrors"];
    uint64_t v17 = *(void *)(a1 + 72);
    if (v17) {
      [v16 setObject:v17 forKey:@"album"];
    }
    uint64_t v18 = *(void *)(a1 + 80);
    if (v18) {
      [v16 setObject:v18 forKey:@"info"];
    }
    id v19 = objc_msgSend(*(id *)(a1 + 64), "_model", (void)v31);
    id v20 = NSStringFromSelector(sel__sendUploadCompleteDisposition_params_);
    uint64_t v21 = [*(id *)(a1 + 64) personID];
    uint64_t v22 = [*(id *)(a1 + 72) GUID];
    [v19 enqueueCommand:v20 params:v16 personID:v21 albumGUID:v22 assetCollectionGUID:0];

    [*(id *)(a1 + 64) workQueueRetryOutstandingActivities];
  }
  if ([*(id *)(a1 + 48) count])
  {
    id v23 = [MEMORY[0x1E4F1CA60] dictionary];
    [v23 setObject:*(void *)(a1 + 48) forKey:@"successfulAssetCollections"];
    uint64_t v24 = *(void *)(a1 + 72);
    if (v24) {
      [v23 setObject:v24 forKey:@"album"];
    }
    uint64_t v25 = *(void *)(a1 + 80);
    if (v25) {
      [v23 setObject:v25 forKey:@"info"];
    }
    id v26 = *(void **)(a1 + 64);
    id v27 = NSStringFromSelector(sel__sendPutAssetCollectionsDisposition_params_);
    uint64_t v28 = [*(id *)(a1 + 64) personID];
    uint64_t v29 = [*(id *)(a1 + 72) GUID];
    [v26 workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:v27 params:v23 personID:v28 albumGUID:v29 assetCollectionGUID:0];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v36 = v30;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: No valid asset collections to send to the metadata server.", buf, 0xCu);
    }
    [*(id *)(a1 + 64) workQueueDidFinishCommand];
  }
}

- (void)continueAddingAssetCollections:(id)a3 skipAssetCollections:(id)a4 toAlbum:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSASStateMachine *)self _createCopiedAssetsInAssetCollections:v10];
  id v15 = [(MSASStateMachine *)self workQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__MSASStateMachine_continueAddingAssetCollections_skipAssetCollections_toAlbum_info___block_invoke;
  v21[3] = &unk_1E6C3D3A8;
  id v22 = v11;
  id v23 = self;
  id v24 = v10;
  id v25 = v14;
  id v26 = v12;
  id v27 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  id v19 = v10;
  id v20 = v11;
  dispatch_async(v15, v21);
}

void __85__MSASStateMachine_continueAddingAssetCollections_skipAssetCollections_toAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v2 = *(void *)(a1 + 40);
      uint64_t v3 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v2;
      __int16 v33 = 2048;
      uint64_t v34 = v3;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping publication of %ld asset collections.", buf, 0x16u);
    }
    [*(id *)(a1 + 40) _deleteAssetFilesInAssetCollections:*(void *)(a1 + 48)];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
          id v10 = objc_msgSend(*(id *)(a1 + 40), "_model", (void)v26);
          id v11 = [v9 GUID];
          [v10 requeuePendingAssetCollectionGUID:v11];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v6);
    }
  }
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", (void)v26);
  id v13 = v12;
  if (*(void *)(a1 + 48)) {
    [v12 setObject:*(void *)(a1 + 56) forKey:@"assetCollections"];
  }
  uint64_t v14 = *(void *)(a1 + 64);
  if (v14) {
    [v13 setObject:v14 forKey:@"album"];
  }
  uint64_t v15 = *(void *)(a1 + 72);
  if (v15) {
    [v13 setObject:v15 forKey:@"info"];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = [*(id *)(a1 + 48) count];
    *(_DWORD *)buf = 138543618;
    uint64_t v32 = v16;
    __int16 v33 = 2048;
    uint64_t v34 = v17;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling addition of %ld asset collections.", buf, 0x16u);
  }
  uint64_t v18 = *(void *)(a1 + 40);
  if (*(_DWORD *)(v18 + 8) == 2)
  {
    id v19 = *(void **)(v18 + 24);
    id v20 = NSStringFromSelector(sel__addAssetCollectionsDisposition_params_);
    LOBYTE(v19) = [v19 isEqualToString:v20];

    if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v25;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Not expecting derivatives to arrive from plugin. Proceeding anyway.", buf, 0xCu);
    }
  }
  uint64_t v21 = *(void **)(a1 + 40);
  id v22 = NSStringFromSelector(sel__continueAddingAssetCollectionsDisposition_params_);
  id v23 = [*(id *)(a1 + 40) personID];
  id v24 = [*(id *)(a1 + 64) GUID];
  [v21 workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:v22 params:v13 personID:v23 albumGUID:v24 assetCollectionGUID:0];
}

- (void)_addAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"assetCollections"];
  uint64_t v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v9 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v19 = v7;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v56 objects:v77 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(v19);
          }
          [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:*(void *)(*((void *)&v56 + 1) + 8 * i)];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v56 objects:v77 count:16];
      }
      while (v21);
    }

    id v24 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D998;
    id v53 = v19;
    id v54 = self;
    id v55 = v9;
    dispatch_async(v24, block);
  }
  else if (!a3)
  {
    id v10 = [v6 objectForKey:@"commandRetryCount"];
    int v11 = [v10 intValue];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v81 = self;
      __int16 v82 = 2048;
      *(void *)id v83 = [v7 count];
      *(_WORD *)&v83[8] = 2114;
      *(void *)&v83[10] = v8;
      *(_WORD *)&v83[18] = 1024;
      *(_DWORD *)&v83[20] = v11;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Adding %ld asset collections to album %{public}@ retry %d.", buf, 0x26u);
    }
    self->_startOfUpload = CFAbsoluteTimeGetCurrent();
    id v12 = [(MSASStateMachine *)self protocol];
    id v13 = [v12 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v13];

    if (v11 < 4)
    {
      long long v44 = self;
      id v45 = v9;
      long long v46 = v8;
      long long v47 = v7;
      id v48 = v6;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id obj = v7;
      uint64_t v50 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
      if (v50)
      {
        uint64_t v49 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v69 != v49) {
              objc_enumerationMutation(obj);
            }
            long long v26 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            long long v27 = (void *)MEMORY[0x1E019E3B0]();
            long long v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v29 = [v26 assets];
            uint64_t v30 = [v29 countByEnumeratingWithState:&v64 objects:v78 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              uint64_t v32 = *(void *)v65;
              do
              {
                for (uint64_t k = 0; k != v31; ++k)
                {
                  if (*(void *)v65 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v34 = *(void **)(*((void *)&v64 + 1) + 8 * k);
                  uint64_t v35 = [v34 path];

                  if (v35)
                  {
                    uint64_t v36 = [v34 path];
                    [v28 addObject:v36];
                  }
                }
                uint64_t v31 = [v29 countByEnumeratingWithState:&v64 objects:v78 count:16];
              }
              while (v31);
            }

            if ([v28 count]) {
              [v26 setMetadataValue:v28 forKey:@"originalPaths"];
            }
          }
          uint64_t v50 = [obj countByEnumeratingWithState:&v68 objects:v79 count:16];
        }
        while (v50);
      }

      id v37 = [(MSASStateMachine *)v44 eventQueue];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_2;
      v60[3] = &unk_1E6C3D9C0;
      v60[4] = v44;
      id v61 = obj;
      uint64_t v8 = v46;
      id v62 = v46;
      uint64_t v9 = v45;
      id v63 = v45;
      dispatch_async(v37, v60);

      uint64_t v7 = v47;
      id v6 = v48;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        id v81 = self;
        __int16 v82 = 1024;
        *(_DWORD *)id v83 = v11;
        *(_WORD *)&void v83[4] = 2114;
        *(void *)&v83[6] = v7;
        *(_WORD *)&v83[14] = 2114;
        *(void *)&v83[16] = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Retried %d times to add asset collections %{public}@ to album %{public}@.", buf, 0x26u);
      }
      uint64_t v14 = [(MSASStateMachine *)self _assetCollectionFailedError];
      if ((unint64_t)[v7 count] < 2)
      {
        [(MSASModelBase *)self->_model beginTransaction];
        uint64_t v38 = [v7 firstObject];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v81 = self;
          __int16 v82 = 2114;
          *(void *)id v83 = v38;
          *(_WORD *)&v83[8] = 2114;
          *(void *)&v83[10] = v8;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Giving up uploading asset collections %{public}@ to album %{public}@.", buf, 0x20u);
        }
        model = self->_model;
        long long v40 = [v38 GUID];
        [(MSASPersonModel *)model requeuePendingAssetCollectionGUID:v40];

        [(MSASStateMachine *)self _deleteAssetFilesInAssetCollection:v38];
        long long v41 = [(MSASStateMachine *)self eventQueue];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke;
        v72[3] = &unk_1E6C3D9E8;
        v72[4] = self;
        id v73 = v38;
        id v74 = v8;
        id v75 = v9;
        id v76 = v14;
        id v17 = v38;
        dispatch_async(v41, v72);

        assetUploader = self->_assetUploader;
        uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
        [(MSASAssetUploader *)assetUploader unregisterAssetCollections:v43];

        [(MSASModelBase *)self->_model endTransaction];
      }
      else
      {
        unint64_t v15 = (unint64_t)[v7 count] >> 1;
        unint64_t v16 = [v7 count] - v15;
        objc_msgSend(v7, "subarrayWithRange:", 0, v15);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = objc_msgSend(v7, "subarrayWithRange:", v15, v16);
        [(MSASStateMachine *)self addAssetCollections:v17 toAlbum:v8 info:v9];
        [(MSASStateMachine *)self addAssetCollections:v18 toAlbum:v8 info:v9];
      }
      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
  }
}

void __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishAddingAssetCollection:*(void *)(a1 + 40) toAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v2 derivativeSpecifications];
  [v6 MSASStateMachine:v2 didRequestAssetsForAddingAssetCollections:v3 inAlbum:v4 specifications:v5 info:*(void *)(a1 + 56)];
}

void __59__MSASStateMachine__addAssetCollectionsDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v12);
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        int v11 = [v9 _canceledError];
        [v8 MSASStateMachine:v9 didFinishAddingAssetCollection:v7 toAlbum:0 info:v10 error:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

- (void)addAssetCollections:(id)a3 toAlbum:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(MSASStateMachine *)self _createCopiedAssetsInAssetCollections:v8];
  long long v12 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MSASStateMachine_addAssetCollections_toAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v18 = v8;
  id v19 = self;
  id v20 = v9;
  id v21 = v11;
  id v22 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v12, block);
}

void __53__MSASStateMachine_addAssetCollections_toAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "_model", (void)v19);
        id v9 = [v7 GUID];
        id v10 = [*(id *)(a1 + 48) GUID];
        [v8 addPendingAssetCollectionGUID:v9 albumGUID:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v4);
  }

  int v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = v11;
  if (*(void *)(a1 + 32)) {
    [v11 setObject:*(void *)(a1 + 56) forKey:@"assetCollections"];
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    [v12 setObject:v13 forKey:@"album"];
  }
  uint64_t v14 = *(void *)(a1 + 64);
  if (v14) {
    [v12 setObject:v14 forKey:@"info"];
  }
  id v15 = objc_msgSend(*(id *)(a1 + 40), "_model", (void)v19);
  id v16 = NSStringFromSelector(sel__addAssetCollectionsDisposition_params_);
  uint64_t v17 = [*(id *)(a1 + 40) personID];
  id v18 = [*(id *)(a1 + 48) GUID];
  [v15 enqueueCommand:v16 params:v12 personID:v17 albumGUID:v18 assetCollectionGUID:0];

  [*(id *)(a1 + 40) workQueueRetryOutstandingActivities];
}

- (id)_createCopiedAssetsInAssetCollections:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  long long v26 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v3;
  uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v35;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v4;
        uint64_t v5 = +[MSASAssetCollection assetCollectionWithAssetCollection:*(void *)(*((void *)&v34 + 1) + 8 * v4)];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v23 = v5;
        id v25 = [v5 assets];
        uint64_t v6 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v28 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v31 != v28) {
                objc_enumerationMutation(v25);
              }
              id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              id v10 = [v9 path];
              if (v10)
              {
                int v11 = [(MSASStateMachine *)self personID];
                long long v12 = MSPathAlbumSharingAssetsDirForPersonID(v11);
                uint64_t v13 = [NSString MSMakeUUID];
                uint64_t v14 = [v12 stringByAppendingPathComponent:v13];
                id v15 = [v10 pathExtension];
                id v16 = [v14 stringByAppendingPathExtension:v15];

                id v29 = 0;
                LODWORD(v14) = [v26 copyItemAtPath:v10 toPath:v16 error:&v29];
                id v17 = v29;
                if (v14)
                {
                  [v9 setPath:v16];
                }
                else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138544130;
                  long long v39 = self;
                  __int16 v40 = 2112;
                  long long v41 = v10;
                  __int16 v42 = 2112;
                  uint64_t v43 = v16;
                  __int16 v44 = 2114;
                  id v45 = v17;
                  _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot copy file from path %@ to %@. Error: %{public}@", buf, 0x2Au);
                }
              }
            }
            uint64_t v7 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
          }
          while (v7);
        }

        [v21 addObject:v23];
        uint64_t v4 = v24 + 1;
      }
      while (v24 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v22);
  }

  return v21;
}

- (void)_updateAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v8 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v15 = [(MSASStateMachine *)self eventQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_3;
    v16[3] = &unk_1E6C3D998;
    void v16[4] = self;
    id v17 = v7;
    id v18 = v8;
    dispatch_async(v15, v16);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2114;
      long long v27 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Updating album: %{public}@", buf, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self protocol];
    id v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    objc_initWeak((id *)buf, self);
    int v11 = [(MSASStateMachine *)self delegate];
    long long v12 = [v7 GUID];
    uint64_t v13 = [v11 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v12 info:v8];

    uint64_t v14 = [(MSASStateMachine *)self protocol];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke;
    v19[3] = &unk_1E6C3C590;
    void v19[4] = self;
    objc_copyWeak(&v23, (id *)buf);
    id v20 = v6;
    id v21 = v7;
    id v22 = v8;
    [v14 updateAlbum:v21 albumURLString:v13 completionBlock:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2;
  v8[3] = &unk_1E6C3C6C8;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v14, a1 + 8);
  id v10 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  id v11 = v6;
  id v12 = v7;
  id v13 = a1[7];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v14);
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishUpdatingAlbum:v3 info:v4 error:v5];
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    char v3 = [WeakRetained workQueueEndCommandWithError:*(void *)(a1 + 32) command:0 params:*(void *)(a1 + 40) albumGUID:0 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_loadWeakRetained((id *)(a1 + 72));
        uint64_t v12 = *(void *)(a1 + 48);
        id v13 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        id v26 = v11;
        __int16 v27 = 2114;
        uint64_t v28 = v12;
        __int16 v29 = 2114;
        long long v30 = v13;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to update album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      uint64_t v4 = [*(id *)(a1 + 56) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_239;
      block[3] = &unk_1E6C3C650;
      objc_copyWeak(&v24, (id *)(a1 + 72));
      id v21 = *(id *)(a1 + 48);
      id v22 = *(id *)(a1 + 64);
      id v23 = *(id *)(a1 + 32);
      dispatch_async(v4, block);

      id v5 = objc_loadWeakRetained((id *)(a1 + 72));
      [v5 workQueueDidFinishCommand];

      objc_destroyWeak(&v24);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 72));
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v26 = v6;
      __int16 v27 = 2114;
      uint64_t v28 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully updated album %{public}@", buf, 0x16u);
    }
    id v8 = [*(id *)(a1 + 56) memberQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_240;
    v19[3] = &unk_1E6C3DA38;
    void v19[4] = *(void *)(a1 + 56);
    dispatch_barrier_sync(v8, v19);

    id v9 = [*(id *)(a1 + 56) eventQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2_241;
    v14[3] = &unk_1E6C3C650;
    objc_copyWeak(&v18, (id *)(a1 + 72));
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v9, v14);

    id v10 = objc_loadWeakRetained((id *)(a1 + 72));
    [v10 workQueueDidFinishCommand];

    objc_destroyWeak(&v18);
  }
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_239(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishUpdatingAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_240(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __51__MSASStateMachine__updateAlbumDisposition_params___block_invoke_2_241(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishUpdatingAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)updateAlbum:(id)a3 updateAlbumFlags:(int)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MSASStateMachine *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__MSASStateMachine_updateAlbum_updateAlbumFlags_info___block_invoke;
  v13[3] = &unk_1E6C3D0F8;
  id v14 = v8;
  id v15 = v9;
  int v17 = a4;
  id v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __54__MSASStateMachine_updateAlbum_updateAlbumFlags_info___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"album"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v10 setObject:v4 forKey:@"info"];
  }
  id v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v10 setObject:v5 forKey:@"albumFlags"];

  id v6 = [*(id *)(a1 + 48) _model];
  uint64_t v7 = NSStringFromSelector(sel__updateAlbumDisposition_params_);
  id v8 = [*(id *)(a1 + 48) personID];
  id v9 = [*(id *)(a1 + 32) GUID];
  [v6 enqueueCommand:v7 params:v10 personID:v8 albumGUID:v9 assetCollectionGUID:0];

  [*(id *)(a1 + 48) workQueueRetryOutstandingActivities];
}

- (void)_createAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v8 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v12 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v12, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Creating album: %{public}@", buf, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self protocol];
    id v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    objc_initWeak((id *)buf, self);
    id v11 = [(MSASStateMachine *)self protocol];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E6C3C7F0;
    void v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    id v17 = v7;
    id v18 = v8;
    [v11 createAlbum:v17 completionBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C778;
  id v17 = v7;
  id v11 = v7;
  objc_copyWeak(&v23, a1 + 7);
  id v12 = a1[5];
  id v13 = a1[4];
  id v18 = v12;
  id v19 = v13;
  id v20 = a1[6];
  id v21 = v8;
  id v22 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(&v23);
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishCreatingAlbum:v3 info:v4 error:v5];
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    char v3 = [WeakRetained workQueueEndCommandWithError:*(void *)(a1 + 32) command:0 params:0 albumGUID:0 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_loadWeakRetained((id *)(a1 + 80));
        uint64_t v12 = *(void *)(a1 + 40);
        id v13 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        id v26 = v11;
        __int16 v27 = 2114;
        uint64_t v28 = v12;
        __int16 v29 = 2114;
        long long v30 = v13;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to create album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      uint64_t v4 = [*(id *)(a1 + 48) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_233;
      block[3] = &unk_1E6C3C650;
      objc_copyWeak(&v24, (id *)(a1 + 80));
      id v21 = *(id *)(a1 + 40);
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 32);
      dispatch_async(v4, block);

      id v5 = objc_loadWeakRetained((id *)(a1 + 80));
      [v5 workQueueDidFinishCommand];

      objc_destroyWeak(&v24);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      id v26 = v6;
      __int16 v27 = 2114;
      uint64_t v28 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully created album %{public}@", buf, 0x16u);
    }
    id v8 = [*(id *)(a1 + 48) memberQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_234;
    v19[3] = &unk_1E6C3DA38;
    void v19[4] = *(void *)(a1 + 48);
    dispatch_barrier_sync(v8, v19);

    [*(id *)(a1 + 40) setCtag:*(void *)(a1 + 64)];
    [*(id *)(a1 + 40) setClientOrgKey:*(void *)(a1 + 72)];
    id v9 = [*(id *)(a1 + 48) eventQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2_235;
    v14[3] = &unk_1E6C3C650;
    objc_copyWeak(&v18, (id *)(a1 + 80));
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    dispatch_async(v9, v14);

    id v10 = objc_loadWeakRetained((id *)(a1 + 80));
    [v10 workQueueDidFinishCommand];

    objc_destroyWeak(&v18);
  }
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_233(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishCreatingAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_234(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __51__MSASStateMachine__createAlbumDisposition_params___block_invoke_2_235(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishCreatingAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)createAlbum:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MSASStateMachine_createAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __37__MSASStateMachine_createAlbum_info___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"album"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v9 setObject:v4 forKey:@"info"];
  }
  id v5 = [*(id *)(a1 + 48) _model];
  id v6 = NSStringFromSelector(sel__createAlbumDisposition_params_);
  id v7 = [*(id *)(a1 + 48) personID];
  id v8 = [*(id *)(a1 + 32) GUID];
  [v5 enqueueCommand:v6 params:v9 personID:v7 albumGUID:v8 assetCollectionGUID:0];

  [*(id *)(a1 + 48) workQueueRetryOutstandingActivities];
}

- (void)_deleteCommentDisposition:(int)a3 params:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v18 = [v6 objectForKey:@"comment"];
  id v7 = [v6 objectForKey:@"assetCollection"];
  id v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v9 = [v6 objectForKey:@"info"];
  uint64_t v10 = [v6 objectForKey:@"error"];
  id v11 = (void *)v10;
  if (a3 == 2)
  {
    id v13 = [(MSASStateMachine *)self eventQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2_230;
    v19[3] = &unk_1E6C3D9E8;
    void v19[4] = self;
    id v20 = v18;
    id v21 = v7;
    id v22 = v8;
    id v23 = v9;
    dispatch_async(v13, v19);
  }
  else if (!a3)
  {
    if (v10)
    {
      id v12 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D3A8;
      void block[4] = self;
      id v32 = v18;
      id v33 = v7;
      id v34 = v8;
      id v35 = v9;
      id v36 = v11;
      dispatch_async(v12, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        uint64_t v38 = self;
        __int16 v39 = 2114;
        __int16 v40 = v18;
        __int16 v41 = 2114;
        __int16 v42 = v7;
        __int16 v43 = 2114;
        __int16 v44 = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting comment %{public}@ from asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, self);
      id v14 = [(MSASStateMachine *)self delegate];
      id v15 = [v8 GUID];
      id v16 = [v14 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v15 info:v9];

      id v17 = [(MSASStateMachine *)self protocol];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_227;
      v24[3] = &unk_1E6C3C7C8;
      void v24[4] = self;
      objc_copyWeak(&v30, (id *)buf);
      id v25 = v6;
      id v26 = v8;
      id v27 = v7;
      id v28 = v18;
      id v29 = v9;
      [v17 deleteComment:v28 fromAssetCollection:v27 inAlbum:v26 albumURLString:v16 completionBlock:v24];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishDeletingComment:*(void *)(a1 + 40) inAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) info:*(void *)(a1 + 64) error:*(void *)(a1 + 72)];
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_227(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2;
  v8[3] = &unk_1E6C3C908;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v16, a1 + 10);
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  id v6 = a1[8];
  id v7 = a1[4];
  id v13 = v6;
  id v14 = v7;
  id v15 = a1[9];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v16);
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2_230(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v7 = [v2 _canceledError];
  [v8 MSASStateMachine:v2 didFinishDeletingComment:v3 inAssetCollection:v4 inAlbum:v5 info:v6 error:v7];
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = NSStringFromSelector(sel__deleteCommentDisposition_params_);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 48) GUID];
    id v7 = [*(id *)(a1 + 56) GUID];
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:v4 params:v5 albumGUID:v6 assetCollectionGUID:v7];

    if (v3) {
      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v23 = *(void *)(a1 + 64);
      uint64_t v24 = *(void *)(a1 + 48);
      id v25 = [*(id *)(a1 + 32) MSVerboseDescription];
      *(_DWORD *)buf = 138544386;
      id v40 = v21;
      __int16 v41 = 2114;
      uint64_t v42 = v23;
      __int16 v43 = 2114;
      uint64_t v44 = v22;
      __int16 v45 = 2114;
      uint64_t v46 = v24;
      __int16 v47 = 2114;
      uint64_t v48 = v25;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete comment %{public}@ from asset collection %{public}@ in album %{public}@. Error: %{public}@", buf, 0x34u);
    }
    id v8 = [*(id *)(a1 + 72) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_228;
    block[3] = &unk_1E6C3C6C8;
    id v9 = &v38;
    objc_copyWeak(&v38, (id *)(a1 + 88));
    id v33 = *(id *)(a1 + 64);
    id v34 = *(id *)(a1 + 56);
    id v35 = *(id *)(a1 + 48);
    id v36 = *(id *)(a1 + 80);
    id v37 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

    id v10 = objc_loadWeakRetained((id *)(a1 + 88));
    [v10 workQueueDidFinishCommand];

    id v11 = &v33;
    id v12 = &v34;
    id v13 = &v35;
    id v14 = &v36;
    id v15 = v37;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v16 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v18 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 64);
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v40 = v16;
      __int16 v41 = 2114;
      uint64_t v42 = v17;
      __int16 v43 = 2114;
      uint64_t v44 = v18;
      __int16 v45 = 2114;
      uint64_t v46 = v19;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully deleted comment %{public}@ from asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
    }
    id v20 = [*(id *)(a1 + 72) eventQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_229;
    v26[3] = &unk_1E6C3C560;
    id v9 = &v31;
    objc_copyWeak(&v31, (id *)(a1 + 88));
    id v27 = *(id *)(a1 + 64);
    id v28 = *(id *)(a1 + 56);
    id v29 = *(id *)(a1 + 48);
    id v30 = *(id *)(a1 + 80);
    dispatch_async(v20, v26);

    id v15 = objc_loadWeakRetained((id *)(a1 + 88));
    [v15 workQueueDidFinishCommand];
    id v11 = &v27;
    id v12 = &v28;
    id v13 = &v29;
    id v14 = &v30;
  }

  objc_destroyWeak(v9);
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_228(uint64_t a1)
{
  id v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishDeletingComment:*(void *)(a1 + 32) inAssetCollection:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void __53__MSASStateMachine__deleteCommentDisposition_params___block_invoke_229(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishDeletingComment:*(void *)(a1 + 32) inAssetCollection:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:0];
}

- (void)deleteComments:(id)a3 inAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MSASStateMachine_deleteComments_inAssetCollection_inAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __66__MSASStateMachine_deleteComments_inAssetCollection_inAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 40) count];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    uint64_t v30 = v2;
    __int16 v31 = 2048;
    uint64_t v32 = v3;
    __int16 v33 = 2114;
    uint64_t v34 = v4;
    __int16 v35 = 2114;
    uint64_t v36 = v5;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling deletion of %ld comments in asset collection %{public}@ in album %{public}@.", buf, 0x2Au);
  }
  uint64_t v6 = [*(id *)(a1 + 32) _model];
  [v6 beginTransaction];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v23 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * v9);
        id v11 = [MEMORY[0x1E4F1CA60] dictionary];
        [v11 setObject:v10 forKey:@"comment"];
        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          [v11 setObject:v12 forKey:@"assetCollection"];
        }
        uint64_t v13 = *(void *)(a1 + 56);
        if (v13) {
          [v11 setObject:v13 forKey:@"album"];
        }
        uint64_t v14 = *(void *)(a1 + 64);
        if (v14) {
          [v11 setObject:v14 forKey:@"info"];
        }
        id v15 = [*(id *)(a1 + 32) _model];
        id v16 = NSStringFromSelector(sel__deleteCommentDisposition_params_);
        id v17 = [*(id *)(a1 + 32) personID];
        id v18 = [*(id *)(a1 + 56) GUID];
        uint64_t v19 = [*(id *)(a1 + 48) GUID];
        [v15 enqueueCommand:v16 params:v11 personID:v17 albumGUID:v18 pendingOnAssetCollectionGUID:v19];

        ++v9;
      }
      while (v8 != v9);
      uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }

  id v20 = [*(id *)(a1 + 32) _model];
  [v20 endTransaction];

  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_deleteAssetCollectionsDisposition:(int)a3 params:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v8 = [v6 objectForKey:@"assetCollections"];
  uint64_t v9 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v15 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D9C0;
    id v17 = v8;
    id v18 = self;
    id v19 = v7;
    id v20 = v9;
    dispatch_async(v15, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      long long v27 = self;
      __int16 v28 = 2048;
      uint64_t v29 = [v8 count];
      __int16 v30 = 2114;
      __int16 v31 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting %ld photos in album %{public}@", buf, 0x20u);
    }
    uint64_t v10 = [(MSASStateMachine *)self protocol];
    id v11 = [v10 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v11];

    uint64_t v12 = [(MSASStateMachine *)self _model];
    [v12 removeAssetCollectionsFromUploadQueue:v8];

    uint64_t v13 = [(MSASStateMachine *)self _assetUploader];
    [v13 cancelAssetCollections:v8];

    objc_initWeak((id *)buf, self);
    uint64_t v14 = [(MSASStateMachine *)self protocol];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke;
    v21[3] = &unk_1E6C3C590;
    void v21[4] = self;
    objc_copyWeak(&v25, (id *)buf);
    id v22 = v8;
    id v23 = v7;
    id v24 = v9;
    [v14 deleteAssetCollections:v22 inAlbum:v23 completionBlock:v21];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2;
  v8[3] = &unk_1E6C3C6C8;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v14, a1 + 8);
  id v10 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  id v11 = v6;
  id v12 = v7;
  id v13 = a1[7];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v14);
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v7 = [*(id *)(a1 + 40) delegate];
        uint64_t v8 = *(void **)(a1 + 40);
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 56);
        id v11 = [v8 _canceledError];
        [v7 MSASStateMachine:v8 didFinishDeletingAssetCollection:v6 inAlbum:v9 info:v10 error:v11];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 9);
    id v3 = a1[4];
    uint64_t v4 = NSStringFromSelector(sel__deleteAssetCollectionsDisposition_params_);
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:v4 params:0 albumGUID:0 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_loadWeakRetained(a1 + 9);
        uint64_t v14 = [a1[5] count];
        id v15 = a1[6];
        long long v16 = [a1[4] MSVerboseDescription];
        *(_DWORD *)buf = 138544130;
        id v33 = v13;
        __int16 v34 = 2048;
        uint64_t v35 = v14;
        __int16 v36 = 2114;
        id v37 = v15;
        __int16 v38 = 2114;
        __int16 v39 = v16;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete %ld asset collections in album %{public}@. Error: %{public}@", buf, 0x2Au);
      }
      id v5 = [a1[7] eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_222;
      block[3] = &unk_1E6C3C560;
      id v27 = a1[5];
      objc_copyWeak(&v31, a1 + 9);
      id v28 = a1[6];
      id v29 = a1[8];
      id v30 = a1[4];
      dispatch_async(v5, block);

      id v6 = objc_loadWeakRetained(a1 + 9);
      [v6 workQueueDidFinishCommand];

      objc_destroyWeak(&v31);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v7 = objc_loadWeakRetained(a1 + 9);
      uint64_t v8 = [a1[5] count];
      id v9 = a1[6];
      *(_DWORD *)buf = 138543874;
      id v33 = v7;
      __int16 v34 = 2048;
      uint64_t v35 = v8;
      __int16 v36 = 2114;
      id v37 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully deleted %ld photos in album %{public}@", buf, 0x20u);
    }
    uint64_t v10 = [a1[7] memberQueue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_223;
    v25[3] = &unk_1E6C3DA38;
    v25[4] = a1[7];
    dispatch_barrier_sync(v10, v25);

    id v11 = [a1[7] eventQueue];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2_224;
    id v20 = &unk_1E6C3C650;
    objc_copyWeak(&v24, a1 + 9);
    id v21 = a1[5];
    id v22 = a1[6];
    id v23 = a1[8];
    dispatch_async(v11, &v17);

    id v12 = objc_loadWeakRetained(a1 + 9);
    objc_msgSend(v12, "workQueueDidFinishCommand", v17, v18, v19, v20);

    objc_destroyWeak(&v24);
  }
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_222(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        id v9 = objc_msgSend(WeakRetained, "delegate", (void)v11);
        id v10 = objc_loadWeakRetained((id *)(a1 + 64));
        [v9 MSASStateMachine:v10 didFinishDeletingAssetCollection:v7 inAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_223(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __62__MSASStateMachine__deleteAssetCollectionsDisposition_params___block_invoke_2_224(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        id v13 = objc_loadWeakRetained(v2);
        long long v14 = objc_msgSend(v13, "delegate", (void)v16);
        id v15 = objc_loadWeakRetained(v2);
        [v14 MSASStateMachine:v15 didFinishDeletingAssetCollection:v12 inAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:0];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)deleteAssetCollections:(id)a3 inAlbum:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__MSASStateMachine_deleteAssetCollections_inAlbum_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  long long v19 = self;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __56__MSASStateMachine_deleteAssetCollections_inAlbum_info___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v10 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"album"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v10 setObject:v4 forKey:@"assetCollections"];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    [v10 setObject:v5 forKey:@"info"];
  }
  uint64_t v6 = [*(id *)(a1 + 56) _model];
  id v7 = NSStringFromSelector(sel__deleteAssetCollectionsDisposition_params_);
  id v8 = [*(id *)(a1 + 56) personID];
  id v9 = [*(id *)(a1 + 32) GUID];
  [v6 enqueueCommand:v7 params:v10 personID:v8 albumGUID:v9 assetCollectionGUID:0];

  [*(id *)(a1 + 56) workQueueRetryOutstandingActivities];
}

- (void)_deleteAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v8 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v12 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v12, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = self;
      __int16 v22 = 2114;
      id v23 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting album: %{public}@", buf, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self protocol];
    id v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    objc_initWeak((id *)buf, self);
    uint64_t v11 = [(MSASStateMachine *)self protocol];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E6C3C5C0;
    void v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    id v17 = v7;
    id v18 = v8;
    [v11 deleteAlbum:v17 completionBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C560;
  id v8 = v3;
  id v5 = v3;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v6 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

  objc_destroyWeak(&v12);
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishDeletingAlbum:v3 info:v4 error:v5];
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2(id *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    char v3 = [WeakRetained workQueueEndCommandWithError:a1[4] command:0 params:0 albumGUID:0 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v11 = objc_loadWeakRetained(a1 + 8);
        id v12 = [a1[4] MSVerboseDescription];
        *(_DWORD *)buf = 138543618;
        id v25 = v11;
        __int16 v26 = 2114;
        id v27 = v12;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete album. Error: %{public}@", buf, 0x16u);
      }
      uint64_t v4 = [a1[5] eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_217;
      block[3] = &unk_1E6C3C650;
      objc_copyWeak(&v23, a1 + 8);
      id v20 = a1[6];
      id v21 = a1[7];
      id v22 = a1[4];
      dispatch_async(v4, block);

      id v5 = objc_loadWeakRetained(a1 + 8);
      [v5 workQueueDidFinishCommand];

      objc_destroyWeak(&v23);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v6 = objc_loadWeakRetained(a1 + 8);
      id v7 = a1[6];
      *(_DWORD *)buf = 138543618;
      id v25 = v6;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully deleted album %{public}@", buf, 0x16u);
    }
    id v8 = [a1[5] memberQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_218;
    v18[3] = &unk_1E6C3DA38;
    void v18[4] = a1[5];
    dispatch_barrier_sync(v8, v18);

    uint64_t v9 = [a1[5] eventQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2_219;
    v13[3] = &unk_1E6C3C650;
    objc_copyWeak(&v17, a1 + 8);
    id v14 = a1[6];
    id v15 = a1[7];
    id v16 = a1[4];
    dispatch_async(v9, v13);

    id v10 = objc_loadWeakRetained(a1 + 8);
    [v10 workQueueDidFinishCommand];

    objc_destroyWeak(&v17);
  }
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_217(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  char v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishDeletingAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_218(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __51__MSASStateMachine__deleteAlbumDisposition_params___block_invoke_2_219(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  id v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishDeletingAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)deleteAlbum:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MSASStateMachine_deleteAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __37__MSASStateMachine_deleteAlbum_info___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = v2;
  if (v3) {
    [v2 setObject:v3 forKey:@"album"];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    [v9 setObject:v4 forKey:@"info"];
  }
  id v5 = [*(id *)(a1 + 48) _model];
  id v6 = NSStringFromSelector(sel__deleteAlbumDisposition_params_);
  id v7 = [*(id *)(a1 + 48) personID];
  id v8 = [*(id *)(a1 + 32) GUID];
  [v5 enqueueCommand:v6 params:v9 personID:v7 albumGUID:v8 assetCollectionGUID:0];

  [*(id *)(a1 + 48) workQueueRetryOutstandingActivities];
}

- (void)_setAssetCollectionSyncedStateDisposition:(int)a3 params:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 objectForKey:@"assetCollection"];
  id v8 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v9 = [v6 objectForKey:@"assetCollectionState"];
  id v10 = [v6 objectForKey:@"info"];
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__4547;
  __int16 v36 = __Block_byref_object_dispose__4548;
  id v37 = 0;
  id v11 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke;
  block[3] = &unk_1E6C3CC10;
  id v31 = &v32;
  void block[4] = self;
  id v12 = v7;
  id v29 = v12;
  id v13 = v10;
  id v30 = v13;
  dispatch_sync(v11, block);

  if (a3 == 2)
  {
    id v18 = [(MSASStateMachine *)self eventQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_3;
    v19[3] = &unk_1E6C3D9C0;
    void v19[4] = self;
    id v20 = v12;
    id v21 = v8;
    id v22 = v13;
    dispatch_async(v18, v19);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v39 = self;
      __int16 v40 = 2114;
      id v41 = v12;
      __int16 v42 = 2114;
      __int16 v43 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting synced state for asset collection %{public}@ in album %{public}@", buf, 0x20u);
    }
    id v14 = [(MSASStateMachine *)self protocol];
    id v15 = [v14 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v15];

    objc_initWeak((id *)buf, self);
    id v16 = [(MSASStateMachine *)self protocol];
    uint64_t v17 = v33[5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_212;
    v23[3] = &unk_1E6C3C7A0;
    objc_copyWeak(&v27, (id *)buf);
    id v24 = v12;
    id v25 = v8;
    id v26 = v13;
    [v16 setAssetCollectionSyncedState:v9 forAssetCollection:v24 inAlbum:v25 assetCollectionStateCtag:v17 completionBlock:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

  _Block_object_dispose(&v32, 8);
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = [*(id *)(a1 + 40) GUID];
  uint64_t v3 = [v6 MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID:v2 info:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_212(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v9 = [WeakRetained workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C778;
  id v14 = v5;
  id v15 = WeakRetained;
  id v16 = a1[4];
  id v17 = a1[5];
  id v18 = a1[6];
  id v10 = WeakRetained;
  id v11 = v5;
  objc_copyWeak(&v20, v7);
  id v19 = v6;
  id v12 = v6;
  dispatch_async(v9, block);

  objc_destroyWeak(&v20);
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_3(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = [v2 _canceledError];
  [v7 MSASStateMachine:v2 didFinishSettingSyncedStateForAssetCollection:v3 inAlbum:v5 assetStateCtag:0 info:v4 error:v6];
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2(id *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  id v2 = a1[5];
  if (v3)
  {
    if ([v2 workQueueEndCommandWithError:v3 command:0 params:0 albumGUID:0 assetCollectionGUID:0])return; {
    if ([a1[4] MSContainsErrorWithDomain:*MEMORY[0x1E4F18F50] code:400])
    }
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_9:
        id v14 = [a1[5] eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_213;
        block[3] = &unk_1E6C3D9E8;
        id v9 = &v29;
        id v29 = a1[5];
        id v10 = &v30;
        id v30 = a1[6];
        id v11 = &v31;
        id v31 = a1[7];
        id v12 = &v32;
        id v32 = a1[8];
        id v13 = &v33;
        id v33 = a1[4];
        dispatch_async(v14, block);

        id WeakRetained = objc_loadWeakRetained(a1 + 10);
        [WeakRetained workQueueDidFinishCommand];

        goto LABEL_10;
      }
      id v4 = a1[6];
      id v5 = a1[7];
      id v6 = a1[5];
      id v7 = [a1[4] MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      id v35 = v6;
      __int16 v36 = 2114;
      id v37 = v4;
      __int16 v38 = 2114;
      id v39 = v5;
      __int16 v40 = 2114;
      id v41 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Can't set synced state for asset collection %{public}@ in album %{public}@. This is not an error. Status: %{public}@", buf, 0x2Au);
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      id v16 = a1[6];
      id v17 = a1[7];
      id v18 = a1[5];
      id v7 = [a1[4] MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      id v35 = v18;
      __int16 v36 = 2114;
      id v37 = v16;
      __int16 v38 = 2114;
      id v39 = v17;
      __int16 v40 = 2114;
      id v41 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for asset collection %{public}@ in album %{public}@. Error: %{public}@", buf, 0x2Au);
    }

    goto LABEL_9;
  }
  id v8 = [v2 eventQueue];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2_214;
  id v22 = &unk_1E6C3D9E8;
  id v9 = &v23;
  id v23 = a1[5];
  id v10 = &v24;
  id v24 = a1[6];
  id v11 = &v25;
  id v25 = a1[7];
  id v12 = &v26;
  id v26 = a1[9];
  id v13 = &v27;
  id v27 = a1[8];
  dispatch_async(v8, &v19);

  objc_msgSend(a1[5], "workQueueDidFinishCommand", v19, v20, v21, v22);
LABEL_10:
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_213(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishSettingSyncedStateForAssetCollection:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) assetStateCtag:0 info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void __69__MSASStateMachine__setAssetCollectionSyncedStateDisposition_params___block_invoke_2_214(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishSettingSyncedStateForAssetCollection:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) assetStateCtag:*(void *)(a1 + 56) info:*(void *)(a1 + 64) error:0];
}

- (void)setAssetCollectionSyncedState:(id)a3 forAssetCollection:(id)a4 album:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MSASStateMachine_setAssetCollectionSyncedState_forAssetCollection_album_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __80__MSASStateMachine_setAssetCollectionSyncedState_forAssetCollection_album_info___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v16 = 138543874;
    uint64_t v17 = v2;
    __int16 v18 = 2114;
    uint64_t v19 = v3;
    __int16 v20 = 2114;
    uint64_t v21 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling setting asset collection synced state for asset collection %{public}@ in album %{public}@", (uint8_t *)&v16, 0x20u);
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    [v5 setObject:v7 forKey:@"assetCollection"];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    [v6 setObject:v8 forKey:@"album"];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    [v6 setObject:v9 forKey:@"assetCollectionState"];
  }
  uint64_t v10 = *(void *)(a1 + 64);
  if (v10) {
    [v6 setObject:v10 forKey:@"info"];
  }
  id v11 = [*(id *)(a1 + 32) _model];
  id v12 = NSStringFromSelector(sel__setAssetCollectionSyncedStateDisposition_params_);
  id v13 = [*(id *)(a1 + 32) personID];
  id v14 = [*(id *)(a1 + 48) GUID];
  id v15 = [*(id *)(a1 + 40) GUID];
  [v11 enqueueCommand:v12 params:v6 personID:v13 albumGUID:v14 assetCollectionGUID:v15];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_setAlbumSyncedStateDisposition:(int)a3 params:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v8 = [v6 objectForKey:@"albumState"];
  uint64_t v9 = [v6 objectForKey:@"info"];
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__4547;
  id v37 = __Block_byref_object_dispose__4548;
  id v38 = 0;
  uint64_t v10 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke;
  block[3] = &unk_1E6C3CC10;
  id v32 = &v33;
  void block[4] = self;
  id v11 = v7;
  id v30 = v11;
  id v12 = v9;
  id v31 = v12;
  dispatch_sync(v10, block);

  if (a3 == 2)
  {
    uint64_t v17 = [(MSASStateMachine *)self eventQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_209;
    v19[3] = &unk_1E6C3D998;
    void v19[4] = self;
    id v20 = v11;
    id v21 = v12;
    dispatch_async(v17, v19);
  }
  else if (!a3)
  {
    if (v34[5])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v40 = self;
        __int16 v41 = 2114;
        id v42 = v11;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Setting synced state for album %{public}@", buf, 0x16u);
      }
      id v13 = [(MSASStateMachine *)self protocol];
      id v14 = [v13 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v14];

      objc_initWeak((id *)buf, self);
      id v15 = [(MSASStateMachine *)self protocol];
      uint64_t v16 = v34[5];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_202;
      v25[3] = &unk_1E6C3C748;
      objc_copyWeak(&v28, (id *)buf);
      id v26 = v11;
      id v27 = v12;
      [v15 setAlbumSyncedState:v8 forAlbum:v26 albumStateCtag:v16 completionBlock:v25];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v40 = self;
        __int16 v41 = 2114;
        id v42 = v11;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Not setting synced state for album %{public}@ because we don't have a state ctag.", buf, 0x16u);
      }
      __int16 v18 = [(MSASStateMachine *)self eventQueue];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_205;
      v22[3] = &unk_1E6C3D998;
      v22[4] = self;
      id v23 = v11;
      id v24 = v12;
      dispatch_async(v18, v22);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
  }

  _Block_object_dispose(&v33, 8);
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 40) GUID];
  uint64_t v3 = [v6 MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID:v2 info:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_202(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v8 = [WeakRetained workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3D9E8;
  id v13 = v5;
  id v14 = WeakRetained;
  id v15 = a1[4];
  id v16 = a1[5];
  id v17 = v6;
  id v9 = v6;
  id v10 = WeakRetained;
  id v11 = v5;
  dispatch_async(v8, block);
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_205(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_ALBUM_STATE_CTAG_MISSING");
  id v5 = [v2 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:3 description:v3];

  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  [v4 MSASStateMachine:*(void *)(a1 + 32) didFinishSettingSyncedStateForAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:v5 newAlbumStateCtag:0];
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_209(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishSettingSyncedStateForAlbum:v3 info:v4 error:v5 newAlbumStateCtag:0];
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2(id *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  id v2 = a1[5];
  if (v3)
  {
    if ([v2 workQueueEndCommandWithError:v3 command:0 params:0 albumGUID:0 assetCollectionGUID:0])return; {
    if ([a1[4] MSContainsErrorWithDomain:*MEMORY[0x1E4F18F50] code:400])
    }
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_9:
        id v12 = [a1[5] eventQueue];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_203;
        v21[3] = &unk_1E6C3D9C0;
        uint64_t v8 = &v22;
        id v22 = a1[5];
        id v9 = &v23;
        id v23 = a1[6];
        id v10 = &v24;
        id v24 = a1[7];
        id v11 = &v25;
        id v25 = a1[4];
        dispatch_async(v12, v21);

        [a1[5] workQueueDidFinishCommand];
        goto LABEL_10;
      }
      id v5 = a1[5];
      id v4 = a1[6];
      id v6 = [a1[4] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v27 = v5;
      __int16 v28 = 2114;
      id v29 = v4;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Can't set synced state for album %{public}@. This is not an error. Status: %{public}@", buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      id v14 = a1[5];
      id v13 = a1[6];
      id v6 = [a1[4] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v27 = v14;
      __int16 v28 = 2114;
      id v29 = v13;
      __int16 v30 = 2114;
      id v31 = v6;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for album %{public}@. Error: %{public}@", buf, 0x20u);
    }

    goto LABEL_9;
  }
  uint64_t v7 = [v2 eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_204;
  block[3] = &unk_1E6C3D9E8;
  uint64_t v8 = &v16;
  id v16 = a1[5];
  id v9 = &v17;
  id v17 = a1[6];
  id v10 = &v18;
  id v18 = a1[7];
  id v11 = &v19;
  id v19 = a1[4];
  id v20 = a1[8];
  dispatch_async(v7, block);

  [a1[5] workQueueDidFinishCommand];
LABEL_10:
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_203(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishSettingSyncedStateForAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56) newAlbumStateCtag:0];
}

void __59__MSASStateMachine__setAlbumSyncedStateDisposition_params___block_invoke_2_204(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishSettingSyncedStateForAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56) newAlbumStateCtag:*(void *)(a1 + 64)];
}

- (void)setAlbumSyncedState:(id)a3 forAlbum:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__MSASStateMachine_setAlbumSyncedState_forAlbum_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __54__MSASStateMachine_setAlbumSyncedState_forAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v13 = 138543618;
    uint64_t v14 = v2;
    __int16 v15 = 2114;
    uint64_t v16 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling setting album synced state for album %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"albumState"];
  }
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    [v5 setObject:v8 forKey:@"info"];
  }
  id v9 = [*(id *)(a1 + 32) _model];
  id v10 = NSStringFromSelector(sel__setAlbumSyncedStateDisposition_params_);
  id v11 = [*(id *)(a1 + 32) personID];
  id v12 = [*(id *)(a1 + 40) GUID];
  [v9 enqueueCommand:v10 params:v5 personID:v11 albumGUID:v12 assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_checkForAlbumSyncedStateDisposition:(int)a3 params:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v8 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v19 = [(MSASStateMachine *)self eventQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3_199;
    v20[3] = &unk_1E6C3D998;
    v20[4] = self;
    id v21 = v7;
    id v22 = v8;
    dispatch_async(v19, v20);

    uint64_t v17 = &v21;
    id v18 = &v22;
LABEL_7:

    goto LABEL_8;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 138543618;
      *(void *)&location[4] = self;
      __int16 v36 = 2114;
      id v37 = v7;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Checking for album synced state changes in album %{public}@", location, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self protocol];
    id v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    id v11 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v12 = v7;
    id v33 = v12;
    id v13 = v8;
    id v34 = v13;
    dispatch_async(v11, block);

    objc_initWeak((id *)location, self);
    uint64_t v14 = [(MSASStateMachine *)self protocol];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    id v28[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2;
    v28[3] = &unk_1E6C3C6F0;
    void v28[4] = self;
    objc_copyWeak(&v31, (id *)location);
    id v15 = v12;
    id v29 = v15;
    id v16 = v13;
    id v30 = v16;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_4;
    v23[3] = &unk_1E6C3C718;
    objc_copyWeak(&v27, (id *)location);
    id v24 = v15;
    id v25 = self;
    id v26 = v16;
    [v14 getAlbumSyncedStateForAlbum:v24 assetCollectionStateBlock:v28 completionBlock:v23];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
    uint64_t v17 = &v33;
    id v18 = &v34;
    goto LABEL_7;
  }
LABEL_8:
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) willCheckForAlbumSyncedStateChangesInAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1[4] eventQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3;
  v14[3] = &unk_1E6C3C6C8;
  objc_copyWeak(&v20, a1 + 7);
  id v15 = v8;
  id v16 = v7;
  id v17 = a1[5];
  id v18 = v9;
  id v19 = a1[6];
  id v11 = v9;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(v10, v14);

  objc_destroyWeak(&v20);
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_4(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7)
  {
    id v18 = [a1[5] eventQueue];
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    id v25 = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2_197;
    id v26 = &unk_1E6C3C6C8;
    id v13 = &v32;
    objc_copyWeak(&v32, a1 + 7);
    id v27 = v8;
    id v28 = a1[4];
    id v29 = a1[6];
    id v30 = 0;
    id v31 = v9;
    dispatch_async(v18, &v23);

    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "workQueueDidFinishCommand", v23, v24, v25, v26, v27, v28, v29);

    id v15 = &v27;
    id v16 = &v28;
    id v17 = &v29;
    id v14 = v30;
LABEL_7:

    objc_destroyWeak(v13);
    goto LABEL_8;
  }
  id v10 = objc_loadWeakRetained(a1 + 7);
  char v11 = [v10 workQueueEndCommandWithError:v7 command:0 params:0 albumGUID:0 assetCollectionGUID:0];

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v20 = objc_loadWeakRetained(a1 + 7);
      id v21 = a1[4];
      id v22 = [v7 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v39 = v20;
      __int16 v40 = 2114;
      id v41 = v21;
      __int16 v42 = 2114;
      uint64_t v43 = v22;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to check for synced state changes in album %{public}@. Error: %{public}@", buf, 0x20u);
    }
    id v12 = [a1[5] eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_196;
    block[3] = &unk_1E6C3C650;
    id v13 = &v37;
    objc_copyWeak(&v37, a1 + 7);
    id v34 = a1[4];
    id v35 = a1[6];
    id v36 = v7;
    dispatch_async(v12, block);

    id v14 = objc_loadWeakRetained(a1 + 7);
    [v14 workQueueDidFinishCommand];
    id v15 = &v34;
    id v16 = &v35;
    id v17 = &v36;
    goto LABEL_7;
  }
LABEL_8:
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3_199(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishCheckingForAlbumSyncedStateChangesInAlbum:v3 info:v4 error:v5 newAlbumStateCtag:0];
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_196(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishCheckingForAlbumSyncedStateChangesInAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48) newAlbumStateCtag:0];
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_2_197(uint64_t a1)
{
  id v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = [WeakRetained delegate];
  id v5 = objc_loadWeakRetained(v2);
  [v4 MSASStateMachine:v5 didFindAlbumSyncedState:*(void *)(a1 + 32) forAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];

  id v8 = objc_loadWeakRetained(v2);
  id v6 = [v8 delegate];
  id v7 = objc_loadWeakRetained(v2);
  [v6 MSASStateMachine:v7 didFinishCheckingForAlbumSyncedStateChangesInAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56) newAlbumStateCtag:*(void *)(a1 + 64)];
}

void __64__MSASStateMachine__checkForAlbumSyncedStateDisposition_params___block_invoke_3(uint64_t a1)
{
  id v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFindAssetCollectionSyncedState:*(void *)(a1 + 32) forAssetCollectionGUID:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) assetCollectionStateCtag:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)checkForAlbumSyncedStateChangesInAlbums:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MSASStateMachine_checkForAlbumSyncedStateChangesInAlbums_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__MSASStateMachine_checkForAlbumSyncedStateChangesInAlbums_info___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v2;
    __int16 v27 = 2114;
    uint64_t v28 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling checking for album synced state changes in albums %{public}@", buf, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) _model];
  [v4 beginTransaction];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        id v10 = [MEMORY[0x1E4F1CA60] dictionary];
        char v11 = v10;
        if (v9) {
          [v10 setObject:v9 forKey:@"album"];
        }
        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          [v11 setObject:v12 forKey:@"info"];
        }
        id v13 = [*(id *)(a1 + 32) _model];
        id v14 = NSStringFromSelector(sel__checkForAlbumSyncedStateDisposition_params_);
        id v15 = [*(id *)(a1 + 32) personID];
        id v16 = [v9 GUID];
        [v13 enqueueCommand:v14 params:v11 personID:v15 albumGUID:v16 assetCollectionGUID:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  id v17 = [*(id *)(a1 + 32) _model];
  [v17 endTransaction];

  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_checkForCommentChangesDisposition:(int)a3 params:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"commentsChange"];
  uint64_t v8 = [v6 objectForKey:@"albumGUID"];
  id v9 = [(MSASStateMachine *)self delegate];
  id v10 = [v9 albumWithGUID:v8];

  char v11 = [v10 clientOrgKey];
  if (v11) {
    [v10 clientOrgKey];
  }
  else {
  long long v22 = [v6 objectForKey:@"clientOrgKey"];
  }

  uint64_t v12 = [v6 objectForKey:@"info"];
  uint64_t v13 = [v6 objectForKey:@"error"];
  id v14 = (void *)v13;
  if (a3 == 2)
  {
    id v16 = [(MSASStateMachine *)self eventQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_4;
    v23[3] = &unk_1E6C3D998;
    id v24 = v7;
    id v25 = self;
    id v26 = v12;
    dispatch_async(v16, v23);
  }
  else if (!a3)
  {
    if (v13)
    {
      id v15 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D9C0;
      id v34 = v7;
      id v35 = self;
      id v36 = v12;
      id v37 = v14;
      dispatch_async(v15, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v39 = self;
        __int16 v40 = 2114;
        id v41 = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Checking for comment changes in album %{public}@,", buf, 0x16u);
      }
      id v17 = [(MSASStateMachine *)self protocol];
      id v18 = [v17 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v18];

      objc_initWeak((id *)buf, self);
      id v19 = [(MSASStateMachine *)self delegate];
      long long v20 = [v19 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v8 info:v12];

      long long v21 = [(MSASStateMachine *)self protocol];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      id v27[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_188;
      v27[3] = &unk_1E6C3C6A0;
      void v27[4] = self;
      objc_copyWeak(&v32, (id *)buf);
      id v28 = v6;
      id v29 = v8;
      id v30 = v7;
      id v31 = v12;
      [v21 getCommentChanges:v30 inAlbumWithGUID:v29 withClientOrgKey:v22 albumURLString:v20 completionBlock:v27];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 40) delegate];
        [v8 MSASStateMachine:*(void *)(a1 + 40) didFinishCheckingForCommentChangesInAssetCollectionWithGUID:v7 largestCommentID:0 info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_188(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] workQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2;
  v12[3] = &unk_1E6C3C908;
  id v13 = v5;
  id v8 = v5;
  objc_copyWeak(&v20, a1 + 9);
  id v14 = a1[5];
  id v15 = a1[6];
  id v9 = a1[7];
  id v10 = a1[4];
  id v16 = v9;
  id v17 = v10;
  id v18 = v6;
  id v19 = a1[8];
  id v11 = v6;
  dispatch_async(v7, v12);

  objc_destroyWeak(&v20);
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 40) delegate];
        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = [v9 _canceledError];
        [v8 MSASStateMachine:v9 didFinishCheckingForCommentChangesInAssetCollectionWithGUID:v7 largestCommentID:0 info:v10 error:v11];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = NSStringFromSelector(sel__checkForCommentChangesDisposition_params_);
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:v4 params:*(void *)(a1 + 40) albumGUID:*(void *)(a1 + 48) assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_loadWeakRetained((id *)(a1 + 88));
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 56);
        id v16 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138544130;
        id v33 = v13;
        __int16 v34 = 2114;
        uint64_t v35 = v15;
        __int16 v36 = 2114;
        uint64_t v37 = v14;
        __int16 v38 = 2114;
        id v39 = v16;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to check for comment changes in asset collections %{public}@ in album %{public}@. Error: %{public}@", buf, 0x2Au);
      }
      uint64_t v5 = [*(id *)(a1 + 64) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_189;
      block[3] = &unk_1E6C3C650;
      id v28 = *(id *)(a1 + 72);
      objc_copyWeak(&v31, (id *)(a1 + 88));
      id v29 = *(id *)(a1 + 80);
      id v30 = *(id *)(a1 + 32);
      dispatch_async(v5, block);

      id v6 = objc_loadWeakRetained((id *)(a1 + 88));
      [v6 workQueueDidFinishCommand];

      objc_destroyWeak(&v31);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      id v33 = v7;
      __int16 v34 = 2114;
      uint64_t v35 = v8;
      __int16 v36 = 2114;
      uint64_t v37 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully checked for comment changes %{public}@ in album %{public}@.", buf, 0x20u);
    }
    uint64_t v10 = [*(id *)(a1 + 64) memberQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_190;
    v26[3] = &unk_1E6C3DA38;
    void v26[4] = *(void *)(a1 + 64);
    dispatch_barrier_sync(v10, v26);

    id v11 = [*(id *)(a1 + 64) eventQueue];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2_191;
    id v20 = &unk_1E6C3C560;
    objc_copyWeak(&v25, (id *)(a1 + 88));
    id v21 = *(id *)(a1 + 72);
    id v22 = *(id *)(a1 + 56);
    id v23 = *(id *)(a1 + 48);
    id v24 = *(id *)(a1 + 80);
    dispatch_async(v11, &v17);

    id v12 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v12, "workQueueDidFinishCommand", v17, v18, v19, v20);

    objc_destroyWeak(&v25);
  }
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_189(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        uint64_t v9 = [WeakRetained delegate];
        id v10 = objc_loadWeakRetained((id *)(a1 + 56));
        [v9 MSASStateMachine:v10 didFinishCheckingForCommentChangesInAssetCollectionWithGUID:v7 largestCommentID:0 info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

uint64_t __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_190(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_2_191(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  uint64_t v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_3;
  v8[3] = &unk_1E6C3C678;
  uint64_t v7 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  objc_copyWeak(&v12, v2);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v7 enumerateKeysAndObjectsUsingBlock:v8];

  objc_destroyWeak(&v12);
}

void __62__MSASStateMachine__checkForCommentChangesDisposition_params___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) objectForKey:v5];
  uint64_t v8 = [v7 intValue];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v14, "type", (void)v24) == 2)
        {
          if ((int)[v14 deletionIndex] > (int)v8) {
            uint64_t v8 = [v14 deletionIndex];
          }
        }
        else
        {
          uint64_t v15 = [v14 comment];
          int v16 = [v15 ID];

          if (v16 > (int)v8)
          {
            uint64_t v17 = [v14 comment];
            uint64_t v8 = [v17 ID];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v19 = [WeakRetained delegate];
  id v20 = objc_loadWeakRetained((id *)(a1 + 56));
  [v19 MSASStateMachine:v20 didFindCommentChanges:v9 inAssetCollectionWithGUID:v5 inAlbumWithGUID:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];

  id v21 = objc_loadWeakRetained((id *)(a1 + 56));
  id v22 = [v21 delegate];
  id v23 = objc_loadWeakRetained((id *)(a1 + 56));
  [v22 MSASStateMachine:v23 didFinishCheckingForCommentChangesInAssetCollectionWithGUID:v5 largestCommentID:v8 info:*(void *)(a1 + 48) error:0];
}

- (void)checkForCommentChanges:(id)a3 inAlbumWithGUID:(id)a4 withClientOrgKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__MSASStateMachine_checkForCommentChanges_inAlbumWithGUID_withClientOrgKey___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __76__MSASStateMachine_checkForCommentChanges_inAlbumWithGUID_withClientOrgKey___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    int v13 = 138543874;
    uint64_t v14 = v2;
    __int16 v15 = 2114;
    uint64_t v16 = v3;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling checking for comment changes %{public}@ in album %{public}@.", (uint8_t *)&v13, 0x20u);
  }
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    [v5 setObject:v7 forKey:@"commentsChange"];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    [v6 setObject:v8 forKey:@"albumGUID"];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    [v6 setObject:v9 forKey:@"clientOrgKey"];
  }
  id v10 = [*(id *)(a1 + 32) _model];
  uint64_t v11 = NSStringFromSelector(sel__checkForCommentChangesDisposition_params_);
  id v12 = [*(id *)(a1 + 32) personID];
  [v10 enqueueCommand:v11 params:v6 personID:v12 albumGUID:*(void *)(a1 + 48) assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_checkForAssetCollectionUpdatesDisposition:(int)a3 params:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  uint64_t v8 = [v6 objectForKey:@"assetCollections"];
  uint64_t v9 = [v6 objectForKey:@"info"];
  id v10 = [v6 objectForKey:@"error"];
  uint64_t v11 = [v6 objectForKey:@"commandWasRequeued"];
  char v12 = [v11 BOOLValue];

  if (a3 == 2)
  {
    uint64_t v14 = [(MSASStateMachine *)self eventQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2_185;
    v24[3] = &unk_1E6C3D9C0;
    void v24[4] = self;
    id v25 = v8;
    id v26 = v7;
    id v27 = v9;
    dispatch_async(v14, v24);
  }
  else if (!a3)
  {
    if (v10)
    {
      int v13 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D9E8;
      void block[4] = self;
      id v38 = v8;
      id v39 = v7;
      id v40 = v9;
      id v41 = v10;
      dispatch_async(v13, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v8 count];
        uint64_t v16 = [v7 GUID];
        *(_DWORD *)buf = 138543874;
        uint64_t v43 = self;
        __int16 v44 = 2048;
        uint64_t v45 = v15;
        __int16 v46 = 2114;
        __int16 v47 = v16;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Getting metadata for %ld photos in album %{public}@.", buf, 0x20u);
      }
      __int16 v17 = [(MSASStateMachine *)self protocol];
      uint64_t v18 = [v17 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v18];

      if ((v12 & 1) == 0)
      {
        uint64_t v19 = [(MSASStateMachine *)self eventQueue];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_178;
        v33[3] = &unk_1E6C3D9C0;
        v33[4] = self;
        id v34 = v8;
        id v35 = v7;
        id v36 = v9;
        dispatch_async(v19, v33);
      }
      objc_initWeak((id *)buf, self);
      id v20 = [(MSASStateMachine *)self delegate];
      id v21 = [v7 GUID];
      id v22 = [v20 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v21 info:v9];

      id v23 = [(MSASStateMachine *)self protocol];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      id v28[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2;
      v28[3] = &unk_1E6C3C618;
      void v28[4] = self;
      objc_copyWeak(&v32, (id *)buf);
      id v29 = v6;
      id v30 = v7;
      id v31 = v9;
      [v23 getAssetCollections:v8 inAlbum:v30 albumURLString:v22 completionBlock:v28];

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishUpdatingAssetCollections:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_178(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) willUpdateAssetCollections:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [a1[4] workQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_3;
  v17[3] = &unk_1E6C3C908;
  id v18 = v8;
  id v12 = v8;
  objc_copyWeak(&v25, a1 + 8);
  id v19 = a1[5];
  id v13 = a1[6];
  id v14 = a1[4];
  id v20 = v13;
  id v21 = v14;
  id v22 = v9;
  id v23 = a1[7];
  id v24 = v10;
  id v15 = v10;
  id v16 = v9;
  dispatch_async(v11, v17);

  objc_destroyWeak(&v25);
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_2_185(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) willUpdateAssetCollections:*(void *)(a1 + 40) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];

  id v8 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v7 = [v3 _canceledError];
  [v8 MSASStateMachine:v3 didFinishUpdatingAssetCollections:v4 inAlbum:v6 info:v5 error:v7];
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) GUID];
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v4 command:0 params:v3 albumGUID:v5 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v24 = objc_loadWeakRetained((id *)(a1 + 88));
        id v25 = [*(id *)(a1 + 32) MSVerboseDescription];
        *(_DWORD *)buf = 138543618;
        id v34 = v24;
        __int16 v35 = 2114;
        id v36 = v25;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to get metadata. Error: %{public}@", buf, 0x16u);
      }
      uint64_t v6 = [*(id *)(a1 + 56) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_179;
      block[3] = &unk_1E6C3C560;
      objc_copyWeak(&v32, (id *)(a1 + 88));
      id v28 = *(id *)(a1 + 64);
      id v29 = *(id *)(a1 + 48);
      id v30 = *(id *)(a1 + 72);
      id v31 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

      id v7 = objc_loadWeakRetained((id *)(a1 + 88));
      [v7 workQueueDidFinishCommand];

      objc_destroyWeak(&v32);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 88));
      *(_DWORD *)buf = 138543362;
      id v34 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully checked for asset collection updates.", buf, 0xCu);
    }
    id v9 = [*(id *)(a1 + 56) memberQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_180;
    v26[3] = &unk_1E6C3DA38;
    void v26[4] = *(void *)(a1 + 56);
    dispatch_barrier_sync(v9, v26);

    id v10 = objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v11 = [v10 daemon];
    id v12 = objc_loadWeakRetained((id *)(a1 + 88));
    id v13 = [v12 personID];
    [v11 didReceiveAuthSuccessForPersonID:v13];

    id v14 = objc_loadWeakRetained((id *)(a1 + 88));
    id v15 = [v14 delegate];
    id v16 = objc_loadWeakRetained((id *)(a1 + 88));
    [v15 MSASStateMachine:v16 didFinishUpdatingAssetCollections:*(void *)(a1 + 64) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 72) error:*(void *)(a1 + 32)];

    if ([*(id *)(a1 + 80) count])
    {
      __int16 v17 = (void *)MEMORY[0x1E4F28C58];
      id v18 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_SUB_NO_METADATA");
      id v19 = [v17 MSErrorWithDomain:@"MSASSubscriberErrorDomain" code:1 description:v18];

      id v20 = objc_loadWeakRetained((id *)(a1 + 88));
      id v21 = [v20 delegate];
      id v22 = objc_loadWeakRetained((id *)(a1 + 88));
      [v21 MSASStateMachine:v22 didFinishUpdatingAssetCollections:*(void *)(a1 + 80) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 72) error:v19];
    }
    id v23 = objc_loadWeakRetained((id *)(a1 + 88));
    [v23 workQueueDidFinishCommand];
  }
}

void __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_179(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishUpdatingAssetCollections:*(void *)(a1 + 32) inAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __70__MSASStateMachine__checkForAssetCollectionUpdatesDisposition_params___block_invoke_180(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

- (void)checkForAssetCollectionUpdates:(id)a3 inAlbum:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__MSASStateMachine_checkForAssetCollectionUpdates_inAlbum_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __64__MSASStateMachine_checkForAssetCollectionUpdates_inAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = [*(id *)(a1 + 40) count];
    id v4 = [*(id *)(a1 + 48) GUID];
    int v14 = 138543874;
    uint64_t v15 = v2;
    __int16 v16 = 2048;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling update of metadata for %ld photos in album %{public}@", (uint8_t *)&v14, 0x20u);
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    [v5 setObject:v7 forKey:@"assetCollections"];
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    [v6 setObject:v8 forKey:@"album"];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    [v6 setObject:v9 forKey:@"info"];
  }
  id v10 = [*(id *)(a1 + 32) _model];
  uint64_t v11 = NSStringFromSelector(sel__checkForAssetCollectionUpdatesDisposition_params_);
  id v12 = [*(id *)(a1 + 32) personID];
  id v13 = [*(id *)(a1 + 48) GUID];
  [v10 enqueueCommand:v11 params:v6 personID:v12 albumGUID:v13 assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Validating invitation token.", buf, 0xCu);
  }
  uint64_t v3 = [*(id *)(a1 + 32) protocol];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_174;
  v5[3] = &unk_1E6C3D170;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 validateInvitationForAlbum:v4 completionBlock:v5];
}

void __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_174(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3DAD8;
  id v7 = *(id *)(a1 + 40);
  char v12 = a2;
  id v10 = v5;
  id v11 = v7;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __63__MSASStateMachine_validateInvitationForAlbum_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)acceptInvitationWithToken:(id)a3 info:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke;
  v15[3] = &unk_1E6C3CA78;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Accepting invitation using token.", buf, 0xCu);
  }
  uint64_t v3 = [*(id *)(a1 + 32) protocol];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_173;
  v5[3] = &unk_1E6C3C5E8;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v3 acceptInvitationWithToken:v4 completionBlock:v5];
}

void __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_173(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3D198;
  id v9 = a1[6];
  id v7 = a1[5];
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __67__MSASStateMachine_acceptInvitationWithToken_info_completionBlock___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_markAsSpamInvitationForTokenDisposition:(int)a3 params:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"info"];
  id v8 = [v6 objectForKeyedSubscript:@"invitationToken"];
  if (a3 == 2)
  {
    id v12 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v14 = v8;
    id v15 = v7;
    dispatch_async(v12, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Marking as spam invitation for token %{public}@", buf, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self protocol];
    uint64_t v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    objc_initWeak((id *)buf, self);
    id v11 = [(MSASStateMachine *)self protocol];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke;
    v16[3] = &unk_1E6C3C5C0;
    objc_copyWeak(&v20, (id *)buf);
    id v17 = v8;
    id v18 = self;
    id v19 = v7;
    [v11 markAsSpamInvitationForToken:v17 completionBlock:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke(id *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    char v5 = [WeakRetained workQueueEndCommandWithError:v3 command:0 params:0 albumGUID:0 assetCollectionGUID:0];

    if ((v5 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_loadWeakRetained(a1 + 7);
        id v14 = a1[4];
        *(_DWORD *)buf = 138543874;
        id v27 = v13;
        __int16 v28 = 2114;
        id v29 = v14;
        __int16 v30 = 2114;
        id v31 = v3;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark as spam invitation for token %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v6 = [a1[5] eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_171;
      block[3] = &unk_1E6C3C650;
      objc_copyWeak(&v25, a1 + 7);
      id v22 = a1[4];
      id v23 = a1[6];
      id v24 = v3;
      dispatch_async(v6, block);

      id v7 = objc_loadWeakRetained(a1 + 7);
      [v7 workQueueDidFinishCommand];

      objc_destroyWeak(&v25);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v8 = objc_loadWeakRetained(a1 + 7);
      id v9 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v27 = v8;
      __int16 v28 = 2114;
      id v29 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully marked as spam invitation for token %{public}@", buf, 0x16u);
    }
    uint64_t v10 = [a1[5] memberQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_172;
    v20[3] = &unk_1E6C3DA38;
    v20[4] = a1[5];
    dispatch_barrier_sync(v10, v20);

    id v11 = [a1[5] eventQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_2;
    v15[3] = &unk_1E6C3C650;
    objc_copyWeak(&v19, a1 + 7);
    id v16 = a1[4];
    id v17 = a1[6];
    id v18 = 0;
    dispatch_async(v11, v15);

    id v12 = objc_loadWeakRetained(a1 + 7);
    [v12 workQueueDidFinishCommand];

    objc_destroyWeak(&v19);
  }
}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  char v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishMarkingAsSpamInvitationForToken:v3 info:v4 error:v5];
}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_171(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishMarkingAsSpamInvitationForToken:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_172(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __68__MSASStateMachine__markAsSpamInvitationForTokenDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  id v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishMarkingAsSpamInvitationForToken:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)markAsSpamInvitationForToken:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSASStateMachine_markAsSpamInvitationForToken_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__MSASStateMachine_markAsSpamInvitationForToken_info___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v2;
    __int16 v10 = 2114;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling mark as spam invitation for token %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"info"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"invitationToken"];
  id v5 = [*(id *)(a1 + 32) _model];
  id v6 = NSStringFromSelector(sel__markAsSpamInvitationForTokenDisposition_params_);
  id v7 = [*(id *)(a1 + 32) personID];
  [v5 enqueueCommand:v6 params:v4 personID:v7 albumGUID:0 assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_markAsSpamInvitationForAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:@"album"];
  int v8 = [v6 objectForKeyedSubscript:@"info"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"sharingRelationshipGUID"];
  if (a3 == 2)
  {
    id v13 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D9C0;
    void block[4] = self;
    id v15 = v7;
    id v16 = v9;
    id v17 = v8;
    dispatch_async(v13, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Marking as spam invitation for album %{public}@", buf, 0x16u);
    }
    __int16 v10 = [(MSASStateMachine *)self protocol];
    uint64_t v11 = [v10 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v11];

    objc_initWeak((id *)buf, self);
    uint64_t v12 = [(MSASStateMachine *)self protocol];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke;
    v18[3] = &unk_1E6C3C590;
    objc_copyWeak(&v23, (id *)buf);
    id v19 = v7;
    id v20 = self;
    id v21 = v9;
    id v22 = v8;
    [v12 markAsSpamInvitationForAlbum:v19 completionBlock:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    id v5 = [a1[4] GUID];
    char v6 = [WeakRetained workQueueEndCommandWithError:v3 command:0 params:0 albumGUID:v5 assetCollectionGUID:0];

    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v14 = objc_loadWeakRetained(a1 + 8);
        id v15 = a1[4];
        *(_DWORD *)buf = 138543874;
        id v32 = v14;
        __int16 v33 = 2114;
        id v34 = v15;
        __int16 v35 = 2114;
        id v36 = v3;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to mark as spam invitation for album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v7 = [a1[5] eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_167;
      block[3] = &unk_1E6C3C560;
      objc_copyWeak(&v30, a1 + 8);
      id v26 = a1[4];
      id v27 = a1[6];
      id v28 = a1[7];
      id v29 = v3;
      dispatch_async(v7, block);

      id v8 = objc_loadWeakRetained(a1 + 8);
      [v8 workQueueDidFinishCommand];

      objc_destroyWeak(&v30);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v9 = objc_loadWeakRetained(a1 + 8);
      id v10 = a1[4];
      *(_DWORD *)buf = 138543618;
      id v32 = v9;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully marked as spam invitation for album %{public}@", buf, 0x16u);
    }
    uint64_t v11 = [a1[5] memberQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_168;
    v24[3] = &unk_1E6C3DA38;
    void v24[4] = a1[5];
    dispatch_barrier_sync(v11, v24);

    uint64_t v12 = [a1[5] eventQueue];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_2;
    id v19 = &unk_1E6C3C650;
    objc_copyWeak(&v23, a1 + 8);
    id v20 = a1[4];
    id v21 = a1[6];
    id v22 = a1[7];
    dispatch_async(v12, &v16);

    id v13 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v13, "workQueueDidFinishCommand", v16, v17, v18, v19);

    objc_destroyWeak(&v23);
  }
}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  char v6 = [v2 _canceledError];
  [v7 MSASStateMachine:v2 didFinishMarkingAsSpamInvitationForAlbum:v3 invitationGUID:v5 info:v4 error:v6];
}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_167(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishMarkingAsSpamInvitationForAlbum:*(void *)(a1 + 32) invitationGUID:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

uint64_t __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_168(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __68__MSASStateMachine__markAsSpamInvitationForAlbumDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  char v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  id v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishMarkingAsSpamInvitationForAlbum:*(void *)(a1 + 32) invitationGUID:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:0];
}

- (void)markAsSpamInvitationForAlbum:(id)a3 invitationGUID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MSASStateMachine *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__MSASStateMachine_markAsSpamInvitationForAlbum_invitationGUID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __69__MSASStateMachine_markAsSpamInvitationForAlbum_invitationGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v2;
    __int16 v11 = 2114;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling mark as spam invitation for album %{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"album"];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"info"];
  [v4 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"sharingRelationshipGUID"];
  id v5 = [*(id *)(a1 + 32) _model];
  char v6 = NSStringFromSelector(sel__markAsSpamInvitationForAlbumDisposition_params_);
  id v7 = [*(id *)(a1 + 32) personID];
  id v8 = [*(id *)(a1 + 40) GUID];
  [v5 enqueueCommand:v6 params:v4 personID:v7 albumGUID:v8 assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_unsubscribeFromAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v8 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    uint64_t v12 = [(MSASStateMachine *)self eventQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_3;
    v13[3] = &unk_1E6C3D998;
    void v13[4] = self;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v12, v13);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Unsubscribing from album %{public}@", buf, 0x16u);
    }
    int v9 = [(MSASStateMachine *)self protocol];
    uint64_t v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    objc_initWeak((id *)buf, self);
    __int16 v11 = [(MSASStateMachine *)self protocol];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E6C3C590;
    void v16[4] = self;
    objc_copyWeak(&v20, (id *)buf);
    id v17 = v6;
    id v18 = v7;
    id v19 = v8;
    [v11 unsubscribeFromAlbum:v18 completionBlock:v16];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2;
  v8[3] = &unk_1E6C3C6C8;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v14, a1 + 8);
  id v10 = a1[5];
  id v6 = a1[6];
  id v7 = a1[4];
  id v11 = v6;
  id v12 = v7;
  id v13 = a1[7];
  dispatch_async(v4, v8);

  objc_destroyWeak(&v14);
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishUnsubscribingFromAlbum:v3 info:v4 error:v5];
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) GUID];
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v4 command:0 params:v3 albumGUID:v5 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v13 = objc_loadWeakRetained((id *)(a1 + 72));
        uint64_t v14 = *(void *)(a1 + 48);
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        id v30 = v13;
        __int16 v31 = 2114;
        uint64_t v32 = v14;
        __int16 v33 = 2114;
        uint64_t v34 = v15;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to unsubscribe from album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v6 = [*(id *)(a1 + 56) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_162;
      block[3] = &unk_1E6C3C650;
      objc_copyWeak(&v28, (id *)(a1 + 72));
      id v25 = *(id *)(a1 + 48);
      id v26 = *(id *)(a1 + 64);
      id v27 = *(id *)(a1 + 32);
      dispatch_async(v6, block);

      id v7 = objc_loadWeakRetained((id *)(a1 + 72));
      [v7 workQueueDidFinishCommand];

      objc_destroyWeak(&v28);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 72));
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v30 = v8;
      __int16 v31 = 2114;
      uint64_t v32 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully unsubscribed from album %{public}@", buf, 0x16u);
    }
    id v10 = [*(id *)(a1 + 56) memberQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_163;
    v23[3] = &unk_1E6C3DA38;
    void v23[4] = *(void *)(a1 + 56);
    dispatch_barrier_sync(v10, v23);

    id v11 = [*(id *)(a1 + 56) eventQueue];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2_164;
    id v19 = &unk_1E6C3CB48;
    objc_copyWeak(&v22, (id *)(a1 + 72));
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 64);
    dispatch_async(v11, &v16);

    id v12 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v12, "workQueueDidFinishCommand", v16, v17, v18, v19);

    objc_destroyWeak(&v22);
  }
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_162(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishUnsubscribingFromAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_163(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __60__MSASStateMachine__unsubscribeFromAlbumDisposition_params___block_invoke_2_164(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  id v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishUnsubscribingFromAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:0];
}

- (void)unsubscribeFromAlbum:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MSASStateMachine_unsubscribeFromAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __46__MSASStateMachine_unsubscribeFromAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v2;
    __int16 v14 = 2114;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling unsubscription from album %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"info"];
  }
  id v8 = [*(id *)(a1 + 32) _model];
  id v9 = NSStringFromSelector(sel__unsubscribeFromAlbumDisposition_params_);
  id v10 = [*(id *)(a1 + 32) personID];
  id v11 = [*(id *)(a1 + 40) GUID];
  [v8 enqueueCommand:v9 params:v5 personID:v10 albumGUID:v11 assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_subscribeToAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v8 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    int v12 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_3;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v14 = v7;
    id v15 = v8;
    dispatch_async(v12, block);
  }
  else if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      __int16 v23 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Subscribing to album %{public}@", buf, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self protocol];
    id v10 = [v9 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v10];

    objc_initWeak((id *)buf, self);
    id v11 = [(MSASStateMachine *)self protocol];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke;
    v16[3] = &unk_1E6C3C5C0;
    void v16[4] = self;
    objc_copyWeak(&v19, (id *)buf);
    id v17 = v7;
    id v18 = v8;
    [v11 subscribeToAlbum:v17 completionBlock:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C560;
  id v9 = v3;
  id v5 = v3;
  objc_copyWeak(&v13, a1 + 7);
  id v6 = a1[5];
  id v7 = a1[4];
  id v10 = v6;
  id v11 = v7;
  id v12 = a1[6];
  dispatch_async(v4, block);

  objc_destroyWeak(&v13);
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishSubscribingToAlbum:v3 info:v4 error:v5];
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2(id *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 8);
    id v3 = a1[4];
    uint64_t v4 = [a1[5] GUID];
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:0 params:0 albumGUID:v4 assetCollectionGUID:0];

    if ((v3 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_loadWeakRetained(a1 + 8);
        id v14 = a1[4];
        id v13 = a1[5];
        *(_DWORD *)buf = 138543874;
        id v29 = v12;
        __int16 v30 = 2114;
        id v31 = v13;
        __int16 v32 = 2114;
        id v33 = v14;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to subscribe to album %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v5 = [a1[6] eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_156;
      block[3] = &unk_1E6C3C650;
      objc_copyWeak(&v27, a1 + 8);
      id v24 = a1[5];
      id v25 = a1[7];
      id v26 = a1[4];
      dispatch_async(v5, block);

      id v6 = objc_loadWeakRetained(a1 + 8);
      [v6 workQueueDidFinishCommand];

      objc_destroyWeak(&v27);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v7 = objc_loadWeakRetained(a1 + 8);
      id v8 = a1[5];
      *(_DWORD *)buf = 138543618;
      id v29 = v7;
      __int16 v30 = 2114;
      id v31 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully subscribed to album %{public}@", buf, 0x16u);
    }
    id v9 = [a1[6] memberQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_157;
    v22[3] = &unk_1E6C3DA38;
    v22[4] = a1[6];
    dispatch_barrier_sync(v9, v22);

    id v10 = [a1[6] eventQueue];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2_158;
    id v18 = &unk_1E6C3CB48;
    objc_copyWeak(&v21, a1 + 8);
    id v19 = a1[5];
    id v20 = a1[7];
    dispatch_async(v10, &v15);

    id v11 = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(v11, "workQueueDidFinishCommand", v15, v16, v17, v18);

    objc_destroyWeak(&v21);
  }
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_156(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishSubscribingToAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

uint64_t __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_157(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __56__MSASStateMachine__subscribeToAlbumDisposition_params___block_invoke_2_158(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained daemon];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 personID];
  [v4 didReceiveAuthSuccessForPersonID:v6];

  id v9 = objc_loadWeakRetained(v2);
  id v7 = [v9 delegate];
  id v8 = objc_loadWeakRetained(v2);
  [v7 MSASStateMachine:v8 didFinishSubscribingToAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:0];
}

- (void)subscribeToAlbum:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSASStateMachine_subscribeToAlbum_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __42__MSASStateMachine_subscribeToAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v12 = 138543618;
    uint64_t v13 = v2;
    __int16 v14 = 2114;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling subscription to album %{public}@", (uint8_t *)&v12, 0x16u);
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    [v4 setObject:v6 forKey:@"album"];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    [v5 setObject:v7 forKey:@"info"];
  }
  id v8 = [*(id *)(a1 + 32) _model];
  id v9 = NSStringFromSelector(sel__subscribeToAlbumDisposition_params_);
  id v10 = [*(id *)(a1 + 32) personID];
  id v11 = [*(id *)(a1 + 40) GUID];
  [v8 enqueueCommand:v9 params:v5 personID:v10 albumGUID:v11 assetCollectionGUID:0];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_getAccessControlsDisposition:(int)a3 params:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v8 = [v6 objectForKey:@"info"];
  uint64_t v9 = [v6 objectForKey:@"error"];
  id v10 = (void *)v9;
  if (a3 == 2)
  {
    int v12 = [(MSASStateMachine *)self eventQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2_153;
    v19[3] = &unk_1E6C3D998;
    void v19[4] = self;
    id v20 = v7;
    id v21 = v8;
    dispatch_async(v12, v19);
  }
  else if (!a3)
  {
    if (v9)
    {
      id v11 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D9C0;
      void block[4] = self;
      id v28 = v7;
      id v29 = v8;
      id v30 = v10;
      dispatch_async(v11, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v32 = self;
        __int16 v33 = 2114;
        uint64_t v34 = v7;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Retrieving access controls for album %{public}@", buf, 0x16u);
      }
      uint64_t v13 = [(MSASStateMachine *)self protocol];
      __int16 v14 = [v13 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v14];

      objc_initWeak((id *)buf, self);
      uint64_t v15 = [(MSASStateMachine *)self delegate];
      uint64_t v16 = [v7 GUID];
      id v17 = [v15 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v16 info:v8];

      id v18 = [(MSASStateMachine *)self protocol];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_149;
      v22[3] = &unk_1E6C3C538;
      v22[4] = self;
      objc_copyWeak(&v26, (id *)buf);
      id v23 = v6;
      id v24 = v7;
      id v25 = v8;
      [v18 getSharingInfoForAlbum:v24 albumURLString:v17 completionBlock:v22];

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishGettingAccessControls:0 forAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_149(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C778;
  id v13 = v5;
  id v8 = v5;
  objc_copyWeak(&v19, a1 + 8);
  id v14 = a1[5];
  id v9 = a1[6];
  id v10 = a1[4];
  id v15 = v9;
  id v16 = v10;
  id v17 = a1[7];
  id v18 = v6;
  id v11 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v19);
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2_153(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v2 _canceledError];
  [v6 MSASStateMachine:v2 didFinishGettingAccessControls:0 forAlbum:v3 info:v4 error:v5];
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = NSStringFromSelector(sel__getAccessControlsDisposition_params_);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) GUID];
    LOBYTE(v3) = [WeakRetained workQueueEndCommandWithError:v3 command:v4 params:v5 albumGUID:v6 assetCollectionGUID:0];

    if (v3) {
      return;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      id v23 = v15;
      __int16 v24 = 2114;
      uint64_t v25 = v16;
      __int16 v26 = 2114;
      uint64_t v27 = v17;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve access controls for album %{public}@. Error: %{public}@", buf, 0x20u);
    }
    uint64_t v7 = [*(id *)(a1 + 56) eventQueue];
    id v8 = (id *)block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_150;
    block[3] = &unk_1E6C3C650;
    id v9 = &v21;
    objc_copyWeak(&v21, (id *)(a1 + 80));
    void block[4] = *(id *)(a1 + 48);
    void block[5] = *(id *)(a1 + 64);
    void block[6] = *(id *)(a1 + 32);
    dispatch_async(v7, block);

    id v10 = objc_loadWeakRetained((id *)(a1 + 80));
    [v10 workQueueDidFinishCommand];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v12 = [*(id *)(a1 + 72) count];
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      id v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      __int16 v26 = 2114;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Successfully retrieved %ld access control entries for album %{public}@", buf, 0x20u);
    }
    id v14 = [*(id *)(a1 + 56) eventQueue];
    id v8 = (id *)v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_151;
    v18[3] = &unk_1E6C3C650;
    id v9 = &v19;
    objc_copyWeak(&v19, (id *)(a1 + 80));
    void v18[4] = *(id *)(a1 + 72);
    void v18[5] = *(id *)(a1 + 48);
    v18[6] = *(id *)(a1 + 64);
    dispatch_async(v14, v18);

    id v10 = objc_loadWeakRetained((id *)(a1 + 80));
    [v10 workQueueDidFinishCommand];
  }

  objc_destroyWeak(v9);
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_150(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishGettingAccessControls:0 forAlbum:*(void *)(a1 + 32) info:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

void __57__MSASStateMachine__getAccessControlsDisposition_params___block_invoke_151(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishGettingAccessControls:*(void *)(a1 + 32) forAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:0];
}

- (void)getAccessControlsForAlbums:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSASStateMachine_getAccessControlsForAlbums_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __52__MSASStateMachine_getAccessControlsForAlbums_info___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v2;
    __int16 v27 = 2114;
    uint64_t v28 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling retrieval of ACL for albums %{public}@", buf, 0x16u);
  }
  id v4 = [*(id *)(a1 + 32) _model];
  [v4 beginTransaction];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        id v10 = [MEMORY[0x1E4F1CA60] dictionary];
        id v11 = v10;
        if (v9) {
          [v10 setObject:v9 forKey:@"album"];
        }
        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          [v11 setObject:v12 forKey:@"info"];
        }
        id v13 = [*(id *)(a1 + 32) _model];
        id v14 = NSStringFromSelector(sel__getAccessControlsDisposition_params_);
        id v15 = [*(id *)(a1 + 32) personID];
        uint64_t v16 = [v9 GUID];
        [v13 enqueueCommand:v14 params:v11 personID:v15 albumGUID:v16 assetCollectionGUID:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  uint64_t v17 = [*(id *)(a1 + 32) _model];
  [v17 endTransaction];

  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_didFinishCheckingUpdatesInAlbumsDisposition:(int)a3 params:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"albums"];
  uint64_t v8 = [v6 objectForKey:@"info"];

  if (a3 == 2)
  {
    uint64_t v12 = [(MSASStateMachine *)self eventQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke_2;
    v13[3] = &unk_1E6C3D998;
    void v13[4] = self;
    id v10 = &v14;
    id v14 = v7;
    id v11 = &v15;
    id v15 = v8;
    dispatch_async(v12, v13);

LABEL_7:
    goto LABEL_8;
  }
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      long long v20 = self;
      __int16 v21 = 2048;
      uint64_t v22 = [v7 count];
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Finished checking for updates for %ld albums.", buf, 0x16u);
    }
    id v9 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = &v17;
    id v17 = v7;
    id v11 = &v18;
    id v18 = v8;
    dispatch_async(v9, block);

    [(MSASStateMachine *)self workQueueDidFinishCommand];
    goto LABEL_7;
  }
LABEL_8:
}

void __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishCheckingForUpdatesInAlbums:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

void __72__MSASStateMachine__didFinishCheckingUpdatesInAlbumsDisposition_params___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishCheckingForUpdatesInAlbums:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

- (void)_checkForUpdatesInAlbumDisposition:(int)a3 params:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"resetSync"];
  uint64_t v8 = [v7 BOOLValue];

  id v9 = [(MSASStateMachine *)self _albumForRequestFromParams:v6];
  id v10 = [v6 objectForKey:@"info"];
  id v11 = [v6 objectForKey:@"error"];
  uint64_t v12 = [v6 objectForKey:@"commandWasRequeued"];
  char v13 = [v12 BOOLValue];

  if (a3 == 2)
  {
    id v15 = [(MSASStateMachine *)self eventQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3_146;
    v23[3] = &unk_1E6C3D998;
    void v23[4] = self;
    id v24 = v9;
    id v25 = v10;
    dispatch_async(v15, v23);
  }
  else if (!a3)
  {
    if (v11)
    {
      id v14 = [(MSASStateMachine *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke;
      block[3] = &unk_1E6C3D9C0;
      void block[4] = self;
      id v37 = v9;
      id v38 = v10;
      id v39 = v11;
      dispatch_async(v14, block);

      [(MSASStateMachine *)self workQueueDidFinishCommand];
    }
    else
    {
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__4547;
      void v34[4] = __Block_byref_object_dispose__4548;
      id v35 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:v10];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 138543618;
        *(void *)&location[4] = self;
        __int16 v41 = 2114;
        uint64_t v42 = v9;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Checking for update in album %{public}@", location, 0x16u);
      }
      uint64_t v16 = [(MSASStateMachine *)self protocol];
      id v17 = [v16 stopHandlerBlock];
      [(MSASStateMachine *)self _setStopHandlerBlock:v17];

      if ((v13 & 1) == 0)
      {
        id v18 = [(MSASStateMachine *)self eventQueue];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_140;
        v31[3] = &unk_1E6C3D000;
        v31[4] = self;
        id v32 = v9;
        __int16 v33 = v34;
        dispatch_async(v18, v31);
      }
      objc_initWeak((id *)location, self);
      id v19 = [(MSASStateMachine *)self delegate];
      long long v20 = [v9 GUID];
      __int16 v21 = [v19 MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:v20 info:v10];

      uint64_t v22 = [(MSASStateMachine *)self protocol];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2;
      v26[3] = &unk_1E6C3C510;
      void v26[4] = self;
      objc_copyWeak(&v30, (id *)location);
      id v27 = v6;
      id v28 = v9;
      uint64_t v29 = v34;
      [v22 albumSummaryAlbum:v28 albumURLString:v21 resetSync:v8 completionBlock:v26];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)location);
      _Block_object_dispose(v34, 8);
    }
  }
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) didFinishCheckingForUpdatesInAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_140(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) willCheckForUpdatesInAlbum:*(void *)(a1 + 40) info:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4, char a5, void *a6, void *a7, char a8)
{
  id v14 = a2;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3;
  block[3] = &unk_1E6C3C4E8;
  id v28 = v14;
  id v26 = v14;
  objc_copyWeak(&v36, (id *)(a1 + 64));
  id v29 = *(id *)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 32);
  id v30 = v19;
  uint64_t v31 = v20;
  uint64_t v21 = *(void *)(a1 + 56);
  char v37 = a3;
  id v32 = v16;
  id v33 = v15;
  char v38 = a5;
  char v39 = a8;
  id v34 = v17;
  uint64_t v35 = v21;
  id v22 = v17;
  id v23 = v15;
  id v24 = v16;
  dispatch_async(v18, block);

  objc_destroyWeak(&v36);
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3_146(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachine:*(void *)(a1 + 32) willCheckForUpdatesInAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];

  id v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [v3 _canceledError];
  [v7 MSASStateMachine:v3 didFinishCheckingForUpdatesInAlbum:v4 info:v5 error:v6];
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      id v15 = [*(id *)(a1 + 64) GUID];
      *(_DWORD *)buf = 138543618;
      id v74 = WeakRetained;
      __int16 v75 = 2114;
      uint64_t v76 = (uint64_t)v15;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Finished checking for updates in album %{public}@.", buf, 0x16u);
    }
    if (*(unsigned char *)(a1 + 104))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_loadWeakRetained((id *)(a1 + 96));
        id v17 = [*(id *)(a1 + 64) GUID];
        *(_DWORD *)buf = 138543618;
        id v74 = v16;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v17;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Album %{public}@ was reset synced.", buf, 0x16u);
      }
      id v18 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      id v19 = [*(id *)(a1 + 48) GUID];
      id v20 = (id)[v18 MSASAddIsAlbumResetSyncAlbumGUID:v19];

      id v21 = (id)[*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) MSASAddNotInterestingKey];
    }
    id v22 = [*(id *)(a1 + 56) eventQueue];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_142;
    v64[3] = &unk_1E6C3C498;
    uint64_t v8 = &v67;
    objc_copyWeak(&v67, (id *)(a1 + 96));
    id v23 = *(id *)(a1 + 64);
    uint64_t v24 = *(void *)(a1 + 88);
    id v65 = v23;
    v66[1] = v24;
    v66[0] = *(id *)(a1 + 32);
    dispatch_async(v22, v64);

    if ([*(id *)(a1 + 72) count])
    {
      id v25 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v48 = objc_loadWeakRetained((id *)(a1 + 96));
        uint64_t v49 = [*(id *)(a1 + 72) count];
        uint64_t v50 = [*(id *)(a1 + 64) GUID];
        *(_DWORD *)buf = 138543874;
        id v74 = v48;
        __int16 v75 = 2048;
        uint64_t v76 = v49;
        __int16 v77 = 2114;
        v78 = v50;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Found changes to %lu asset collections in album %{public}@.", buf, 0x20u);
      }
      id v27 = objc_loadWeakRetained((id *)(a1 + 96));
      id v28 = [v27 delegate];
      id v29 = objc_loadWeakRetained((id *)(a1 + 96));
      [v28 MSASStateMachine:v29 didFindAssetCollectionChanges:*(void *)(a1 + 72) forAlbum:*(void *)(a1 + 64) info:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    }
    if (*(unsigned char *)(a1 + 105) && *(void *)(a1 + 64))
    {
      id v30 = MEMORY[0x1E4F14500];
      id v31 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        id v51 = objc_loadWeakRetained((id *)(a1 + 96));
        id v52 = [*(id *)(a1 + 64) GUID];
        *(_DWORD *)buf = 138543618;
        id v74 = v51;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v52;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Found sharing info changes to album %{public}@.", buf, 0x16u);
      }
      id v32 = *(void **)(a1 + 56);
      id v33 = [MEMORY[0x1E4F1C978] arrayWithObject:*(void *)(a1 + 64)];
      [v32 getAccessControlsForAlbums:v33 info:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    }
    if (!_os_feature_enabled_impl()) {
      goto LABEL_30;
    }
    id v34 = [*(id *)(a1 + 64) clientOrgKey];
    if (!v34) {
      goto LABEL_30;
    }
    uint64_t v35 = [*(id *)(a1 + 64) publicURLString];
    if (v35)
    {
    }
    else
    {
      BOOL v36 = *(unsigned char *)(a1 + 106) == 0;

      if (v36)
      {
LABEL_30:
        uint64_t v42 = [*(id *)(a1 + 56) memberQueue];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_143;
        v63[3] = &unk_1E6C3DA38;
        v63[4] = *(void *)(a1 + 56);
        dispatch_barrier_sync(v42, v63);

        uint64_t v43 = [*(id *)(a1 + 56) eventQueue];
        uint64_t v53 = MEMORY[0x1E4F143A8];
        uint64_t v54 = 3221225472;
        id v55 = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2_144;
        long long v56 = &unk_1E6C3C4C0;
        id v57 = *(id *)(a1 + 64);
        id v58 = *(id *)(a1 + 80);
        id v59 = *(id *)(a1 + 48);
        objc_copyWeak(&v62, (id *)(a1 + 96));
        uint64_t v61 = *(void *)(a1 + 88);
        id v60 = *(id *)(a1 + 32);
        dispatch_async(v43, &v53);

        id v44 = objc_loadWeakRetained((id *)(a1 + 96));
        objc_msgSend(v44, "workQueueDidFinishCommand", v53, v54, v55, v56);

        objc_destroyWeak(&v62);
        uint64_t v12 = &v65;
        char v13 = (id *)v66;
        goto LABEL_31;
      }
      char v37 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = objc_loadWeakRetained((id *)(a1 + 96));
        id v40 = [*(id *)(a1 + 64) GUID];
        *(_DWORD *)buf = 138543618;
        id v74 = v39;
        __int16 v75 = 2114;
        uint64_t v76 = (uint64_t)v40;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Album %{public}@ publicURLString needs to be refetched through another albumsummary request now that we have a clientOrgKey for the album.", buf, 0x16u);
      }
      __int16 v41 = *(void **)(a1 + 56);
      uint64_t v72 = *(void *)(a1 + 48);
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
      [v41 checkForUpdatesInAlbums:v34 resetSync:0 info:0];
    }

    goto LABEL_30;
  }
  id v2 = objc_loadWeakRetained((id *)(a1 + 96));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = NSStringFromSelector(sel__checkForUpdatesInAlbumDisposition_params_);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) GUID];
  LOBYTE(v3) = [v2 workQueueEndCommandWithError:v3 command:v4 params:v5 albumGUID:v6 assetCollectionGUID:0];

  if (v3) {
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v45 = objc_loadWeakRetained((id *)(a1 + 96));
    uint64_t v46 = *(void *)(a1 + 48);
    __int16 v47 = [*(id *)(a1 + 32) MSVerboseDescription];
    *(_DWORD *)buf = 138543874;
    id v74 = v45;
    __int16 v75 = 2114;
    uint64_t v76 = v46;
    __int16 v77 = 2114;
    v78 = v47;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not complete checking for updates for album %{public}@. Error: %{public}@", buf, 0x20u);
  }
  id v7 = [*(id *)(a1 + 56) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_141;
  block[3] = &unk_1E6C3C498;
  uint64_t v8 = &v71;
  objc_copyWeak(&v71, (id *)(a1 + 96));
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 88);
  id v69 = v9;
  v70[1] = v10;
  v70[0] = *(id *)(a1 + 32);
  dispatch_async(v7, block);

  id v11 = objc_loadWeakRetained((id *)(a1 + 96));
  [v11 workQueueDidFinishCommand];

  uint64_t v12 = &v69;
  char v13 = (id *)v70;
LABEL_31:

  objc_destroyWeak(v8);
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_141(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishCheckingForUpdatesInAlbum:*(void *)(a1 + 32) info:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:*(void *)(a1 + 40)];
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_142(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138543618;
    id v12 = WeakRetained;
    __int16 v13 = 2114;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Saving album %{public}@.", (uint8_t *)&v11, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = [v4 daemon];
  id v6 = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = [v6 personID];
  [v5 didReceiveAuthSuccessForPersonID:v7];

  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = [v8 delegate];
  id v10 = objc_loadWeakRetained((id *)(a1 + 56));
  [v9 MSASStateMachine:v10 didFindChangesInAlbum:*(void *)(a1 + 32) info:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) error:*(void *)(a1 + 40)];
}

uint64_t __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_143(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __62__MSASStateMachine__checkForUpdatesInAlbumDisposition_params___block_invoke_2_144(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) useForeignCtag];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2)
  {
    [v3 setForeignCtag:v4];
    uint64_t v5 = [*(id *)(a1 + 48) ctag];
    [*(id *)(a1 + 32) setCtag:v5];
  }
  else
  {
    [v3 setCtag:v4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v6 = [WeakRetained delegate];
  id v7 = objc_loadWeakRetained((id *)(a1 + 72));
  [v6 MSASStateMachine:v7 didFinishCheckingForUpdatesInAlbum:*(void *)(a1 + 32) info:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error:*(void *)(a1 + 56)];
}

- (void)checkForUpdatesInAlbums:(id)a3 resetSync:(BOOL)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(MSASStateMachine *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MSASStateMachine_checkForUpdatesInAlbums_resetSync_info___block_invoke;
  v13[3] = &unk_1E6C3D0A8;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __59__MSASStateMachine_checkForUpdatesInAlbums_resetSync_info___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = v2;
    __int16 v34 = 2114;
    uint64_t v35 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling check for updates in albums %{public}@", buf, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) _model];
  [v4 beginTransaction];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        id v10 = [MEMORY[0x1E4F1CA60] dictionary];
        id v11 = v10;
        if (v9) {
          [v10 setObject:v9 forKey:@"album"];
        }
        uint64_t v12 = *(void *)(a1 + 48);
        if (v12) {
          [v11 setObject:v12 forKey:@"info"];
        }
        __int16 v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
        [v11 setObject:v13 forKey:@"resetSync"];

        id v14 = [*(id *)(a1 + 32) _model];
        id v15 = NSStringFromSelector(sel__checkForUpdatesInAlbumDisposition_params_);
        BOOL v16 = [*(id *)(a1 + 32) personID];
        id v17 = [v9 GUID];
        [v14 enqueueCommand:v15 params:v11 personID:v16 albumGUID:v17 assetCollectionGUID:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  id v18 = [MEMORY[0x1E4F1CA60] dictionary];
  id v19 = v18;
  uint64_t v20 = *(void *)(a1 + 40);
  if (v20) {
    [v18 setObject:v20 forKey:@"albums"];
  }
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21) {
    [v19 setObject:v21 forKey:@"info"];
  }
  id v22 = [*(id *)(a1 + 32) _model];
  id v23 = NSStringFromSelector(sel__didFinishCheckingUpdatesInAlbumsDisposition_params_);
  uint64_t v24 = [*(id *)(a1 + 32) personID];
  [v22 enqueueCommand:v23 params:v19 personID:v24 albumGUID:0 assetCollectionGUID:0];

  id v25 = [*(id *)(a1 + 32) _model];
  [v25 endTransaction];

  [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)_checkForChangesDisposition:(int)a3 params:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"info"];
  if (a3 == 2)
  {
    id v14 = [(MSASStateMachine *)self eventQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_3;
    v18[3] = &unk_1E6C3DB28;
    void v18[4] = self;
    id v19 = v7;
    dispatch_async(v14, v18);
  }
  else if (!a3)
  {
    uint64_t v8 = [v6 objectForKey:@"resetSync"];
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      id v10 = [(MSASStateMachine *)self _model];
      [v10 deletePersistentValueWithKey:@"rootCtag"];
    }
    id v11 = [(MSASStateMachine *)self rootCtagToCheckForChanges];
    if (v11
      && ([(MSASStateMachine *)self migrationCtagToCheckForChanges],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {

      id v11 = 0;
      char v13 = 1;
    }
    else
    {
      char v13 = 0;
    }
    id v15 = [(MSASStateMachine *)self protocol];
    BOOL v16 = [v15 stopHandlerBlock];
    [(MSASStateMachine *)self _setStopHandlerBlock:v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 1024;
      int v27 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Checking for album list updates. Reset sync: %d", buf, 0x12u);
    }
    objc_initWeak((id *)buf, self);
    id v17 = [(MSASStateMachine *)self protocol];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke;
    v20[3] = &unk_1E6C3C468;
    v20[4] = self;
    id v21 = v7;
    objc_copyWeak(&v22, (id *)buf);
    char v23 = v13;
    [v17 getChangesRootCtag:v11 migrationCtag:0 completionBlock:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C440;
  id v25 = v13;
  id v26 = *(id *)(a1 + 40);
  id v27 = v14;
  uint64_t v28 = *(void *)(a1 + 32);
  char v33 = a3;
  id v19 = v14;
  id v20 = v13;
  objc_copyWeak(&v32, (id *)(a1 + 48));
  id v29 = v17;
  id v30 = v15;
  id v31 = v16;
  char v34 = *(unsigned char *)(a1 + 56);
  id v21 = v16;
  id v22 = v15;
  id v23 = v17;
  dispatch_async(v18, block);

  objc_destroyWeak(&v32);
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = [v3 _canceledError];
  [v5 MSASStateMachine:v3 didFinishCheckingForChangesInfo:v2 error:v4];
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 40)];
  if (v2)
  {
LABEL_2:
    uint64_t v4 = (id *)(a1 + 88);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    char v6 = [WeakRetained workQueueEndCommandWithError:v2 command:0 params:0 albumGUID:0 assetCollectionGUID:0];

    if ((v6 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v41 = objc_loadWeakRetained((id *)(a1 + 88));
        uint64_t v42 = [v2 MSVerboseDescription];
        *(_DWORD *)buf = 138543618;
        id v65 = v41;
        __int16 v66 = 2114;
        id v67 = v42;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to check for changes. Error: %{public}@", buf, 0x16u);
      }
      uint64_t v7 = [*(id *)(a1 + 56) eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_132;
      block[3] = &unk_1E6C3CB48;
      objc_copyWeak(&v49, v4);
      id v47 = v3;
      id v2 = v2;
      id v48 = v2;
      dispatch_async(v7, block);

      id v8 = objc_loadWeakRetained(v4);
      [v8 workQueueDidFinishCommand];

      objc_destroyWeak(&v49);
    }
    goto LABEL_39;
  }
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 56), "setPendingRootCtag:");
    if (*(unsigned char *)(a1 + 96))
    {
      id v9 = (id)[v3 MSASAddIsGlobalResetSync];
      id v10 = (id)[v3 MSASAddNotInterestingKey];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)(a1 + 88));
        *(_DWORD *)buf = 138543362;
        id v65 = v11;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Global reset sync found.", buf, 0xCu);
      }
      id v12 = objc_loadWeakRetained((id *)(a1 + 88));
      id v13 = [v12 delegate];
      id v14 = objc_loadWeakRetained((id *)(a1 + 88));
      [v13 MSASStateMachineDidFindGlobalResetSync:v14 info:v3];
    }
    id v15 = [*(id *)(a1 + 56) eventQueue];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_123;
    v58[3] = &unk_1E6C3C560;
    objc_copyWeak(&v63, (id *)(a1 + 88));
    id v59 = *(id *)(a1 + 64);
    id v60 = *(id *)(a1 + 72);
    id v61 = *(id *)(a1 + 80);
    id v62 = *(id *)(a1 + 40);
    dispatch_async(v15, v58);

    if (_os_feature_enabled_impl())
    {
      if (*(unsigned char *)(a1 + 97))
      {
        id v16 = [MEMORY[0x1E4F1CA80] set];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v17 = *(id *)(a1 + 64);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v69 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v55 != v19) {
                objc_enumerationMutation(v17);
              }
              uint64_t v21 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              if (([v16 containsObject:v21] & 1) == 0)
              {
                id v22 = [*(id *)(a1 + 56) delegate];
                [v22 refreshContentOfAlbumWithGUID:v21 resetSync:1];

                [v16 addObject:v21];
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v69 count:16];
          }
          while (v18);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v23 = *(id *)(a1 + 80);
        uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v68 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v51 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v27 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              if (([v16 containsObject:v27] & 1) == 0)
              {
                uint64_t v28 = [*(id *)(a1 + 56) delegate];
                [v28 refreshContentOfAlbumWithGUID:v27 resetSync:1];

                [v16 addObject:v27];
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v50 objects:v68 count:16];
          }
          while (v24);
        }
      }
      id v29 = [*(id *)(a1 + 56) delegate];
      [v29 deletePersistentValueWithKey:@"migrationMarker"];
    }
    objc_destroyWeak(&v63);
  }
  else
  {
    char v37 = (void *)MEMORY[0x1E4F28C58];
    id v38 = NSString;
    id v39 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MSAS_SUB_MISSING_FIELD_P_FIELD");
    id v40 = objc_msgSend(v38, "stringWithFormat:", v39, @"rootctag");
    id v2 = [v37 MSErrorWithDomain:@"MSASSubscriberErrorDomain" code:0 description:v40];

    if (v2) {
      goto LABEL_2;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v30 = objc_loadWeakRetained((id *)(a1 + 88));
    *(_DWORD *)buf = 138543362;
    id v65 = v30;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully checked for changes updates.", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v31 = objc_loadWeakRetained((id *)(a1 + 88));
    id v32 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    id v65 = v31;
    __int16 v66 = 2114;
    id v67 = v32;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: New root ctag: %{public}@", buf, 0x16u);
  }
  char v33 = [*(id *)(a1 + 56) memberQueue];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_133;
  v45[3] = &unk_1E6C3DA38;
  v45[4] = *(void *)(a1 + 56);
  dispatch_barrier_sync(v33, v45);

  char v34 = [*(id *)(a1 + 56) eventQueue];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2_134;
  v43[3] = &unk_1E6C3C220;
  uint64_t v35 = (id *)(a1 + 88);
  objc_copyWeak(&v44, v35);
  dispatch_async(v34, v43);

  id v36 = objc_loadWeakRetained(v35);
  [v36 workQueueDidFinishCommand];

  objc_destroyWeak(&v44);
  id v2 = 0;
LABEL_39:
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_123(uint64_t a1)
{
  id v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFindSyncedKeyValueChangesForAlbumGUIDS:*(void *)(a1 + 32) albumChanges:*(void *)(a1 + 40) accessControlChangesForAlbumGUIDS:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_132(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 MSASStateMachine:v4 didFinishCheckingForChangesInfo:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

uint64_t __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_133(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __55__MSASStateMachine__checkForChangesDisposition_params___block_invoke_2_134(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained daemon];
  id v3 = objc_loadWeakRetained(v1);
  id v4 = [v3 personID];
  [v2 didReceiveAuthSuccessForPersonID:v4];
}

- (void)checkForChangesResetSync:(BOOL)a3 info:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine_checkForChangesResetSync_info___block_invoke;
  block[3] = &unk_1E6C3C410;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __50__MSASStateMachine_checkForChangesResetSync_info___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)
    || ([*(id *)(a1 + 32) _model],
        id v16 = objc_claimAutoreleasedReturnValue(),
        NSStringFromSelector(sel__checkForChangesDisposition_params_),
        id v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v16 countOfEnqueuedCommand:v17],
        v17,
        v16,
        v18 < 1))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v2 = *(void *)(a1 + 32);
      int v3 = *(unsigned __int8 *)(a1 + 48);
      int v20 = 138543618;
      uint64_t v21 = v2;
      __int16 v22 = 1024;
      int v23 = v3;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling check for changes. Reset sync: %d", (uint8_t *)&v20, 0x12u);
    }
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    [v4 setObject:v5 forKey:@"resetSync"];

    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      [v4 setObject:v6 forKey:@"info"];
    }
    uint64_t v7 = [*(id *)(a1 + 32) serverSideConfigurationVersion];

    if (!v7)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v20 = 138543362;
        uint64_t v21 = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Scheduling retrieval of server side configuration because we don't have it yet.", (uint8_t *)&v20, 0xCu);
      }
      id v9 = [*(id *)(a1 + 32) _model];
      id v10 = NSStringFromSelector(sel__sendGetServerSideConfigurationDisposition_params_);
      BOOL v11 = [*(id *)(a1 + 32) personID];
      [v9 enqueueCommand:v10 params:0 personID:v11 albumGUID:0 assetCollectionGUID:0];
    }
    id v12 = [*(id *)(a1 + 32) _model];
    id v13 = NSStringFromSelector(sel__checkForChangesDisposition_params_);
    id v14 = [*(id *)(a1 + 32) personID];
    [v12 enqueueCommand:v13 params:v4 personID:v14 albumGUID:0 assetCollectionGUID:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 138543362;
    uint64_t v21 = v19;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Not scheduling another check for changes because there is already one scheduled.", (uint8_t *)&v20, 0xCu);
  }
  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (void)checkForChangesIfMissingRootCtag
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [(MSASStateMachine *)self rootCtagToCheckForChanges];
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v4 = 138543362;
      id v5 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: checking for changes because there is no root ctag.", (uint8_t *)&v4, 0xCu);
    }
    [(MSASStateMachine *)self checkForChangesResetSync:0 info:0];
  }
}

- (id)_assetCollectionFailedError
{
  if (_assetCollectionFailedError_onceToken != -1) {
    dispatch_once(&_assetCollectionFailedError_onceToken, &__block_literal_global_117);
  }
  uint64_t v2 = (void *)_assetCollectionFailedError_error;
  return v2;
}

void __47__MSASStateMachine__assetCollectionFailedError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  int v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_PHOTO_FAILED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:2 description:v3];
  uint64_t v2 = (void *)_assetCollectionFailedError_error;
  _assetCollectionFailedError_error = v1;
}

- (id)_assetCollectionRejectedError
{
  if (_assetCollectionRejectedError_onceToken != -1) {
    dispatch_once(&_assetCollectionRejectedError_onceToken, &__block_literal_global_112);
  }
  uint64_t v2 = (void *)_assetCollectionRejectedError_error;
  return v2;
}

void __49__MSASStateMachine__assetCollectionRejectedError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  int v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_PHOTO_REJECTED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:2 description:v3];
  uint64_t v2 = (void *)_assetCollectionRejectedError_error;
  _assetCollectionRejectedError_error = v1;
}

- (id)_stoppedError
{
  if (_stoppedError_onceToken != -1) {
    dispatch_once(&_stoppedError_onceToken, &__block_literal_global_107);
  }
  uint64_t v2 = (void *)_stoppedError_error;
  return v2;
}

void __33__MSASStateMachine__stoppedError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  int v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_STOPPED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:1 description:v3];
  uint64_t v2 = (void *)_stoppedError_error;
  _stoppedError_error = v1;
}

- (id)_canceledError
{
  if (_canceledError_onceToken != -1) {
    dispatch_once(&_canceledError_onceToken, &__block_literal_global_102);
  }
  uint64_t v2 = (void *)_canceledError_error;
  return v2;
}

void __34__MSASStateMachine__canceledError__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C58];
  int v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_CANCELED");
  uint64_t v1 = [v0 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:0 description:v3];
  uint64_t v2 = (void *)_canceledError_error;
  _canceledError_error = v1;
}

- (void)_getAlbumURLDisposition:(int)a3 params:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"albumGUID"];
  uint64_t v8 = [v6 objectForKey:@"assetCollectionGUID"];
  id v9 = [v6 objectForKey:@"command"];
  id v10 = [v6 objectForKey:@"params"];

  if (a3 == 2)
  {
    id v12 = (void *)[v10 mutableCopy];
    id v13 = [(MSASStateMachine *)self _canceledError];
    [v12 setObject:v13 forKey:@"error"];

    id v14 = [(MSASStateMachine *)self _model];
    id v15 = [(MSASStateMachine *)self personID];
    [v14 enqueueCommandAtHeadOfQueue:v9 params:v12 personID:v15 albumGUID:v7 assetCollectionGUID:v8];
  }
  else if (!a3)
  {
    BOOL v11 = [(MSASStateMachine *)self protocol];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke;
    v16[3] = &unk_1E6C3C3E0;
    void v16[4] = self;
    id v17 = v10;
    id v18 = v9;
    id v19 = v7;
    id v20 = v8;
    [v11 getAlbumURLForAlbumWithGUID:v19 completionBlock:v16];
  }
}

void __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [a1[4] workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3C3B8;
  id v11 = a1[5];
  id v12 = v5;
  id v13 = a1[4];
  id v14 = a1[6];
  id v15 = a1[7];
  id v16 = a1[8];
  id v17 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __51__MSASStateMachine__getAlbumURLDisposition_params___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  int v3 = [NSNumber numberWithBool:1];
  [v2 setObject:v3 forKey:@"commandWasRequeued"];

  uint64_t v5 = *(void *)(a1 + 40);
  int v4 = *(void **)(a1 + 48);
  if (v5)
  {
    if (([v4 workQueueEndCommandWithError:v5 command:0 params:0 albumGUID:0 assetCollectionGUID:0] & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 48) _URLReauthFailureWithUnderlyingError:*(void *)(a1 + 40)];
      [v2 setObject:v6 forKey:@"error"];

      uint64_t v7 = *(void **)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      id v9 = [v7 personID];
      [v7 workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:v8 params:v2 personID:v9 albumGUID:*(void *)(a1 + 64) assetCollectionGUID:*(void *)(a1 + 72)];
    }
  }
  else
  {
    id v10 = [v4 delegate];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 80);
    uint64_t v13 = *(void *)(a1 + 64);
    id v14 = [v2 objectForKey:@"info"];
    [v10 MSASStateMachine:v11 didFindNewURLString:v12 forAlbumWithGUID:v13 info:v14];

    id v15 = [v2 objectForKey:@"album"];
    id v16 = +[MSASAlbum albumWithAlbum:v15];

    if (v16)
    {
      [v16 setURLString:*(void *)(a1 + 80)];
      [v2 setObject:v16 forKey:@"album"];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 48);
        int v22 = 138543362;
        uint64_t v23 = v21;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot retry a command after a URL validation error, because the command does not have an album parameter.", (uint8_t *)&v22, 0xCu);
      }
      id v17 = [*(id *)(a1 + 48) _URLReauthFailureWithUnderlyingError:0];
      [v2 setObject:v17 forKey:@"error"];
    }
    id v18 = *(void **)(a1 + 48);
    uint64_t v19 = *(void *)(a1 + 56);
    id v20 = [v18 personID];
    [v18 workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:v19 params:v2 personID:v20 albumGUID:*(void *)(a1 + 64) assetCollectionGUID:*(void *)(a1 + 72)];
  }
}

- (id)_URLReauthFailureWithUnderlyingError:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  uint64_t v5 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_STATE_CANNOT_REQUEUE_AFTER_URL");
  id v6 = [v3 MSErrorWithDomain:@"MSASStateMachineErrorDomain" code:4 description:v5 underlyingError:v4];

  return v6;
}

- (void)_actionDidFinishWithError:(id)a3 album:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:22])
  {
    int v8 = _os_feature_enabled_impl();
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (!v8)
    {
      if (!v9) {
        goto LABEL_8;
      }
      uint64_t v12 = [v6 MSVerboseDescription];
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered fatal error. Not retrying. Error: %{public}@", buf, 0x16u);
      goto LABEL_6;
    }
    if (v9)
    {
      uint64_t v13 = [v7 GUID];
      id v14 = [v6 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered invalid/missing clientOrgKey error. Fetching new clientOrgKey for album: %{public}@. Not retrying. Error: %{public}@", buf, 0x20u);

      if (!v7) {
        goto LABEL_8;
      }
      goto LABEL_5;
    }
    if (v7)
    {
LABEL_5:
      [v7 setClientOrgKey:0];
      id v10 = [(MSASStateMachine *)self delegate];
      uint64_t v11 = [v7 GUID];
      [v10 setClientOrgKey:0 forAlbumWithGUID:v11];

      id v15 = v7;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
      [(MSASStateMachine *)self checkForUpdatesInAlbums:v12 resetSync:0 info:0];
LABEL_6:
    }
  }
LABEL_8:
}

- (BOOL)workQueueEndCommandWithError:(id)a3 command:(id)a4 params:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v12 MSContainsErrorWithDomain:@"MSASStateMachineErrorDomain" code:0])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v51 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Command was cancelled.", buf, 0xCu);
    }
    [(MSASStateMachine *)self workQueueDidFinishCommandDueToCancellation];
    goto LABEL_17;
  }
  if ([v12 MSContainsErrorWithDomain:@"MSASStateMachineErrorDomain" code:1])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v51 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Command was stopped. Not removing from the command queue.", buf, 0xCu);
    }
    [(MSASStateMachine *)self workQueueDidFinishCommandByLeavingCommandInQueue];
    goto LABEL_17;
  }
  if ([v12 MSIsTemporaryNetworkError])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v51 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered temporary network problems.", buf, 0xCu);
    }
LABEL_16:
    [(MSASStateMachine *)self workQueueDidFailToFinishCommandDueToTemporaryError:v12];
LABEL_17:
    BOOL v18 = 1;
    goto LABEL_18;
  }
  if ([v12 MSIsAuthError])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v41 = [v12 MSVerboseDescription];
      *(_DWORD *)buf = 138543618;
      long long v51 = self;
      __int16 v52 = 2114;
      id v53 = v41;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Received authentication error: %{public}@", buf, 0x16u);
    }
    id v17 = [(MSASStateMachine *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke;
    block[3] = &unk_1E6C3DA38;
    void block[4] = self;
    dispatch_async(v17, block);

    goto LABEL_16;
  }
  if (v13 && [v12 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:18])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = [v12 MSVerboseDescription];
      *(_DWORD *)buf = 138543618;
      long long v51 = self;
      __int16 v52 = 2114;
      id v53 = v42;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered visitor authentication failure. Getting new album URL and retrying command. Error: %{public}@", buf, 0x16u);
    }
    __int16 v20 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v21 = v20;
    if (v15) {
      [v20 setObject:v15 forKey:@"albumGUID"];
    }
    if (v16) {
      [v21 setObject:v16 forKey:@"assetCollectionGUID"];
    }
    [v21 setObject:v13 forKey:@"command"];
    if (v14) {
      [v21 setObject:v14 forKey:@"params"];
    }
    uint64_t v22 = NSStringFromSelector(sel__getAlbumURLDisposition_params_);
    uint64_t v23 = [(MSASStateMachine *)self personID];
    [(MSASStateMachine *)self workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:v22 params:v21 personID:v23 albumGUID:v15 assetCollectionGUID:0];

    goto LABEL_17;
  }
  if ([v12 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:22])
  {
    int v24 = _os_feature_enabled_impl();
    BOOL v25 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v25)
      {
        uint64_t v43 = [v12 MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        long long v51 = self;
        __int16 v52 = 2114;
        id v53 = v15;
        __int16 v54 = 2114;
        long long v55 = v43;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered invalid/missing clientOrgKey error. Fetching new clientOrgKey for album: %{public}@. Not retrying. Error: %{public}@", buf, 0x20u);
      }
      id v26 = [v14 objectForKeyedSubscript:@"album"];
      uint64_t v27 = v26;
      if (v26)
      {
        [v26 setClientOrgKey:0];
        uint64_t v28 = [(MSASStateMachine *)self delegate];
        [v28 setClientOrgKey:0 forAlbumWithGUID:v15];

        id v49 = v27;
        id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
        [(MSASStateMachine *)self checkForUpdatesInAlbums:v29 resetSync:0 info:0];
      }
      goto LABEL_36;
    }
    if (!v25) {
      goto LABEL_50;
    }
LABEL_41:
    uint64_t v27 = [v12 MSVerboseDescription];
    *(_DWORD *)buf = 138543618;
    long long v51 = self;
    __int16 v52 = 2114;
    id v53 = v27;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered fatal error. Not retrying. Error: %{public}@", buf, 0x16u);
LABEL_36:

LABEL_50:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  if ([v12 MSIsFatal])
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_50;
    }
    goto LABEL_41;
  }
  id v30 = [(NSDictionary *)self->_currentCommandParams objectForKey:@"errorCount"];
  int v31 = [v30 intValue];

  uint64_t v32 = (v31 + 1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v44 = [v12 MSVerboseDescription];
    *(_DWORD *)buf = 138543874;
    long long v51 = self;
    __int16 v52 = 2114;
    id v53 = v44;
    __int16 v54 = 1024;
    LODWORD(v55) = v32;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Encountered error: %{public}@. This command has encountered %d errors so far.", buf, 0x1Cu);
  }
  if ((int)v32 >= [(MSASStateMachine *)self maxMetadataRetryCount])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v51 = self;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Giving up.", buf, 0xCu);
    }
    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v51 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying.", buf, 0xCu);
  }
  char v33 = [(MSASStateMachine *)self memberQueue];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_94;
  v47[3] = &unk_1E6C3DA38;
  v47[4] = self;
  dispatch_barrier_sync(v33, v47);

  char v34 = (void *)[(NSDictionary *)self->_currentCommandParams mutableCopy];
  uint64_t v35 = [NSNumber numberWithInt:v32];
  [v34 setObject:v35 forKey:@"errorCount"];

  [(MSASPersonModel *)self->_model setParams:v34 forCommandWithIdentifier:self->_currentCommandID];
  id v36 = [(MSASStateMachine *)self eventQueue];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_2;
  v46[3] = &unk_1E6C3DA38;
  v46[4] = self;
  dispatch_async(v36, v46);

  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlocuint64_t k = self->_stopHandlerBlock;
  self->_stopHandlerBlocuint64_t k = 0;

  BOOL v18 = 1;
  self->_commandState = 1;
  [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
  id v40 = [(MSASStateMachine *)self workQueue];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_3;
  v45[3] = &unk_1E6C3DA38;
  v45[4] = self;
  dispatch_async(v40, v45);

LABEL_18:
  return v18;
}

void __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) daemon];
  uint64_t v2 = [*(id *)(a1 + 32) personID];
  [v3 didReceiveAuthFailureForPersonID:v2];
}

uint64_t __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_94(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) backoff];
}

void __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

uint64_t __94__MSASStateMachine_workQueueEndCommandWithError_command_params_albumGUID_assetCollectionGUID___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueCheckForNextCommand];
}

- (void)workQueueDidFinishCommandDueToCancellation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_commandState != 2) {
    __assert_rtn("-[MSASStateMachine workQueueDidFinishCommandDueToCancellation]", "MSASStateMachine.m", 1176, "_commandState == kMSASCommandStatePerformingCommand");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Command finished because it was cancelled.", buf, 0xCu);
  }
  self->_commandState = 0;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlocuint64_t k = self->_stopHandlerBlock;
  self->_stopHandlerBlocuint64_t k = 0;

  [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
  id v6 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSASStateMachine_workQueueDidFinishCommandDueToCancellation__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v6, block);

  id v7 = [(MSASStateMachine *)self postCommandCompletionBlock];

  if (v7)
  {
    int v8 = [(MSASStateMachine *)self postCommandCompletionBlock];
    [(MSASStateMachine *)self setPostCommandCompletionBlock:0];
    v8[2](v8);
  }
}

void __62__MSASStateMachine_workQueueDidFinishCommandDueToCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

- (void)workQueueDidFinishCommandByLeavingCommandInQueue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_commandState != 2) {
    __assert_rtn("-[MSASStateMachine workQueueDidFinishCommandByLeavingCommandInQueue]", "MSASStateMachine.m", 1155, "_commandState == kMSASCommandStatePerformingCommand");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Leaving command in queue.", buf, 0xCu);
  }
  self->_commandState = 1;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlocuint64_t k = self->_stopHandlerBlock;
  self->_stopHandlerBlocuint64_t k = 0;

  [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
  id v6 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v6, block);

  id v7 = [(MSASStateMachine *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke_2;
  v8[3] = &unk_1E6C3DA38;
  void v8[4] = self;
  dispatch_async(v7, v8);
}

void __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

uint64_t __68__MSASStateMachine_workQueueDidFinishCommandByLeavingCommandInQueue__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) postCommandCompletionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) postCommandCompletionBlock];
    [*(id *)(a1 + 32) setPostCommandCompletionBlock:0];
    v3[2](v3);
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 workQueueCheckForNextCommand];
}

- (void)workQueueDidFailToFinishCommandDueToTemporaryError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_commandState != 2) {
    __assert_rtn("-[MSASStateMachine workQueueDidFailToFinishCommandDueToTemporaryError:]", "MSASStateMachine.m", 1137, "_commandState == kMSASCommandStatePerformingCommand");
  }
  uint64_t v5 = v4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v5 MSVerboseDescription];
    *(_DWORD *)buf = 138543618;
    id v15 = self;
    __int16 v16 = 2114;
    id v17 = v12;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Encountered temporary error. Will retry later. Error: %{public}@", buf, 0x16u);
  }
  self->_commandState = 1;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlocuint64_t k = self->_stopHandlerBlock;
  self->_stopHandlerBlocuint64_t k = 0;

  [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
  BOOL v9 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MSASStateMachine_workQueueDidFailToFinishCommandDueToTemporaryError___block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v9, block);

  id v10 = [(MSASStateMachine *)self postCommandCompletionBlock];

  if (v10)
  {
    uint64_t v11 = [(MSASStateMachine *)self postCommandCompletionBlock];
    [(MSASStateMachine *)self setPostCommandCompletionBlock:0];
    v11[2](v11);
  }
}

void __71__MSASStateMachine_workQueueDidFailToFinishCommandDueToTemporaryError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

- (void)workQueueDidFinishCommandByReplacingCurrentCommandWithCommand:(id)a3 params:(id)a4 personID:(id)a5 albumGUID:(id)a6 assetCollectionGUID:(id)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    char v37 = self;
    __int16 v38 = 2114;
    id v39 = v12;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Command will be replaced by command: %{public}@", buf, 0x16u);
  }
  id v17 = [(MSASModelBase *)self->_model dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke;
  block[3] = &unk_1E6C3D3A8;
  void block[4] = self;
  id v31 = v12;
  id v32 = v13;
  id v33 = v14;
  id v34 = v15;
  id v35 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_barrier_sync(v17, block);

  self->_commandState = 1;
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlocuint64_t k = self->_stopHandlerBlock;
  self->_stopHandlerBlocuint64_t k = 0;

  [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
  id v26 = [(MSASStateMachine *)self eventQueue];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_2;
  v29[3] = &unk_1E6C3DA38;
  v29[4] = self;
  dispatch_async(v26, v29);

  uint64_t v27 = [(MSASStateMachine *)self workQueue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  id v28[2] = __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_3;
  v28[3] = &unk_1E6C3DA38;
  void v28[4] = self;
  dispatch_async(v27, v28);
}

uint64_t __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) dbQueueBeginTransaction];
  [*(id *)(a1[4] + 16) dbQueueRemoveCommandIdentifier:*(void *)(a1[4] + 32)];
  [*(id *)(a1[4] + 16) dbQueueEnqueueCommand:a1[5] params:a1[6] personID:a1[7] albumGUID:a1[8] assetCollectionGUID:a1[9] sequenceNumber:*(void *)(a1[4] + 32)];
  uint64_t v2 = *(void **)(a1[4] + 16);
  return [v2 dbQueueEndTransaction];
}

void __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

uint64_t __128__MSASStateMachine_workQueueDidFinishCommandByReplacingCurrentCommandWithCommand_params_personID_albumGUID_assetCollectionGUID___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) postCommandCompletionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) postCommandCompletionBlock];
    [*(id *)(a1 + 32) setPostCommandCompletionBlock:0];
    v3[2](v3);
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 workQueueCheckForNextCommand];
}

- (void)workQueueDidFinishCommand
{
  if (self->_commandState != 2) {
    __assert_rtn("-[MSASStateMachine workQueueDidFinishCommand]", "MSASStateMachine.m", 1079, "_commandState == kMSASCommandStatePerformingCommand");
  }
  self->_commandState = 1;
  id v3 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);

  [(MSASPersonModel *)self->_model removeCommandIdentifier:self->_currentCommandID];
  currentCommandParams = self->_currentCommandParams;
  self->_currentCommandParams = 0;

  currentCommand = self->_currentCommand;
  self->_currentCommand = 0;

  stopHandlerBlocuint64_t k = self->_stopHandlerBlock;
  self->_stopHandlerBlocuint64_t k = 0;

  [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
  id v7 = [(MSASStateMachine *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke_2;
  v8[3] = &unk_1E6C3DA38;
  void v8[4] = self;
  dispatch_async(v7, v8);
}

void __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

uint64_t __45__MSASStateMachine_workQueueDidFinishCommand__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) postCommandCompletionBlock];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) postCommandCompletionBlock];
    [*(id *)(a1 + 32) setPostCommandCompletionBlock:0];
    v3[2](v3);
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 workQueueCheckForNextCommand];
}

- (void)workQueuePerformNextCommand
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (![(MSASStateMachine *)self hasShutDown])
  {
    model = self->_model;
    id v35 = 0;
    id v36 = 0;
    uint64_t v5 = [(MSASPersonModel *)model commandAtHeadOfQueueOutParams:&v36 outCommandIdentifier:&self->_currentCommandID outPersonID:&v35 outAlbumGUID:0 outAssetCollectionGUID:0];
    id v6 = v36;
    id v3 = v36;
    id v7 = v35;
    objc_storeStrong((id *)&self->_currentCommand, v5);
    objc_storeStrong((id *)&self->_currentCommandParams, v6);
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = self;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: No more commands to perform.", buf, 0xCu);
      }
      id v17 = [(MSASStateMachine *)self eventQueue];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_82;
      v34[3] = &unk_1E6C3DA38;
      void v34[4] = self;
      dispatch_async(v17, v34);

      currentCommandParams = self->_currentCommandParams;
      self->_currentCommandParams = 0;

      currentCommand = self->_currentCommand;
      self->_currentCommand = 0;

      self->_commandState = 0;
      goto LABEL_23;
    }
    if (v7)
    {
      int v8 = MSASPlatform();
      char v9 = objc_opt_respondsToSelector();

      id v10 = MSASPlatform();
      uint64_t v11 = v10;
      if (v9)
      {
        char v12 = [v10 personIDEnabledForAlbumSharing:v7];

        if ((v12 & 1) == 0)
        {
LABEL_9:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v39 = self;
            __int16 v40 = 2114;
            id v41 = v7;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Retrieved command for personID %{public}@, but Shared Photo Stream has been disabled. Skipping.", buf, 0x16u);
          }
          [(MSASPersonModel *)self->_model removeCommandIdentifier:self->_currentCommandID];
          self->_commandState = 1;
          id v13 = [(MSASStateMachine *)self eventQueue];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_85;
          v33[3] = &unk_1E6C3DA38;
          v33[4] = self;
          dispatch_async(v13, v33);

          [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
          id v14 = [(MSASStateMachine *)self workQueue];
          id v15 = v14;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2;
          v32[3] = &unk_1E6C3DA38;
          void v32[4] = self;
          id v16 = v32;
          goto LABEL_22;
        }
      }
      else
      {
        id v20 = [v10 personIDsEnabledForAlbumSharing];
        char v21 = [v20 containsObject:v7];

        if ((v21 & 1) == 0) {
          goto LABEL_9;
        }
      }
    }
    SEL v22 = NSSelectorFromString((NSString *)v5);
    if (v22)
    {
      uint64_t v23 = v22;
      if (objc_opt_respondsToSelector())
      {
        int v24 = [(NSDictionary *)self->_currentCommandParams objectForKey:@"commandRetryCount"];
        int v25 = [v24 intValue];

        uint64_t v26 = (v25 + 1);
        uint64_t v27 = (void *)[(NSDictionary *)self->_currentCommandParams mutableCopy];
        uint64_t v28 = [NSNumber numberWithInt:v26];
        [v27 setObject:v28 forKey:@"commandRetryCount"];

        [(MSASPersonModel *)self->_model setParams:v27 forCommandWithIdentifier:self->_currentCommandID];
        objc_msgSend(self, v23, 0, v27);

LABEL_23:
        goto LABEL_24;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v39 = self;
      __int16 v40 = 2114;
      id v41 = v5;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unknown command: %{public}@. Skipping.", buf, 0x16u);
    }
    [(MSASPersonModel *)self->_model removeCommandIdentifier:self->_currentCommandID];
    self->_commandState = 1;
    id v29 = [(MSASStateMachine *)self eventQueue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_86;
    v31[3] = &unk_1E6C3DA38;
    v31[4] = self;
    dispatch_async(v29, v31);

    [(MSASStateMachine *)self workQueueUpdateNextActivityDate];
    id v14 = [(MSASStateMachine *)self workQueue];
    id v15 = v14;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2_87;
    v30[3] = &unk_1E6C3DA38;
    v30[4] = self;
    id v16 = v30;
LABEL_22:
    dispatch_async(v14, v16);

    goto LABEL_23;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v39 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Not performing any more commands because we're shutting down.", buf, 0xCu);
  }
  id v3 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
LABEL_24:
}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_82(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_85(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

uint64_t __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueCheckForNextCommand];
}

void __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained releaseBusy];
}

uint64_t __47__MSASStateMachine_workQueuePerformNextCommand__block_invoke_2_87(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueCheckForNextCommand];
}

- (void)workQueueCheckForNextCommand
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_commandState <= 1u)
  {
    if ([(MSASStateMachine *)self hasShutDown])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = self;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Not checking for any commands because we're shutting down.", (uint8_t *)&buf, 0xCu);
      }
      return;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x3032000000;
    char v21 = __Block_byref_object_copy__4547;
    SEL v22 = __Block_byref_object_dispose__4548;
    id v23 = 0;
    id v3 = [(MSASStateMachine *)self memberQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke;
    block[3] = &unk_1E6C3DA60;
    void block[4] = self;
    void block[5] = &buf;
    dispatch_sync(v3, block);

    id v4 = *(void **)(*((void *)&buf + 1) + 40);
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    LODWORD(v4) = [v4 compare:v5] == 1;

    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)id v15 = 138543618;
        id v16 = self;
        __int16 v17 = 2114;
        uint64_t v18 = v6;
        id v7 = MEMORY[0x1E4F14500];
        int v8 = "%{public}@: Holding off until %{public}@ before performing next command.";
        uint32_t v9 = 22;
LABEL_12:
        _os_log_impl(&dword_1DC434000, v7, OS_LOG_TYPE_DEFAULT, v8, v15, v9);
      }
    }
    else
    {
      id v10 = MSASPlatform();
      int v11 = [v10 MSASIsAllowedToTransferMetadata];

      if (v11)
      {
        char v12 = [(MSASStateMachine *)self eventQueue];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke_81;
        v13[3] = &unk_1E6C3DA38;
        void v13[4] = self;
        dispatch_async(v12, v13);

        self->_commandState = 2;
        [(MSASStateMachine *)self workQueuePerformNextCommand];
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v15 = 138543362;
        id v16 = self;
        id v7 = MEMORY[0x1E4F14500];
        int v8 = "%{public}@: Not allowed to transfer metadata at this time. Try again later.";
        uint32_t v9 = 12;
        goto LABEL_12;
      }
    }
    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) nextExpiryDate];
  return MEMORY[0x1F41817F8]();
}

void __48__MSASStateMachine_workQueueCheckForNextCommand__block_invoke_81(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained retainBusy];
}

- (void)workQueueRetryOutstandingActivities
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (![(MSASStateMachine *)self isRetryingOutstandingActivities])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v3 = 138543362;
      id v4 = self;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrying outstanding activities.", (uint8_t *)&v3, 0xCu);
    }
    [(MSASStateMachine *)self setIsRetryingOutstandingActivities:1];
    [(MSASStateMachine *)self workQueueCheckForNextCommand];
    [(MSASAssetTransferer *)self->_assetUploader retryOutstandingActivities];
    [(MSASAssetTransferer *)self->_assetDownloader retryOutstandingActivities];
    [(MSASStateMachine *)self setIsRetryingOutstandingActivities:0];
  }
}

- (void)retryOutstandingActivities
{
  int v3 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MSASStateMachine_retryOutstandingActivities__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __46__MSASStateMachine_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueRetryOutstandingActivities];
}

- (BOOL)hasEnqueuedActivities
{
  int v3 = [(MSASStateMachine *)self _model];
  if ([v3 countOfEnqueuedCommands] <= 0)
  {
    uint64_t v5 = [(MSASStateMachine *)self _model];
    if ((int)[v5 assetCollectionsInUploadQueue] <= 0)
    {
      uint64_t v6 = [(MSASStateMachine *)self _model];
      char v4 = [v6 hasItemsForDownloadCountFocusAlbumGUID:0 focusAssetCollectionGUID:0];
    }
    else
    {
      char v4 = 1;
    }
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isInRetryState
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(MSASStateMachine *)self memberQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__MSASStateMachine_isInRetryState__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __34__MSASStateMachine_isInRetryState__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 8) == 1;
  return result;
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MSASStateMachine_setPersistentObject_forKey___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __47__MSASStateMachine_setPersistentObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _model];
  [v2 setPersistentObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)persistentObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self _model];
  id v6 = [v5 persistentObjectForKey:v4];

  return v6;
}

- (void)MSBackoffManagerDidUpdateNextExpiryDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v2 = [*(id *)(a1 + 32) memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_2;
  block[3] = &unk_1E6C3D000;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = &v13;
  dispatch_sync(v2, block);

  if (*((unsigned char *)v14 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v18 = v6;
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Updated backoff time for backoff manager %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) workQueueUpdateNextActivityDate];
  }
  uint64_t v5 = [*(id *)(a1 + 32) eventQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_80;
  v8[3] = &unk_1E6C3DA38;
  void v8[4] = *(void *)(a1 + 32);
  dispatch_async(v5, v8);

  _Block_object_dispose(&v13, 8);
}

void __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != *(void *)(v3 + 64))
  {
    if (v2 != *(void *)(v3 + 56))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543618;
        uint64_t v19 = v3;
        __int16 v20 = 2114;
        uint64_t v21 = v2;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Received event for unknown backoff manager %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      return;
    }
    id v17 = (id)[*(id *)(a1 + 32) copyParameters];
    uint64_t v12 = [*(id *)(a1 + 40) metadataBackoffManagerParameters];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      id v14 = [*(id *)(a1 + 40) metadataBackoffManagerParameters];
      char v15 = [v14 isEqualToDictionary:v17];

      if (v15) {
        goto LABEL_11;
      }
    }
    [*(id *)(a1 + 40) setMetadataBackoffManagerParameters:v17];
    uint64_t v16 = *(void *)(a1 + 40);
    id v9 = *(void **)(v16 + 16);
    uint64_t v10 = *(void *)(v16 + 56);
    uint64_t v11 = @"metadataBackoffManager";
LABEL_13:
    [v9 setPersistentObject:v10 forKey:v11];
    goto LABEL_14;
  }
  id v17 = (id)[*(id *)(a1 + 32) copyParameters];
  uint64_t v4 = [*(id *)(a1 + 40) MMCSBackoffManagerParameters];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        [*(id *)(a1 + 40) MMCSBackoffManagerParameters],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToDictionary:v17],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [*(id *)(a1 + 40) setMMCSBackoffManagerParameters:v17];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = *(void **)(v8 + 16);
    uint64_t v10 = *(void *)(v8 + 64);
    uint64_t v11 = @"MMCSBackoffManager";
    goto LABEL_13;
  }
LABEL_11:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_14:
}

void __60__MSASStateMachine_MSBackoffManagerDidUpdateNextExpiryDate___block_invoke_80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachineDidUpdateServerCommunicationBackoffDate:*(void *)(a1 + 32)];
}

- (void)workQueueUpdateNextActivityDate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSASStateMachine *)self latestNextActivityDate];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543618;
    id v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = v3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Computed next activity date: %{public}@", buf, 0x16u);
  }
  uint64_t v4 = [(MSASStateMachine *)self eventQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MSASStateMachine_workQueueUpdateNextActivityDate__block_invoke;
  v6[3] = &unk_1E6C3DB28;
  void v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __51__MSASStateMachine_workQueueUpdateNextActivityDate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  [WeakRetained setNextActivityDate:*(void *)(a1 + 40) forPersonID:*(void *)(*(void *)(a1 + 32) + 104)];
}

- (id)serverCommunicationBackoffDate
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__4547;
  uint64_t v21 = __Block_byref_object_dispose__4548;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4547;
  char v15 = __Block_byref_object_dispose__4548;
  id v16 = 0;
  uint64_t v3 = [(MSASStateMachine *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine_serverCommunicationBackoffDate__block_invoke;
  block[3] = &unk_1E6C3C358;
  void block[4] = self;
  void block[5] = &v17;
  void block[6] = &v11;
  dispatch_sync(v3, block);

  id v4 = (id)v18[5];
  id v5 = (void *)v12[5];
  if (v5)
  {
    if (v4)
    {
      id v6 = [v5 earlierDate:v4];

      if (v6 != v4) {
        goto LABEL_6;
      }
      id v5 = (void *)v12[5];
    }
    id v7 = v5;

    id v4 = v7;
  }
LABEL_6:
  id v8 = v4;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

uint64_t __50__MSASStateMachine_serverCommunicationBackoffDate__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) nextExpiryDate];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 64) nextExpiryDate];
  return MEMORY[0x1F41817F8]();
}

- (id)latestNextActivityDate
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__4547;
  id v22 = __Block_byref_object_dispose__4548;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__4547;
  id v16 = __Block_byref_object_dispose__4548;
  id v17 = 0;
  uint64_t v3 = [(MSASStateMachine *)self memberQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MSASStateMachine_latestNextActivityDate__block_invoke;
  block[3] = &unk_1E6C3C358;
  void block[4] = self;
  void block[5] = &v18;
  void block[6] = &v12;
  dispatch_sync(v3, block);

  if ([(MSASPersonModel *)self->_model countOfEnqueuedCommands] < 1) {
    id v4 = 0;
  }
  else {
    id v4 = (void *)v19[5];
  }
  id v5 = v4;
  if ([(MSASPersonModel *)self->_model assetsInDownloadQueue]
    || [(MSASPersonModel *)self->_model assetCollectionsInUploadQueue])
  {
    id v6 = (id)v13[5];
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v7 = v5;
    id v8 = v7;
    if (!v6 || v7)
    {
      if (v6 && v7 && [v6 compare:v7] == 1)
      {
        id v6 = v6;

        id v8 = v6;
      }
    }
    else
    {
      id v6 = v6;
      id v8 = v6;
    }
  }
  else
  {
    id v8 = v5;
    id v6 = 0;
  }
  id v9 = v8;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v9;
}

uint64_t __42__MSASStateMachine_latestNextActivityDate__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) nextExpiryDate];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 64) nextExpiryDate];
  return MEMORY[0x1F41817F8]();
}

- (void)_sendGetServerSideConfigurationDisposition:(int)a3 params:(id)a4
{
  if (!a3)
  {
    v8[7] = v4;
    v8[8] = v5;
    id v7 = [(MSASStateMachine *)self protocol];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke;
    v8[3] = &unk_1E6C3C330;
    void v8[4] = self;
    [v7 getServerSideConfigCompletionBlock:v8];
  }
}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2(id *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  id v2 = a1[5];
  if (v3)
  {
    if ([v2 workQueueEndCommandWithError:v3 command:0 params:0 albumGUID:0 assetCollectionGUID:0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v4 = a1[5];
        id v5 = [a1[4] MSVerboseDescription];
        *(_DWORD *)long long buf = 138543618;
        id v30 = v4;
        __int16 v31 = 2114;
        id v32 = v5;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve server-side configuration. Error: %{public}@", buf, 0x16u);
      }
    }
    else
    {
      id v21 = a1[5];
      [v21 workQueueDidFinishCommand];
    }
  }
  else
  {
    id v6 = [v2 memberQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_74;
    block[3] = &unk_1E6C3DA38;
    void block[4] = a1[5];
    dispatch_barrier_sync(v6, block);

    id v7 = [a1[5] eventQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    id v27[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_75;
    v27[3] = &unk_1E6C3DA38;
    void v27[4] = a1[5];
    dispatch_async(v7, v27);

    uint64_t v8 = [a1[6] objectForKey:@"com.apple.sharedstreams.config.configVersion"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      id v9 = a1[5];
      *(_DWORD *)long long buf = 138543618;
      id v30 = v9;
      __int16 v31 = 2114;
      id v32 = v8;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Retrieved server-side config version: %{public}@", buf, 0x16u);
    }
    id v10 = [a1[5] _model];
    uint64_t v11 = [v10 dbQueue];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_76;
    v23[3] = &unk_1E6C3D998;
    id v24 = v10;
    id v12 = v8;
    id v25 = v12;
    id v26 = a1[6];
    id v13 = v10;
    dispatch_barrier_sync(v11, v23);

    uint64_t v14 = [a1[5] _serverSideConfigDictionaryByApplyingDefaultsToDictionary:a1[6]];
    char v15 = a1[5];
    id v16 = (void *)v15[15];
    v15[15] = v14;

    id v17 = a1[5];
    uint64_t v18 = (void *)v17[16];
    v17[16] = v12;
    id v19 = v12;

    uint64_t v20 = [a1[5] eventQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_77;
    v22[3] = &unk_1E6C3DA38;
    v22[4] = a1[5];
    dispatch_async(v20, v22);

    [a1[5] workQueueDidFinishCommand];
  }
}

uint64_t __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_74(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) reset];
}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_75(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) daemon];
  id v2 = [*(id *)(a1 + 32) personID];
  [v3 didReceiveAuthSuccessForPersonID:v2];
}

uint64_t __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_76(uint64_t a1)
{
  [*(id *)(a1 + 32) dbQueueBeginTransaction];
  [*(id *)(a1 + 32) dbQueueSetPersistentString:*(void *)(a1 + 40) forKey:@"serverSideConfigVersion"];
  [*(id *)(a1 + 32) dbQueueSetPersistentObject:*(void *)(a1 + 48) forKey:@"serverSideConfig"];
  id v2 = *(void **)(a1 + 32);
  return [v2 dbQueueEndTransaction];
}

void __70__MSASStateMachine__sendGetServerSideConfigurationDisposition_params___block_invoke_2_77(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) daemon];
  id v2 = [*(id *)(a1 + 32) personID];
  [v3 sendServerSideConfigurationDidChangeNotificationForPersonID:v2];
}

- (void)workQueueRefreshServerSideConfig
{
  id v5 = [(MSASStateMachine *)self _model];
  id v3 = NSStringFromSelector(sel__sendGetServerSideConfigurationDisposition_params_);
  id v4 = [(MSASStateMachine *)self personID];
  [v5 enqueueCommand:v3 params:0 personID:v4 albumGUID:0 assetCollectionGUID:0];
}

- (void)refreshServerSideConfig
{
  id v3 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MSASStateMachine_refreshServerSideConfig__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __43__MSASStateMachine_refreshServerSideConfig__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueRefreshServerSideConfig];
}

- (void)serverSideQueueSetServerSideConfiguration:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MSASStateMachine *)self _serverSideConfigDictionaryByApplyingDefaultsToDictionary:v4];
  serverSideConfiguratiouint64_t n = self->_serverSideConfiguration;
  self->_serverSideConfiguratiouint64_t n = v5;

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v7 = self->_serverSideConfiguration;
    *(_DWORD *)long long buf = 138543874;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting server-side configuration.\nOriginal server config: %{public}@\nAfter applying defaults: %{public}@", buf, 0x20u);
  }
  uint64_t v8 = [(MSASStateMachine *)self _model];
  [v8 setPersistentObject:v4 forKey:@"serverSideConfig"];

  id v9 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSASStateMachine_serverSideQueueSetServerSideConfiguration___block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v9, block);
}

void __62__MSASStateMachine_serverSideQueueSetServerSideConfiguration___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) daemon];
  id v2 = [*(id *)(a1 + 32) personID];
  [v3 sendServerSideConfigurationDidChangeNotificationForPersonID:v2];
}

- (void)setServerSideConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASStateMachine *)self serverSideConfigQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__MSASStateMachine_setServerSideConfiguration___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __47__MSASStateMachine_setServerSideConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) serverSideQueueSetServerSideConfiguration:*(void *)(a1 + 40)];
}

- (id)serverSideQueueServerSideConfiguration
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  serverSideConfiguratiouint64_t n = self->_serverSideConfiguration;
  if (!serverSideConfiguration)
  {
    id v4 = [(MSASStateMachine *)self _model];
    id v5 = [v4 persistentObjectForKey:@"serverSideConfig"];

    if (!v5)
    {
      serverSideConfigurationVersiouint64_t n = self->_serverSideConfigurationVersion;
      self->_serverSideConfigurationVersiouint64_t n = 0;
    }
    id v7 = [(MSASStateMachine *)self _serverSideConfigDictionaryByApplyingDefaultsToDictionary:v5];
    id v8 = self->_serverSideConfiguration;
    self->_serverSideConfiguratiouint64_t n = v7;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      __int16 v13 = self->_serverSideConfiguration;
      int v14 = 138543874;
      __int16 v15 = self;
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      __int16 v18 = 2114;
      id v19 = v13;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Reading persisted server-side config from disk.\nRaw config: %{public}@\nAfter applying defaults: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    id v9 = [(MSASStateMachine *)self _model];
    id v10 = [v9 persistentStringForKey:@"serverSideConfigVersion"];
    uint64_t v11 = self->_serverSideConfigurationVersion;
    self->_serverSideConfigurationVersiouint64_t n = v10;

    serverSideConfiguratiouint64_t n = self->_serverSideConfiguration;
  }
  return serverSideConfiguration;
}

- (NSString)serverSideConfigurationVersion
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4547;
  uint64_t v11 = __Block_byref_object_dispose__4548;
  id v12 = 0;
  id v3 = [(MSASStateMachine *)self serverSideConfigQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MSASStateMachine_serverSideConfigurationVersion__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __50__MSASStateMachine_serverSideConfigurationVersion__block_invoke(uint64_t a1)
{
}

- (NSDictionary)serverSideConfiguration
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4547;
  uint64_t v11 = __Block_byref_object_dispose__4548;
  id v12 = 0;
  id v3 = [(MSASStateMachine *)self serverSideConfigQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MSASStateMachine_serverSideConfiguration__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

uint64_t __43__MSASStateMachine_serverSideConfiguration__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) serverSideQueueServerSideConfiguration];
  return MEMORY[0x1F41817F8]();
}

- (id)_serverSideConfigDictionaryByApplyingDefaultsToDictionary:(id)a3
{
  uint64_t v3 = _serverSideConfigDictionaryByApplyingDefaultsToDictionary__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_serverSideConfigDictionaryByApplyingDefaultsToDictionary__onceToken, &__block_literal_global_4657);
  }
  id v5 = (void *)[(id)_serverSideConfigDictionaryByApplyingDefaultsToDictionary__defaults mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  return v5;
}

void __78__MSASStateMachine__serverSideConfigDictionaryByApplyingDefaultsToDictionary___block_invoke()
{
  id v12 = (void *)MEMORY[0x1E4F1C9E8];
  __int16 v13 = [NSNumber numberWithInt:3];
  v0 = [NSNumber numberWithInt:3];
  uint64_t v1 = [NSNumber numberWithInt:3];
  id v2 = [NSNumber numberWithInt:10];
  uint64_t v3 = [NSNumber numberWithInt:6];
  id v4 = [NSNumber numberWithBool:1];
  id v5 = [NSNumber numberWithInt:60];
  id v6 = [NSNumber numberWithDouble:60.0];
  uint64_t v7 = [NSNumber numberWithDouble:600.0];
  id v8 = [NSNumber numberWithDouble:1800.0];
  uint64_t v9 = [NSNumber numberWithInt:1200];
  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, @"com.apple.sharedstreams.config.maxNumRetriesOnFailure.server", v0, @"com.apple.sharedstreams.config.maxNumRetriesOnFailure.network", v1, @"com.apple.sharedstreams.config.maxNumRetriesOnFailure.content", v2, @"com.apple.sharedstreams.config.maxUploadAssetBatchSize", v3, @"mme.sharedstreams.client.downloadMMCSBatchSize", @"1536:2048:2560", @"com.apple.sharedstreams.config.dimensions.preview", @"256:332:455", @"com.apple.sharedstreams.config.dimensions.thumbnail", v4, @"com.apple.sharedstreams.config.switch.3G", v5,
    @"com.apple.sharedstreams.config.defaultRetryAfterInSeconds",
    v6,
    @"com.apple.sharedstreams.config.maxActiveTimeAfterPush",
    v7,
    @"com.apple.sharedstreams.config.maxActiveTimeAfterLossOfForeground",
    v8,
    @"com.apple.sharedstreams.config.maxActiveTimeAfterGlobalResetSync",
    v9,
    @"com.apple.sharedstreams.config.maxMMCSTokenValidity",
  uint64_t v10 = 0);
  uint64_t v11 = (void *)_serverSideConfigDictionaryByApplyingDefaultsToDictionary__defaults;
  _serverSideConfigDictionaryByApplyingDefaultsToDictionary__defaults = v10;
}

- (void)_cancelOutstandingCommandsDisposition:(int)a3 params:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 objectForKey:@"albumGUID"];
  id v8 = [v6 objectForKey:@"assetCollectionGUID"];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    uint64_t v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling outstanding operations for album GUID %{public}@, asset collection GUID %{public}@.", buf, 0x20u);
  }
  uint64_t v9 = [(MSASStateMachine *)self _assetUploader];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke;
  v12[3] = &unk_1E6C3D0F8;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  int v15 = a3;
  id v10 = v8;
  id v11 = v7;
  [v9 stopCompletionBlock:v12];
}

void __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _assetDownloader];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_2;
  v4[3] = &unk_1E6C3D0F8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  int v7 = *(_DWORD *)(a1 + 56);
  [v2 stopCompletionBlock:v4];
}

void __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_3;
  v4[3] = &unk_1E6C3D0F8;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  int v7 = *(_DWORD *)(a1 + 56);
  dispatch_async(v2, v4);
}

void __65__MSASStateMachine__cancelOutstandingCommandsDisposition_params___block_invoke_3(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v41 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v58 = v41;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing upload items...", buf, 0xCu);
  }
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) _model];
  id v4 = [v3 itemsForUpload];

  id obj = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v46 = *(void *)v52;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v52 != v46) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
        uint64_t v9 = (void *)MEMORY[0x1E019E3B0]();
        id v10 = [v8 object];
        id v11 = [v8 album];
        id v12 = v11;
        uint64_t v13 = *(void *)(a1 + 48);
        if (*(void *)(a1 + 40))
        {
          id v14 = [v11 GUID];
          char v15 = [v14 isEqualToString:*(void *)(a1 + 40)];
          char v16 = v15;
          if (!v13)
          {

            if ((v16 & 1) == 0) {
              goto LABEL_19;
            }
LABEL_17:
            [v2 addObject:v10];
            goto LABEL_19;
          }
          if (v15)
          {
            uint64_t v17 = [v10 GUID];
            char v18 = [v17 isEqualToString:*(void *)(a1 + 48)];

            if (v18) {
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        else
        {
          if (!v13) {
            goto LABEL_17;
          }
          id v19 = [v10 GUID];
          int v20 = [v19 isEqualToString:*(void *)(a1 + 48)];

          if (v20) {
            goto LABEL_17;
          }
        }
LABEL_19:
        if ((unint64_t)[v2 count] >= 0x15)
        {
          id v21 = [*(id *)(a1 + 32) _assetUploader];
          [v21 unregisterAssetCollections:v2];

          uint64_t v22 = [*(id *)(a1 + 32) _model];
          [v22 removeAssetCollectionsFromUploadQueue:v2];

          [v2 removeAllObjects];
        }

        ++v7;
      }
      while (v6 != v7);
      uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v6);
  }

  if ([v2 count])
  {
    id v23 = [*(id *)(a1 + 32) _assetUploader];
    [v23 unregisterAssetCollections:v2];

    id v24 = [*(id *)(a1 + 32) _model];
    [v24 removeAssetCollectionsFromUploadQueue:v2];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v42 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v58 = v42;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished removing upload items...", buf, 0xCu);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v43 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v58 = v43;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Removing download items...", buf, 0xCu);
  }
  id v25 = [*(id *)(a1 + 32) _model];
  id v26 = [v25 nextItemsForDownloadFocusAlbumGUID:*(void *)(a1 + 40) focusAssetCollectionGUID:*(void *)(a1 + 48) maxCount:10];

  while ([v26 count])
  {
    uint64_t v27 = (void *)MEMORY[0x1E019E3B0]();
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v26, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v29 = v26;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v48;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v48 != v32) {
            objc_enumerationMutation(v29);
          }
          id v34 = [*(id *)(*((void *)&v47 + 1) + 8 * v33) object];
          [v28 addObject:v34];

          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v31);
    }

    id v35 = [*(id *)(a1 + 32) _assetDownloader];
    [v35 unregisterAssets:v28];

    id v36 = [*(id *)(a1 + 32) _model];
    [v36 removeAssetsFromDownloadQueue:v28];

    char v37 = [*(id *)(a1 + 32) _model];
    id v26 = [v37 nextItemsForDownloadFocusAlbumGUID:*(void *)(a1 + 40) focusAssetCollectionGUID:*(void *)(a1 + 48) maxCount:10];
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v44 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v58 = v44;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished removing download items...", buf, 0xCu);
  }
  if (!*(_DWORD *)(a1 + 56))
  {
    if (*(void *)(a1 + 40))
    {
      __int16 v38 = [*(id *)(a1 + 32) _model];
      [v38 requeuePendingAssetCollectionsWithAlbumGUID:*(void *)(a1 + 40)];
    }
    if (*(void *)(a1 + 48))
    {
      id v39 = [*(id *)(a1 + 32) _model];
      [v39 requeuePendingAssetCollectionGUID:*(void *)(a1 + 48)];

      uint64_t v40 = *(void *)(a1 + 48);
    }
    else
    {
      uint64_t v40 = 0;
    }
    [*(id *)(a1 + 32) workQueueCancelAllCommandsFilteredByAlbumGUID:*(void *)(a1 + 40) assetCollectionGUID:v40];
    [*(id *)(a1 + 32) workQueueDidFinishCommand];
  }
}

- (void)cancelOutstandingCommandsForAssetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self _model];
  uint64_t v6 = NSStringFromSelector(sel__cancelOutstandingCommandsDisposition_params_);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v4, @"assetCollectionGUID", 0);

  [v5 enqueueCommandAtHeadOfQueue:v6 params:v7 personID:0 albumGUID:0 assetCollectionGUID:0];
  [(MSASStateMachine *)self retryOutstandingActivities];
}

- (void)cancelOutstandingCommandsForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self _model];
  uint64_t v6 = NSStringFromSelector(sel__cancelOutstandingCommandsDisposition_params_);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v4, @"albumGUID", 0);

  [v5 enqueueCommandAtHeadOfQueue:v6 params:v7 personID:0 albumGUID:0 assetCollectionGUID:0];
  [(MSASStateMachine *)self retryOutstandingActivities];
}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MSASStateMachine_setFocusAssetCollectionGUID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__MSASStateMachine_setFocusAssetCollectionGUID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) setPersistentObject:*(void *)(a1 + 40) forKey:@"focusAssetCollectionGUID"];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v3 setFocusAssetCollectionGUID:v2];
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MSASStateMachine_setFocusAlbumGUID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __38__MSASStateMachine_setFocusAlbumGUID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) setPersistentObject:*(void *)(a1 + 40) forKey:@"focusAlbumGUID"];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v3 setFocusAlbumGUID:v2];
}

- (id)migrationCtagToCheckForChanges
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [(MSASStateMachine *)self delegate];
    id v4 = [v3 persistentStringForKey:@"migrationMarker"];

    if (v4 && [v4 isEqualToString:@"pendingMigration"])
    {
      uint64_t v5 = +[MSASCloudKitPlugin fetchMigrationCtag];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543618;
        id v8 = self;
        __int16 v9 = 2114;
        id v10 = v5;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Fetched migrationCtag: %{public}@", (uint8_t *)&v7, 0x16u);
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)rootCtagToCheckForChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MSASStateMachine *)self _model];
  id v4 = [v3 persistentStringForKey:@"rootCtag"];

  uint64_t v5 = [(MSASStateMachine *)self persistentObjectForKey:@"rootCtagRetries"];
  unint64_t v6 = [v5 unsignedIntegerValue];

  if (v6 < 6)
  {
    int v7 = v4;
  }
  else
  {
    int v7 = [(MSASStateMachine *)self persistentObjectForKey:@"pendingRootCtag"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v9 = 138544130;
      id v10 = self;
      __int16 v11 = 2048;
      uint64_t v12 = 5;
      __int16 v13 = 2114;
      id v14 = v4;
      __int16 v15 = 2114;
      char v16 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Retried %lu times for root ctag %{public}@. Replacing with pending root ctag %{public}@.", (uint8_t *)&v9, 0x2Au);
    }
    [(MSASStateMachine *)self setRootCtagFromPendingRootCtag];
  }
  return v7;
}

- (void)setRootCtagFromPendingRootCtag
{
  uint64_t v3 = [(MSASStateMachine *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSASStateMachine_setRootCtagFromPendingRootCtag__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__MSASStateMachine_setRootCtagFromPendingRootCtag__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) persistentObjectForKey:@"pendingRootCtag"];
  if (v2)
  {
    int v7 = v2;
    if ([v2 length])
    {
      uint64_t v3 = [*(id *)(a1 + 32) _model];
      [v3 setPersistentString:v7 forKey:@"rootCtag"];

      id v4 = [*(id *)(a1 + 32) _model];
      [v4 deletePersistentValueWithKey:@"pendingRootCtag"];

      uint64_t v5 = [*(id *)(a1 + 32) _model];
      [v5 deletePersistentValueWithKey:@"rootCtagRetries"];
    }
  }
  return MEMORY[0x1F41817F8]();
}

- (void)setPendingRootCtag:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self persistentObjectForKey:@"rootCtagRetries"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    int v7 = [(MSASStateMachine *)self persistentObjectForKey:@"pendingRootCtag"];
    if (([v4 isEqualToString:v7] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543874;
        id v10 = self;
        __int16 v11 = 2114;
        id v12 = v4;
        __int16 v13 = 2114;
        id v14 = v7;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Setting a new pending root ctag %{public}@ that is different from existing pending root ctag %{public}@.", (uint8_t *)&v9, 0x20u);
      }
      [(MSASStateMachine *)self setPersistentObject:v4 forKey:@"pendingRootCtag"];
      uint64_t v6 = 0;
    }
  }
  else
  {
    [(MSASStateMachine *)self setPersistentObject:v4 forKey:@"pendingRootCtag"];
  }
  id v8 = [NSNumber numberWithUnsignedInteger:v6 + 1];
  [(MSASStateMachine *)self setPersistentObject:v8 forKey:@"rootCtagRetries"];
}

- (void)setDaemon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__MSASStateMachine_setDaemon___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __30__MSASStateMachine_setDaemon___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 72) setDaemon:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v3 setDaemon:v2];
}

- (void)workQueueCancelCompletionBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_commandState == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v15 = self;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling current operation.", buf, 0xCu);
    }
    uint64_t v5 = [(MSASStateMachine *)self _stopHandlerBlock];

    if (v5)
    {
      id v6 = [(MSASStateMachine *)self _stopHandlerBlock];
      int v7 = [(MSASStateMachine *)self _canceledError];
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
  }
  id v8 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v8, block);

  [(MSASStateMachine *)self workQueueCancelAllCommandsFilteredByAlbumGUID:0 assetCollectionGUID:0];
  assetUploader = self->_assetUploader;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E6C3DB00;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(MSASAssetTransferer *)assetUploader cancelCompletionBlock:v11];
}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 retainBusy];
}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E6C3DB00;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 80);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_4;
  v3[3] = &unk_1E6C3DB00;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 cancelCompletionBlock:v3];
}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_5;
  v4[3] = &unk_1E6C3DB00;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __51__MSASStateMachine_workQueueCancelCompletionBlock___block_invoke_5(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
  id v3 = [*(id *)(a1 + 32) daemon];
  [v3 releaseBusy];
}

- (void)workQueueCancelAllCommandsFilteredByAlbumGUID:(id)a3 assetCollectionGUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543874;
    id v29 = self;
    __int16 v30 = 2114;
    id v31 = v6;
    __int16 v32 = 2114;
    id v33 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelling all commands. Filter album GUID: %{public}@, filter asset collection GUID %{public}@", buf, 0x20u);
  }
  uint64_t v27 = 0;
  id v8 = [(MSASStateMachine *)self _model];
  id v25 = 0;
  id v26 = 0;
  id v24 = 0;
  int v9 = [v8 commandAtHeadOfQueueOutParams:&v26 outCommandIdentifier:&v27 outPersonID:0 outAlbumGUID:&v25 outAssetCollectionGUID:&v24];
  id v20 = v26;
  id v10 = v25;
  id v11 = v24;

  if (v9)
  {
    int v21 = 0;
    id v12 = v11;
    __int16 v13 = v10;
    while (!v6 || v13 && [v6 isEqualToString:v13])
    {
      if (!v7) {
        goto LABEL_14;
      }
      int v14 = 0;
      if (v12) {
        goto LABEL_13;
      }
LABEL_18:
      char v18 = [(MSASStateMachine *)self _model];
      id v22 = v12;
      id v23 = v13;
      uint64_t v19 = [v18 commandWithMinimumIdentifier:v27 + 1 outParams:0 outCommandIdentifier:&v27 outPersonID:0 outAlbumGUID:&v23 outAssetCollectionGUID:&v22];
      id v10 = v23;

      id v11 = v22;
      int v9 = (void *)v19;
      id v12 = v11;
      __int16 v13 = v10;
      if (!v19) {
        goto LABEL_21;
      }
    }
    if (!v7) {
      goto LABEL_18;
    }
    int v14 = 1;
    if (!v12) {
      goto LABEL_18;
    }
LABEL_13:
    if (((v14 | objc_msgSend(v7, "isEqualToString:", v12, v20) ^ 1) & 1) == 0)
    {
LABEL_14:
      SEL v15 = NSSelectorFromString((NSString *)v9);
      if (v15)
      {
        uint64_t v16 = v15;
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(self, v16, 2, v20);
        }
      }
      uint64_t v17 = [(MSASStateMachine *)self _model];
      [v17 removeCommandIdentifier:v27];

      ++v21;
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  int v21 = 0;
LABEL_21:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v29 = self;
    __int16 v30 = 1024;
    LODWORD(v31) = v21;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Cancelled %d commands.", buf, 0x12u);
  }
}

- (void)cancelCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MSASStateMachine_cancelCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __42__MSASStateMachine_cancelCompletionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueCancelCompletionBlock:*(void *)(a1 + 40)];
}

- (void)stopAssetDownloadsCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MSASStateMachine_stopAssetDownloadsCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__MSASStateMachine_stopAssetDownloadsCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) stopCompletionBlock:0];
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
    dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
  }
}

- (void)purgeEverythingCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASStateMachine *)self _model];
  [v5 purgeCompletionBlock:v4];
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASStateMachine *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setHasShutDown:1];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(a1 + 32)];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down uploader.", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_51;
  v6[3] = &unk_1E6C3DB00;
  void v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  [v5 shutDownCompletionBlock:v6];
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_51(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down downloader.", buf, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_52;
  v5[3] = &unk_1E6C3DB00;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 shutDownCompletionBlock:v5];
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_52(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E6C3DB00;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v17 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down state machine.", buf, 0xCu);
  }
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  if (v3[2] == 2)
  {
    objc_initWeak(&location, v3);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_53;
    v12[3] = &unk_1E6C3C2B8;
    objc_copyWeak(&v14, &location);
    id v13 = *(id *)(a1 + 40);
    [*(id *)(a1 + 32) setPostCommandCompletionBlock:v12];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v17 = v4;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping current operation.", buf, 0xCu);
    }
    id v5 = [*(id *)(a1 + 32) _stopHandlerBlock];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) _stopHandlerBlock];
      id v7 = [*(id *)(a1 + 32) _stoppedError];
      ((void (**)(void, void *))v6)[2](v6, v7);
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 32) protocol];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_55;
    v10[3] = &unk_1E6C3DB00;
    uint64_t v9 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v9;
    [v8 shutDownCompletionBlock:v10];
  }
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_53(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained protocol];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_54;
  v5[3] = &unk_1E6C3DB00;
  id v6 = WeakRetained;
  id v7 = *(id *)(a1 + 32);
  id v4 = WeakRetained;
  [v3 shutDownCompletionBlock:v5];
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_55(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_56;
  v4[3] = &unk_1E6C3DB00;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueEmptyFileTransferQueuesCompletionBlock:*(void *)(a1 + 40)];
}

void __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_2_54(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_3;
  v3[3] = &unk_1E6C3DB00;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __44__MSASStateMachine_shutDownCompletionBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _workQueueEmptyFileTransferQueuesCompletionBlock:*(void *)(a1 + 40)];
}

- (void)_workQueueEmptyFileTransferQueuesCompletionBlock:(id)a3
{
  id v11 = a3;
  id v4 = [(MSASStateMachine *)self _model];
  int v5 = [v4 itemsForDownloadCountFocusAlbumGUID:0 focusAssetCollectionGUID:0];

  model = self->_model;
  self->_model = 0;

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [(MSASStateMachine *)self personID];
    uint64_t v9 = MSPathAlbumSharingSubscribeMMCSLibraryForPersonID(v8);
    [v7 removeItemAtPath:v9 error:0];
  }
  uint64_t v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    uint64_t v10 = v11;
  }
}

- (void)start
{
  uint64_t v3 = [(MSASStateMachine *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__MSASStateMachine_start__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __25__MSASStateMachine_start__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 MSASStateMachineDidStart:*(void *)(a1 + 32)];
}

- (void)workQueueApplyServerSideConfiguration
{
  id v30 = [(MSASStateMachine *)self serverSideConfiguration];
  uint64_t v3 = [v30 objectForKey:@"com.apple.sharedstreams.config.maxNumRetriesOnFailure.server"];
  -[MSASStateMachine setMaxMetadataRetryCount:](self, "setMaxMetadataRetryCount:", [v3 intValue]);

  id v4 = [(MSASStateMachine *)self _assetUploader];
  int v5 = [v30 objectForKey:@"com.apple.sharedstreams.config.maxUploadAssetBatchSize"];
  objc_msgSend(v4, "setMaxBatchCount:", objc_msgSend(v5, "intValue"));

  id v6 = [(MSASStateMachine *)self _assetUploader];
  id v7 = [v30 objectForKey:@"com.apple.sharedstreams.config.maxNumRetriesOnFailure.content"];
  objc_msgSend(v6, "setMaxRetryCount:", objc_msgSend(v7, "intValue"));

  uint64_t v8 = [(MSASStateMachine *)self _assetUploader];
  uint64_t v9 = [v30 objectForKey:@"com.apple.sharedstreams.config.maxMMCSTokenValidity"];
  [v9 doubleValue];
  objc_msgSend(v8, "setMaxMMCSTokenValidityTimeInterval:");

  uint64_t v10 = [(MSASStateMachine *)self _assetDownloader];
  id v11 = [v30 objectForKey:@"mme.sharedstreams.client.downloadMMCSBatchSize"];
  objc_msgSend(v10, "setMaxBatchCount:", objc_msgSend(v11, "intValue"));

  id v12 = [(MSASStateMachine *)self _assetDownloader];
  id v13 = [v30 objectForKey:@"com.apple.sharedstreams.config.maxNumRetriesOnFailure.content"];
  objc_msgSend(v12, "setMaxRetryCount:", objc_msgSend(v13, "intValue"));

  id v14 = [(MSASStateMachine *)self _assetDownloader];
  SEL v15 = [v30 objectForKey:@"com.apple.sharedstreams.config.maxMMCSTokenValidity"];
  [v15 doubleValue];
  objc_msgSend(v14, "setMaxMMCSTokenValidityTimeInterval:");

  uint64_t v16 = MSASPlatform();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v30 objectForKey:@"com.apple.sharedstreams.config.switch.3G"];
    uint64_t v18 = v17;
    BOOL v19 = v17 && ![v17 BOOLValue];
    [v16 setSuppressCellular:v19];
  }
  id v20 = [v30 objectForKey:@"com.apple.sharedstreams.config.dimensions.preview"];
  int v21 = +[MSImageScalingSpecification specificationWithSharedAlbumSpecificationString:v20];
  derivativeImageScalingSpecificatiouint64_t n = self->_derivativeImageScalingSpecification;
  self->_derivativeImageScalingSpecificatiouint64_t n = v21;

  [(MSImageScalingSpecification *)self->_derivativeImageScalingSpecification setAssetTypeFlags:2];
  id v23 = [v30 objectForKey:@"com.apple.sharedstreams.config.dimensions.thumbnail"];
  id v24 = +[MSImageScalingSpecification specificationWithSharedAlbumSpecificationString:v23];
  thumbnailImageScalingSpecificatiouint64_t n = self->_thumbnailImageScalingSpecification;
  self->_thumbnailImageScalingSpecificatiouint64_t n = v24;

  [(MSImageScalingSpecification *)self->_thumbnailImageScalingSpecification setAssetTypeFlags:1];
  id v26 = [v30 objectForKey:@"com.apple.sharedstreams.config.videoderivatives"];
  uint64_t v27 = +[MSVideoDerivativeSpecification videoDerivativeSpecificationsWithDictionaryArray:v26];
  uint64_t v28 = (NSArray *)[v27 mutableCopy];

  [(NSArray *)v28 addObject:self->_derivativeImageScalingSpecification];
  [(NSArray *)v28 addObject:self->_thumbnailImageScalingSpecification];
  derivativeSpecifications = self->_derivativeSpecifications;
  self->_derivativeSpecifications = v28;
}

- (MSASStateMachine)initWithPersonID:(id)a3 eventQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v80.receiver = self;
  v80.super_class = (Class)MSASStateMachine;
  uint64_t v9 = [(MSASStateMachine *)&v80 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_personID, a3);
    id v11 = [[MSASPersonModel alloc] initWithPersonID:v7];
    model = v10->_model;
    v10->_model = v11;

    id v13 = MSASPlatform();
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      SEL v15 = MSASPlatform();
      -[MSASPersonModel setShouldDownloadEarliestPhotosFirst:](v10->_model, "setShouldDownloadEarliestPhotosFirst:", [v15 shouldDownloadEarliestPhotosFirst]);
    }
    uint64_t v16 = [(MSASModelBase *)v10->_model persistentObjectForKey:@"metadataBackoffManager"];
    metadataBackoffManager = v10->_metadataBackoffManager;
    v10->_metadataBackoffManager = (MSBackoffManager *)v16;

    uint64_t v18 = v10->_metadataBackoffManager;
    if (!v18)
    {
      BOOL v19 = [[MSBackoffManager alloc] initWithInitialInterval:0 backoffFactor:5.0 randomizeFactor:2.0 maxBackoffInterval:0.15 retryAfterDate:1200.0];
      id v20 = v10->_metadataBackoffManager;
      v10->_metadataBackoffManager = v19;

      uint64_t v18 = v10->_metadataBackoffManager;
    }
    [(MSBackoffManager *)v18 setDelegate:v10];
    uint64_t v21 = [(MSASModelBase *)v10->_model persistentObjectForKey:@"MMCSBackoffManager"];
    MMCSBackoffManager = v10->_MMCSBackoffManager;
    v10->_MMCSBackoffManager = (MSBackoffManager *)v21;

    id v23 = v10->_MMCSBackoffManager;
    if (!v23)
    {
      id v24 = [[MSBackoffManager alloc] initWithInitialInterval:0 backoffFactor:5.0 randomizeFactor:2.0 maxBackoffInterval:0.15 retryAfterDate:1200.0];
      id v25 = v10->_MMCSBackoffManager;
      v10->_MMCSBackoffManager = v24;

      id v23 = v10->_MMCSBackoffManager;
    }
    [(MSBackoffManager *)v23 setDelegate:v10];
    dispatch_queue_t v26 = dispatch_queue_create("MSASStateMachine work queue", 0);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v26;

    if (v8) {
      dispatch_queue_t v28 = (dispatch_queue_t)v8;
    }
    else {
      dispatch_queue_t v28 = dispatch_queue_create("MSASStateMachine event queue", 0);
    }
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (OS_dispatch_queue *)v28;

    dispatch_queue_t v30 = dispatch_queue_create("MSASStateMachine server side config queue", 0);
    serverSideConfigQueue = v10->_serverSideConfigQueue;
    v10->_serverSideConfigQueue = (OS_dispatch_queue *)v30;

    dispatch_queue_t v32 = dispatch_queue_create("MSASStateMachine member queue", MEMORY[0x1E4F14430]);
    memberQueue = v10->_memberQueue;
    v10->_memberQueue = (OS_dispatch_queue *)v32;

    uint64_t v34 = [(MSASAssetTransferer *)[MSASAssetUploader alloc] initWithPersonID:v7];
    assetUploader = v10->_assetUploader;
    v10->_assetUploader = v34;

    [(MSASAssetTransferer *)v10->_assetUploader setDelegate:v10];
    [(MSASAssetTransferer *)v10->_assetUploader setModel:v10->_model];
    [(MSASAssetTransferer *)v10->_assetUploader setBackoffManager:v10->_MMCSBackoffManager];
    id v36 = [(MSASAssetTransferer *)[MSASAssetDownloader alloc] initWithPersonID:v7];
    assetDownloader = v10->_assetDownloader;
    v10->_assetDownloader = v36;

    [(MSASAssetTransferer *)v10->_assetDownloader setDelegate:v10];
    [(MSASAssetTransferer *)v10->_assetDownloader setModel:v10->_model];
    [(MSASAssetTransferer *)v10->_assetDownloader setBackoffManager:v10->_MMCSBackoffManager];
    objc_initWeak(&location, v10);
    __int16 v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v39 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke;
    v76[3] = &unk_1E6C3C248;
    uint64_t v40 = v10;
    __int16 v77 = v40;
    objc_copyWeak(&v78, &location);
    id v41 = (id)[v38 addObserverForName:@"MSASAssetTransfererDidIdle" object:0 queue:v39 usingBlock:v76];

    uint64_t v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v43 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_3;
    v73[3] = &unk_1E6C3C248;
    objc_copyWeak(&v75, &location);
    uint64_t v44 = v40;
    id v74 = v44;
    id v45 = (id)[v42 addObserverForName:@"MSASServerSideConfigDidChangeNotification" object:0 queue:v43 usingBlock:v73];

    uint64_t v46 = v10->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_5;
    block[3] = &unk_1E6C3DA38;
    long long v47 = v44;
    uint64_t v72 = v47;
    dispatch_sync(v46, block);
    long long v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v49 = [MEMORY[0x1E4F28F08] mainQueue];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_6;
    v68[3] = &unk_1E6C3C248;
    objc_copyWeak(&v70, &location);
    long long v50 = v47;
    id v69 = v50;
    id v51 = (id)[v48 addObserverForName:@"MSASPServerSideConfigurationDidChangeNotification" object:0 queue:v49 usingBlock:v68];

    long long v52 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v53 = [MEMORY[0x1E4F28F08] mainQueue];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_44;
    v65[3] = &unk_1E6C3C248;
    objc_copyWeak(&v67, &location);
    long long v54 = v50;
    __int16 v66 = v54;
    id v55 = (id)[v52 addObserverForName:@"MSASPDidReceiveRetryAfterNotification" object:0 queue:v53 usingBlock:v65];

    uint64_t v56 = [(MSASStateMachine *)v54 persistentObjectForKey:@"focusAlbumGUID"];
    focusAlbumGUID = v54->_focusAlbumGUID;
    v54->_focusAlbumGUID = (NSString *)v56;

    uint64_t v58 = (uint64_t)v54->_focusAlbumGUID;
    uint64_t v59 = [(MSASStateMachine *)v54 _assetDownloader];
    [v59 setFocusAlbumGUID:v58];

    uint64_t v60 = [(MSASStateMachine *)v54 persistentObjectForKey:@"focusAssetCollectionGUID"];
    focusAssetCollectionGUID = v54->_focusAssetCollectionGUID;
    v54->_focusAssetCollectionGUID = (NSString *)v60;

    uint64_t v62 = (uint64_t)v54->_focusAssetCollectionGUID;
    id v63 = [(MSASStateMachine *)v54 _assetDownloader];
    [v63 setFocusAssetCollectionGUID:v62];

    objc_destroyWeak(&v67);
    objc_destroyWeak(&v70);

    objc_destroyWeak(&v75);
    objc_destroyWeak(&v78);

    objc_destroyWeak(&location);
  }

  return v10;
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2;
  block[3] = &unk_1E6C3C220;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"personID"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [WeakRetained personID];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) workQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_4;
    v9[3] = &unk_1E6C3C8B0;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v10 = *(id *)(a1 + 32);
    dispatch_async(v8, v9);

    objc_destroyWeak(&v11);
  }
}

uint64_t __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueApplyServerSideConfiguration];
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"personID"];

  int v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v7 = [WeakRetained personID];
  int v8 = [v4 isEqualToString:v7];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_7;
    v10[3] = &unk_1E6C3C8B0;
    objc_copyWeak(&v12, v5);
    id v11 = v4;
    dispatch_async(v9, v10);

    objc_destroyWeak(&v12);
  }
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  int v5 = [v4 objectForKey:@"personID"];

  id v6 = [v3 userInfo];

  int v7 = [v6 objectForKey:@"retryAfterDate"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v9 = [WeakRetained personID];
  int v10 = [v5 isEqualToString:v9];

  if (v10)
  {
    id v11 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2_45;
    block[3] = &unk_1E6C3CB48;
    id v13 = *(id *)(a1 + 32);
    id v14 = v7;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
  }
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2_45(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v2;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Received retry-after from metadata server with date :%{public}@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v5 = [WeakRetained _metadataBackoffManager];
  [v5 didReceiveRetryAfterDate:*(void *)(a1 + 40)];
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_7(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v7 = 138543362;
    id v8 = WeakRetained;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Server-side config has changed. We will refetch the config and try again.", (uint8_t *)&v7, 0xCu);
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v3 _model];
  int v5 = NSStringFromSelector(sel__sendGetServerSideConfigurationDisposition_params_);
  [v4 enqueueCommandAtHeadOfQueue:v5 params:0 personID:*(void *)(a1 + 32) albumGUID:0 assetCollectionGUID:0];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 workQueueRetryOutstandingActivities];
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _model];
  id v7 = [v4 persistentStringForKey:@"serverSideConfigVersion"];

  int v5 = [*(id *)(a1 + 32) protocol];
  [v5 setServerSideConfigVersion:v7];

  id v6 = objc_loadWeakRetained(v2);
  [v6 workQueueApplyServerSideConfiguration];
}

void __48__MSASStateMachine_initWithPersonID_eventQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained workQueueUpdateNextActivityDate];
}

- (MSASStateMachine)initWithPersonID:(id)a3
{
  return [(MSASStateMachine *)self initWithPersonID:a3 eventQueue:MEMORY[0x1E4F14428]];
}

- (MSASStateMachine)init
{
  id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"MSASStateMachineInitException" reason:0 userInfo:0];
  [v3 raise];

  return 0;
}

- (id)memberQueueMetadataBackoffManager
{
  return self->_metadataBackoffManager;
}

- (id)_metadataBackoffManager
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4547;
  id v11 = __Block_byref_object_dispose__4548;
  id v12 = 0;
  id v3 = [(MSASStateMachine *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MSASStateMachine__metadataBackoffManager__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__MSASStateMachine__metadataBackoffManager__block_invoke(uint64_t a1)
{
}

- (id)_assetDownloader
{
  return self->_assetDownloader;
}

- (id)_assetUploader
{
  return self->_assetUploader;
}

- (id)_model
{
  return self->_model;
}

- (MSASPhoneInvitations)phoneInvitations
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4547;
  id v11 = __Block_byref_object_dispose__4548;
  id v12 = 0;
  id v3 = [(MSASStateMachine *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__MSASStateMachine_phoneInvitations__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MSASPhoneInvitations *)v4;
}

void __36__MSASStateMachine_phoneInvitations__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 176);
  if (!v2)
  {
    id v3 = objc_alloc_init(MSASPhoneInvitations);
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 176);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v6, v2);
}

- (MSASProtocol)protocol
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__4547;
  id v11 = __Block_byref_object_dispose__4548;
  id v12 = 0;
  id v3 = [(MSASStateMachine *)self memberQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__MSASStateMachine_protocol__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (MSASProtocol *)v4;
}

void __28__MSASStateMachine_protocol__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  if (!v2)
  {
    id v3 = [MSASProtocol alloc];
    id v4 = [*(id *)(a1 + 32) personID];
    uint64_t v5 = [(MSASProtocol *)v3 initWithPersonID:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 168);
    *(void *)(v6 + 168) = v5;

    id v8 = [*(id *)(a1 + 32) serverSideConfigurationVersion];
    [*(id *)(*(void *)(a1 + 32) + 168) setServerSideConfigVersion:v8];

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 168);
  }
  uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v9, v2);
}

@end