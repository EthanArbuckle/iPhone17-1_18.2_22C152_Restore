@interface MSAlbumSharingDaemon
- (BOOL)hasCommandsInGroupedCommandQueue;
- (BOOL)isInRetryState;
- (BOOL)isRetryingOutstandingActivities;
- (BOOL)isWaitingForAuth;
- (MSASDaemonModel)daemonModel;
- (MSAlbumSharingDaemon)init;
- (MSAlbumSharingDaemonDelegate)delegate;
- (NSMutableDictionary)nextUpdateDateByPersonID;
- (NSMutableDictionary)personIDToDelegateMap;
- (NSMutableDictionary)personIDToStateMachineMap;
- (OS_dispatch_queue)mapQueue;
- (OS_dispatch_queue)workQueue;
- (id)_delegateForPersonID:(id)a3;
- (id)boundStateMachineForPersonID:(id)a3;
- (id)clientOrgKeyForRecordID:(id)a3 zoneName:(id)a4 ownerUserID:(id)a5 personID:(id)a6;
- (id)existingModelForPersonID:(id)a3;
- (id)existingStateMachineForPersonID:(id)a3;
- (id)modelForPersonID:(id)a3;
- (id)nextActivityDate;
- (id)persistentObjectForKey:(id)a3 personID:(id)a4;
- (id)personIDListeningToPushNotification;
- (id)serverSideConfigurationForPersonID:(id)a3;
- (int)busyCount;
- (void)_postModelShutdownForPersonID:(id)a3 completionBlock:(id)a4;
- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4;
- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5;
- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 info:(id)a5 completionBlock:(id)a6;
- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)addAlbum:(id)a3;
- (void)addAlbum:(id)a3 personID:(id)a4;
- (void)addAlbum:(id)a3 personID:(id)a4 info:(id)a5;
- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5;
- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)cancelActivitiesForPersonID:(id)a3;
- (void)deleteAlbumWithGUID:(id)a3 inviterAddress:(id)a4;
- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4;
- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)deleteAssetCollectionsWithGUIDs:(id)a3 personID:(id)a4;
- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4;
- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)didIdle;
- (void)didReceiveCommentTooLongError:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 personID:(id)a6;
- (void)didReceiveTooManyAlbumsError:(id)a3 personID:(id)a4;
- (void)didReceiveTooManyCommentsError:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 personID:(id)a6;
- (void)didReceiveTooManyPhotosError:(id)a3 forAlbum:(id)a4 personID:(id)a5;
- (void)didReceiveTooManySubscriptionsError:(id)a3 personID:(id)a4;
- (void)didUnidle;
- (void)forgetEverythingAboutPersonID:(id)a3;
- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4;
- (void)forgetEverythingCompletionBlock:(id)a3;
- (void)mapQueueShutDownStateMachineInMap:(id)a3 personIDs:(id)a4 index:(unint64_t)a5 forDestruction:(BOOL)a6 completionBlock:(id)a7;
- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4;
- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 info:(id)a5;
- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 moveLastViewedAssetCollectionMarker:(BOOL)a5 info:(id)a6;
- (void)markAsSpamAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)markAsSpamInvitationWithGUID:(id)a3 personID:(id)a4;
- (void)markAsSpamInvitationWithToken:(id)a3 personID:(id)a4;
- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5;
- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5 info:(id)a6;
- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4;
- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4 info:(id)a5;
- (void)pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:(id)a3;
- (void)refreshAccessControlListOfAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)refreshAccessControlListOfAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5;
- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6;
- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5;
- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6;
- (void)refreshResetSync:(BOOL)a3 personID:(id)a4;
- (void)refreshResetSync:(BOOL)a3 personID:(id)a4 info:(id)a5;
- (void)refreshServerSideConfigurationForPersonID:(id)a3;
- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4;
- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4;
- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)retrieveAssetsInAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4 personID:(id)a5;
- (void)retryOutstandingActivities;
- (void)retryOutstandingActivitiesForPersonID:(id)a3;
- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3;
- (void)setBusyCount:(int)a3;
- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5;
- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6;
- (void)setDaemonModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4;
- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4;
- (void)setIsRetryingOutstandingActivities:(BOOL)a3;
- (void)setMapQueue:(id)a3;
- (void)setMigrationMarker:(id)a3 personID:(id)a4;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7;
- (void)setNextActivityDate:(id)a3 forPersonID:(id)a4;
- (void)setNextUpdateDateByPersonID:(id)a3;
- (void)setPersistentObject:(id)a3 forKey:(id)a4 personID:(id)a5;
- (void)setPersonIDToDelegateMap:(id)a3;
- (void)setPersonIDToStateMachineMap:(id)a3;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7;
- (void)setWorkQueue:(id)a3;
- (void)shutDown;
- (void)shutDownCompletionBlock:(id)a3;
- (void)shutDownStateMachine:(id)a3 forDestruction:(BOOL)a4 completionBlock:(id)a5;
- (void)start;
- (void)stopAssetDownloadsForPersonID:(id)a3;
- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4;
- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5;
- (void)updateOwnerReputationScoreForAlbum:(id)a3;
- (void)workQueueForgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4;
- (void)workQueueForgetEverythingAboutPersonIDs:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5;
@end

@implementation MSAlbumSharingDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUpdateDateByPersonID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_mapQueue, 0);
  objc_storeStrong((id *)&self->_daemonModel, 0);
  objc_storeStrong((id *)&self->_personIDToDelegateMap, 0);
  objc_storeStrong((id *)&self->_personIDToStateMachineMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNextUpdateDateByPersonID:(id)a3
{
}

- (NSMutableDictionary)nextUpdateDateByPersonID
{
  return self->_nextUpdateDateByPersonID;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setMapQueue:(id)a3
{
}

- (OS_dispatch_queue)mapQueue
{
  return self->_mapQueue;
}

- (void)setIsRetryingOutstandingActivities:(BOOL)a3
{
  self->_isRetryingOutstandingActivities = a3;
}

- (BOOL)isRetryingOutstandingActivities
{
  return self->_isRetryingOutstandingActivities;
}

- (void)setBusyCount:(int)a3
{
  self->_busyCount = a3;
}

- (int)busyCount
{
  return self->_busyCount;
}

- (void)setDaemonModel:(id)a3
{
}

- (MSASDaemonModel)daemonModel
{
  return self->_daemonModel;
}

- (void)setPersonIDToDelegateMap:(id)a3
{
}

- (NSMutableDictionary)personIDToDelegateMap
{
  return self->_personIDToDelegateMap;
}

- (void)setPersonIDToStateMachineMap:(id)a3
{
}

- (NSMutableDictionary)personIDToStateMachineMap
{
  return self->_personIDToStateMachineMap;
}

- (void)setDelegate:(id)a3
{
}

- (MSAlbumSharingDaemonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSAlbumSharingDaemonDelegate *)WeakRetained;
}

- (void)updateOwnerReputationScoreForAlbum:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 ownerEmail];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1BA98];
    v7 = [v4 ownerEmail];
    v8 = [v6 handleWithEmailAddress:v7];

    v9 = objc_opt_new();
    id v12 = 0;
    v10 = [v9 reputationForHandle:v8 timeout:&v12 error:10.0];
    id v11 = v12;

    if (v10)
    {
      objc_msgSend(v4, "setOwnerIsWhitelisted:", objc_msgSend(v10, "score") == 1);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      id v16 = v11;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unable to query contacts reputation score: %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Unexpected nil album owner email", buf, 0xCu);
  }
}

- (void)didReceiveCommentTooLongError:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 personID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MSAlbumSharingDaemon_didReceiveCommentTooLongError_forAssetCollection_inAlbum_personID___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__MSAlbumSharingDaemon_didReceiveCommentTooLongError_forAssetCollection_inAlbum_personID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 MSAlbumSharingDaemon:*(void *)(a1 + 32) didReceiveCommentTooLongError:*(void *)(a1 + 40) forAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) personID:*(void *)(a1 + 64)];
  }
}

- (void)didReceiveTooManyCommentsError:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5 personID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__MSAlbumSharingDaemon_didReceiveTooManyCommentsError_forAssetCollection_inAlbum_personID___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __91__MSAlbumSharingDaemon_didReceiveTooManyCommentsError_forAssetCollection_inAlbum_personID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 MSAlbumSharingDaemon:*(void *)(a1 + 32) didReceiveTooManyCommentsError:*(void *)(a1 + 40) forAssetCollection:*(void *)(a1 + 48) inAlbum:*(void *)(a1 + 56) personID:*(void *)(a1 + 64)];
  }
}

- (void)didReceiveTooManySubscriptionsError:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__MSAlbumSharingDaemon_didReceiveTooManySubscriptionsError_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__MSAlbumSharingDaemon_didReceiveTooManySubscriptionsError_personID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 MSAlbumSharingDaemon:*(void *)(a1 + 32) didReceiveTooManySubscriptionsError:*(void *)(a1 + 40) personID:*(void *)(a1 + 48)];
  }
}

- (void)didReceiveTooManyPhotosError:(id)a3 forAlbum:(id)a4 personID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__MSAlbumSharingDaemon_didReceiveTooManyPhotosError_forAlbum_personID___block_invoke;
  v14[3] = &unk_1E6C3D9C0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v14);
}

void __71__MSAlbumSharingDaemon_didReceiveTooManyPhotosError_forAlbum_personID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 MSAlbumSharingDaemon:*(void *)(a1 + 32) didReceiveTooManyPhotosError:*(void *)(a1 + 40) forAlbum:*(void *)(a1 + 48) personID:*(void *)(a1 + 56)];
  }
}

- (void)didReceiveTooManyAlbumsError:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSAlbumSharingDaemon_didReceiveTooManyAlbumsError_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__MSAlbumSharingDaemon_didReceiveTooManyAlbumsError_personID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 MSAlbumSharingDaemon:*(void *)(a1 + 32) didReceiveTooManyAlbumsError:*(void *)(a1 + 40) personID:*(void *)(a1 + 48)];
  }
}

- (id)boundStateMachineForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__3882;
  id v17 = __Block_byref_object_dispose__3883;
  id v18 = 0;
  v5 = [(MSAlbumSharingDaemon *)self mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "objectForKey:");
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v5 = MSASPlatform();
      char v6 = objc_opt_respondsToSelector();

      id v7 = MSASPlatform();
      id v8 = v7;
      if (v6)
      {
        char v9 = [v7 personIDEnabledForAlbumSharing:*(void *)(a1 + 32)];

        if ((v9 & 1) == 0) {
          goto LABEL_5;
        }
      }
      else
      {
        id v12 = [v7 personIDsEnabledForAlbumSharing];
        int v13 = [v12 containsObject:*(void *)(a1 + 32)];

        if (!v13)
        {
LABEL_5:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v11 = *(void *)(a1 + 32);
            uint64_t v10 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            uint64_t v28 = v10;
            __int16 v29 = 2112;
            uint64_t v30 = v11;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Shared Photo Stream is disabled for person ID %@. Not instantiating state machine.", buf, 0x16u);
          }
          return;
        }
      }
      id v14 = [*(id *)(a1 + 40) _delegateForPersonID:*(void *)(a1 + 32)];
      if (v14)
      {
        uint64_t v15 = [[MSASStateMachine alloc] initWithPersonID:*(void *)(a1 + 32)];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        id v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v18)
        {
          [v18 setDelegate:v14];
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDaemon:*(void *)(a1 + 40)];
          [v14 setMSASCounterpartInstance:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
          [v14 setDaemon:*(void *)(a1 + 40)];
          [*(id *)(*(void *)(a1 + 40) + 56) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 32)];
          [*(id *)(*(void *)(a1 + 40) + 64) setObject:v14 forKey:*(void *)(a1 + 32)];
          if ([v14 dbWasRecreated])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543362;
              uint64_t v28 = v22;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Forcing model reset sync.", buf, 0xCu);
            }
            [v14 reconstruct];
          }
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) start];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke_348;
          block[3] = &unk_1E6C3D998;
          int8x16_t v23 = *(int8x16_t *)(a1 + 32);
          id v19 = (id)v23.i64[0];
          int8x16_t v25 = vextq_s8(v23, v23, 8uLL);
          id v26 = v14;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 32);
        uint64_t v20 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        uint64_t v30 = v21;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not create delegate for person ID %@.", buf, 0x16u);
      }
    }
  }
}

void __53__MSAlbumSharingDaemon_boundStateMachineForPersonID___block_invoke_348(uint64_t a1)
{
  [*(id *)(a1 + 32) didCreateStateMachineForPersonID:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 48) persistentStringForKey:@"migrationMarker"];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 48) refreshResetSync:0];
    uint64_t v2 = v3;
  }
}

- (id)existingStateMachineForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3882;
  uint64_t v16 = __Block_byref_object_dispose__3883;
  id v17 = 0;
  v5 = [(MSAlbumSharingDaemon *)self mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSAlbumSharingDaemon_existingStateMachineForPersonID___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __56__MSAlbumSharingDaemon_existingStateMachineForPersonID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (id)_delegateForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = MSASPlatform();
  v5 = (void *)[v4 pluginClass];

  id v6 = [v5 delegatePluginForPersonID:v3];

  if (([v6 conformsToProtocol:&unk_1F368C5F0] & 1) == 0)
  {

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Plugin does not conform to MSASStateMachineDelegate protocol.", v8, 2u);
    }
    id v6 = 0;
  }
  return v6;
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4 personID:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MSAlbumSharingDaemon *)self boundStateMachineForPersonID:a5];
  [v10 setPersistentObject:v9 forKey:v8];
}

- (id)persistentObjectForKey:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = [(MSAlbumSharingDaemon *)self boundStateMachineForPersonID:a4];
  id v8 = [v7 persistentObjectForKey:v6];

  return v8;
}

- (void)refreshServerSideConfigurationForPersonID:(id)a3
{
  id v3 = [(MSAlbumSharingDaemon *)self boundStateMachineForPersonID:a3];
  [v3 refreshServerSideConfig];
}

- (id)serverSideConfigurationForPersonID:(id)a3
{
  id v3 = [(MSAlbumSharingDaemon *)self boundStateMachineForPersonID:a3];
  id v4 = [v3 serverSideConfiguration];

  return v4;
}

- (id)clientOrgKeyForRecordID:(id)a3 zoneName:(id)a4 ownerUserID:(id)a5 personID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = +[MSProtocolUtilities currentOwnerCKUserID];
  uint64_t v14 = [v11 isEqualToString:v13];

  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__3882;
  uint64_t v22 = __Block_byref_object_dispose__3883;
  id v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__MSAlbumSharingDaemon_clientOrgKeyForRecordID_zoneName_ownerUserID_personID___block_invoke;
  v17[3] = &unk_1E6C3BED0;
  v17[4] = &v18;
  +[MSASCloudKitPlugin fetchClientOrgKeyForRecordID:v9 zoneName:v10 fieldName:@"clientOrgKey" ownerUserID:v11 isOwned:v14 completionHandler:v17];
  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

void __78__MSAlbumSharingDaemon_clientOrgKeyForRecordID_zoneName_ownerUserID_personID___block_invoke(uint64_t a1, void *a2)
{
}

- (void)forgetEverythingCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(MSAlbumSharingDaemon *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_suspend(v2);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Forgetting everything.", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__3882;
  int v13 = __Block_byref_object_dispose__3883;
  id v14 = 0;
  id v4 = [*(id *)(a1 + 32) mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_252;
  block[3] = &unk_1E6C3DA60;
  void block[4] = *(void *)(a1 + 32);
  void block[5] = &buf;
  dispatch_sync(v4, block);

  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*((void *)&buf + 1) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  [v5 workQueueForgetEverythingAboutPersonIDs:v6 index:0 completionBlock:v7];

  _Block_object_dispose(&buf, 8);
}

uint64_t __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_252(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
  return MEMORY[0x1F41817F8]();
}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = MSPathAlbumSharingDir();
  id v28 = 0;
  id v4 = [v2 contentsOfDirectoryAtPath:v3 error:&v28];
  id v5 = v28;

  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          buf[0] = 0;
          id v12 = MSPathAlbumSharingDir();
          int v13 = [v12 stringByAppendingPathComponent:v11];

          if ([v2 fileExistsAtPath:v13 isDirectory:buf]) {
            BOOL v14 = buf[0] == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v2 removeItemAtPath:v13 error:0];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v8);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v21 = [v5 MSVerboseDescription];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v30 = v20;
    __int16 v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not enumerate contents of Shared Photo Stream directory. Error: %{public}@", buf, 0x16u);
  }
  uint64_t v15 = [*(id *)(a1 + 32) daemonModel];
  [v15 clearAllNextActivityDates];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138543362;
    uint64_t v30 = v16;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Forgotten everything.", buf, 0xCu);
  }
  id v17 = *(void **)(a1 + 40);
  if (v17)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_253;
    v22[3] = &unk_1E6C3DB00;
    uint64_t v18 = v17;
    v22[4] = *(void *)(a1 + 32);
    id v23 = v18;
    dispatch_async(MEMORY[0x1E4F14428], v22);
    id v19 = v23;
  }
  else
  {
    id v19 = [*(id *)(a1 + 32) workQueue];
    dispatch_resume(v19);
  }
}

void __56__MSAlbumSharingDaemon_forgetEverythingCompletionBlock___block_invoke_253(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v2);
}

- (void)workQueueForgetEverythingAboutPersonIDs:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  if ([v8 count] <= a4)
  {
    if (v9) {
      v9[2](v9);
    }
  }
  else
  {
    id v10 = [v8 objectAtIndex:a4];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonIDs_index_completionBlock___block_invoke;
    v11[3] = &unk_1E6C3D078;
    v11[4] = self;
    id v12 = v8;
    unint64_t v14 = a4;
    int v13 = v9;
    [(MSAlbumSharingDaemon *)self workQueueForgetEverythingAboutPersonID:v10 completionBlock:v11];
  }
}

uint64_t __86__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonIDs_index_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) workQueueForgetEverythingAboutPersonIDs:*(void *)(a1 + 40) index:*(void *)(a1 + 56) + 1 completionBlock:*(void *)(a1 + 48)];
}

- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_suspend(v2);

  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_2;
  v6[3] = &unk_1E6C3DB00;
  id v5 = *(id *)(a1 + 48);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 workQueueForgetEverythingAboutPersonID:v4 completionBlock:v6];
}

void __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_3;
    block[3] = &unk_1E6C3DB00;
    id v3 = v2;
    void block[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) workQueue];
    dispatch_resume(v4);
  }
}

void __70__MSAlbumSharingDaemon_forgetEverythingAboutPersonID_completionBlock___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v2);
}

- (void)workQueueForgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Forgetting everything about person ID %@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3882;
  id v23 = __Block_byref_object_dispose__3883;
  id v24 = 0;
  id v8 = [(MSAlbumSharingDaemon *)self mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D000;
  uint64_t v20 = buf;
  void block[4] = self;
  id v9 = v6;
  id v19 = v9;
  dispatch_sync(v8, block);

  id v10 = *(void **)(*(void *)&buf[8] + 40);
  if (v10)
  {
    uint64_t v11 = [v10 delegate];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_2;
    v13[3] = &unk_1E6C3BEA8;
    v13[4] = self;
    id v17 = buf;
    id v14 = v9;
    id v15 = v11;
    id v16 = v7;
    id v12 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
  else
  {
    [(MSAlbumSharingDaemon *)self _postModelShutdownForPersonID:v9 completionBlock:v7];
  }

  _Block_object_dispose(buf, 8);
}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) nextUpdateDateByPersonID];
  [v5 removeObjectForKey:*(void *)(a1 + 40)];
}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willDestroyStateMachineForPersonID:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_3;
  v7[3] = &unk_1E6C3CA78;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 56);
  [v2 shutDownStateMachine:v3 forDestruction:1 completionBlock:v7];
}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_4;
    v8[3] = &unk_1E6C3CA78;
    id v3 = v2;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(a1 + 48);
    id v9 = v3;
    uint64_t v10 = v4;
    id v11 = v5;
    id v12 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Model not found for person ID %@.", buf, 0x16u);
    }
    [*(id *)(a1 + 40) _postModelShutdownForPersonID:*(void *)(a1 + 48) completionBlock:*(void *)(a1 + 56)];
  }
}

void __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_5;
  v4[3] = &unk_1E6C3D198;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  [v2 forgetEverythingInfo:0 completionBlock:v4];
}

uint64_t __79__MSAlbumSharingDaemon_workQueueForgetEverythingAboutPersonID_completionBlock___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postModelShutdownForPersonID:*(void *)(a1 + 40) completionBlock:*(void *)(a1 + 48)];
}

- (void)shutDownStateMachine:(id)a3 forDestruction:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 delegate];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D218;
  id v15 = v8;
  uint64_t v16 = self;
  BOOL v19 = a4;
  id v17 = v10;
  id v18 = v9;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) personID];
  [*(id *)(a1 + 40) willDestroyStateMachineForPersonID:v2];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    id v15 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Shutting down state machine for personID %@.", buf, 0x16u);
  }
  uint64_t v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_250;
  v7[3] = &unk_1E6C3BE80;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  char v11 = *(unsigned char *)(a1 + 64);
  id v10 = *(id *)(a1 + 56);
  [v4 shutDownCompletionBlock:v7];
}

void __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_250(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_2;
  v5[3] = &unk_1E6C3BE80;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  char v9 = *(unsigned char *)(a1 + 56);
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Shutting down model.", buf, 0xCu);
      id v2 = *(void **)(a1 + 32);
    }
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_251;
    v8[3] = &unk_1E6C3DB00;
    id v5 = *(void **)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v5;
    [v2 shutDownForDestruction:v4 completionBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

uint64_t __76__MSAlbumSharingDaemon_shutDownStateMachine_forDestruction_completionBlock___block_invoke_251(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Model has shut down.", (uint8_t *)&v4, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_postModelShutdownForPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

void __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 72) setNextActivityDate:0 forPersonID:*(void *)(a1 + 40)];
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = MSPathAlbumSharingDirForPersonID(*(void **)(a1 + 40));
  [v2 removeItemAtPath:v3 error:0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3D198;
  int v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__MSAlbumSharingDaemon__postModelShutdownForPersonID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) didDestroyStateMachineForPersonID:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) delegate];
    [v4 MSAlbumSharingDaemon:*(void *)(a1 + 32) didForgetPersonID:*(void *)(a1 + 40)];
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Completed forgetting personID %@.", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)forgetEverythingAboutPersonID:(id)a3
{
}

- (void)retrieveAssetsInAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4 personID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [(MSAlbumSharingDaemon *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__MSAlbumSharingDaemon_retrieveAssetsInAssetCollectionsWithGUIDs_assetTypeFlags_personID___block_invoke;
  v13[3] = &unk_1E6C3D0F8;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  int v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __90__MSAlbumSharingDaemon_retrieveAssetsInAssetCollectionsWithGUIDs_assetTypeFlags_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 retrieveAssetsFromAssetCollectionsWithGUIDs:*(void *)(a1 + 48) assetTypeFlags:*(unsigned int *)(a1 + 56)];
}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4 personID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__MSAlbumSharingDaemon_retrieveAssets_inAlbumWithGUID_personID___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __64__MSAlbumSharingDaemon_retrieveAssets_inAlbumWithGUID_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 retrieveAssets:*(void *)(a1 + 48) inAlbumWithGUID:*(void *)(a1 + 56)];
}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__MSAlbumSharingDaemon_deleteCommentWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __60__MSAlbumSharingDaemon_deleteCommentWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 deleteCommentWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)deleteCommentWithGUID:(id)a3 personID:(id)a4
{
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__MSAlbumSharingDaemon_addComments_toAssetCollectionWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __76__MSAlbumSharingDaemon_addComments_toAssetCollectionWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 addComments:*(void *)(a1 + 48) toAssetCollectionWithGUID:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 personID:(id)a5
{
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __104__MSAlbumSharingDaemon_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_personID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __104__MSAlbumSharingDaemon_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 markCommentsForAssetCollectionWithGUID:*(void *)(a1 + 48) asViewedWithLastViewedDate:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 personID:(id)a5
{
}

- (void)deleteAssetCollectionsWithGUIDs:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MSAlbumSharingDaemon_deleteAssetCollectionsWithGUIDs_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __65__MSAlbumSharingDaemon_deleteAssetCollectionsWithGUIDs_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 deleteAssetCollectionsWithGUIDs:*(void *)(a1 + 48)];
}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__MSAlbumSharingDaemon_deleteAssetCollectionWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __68__MSAlbumSharingDaemon_deleteAssetCollectionWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 deleteAssetCollectionWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)deleteAssetCollectionWithGUID:(id)a3 personID:(id)a4
{
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MSAlbumSharingDaemon_addAssetCollections_toAlbumWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __74__MSAlbumSharingDaemon_addAssetCollections_toAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 addAssetCollections:*(void *)(a1 + 48) toAlbumWithGUID:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(MSAlbumSharingDaemon *)self workQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  v21[3] = &unk_1E6C3D5D0;
  v21[4] = self;
  id v22 = v13;
  BOOL v26 = a3;
  id v23 = v12;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(v16, v21);
}

void __102__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 setMultipleContributorsEnabled:*(unsigned __int8 *)(a1 + 72) forAlbumWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56) completionBlock:*(void *)(a1 + 64)];
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E6C3D120;
  id v13 = v10;
  id v11 = v10;
  [(MSAlbumSharingDaemon *)self setMultipleContributorsEnabled:v8 forAlbumWithGUID:a4 personID:a5 info:0 completionBlock:v12];
}

uint64_t __97__MSAlbumSharingDaemon_setMultipleContributorsEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6 completionBlock:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D218;
  void block[4] = self;
  id v19 = v12;
  BOOL v22 = a3;
  id v20 = v11;
  id v21 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v12;
  dispatch_async(v14, block);
}

void __94__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_info_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 setPublicAccessEnabled:*(unsigned __int8 *)(a1 + 64) forAlbumWithGUID:*(void *)(a1 + 48) info:0 completionBlock:*(void *)(a1 + 56)];
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke;
  v12[3] = &unk_1E6C3D120;
  id v13 = v10;
  id v11 = v10;
  [(MSAlbumSharingDaemon *)self setPublicAccessEnabled:v8 forAlbumWithGUID:a4 personID:a5 info:0 completionBlock:v12];
}

uint64_t __89__MSAlbumSharingDaemon_setPublicAccessEnabled_forAlbumWithGUID_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__MSAlbumSharingDaemon_removeAccessControlEntryWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __71__MSAlbumSharingDaemon_removeAccessControlEntryWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 removeAccessControlEntryWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)removeAccessControlEntryWithGUID:(id)a3 personID:(id)a4
{
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MSAlbumSharingDaemon_addAccessControlEntries_toAlbumWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __78__MSAlbumSharingDaemon_addAccessControlEntries_toAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 addAccessControlEntries:*(void *)(a1 + 48) toAlbumWithGUID:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 personID:(id)a5
{
}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__MSAlbumSharingDaemon_rejectInvitationWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __63__MSAlbumSharingDaemon_rejectInvitationWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 rejectInvitationWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)rejectInvitationWithGUID:(id)a3 personID:(id)a4
{
}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__MSAlbumSharingDaemon_acceptInvitationWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __63__MSAlbumSharingDaemon_acceptInvitationWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 acceptInvitationWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)acceptInvitationWithGUID:(id)a3 personID:(id)a4
{
}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_info_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D530;
  void block[4] = self;
  id v20 = v11;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  dispatch_async(v14, block);
}

void __80__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_info_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 acceptInvitationWithToken:*(void *)(a1 + 48) info:*(void *)(a1 + 56) completionBlock:*(void *)(a1 + 64)];
}

- (void)acceptInvitationWithToken:(id)a3 personID:(id)a4 completionBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_completionBlock___block_invoke;
  v10[3] = &unk_1E6C3D120;
  id v11 = v8;
  id v9 = v8;
  [(MSAlbumSharingDaemon *)self acceptInvitationWithToken:a3 personID:a4 info:0 completionBlock:v10];
}

uint64_t __75__MSAlbumSharingDaemon_acceptInvitationWithToken_personID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)markAsSpamInvitationWithToken:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSAlbumSharingDaemon_markAsSpamInvitationWithToken_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __63__MSAlbumSharingDaemon_markAsSpamInvitationWithToken_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 markAsSpamInvitationWithToken:*(void *)(a1 + 48) info:0];
}

- (void)markAsSpamInvitationWithGUID:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSAlbumSharingDaemon_markAsSpamInvitationWithGUID_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __62__MSAlbumSharingDaemon_markAsSpamInvitationWithGUID_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 markAsSpamInvitationWithGUID:*(void *)(a1 + 48) info:0];
}

- (void)markAsSpamAlbumWithGUID:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSAlbumSharingDaemon_markAsSpamAlbumWithGUID_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __57__MSAlbumSharingDaemon_markAsSpamAlbumWithGUID_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 markAsSpamAlbumWithGUID:*(void *)(a1 + 48) info:0];
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MSAlbumSharingDaemon_unsubscribeFromAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __67__MSAlbumSharingDaemon_unsubscribeFromAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 unsubscribeFromAlbumWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__MSAlbumSharingDaemon_subscribeToAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __63__MSAlbumSharingDaemon_subscribeToAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 subscribeToAlbumWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)subscribeToAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 moveLastViewedAssetCollectionMarker:(BOOL)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__MSAlbumSharingDaemon_markAlbumGUIDAsViewed_personID_moveLastViewedAssetCollectionMarker_info___block_invoke;
  block[3] = &unk_1E6C3D308;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a5;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __96__MSAlbumSharingDaemon_markAlbumGUIDAsViewed_personID_moveLastViewedAssetCollectionMarker_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 markAlbumGUIDAsViewed:*(void *)(a1 + 48) moveLastViewedAssetCollectionMarker:*(unsigned __int8 *)(a1 + 64) info:*(void *)(a1 + 56)];
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4 info:(id)a5
{
}

- (void)markAlbumGUIDAsViewed:(id)a3 personID:(id)a4
{
}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__MSAlbumSharingDaemon_deleteAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __58__MSAlbumSharingDaemon_deleteAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 deleteAlbumWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)deleteAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)setMigrationMarker:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSAlbumSharingDaemon_setMigrationMarker_personID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __52__MSAlbumSharingDaemon_setMigrationMarker_personID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 setMigrationMarker:*(void *)(a1 + 48)];
}

- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MSAlbumSharingDaemon_setClientOrgKey_forAlbumWithGUID_personID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v20 = v12;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v15 = v13;
  id v16 = v11;
  id v17 = v10;
  id v18 = v12;
  dispatch_async(v14, block);
}

void __71__MSAlbumSharingDaemon_setClientOrgKey_forAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 setClientOrgKey:*(void *)(a1 + 48) forAlbumWithGUID:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
}

- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 personID:(id)a5
{
}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__MSAlbumSharingDaemon_modifyAlbumMetadata_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __58__MSAlbumSharingDaemon_modifyAlbumMetadata_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 modifyAlbumMetadata:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)modifyAlbumMetadata:(id)a3 personID:(id)a4
{
}

- (void)addAlbum:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__MSAlbumSharingDaemon_addAlbum_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __47__MSAlbumSharingDaemon_addAlbum_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 addAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)addAlbum:(id)a3 personID:(id)a4
{
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MSAlbumSharingDaemon_refreshCommentsForAssetCollectionWithGUID_resetSync_personID_info___block_invoke;
  block[3] = &unk_1E6C3D308;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a4;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __90__MSAlbumSharingDaemon_refreshCommentsForAssetCollectionWithGUID_resetSync_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 refreshCommentsForAssetCollectionWithGUID:*(void *)(a1 + 48) resetSync:*(unsigned __int8 *)(a1 + 64) info:*(void *)(a1 + 56)];
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
}

- (void)refreshAccessControlListOfAlbumWithGUID:(id)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSAlbumSharingDaemon *)self workQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__MSAlbumSharingDaemon_refreshAccessControlListOfAlbumWithGUID_personID_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __78__MSAlbumSharingDaemon_refreshAccessControlListOfAlbumWithGUID_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 refreshAccessControlListForAlbumWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)refreshAccessControlListOfAlbumWithGUID:(id)a3 personID:(id)a4
{
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MSAlbumSharingDaemon_refreshContentOfAlbumWithGUID_resetSync_personID_info___block_invoke;
  block[3] = &unk_1E6C3D308;
  void block[4] = self;
  id v18 = v11;
  BOOL v21 = a4;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, block);
}

void __78__MSAlbumSharingDaemon_refreshContentOfAlbumWithGUID_resetSync_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 refreshContentOfAlbumWithGUID:*(void *)(a1 + 48) resetSync:*(unsigned __int8 *)(a1 + 64) info:*(void *)(a1 + 56)];
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 personID:(id)a5
{
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4 info:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MSAlbumSharingDaemon *)self workQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__MSAlbumSharingDaemon_refreshResetSync_personID_info___block_invoke;
  v13[3] = &unk_1E6C3D0A8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a3;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __55__MSAlbumSharingDaemon_refreshResetSync_personID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  [v2 refreshResetSync:*(unsigned __int8 *)(a1 + 56) info:*(void *)(a1 + 48)];
}

- (void)refreshResetSync:(BOOL)a3 personID:(id)a4
{
}

- (id)modelForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSAlbumSharingDaemon *)self boundStateMachineForPersonID:v4];
  id v6 = [v5 delegate];
  id v7 = v6;
  if (v6 && ([v6 conformsToProtocol:&unk_1F368B7D8] & 1) == 0) {
    __assert_rtn("-[MSAlbumSharingDaemon modelForPersonID:]", "MSAlbumSharingDaemon.m", 367, "[delegate conformsToProtocol:@protocol(MSASModel)]");
  }

  return v7;
}

- (id)existingModelForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSAlbumSharingDaemon *)self existingStateMachineForPersonID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 delegate];
    if (([v7 conformsToProtocol:&unk_1F368B7D8] & 1) == 0) {
      __assert_rtn("-[MSAlbumSharingDaemon existingModelForPersonID:]", "MSAlbumSharingDaemon.m", 356, "[delegate conformsToProtocol:@protocol(MSASModel)]");
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__MSAlbumSharingDaemon_sendServerSideConfigurationDidChangeNotificationForPersonID___block_invoke;
  v6[3] = &unk_1E6C3DB28;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __84__MSAlbumSharingDaemon_sendServerSideConfigurationDidChangeNotificationForPersonID___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 32), @"personID", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSASServerSideConfigDidChangeNotification" object:*(void *)(a1 + 40) userInfo:v3];
}

- (void)setNextActivityDate:(id)a3 forPersonID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MSAlbumSharingDaemon *)self mapQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MSAlbumSharingDaemon_setNextActivityDate_forPersonID___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_barrier_async(v8, block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543362;
    id v13 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Not setting next activity date for a nil person ID.", buf, 0xCu);
  }
}

void __56__MSAlbumSharingDaemon_setNextActivityDate_forPersonID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) nextUpdateDateByPersonID];

  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 32) setNextUpdateDateByPersonID:v3];
  }
  id v4 = [*(id *)(a1 + 32) nextUpdateDateByPersonID];
  id v11 = [v4 objectForKey:*(void *)(a1 + 40)];

  if (!v11) {
    goto LABEL_8;
  }
  id v5 = [MEMORY[0x1E4F1CA98] null];

  uint64_t v6 = *(void *)(a1 + 48);
  if (v11 == v5)
  {
    if (!v6) {
      goto LABEL_12;
    }
LABEL_8:
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 32) nextUpdateDateByPersonID];
    if (v7)
    {
      uint64_t v9 = [*(id *)(a1 + 48) copy];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    }
    id v10 = (void *)v9;
    [v8 setObject:v9 forKey:*(void *)(a1 + 40)];

    [*(id *)(*(void *)(a1 + 32) + 72) setNextActivityDate:*(void *)(a1 + 48) forPersonID:*(void *)(a1 + 40)];
    goto LABEL_12;
  }
  if (([v11 isEqualToDate:v6] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_12:
}

- (void)pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSAlbumSharingDaemon *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__MSAlbumSharingDaemon_pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __89__MSAlbumSharingDaemon_pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) personIDListeningToPushNotification];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543874;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Push notification received for Shared Photo Stream with targetPersonID %@. Listener personID %@.", (uint8_t *)&v7, 0x20u);
  }
  if ([v2 length]
    && (([v2 isEqualToString:*(void *)(a1 + 40)] & 1) != 0 || !*(void *)(a1 + 40)))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Serving push notification", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) boundStateMachineForPersonID:v2];
    [v6 checkForChangesResetSync:0 info:0];

    [*(id *)(a1 + 32) didReceivePushNotificationForPersonID:v2];
  }
}

- (id)personIDListeningToPushNotification
{
  id v2 = MSASPlatform();
  uint64_t v3 = (void *)[v2 pluginClass];

  return (id)[v3 MSASPersonIDForPollingTriggeredByPushNotification];
}

- (void)deleteAlbumWithGUID:(id)a3 inviterAddress:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  id v6 = MSASPlatform();
  int v7 = (void *)[v6 pluginClass];

  [v7 didFindDeletedAlbumWithGUID:v8 inviterAddress:v5];
}

- (void)addAlbum:(id)a3
{
  id v4 = a3;
  [(MSAlbumSharingDaemon *)self updateOwnerReputationScoreForAlbum:v4];
  id v5 = MSASPlatform();
  id v6 = (void *)[v5 pluginClass];

  int v7 = [v6 MSASPersonIDForPollingTriggeredByPushNotification];
  id v8 = [(MSAlbumSharingDaemon *)self workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__MSAlbumSharingDaemon_addAlbum___block_invoke;
  v11[3] = &unk_1E6C3BE58;
  v11[4] = self;
  id v12 = v7;
  id v13 = v4;
  uint64_t v14 = v6;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, v11);
}

void __33__MSAlbumSharingDaemon_addAlbum___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) modelForPersonID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MSAlbumSharingDaemon_addAlbum___block_invoke_2;
  v6[3] = &unk_1E6C3BE30;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 validateInvitationForAlbum:v4 completionBlock:v6];
}

void __33__MSAlbumSharingDaemon_addAlbum___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) GUID];
      int v9 = 138543618;
      id v10 = v6;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to validate invitationToken for album %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
LABEL_10:
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) GUID];
        int v9 = 138543362;
        id v10 = v8;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Validated invitationToken for album %{public}@", (uint8_t *)&v9, 0xCu);
      }
      [*(id *)(a1 + 40) didFindNewAlbum:*(void *)(a1 + 32)];
    }
    else if (v7)
    {
      id v6 = [*(id *)(a1 + 32) GUID];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "invitationToken for album %{public}@ is invalid", (uint8_t *)&v9, 0xCu);
      goto LABEL_10;
    }
  }
}

- (void)cancelActivitiesForPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSAlbumSharingDaemon *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_suspend(v2);

  uint64_t v3 = [*(id *)(a1 + 32) boundStateMachineForPersonID:*(void *)(a1 + 40)];
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Canceling all activities for personID %@", buf, 0x16u);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke_11;
    v7[3] = &unk_1E6C3DA38;
    void v7[4] = *(void *)(a1 + 32);
    [v3 cancelCompletionBlock:v7];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) workQueue];
    dispatch_resume(v6);
  }
}

void __52__MSAlbumSharingDaemon_cancelActivitiesForPersonID___block_invoke_11(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v1);
}

- (void)stopAssetDownloadsForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSAlbumSharingDaemon *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) workQueue];
  dispatch_suspend(v3);

  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__3882;
  id v19 = __Block_byref_object_dispose__3883;
  id v20 = 0;
  id v4 = [*v2 mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_9;
  block[3] = &unk_1E6C3D000;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  uint64_t v14 = &v15;
  void block[4] = v5;
  id v13 = v6;
  dispatch_sync(v4, block);

  BOOL v7 = (void *)v16[5];
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      uint64_t v24 = v9;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping downloads for personID %@.", buf, 0x16u);
      BOOL v7 = (void *)v16[5];
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_10;
    v11[3] = &unk_1E6C3DA38;
    v11[4] = *(void *)(a1 + 32);
    [v7 stopAssetDownloadsCompletionBlock:v11];
  }
  else
  {
    __int16 v10 = [*(id *)(a1 + 32) workQueue];
    dispatch_resume(v10);
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_9(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

void __54__MSAlbumSharingDaemon_stopAssetDownloadsForPersonID___block_invoke_10(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v1);
}

- (void)retryOutstandingActivitiesForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSAlbumSharingDaemon *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__MSAlbumSharingDaemon_retryOutstandingActivitiesForPersonID___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __62__MSAlbumSharingDaemon_retryOutstandingActivitiesForPersonID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isRetryingOutstandingActivities];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setIsRetryingOutstandingActivities:1];
    uint64_t v3 = [*(id *)(a1 + 32) boundStateMachineForPersonID:*(void *)(a1 + 40)];
    [v3 retryOutstandingActivities];

    id v4 = *(void **)(a1 + 32);
    return [v4 setIsRetryingOutstandingActivities:0];
  }
  return result;
}

- (void)retryOutstandingActivities
{
  uint64_t v3 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MSAlbumSharingDaemon_retryOutstandingActivities__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __50__MSAlbumSharingDaemon_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isRetryingOutstandingActivities] & 1) == 0)
  {
    [*(id *)(a1 + 32) setIsRetryingOutstandingActivities:1];
    id v2 = [*(id *)(*(void *)(a1 + 32) + 72) nextActivityDateByPersonID];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          BOOL v7 = [*(id *)(a1 + 32) boundStateMachineForPersonID:*(void *)(*((void *)&v8 + 1) + 8 * v6)];
          [v7 retryOutstandingActivities];

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
    [*(id *)(a1 + 32) setIsRetryingOutstandingActivities:0];
  }
}

- (BOOL)hasCommandsInGroupedCommandQueue
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(MSAlbumSharingDaemon *)self mapQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MSAlbumSharingDaemon_hasCommandsInGroupedCommandQueue__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  void v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __56__MSAlbumSharingDaemon_hasCommandsInGroupedCommandQueue__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        if ([v7 hasCommandsInGroupedCommandQueue])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)isWaitingForAuth
{
  return 0;
}

- (BOOL)isInRetryState
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(MSAlbumSharingDaemon *)self mapQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MSAlbumSharingDaemon_isInRetryState__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  void v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __38__MSAlbumSharingDaemon_isInRetryState__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        BOOL v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        if ([v7 isInRetryState])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __64__MSAlbumSharingDaemon_setFocusAssetCollectionGUID_forPersonID___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  [v2 setFocusAssetCollectionGUID:a1[6]];
}

- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke;
  block[3] = &unk_1E6C3D998;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  uint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __54__MSAlbumSharingDaemon_setFocusAlbumGUID_forPersonID___block_invoke_2(void *a1)
{
  id v2 = [*(id *)(a1[4] + 56) objectForKey:a1[5]];
  [v2 setFocusAlbumGUID:a1[6]];
}

- (void)didUnidle
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Unidled.", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSAlbumSharingDaemon;
  [(MSDaemon *)&v4 didUnidle];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained MSAlbumSharingDaemonDidUnidle:self];
}

- (void)didIdle
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Idled.", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained MSAlbumSharingDaemonDidIdle:self];

  v4.receiver = self;
  v4.super_class = (Class)MSAlbumSharingDaemon;
  [(MSDaemon *)&v4 didIdle];
}

- (id)nextActivityDate
{
  return [(MSASDaemonModel *)self->_daemonModel earliestNextActivityDate];
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MSAlbumSharingDaemon *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_suspend(v2);

  uint64_t v3 = [*(id *)(a1 + 32) mapQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E6C3DB00;
  id v4 = *(void **)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_barrier_async(v3, v5);
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 56) allKeys];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v3[7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_3;
    v11[3] = &unk_1E6C3DB00;
    id v5 = *(id *)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v5;
    [v3 mapQueueShutDownStateMachineInMap:v4 personIDs:v2 index:0 forDestruction:0 completionBlock:v11];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_5;
      block[3] = &unk_1E6C3DB00;
      id v7 = v6;
      void block[4] = *(void *)(a1 + 32);
      id v10 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) workQueue];
      dispatch_resume(v8);
    }
  }
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_4;
    block[3] = &unk_1E6C3DB00;
    id v3 = v2;
    void block[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) workQueue];
    dispatch_resume(v4);
  }
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v2);
}

void __48__MSAlbumSharingDaemon_shutDownCompletionBlock___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v2);
}

- (void)mapQueueShutDownStateMachineInMap:(id)a3 personIDs:(id)a4 index:(unint64_t)a5 forDestruction:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (void (**)(void))a7;
  if ([v13 count] <= a5)
  {
    if (v14) {
      v14[2](v14);
    }
  }
  else
  {
    uint64_t v15 = [v13 objectAtIndex:a5];
    BOOL v16 = [v12 objectForKey:v15];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke;
    v17[3] = &unk_1E6C3BE08;
    v17[4] = self;
    id v18 = v12;
    id v19 = v13;
    unint64_t v21 = a5;
    BOOL v22 = v8;
    id v20 = v14;
    [(MSAlbumSharingDaemon *)self shutDownStateMachine:v16 forDestruction:v8 completionBlock:v17];
  }
}

void __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mapQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke_2;
  v7[3] = &unk_1E6C3BE08;
  id v3 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v4 = *(id *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v9 = v4;
  uint64_t v11 = v5;
  char v12 = *(unsigned char *)(a1 + 72);
  id v10 = v6;
  dispatch_async(v2, v7);
}

uint64_t __105__MSAlbumSharingDaemon_mapQueueShutDownStateMachineInMap_personIDs_index_forDestruction_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mapQueueShutDownStateMachineInMap:*(void *)(a1 + 40) personIDs:*(void *)(a1 + 48) index:*(void *)(a1 + 64) + 1 forDestruction:*(unsigned __int8 *)(a1 + 72) completionBlock:*(void *)(a1 + 56)];
}

- (void)shutDown
{
  id v3 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__MSAlbumSharingDaemon_shutDown__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__MSAlbumSharingDaemon_shutDown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shutDownCompletionBlock:0];
}

- (void)start
{
  id v3 = [(MSAlbumSharingDaemon *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MSAlbumSharingDaemon_start__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __29__MSAlbumSharingDaemon_start__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) personIDListeningToPushNotification];
  if ([v3 length])
  {
    id v2 = [*(id *)(a1 + 32) boundStateMachineForPersonID:v3];
    [v2 checkForChangesIfMissingRootCtag];

    [*(id *)(a1 + 32) retryOutstandingActivities];
  }
}

- (MSAlbumSharingDaemon)init
{
  v14.receiver = self;
  v14.super_class = (Class)MSAlbumSharingDaemon;
  id v2 = [(MSDaemon *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MSAlbumSharingDaemon map queue", MEMORY[0x1E4F14430]);
    mapQueue = v2->_mapQueue;
    v2->_mapQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("MSAlbumSharingDaemon work queue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    personIDToStateMachineMap = v2->_personIDToStateMachineMap;
    v2->_personIDToStateMachineMap = v7;

    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    personIDToDelegateMap = v2->_personIDToDelegateMap;
    v2->_personIDToDelegateMap = v9;

    uint64_t v11 = objc_alloc_init(MSASDaemonModel);
    daemonModel = v2->_daemonModel;
    v2->_daemonModel = v11;
  }
  return v2;
}

@end