@interface MSASServerSideModel
- (BOOL)MSASStateMachine:(id)a3 didQueryIsAssetCollectionWithGUIDInModel:(id)a4;
- (BOOL)dbQueueAccessControlWithGUID:(id)a3 outObject:(id *)a4 outAlbumGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7;
- (BOOL)dbQueueAlbumMetadataWithAlbumGUID:(id)a3 key:(id)a4 outValue:(id *)a5;
- (BOOL)dbQueueAlbumWithGUID:(id)a3 outObject:(id *)a4 outName:(id *)a5 outCtag:(id *)a6 outForeignCtag:(id *)a7 outURLString:(id *)a8 outUserInfoData:(id *)a9 outClientOrgKey:(id *)a10;
- (BOOL)dbQueueAssetCollectionContainsCommentsFromMeAssetCollectionGUID:(id)a3;
- (BOOL)dbQueueAssetCollectionMetadataWithAssetCollectionGUID:(id)a3 key:(id)a4 outValue:(id *)a5;
- (BOOL)dbQueueAssetCollectionWithGUID:(id)a3 outObject:(id *)a4 outCtag:(id *)a5 outAlbumGUID:(id *)a6 outBatchDate:(id *)a7 outPhotoDate:(id *)a8 outPhotoNumber:(int64_t *)a9 outUserInfoData:(id *)a10;
- (BOOL)dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:(id)a3 info:(id)a4;
- (BOOL)dbQueueCheckToClearUnviewedStateOnAssetCollectionWithGUID:(id)a3 info:(id)a4;
- (BOOL)dbQueueCommentWithGUID:(id)a3 outObject:(id *)a4 outID:(unint64_t *)a5 outTimestamp:(id *)a6 outAssetCollectionGUID:(id *)a7 outIsCaption:(BOOL *)a8 outUserInfoData:(id *)a9;
- (BOOL)dbQueueCommentWithID:(int)a3 assetCollectionGUID:(id)a4 outObject:(id *)a5 outGUID:(id *)a6 outTimestamp:(id *)a7 outIsCaption:(BOOL *)a8 outUserInfoData:(id *)a9;
- (BOOL)dbQueueInvitationWithAlbumGUID:(id)a3 outObject:(id *)a4 outInvitationGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7;
- (BOOL)dbQueueInvitationWithGUID:(id)a3 outObject:(id *)a4 outAlbumGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7;
- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4;
- (BOOL)errorIsCancellation:(id)a3;
- (BOOL)hasCommandsInGroupedCommandQueue;
- (BOOL)hasEnqueuedActivities;
- (BOOL)isAlbumWithGUIDMarkedAsUnviewed:(id)a3;
- (BOOL)isAssetCollectionWithGUIDMarkedAsUnviewed:(id)a3;
- (MSASPendingChanges)pendingChanges;
- (MSASServerSideModel)initWithPersonID:(id)a3;
- (MSASServerSideModel)initWithPersonID:(id)a3 databasePath:(id)a4;
- (MSASServerSideModel)initWithPersonID:(id)a3 databasePath:(id)a4 eventQueue:(id)a5;
- (MSASServerSideModelGroupedCommandQueue)commandQueue;
- (MSASStateMachine)MSASCounterpartInstance;
- (MSAlbumSharingDaemon)daemon;
- (NSCountedSet)observers;
- (OS_dispatch_queue)eventQueue;
- (OS_dispatch_queue)memberQueue;
- (double)maxGroupedCallbackEventIdleInterval;
- (double)maxGroupedCallbackEventStaleness;
- (id)MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID:(id)a3 info:(id)a4;
- (id)MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:(id)a3 info:(id)a4;
- (id)MSASStateMachineDidRequestAlbumWithGUID:(id)a3;
- (id)MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID:(id)a3 info:(id)a4;
- (id)_invalidAccessControlGUIDErrorwithGUID:(id)a3;
- (id)_invalidAssetCollectionGUIDErrorwithGUID:(id)a3;
- (id)_invalidInvitationGUIDErrorWithGUID:(id)a3;
- (id)_protocolErrorForUnderlyingError:(id)a3;
- (id)accessControlGUIDsForAlbumWithGUID:(id)a3;
- (id)accessControlWithGUID:(id)a3;
- (id)accessControlsForAlbumWithGUID:(id)a3;
- (id)albumGUIDs;
- (id)albumWithGUID:(id)a3;
- (id)albums;
- (id)assetCollectionGUIDsInAlbumWithGUID:(id)a3;
- (id)assetCollectionWithGUID:(id)a3;
- (id)assetCollectionsInAlbumWithGUID:(id)a3;
- (id)captionForAssetCollectionWithGUID:(id)a3;
- (id)commentWithGUID:(id)a3;
- (id)commentsForAssetCollectionWithGUID:(id)a3;
- (id)dbQueueAccessControlGUIDsForAlbumWithGUID:(id)a3;
- (id)dbQueueAccessControlsForAlbumWithGUID:(id)a3;
- (id)dbQueueAlbumGUIDs;
- (id)dbQueueAssetCollectionGUIDsInAlbumWithGUID:(id)a3;
- (id)dbQueueCommentsForAssetCollectionWithGUID:(id)a3;
- (id)dbQueueInvitationForAlbumWithGUID:(id)a3;
- (id)dbQueueLookupOrCreateAlbumWithGUID:(id)a3;
- (id)dbQueueLookupOrCreateAssetCollectionWithGUID:(id)a3 outAlbum:(id *)a4;
- (id)dbQueueLookupOrCreateCommentWithGUID:(id)a3 outAssetCollection:(id *)a4 outAlbum:(id *)a5;
- (id)dbQueueMaximumCommentIDForAssetCollectionWithGUID:(id)a3;
- (id)dbQueueMaximumPhotoNumberForAlbumWithGUID:(id)a3;
- (id)dbQueuePendingCommentCheckOperations;
- (id)earliestUnviewedAssetCollectionGUIDInAlbumWithGUID:(id)a3;
- (id)focusAssetCollectionGUID;
- (id)invitationForAlbumWithGUID:(id)a3;
- (id)invitationGUIDs;
- (id)invitationWithGUID:(id)a3;
- (id)invitations;
- (id)isPublicAccessEnabledForAlbumWithGUID:(id)a3;
- (id)lastViewedCommentDateForAssetCollectionWithGUID:(id)a3;
- (id)nextCommandGroupMaxCount:(int)a3 outCommand:(id *)a4 outLastCommandIndex:(int64_t *)a5;
- (id)serverCommunicationBackoffDate;
- (id)serverSideConfiguration;
- (id)userInfoForAccessControlWithGUID:(id)a3;
- (id)userInfoForAlbumWithGUID:(id)a3;
- (id)userInfoForAssetCollectionWithGUID:(id)a3;
- (id)userInfoForCommentWithGUID:(id)a3;
- (id)userInfoForInvitationWithGUID:(id)a3;
- (int)commandCount;
- (int)dbQueueCountOfUnviewedAssetCollectionsInAlbumWithGUID:(id)a3;
- (int)dbQueueUnviewedAlbumCount;
- (int)dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:(id)a3;
- (int)maxGroupedCallbackEventBatchCount;
- (int)unviewedAlbumCount;
- (int)unviewedAssetCollectionCountForAlbumWithGUID:(id)a3;
- (void)MSASStateMachine:(id)a3 didFindAccessControlChangesForAlbumGUIDS:(id)a4 info:(id)a5;
- (void)MSASStateMachine:(id)a3 didFindAlbumChanges:(id)a4 info:(id)a5;
- (void)MSASStateMachine:(id)a3 didFindAlbumSyncedState:(id)a4 forAlbum:(id)a5 info:(id)a6;
- (void)MSASStateMachine:(id)a3 didFindAssetCollectionChanges:(id)a4 forAlbum:(id)a5 info:(id)a6;
- (void)MSASStateMachine:(id)a3 didFindAssetCollectionSyncedState:(id)a4 forAssetCollectionGUID:(id)a5 inAlbum:(id)a6 assetCollectionStateCtag:(id)a7 info:(id)a8;
- (void)MSASStateMachine:(id)a3 didFindChangesInAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFindCommentChanges:(id)a4 inAssetCollectionWithGUID:(id)a5 inAlbumWithGUID:(id)a6 info:(id)a7;
- (void)MSASStateMachine:(id)a3 didFindNewURLString:(id)a4 forAlbumWithGUID:(id)a5 info:(id)a6;
- (void)MSASStateMachine:(id)a3 didFindSyncedKeyValueChangesForAlbumGUIDS:(id)a4 albumChanges:(id)a5 accessControlChangesForAlbumGUIDS:(id)a6 info:(id)a7;
- (void)MSASStateMachine:(id)a3 didFindSyncedKeyValueChangesForAlbumGUIDS:(id)a4 info:(id)a5;
- (void)MSASStateMachine:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishAddingComment:(id)a4 toAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7 error:(id)a8;
- (void)MSASStateMachine:(id)a3 didFinishAddingSharingRelationships:(id)a4 toOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishCheckingForAlbumSyncedStateChangesInAlbum:(id)a4 info:(id)a5 error:(id)a6 newAlbumStateCtag:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5;
- (void)MSASStateMachine:(id)a3 didFinishCheckingForCommentChangesInAssetCollectionWithGUID:(id)a4 largestCommentID:(int)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishCheckingForUpdatesInAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishCheckingForUpdatesInAlbums:(id)a4 info:(id)a5;
- (void)MSASStateMachine:(id)a3 didFinishCreatingAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishDeletingAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishDeletingAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishDeletingComment:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7 error:(id)a8;
- (void)MSASStateMachine:(id)a3 didFinishEnqueueingAssetsForDownload:(id)a4 inAlbumWithGUID:(id)a5;
- (void)MSASStateMachine:(id)a3 didFinishGettingAccessControls:(id)a4 forAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishMarkingAsSpamInvitationForAlbum:(id)a4 invitationGUID:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishMarkingAsSpamInvitationForToken:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishRemovingSharingRelationship:(id)a4 fromOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishSettingSyncedStateForAlbum:(id)a4 info:(id)a5 error:(id)a6 newAlbumStateCtag:(id)a7;
- (void)MSASStateMachine:(id)a3 didFinishSettingSyncedStateForAssetCollection:(id)a4 inAlbum:(id)a5 assetStateCtag:(id)a6 info:(id)a7 error:(id)a8;
- (void)MSASStateMachine:(id)a3 didFinishSubscribingToAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishUnsubscribingFromAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishUpdatingAlbum:(id)a4 info:(id)a5 error:(id)a6;
- (void)MSASStateMachine:(id)a3 didFinishUpdatingAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6 error:(id)a7;
- (void)MSASStateMachine:(id)a3 didFireScheduledEvent:(id)a4 forAssetCollectionGUID:(id)a5 albumGUID:(id)a6 info:(id)a7;
- (void)MSASStateMachine:(id)a3 didRequestAssetsForAddingAssetCollections:(id)a4 inAlbum:(id)a5 specifications:(id)a6 info:(id)a7;
- (void)MSASStateMachineDidFindGlobalResetSync:(id)a3 info:(id)a4;
- (void)MSASStateMachineDidStart:(id)a3;
- (void)MSASStateMachineDidUpdateServerCommunicationBackoffDate:(id)a3;
- (void)_reconstruct;
- (void)acceptInvitationWithGUID:(id)a3;
- (void)acceptInvitationWithGUID:(id)a3 info:(id)a4;
- (void)acceptInvitationWithToken:(id)a3 completionBlock:(id)a4;
- (void)acceptInvitationWithToken:(id)a3 info:(id)a4 completionBlock:(id)a5;
- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4;
- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 info:(id)a5;
- (void)addAlbum:(id)a3;
- (void)addAlbum:(id)a3 info:(id)a4;
- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4;
- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 info:(id)a5;
- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4;
- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 info:(id)a5;
- (void)addObserver:(id)a3;
- (void)cancel;
- (void)dbQueueAddCommentCheckOperation:(id)a3;
- (void)dbQueueDeleteAccessControlWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteAlbumMetadataAlbumGUID:(id)a3 key:(id)a4 info:(id)a5;
- (void)dbQueueDeleteAlbumWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteAllAlbumMetadataForAlbumWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteAllAssetCollectionMetadataForAssetCollectionWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteAllPendingCommentCheckOperations;
- (void)dbQueueDeleteAssetCollectionMetadataAssetCollectionGUID:(id)a3 key:(id)a4 info:(id)a5;
- (void)dbQueueDeleteAssetCollectionWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteCommentWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteInvitationForAlbumWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueDeleteInvitationWithGUID:(id)a3 info:(id)a4;
- (void)dbQueueFlushAllPendingCommentCheckOperations;
- (void)dbQueueSetAccessControl:(id)a3 info:(id)a4;
- (void)dbQueueSetAlbum:(id)a3 info:(id)a4;
- (void)dbQueueSetAlbumMetadataAlbumGUID:(id)a3 key:(id)a4 value:(id)a5 info:(id)a6;
- (void)dbQueueSetAssetCollection:(id)a3 inAlbumWithGUID:(id)a4 info:(id)a5;
- (void)dbQueueSetAssetCollectionMetadataAssetCollectionGUID:(id)a3 key:(id)a4 value:(id)a5 info:(id)a6;
- (void)dbQueueSetComment:(id)a3 forAssetCollectionWithGUID:(id)a4 info:(id)a5;
- (void)dbQueueSetInvitation:(id)a3 info:(id)a4;
- (void)dbQueueSetUnviewedState:(BOOL)a3 onAlbumWithGUID:(id)a4 info:(id)a5;
- (void)dbQueueSetUnviewedState:(BOOL)a3 onAssetCollectionWithGUID:(id)a4 info:(id)a5;
- (void)dbQueueUpdateAlbumCtag:(id)a3;
- (void)deleteAlbumWithGUID:(id)a3;
- (void)deleteAlbumWithGUID:(id)a3 info:(id)a4;
- (void)deleteAssetCollectionWithGUID:(id)a3;
- (void)deleteAssetCollectionWithGUID:(id)a3 info:(id)a4;
- (void)deleteAssetCollectionsWithGUIDs:(id)a3;
- (void)deleteCommentWithGUID:(id)a3;
- (void)deleteCommentWithGUID:(id)a3 info:(id)a4;
- (void)enqueueCommand:(id)a3;
- (void)eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:(id)a3 unviewedCount:(int)a4 info:(id)a5;
- (void)eventQueuePerformBlockOnObservers:(id)a3;
- (void)flushAllPendingCommentCheckOperations;
- (void)forgetEverything;
- (void)forgetEverythingInfo:(id)a3;
- (void)forgetEverythingInfo:(id)a3 completionBlock:(id)a4;
- (void)markAlbumGUIDAsViewed:(id)a3;
- (void)markAlbumGUIDAsViewed:(id)a3 info:(id)a4;
- (void)markAlbumGUIDAsViewed:(id)a3 moveLastViewedAssetCollectionMarker:(BOOL)a4 info:(id)a5;
- (void)markAsSpamAlbumWithGUID:(id)a3 info:(id)a4;
- (void)markAsSpamInvitationWithGUID:(id)a3 info:(id)a4;
- (void)markAsSpamInvitationWithToken:(id)a3 info:(id)a4;
- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4;
- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 info:(id)a5;
- (void)modifyAlbumMetadata:(id)a3;
- (void)modifyAlbumMetadata:(id)a3 info:(id)a4;
- (void)performBlockOnObservers:(id)a3;
- (void)reconstruct;
- (void)refreshAccessControlListForAlbumWithGUID:(id)a3;
- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 info:(id)a4;
- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4;
- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 info:(id)a5;
- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4;
- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 info:(id)a5;
- (void)refreshResetSync:(BOOL)a3;
- (void)refreshResetSync:(BOOL)a3 info:(id)a4;
- (void)rejectInvitationWithGUID:(id)a3;
- (void)rejectInvitationWithGUID:(id)a3 info:(id)a4;
- (void)releaseBusy;
- (void)removeAccessControlEntryWithGUID:(id)a3;
- (void)removeAccessControlEntryWithGUID:(id)a3 info:(id)a4;
- (void)removeCommandsUpToCommandIndex:(int64_t)a3;
- (void)removeObserver:(id)a3;
- (void)retainBusy;
- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4;
- (void)retrieveAssetsFromAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4;
- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4;
- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 info:(id)a5;
- (void)setCommandQueue:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setFocusAlbumGUID:(id)a3;
- (void)setFocusAssetCollectionGUID:(id)a3;
- (void)setMSASCounterpartInstance:(id)a3;
- (void)setMaxGroupedCallbackEventBatchCount:(int)a3;
- (void)setMaxGroupedCallbackEventIdleInterval:(double)a3;
- (void)setMaxGroupedCallbackEventStaleness:(double)a3;
- (void)setMemberQueue:(id)a3;
- (void)setMigrationMarker:(id)a3;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 completionBlock:(id)a5;
- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 info:(id)a5 completionBlock:(id)a6;
- (void)setObservers:(id)a3;
- (void)setPendingChanges:(id)a3;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 completionBlock:(id)a5;
- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 info:(id)a5 completionBlock:(id)a6;
- (void)setUserInfo:(id)a3 forAccessControlWithGUID:(id)a4;
- (void)setUserInfo:(id)a3 forAlbumWithGUID:(id)a4;
- (void)setUserInfo:(id)a3 forAssetCollectionWithGUID:(id)a4;
- (void)setUserInfo:(id)a3 forCommentWithGUID:(id)a4;
- (void)setUserInfo:(id)a3 forInvitationWithGUID:(id)a4;
- (void)shutDown;
- (void)shutDownForDestruction:(BOOL)a3 completionBlock:(id)a4;
- (void)subscribeToAlbumWithGUID:(id)a3;
- (void)subscribeToAlbumWithGUID:(id)a3 info:(id)a4;
- (void)unsubscribeFromAlbumWithGUID:(id)a3;
- (void)unsubscribeFromAlbumWithGUID:(id)a3 info:(id)a4;
- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4;
- (void)videoURLForAssetCollectionWithGUID:(id)a3 completionBlock:(id)a4;
- (void)videoURLsForAssetCollectionWithGUID:(id)a3 forMediaAssetType:(unint64_t)a4 completionBlock:(id)a5;
@end

@implementation MSASServerSideModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

- (void)setPendingChanges:(id)a3
{
}

- (MSASPendingChanges)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setMemberQueue:(id)a3
{
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setCommandQueue:(id)a3
{
}

- (MSASServerSideModelGroupedCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setObservers:(id)a3
{
}

- (void)setDaemon:(id)a3
{
}

- (MSAlbumSharingDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (MSAlbumSharingDaemon *)WeakRetained;
}

- (void)setMSASCounterpartInstance:(id)a3
{
  self->_counterpartInstance = (MSASStateMachine *)a3;
}

- (MSASStateMachine)MSASCounterpartInstance
{
  return self->_counterpartInstance;
}

- (BOOL)errorIsCancellation:(id)a3
{
  return [a3 MSASStateMachineIsCanceledError];
}

- (void)MSASStateMachine:(id)a3 didFinishAddingComment:(id)a4 toAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7 error:(id)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v18 = [(MSASModelBase *)self dbQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke;
  v24[3] = &unk_1E6C3D3A8;
  id v25 = v17;
  v26 = self;
  id v27 = v13;
  id v28 = v14;
  id v29 = v16;
  id v30 = v15;
  id v19 = v15;
  id v20 = v16;
  id v21 = v14;
  id v22 = v13;
  id v23 = v17;
  dispatch_async(v18, v24);
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (!v2)
  {
    id v12 = a1[5];
    id v13 = a1[6];
    v6 = [a1[7] GUID];
    [v12 dbQueueSetComment:v13 forAssetCollectionWithGUID:v6 info:a1[8]];
LABEL_8:

    goto LABEL_9;
  }
  int v3 = [v2 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:16];
  id v4 = a1[4];
  if (v3)
  {
    v5 = [v4 userInfo];
    v6 = [v5 objectForKey:@"album"];

    v7 = [a1[4] userInfo];
    v8 = [v7 objectForKey:@"assetCollection"];

    v9 = [a1[5] daemon];
    id v10 = a1[4];
    v11 = [a1[5] personID];
    [v9 didReceiveTooManyCommentsError:v10 forAssetCollection:v8 inAlbum:v6 personID:v11];
LABEL_7:

    goto LABEL_8;
  }
  if ([v4 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:17])
  {
    id v14 = [a1[4] userInfo];
    v6 = [v14 objectForKey:@"album"];

    id v15 = [a1[4] userInfo];
    v8 = [v15 objectForKey:@"assetCollection"];

    v9 = [a1[5] daemon];
    id v16 = a1[4];
    v11 = [a1[5] personID];
    [v9 didReceiveCommentTooLongError:v16 forAssetCollection:v8 inAlbum:v6 personID:v11];
    goto LABEL_7;
  }
LABEL_9:
  id v17 = [a1[5] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E6C3D3A8;
  id v18 = a1[6];
  block[4] = a1[5];
  id v28 = v18;
  id v29 = a1[7];
  id v30 = a1[9];
  id v31 = a1[8];
  id v32 = a1[4];
  dispatch_async(v17, block);

  id v19 = a1[4];
  if (v19 && ([v19 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v22 = a1[5];
      id v23 = [a1[6] GUID];
      v24 = [a1[4] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v34 = v22;
      __int16 v35 = 2114;
      v36 = v23;
      __int16 v37 = 2114;
      v38 = v24;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add comment GUID %{public}@. Error: %{public}@. Deleting comment.", buf, 0x20u);
    }
    id v20 = [a1[5] dbQueue];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_609;
    v25[3] = &unk_1E6C3DB28;
    id v21 = a1[6];
    v25[4] = a1[5];
    id v26 = v21;
    dispatch_async(v20, v25);
  }
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D418;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_609(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) GUID];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  int v3 = [v2 MSASAddIsErrorRecovery];
  [v1 dbQueueDeleteCommentWithGUID:v4 info:v3];
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingComment_toAssetCollection_inAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishAddingComment:a1[5] toAssetCollection:a1[6] inAlbum:a1[7] info:a1[8] error:a1[9]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishAddingComment:a1[5] toAssetCollection:a1[6] inAlbum:a1[7] error:a1[9]];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishRemovingSharingRelationship:(id)a4 fromOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  block[4] = self;
  id v16 = v11;
  id v26 = v16;
  id v17 = v12;
  id v27 = v17;
  id v18 = v13;
  id v28 = v18;
  id v19 = v14;
  id v29 = v19;
  dispatch_async(v15, block);

  if (v19 && ([v19 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v24 = [v19 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v31 = self;
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2114;
      __int16 v35 = v24;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete sharing relationship %@. Error: %{public}@. Reset-syncing ACLs.", buf, 0x20u);
    }
    id v20 = [(MSASServerSideModel *)self stateMachine];
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
    id v22 = [MEMORY[0x1E4F1CA60] dictionary];
    id v23 = [v22 MSASAddIsErrorRecovery];
    [v20 getAccessControlsForAlbums:v21 info:v23];
  }
}

void __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke_2;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __103__MSASServerSideModel_MSASStateMachine_didFinishRemovingSharingRelationship_fromOwnedAlbum_info_error___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishRemovingAccessControlEntry:a1[5] fromAlbum:a1[6] info:a1[7] error:a1[8]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishRemovingAccessControlEntry:a1[5] fromAlbum:a1[6] error:a1[8]];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishSendingInvitationByPhone:(id)a4 toOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

void __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E019E3B0]();
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke_2;
  v4[3] = &unk_1E6C3D970;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v3 eventQueuePerformBlockOnObservers:v4];
}

void __98__MSASServerSideModel_MSASStateMachine_didFinishSendingInvitationByPhone_toOwnedAlbum_info_error___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishSendingInvitationByPhone:a1[5] toAlbum:a1[6] info:a1[7] error:a1[8]];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishAddingSharingRelationships:(id)a4 toOwnedAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v16 = v11;
  id v36 = v16;
  __int16 v37 = self;
  id v17 = v12;
  id v38 = v17;
  id v18 = v13;
  id v39 = v18;
  id v19 = v14;
  id v40 = v19;
  dispatch_async(v15, block);

  if (v19 && ([v19 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [v16 count];
      id v27 = [v19 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      v42 = self;
      __int16 v43 = 2048;
      uint64_t v44 = v26;
      __int16 v45 = 2114;
      v46 = v27;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add sharing %ld relationships. Error: %{public}@. Deleting and refreshing list.", buf, 0x20u);
    }
    id v20 = [MEMORY[0x1E4F1CA60] dictionary];
    id v21 = [v20 MSASAddIsErrorRecovery];

    id v22 = [(MSASModelBase *)self dbQueue];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    id v30 = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_606;
    id v31 = &unk_1E6C3D998;
    id v32 = v16;
    id v33 = self;
    id v34 = v21;
    id v23 = v21;
    dispatch_async(v22, &v28);

    id v24 = [(MSASServerSideModel *)self stateMachine];
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
    [v24 getAccessControlsForAlbums:v25 info:v23];
  }
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1E019E3B0]();
        v9 = *(void **)(a1 + 40);
        id v8 = *(void **)(a1 + 48);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_2;
        v11[3] = &unk_1E6C3D970;
        v11[4] = v9;
        v11[5] = v6;
        id v12 = v8;
        id v13 = *(id *)(a1 + 56);
        id v14 = *(id *)(a1 + 64);
        [v9 eventQueuePerformBlockOnObservers:v11];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_606(uint64_t a1)
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
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1E019E3B0](v3);
        v9 = *(void **)(a1 + 40);
        id v10 = objc_msgSend(v7, "GUID", (void)v11);
        [v9 dbQueueDeleteAccessControlWithGUID:v10 info:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

void __100__MSASServerSideModel_MSASStateMachine_didFinishAddingSharingRelationships_toOwnedAlbum_info_error___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishAddingAccessControlEntry:a1[5] toAlbum:a1[6] info:a1[7] error:a1[8]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishAddingAccessControlEntry:a1[5] toAlbum:a1[6] error:a1[8]];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishAddingAssetCollection:(id)a4 toAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    long long v17 = (void *)[v13 copy];
    long long v18 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke;
    block[3] = &unk_1E6C3D9E8;
    void block[4] = self;
    id v22 = v14;
    id v23 = v16;
    id v24 = v17;
    id v25 = v15;
    id v19 = v17;
    dispatch_async(v18, block);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [v16 MSVerboseDescription];
    *(_DWORD *)buf = 138543618;
    id v27 = self;
    __int16 v28 = 2114;
    uint64_t v29 = v20;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add empty asset collection. Error: %{public}@.", buf, 0x16u);
  }
}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] GUID];
  uint64_t v4 = [v2 dbQueueLookupOrCreateAlbumWithGUID:v3];

  id v5 = a1[6];
  if (v5)
  {
    if ([v5 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:14])
    {
      uint64_t v6 = [a1[4] daemon];
      id v7 = a1[6];
      id v8 = [a1[4] personID];
      [v6 didReceiveTooManyPhotosError:v7 forAlbum:v4 personID:v8];
    }
  }
  else
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v34 = 0u;
    v9 = [a1[7] assets];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v35;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v35 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v34 + 1) + 8 * v13++) setPath:0];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v11);
    }

    id v14 = [a1[5] GUID];
    [a1[7] setAlbumGUID:v14];

    id v15 = a1[7];
    id v16 = a1[4];
    long long v17 = [a1[5] GUID];
    [v16 dbQueueSetAssetCollection:v15 inAlbumWithGUID:v17 info:a1[8]];
  }
  long long v18 = [a1[4] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = a1[4];
  id v30 = a1[7];
  id v19 = v4;
  id v31 = v19;
  id v32 = a1[8];
  id v33 = a1[6];
  dispatch_async(v18, block);

  id v20 = a1[6];
  if (v20 && ([v20 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v24 = a1[4];
      id v25 = a1[7];
      uint64_t v26 = [a1[6] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v39 = v24;
      __int16 v40 = 2114;
      id v41 = v25;
      __int16 v42 = 2114;
      __int16 v43 = v26;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to add asset collection %{public}@. Error: %{public}@. Deleting asset collection and cancelling pending commands.", buf, 0x20u);
    }
    id v21 = [a1[4] dbQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_601;
    v27[3] = &unk_1E6C3DB28;
    v27[4] = a1[4];
    id v28 = a1[7];
    dispatch_async(v21, v27);

    id v22 = [a1[4] stateMachine];
    id v23 = [a1[7] GUID];
    [v22 cancelOutstandingCommandsForAssetCollectionWithGUID:v23];
  }
}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_601(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) GUID];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [v2 MSASAddIsErrorRecovery];
  [v1 deleteAssetCollectionWithGUID:v4 info:v3];
}

void __90__MSASServerSideModel_MSASStateMachine_didFinishAddingAssetCollection_toAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v12 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    id v7 = [v3 _protocolErrorForUnderlyingError:a1[8]];
    [v12 MSASModel:v3 didFinishAddingAssetCollection:v4 toAlbum:v5 info:v6 error:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v11 = [v8 _protocolErrorForUnderlyingError:a1[8]];
    [v12 MSASModel:v8 didFinishAddingAssetCollection:v9 toAlbum:v10 error:v11];
  }
}

- (void)MSASStateMachine:(id)a3 didRequestAssetsForAddingAssetCollections:(id)a4 inAlbum:(id)a5 specifications:(id)a6 info:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v21 = v11;
  id v22 = v13;
  id v23 = v14;
  id v24 = v12;
  id v16 = v12;
  id v17 = v14;
  id v18 = v13;
  id v19 = v11;
  dispatch_async(v15, block);
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke(id *a1)
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v2 = a1[4];
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  uint64_t v6 = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_2;
  id v7 = &unk_1E6C3D490;
  id v13 = &v14;
  id v8 = v2;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = a1[8];
  [v2 eventQueuePerformBlockOnObservers:&v4];
  if (!*((unsigned char *)v15 + 24))
  {
    id v3 = objc_msgSend(a1[4], "stateMachine", v4, v5, v6, v7, v8, v9, v10, v11);
    [v3 continueAddingAssetCollections:0 skipAssetCollections:a1[5] toAlbum:a1[8] info:a1[7]];
  }
  _Block_object_dispose(&v14, 8);
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v5;
      __int16 v33 = 2048;
      uint64_t v34 = v6;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting derivatives for %ld photos.", buf, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v20;
      __int16 v33 = 2114;
      uint64_t v34 = v21;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Specs: %{public}@", buf, 0x16u);
    }
    id v7 = [*(id *)(a1 + 32) daemon];
    [v7 retainBusy];

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_591;
    v28[3] = &unk_1E6C3D440;
    v28[4] = v8;
    id v29 = v4;
    id v30 = *(id *)(a1 + 64);
    id v12 = v4;
    [v3 MSASModel:v8 didRequestDerivativesForAssetCollections:v9 specifications:v10 info:v11 completionBlock:v28];
  }
  if (objc_opt_respondsToSelector())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    id v13 = [MEMORY[0x1E4F1C9C8] date];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [*(id *)(a1 + 40) count];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v14;
      __int16 v33 = 2048;
      uint64_t v34 = v15;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Requesting derivatives for %ld photos.", buf, 0x16u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v23 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v22;
      __int16 v33 = 2114;
      uint64_t v34 = v23;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Specs: %{public}@", buf, 0x16u);
    }
    uint64_t v16 = [*(id *)(a1 + 32) daemon];
    [v16 retainBusy];

    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_595;
    v24[3] = &unk_1E6C3D468;
    void v24[4] = v17;
    id v25 = v13;
    id v26 = *(id *)(a1 + 64);
    id v27 = *(id *)(a1 + 56);
    id v19 = v13;
    [v3 MSASModel:v17 didRequestDerivativesForAssetCollections:v18 specifications:0 completionBlock:v24];
  }
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_591(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v19 = 138543874;
    uint64_t v20 = v10;
    __int16 v21 = 2048;
    uint64_t v22 = [v7 count];
    __int16 v23 = 2048;
    uint64_t v24 = [v8 count];
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Received derivatives for %ld photos, and received rejections for %ld photos.", (uint8_t *)&v19, 0x20u);
  }
  if ([v7 count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v13 = v12;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = [v7 count];
      unint64_t v18 = [v7 count];
      int v19 = 138544130;
      uint64_t v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = *(void *)&v13;
      __int16 v25 = 2048;
      double v26 = v13 / (double)v18;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Computing derivatives for %ld photos took %.2f seconds, or %.2f per photo.", (uint8_t *)&v19, 0x2Au);
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) stateMachine];
  [v14 continueAddingAssetCollections:v7 skipAssetCollections:v8 toAlbum:*(void *)(a1 + 48) info:v9];

  uint64_t v15 = [*(id *)(a1 + 32) daemon];
  [v15 releaseBusy];
}

void __110__MSASServerSideModel_MSASStateMachine_didRequestAssetsForAddingAssetCollections_inAlbum_specifications_info___block_invoke_595(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v16 = 138543874;
    uint64_t v17 = v7;
    __int16 v18 = 2048;
    uint64_t v19 = [v5 count];
    __int16 v20 = 2048;
    uint64_t v21 = [v6 count];
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Received derivatives for %ld photos, and received rejections for %ld photos.", (uint8_t *)&v16, 0x20u);
  }
  if ([v5 count])
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v10 = v9;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [v5 count];
      unint64_t v15 = [v5 count];
      int v16 = 138544130;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = *(void *)&v10;
      __int16 v22 = 2048;
      double v23 = v10 / (double)v15;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Computing derivatives for %ld photos took %.2f seconds, or %.2f per photo.", (uint8_t *)&v16, 0x2Au);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) stateMachine];
  [v11 continueAddingAssetCollections:v5 skipAssetCollections:v6 toAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];

  double v12 = [*(id *)(a1 + 32) daemon];
  [v12 releaseBusy];
}

- (void)MSASStateMachine:(id)a3 didFinishUpdatingAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  double v12 = [(MSASServerSideModel *)self eventQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke_2;
  id v14 = &unk_1E6C3D938;
  id v15 = v2;
  id v16 = a1[5];
  id v17 = a1[6];
  id v18 = a1[7];
  [v2 eventQueuePerformBlockOnObservers:&v11];
  id v3 = a1[7];
  if (v3 && (objc_msgSend(v3, "MSASStateMachineIsCanceledError", v11, v12, v13, v14, v15, v16, v17) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v8 = a1[4];
      id v9 = a1[5];
      id v10 = [a1[7] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v9;
      __int16 v23 = 2114;
      uint64_t v24 = v10;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to update album %{public}@. Error: %{public}@. Re-reading album metadata.", buf, 0x20u);
    }
    uint64_t v4 = [a1[4] stateMachine];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObject:a1[5]];
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = [v6 MSASAddIsErrorRecovery];
    [v4 checkForUpdatesInAlbums:v5 resetSync:0 info:v7];
  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAlbum_info_error___block_invoke_2(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishModifyingAlbumMetadata:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishModifyingAlbumMetadata:v8 error:v9];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishCreatingAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v9;
  id v18 = v11;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(v12, v16);
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = a1[5];
  if (v3)
  {
    if ([v3 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:13])
    {
      uint64_t v4 = [a1[6] daemon];
      id v5 = a1[5];
      id v6 = [a1[6] personID];
      [v4 didReceiveTooManyAlbumsError:v5 personID:v6];
    }
  }
  else
  {
    id v7 = a1[6];
    uint64_t v8 = [a1[4] GUID];
    id v9 = [v7 dbQueueLookupOrCreateAlbumWithGUID:v8];

    id v10 = [a1[4] ctag];
    [v9 setCtag:v10];

    id v11 = [a1[4] clientOrgKey];
    [v9 setClientOrgKey:v11];

    [a1[6] dbQueueSetAlbum:v9 info:a1[7]];
    id v2 = v9;
  }
  uint64_t v12 = [a1[6] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E6C3D9C0;
  void block[4] = a1[6];
  id v13 = v2;
  id v28 = v13;
  id v29 = a1[7];
  id v30 = a1[5];
  dispatch_async(v12, block);

  id v14 = a1[5];
  if (v14 && ([v14 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v18 = a1[6];
      id v19 = a1[4];
      id v20 = [a1[5] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v32 = v18;
      __int16 v33 = 2114;
      id v34 = v19;
      __int16 v35 = 2114;
      long long v36 = v20;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to create album %{public}@. Error: %{public}@.", buf, 0x20u);
    }
    id v15 = [a1[6] dbQueue];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    __int16 v23 = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_584;
    uint64_t v24 = &unk_1E6C3DB28;
    id v25 = a1[6];
    id v26 = a1[4];
    dispatch_async(v15, &v21);

    id v16 = objc_msgSend(a1[6], "stateMachine", v21, v22, v23, v24, v25);
    id v17 = [a1[4] GUID];
    [v16 cancelOutstandingCommandsForAlbumWithGUID:v17];
  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_584(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) GUID];
  id v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = [v2 MSASAddIsErrorRecovery];
  [v1 dbQueueDeleteAlbumWithGUID:v4 info:v3];
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishCreatingAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishAddingAlbum:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishAddingAlbum:v8 error:v9];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishDeletingComment:(id)a4 inAssetCollection:(id)a5 inAlbum:(id)a6 info:(id)a7 error:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(MSASServerSideModel *)self eventQueue];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  id v32 = __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke;
  __int16 v33 = &unk_1E6C3D3A8;
  id v34 = self;
  id v19 = v13;
  id v35 = v19;
  id v20 = v14;
  id v36 = v20;
  id v21 = v15;
  id v37 = v21;
  id v22 = v16;
  id v38 = v22;
  id v23 = v17;
  id v39 = v23;
  dispatch_async(v18, &v30);

  if (v23
    && (objc_msgSend(v23, "MSASStateMachineIsCanceledError", v30, v31, v32, v33, v34, v35, v36, v37, v38) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v27 = [v19 ID];
      id v28 = [v20 GUID];
      id v29 = [v23 MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      id v41 = self;
      __int16 v42 = 1024;
      int v43 = v27;
      __int16 v44 = 2114;
      uint64_t v45 = v28;
      __int16 v46 = 2114;
      uint64_t v47 = v29;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete comment ID %d in asset collection GUID %{public}@. Error: %{public}@. Reset-syncing comments.", buf, 0x26u);
    }
    uint64_t v24 = [v20 GUID];
    id v25 = [MEMORY[0x1E4F1CA60] dictionary];
    id v26 = [v25 MSASAddIsErrorRecovery];
    [(MSASServerSideModel *)self refreshCommentsForAssetCollectionWithGUID:v24 resetSync:1 info:v26];
  }
}

void __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke_2;
  v3[3] = &unk_1E6C3D418;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __102__MSASServerSideModel_MSASStateMachine_didFinishDeletingComment_inAssetCollection_inAlbum_info_error___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishDeletingComment:a1[5] fromAssetCollection:a1[6] inAlbum:a1[7] info:a1[8] error:a1[9]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishDeletingComment:a1[5] fromAssetCollection:a1[6] inAlbum:a1[7] error:a1[9]];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishDeletingAssetCollection:(id)a4 inAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  dispatch_async(v15, block);
}

void __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] GUID];
  id v4 = [v2 dbQueueLookupOrCreateAssetCollectionWithGUID:v3 outAlbum:0];

  id v5 = [a1[4] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_2;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = a1[4];
  id v6 = v4;
  id v16 = v6;
  id v17 = a1[6];
  id v18 = a1[7];
  id v19 = a1[8];
  dispatch_async(v5, block);

  id v7 = a1[8];
  if (v7 && ([v7 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v12 = a1[4];
      id v13 = a1[5];
      id v14 = [a1[8] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v21 = v12;
      __int16 v22 = 2114;
      id v23 = v13;
      __int16 v24 = 2114;
      id v25 = v14;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete asset collection %{public}@. Error: %{public}@. Reset-syncing album.", buf, 0x20u);
    }
    id v8 = a1[4];
    id v9 = [a1[6] GUID];
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = [v10 MSASAddIsErrorRecovery];
    [v8 refreshContentOfAlbumWithGUID:v9 resetSync:1 info:v11];
  }
}

void __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __92__MSASServerSideModel_MSASStateMachine_didFinishDeletingAssetCollection_inAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v12 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    id v7 = [v3 _protocolErrorForUnderlyingError:a1[8]];
    [v12 MSASModel:v3 didFinishDeletingAssetCollection:v4 fromAlbum:v5 info:v6 error:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    id v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    id v11 = [v8 _protocolErrorForUnderlyingError:a1[8]];
    [v12 MSASModel:v8 didFinishDeletingAssetCollection:v9 fromAlbum:v10 error:v11];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishDeletingAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(v12, v16);
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  id v3 = [a1[5] GUID];
  uint64_t v4 = [v2 dbQueueLookupOrCreateAlbumWithGUID:v3];

  uint64_t v5 = [a1[4] eventQueue];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_2;
  id v17 = &unk_1E6C3D9C0;
  id v18 = a1[4];
  id v6 = v4;
  id v19 = v6;
  id v20 = a1[6];
  id v21 = a1[7];
  dispatch_async(v5, &v14);

  id v7 = a1[7];
  if (v7 && (objc_msgSend(v7, "MSASStateMachineIsCanceledError", v14, v15, v16, v17, v18, v19, v20) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v11 = a1[4];
      id v12 = a1[5];
      id v13 = [a1[7] MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v23 = v11;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      int v27 = v13;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete album %{public}@. Error: %{public}@. Reset-syncing album list.", buf, 0x20u);
    }
    id v8 = a1[4];
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v10 = [v9 MSASAddIsErrorRecovery];
    [v8 refreshResetSync:1 info:v10];
  }
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __74__MSASServerSideModel_MSASStateMachine_didFinishDeletingAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishDeletingAlbum:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishDeletingAlbum:v8 error:v9];
  }
}

- (BOOL)MSASStateMachine:(id)a3 didQueryIsAssetCollectionWithGUIDInModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__MSASServerSideModel_MSASStateMachine_didQueryIsAssetCollectionWithGUIDInModel___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v12 = v7;
  id v13 = &v14;
  void block[4] = self;
  id v9 = v7;
  dispatch_sync(v8, block);

  LOBYTE(v7) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)v7;
}

uint64_t __81__MSASServerSideModel_MSASStateMachine_didQueryIsAssetCollectionWithGUIDInModel___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueAssetCollectionWithGUID:*(void *)(a1 + 40) outObject:0 outCtag:0 outAlbumGUID:0 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6923;
  id v19 = __Block_byref_object_dispose__6924;
  id v20 = 0;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__MSASServerSideModel_MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID_info___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v13 = v6;
  uint64_t v14 = &v15;
  id v9 = v6;
  dispatch_sync(v8, block);

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __105__MSASServerSideModel_MSASStateMachineDidRequestAssetCollectionStateCtagForAssetCollectionWithGUID_info___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v1 key:@"stateCtag" outValue:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)MSASStateMachineDidRequestAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  uint64_t v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MSASServerSideModel_MSASStateMachineDidRequestAlbumWithGUID___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__MSASServerSideModel_MSASStateMachineDidRequestAlbumWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAlbumWithGUID:v1 outObject:&obj outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6923;
  id v19 = __Block_byref_object_dispose__6924;
  id v20 = 0;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v13 = v6;
  uint64_t v14 = &v15;
  id v9 = v6;
  dispatch_sync(v8, block);

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumURLStringForAlbumWithGUID_info___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAlbumWithGUID:v1 outObject:0 outName:0 outCtag:0 outForeignCtag:0 outURLString:&obj outUserInfoData:0 outClientOrgKey:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__6923;
  id v19 = __Block_byref_object_dispose__6924;
  id v20 = 0;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v13 = v6;
  uint64_t v14 = &v15;
  id v9 = v6;
  dispatch_sync(v8, block);

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __85__MSASServerSideModel_MSASStateMachineDidRequestAlbumStateCtagForAlbumWithGUID_info___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAlbumMetadataWithAlbumGUID:v1 key:@"stateCtag" outValue:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (void)MSASStateMachine:(id)a3 didFinishSettingSyncedStateForAssetCollection:(id)a4 inAlbum:(id)a5 assetStateCtag:(id)a6 info:(id)a7 error:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __120__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAssetCollection_inAlbum_assetStateCtag_info_error___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v19 = v17;
  id v29 = v19;
  uint64_t v30 = self;
  id v20 = v13;
  id v31 = v20;
  id v21 = v15;
  id v32 = v21;
  id v22 = v16;
  id v33 = v22;
  dispatch_async(v18, block);

  if (v19 && ([v19 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v27 = [v19 MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      id v35 = self;
      __int16 v36 = 2114;
      id v37 = v20;
      __int16 v38 = 2114;
      id v39 = v14;
      __int16 v40 = 2114;
      id v41 = v27;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for asset collection %{public}@ in album %{public}@. Error: %{public}@. Requesting latest state.", buf, 0x2Au);
    }
    id v23 = [(MSASServerSideModel *)self stateMachine];
    __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
    id v25 = [MEMORY[0x1E4F1CA60] dictionary];
    __int16 v26 = [v25 MSASAddIsErrorRecovery];
    [v23 checkForAlbumSyncedStateChangesInAlbums:v24 info:v26];
  }
}

void __120__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAssetCollection_inAlbum_assetStateCtag_info_error___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 48) GUID];
    [v2 dbQueueSetAssetCollectionMetadataAssetCollectionGUID:v3 key:@"stateCtag" value:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishSettingSyncedStateForAlbum:(id)a4 info:(id)a5 error:(id)a6 newAlbumStateCtag:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAlbum_info_error_newAlbumStateCtag___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v16 = v13;
  id v26 = v16;
  int v27 = self;
  id v17 = v11;
  id v28 = v17;
  id v18 = v14;
  id v29 = v18;
  id v19 = v12;
  id v30 = v19;
  dispatch_async(v15, block);

  if (v16 && ([v16 MSASStateMachineIsCanceledError] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = [v16 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      id v32 = self;
      __int16 v33 = 2114;
      id v34 = v17;
      __int16 v35 = 2114;
      __int16 v36 = v24;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to set synced state for album %{public}@. Error: %{public}@. Requesting latest state.", buf, 0x20u);
    }
    id v20 = [(MSASServerSideModel *)self stateMachine];
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObject:v17];
    id v22 = [MEMORY[0x1E4F1CA60] dictionary];
    id v23 = [v22 MSASAddIsErrorRecovery];
    [v20 checkForAlbumSyncedStateChangesInAlbums:v21 info:v23];
  }
}

void __105__MSASServerSideModel_MSASStateMachine_didFinishSettingSyncedStateForAlbum_info_error_newAlbumStateCtag___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 48) GUID];
    [v2 dbQueueSetAlbumMetadataAlbumGUID:v3 key:@"stateCtag" value:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForAlbumSyncedStateChangesInAlbum:(id)a4 info:(id)a5 error:(id)a6 newAlbumStateCtag:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MSASModelBase *)self dbQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __120__MSASServerSideModel_MSASStateMachine_didFinishCheckingForAlbumSyncedStateChangesInAlbum_info_error_newAlbumStateCtag___block_invoke;
  v23[3] = &unk_1E6C3D3A8;
  id v24 = v15;
  id v25 = self;
  id v26 = v13;
  id v27 = v16;
  id v28 = v14;
  id v29 = v12;
  id v18 = v12;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v15;
  dispatch_async(v17, v23);
}

void __120__MSASServerSideModel_MSASStateMachine_didFinishCheckingForAlbumSyncedStateChangesInAlbum_info_error_newAlbumStateCtag___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    id v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 48) GUID];
    [v2 dbQueueSetAlbumMetadataAlbumGUID:v3 key:@"stateCtag" value:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
  }
  id v4 = [*(id *)(a1 + 40) pendingChanges];
  uint64_t v5 = [*(id *)(a1 + 48) GUID];
  [v4 removePendingKeyValueChangesForAlbumGUID:v5];

  id v6 = [*(id *)(a1 + 40) pendingChanges];
  LOBYTE(v5) = [v6 hasPendingChanges];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album synced state", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) MSASStateMachine:*(void *)(a1 + 72) didFinishCheckingForChangesInfo:*(void *)(a1 + 64) error:*(void *)(a1 + 32)];
  }
}

- (void)MSASStateMachine:(id)a3 didFindAlbumSyncedState:(id)a4 forAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __78__MSASServerSideModel_MSASStateMachine_didFindAlbumSyncedState_forAlbum_info___block_invoke;
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

void __78__MSASServerSideModel_MSASStateMachine_didFindAlbumSyncedState_forAlbum_info___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) dbQueueBeginTransaction];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 40);
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
        int v8 = (void *)MEMORY[0x1E019E3B0](v3);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7, (void)v14);
        id v10 = *(void **)(a1 + 32);
        id v11 = [*(id *)(a1 + 48) GUID];
        [v10 dbQueueSetAlbumMetadataAlbumGUID:v11 key:v7 value:v9 info:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }

  [*(id *)(a1 + 32) dbQueueEndTransaction];
  id v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 48) GUID];
  [v12 dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:v13 info:*(void *)(a1 + 56)];
}

- (void)MSASStateMachine:(id)a3 didFindAssetCollectionSyncedState:(id)a4 forAssetCollectionGUID:(id)a5 inAlbum:(id)a6 assetCollectionStateCtag:(id)a7 info:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  long long v16 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionSyncedState_forAssetCollectionGUID_inAlbum_assetCollectionStateCtag_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v15;
  id v25 = v14;
  id v17 = v14;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v16, block);
}

uint64_t __135__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionSyncedState_forAssetCollectionGUID_inAlbum_assetCollectionStateCtag_info___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) dbQueueBeginTransaction];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 40);
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
        int v8 = (void *)MEMORY[0x1E019E3B0](v3);
        id v9 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v7, (void)v11);
        [*(id *)(a1 + 32) dbQueueSetAssetCollectionMetadataAssetCollectionGUID:*(void *)(a1 + 48) key:v7 value:v9 info:*(void *)(a1 + 56)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }

  [*(id *)(a1 + 32) dbQueueEndTransaction];
  [*(id *)(a1 + 32) dbQueueSetAssetCollectionMetadataAssetCollectionGUID:*(void *)(a1 + 48) key:@"stateCtag" value:*(void *)(a1 + 64) info:*(void *)(a1 + 56)];
  return [*(id *)(a1 + 32) dbQueueCheckToClearUnviewedStateOnAssetCollectionWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForCommentChangesInAssetCollectionWithGUID:(id)a4 largestCommentID:(int)a5 info:(id)a6 error:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  long long v14 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__MSASServerSideModel_MSASStateMachine_didFinishCheckingForCommentChangesInAssetCollectionWithGUID_largestCommentID_info_error___block_invoke;
  block[3] = &unk_1E6C3D3F0;
  int v23 = a5;
  id v19 = v13;
  id v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(v14, block);
}

void __128__MSASServerSideModel_MSASStateMachine_didFinishCheckingForCommentChangesInAssetCollectionWithGUID_largestCommentID_info_error___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", *(unsigned int *)(a1 + 64));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) dbQueueSetAssetCollectionMetadataAssetCollectionGUID:*(void *)(a1 + 48) key:@"largestCommentID" value:v2 info:*(void *)(a1 + 56)];
  }
}

- (void)MSASStateMachine:(id)a3 didFindCommentChanges:(id)a4 inAssetCollectionWithGUID:(id)a5 inAlbumWithGUID:(id)a6 info:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__MSASServerSideModel_MSASStateMachine_didFindCommentChanges_inAssetCollectionWithGUID_inAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  void block[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v23 = v11;
  id v24 = v14;
  id v16 = v14;
  id v17 = v11;
  id v18 = v13;
  id v19 = v12;
  dispatch_async(v15, block);
}

void __109__MSASServerSideModel_MSASStateMachine_didFindCommentChanges_inAssetCollectionWithGUID_inAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v79 = 0;
  int v4 = [v2 dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v3 key:@"lastcommentposition" outValue:&v79];
  id v5 = v79;
  uint64_t v6 = v5;
  if (v4) {
    int v61 = [v5 intValue];
  }
  else {
    int v61 = -1;
  }
  int v64 = [*(id *)(a1 + 32) dbQueueAssetCollectionContainsCommentsFromMeAssetCollectionGUID:*(void *)(a1 + 40)];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v77 = 0;
  id v78 = 0;
  id v76 = 0;
  int v9 = [v7 dbQueueAlbumWithGUID:v8 outObject:&v78 outName:0 outCtag:&v77 outForeignCtag:&v76 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v10 = v78;
  id v11 = v77;
  id v12 = v76;
  if (v9)
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 48);
    id v75 = 0;
    int v15 = [v13 dbQueueAlbumMetadataWithAlbumGUID:v14 key:@"lastviewedctag" outValue:&v75];
    id v16 = v75;
    if (v15)
    {
      if ([v10 useForeignCtag]) {
        id v17 = v12;
      }
      else {
        id v17 = v11;
      }
      int v18 = 1;
      if (v16 && v17) {
        int v18 = objc_msgSend(v16, "isEqualToString:") ^ 1;
      }
    }
    else
    {
      int v18 = 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  id v19 = (void *)[*(id *)(a1 + 56) mutableCopy];
  [v19 sortUsingComparator:&__block_literal_global_575];
  [*(id *)(a1 + 32) beginTransaction];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v80 count:16];
  if (!v21)
  {

    goto LABEL_49;
  }
  uint64_t v22 = v21;
  int v55 = v18;
  id v56 = v12;
  id v57 = v10;
  id v58 = v11;
  v59 = v6;
  char v62 = 0;
  uint64_t v23 = *(void *)v72;
  id v63 = v20;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v72 != v23) {
        objc_enumerationMutation(v20);
      }
      id v25 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      id v26 = (void *)MEMORY[0x1E019E3B0]();
      if (![v25 type])
      {
        id v32 = [v25 comment];
        __int16 v33 = *(void **)(a1 + 32);
        uint64_t v34 = [v32 ID];
        uint64_t v35 = *(void *)(a1 + 40);
        id v70 = 0;
        LODWORD(v33) = [v33 dbQueueCommentWithID:v34 assetCollectionGUID:v35 outObject:&v70 outGUID:0 outTimestamp:0 outIsCaption:0 outUserInfoData:0];
        id v36 = v70;
        uint64_t v37 = v36;
        if (v33)
        {
          __int16 v38 = [v36 GUID];
          [v32 setGUID:v38];
        }
        if (([v32 isMine] & 1) != 0 || (int)objc_msgSend(v32, "ID") <= v61)
        {
          char v48 = 0;
        }
        else
        {
          id v39 = *(void **)(a1 + 32);
          uint64_t v40 = *(void *)(a1 + 40);
          id v68 = 0;
          id v69 = 0;
          int v41 = [v39 dbQueueAssetCollectionWithGUID:v40 outObject:&v69 outCtag:0 outAlbumGUID:&v68 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
          id v42 = v69;
          id v43 = v68;
          id v44 = v43;
          if (v41)
          {
            uint64_t v45 = *(void **)(a1 + 32);
            id v67 = 0;
            __int16 v46 = v44;
            int v47 = [v45 dbQueueAlbumWithGUID:v44 outObject:&v67 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
            id v60 = v67;
            if (v47) {
              int v47 = ([v32 isLike] ^ 1) & v64;
            }
            char v48 = [v42 isMine] | v47;
          }
          else
          {
            __int16 v46 = v43;
            char v48 = 0;
          }
        }
        v53 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 64)];
        if (v48)
        {
          char v62 = 1;
        }
        else
        {
          v54 = [NSNumber numberWithBool:1];
          [v53 setObject:v54 forKey:@"notInteresting"];
        }
        [*(id *)(a1 + 32) dbQueueSetComment:v32 forAssetCollectionWithGUID:*(void *)(a1 + 40) info:v53];
        v64 |= [v32 isMine];

        id v20 = v63;
        goto LABEL_42;
      }
      if ([v25 type] == 1)
      {
        id v27 = *(void **)(a1 + 32);
        id v28 = [v25 comment];
        uint64_t v29 = [v28 ID];
        uint64_t v30 = *(void *)(a1 + 40);
        id v66 = 0;
        int v31 = [v27 dbQueueCommentWithID:v29 assetCollectionGUID:v30 outObject:0 outGUID:&v66 outTimestamp:0 outIsCaption:0 outUserInfoData:0];
        id v32 = v66;

        if (!v31) {
          goto LABEL_42;
        }
LABEL_34:
        [*(id *)(a1 + 32) dbQueueDeleteCommentWithGUID:v32 info:*(void *)(a1 + 64)];
        goto LABEL_42;
      }
      if ([v25 type] != 2) {
        goto LABEL_43;
      }
      v49 = *(void **)(a1 + 32);
      uint64_t v50 = [v25 deletionIndex];
      uint64_t v51 = *(void *)(a1 + 40);
      id v65 = 0;
      int v52 = [v49 dbQueueCommentWithID:v50 assetCollectionGUID:v51 outObject:0 outGUID:&v65 outTimestamp:0 outIsCaption:0 outUserInfoData:0];
      id v32 = v65;
      if (v52) {
        goto LABEL_34;
      }
LABEL_42:

LABEL_43:
    }
    uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v80 count:16];
  }
  while (v22);

  id v11 = v58;
  uint64_t v6 = v59;
  id v12 = v56;
  id v10 = v57;
  if (v62)
  {
    [*(id *)(a1 + 32) dbQueueSetUnviewedState:1 onAssetCollectionWithGUID:*(void *)(a1 + 40) info:*(void *)(a1 + 64)];
    if (v55) {
      [*(id *)(a1 + 32) dbQueueSetUnviewedState:1 onAlbumWithGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 64)];
    }
  }
LABEL_49:
  [*(id *)(a1 + 32) endTransaction];
}

uint64_t __109__MSASServerSideModel_MSASStateMachine_didFindCommentChanges_inAssetCollectionWithGUID_inAlbumWithGUID_info___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 comment];
  int v7 = [v6 ID];
  uint64_t v8 = [v5 comment];
  int v9 = [v8 ID];

  if (v7 >= v9)
  {
    id v11 = [v4 comment];
    int v12 = [v11 ID];
    id v13 = [v5 comment];
    uint64_t v10 = v12 > (int)[v13 ID];
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

- (void)MSASStateMachine:(id)a3 didFinishRetrievingAsset:(id)a4 inAlbum:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] GUID];
  LODWORD(v2) = [v2 dbQueueAlbumWithGUID:v3 outObject:0 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];

  if (v2)
  {
    id v4 = [a1[4] eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_2;
    block[3] = &unk_1E6C3D9C0;
    id v5 = (id *)v17;
    id v6 = a1[6];
    id v7 = a1[4];
    id v8 = a1[5];
    v17[0] = v6;
    v17[1] = v7;
    id v18 = v8;
    id v19 = a1[7];
    dispatch_async(v4, block);

LABEL_3:
    return;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v11 = a1[4];
    int v12 = [a1[6] GUID];
    id v13 = [a1[5] GUID];
    *(_DWORD *)buf = 138543874;
    id v21 = v11;
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    id v25 = v13;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Downloaded asset GUID %{public}@ for an album GUID %{public}@ that no lenger exists. Ignoring.", buf, 0x20u);
  }
  if (!a1[7])
  {
    id v9 = [a1[6] path];

    if (v9)
    {
      id v10 = [a1[4] eventQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_572;
      v14[3] = &unk_1E6C3DA38;
      id v5 = &v15;
      id v15 = a1[6];
      dispatch_async(v10, v14);

      goto LABEL_3;
    }
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_2(id *a1)
{
  id v2 = [a1[4] path];
  uint64_t v3 = (void *)[v2 copy];

  id v4 = a1[5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_3;
  v8[3] = &unk_1E6C3D938;
  v8[4] = v4;
  id v9 = a1[4];
  id v10 = a1[6];
  id v11 = a1[7];
  [v4 eventQueuePerformBlockOnObservers:v8];
  if (!a1[7] && v3)
  {
    id v5 = [a1[5] eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_4;
    block[3] = &unk_1E6C3DA38;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_572(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v2 = [*(id *)(a1 + 32) path];
  [v3 removeItemAtPath:v2 error:0];
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_3(uint64_t *a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    if (a1[7])
    {
      id v6 = objc_msgSend((id)a1[4], "_protocolErrorForUnderlyingError:");
      [v7 MSASModel:v3 didFinishRetrievingAsset:v4 inAlbum:v5 error:v6];
    }
    else
    {
      [v7 MSASModel:a1[4] didFinishRetrievingAsset:a1[5] inAlbum:a1[6] error:0];
    }
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishRetrievingAsset_inAlbum_error___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v2 removeItemAtPath:*(void *)(a1 + 32) error:0];
}

- (void)MSASStateMachine:(id)a3 didFinishEnqueueingAssetsForDownload:(id)a4 inAlbumWithGUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__MSASServerSideModel_MSASStateMachine_didFinishEnqueueingAssetsForDownload_inAlbumWithGUID___block_invoke;
  v11[3] = &unk_1E6C3D908;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(MSASServerSideModel *)self eventQueuePerformBlockOnObservers:v11];
}

void __93__MSASServerSideModel_MSASStateMachine_didFinishEnqueueingAssetsForDownload_inAlbumWithGUID___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishEnqueueingAssetsForDownload:a1[5] inAlbumWithGUID:a1[6]];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishUnsubscribingFromAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v11;
  id v18 = v9;
  id v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, v16);
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v2 = [a1[6] eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_6;
    block[3] = &unk_1E6C3D9C0;
    int8x16_t v18 = *(int8x16_t *)(a1 + 5);
    id v3 = (id)v18.i64[0];
    int8x16_t v21 = vextq_s8(v18, v18, 8uLL);
    id v22 = a1[7];
    id v23 = a1[4];
    dispatch_async(v2, block);

    if (([a1[4] MSASStateMachineIsCanceledError] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v15 = a1[6];
        id v16 = [a1[5] GUID];
        id v17 = [a1[4] MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        id v34 = v15;
        __int16 v35 = 2114;
        id v36 = v16;
        __int16 v37 = 2114;
        __int16 v38 = v17;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to unsubscribe from album GUID %{public}@. Error: %{public}@. Reset-syncing albums.", buf, 0x20u);
      }
      objc_msgSend(a1[6], "refreshResetSync:info:", 1, a1[7], *(_OWORD *)&v18);
    }

    uint64_t v4 = (void *)v21.i64[1];
    goto LABEL_12;
  }
  uint64_t v5 = [a1[5] context];
  id v6 = [v5 objectForKey:@"subscriptionMethod"];
  int v7 = [v6 intValue];

  id v8 = a1[6];
  if (v7 != 1)
  {
    id v13 = [a1[6] eventQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_4;
    v24[3] = &unk_1E6C3D9C0;
    int8x16_t v19 = *(int8x16_t *)(a1 + 5);
    id v14 = (id)v19.i64[0];
    int8x16_t v25 = vextq_s8(v19, v19, 8uLL);
    id v26 = a1[7];
    id v27 = a1[4];
    dispatch_async(v13, v24);

    uint64_t v4 = (void *)v25.i64[1];
LABEL_12:

    return;
  }
  id v9 = [a1[5] GUID];
  id v32 = 0;
  int v10 = [v8 dbQueueInvitationWithAlbumGUID:v9 outObject:&v32 outInvitationGUID:0 outEmail:0 outUserInfoData:0];
  id v11 = v32;

  if (v10)
  {
    id v12 = [a1[6] eventQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_2;
    v28[3] = &unk_1E6C3D9C0;
    v28[4] = a1[6];
    id v29 = v11;
    id v30 = a1[7];
    id v31 = a1[4];
    dispatch_async(v12, v28);
  }
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_5;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_7;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_7(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishUnsubscribingFromAlbum:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    int v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishUnsubscribingFromAlbum:v8 error:v9];
  }
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_5(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishUnsubscribingFromAlbum:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    int v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishUnsubscribingFromAlbum:v8 error:v9];
  }
}

void __83__MSASServerSideModel_MSASStateMachine_didFinishUnsubscribingFromAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishRejectingInvitation:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    int v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishRejectingInvitation:v8 error:v9];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishSubscribingToAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v11;
  id v18 = v9;
  int8x16_t v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, v16);
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke(id *a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  if (v2)
  {
    if ([v2 MSContainsErrorWithDomain:@"MSASProtocolErrorDomain" code:15])
    {
      id v3 = [a1[6] daemon];
      id v4 = a1[4];
      uint64_t v5 = [a1[6] personID];
      [v3 didReceiveTooManySubscriptionsError:v4 personID:v5];
    }
    id v6 = [a1[6] eventQueue];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_6;
    id v27 = &unk_1E6C3D9C0;
    int8x16_t v22 = *(int8x16_t *)(a1 + 5);
    id v7 = (id)v22.i64[0];
    int8x16_t v28 = vextq_s8(v22, v22, 8uLL);
    id v29 = a1[7];
    id v30 = a1[4];
    dispatch_async(v6, &block);

    if (([a1[4] MSASStateMachineIsCanceledError] & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v19 = a1[6];
        id v20 = [a1[5] GUID];
        int8x16_t v21 = [a1[4] MSVerboseDescription];
        *(_DWORD *)buf = 138543874;
        id v42 = v19;
        __int16 v43 = 2114;
        id v44 = v20;
        __int16 v45 = 2114;
        __int16 v46 = v21;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to subscribe from album GUID %{public}@. Error: %{public}@. Reset-syncing albums.", buf, 0x20u);
      }
      objc_msgSend(a1[6], "refreshResetSync:info:", 1, a1[7], *(_OWORD *)&v22, block, v25, v26, v27, v28.i64[0]);
    }

    uint64_t v8 = (void *)v28.i64[1];
    goto LABEL_14;
  }
  id v9 = [a1[5] context];
  id v10 = [v9 objectForKey:@"subscriptionMethod"];
  int v11 = [v10 intValue];

  id v12 = a1[6];
  if (v11 != 1)
  {
    id v17 = [a1[6] eventQueue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_4;
    v31[3] = &unk_1E6C3D9C0;
    int8x16_t v23 = *(int8x16_t *)(a1 + 5);
    id v18 = (id)v23.i64[0];
    int8x16_t v32 = vextq_s8(v23, v23, 8uLL);
    id v33 = a1[7];
    id v34 = a1[4];
    dispatch_async(v17, v31);

    uint64_t v8 = (void *)v32.i64[1];
LABEL_14:

    return;
  }
  id v13 = [a1[5] GUID];
  id v40 = 0;
  int v14 = [v12 dbQueueInvitationWithAlbumGUID:v13 outObject:&v40 outInvitationGUID:0 outEmail:0 outUserInfoData:0];
  id v15 = v40;

  if (v14)
  {
    id v16 = [a1[6] eventQueue];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_2;
    v35[3] = &unk_1E6C3D9E8;
    v35[4] = a1[6];
    id v36 = v15;
    id v37 = a1[5];
    id v38 = a1[7];
    id v39 = a1[4];
    dispatch_async(v16, v35);
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_5;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_6(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_7;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_7(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishSubscribingToAlbum:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishSubscribingToAlbum:v8 error:v9];
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_5(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v3 didFinishSubscribingToAlbum:v4 info:v5 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    id v9 = [v7 _protocolErrorForUnderlyingError:a1[7]];
    [v10 MSASModel:v7 didFinishSubscribingToAlbum:v8 error:v9];
  }
}

void __79__MSASServerSideModel_MSASStateMachine_didFinishSubscribingToAlbum_info_error___block_invoke_3(void *a1, void *a2)
{
  id v12 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    id v7 = [v3 _protocolErrorForUnderlyingError:a1[8]];
    [v12 MSASModel:v3 didFinishAcceptingInvitation:v4 forAlbum:v5 info:v6 error:v7];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = (void *)a1[4];
    uint64_t v9 = a1[5];
    uint64_t v10 = a1[6];
    int v11 = [v8 _protocolErrorForUnderlyingError:a1[8]];
    [v12 MSASModel:v8 didFinishAcceptingInvitation:v9 forAlbum:v10 error:v11];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishUpdatingAssetCollections:(id)a4 inAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MSASModelBase *)self dbQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke;
  v23[3] = &unk_1E6C3D3A8;
  id v24 = v16;
  id v25 = v13;
  id v26 = v15;
  id v27 = v14;
  int8x16_t v28 = self;
  id v29 = v12;
  id v18 = v12;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v16;
  dispatch_sync(v17, v23);
}

void __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v2 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (!v2) {
      goto LABEL_28;
    }
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v54;
    uint64_t v41 = *(void *)v54;
    while (1)
    {
      uint64_t v5 = 0;
      uint64_t v42 = v3;
      do
      {
        if (*(void *)v54 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v53 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1E019E3B0]();
        uint64_t v8 = (void *)[*(id *)(a1 + 48) mutableCopy];
        uint64_t v9 = [*(id *)(a1 + 56) GUID];
        [v6 setAlbumGUID:v9];

        if (([v6 isMine] & 1) == 0)
        {
          uint64_t v10 = *(void **)(a1 + 64);
          int v11 = [*(id *)(a1 + 56) GUID];
          id v51 = 0;
          id v52 = 0;
          int v12 = [v10 dbQueueAlbumWithGUID:v11 outObject:0 outName:0 outCtag:&v52 outForeignCtag:&v51 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
          id v13 = v52;
          id v14 = v51;

          if (v12)
          {
            id v15 = *(void **)(a1 + 64);
            id v16 = [*(id *)(a1 + 56) GUID];
            id v50 = 0;
            int v17 = [v15 dbQueueAlbumMetadataWithAlbumGUID:v16 key:@"lastviewedctag" outValue:&v50];
            id v18 = v50;

            if (v17
              && (![*(id *)(a1 + 56) useForeignCtag] ? (id v19 = v13) : (id v19 = v14), v18 && v19))
            {
              char v20 = objc_msgSend(v18, "isEqualToString:");

              if (v20)
              {
LABEL_22:
                id v23 = [NSNumber numberWithBool:1];
                [v8 setObject:v23 forKey:@"notInteresting"];
                goto LABEL_23;
              }
            }
            else
            {
            }
          }
          id v21 = *(void **)(a1 + 64);
          id v22 = [*(id *)(a1 + 56) GUID];
          id v49 = 0;
          LODWORD(v21) = [v21 dbQueueAlbumMetadataWithAlbumGUID:v22 key:@"lastassetposition" outValue:&v49];
          id v23 = v49;

          if (!v21 || (uint64_t v24 = [v23 longLongValue], v24 >= objc_msgSend(v6, "photoNumber")))
          {

            goto LABEL_22;
          }
          id v25 = *(void **)(a1 + 64);
          id v26 = [*(id *)(a1 + 56) GUID];
          [v25 dbQueueSetUnviewedState:1 onAlbumWithGUID:v26 info:*(void *)(a1 + 48)];

LABEL_23:
          uint64_t v4 = v41;
          uint64_t v3 = v42;
        }
        id v27 = *(void **)(a1 + 64);
        int8x16_t v28 = [*(id *)(a1 + 56) GUID];
        [v27 dbQueueSetAssetCollection:v6 inAlbumWithGUID:v28 info:v8];

        id v29 = [*(id *)(a1 + 64) pendingChanges];
        id v30 = [*(id *)(a1 + 56) GUID];
        [v29 removePendingAssetCollection:v6 forAlbumGUID:v30];

        if ([v6 hasComments])
        {
          id v31 = objc_alloc_init(MSASCommentCheckOperation);
          int8x16_t v32 = [v6 GUID];
          [(MSASCommentCheckOperation *)v31 setAssetCollectionGUID:v32];

          id v33 = [*(id *)(a1 + 56) GUID];
          [(MSASCommentCheckOperation *)v31 setAlbumGUID:v33];

          [*(id *)(a1 + 64) dbQueueAddCommentCheckOperation:v31];
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (!v3)
      {
LABEL_28:

        id v34 = *(void **)(a1 + 64);
        __int16 v35 = [*(id *)(a1 + 56) GUID];
        LODWORD(v34) = [v34 dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:v35];

        id v36 = [*(id *)(a1 + 64) eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke_2;
        block[3] = &unk_1E6C3D0F8;
        *(_OWORD *)obja = *(_OWORD *)(a1 + 56);
        id v37 = obja[0];
        int8x16_t v46 = vextq_s8(*(int8x16_t *)obja, *(int8x16_t *)obja, 8uLL);
        int v48 = (int)v34;
        id v47 = *(id *)(a1 + 48);
        dispatch_async(v36, block);

        break;
      }
    }
  }
  id v38 = [*(id *)(a1 + 64) pendingChanges];
  char v39 = [v38 hasPendingChanges];

  if ((v39 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v40 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      uint64_t v58 = v40;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking asset collections", buf, 0xCu);
    }
    [*(id *)(a1 + 64) MSASStateMachine:*(void *)(a1 + 72) didFinishCheckingForChangesInfo:*(void *)(a1 + 48) error:*(void *)(a1 + 32)];
  }
}

uint64_t __93__MSASServerSideModel_MSASStateMachine_didFinishUpdatingAssetCollections_inAlbum_info_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
}

- (void)MSASStateMachine:(id)a3 didFireScheduledEvent:(id)a4 forAssetCollectionGUID:(id)a5 albumGUID:(id)a6 info:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v11 isEqualToString:@"preFlushPendingCommentQueue"])
  {
    id v15 = [(MSASModelBase *)self dbQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __100__MSASServerSideModel_MSASStateMachine_didFireScheduledEvent_forAssetCollectionGUID_albumGUID_info___block_invoke;
    v16[3] = &unk_1E6C3D9C0;
    void v16[4] = self;
    id v17 = v12;
    id v18 = v13;
    id v19 = v14;
    dispatch_async(v15, v16);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && [v11 isEqualToString:@"flushPendingCommentQueue"])
    {
      [(MSASServerSideModel *)self flushAllPendingCommentCheckOperations];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v11 isEqualToString:@"reconstruct"])
      {
        [(MSASServerSideModel *)self _reconstruct];
      }
    }
  }
}

void __100__MSASServerSideModel_MSASStateMachine_didFireScheduledEvent_forAssetCollectionGUID_albumGUID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 scheduleEvent:@"flushPendingCommentQueue" assetCollectionGUID:*(void *)(a1 + 40) albumGUID:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForUpdatesInAlbums:(id)a4 info:(id)a5
{
  id v6 = a5;
  id v7 = [(MSASModelBase *)self dbQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbums_info___block_invoke;
  v9[3] = &unk_1E6C3DB28;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __81__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbums_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 scheduleEvent:@"preFlushPendingCommentQueue" assetCollectionGUID:0 albumGUID:0 info:*(void *)(a1 + 40)];
}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForUpdatesInAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbum_info_error___block_invoke;
  block[3] = &unk_1E6C3D9E8;
  id v20 = v13;
  id v21 = self;
  id v22 = v11;
  id v23 = v12;
  id v24 = v10;
  id v15 = v10;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  dispatch_async(v14, block);
}

void __86__MSASServerSideModel_MSASStateMachine_didFinishCheckingForUpdatesInAlbum_info_error___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) dbQueueUpdateAlbumCtag:*(void *)(a1 + 48)];
    id v2 = *(void **)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 48) GUID];
    [v2 dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:v3 info:*(void *)(a1 + 56)];
  }
  uint64_t v4 = [*(id *)(a1 + 40) pendingChanges];
  uint64_t v5 = [*(id *)(a1 + 48) GUID];
  [v4 removePendingChangesForAlbumGUID:v5];

  id v6 = [*(id *)(a1 + 40) pendingChanges];
  LOBYTE(v5) = [v6 hasPendingChanges];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album updates", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) MSASStateMachine:*(void *)(a1 + 64) didFinishCheckingForChangesInfo:*(void *)(a1 + 56) error:*(void *)(a1 + 32)];
  }
}

- (void)MSASStateMachine:(id)a3 didFindChangesInAlbum:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__MSASServerSideModel_MSASStateMachine_didFindChangesInAlbum_info_error___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v11;
  id v18 = self;
  id v19 = v9;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  dispatch_async(v12, v16);
}

uint64_t __73__MSASServerSideModel_MSASStateMachine_didFindChangesInAlbum_info_error___block_invoke(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    return [*(id *)(result + 40) dbQueueSetAlbum:*(void *)(result + 48) info:*(void *)(result + 56)];
  }
  return result;
}

- (void)MSASStateMachine:(id)a3 didFindAssetCollectionChanges:(id)a4 forAlbum:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  id v17 = v11;
  id v18 = v10;
  id v19 = self;
  id v20 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  dispatch_sync(v12, v16);
}

void __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke(id *a1)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v2 = [a1[4] MSASAlbumResetSyncAlbumGUID];
  uint64_t v3 = [a1[5] GUID];
  int v4 = [v2 isEqualToString:v3];

  LODWORD(v54) = v4;
  if (v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[6];
    id v6 = [a1[5] GUID];
    *(_DWORD *)buf = 138543618;
    id v83 = v5;
    __int16 v84 = 2114;
    v85 = v6;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Reconciling contents of album GUID %{public}@ due to a reset sync.", buf, 0x16u);
  }
  objc_msgSend(a1[6], "beginTransaction", v54);
  id v57 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[7], "count"));
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v7 = a1[7];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x1E019E3B0]();
        int v14 = [v12 wasDeleted];
        id v15 = a1[6];
        id v16 = [v12 GUID];
        if (v14)
        {
          [v15 dbQueueDeleteAssetCollectionWithGUID:v16 info:a1[4]];
        }
        else
        {
          id v17 = [v15 dbQueueLookupOrCreateAssetCollectionWithGUID:v16 outAlbum:0];

          id v18 = [v17 ctag];
          id v19 = [v12 ctag];
          int v20 = [v18 isEqualToString:v19];

          if ((v20 & 1) == 0) {
            [v57 addObject:v17];
          }
          id v16 = v17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v9);
  }

  if (v55)
  {
    id v21 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1[7], "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v22 = a1[7];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v70 objects:v80 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v71 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [*(id *)(*((void *)&v70 + 1) + 8 * j) GUID];
          [v21 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v70 objects:v80 count:16];
      }
      while (v24);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v28 = a1[6];
    id v29 = [a1[5] GUID];
    id v30 = [v28 dbQueueAssetCollectionGUIDsInAlbumWithGUID:v29];

    uint64_t v31 = [v30 countByEnumeratingWithState:&v66 objects:v79 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v67;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v67 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v66 + 1) + 8 * k);
          id v36 = (void *)MEMORY[0x1E019E3B0]();
          if (([v21 containsObject:v35] & 1) == 0) {
            [a1[6] dbQueueDeleteAssetCollectionWithGUID:v35 info:a1[4]];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v66 objects:v79 count:16];
      }
      while (v32);
    }
  }
  if ([v57 count])
  {
    id v37 = [a1[6] pendingChanges];
    id v38 = [a1[5] GUID];
    [v37 addPendingAssetCollectionChanges:v57 forAlbumGUID:v38];

    char v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v40 = v57;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v63;
      do
      {
        for (uint64_t m = 0; m != v42; ++m)
        {
          if (*(void *)v63 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v62 + 1) + 8 * m);
          int8x16_t v46 = (void *)MEMORY[0x1E019E3B0]();
          [v39 addObject:v45];
          if ((unint64_t)[v39 count] >= 0x32)
          {
            id v47 = [a1[6] stateMachine];
            [v47 checkForAssetCollectionUpdates:v39 inAlbum:a1[5] info:a1[4]];

            uint64_t v48 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:50];

            char v39 = (void *)v48;
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v62 objects:v78 count:16];
      }
      while (v42);
    }

    if ([v39 count])
    {
      id v49 = [a1[6] stateMachine];
      [v49 checkForAssetCollectionUpdates:v39 inAlbum:a1[5] info:a1[4]];
    }
  }
  [a1[6] endTransaction];
  id v50 = a1[6];
  id v51 = [a1[5] GUID];
  LODWORD(v50) = [v50 dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:v51];

  id v52 = [a1[6] eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke_558;
  block[3] = &unk_1E6C3D0F8;
  int8x16_t v56 = *(int8x16_t *)(a1 + 5);
  id v53 = (id)v56.i64[0];
  int8x16_t v59 = vextq_s8(v56, v56, 8uLL);
  int v61 = (int)v50;
  id v60 = a1[4];
  dispatch_async(v52, block);
}

uint64_t __84__MSASServerSideModel_MSASStateMachine_didFindAssetCollectionChanges_forAlbum_info___block_invoke_558(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
}

- (void)MSASStateMachine:(id)a3 didFinishGettingAccessControls:(id)a4 forAlbum:(id)a5 info:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(MSASModelBase *)self dbQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __91__MSASServerSideModel_MSASStateMachine_didFinishGettingAccessControls_forAlbum_info_error___block_invoke;
  v23[3] = &unk_1E6C3D3A8;
  id v24 = v16;
  id v25 = v13;
  id v26 = self;
  id v27 = v15;
  id v28 = v14;
  id v29 = v12;
  id v18 = v12;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v16;
  dispatch_async(v17, v23);
}

void __91__MSASServerSideModel_MSASStateMachine_didFinishGettingAccessControls_forAlbum_info_error___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    [*(id *)(a1 + 48) dbQueueBeginTransaction];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v46 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v9 = (void *)MEMORY[0x1E019E3B0]();
          uint64_t v10 = [v8 GUID];

          if (v10)
          {
            [*(id *)(a1 + 48) dbQueueSetAccessControl:v8 info:*(void *)(a1 + 56)];
            id v11 = [v8 GUID];
            [v2 addObject:v11];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v5);
    }

    [*(id *)(a1 + 48) dbQueueEndTransaction];
    id v36 = [MEMORY[0x1E4F1CA80] set];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v12 = *(void **)(a1 + 48);
    id v13 = [*(id *)(a1 + 64) GUID];
    id v14 = [v12 dbQueueAccessControlsForAlbumWithGUID:v13];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          uint64_t v20 = [v19 GUID];
          if (v20)
          {
            id v21 = (void *)v20;
            id v22 = [v19 GUID];
            char v23 = [v2 containsObject:v22];

            if ((v23 & 1) == 0)
            {
              id v24 = [v19 GUID];
              [v36 addObject:v24];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v16);
    }

    [*(id *)(a1 + 48) dbQueueBeginTransaction];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v25 = v36;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v37 + 1) + 8 * k);
          uint64_t v31 = (void *)MEMORY[0x1E019E3B0]();
          [*(id *)(a1 + 48) dbQueueDeleteAccessControlWithGUID:v30 info:*(void *)(a1 + 56)];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v27);
    }

    [*(id *)(a1 + 48) dbQueueEndTransaction];
  }
  uint64_t v32 = [*(id *)(a1 + 48) pendingChanges];
  uint64_t v33 = [*(id *)(a1 + 64) GUID];
  [v32 removePendingSharingInfoChangesForAlbumGUID:v33];

  id v34 = [*(id *)(a1 + 48) pendingChanges];
  LOBYTE(v33) = [v34 hasPendingChanges];

  if ((v33 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v35;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album access controls", buf, 0xCu);
    }
    [*(id *)(a1 + 48) MSASStateMachine:*(void *)(a1 + 72) didFinishCheckingForChangesInfo:*(void *)(a1 + 56) error:*(void *)(a1 + 32)];
  }
}

- (void)MSASStateMachine:(id)a3 didFinishCheckingForChangesInfo:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSASServerSideModel *)self pendingChanges];
  int v12 = [v11 hasPendingChanges];

  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v13 = [(MSASServerSideModel *)self pendingChanges];
      *(_DWORD *)buf = 138543618;
      id v21 = self;
      __int16 v22 = 2114;
      char v23 = v13;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Still has pending changes %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = self;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking for changes", buf, 0xCu);
    }
    [(MSASServerSideModel *)self flushAllPendingCommentCheckOperations];
    id v14 = [(MSASServerSideModel *)self commandQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke;
    v15[3] = &unk_1E6C3D9C0;
    id v16 = v8;
    uint64_t v17 = self;
    id v18 = v9;
    id v19 = v10;
    [v14 flushQueueCompletionBlock:v15];
  }
}

void __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRootCtagFromPendingRootCtag];
  id v2 = [*(id *)(a1 + 40) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  id v3 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

void __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_3;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __78__MSASServerSideModel_MSASStateMachine_didFinishCheckingForChangesInfo_error___block_invoke_3(void *a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    id v5 = [v3 _protocolErrorForUnderlyingError:a1[6]];
    [v6 MSASModel:v3 didFinishCheckingForChangesInfo:v4 error:v5];
  }
}

- (void)MSASStateMachine:(id)a3 didFindSyncedKeyValueChangesForAlbumGUIDS:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  id v10 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MSASServerSideModel_MSASStateMachine_didFindSyncedKeyValueChangesForAlbumGUIDS_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v15 = v7;
  id v16 = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v7;
  dispatch_sync(v10, block);

  if ([v11 count])
  {
    id v13 = [(MSASServerSideModel *)self stateMachine];
    [v13 checkForAlbumSyncedStateChangesInAlbums:v11 info:v8];
  }
}

void __87__MSASServerSideModel_MSASStateMachine_didFindSyncedKeyValueChangesForAlbumGUIDS_info___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1E019E3B0](v3);
        id v9 = objc_msgSend(a1[5], "dbQueueLookupOrCreateAlbumWithGUID:", v7, (void)v10);
        if (v9) {
          [a1[6] addObject:v9];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (void)MSASStateMachine:(id)a3 didFindAccessControlChangesForAlbumGUIDS:(id)a4 info:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v10 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MSASServerSideModel_MSASStateMachine_didFindAccessControlChangesForAlbumGUIDS_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v15 = v7;
  id v16 = self;
  id v11 = v9;
  id v17 = v11;
  id v12 = v7;
  dispatch_sync(v10, block);

  if ([v11 count])
  {
    long long v13 = [(MSASServerSideModel *)self stateMachine];
    [v13 getAccessControlsForAlbums:v11 info:v8];
  }
}

void __86__MSASServerSideModel_MSASStateMachine_didFindAccessControlChangesForAlbumGUIDS_info___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id v8 = (void *)MEMORY[0x1E019E3B0](v3);
        id v9 = objc_msgSend(a1[5], "dbQueueLookupOrCreateAlbumWithGUID:", v7, (void)v10);
        if (v9) {
          [a1[6] addObject:v9];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = v3;
    }
    while (v3);
  }
}

- (void)MSASStateMachine:(id)a3 didFindSyncedKeyValueChangesForAlbumGUIDS:(id)a4 albumChanges:(id)a5 accessControlChangesForAlbumGUIDS:(id)a6 info:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v17 = a3;
  id v16 = [[MSASPendingChanges alloc] initWithSyncedKeyValueChangesForAlbumGUIDS:v15 albumChanges:v14 accessControlChangesForAlbumGUIDS:v13];
  [(MSASServerSideModel *)self setPendingChanges:v16];

  [(MSASServerSideModel *)self MSASStateMachine:v17 didFindSyncedKeyValueChangesForAlbumGUIDS:v15 info:v12];
  [(MSASServerSideModel *)self MSASStateMachine:v17 didFindAlbumChanges:v14 info:v12];

  [(MSASServerSideModel *)self MSASStateMachine:v17 didFindAccessControlChangesForAlbumGUIDS:v13 info:v12];
}

- (void)MSASStateMachine:(id)a3 didFindNewURLString:(id)a4 forAlbumWithGUID:(id)a5 info:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__MSASServerSideModel_MSASStateMachine_didFindNewURLString_forAlbumWithGUID_info___block_invoke;
  v16[3] = &unk_1E6C3D9C0;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v9;
  id v19 = v11;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, v16);
}

void __82__MSASServerSideModel_MSASStateMachine_didFindNewURLString_forAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0;
  int v4 = [v2 dbQueueAlbumWithGUID:v3 outObject:&v7 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v5 = v7;
  uint64_t v6 = v5;
  if (v4)
  {
    [v5 setURLString:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) dbQueueSetAlbum:v6 info:*(void *)(a1 + 56)];
  }
}

- (void)MSASStateMachine:(id)a3 didFindAlbumChanges:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MSASModelBase *)self dbQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__MSASServerSideModel_MSASStateMachine_didFindAlbumChanges_info___block_invoke;
  v15[3] = &unk_1E6C3D9C0;
  id v16 = v10;
  id v17 = self;
  id v18 = v9;
  id v19 = v8;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

void __65__MSASServerSideModel_MSASStateMachine_didFindAlbumChanges_info___block_invoke(uint64_t a1)
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  int v124 = [*(id *)(a1 + 32) MSASIsGlobalResetSync];
  if (v124 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v147 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Reconciling current album list due to a reset sync.", buf, 0xCu);
  }
  v125 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
  v121 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
  [*(id *)(a1 + 40) dbQueueBeginTransaction];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v141 objects:v152 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v142;
    uint64_t v122 = *(void *)v142;
    id v123 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v126 = v5;
      do
      {
        if (*(void *)v142 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v141 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1E019E3B0]();
        int v10 = [v8 wasDeleted];
        id v11 = *(void **)(a1 + 40);
        if (v10)
        {
          id v12 = [*(id *)(a1 + 40) stateMachine];
          id v13 = [v8 GUID];
          [v12 cancelOutstandingCommandsForAlbumWithGUID:v13];

          id v14 = *(void **)(a1 + 40);
          id v15 = [v8 GUID];
          [v14 dbQueueDeleteAlbumWithGUID:v15 info:*(void *)(a1 + 32)];
          goto LABEL_56;
        }
        v127 = v9;
        id v16 = [v8 GUID];
        id v140 = 0;
        int v17 = [v11 dbQueueAlbumWithGUID:v16 outObject:&v140 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
        id v15 = v140;

        if (!v17)
        {
          int v61 = +[MSASAlbum album];
          long long v62 = [v8 GUID];
          [v61 setGUID:v62];

          long long v63 = [v8 ownerEmail];
          [v61 setOwnerEmail:v63];

          long long v64 = [v8 ownerPersonID];
          [v61 setOwnerPersonID:v64];

          long long v65 = [v8 ownerFirstName];
          [v61 setOwnerFirstName:v65];

          long long v66 = [v8 ownerLastName];
          [v61 setOwnerLastName:v66];

          long long v67 = [v8 ownerFullName];
          [v61 setOwnerFullName:v67];

          long long v68 = [v8 invitation];
          long long v69 = [v68 subscriptionDate];
          [v61 setSubscriptionDate:v69];

          long long v70 = [v8 URLString];
          [v61 setURLString:v70];

          long long v71 = [v8 invitation];
          objc_msgSend(v61, "setRelationshipState:", objc_msgSend(v71, "state"));

          long long v72 = [v8 name];

          if (v72)
          {
            long long v73 = [v8 name];
            [v61 setMetadataValue:v73 forKey:@"name"];
          }
          [*(id *)(a1 + 40) dbQueueSetAlbum:v61 info:*(void *)(a1 + 32)];
          long long v74 = [v8 invitation];
          if ([v74 state])
          {
            long long v75 = [v8 invitation];
            int v76 = [v75 state];

            if (v76 != 2) {
              goto LABEL_41;
            }
          }
          else
          {
          }
          [v125 addObject:v61];
LABEL_41:
          long long v77 = [v8 invitation];
          int v78 = [v77 state];

          if (v78 == 2) {
            [v121 addObject:v61];
          }

          id v9 = v127;
          goto LABEL_51;
        }
        id v18 = [v15 ownerEmail];
        id v19 = [v8 ownerEmail];
        char v20 = [v18 isEqualToString:v19];

        int v21 = v124;
        if ((v20 & 1) == 0)
        {
          __int16 v22 = [v8 ownerEmail];
          [v15 setOwnerEmail:v22];

          int v21 = 1;
        }
        char v23 = [v15 ownerPersonID];
        uint64_t v24 = [v8 ownerPersonID];
        char v25 = [v23 isEqualToString:v24];

        if ((v25 & 1) == 0)
        {
          uint64_t v26 = [v8 ownerPersonID];
          [v15 setOwnerPersonID:v26];

          int v21 = 1;
        }
        uint64_t v27 = [v15 ownerFullName];
        uint64_t v28 = [v8 ownerFullName];
        char v29 = [v27 isEqualToString:v28];

        if ((v29 & 1) == 0)
        {
          uint64_t v30 = [v8 ownerFullName];
          [v15 setOwnerFullName:v30];

          int v21 = 1;
        }
        uint64_t v31 = [v15 ownerFirstName];
        uint64_t v32 = [v8 ownerFirstName];
        char v33 = [v31 isEqualToString:v32];

        if ((v33 & 1) == 0)
        {
          id v34 = [v8 ownerFirstName];
          [v15 setOwnerFirstName:v34];

          int v21 = 1;
        }
        uint64_t v35 = [v15 ownerLastName];
        id v36 = [v8 ownerLastName];
        char v37 = [v35 isEqualToString:v36];

        if ((v37 & 1) == 0)
        {
          long long v38 = [v8 ownerLastName];
          [v15 setOwnerLastName:v38];

          int v21 = 1;
        }
        long long v39 = [v15 subscriptionDate];
        long long v40 = [v8 invitation];
        long long v41 = [v40 subscriptionDate];
        char v42 = [v39 isEqualToDate:v41];

        if ((v42 & 1) == 0)
        {
          long long v43 = [v8 invitation];
          long long v44 = [v43 subscriptionDate];
          [v15 setSubscriptionDate:v44];

          int v21 = 1;
        }
        long long v45 = [v15 URLString];
        long long v46 = [v8 URLString];
        char v47 = [v45 isEqualToString:v46];

        if ((v47 & 1) == 0)
        {
          long long v48 = [v8 URLString];
          [v15 setURLString:v48];

          int v21 = 1;
        }
        int v49 = [v15 relationshipState];
        uint64_t v50 = [v8 invitation];
        int v51 = [v50 state];

        if (v49 != v51)
        {
          id v52 = [v8 invitation];
          objc_msgSend(v15, "setRelationshipState:", objc_msgSend(v52, "state"));

          id v53 = [v8 invitation];
          int v54 = [v53 state];

          if (v54 == 2) {
            [v121 addObject:v15];
          }
          int v21 = 1;
        }
        uint64_t v55 = [v8 name];
        if (v55)
        {
          int8x16_t v56 = (void *)v55;
          id v57 = [v15 metadata];
          uint64_t v58 = [v57 objectForKey:@"name"];
          int8x16_t v59 = [v8 name];
          char v60 = [v58 isEqualToString:v59];

          if ((v60 & 1) == 0)
          {
            id v79 = [v8 name];
            [v15 setMetadataValue:v79 forKey:@"name"];

LABEL_45:
            [*(id *)(a1 + 40) dbQueueSetAlbum:v15 info:*(void *)(a1 + 32)];
            goto LABEL_46;
          }
        }
        if (v21) {
          goto LABEL_45;
        }
LABEL_46:
        v80 = [v8 invitation];
        if ([v80 state])
        {
          uint64_t v81 = [v8 invitation];
          int v82 = [v81 state];

          BOOL v83 = v82 == 2;
          uint64_t v6 = v122;
          id v3 = v123;
          id v9 = v127;
          if (!v83) {
            goto LABEL_51;
          }
        }
        else
        {

          uint64_t v6 = v122;
          id v3 = v123;
          id v9 = v127;
        }
        [v125 addObject:v15];
LABEL_51:
        __int16 v84 = [v8 invitation];
        int v85 = [v84 state];

        if (v85)
        {
          uint64_t v86 = *(void **)(a1 + 40);
          v87 = [v8 invitation];
          [v86 dbQueueSetInvitation:v87 info:*(void *)(a1 + 32)];
        }
        v88 = [v8 invitation];
        int v89 = [v88 state];

        if (v89 == 1)
        {
          v90 = *(void **)(a1 + 40);
          v91 = [v8 GUID];
          [v90 dbQueueSetUnviewedState:1 onAlbumWithGUID:v91 info:*(void *)(a1 + 32)];
        }
        uint64_t v5 = v126;
LABEL_56:

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v141 objects:v152 count:16];
    }
    while (v5);
  }

  if (v124)
  {
    v92 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id v93 = *(id *)(a1 + 48);
    uint64_t v94 = [v93 countByEnumeratingWithState:&v136 objects:v151 count:16];
    if (v94)
    {
      uint64_t v95 = v94;
      uint64_t v96 = *(void *)v137;
      do
      {
        for (uint64_t i = 0; i != v95; ++i)
        {
          if (*(void *)v137 != v96) {
            objc_enumerationMutation(v93);
          }
          v98 = [*(id *)(*((void *)&v136 + 1) + 8 * i) GUID];
          [v92 addObject:v98];
        }
        uint64_t v95 = [v93 countByEnumeratingWithState:&v136 objects:v151 count:16];
      }
      while (v95);
    }

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v99 = [*(id *)(a1 + 40) dbQueueAlbumGUIDs];
    uint64_t v100 = [v99 countByEnumeratingWithState:&v132 objects:v150 count:16];
    if (v100)
    {
      uint64_t v101 = v100;
      uint64_t v102 = *(void *)v133;
      v103 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t j = 0; j != v101; ++j)
        {
          if (*(void *)v133 != v102) {
            objc_enumerationMutation(v99);
          }
          uint64_t v105 = *(void *)(*((void *)&v132 + 1) + 8 * j);
          v106 = (void *)MEMORY[0x1E019E3B0]();
          if (([v92 containsObject:v105] & 1) == 0)
          {
            if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v107 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543618;
              uint64_t v147 = v107;
              __int16 v148 = 2114;
              uint64_t v149 = v105;
              _os_log_impl(&dword_1DC434000, v103, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleting album GUID %{public}@ due to reset sync.", buf, 0x16u);
            }
            [*(id *)(a1 + 40) dbQueueDeleteAlbumWithGUID:v105 info:*(void *)(a1 + 32)];
          }
        }
        uint64_t v101 = [v99 countByEnumeratingWithState:&v132 objects:v150 count:16];
      }
      while (v101);
    }
  }
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v108 = v125;
  uint64_t v109 = [v108 countByEnumeratingWithState:&v128 objects:v145 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v129;
    do
    {
      for (uint64_t k = 0; k != v110; ++k)
      {
        if (*(void *)v129 != v111) {
          objc_enumerationMutation(v108);
        }
        v113 = *(void **)(*((void *)&v128 + 1) + 8 * k);
        v114 = [*(id *)(a1 + 40) pendingChanges];
        v115 = [v113 GUID];
        [v114 addPendingChangesForAlbumGUID:v115];
      }
      uint64_t v110 = [v108 countByEnumeratingWithState:&v128 objects:v145 count:16];
    }
    while (v110);
  }

  v116 = [*(id *)(a1 + 40) pendingChanges];
  char v117 = [v116 hasPendingChanges];

  if ((v117 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v120 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v147 = v120;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Finished checking album changes", buf, 0xCu);
    }
    [*(id *)(a1 + 40) MSASStateMachine:*(void *)(a1 + 56) didFinishCheckingForChangesInfo:*(void *)(a1 + 32) error:0];
  }
  if ([v108 count])
  {
    v118 = [*(id *)(a1 + 40) stateMachine];
    [v118 checkForUpdatesInAlbums:v108 resetSync:0 info:*(void *)(a1 + 32)];
  }
  if ([v121 count])
  {
    v119 = [*(id *)(a1 + 40) stateMachine];
    [v119 getAccessControlsForAlbums:v121 info:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) dbQueueEndTransaction];
}

- (void)MSASStateMachineDidFindGlobalResetSync:(id)a3 info:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MSASServerSideModel *)self eventQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke;
  v8[3] = &unk_1E6C3DB28;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) daemon];
  id v3 = [*(id *)(a1 + 32) personID];
  [v2 didReceiveGlobalResetSyncForPersonID:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke_2;
  v5[3] = &unk_1E6C3D258;
  v5[4] = v4;
  id v6 = *(id *)(a1 + 40);
  [v4 eventQueuePerformBlockOnObservers:v5];
}

void __67__MSASServerSideModel_MSASStateMachineDidFindGlobalResetSync_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didFindGlobalResetSyncInfo:*(void *)(a1 + 40)];
  }
}

- (void)MSASStateMachineDidStart:(id)a3
{
  uint64_t v4 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__MSASServerSideModel_MSASStateMachineDidStart___block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_sync(v4, block);

  id v5 = [(MSASServerSideModel *)self commandQueue];
  [v5 flushQueueCompletionBlock:0];
}

void __48__MSASServerSideModel_MSASStateMachineDidStart___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dbQueueFlushAllPendingCommentCheckOperations];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 retryOutstandingActivities];
}

- (id)_protocolErrorForUnderlyingError:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    id v4 = a3;
    id v5 = (__CFString *)MSCFCopyLocalizedString(@"Model.error.protocol");
    id v6 = [v3 MSErrorWithDomain:@"MSASModelErrorDomain" code:8 description:v5 underlyingError:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_invalidAssetCollectionGUIDErrorwithGUID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MSASServerSideModel__invalidAssetCollectionGUIDErrorwithGUID___block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v9 = v3;
  uint64_t v4 = _invalidAssetCollectionGUIDErrorwithGUID__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_invalidAssetCollectionGUIDErrorwithGUID__onceToken, block);
  }
  id v6 = (id)_invalidAssetCollectionGUIDErrorwithGUID__error;

  return v6;
}

void __64__MSASServerSideModel__invalidAssetCollectionGUIDErrorwithGUID___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  id v3 = NSString;
  id v7 = (__CFString *)MSCFCopyLocalizedString(@"Model.error.invalidAssetCollectionGUID_GUID");
  uint64_t v4 = objc_msgSend(v3, "stringWithFormat:", v7, *(void *)(a1 + 32));
  uint64_t v5 = [v2 MSErrorWithDomain:@"MSASModelErrorDomain" code:2 description:v4];
  id v6 = (void *)_invalidAssetCollectionGUIDErrorwithGUID__error;
  _invalidAssetCollectionGUIDErrorwithGUID__error = v5;
}

- (id)_invalidAccessControlGUIDErrorwithGUID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSASServerSideModel__invalidAccessControlGUIDErrorwithGUID___block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v9 = v3;
  uint64_t v4 = _invalidAccessControlGUIDErrorwithGUID__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_invalidAccessControlGUIDErrorwithGUID__onceToken, block);
  }
  id v6 = (id)_invalidAccessControlGUIDErrorwithGUID__error;

  return v6;
}

void __62__MSASServerSideModel__invalidAccessControlGUIDErrorwithGUID___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  id v3 = NSString;
  id v7 = (__CFString *)MSCFCopyLocalizedString(@"Model.error.invalidACLGUID_GUID");
  uint64_t v4 = objc_msgSend(v3, "stringWithFormat:", v7, *(void *)(a1 + 32));
  uint64_t v5 = [v2 MSErrorWithDomain:@"MSASModelErrorDomain" code:1 description:v4];
  id v6 = (void *)_invalidAccessControlGUIDErrorwithGUID__error;
  _invalidAccessControlGUIDErrorwithGUID__error = v5;
}

- (id)_invalidInvitationGUIDErrorWithGUID:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MSASServerSideModel__invalidInvitationGUIDErrorWithGUID___block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v9 = v3;
  uint64_t v4 = _invalidInvitationGUIDErrorWithGUID__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&_invalidInvitationGUIDErrorWithGUID__onceToken, block);
  }
  id v6 = (id)_invalidInvitationGUIDErrorWithGUID__error;

  return v6;
}

void __59__MSASServerSideModel__invalidInvitationGUIDErrorWithGUID___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  id v3 = NSString;
  id v7 = (__CFString *)MSCFCopyLocalizedString(@"Model.error.invalidInvitationGUID_GUID");
  uint64_t v4 = objc_msgSend(v3, "stringWithFormat:", v7, *(void *)(a1 + 32));
  uint64_t v5 = [v2 MSErrorWithDomain:@"MSASModelErrorDomain" code:0 description:v4];
  id v6 = (void *)_invalidInvitationGUIDErrorWithGUID__error;
  _invalidInvitationGUIDErrorWithGUID__error = v5;
}

- (id)dbQueueLookupOrCreateCommentWithGUID:(id)a3 outAssetCollection:(id *)a4 outAlbum:(id *)a5
{
  id v8 = a3;
  id v18 = 0;
  id v19 = 0;
  BOOL v9 = [(MSASServerSideModel *)self dbQueueCommentWithGUID:v8 outObject:&v19 outID:0 outTimestamp:0 outAssetCollectionGUID:&v18 outIsCaption:0 outUserInfoData:0];
  int v10 = (MSASComment *)v19;
  id v11 = v18;
  if (!v9)
  {
    id v12 = objc_alloc_init(MSASComment);

    [(MSASComment *)v12 setGUID:v8];
    int v10 = v12;
  }
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    id v16 = 0;
    id v17 = 0;
    [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v11 outObject:&v17 outCtag:0 outAlbumGUID:&v16 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
    id v13 = v17;
    id v14 = v16;
    if (a4) {
      *a4 = v13;
    }
    if (a5 && v14)
    {
      *a5 = [(MSASServerSideModel *)self dbQueueLookupOrCreateAlbumWithGUID:v14];
    }
  }
  return v10;
}

- (id)dbQueueLookupOrCreateAssetCollectionWithGUID:(id)a3 outAlbum:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  id v13 = 0;
  BOOL v7 = [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v6 outObject:&v13 outCtag:0 outAlbumGUID:&v12 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v8 = (MSASAssetCollection *)v13;
  id v9 = v12;
  if (!v7)
  {
    int v10 = objc_alloc_init(MSASAssetCollection);

    [(MSASAssetCollection *)v10 setGUID:v6];
    id v8 = v10;
  }
  if (a4)
  {
    *a4 = [(MSASServerSideModel *)self dbQueueLookupOrCreateAlbumWithGUID:v9];
  }

  return v8;
}

- (id)dbQueueLookupOrCreateAlbumWithGUID:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v4 outObject:&v9 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v6 = v9;
  if (!v5)
  {
    BOOL v7 = +[MSASAlbum album];

    [v7 setGUID:v4];
    id v6 = v7;
  }

  return v6;
}

- (void)eventQueuePerformBlockOnObservers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [(MSASServerSideModel *)self observers];
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
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x1E019E3B0]();
        v4[2](v4, v10);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)earliestUnviewedAssetCollectionGUIDInAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  BOOL v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MSASServerSideModel_earliestUnviewedAssetCollectionGUIDInAlbumWithGUID___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __74__MSASServerSideModel_earliestUnviewedAssetCollectionGUIDInAlbumWithGUID___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v22 = 0;
  int v4 = [v2 dbQueueAlbumWithGUID:v3 outObject:&v22 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v5 = v22;
  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v21 = 0;
    char v8 = [v6 dbQueueAlbumMetadataWithAlbumGUID:v7 key:@"lastassetposition" outValue:&v21];
    id v9 = v21;
    id v10 = v9;
    if (v8)
    {
      sqlite3_int64 v11 = [v9 longLongValue];
      uint64_t v12 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select GUID from AssetCollections where albumGUID = ? and photoNumber > ? order by albumGUID asc, batchDate asc, photoDate asc, GUID asc;"];
      uint64_t v13 = MSSqliteBindStringOrNull(v12, 1, *(id *)(a1 + 40));
      int v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (!v14)
      {
        uint64_t v15 = sqlite3_bind_int64(v12, 2, v11);
        int v16 = v15;
        MSSqliteTrapForDBLockError(v15);
        if (!v16)
        {
          int v17 = sqlite3_step(v12);
          if (v17 != 101)
          {
            if (v17 == 100)
            {
              uint64_t v18 = MSSqliteStringFromStatementColumn(v12, 0);
              uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
              char v20 = *(void **)(v19 + 40);
              *(void *)(v19 + 40) = v18;
            }
            else
            {
              MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 3545);
            }
          }
        }
      }

      if (v12) {
        sqlite3_reset(v12);
      }
    }
    else
    {
    }
  }
}

- (id)lastViewedCommentDateForAssetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__6923;
  int v16 = __Block_byref_object_dispose__6924;
  id v17 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MSASServerSideModel_lastViewedCommentDateForAssetCollectionWithGUID___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v10 = v4;
  sqlite3_int64 v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __71__MSASServerSideModel_lastViewedCommentDateForAssetCollectionWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v11 = 0;
  int v4 = [v2 dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v3 key:@"lastcommenttimestamp" outValue:&v11];
  id v5 = v11;
  id v6 = v5;
  if (v4)
  {
    id v7 = (void *)MEMORY[0x1E4F1C9C8];
    [v5 doubleValue];
    uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)dbQueueFlushAllPendingCommentCheckOperations
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Flushing pending comment check queue.", buf, 0xCu);
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:50];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(MSASServerSideModel *)self dbQueuePendingCommentCheckOperations];
  uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v25)
  {
    int v4 = 0;
    id v5 = 0;
    uint64_t v24 = *(void *)v30;
    uint64_t v26 = self;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        id v7 = v5;
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v9 = (void *)MEMORY[0x1E019E3B0]();
        id v5 = [v8 albumGUID];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          uint64_t v18 = [v8 assetCollectionGUID];
          *(_DWORD *)buf = 138543874;
          id v34 = v26;
          __int16 v35 = 2114;
          id v36 = v18;
          __int16 v37 = 2114;
          long long v38 = v5;
          _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Flushing pending comment check operation for asset collection GUID %{public}@ in album GUID %{public}@", buf, 0x20u);

          self = v26;
        }
        if (v4 > 50 || v7 && ([v5 isEqualToString:v7] & 1) == 0)
        {
          id v28 = 0;
          [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v7 outObject:&v28 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
          id v10 = v28;
          id v11 = [(MSASServerSideModel *)v26 stateMachine];
          uint64_t v12 = (void *)[v3 copy];
          uint64_t v13 = [v10 clientOrgKey];
          [v11 checkForCommentChanges:v12 inAlbumWithGUID:v7 withClientOrgKey:v13];

          self = v26;
          [v3 removeAllObjects];
          int v4 = 0;
          id v7 = 0;
        }
        ++v4;
        uint64_t v14 = [v8 assetCollectionGUID];
        uint64_t v15 = [(MSASServerSideModel *)self dbQueueMaximumCommentIDForAssetCollectionWithGUID:v14];

        if (v15) {
          int v16 = (void *)v15;
        }
        else {
          int v16 = &unk_1F367DA20;
        }
        id v17 = [v8 assetCollectionGUID];
        [v3 setObject:v16 forKey:v17];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v25);
  }
  else
  {
    id v5 = 0;
  }

  if ([v3 count])
  {
    id v27 = 0;
    [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v5 outObject:&v27 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v19 = v27;
    char v20 = [(MSASServerSideModel *)self stateMachine];
    id v21 = [v19 clientOrgKey];
    [v20 checkForCommentChanges:v3 inAlbumWithGUID:v5 withClientOrgKey:v21];
  }
  [(MSASServerSideModel *)self dbQueueDeleteAllPendingCommentCheckOperations];
  id v22 = [(MSASServerSideModel *)self stateMachine];
  [v22 retryOutstandingActivities];
}

- (void)flushAllPendingCommentCheckOperations
{
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MSASServerSideModel_flushAllPendingCommentCheckOperations__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__MSASServerSideModel_flushAllPendingCommentCheckOperations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueFlushAllPendingCommentCheckOperations];
}

- (void)dbQueueAddCommentCheckOperation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v4 assetCollectionGUID];
    int v16 = [v4 albumGUID];
    int v17 = 138543874;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    char v20 = v15;
    __int16 v21 = 2114;
    id v22 = v16;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Enqueuing comment check operation for asset collection GUID %{public}@ in album GUID %{public}@", (uint8_t *)&v17, 0x20u);
  }
  id v5 = [(MSASModelBase *)self statementForString:@"insert or replace into CommentCheckQueue (assetCollectionGUID, albumGUID) values (?, ?);"];
  id v6 = [v4 assetCollectionGUID];
  uint64_t v7 = MSSqliteBindStringOrNull(v5, 1, v6);
  int v8 = v7;
  MSSqliteTrapForDBLockError(v7);

  if (v8)
  {
    int v9 = 3464;
  }
  else
  {
    id v10 = [v4 albumGUID];
    uint64_t v11 = MSSqliteBindStringOrNull(v5, 2, v10);
    int v12 = v11;
    MSSqliteTrapForDBLockError(v11);

    if (v12)
    {
      int v9 = 3465;
    }
    else
    {
      uint64_t v13 = sqlite3_step(v5);
      int v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (v14 == 101) {
        goto LABEL_10;
      }
      int v9 = 3466;
    }
  }
  MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, v9);
LABEL_10:
  if (v5) {
    sqlite3_reset(v5);
  }
}

- (id)dbQueuePendingCommentCheckOperations
{
  id v2 = [(MSASModelBase *)self dbQueueDB];
  return +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v2, @"select assetCollectionGUID, albumGUID from CommentCheckQueue order by albumGUID;",
           &__block_literal_global_532);
}

MSASCommentCheckOperation *__59__MSASServerSideModel_dbQueuePendingCommentCheckOperations__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = objc_alloc_init(MSASCommentCheckOperation);
  id v4 = MSSqliteStringFromStatementColumn(a2, 0);
  [(MSASCommentCheckOperation *)v3 setAssetCollectionGUID:v4];

  id v5 = MSSqliteStringFromStatementColumn(a2, 1);
  [(MSASCommentCheckOperation *)v3 setAlbumGUID:v5];

  return v3;
}

- (void)dbQueueDeleteAllPendingCommentCheckOperations
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Deleting all comment check operations.", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v3 = [(MSASModelBase *)self statementForString:@"delete from CommentCheckQueue;"];
  uint64_t v4 = sqlite3_step(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (v5 != 101) {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3444);
  }
  if (v3) {
    sqlite3_reset(v3);
  }
}

- (int)dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  id v20 = 0;
  BOOL v5 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v4 outObject:&v20 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v6 = v20;
  if (!v5)
  {
    int v11 = 0;
    goto LABEL_11;
  }
  id v19 = 0;
  BOOL v7 = [(MSASServerSideModel *)self dbQueueAlbumMetadataWithAlbumGUID:v4 key:@"lastassetposition" outValue:&v19];
  id v8 = v19;
  int v9 = v8;
  if (v7) {
    sqlite3_int64 v10 = [v8 longLongValue];
  }
  else {
    sqlite3_int64 v10 = -1;
  }
  int v12 = [(MSASModelBase *)self statementForString:@"select count(GUID) from AssetCollections where albumGUID = ? and photoNumber > ?;"];
  uint64_t v13 = MSSqliteBindStringOrNull(v12, 1, v4);
  int v14 = v13;
  MSSqliteTrapForDBLockError(v13);
  if (v14) {
    goto LABEL_8;
  }
  uint64_t v15 = sqlite3_bind_int64(v12, 2, v10);
  int v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16) {
    goto LABEL_8;
  }
  int v18 = sqlite3_step(v12);
  if (v18 == 101) {
    goto LABEL_8;
  }
  if (v18 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3432);
LABEL_8:
    int v11 = 0;
    goto LABEL_9;
  }
  int v11 = sqlite3_column_int(v12, 0);
LABEL_9:

  if (v12) {
    sqlite3_reset(v12);
  }
LABEL_11:

  return v11;
}

- (int)unviewedAssetCollectionCountForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  BOOL v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MSASServerSideModel_unviewedAssetCollectionCountForAlbumWithGUID___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v9 = v4;
  sqlite3_int64 v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

uint64_t __68__MSASServerSideModel_unviewedAssetCollectionCountForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:*(void *)(a1 + 40)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)isAssetCollectionWithGUIDMarkedAsUnviewed:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  BOOL v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__MSASServerSideModel_isAssetCollectionWithGUIDMarkedAsUnviewed___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v9 = v4;
  sqlite3_int64 v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __65__MSASServerSideModel_isAssetCollectionWithGUIDMarkedAsUnviewed___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  int v4 = [v2 dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v3 key:@"unviewedFlag" outValue:&v7];
  id v5 = v7;
  id v6 = v5;
  if (v4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v5 isEqualToString:@"1"];
  }
}

- (int)dbQueueUnviewedAlbumCount
{
  uint64_t v3 = [(MSASModelBase *)self statementForString:@"select count(albumGUID) from AlbumMetadata where key = 'unviewedFlag' and value = '1';"];
  int v4 = sqlite3_step(v3);
  if (v4 != 101)
  {
    if (v4 == 100)
    {
      int v5 = sqlite3_column_int(v3, 0);
      if (!v3) {
        return v5;
      }
      goto LABEL_7;
    }
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3385);
  }
  int v5 = 0;
  if (v3) {
LABEL_7:
  }
    sqlite3_reset(v3);
  return v5;
}

- (int)unviewedAlbumCount
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__MSASServerSideModel_unviewedAlbumCount__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __41__MSASServerSideModel_unviewedAlbumCount__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dbQueueUnviewedAlbumCount];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isAlbumWithGUIDMarkedAsUnviewed:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  int v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MSASServerSideModel_isAlbumWithGUIDMarkedAsUnviewed___block_invoke;
  block[3] = &unk_1E6C3D000;
  void block[4] = self;
  id v9 = v4;
  sqlite3_int64 v10 = &v11;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __55__MSASServerSideModel_isAlbumWithGUIDMarkedAsUnviewed___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  int v4 = [v2 dbQueueAlbumMetadataWithAlbumGUID:v3 key:@"unviewedFlag" outValue:&v7];
  id v5 = v7;
  id v6 = v5;
  if (v4) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v5 isEqualToString:@"1"];
  }
}

- (void)eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:(id)a3 unviewedCount:(int)a4 info:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    int v17 = self;
    __int16 v18 = 2114;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = a4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Setting unviewed count for album %{public}@ to %d.", buf, 0x1Cu);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__MSASServerSideModel_eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum_unviewedCount_info___block_invoke;
  v12[3] = &unk_1E6C3D380;
  int v15 = a4;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(MSASServerSideModel *)self eventQueuePerformBlockOnObservers:v12];
}

void __97__MSASServerSideModel_eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum_unviewedCount_info___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didUpdateUnviewedAssetCollectionCount:*(unsigned int *)(a1 + 56) forAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didUpdateUnviewedAssetCollectionCount:*(unsigned int *)(a1 + 56) forAlbum:*(void *)(a1 + 40)];
  }
}

- (BOOL)dbQueueCheckToClearUnviewedStateOnAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v28 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueAlbumMetadataWithAlbumGUID:v6 key:@"lastviewedctag" outValue:&v28];
  id v9 = v28;
  if (v8)
  {
    id v26 = 0;
    id v27 = 0;
    id v25 = 0;
    BOOL v10 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v6 outObject:&v27 outName:0 outCtag:&v26 outForeignCtag:&v25 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v11 = v27;
    id v12 = v26;
    id v13 = v25;
    id v14 = v13;
    if (!v10) {
      goto LABEL_10;
    }
    BOOL v15 = ([v13 isEqualToString:v9] & 1) != 0
       || [v12 isEqualToString:v9];
    int v17 = [(MSASServerSideModel *)self dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:v6];
    __int16 v18 = [(MSASServerSideModel *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MSASServerSideModel_dbQueueCheckToClearUnviewedStateOnAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D0F8;
    void block[4] = self;
    id v11 = v11;
    id v22 = v11;
    int v24 = v17;
    id v19 = v7;
    id v23 = v19;
    dispatch_async(v18, block);

    if (v15)
    {
      [(MSASServerSideModel *)self dbQueueSetUnviewedState:0 onAlbumWithGUID:v6 info:v19];
      BOOL v16 = 1;
    }
    else
    {
LABEL_10:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
    id v11 = 0;
    id v14 = 0;
    id v12 = 0;
  }

  return v16;
}

uint64_t __76__MSASServerSideModel_dbQueueCheckToClearUnviewedStateOnAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
}

- (BOOL)dbQueueCheckToClearUnviewedStateOnAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v6 key:@"lastcommentposition" outValue:&v16];
  id v9 = v16;
  if (v8
    && ((-[MSASServerSideModel dbQueueMaximumCommentIDForAssetCollectionWithGUID:](self, "dbQueueMaximumCommentIDForAssetCollectionWithGUID:", v6), (v10 = objc_claimAutoreleasedReturnValue()) == 0)|| (v11 = (void *)v10, v12 = [v9 intValue], int v13 = objc_msgSend(v11, "intValue"), v11, v13 <= v12)))
  {
    [(MSASServerSideModel *)self dbQueueSetUnviewedState:0 onAssetCollectionWithGUID:v6 info:v7];
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)dbQueueSetUnviewedState:(BOOL)a3 onAlbumWithGUID:(id)a4 info:(id)a5
{
  int v6 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v26 = 0;
  int v10 = [(MSASServerSideModel *)self dbQueueAlbumMetadataWithAlbumGUID:v8 key:@"unviewedFlag" outValue:&v26];
  id v11 = v26;
  int v12 = v11;
  if (v10) {
    int v10 = [v11 isEqualToString:@"1"];
  }
  if (v10 == v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      id v28 = self;
      __int16 v29 = 2114;
      id v30 = v8;
      __int16 v31 = 1024;
      int v32 = v10;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Not setting unviewed state on album GUID %{public}@ because it is the same as the previous state: %d", buf, 0x1Cu);
    }
  }
  else
  {
    if (v6) {
      int v13 = @"1";
    }
    else {
      int v13 = 0;
    }
    [(MSASServerSideModel *)self dbQueueSetAlbumMetadataAlbumGUID:v8 key:@"unviewedFlag" value:v13 info:v9];
    id v25 = 0;
    BOOL v14 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v8 outObject:&v25 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v15 = v25;
    id v16 = v15;
    if (v14)
    {
      int v17 = [v15 GUID];
      int v18 = [(MSASServerSideModel *)self dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:v17];

      id v19 = [(MSASServerSideModel *)self eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke;
      block[3] = &unk_1E6C3D358;
      void block[4] = self;
      id v21 = v16;
      char v24 = v6;
      id v22 = v9;
      int v23 = v18;
      dispatch_async(v19, block);
    }
  }
}

void __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D330;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 60);
  id v5 = *(id *)(a1 + 48);
  int v6 = *(_DWORD *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __68__MSASServerSideModel_dbQueueSetUnviewedState_onAlbumWithGUID_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didMarkAlbum:*(void *)(a1 + 40) asHavingUnreadContent:*(unsigned __int8 *)(a1 + 60) info:*(void *)(a1 + 48)];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didMarkAlbum:*(void *)(a1 + 40) asHavingUnreadContent:*(unsigned __int8 *)(a1 + 60)];
  }
  [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
}

- (void)dbQueueSetUnviewedState:(BOOL)a3 onAssetCollectionWithGUID:(id)a4 info:(id)a5
{
  int v6 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v32 = 0;
  int v10 = [(MSASServerSideModel *)self dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v8 key:@"unviewedFlag" outValue:&v32];
  id v11 = v32;
  int v12 = v11;
  if (v10) {
    int v10 = [v11 isEqualToString:@"1"];
  }
  if (v10 == v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = self;
      __int16 v35 = 2114;
      id v36 = v8;
      __int16 v37 = 1024;
      int v38 = v10;
      _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Not setting unviewed state on asset collection GUID %{public}@ because it is the same as the previous state: %d", buf, 0x1Cu);
    }
  }
  else
  {
    if (v6) {
      int v13 = @"1";
    }
    else {
      int v13 = 0;
    }
    [(MSASServerSideModel *)self dbQueueSetAssetCollectionMetadataAssetCollectionGUID:v8 key:@"unviewedFlag" value:v13 info:v9];
    id v30 = 0;
    id v31 = 0;
    BOOL v14 = [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v8 outObject:&v31 outCtag:0 outAlbumGUID:&v30 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
    id v15 = v31;
    id v16 = v30;
    if (v14)
    {
      id v29 = 0;
      BOOL v17 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v16 outObject:&v29 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
      id v18 = v29;
      if (v17)
      {
        id v19 = [(MSASServerSideModel *)self eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke;
        block[3] = &unk_1E6C3D308;
        void block[4] = self;
        id v25 = v15;
        char v28 = v6;
        id v26 = v18;
        id v27 = v9;
        dispatch_async(v19, block);
      }
      if ((v6 & 1) == 0)
      {
        id v23 = 0;
        BOOL v20 = [(MSASServerSideModel *)self dbQueueAlbumMetadataWithAlbumGUID:v16 key:@"unviewedFlag" outValue:&v23];
        id v21 = v23;
        id v22 = v21;
        if (v20
          && [v21 isEqualToString:@"1"]
          && ![(MSASServerSideModel *)self dbQueueCountOfUnviewedAssetCollectionsInAlbumWithGUID:v16])
        {
          [(MSASServerSideModel *)self dbQueueSetUnviewedState:0 onAlbumWithGUID:v16 info:v9];
        }
      }
    }
  }
}

void __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D2E0;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __78__MSASServerSideModel_dbQueueSetUnviewedState_onAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didMarkAssetCollection:*(void *)(a1 + 40) asHavingUnreadComments:*(unsigned __int8 *)(a1 + 64) inAlbum:*(void *)(a1 + 48) info:*(void *)(a1 + 56)];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didMarkAssetCollection:*(void *)(a1 + 40) asHavingUnreadComments:*(unsigned __int8 *)(a1 + 64) inAlbum:*(void *)(a1 + 48)];
  }
}

- (int)dbQueueCountOfUnviewedAssetCollectionsInAlbumWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASModelBase *)self statementForString:@"select count(*) from AssetCollectionMetadata where albumGUID = ? and key = 'unviewedFlag' and value = '1';"];
  uint64_t v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if (v6)
  {
    char v7 = [(MSASModelBase *)self dbQueueDB];
    id v8 = self;
    int v9 = 3211;
LABEL_3:
    MSLogSqliteError(v7, (uint64_t)v8, v9);
    goto LABEL_4;
  }
  int v12 = sqlite3_step(v5);
  if (v12 != 101)
  {
    if (v12 == 100)
    {
      int v10 = sqlite3_column_int(v5, 0);
      if (!v5) {
        return v10;
      }
      goto LABEL_5;
    }
    char v7 = [(MSASModelBase *)self dbQueueDB];
    id v8 = self;
    int v9 = 3216;
    goto LABEL_3;
  }
LABEL_4:
  int v10 = 0;
  if (v5) {
LABEL_5:
  }
    sqlite3_reset(v5);
  return v10;
}

- (id)dbQueueMaximumPhotoNumberForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASModelBase *)self statementForString:@"select max(photoNumber) from AssetCollections where AlbumGUID = ?"];
  uint64_t v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if (v6 || (int v9 = sqlite3_step(v5), v9 == 101))
  {
LABEL_2:
    char v7 = 0;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v9 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3196);
    goto LABEL_2;
  }
  sqlite3_int64 v10 = sqlite3_column_int64(v5, 0);
  if (v10 < 0) {
    goto LABEL_2;
  }
  char v7 = [NSNumber numberWithLongLong:v10];
  if (v5) {
LABEL_3:
  }
    sqlite3_reset(v5);
LABEL_4:
  return v7;
}

- (void)dbQueueDeleteAllAssetCollectionMetadataForAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(MSASModelBase *)self statementForString:@"delete from AssetCollectionMetadata where assetCollectionGUID = ?;"];
  uint64_t v7 = MSSqliteBindStringOrNull(v6, 1, v5);

  MSSqliteTrapForDBLockError(v7);
  if (v7)
  {
    if (!v6) {
      return;
    }
  }
  else
  {
    uint64_t v8 = sqlite3_step(v6);
    MSSqliteTrapForDBLockError(v8);
    if (!v6) {
      return;
    }
  }
  sqlite3_reset(v6);
}

- (void)dbQueueDeleteAssetCollectionMetadataAssetCollectionGUID:(id)a3 key:(id)a4 info:(id)a5
{
  id v13 = a4;
  id v7 = a3;
  uint64_t v8 = [(MSASModelBase *)self statementForString:@"delete from AssetCollectionMetadata where assetCollectionGUID = ? and key = ?;"];
  uint64_t v9 = MSSqliteBindStringOrNull(v8, 1, v7);

  MSSqliteTrapForDBLockError(v9);
  if (!v9)
  {
    uint64_t v10 = MSSqliteBindStringOrNull(v8, 2, v13);
    int v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (!v11)
    {
      uint64_t v12 = sqlite3_step(v8);
      MSSqliteTrapForDBLockError(v12);
    }
  }
  if (v8) {
    sqlite3_reset(v8);
  }
}

- (void)dbQueueSetAssetCollectionMetadataAssetCollectionGUID:(id)a3 key:(id)a4 value:(id)a5 info:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v43 = 0;
  [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v10 outObject:0 outCtag:0 outAlbumGUID:&v43 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v14 = v43;
  id v15 = [(MSASModelBase *)self statementForString:@"insert or replace into AssetCollectionMetadata (assetCollectionGUID, albumGUID, key, value) values (?, ?, ?, ?);"];
  uint64_t v16 = MSSqliteBindStringOrNull(v15, 1, v10);
  int v17 = v16;
  MSSqliteTrapForDBLockError(v16);
  if (!v17)
  {
    uint64_t v18 = MSSqliteBindStringOrNull(v15, 2, v14);
    int v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    if (!v19)
    {
      uint64_t v20 = MSSqliteBindStringOrNull(v15, 3, v11);
      int v21 = v20;
      MSSqliteTrapForDBLockError(v20);
      if (!v21)
      {
        uint64_t v22 = MSSqliteBindStringOrNull(v15, 4, v12);
        int v23 = v22;
        MSSqliteTrapForDBLockError(v22);
        if (!v23)
        {
          uint64_t v24 = sqlite3_step(v15);
          MSSqliteTrapForDBLockError(v24);
        }
      }
    }
  }
  if (v15) {
    sqlite3_reset(v15);
  }
  if ([v11 isEqualToString:@"lastcommenttimestamp"])
  {
    id v42 = 0;
    id v41 = 0;
    BOOL v25 = [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v10 outObject:&v42 outCtag:0 outAlbumGUID:&v41 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
    id v26 = v42;
    id v27 = v41;
    if (v25)
    {
      id v40 = 0;
      BOOL v28 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v27 outObject:&v40 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
      id v29 = v40;
      if (v28)
      {
        id v30 = (void *)MEMORY[0x1E4F1C9C8];
        id v34 = v29;
        [v12 doubleValue];
        id v31 = objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
        id v32 = [(MSASServerSideModel *)self eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke;
        block[3] = &unk_1E6C3D9E8;
        void block[4] = self;
        id v36 = v31;
        id v37 = v26;
        id v38 = v34;
        id v39 = v13;
        id v33 = v31;
        dispatch_async(v32, block);

        id v29 = v34;
      }
    }
  }
}

void __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke_2;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __91__MSASServerSideModel_dbQueueSetAssetCollectionMetadataAssetCollectionGUID_key_value_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindLastViewedCommentDate:a1[5] forAssetCollection:a1[6] inAlbum:a1[7] info:a1[8]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindLastViewedCommentDate:a1[5] forAssetCollection:a1[6] inAlbum:a1[7]];
  }
}

- (BOOL)dbQueueAssetCollectionMetadataWithAssetCollectionGUID:(id)a3 key:(id)a4 outValue:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MSASModelBase *)self statementForString:@"select value from AssetCollectionMetadata where assetCollectionGUID = ? and key = ?;"];
  uint64_t v11 = MSSqliteBindStringOrNull(v10, 1, v9);

  MSSqliteTrapForDBLockError(v11);
  if (v11
    || (v12 = MSSqliteBindStringOrNull(v10, 2, v8), int v13 = v12, MSSqliteTrapForDBLockError(v12), v13)
    || (int v16 = sqlite3_step(v10), v16 == 101))
  {
LABEL_3:
    BOOL v14 = 0;
    if (!v10) {
      goto LABEL_5;
    }
LABEL_4:
    sqlite3_reset(v10);
    goto LABEL_5;
  }
  if (v16 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3111);
    goto LABEL_3;
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v10, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v14 = 1;
  if (v10) {
    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (void)dbQueueDeleteAllAlbumMetadataForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v5 = a3;
  id v6 = [(MSASModelBase *)self statementForString:@"delete from AlbumMetadata where albumGUID = ?;"];
  uint64_t v7 = MSSqliteBindStringOrNull(v6, 1, v5);

  MSSqliteTrapForDBLockError(v7);
  if (v7)
  {
    if (!v6) {
      return;
    }
  }
  else
  {
    uint64_t v8 = sqlite3_step(v6);
    MSSqliteTrapForDBLockError(v8);
    if (!v6) {
      return;
    }
  }
  sqlite3_reset(v6);
}

- (void)dbQueueDeleteAlbumMetadataAlbumGUID:(id)a3 key:(id)a4 info:(id)a5
{
  id v13 = a4;
  id v7 = a3;
  uint64_t v8 = [(MSASModelBase *)self statementForString:@"delete from AlbumMetadata where albumGUID = ? and key = ?;"];
  uint64_t v9 = MSSqliteBindStringOrNull(v8, 1, v7);

  MSSqliteTrapForDBLockError(v9);
  if (!v9)
  {
    uint64_t v10 = MSSqliteBindStringOrNull(v8, 2, v13);
    int v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (!v11)
    {
      uint64_t v12 = sqlite3_step(v8);
      MSSqliteTrapForDBLockError(v12);
    }
  }
  if (v8) {
    sqlite3_reset(v8);
  }
}

- (void)dbQueueSetAlbumMetadataAlbumGUID:(id)a3 key:(id)a4 value:(id)a5 info:(id)a6
{
  id v18 = a4;
  id v9 = a5;
  id v10 = a3;
  int v11 = [(MSASModelBase *)self statementForString:@"insert or replace into AlbumMetadata (albumGUID, key, value) values (?, ?, ?);"];
  uint64_t v12 = MSSqliteBindStringOrNull(v11, 1, v10);

  MSSqliteTrapForDBLockError(v12);
  if (!v12)
  {
    uint64_t v13 = MSSqliteBindStringOrNull(v11, 2, v18);
    int v14 = v13;
    MSSqliteTrapForDBLockError(v13);
    if (!v14)
    {
      uint64_t v15 = MSSqliteBindStringOrNull(v11, 3, v9);
      int v16 = v15;
      MSSqliteTrapForDBLockError(v15);
      if (!v16)
      {
        uint64_t v17 = sqlite3_step(v11);
        MSSqliteTrapForDBLockError(v17);
      }
    }
  }
  if (v11) {
    sqlite3_reset(v11);
  }
}

- (BOOL)dbQueueAlbumMetadataWithAlbumGUID:(id)a3 key:(id)a4 outValue:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(MSASModelBase *)self statementForString:@"select value from AlbumMetadata where albumGUID = ? and key = ?;"];
  uint64_t v11 = MSSqliteBindStringOrNull(v10, 1, v9);

  MSSqliteTrapForDBLockError(v11);
  if (v11
    || (v12 = MSSqliteBindStringOrNull(v10, 2, v8), int v13 = v12, MSSqliteTrapForDBLockError(v12), v13)
    || (int v16 = sqlite3_step(v10), v16 == 101))
  {
LABEL_3:
    BOOL v14 = 0;
    if (!v10) {
      goto LABEL_5;
    }
LABEL_4:
    sqlite3_reset(v10);
    goto LABEL_5;
  }
  if (v16 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3051);
    goto LABEL_3;
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v10, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v14 = 1;
  if (v10) {
    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (BOOL)dbQueueAssetCollectionContainsCommentsFromMeAssetCollectionGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASModelBase *)self statementForString:@"select assetCollectionGUID from Comments where assetCollectionGUID = ? and isMine > 0;"];
  uint64_t v6 = MSSqliteBindStringOrNull(v5, 1, v4);

  MSSqliteTrapForDBLockError(v6);
  if (v6)
  {
    id v7 = [(MSASModelBase *)self dbQueueDB];
    id v8 = self;
    int v9 = 3026;
LABEL_3:
    MSLogSqliteError(v7, (uint64_t)v8, v9);
    goto LABEL_4;
  }
  int v12 = sqlite3_step(v5);
  if (v12 == 100)
  {
    BOOL v10 = 1;
    if (!v5) {
      return v10;
    }
    goto LABEL_5;
  }
  if (v12 != 101)
  {
    id v7 = [(MSASModelBase *)self dbQueueDB];
    id v8 = self;
    int v9 = 3031;
    goto LABEL_3;
  }
LABEL_4:
  BOOL v10 = 0;
  if (v5) {
LABEL_5:
  }
    sqlite3_reset(v5);
  return v10;
}

- (id)dbQueueMaximumCommentIDForAssetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  BOOL v5 = [(MSASServerSideModel *)self dbQueueAssetCollectionMetadataWithAssetCollectionGUID:v4 key:@"largestCommentID" outValue:&v14];
  id v6 = v14;
  id v7 = v6;
  if (v5)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "intValue"));
    goto LABEL_6;
  }
  int v9 = [(MSASModelBase *)self statementForString:@"select max(id) from Comments where assetCollectionGUID = ?;"];
  uint64_t v10 = MSSqliteBindStringOrNull(v9, 1, v4);
  int v11 = v10;
  MSSqliteTrapForDBLockError(v10);
  if (v11 || (int v13 = sqlite3_step(v9), v13 == 101))
  {
LABEL_4:
    id v8 = 0;
    if (!v9) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v13 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 3013);
    goto LABEL_4;
  }
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(v9, 0));
  if (v9) {
LABEL_5:
  }
    sqlite3_reset(v9);
LABEL_6:

  return v8;
}

- (void)dbQueueDeleteCommentWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v33 = 0;
  id v32 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueCommentWithGUID:v6 outObject:&v33 outID:0 outTimestamp:0 outAssetCollectionGUID:&v32 outIsCaption:0 outUserInfoData:0];
  id v9 = v33;
  id v10 = v32;
  if (v8)
  {
    int v11 = [(MSASModelBase *)self statementForString:@"delete from Comments where GUID = ?;"];
    uint64_t v12 = MSSqliteBindStringOrNull(v11, 1, v6);
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v11);
      int v15 = v14;
      MSSqliteTrapForDBLockError(v14);
      if (v15 == 101)
      {
        id v31 = 0;
        int v16 = [(MSASServerSideModel *)self dbQueueLookupOrCreateAssetCollectionWithGUID:v10 outAlbum:&v31];
        id v17 = v31;
        id v18 = [(MSASServerSideModel *)self commandQueue];
        [v18 MSASModel:self didDeleteComment:v9 forAssetCollection:v16 inAlbum:v17 info:v7];

        int v19 = [(MSASServerSideModel *)self eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke;
        block[3] = &unk_1E6C3D9E8;
        void block[4] = self;
        id v27 = v9;
        id v28 = v16;
        id v29 = v17;
        id v30 = v7;
        id v20 = v17;
        id v21 = v16;
        dispatch_async(v19, block);
      }
    }
    if (v11) {
      sqlite3_reset(v11);
    }
    uint64_t v22 = [(MSASModelBase *)self statementForString:@"select count(GUID) from Comments where assetCollectionGUID = ?;"];
    uint64_t v23 = MSSqliteBindStringOrNull(v22, 1, v10);
    int v24 = v23;
    MSSqliteTrapForDBLockError(v23);
    if (!v24)
    {
      int v25 = sqlite3_step(v22);
      if (v25 != 101)
      {
        if (v25 == 100)
        {
          if (!sqlite3_column_int(v22, 0)) {
            [(MSASServerSideModel *)self dbQueueSetUnviewedState:0 onAssetCollectionWithGUID:v10 info:v7];
          }
        }
        else
        {
          MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2989);
        }
      }
    }
    if (v22) {
      sqlite3_reset(v22);
    }
  }
}

void __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __57__MSASServerSideModel_dbQueueDeleteCommentWithGUID_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didDeleteComment:a1[5] forAssetCollection:a1[6] inAlbum:a1[7] info:a1[8]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didDeleteComment:a1[5] forAssetCollection:a1[6] inAlbum:a1[7]];
  }
}

- (void)dbQueueSetComment:(id)a3 forAssetCollectionWithGUID:(id)a4 info:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v64 = 0;
  id v65 = 0;
  BOOL v11 = [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v9 outObject:&v65 outCtag:0 outAlbumGUID:&v64 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v12 = v65;
  id v13 = v64;
  if (v11)
  {
    id v63 = 0;
    BOOL v14 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v13 outObject:&v63 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v15 = v63;
    if (v14)
    {
      int v16 = [v8 GUID];
      id v62 = 0;
      BOOL v48 = [(MSASServerSideModel *)self dbQueueCommentWithGUID:v16 outObject:0 outID:0 outTimestamp:0 outAssetCollectionGUID:0 outIsCaption:0 outUserInfoData:&v62];
      id v50 = v62;

      id v17 = [(MSASModelBase *)self statementForString:@"insert or replace into Comments (GUID, id, timestamp, assetCollectionGUID, isCaption, isMine, obj, userInfo) values (?, ?, ?, ?, ?, ?, ?, ?);"];
      id v18 = [v8 GUID];
      uint64_t v19 = MSSqliteBindStringOrNull(v17, 1, v18);
      int v20 = v19;
      MSSqliteTrapForDBLockError(v19);

      if (!v20)
      {
        uint64_t v21 = sqlite3_bind_int(v17, 2, [v8 ID]);
        int v22 = v21;
        MSSqliteTrapForDBLockError(v21);
        if (!v22)
        {
          uint64_t v23 = [v8 timestamp];
          uint64_t v24 = MSSqliteBindTimeIntervalSinceReferenceDateOrNull(v17, 3, v23);
          int v25 = v24;
          MSSqliteTrapForDBLockError(v24);

          if (!v25)
          {
            uint64_t v26 = MSSqliteBindStringOrNull(v17, 4, v9);
            int v27 = v26;
            MSSqliteTrapForDBLockError(v26);
            if (!v27)
            {
              uint64_t v28 = sqlite3_bind_int(v17, 5, [v8 isCaption]);
              int v29 = v28;
              MSSqliteTrapForDBLockError(v28);
              if (!v29)
              {
                uint64_t v30 = sqlite3_bind_int(v17, 6, [v8 isMine]);
                int v31 = v30;
                MSSqliteTrapForDBLockError(v30);
                if (!v31)
                {
                  id v61 = 0;
                  id v32 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v61];
                  id v47 = v61;
                  if (v32)
                  {
                    uint64_t v33 = MSSqliteBindDataOrNull(v17, 7, v32);
                  }
                  else
                  {
                    long long v44 = NSString;
                    id v34 = [v47 userInfo];
                    __int16 v35 = [v44 stringWithFormat:@"Failed to archive a comment object. Error: %@ Info: %@", v47, v34];

                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      long long v67 = v35;
                      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
                    }

                    uint64_t v33 = MSSqliteBindDataOrNull(v17, 7, 0);
                    id v32 = 0;
                  }
                  MSSqliteTrapForDBLockError(v33);
                  if (!v33)
                  {
                    uint64_t v36 = MSSqliteBindDataOrNull(v17, 8, v50);
                    int v37 = v36;
                    MSSqliteTrapForDBLockError(v36);
                    if (!v37)
                    {
                      uint64_t v38 = sqlite3_step(v17);
                      int v39 = v38;
                      MSSqliteTrapForDBLockError(v38);
                      if (v39 == 101)
                      {
                        long long v46 = v32;
                        id v40 = [(MSASServerSideModel *)self commandQueue];
                        id v41 = v40;
                        if (v48)
                        {
                          v56[0] = MEMORY[0x1E4F143A8];
                          v56[1] = 3221225472;
                          v56[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke;
                          v56[3] = &unk_1E6C3D9E8;
                          v56[4] = self;
                          int v49 = &v57;
                          id v57 = v8;
                          long long v45 = &v58;
                          id v58 = v12;
                          id v43 = &v59;
                          id v59 = v15;
                          id v42 = &v60;
                          id v60 = v10;
                          [v41 flushQueueCompletionBlock:v56];
                        }
                        else
                        {
                          [v40 MSASModel:self didFindNewComment:v8 forAssetCollection:v12 inAlbum:v15 info:v10];

                          id v41 = [(MSASServerSideModel *)self eventQueue];
                          block[0] = MEMORY[0x1E4F143A8];
                          block[1] = 3221225472;
                          block[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_4;
                          block[3] = &unk_1E6C3D9E8;
                          void block[4] = self;
                          int v49 = &v52;
                          id v52 = v8;
                          long long v45 = &v53;
                          id v53 = v12;
                          id v43 = &v54;
                          id v54 = v15;
                          id v42 = &v55;
                          id v55 = v10;
                          dispatch_async(v41, block);
                        }

                        id v32 = v46;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      if (v17) {
        sqlite3_reset(v17);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      long long v67 = self;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting comment destined for non-existent asset collection.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    long long v67 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting comment destined for non-existent asset collection.", buf, 0xCu);
  }
}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_2;
  block[3] = &unk_1E6C3D9E8;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  dispatch_async(v2, block);
}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_5;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewComment:a1[5] forAssetCollection:a1[6] inAlbum:a1[7] info:a1[8]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewComment:a1[5] forAssetCollection:a1[6] inAlbum:a1[7]];
  }
}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_3;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __73__MSASServerSideModel_dbQueueSetComment_forAssetCollectionWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindCommentChange:a1[5] inAssetCollection:a1[6] inAlbum:a1[7] info:a1[8]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindCommentChange:a1[5] inAssetCollection:a1[6] inAlbum:a1[7]];
  }
}

- (BOOL)dbQueueCommentWithID:(int)a3 assetCollectionGUID:(id)a4 outObject:(id *)a5 outGUID:(id *)a6 outTimestamp:(id *)a7 outIsCaption:(BOOL *)a8 outUserInfoData:(id *)a9
{
  id v15 = a4;
  int v16 = [(MSASModelBase *)self statementForString:@"select obj, GUID, timestamp, isCaption, userInfo from Comments where id = ? and assetCollectionGUID = ?;"];
  uint64_t v17 = sqlite3_bind_int(v16, 1, a3);
  int v18 = v17;
  MSSqliteTrapForDBLockError(v17);
  if (v18
    || (uint64_t v19 = MSSqliteBindStringOrNull(v16, 2, v15), v20 = v19, MSSqliteTrapForDBLockError(v19), v20)
    || (int v23 = sqlite3_step(v16), v23 == 101))
  {
LABEL_3:
    BOOL v21 = 0;
    if (!v16) {
      goto LABEL_5;
    }
LABEL_4:
    sqlite3_reset(v16);
    goto LABEL_5;
  }
  if (v23 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2875);
    goto LABEL_3;
  }
  if (a5)
  {
    MSSqliteObjectFromStatementColumn(v16, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v16, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v16, 2);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8) {
    *a8 = sqlite3_column_int(v16, 3) != 0;
  }
  if (a9)
  {
    MSSqliteDataFromStatementColumn(v16, 4);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v21 = 1;
  if (v16) {
    goto LABEL_4;
  }
LABEL_5:

  return v21;
}

- (BOOL)dbQueueCommentWithGUID:(id)a3 outObject:(id *)a4 outID:(unint64_t *)a5 outTimestamp:(id *)a6 outAssetCollectionGUID:(id *)a7 outIsCaption:(BOOL *)a8 outUserInfoData:(id *)a9
{
  id v15 = a3;
  int v16 = [(MSASModelBase *)self statementForString:@"select obj, id, timestamp, assetCollectionGUID, isCaption, userInfo from Comments where GUID = ?;"];
  uint64_t v17 = MSSqliteBindStringOrNull(v16, 1, v15);

  MSSqliteTrapForDBLockError(v17);
  if (v17 || (int v20 = sqlite3_step(v16), v20 == 101))
  {
LABEL_2:
    BOOL v18 = 0;
    if (!v16) {
      return v18;
    }
LABEL_3:
    sqlite3_reset(v16);
    return v18;
  }
  if (v20 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2850);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v16, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5) {
    *a5 = sqlite3_column_int(v16, 1);
  }
  if (a6)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v16, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteStringFromStatementColumn(v16, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8) {
    *a8 = sqlite3_column_int(v16, 4) != 0;
  }
  if (a9)
  {
    MSSqliteDataFromStatementColumn(v16, 5);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v18 = 1;
  if (v16) {
    goto LABEL_3;
  }
  return v18;
}

- (void)dbQueueDeleteAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v44 = 0;
  id v45 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v6 outObject:&v45 outCtag:0 outAlbumGUID:&v44 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v9 = v45;
  id v10 = v44;
  if (v8)
  {
    id v34 = v9;
    id v35 = v7;
    BOOL v11 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:v7];
    id v12 = [v11 MSASAddEventIsDueToAssetCollectionDeletionAssetCollectionGUID:v6];

    [(MSASModelBase *)self dbQueueBeginTransaction];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = [(MSASServerSideModel *)self dbQueueCommentsForAssetCollectionWithGUID:v6];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x1E019E3B0]();
          int v20 = [v18 GUID];
          [(MSASServerSideModel *)self dbQueueDeleteCommentWithGUID:v20 info:v12];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v15);
    }

    [(MSASModelBase *)self dbQueueEndTransaction];
    [(MSASServerSideModel *)self dbQueueDeleteAllAssetCollectionMetadataForAssetCollectionWithGUID:v6 info:v12];
    BOOL v21 = [(MSASModelBase *)self statementForString:@"delete from AssetCollections where GUID = ?;"];
    uint64_t v22 = MSSqliteBindStringOrNull(v21, 1, v6);
    int v23 = v22;
    MSSqliteTrapForDBLockError(v22);
    if (!v23)
    {
      uint64_t v24 = sqlite3_step(v21);
      MSSqliteTrapForDBLockError(v24);
    }
    id v9 = v34;
    if (v21) {
      sqlite3_reset(v21);
    }
    int v25 = [(MSASServerSideModel *)self dbQueueLookupOrCreateAlbumWithGUID:v10];
    uint64_t v26 = [(MSASServerSideModel *)self commandQueue];
    [v26 MSASModel:self didFindDeletedAssetCollection:v34 inAlbum:v25 info:v12];

    int v27 = [(MSASServerSideModel *)self eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D9C0;
    void block[4] = self;
    id v37 = v34;
    id v28 = v25;
    id v38 = v28;
    id v29 = v12;
    id v39 = v29;
    dispatch_async(v27, block);

    uint64_t v30 = [(MSASModelBase *)self statementForString:@"select count(GUID) from AssetCollections where albumGUID = ?"];
    uint64_t v31 = MSSqliteBindStringOrNull(v30, 1, v10);
    int v32 = v31;
    MSSqliteTrapForDBLockError(v31);
    id v7 = v35;
    if (!v32)
    {
      int v33 = sqlite3_step(v30);
      if (v33 != 101)
      {
        if (v33 == 100)
        {
          if (!sqlite3_column_int(v30, 0)) {
            [(MSASServerSideModel *)self dbQueueSetUnviewedState:0 onAlbumWithGUID:v10 info:v29];
          }
        }
        else
        {
          MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2822);
        }
      }
    }
    if (v30) {
      sqlite3_reset(v30);
    }
  }
}

void __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __65__MSASServerSideModel_dbQueueDeleteAssetCollectionWithGUID_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedAssetCollection:a1[5] inAlbum:a1[6] info:a1[7]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedAssetCollection:a1[5] inAlbum:a1[6]];
  }
}

- (void)dbQueueSetAssetCollection:(id)a3 inAlbumWithGUID:(id)a4 info:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v64 = 0;
  BOOL v11 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v9 outObject:&v64 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v12 = v64;
  if (v11)
  {
    id v13 = [v8 GUID];
    id v63 = 0;
    BOOL v52 = [(MSASServerSideModel *)self dbQueueAssetCollectionWithGUID:v13 outObject:0 outCtag:0 outAlbumGUID:0 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:&v63];
    id v14 = v63;

    uint64_t v15 = [(MSASModelBase *)self statementForString:@"insert or replace into AssetCollections (GUID, ctag, albumGUID, batchDate, photoDate, photoNumber, obj, userInfo) values (?, ?, ?, ?, ?, ?, ?, ?);"];
    uint64_t v16 = [v8 GUID];
    uint64_t v17 = MSSqliteBindStringOrNull(v15, 1, v16);
    int v18 = v17;
    MSSqliteTrapForDBLockError(v17);

    if (!v18)
    {
      uint64_t v19 = [v8 ctag];
      uint64_t v20 = MSSqliteBindStringOrNull(v15, 2, v19);
      int v21 = v20;
      MSSqliteTrapForDBLockError(v20);

      if (!v21)
      {
        uint64_t v22 = MSSqliteBindStringOrNull(v15, 3, v9);
        int v23 = v22;
        MSSqliteTrapForDBLockError(v22);
        if (!v23)
        {
          uint64_t v24 = [v8 metadata];
          int v25 = [v24 objectForKey:@"batchDateCreated"];

          uint64_t v26 = MSSqliteBindTimeIntervalSinceReferenceDateOrNull(v15, 4, v25);
          LODWORD(v24) = v26;
          MSSqliteTrapForDBLockError(v26);
          if (!v24)
          {
            id v50 = v25;
            int v27 = [v8 metadata];
            id v28 = [v27 objectForKey:@"dateCreated"];

            int v51 = v28;
            uint64_t v29 = MSSqliteBindTimeIntervalSinceReferenceDateOrNull(v15, 5, v28);
            LODWORD(v27) = v29;
            MSSqliteTrapForDBLockError(v29);
            if (!v27)
            {
              uint64_t v30 = sqlite3_bind_int64(v15, 6, [v8 photoNumber]);
              int v31 = v30;
              MSSqliteTrapForDBLockError(v30);
              if (!v31)
              {
                id v62 = 0;
                int v32 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v62];
                id v33 = v62;
                int v49 = v33;
                if (v32)
                {
                  uint64_t v34 = MSSqliteBindDataOrNull(v15, 7, v32);
                }
                else
                {
                  uint64_t v47 = NSString;
                  id v35 = v33;
                  uint64_t v36 = [v33 userInfo];
                  id v37 = [v47 stringWithFormat:@"Failed to archive an assetCollection object. Error: %@ Info: %@", v35, v36];

                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    long long v66 = v37;
                    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
                  }

                  uint64_t v34 = MSSqliteBindDataOrNull(v15, 7, 0);
                  int v32 = 0;
                }
                MSSqliteTrapForDBLockError(v34);
                if (!v34)
                {
                  uint64_t v38 = MSSqliteBindDataOrNull(v15, 8, v14);
                  int v39 = v38;
                  MSSqliteTrapForDBLockError(v38);
                  if (!v39)
                  {
                    uint64_t v40 = sqlite3_step(v15);
                    int v41 = v40;
                    MSSqliteTrapForDBLockError(v40);
                    if (v41 == 101)
                    {
                      BOOL v48 = v32;
                      long long v42 = [(MSASServerSideModel *)self commandQueue];
                      long long v43 = v42;
                      if (v52)
                      {
                        v58[0] = MEMORY[0x1E4F143A8];
                        v58[1] = 3221225472;
                        v58[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke;
                        v58[3] = &unk_1E6C3D9C0;
                        v58[4] = self;
                        id v53 = &v59;
                        id v59 = v8;
                        id v44 = &v60;
                        id v60 = v12;
                        id v45 = &v61;
                        id v61 = v10;
                        [v43 flushQueueCompletionBlock:v58];
                      }
                      else
                      {
                        [v42 MSASModel:self didFindNewAssetCollection:v8 inAlbum:v12 info:v10];

                        long long v46 = [(MSASServerSideModel *)self eventQueue];
                        block[0] = MEMORY[0x1E4F143A8];
                        block[1] = 3221225472;
                        block[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_4;
                        block[3] = &unk_1E6C3D9C0;
                        void block[4] = self;
                        id v53 = &v55;
                        id v55 = v8;
                        id v44 = &v56;
                        id v56 = v12;
                        id v45 = &v57;
                        id v57 = v10;
                        long long v43 = v46;
                        dispatch_async(v46, block);
                      }

                      int v32 = v48;
                    }
                  }
                }
              }
            }

            int v25 = v50;
          }
        }
      }
    }
    if (v15) {
      sqlite3_reset(v15);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    long long v66 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting asset collection destined for non-existent album.", buf, 0xCu);
  }
}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_2;
  v4[3] = &unk_1E6C3D9C0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);
}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_5;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewAssetCollection:a1[5] inAlbum:a1[6] info:a1[7]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewAssetCollection:a1[5] inAlbum:a1[6]];
  }
}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_3;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __70__MSASServerSideModel_dbQueueSetAssetCollection_inAlbumWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindAssetCollectionChange:a1[5] inAlbum:a1[6] info:a1[7]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindAssetCollectionChange:a1[5] inAlbum:a1[6]];
  }
}

- (BOOL)dbQueueAssetCollectionWithGUID:(id)a3 outObject:(id *)a4 outCtag:(id *)a5 outAlbumGUID:(id *)a6 outBatchDate:(id *)a7 outPhotoDate:(id *)a8 outPhotoNumber:(int64_t *)a9 outUserInfoData:(id *)a10
{
  id v16 = a3;
  uint64_t v17 = [(MSASModelBase *)self statementForString:@"select obj, ctag, albumGUID, batchDate, photoDate, photoNumber, userInfo from AssetCollections where GUID = ?;"];
  uint64_t v18 = MSSqliteBindStringOrNull(v17, 1, v16);

  MSSqliteTrapForDBLockError(v18);
  if (v18 || (int v21 = sqlite3_step(v17), v21 == 101))
  {
LABEL_2:
    BOOL v19 = 0;
    if (!v17) {
      return v19;
    }
LABEL_3:
    sqlite3_reset(v17);
    return v19;
  }
  if (v21 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2702);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v17, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v17, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v17, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v17, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8)
  {
    MSSqliteDateFromTimeIntervalStatementColumn(v17, 4);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a9) {
    *a9 = sqlite3_column_int64(v17, 5);
  }
  if (a10)
  {
    MSSqliteDataFromStatementColumn(v17, 6);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v19 = 1;
  if (v17) {
    goto LABEL_3;
  }
  return v19;
}

- (void)dbQueueDeleteInvitationForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a4;
  id v9 = 0;
  BOOL v7 = [(MSASServerSideModel *)self dbQueueInvitationWithAlbumGUID:a3 outObject:0 outInvitationGUID:&v9 outEmail:0 outUserInfoData:0];
  id v8 = v9;
  if (v7) {
    [(MSASServerSideModel *)self dbQueueDeleteInvitationWithGUID:v8 info:v6];
  }
}

- (void)dbQueueDeleteInvitationWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueInvitationWithGUID:v6 outObject:&v20 outAlbumGUID:0 outEmail:0 outUserInfoData:0];
  id v9 = v20;
  if (v8)
  {
    id v10 = [(MSASModelBase *)self statementForString:@"delete from Invitations where GUID = ?;"];
    uint64_t v11 = sqlite3_bind_text(v10, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v12 = v11;
    MSSqliteTrapForDBLockError(v11);
    if (!v12)
    {
      uint64_t v13 = sqlite3_step(v10);
      int v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (v14 == 101)
      {
        uint64_t v15 = [(MSASServerSideModel *)self commandQueue];
        [v15 MSASModel:self didFindDeletedInvitation:v9 info:v7];

        id v16 = [(MSASServerSideModel *)self eventQueue];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        void v17[2] = __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke;
        v17[3] = &unk_1E6C3D998;
        v17[4] = self;
        id v18 = v9;
        id v19 = v7;
        dispatch_async(v16, v17);
      }
    }
    if (v10) {
      sqlite3_reset(v10);
    }
  }
}

void __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __60__MSASServerSideModel_dbQueueDeleteInvitationWithGUID_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedInvitation:a1[5] info:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedInvitation:a1[5]];
  }
}

- (void)dbQueueSetInvitation:(id)a3 info:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 GUID];
  id v46 = 0;
  BOOL v9 = [(MSASServerSideModel *)self dbQueueInvitationWithGUID:v8 outObject:0 outAlbumGUID:0 outEmail:0 outUserInfoData:&v46];
  id v10 = v46;

  uint64_t v11 = [(MSASModelBase *)self statementForString:@"insert or replace into Invitations (GUID, albumGUID, email, obj, userInfo) values (?, ?, ?, ?, ?);"];
  int v12 = [v6 GUID];
  uint64_t v13 = MSSqliteBindStringOrNull(v11, 1, v12);
  int v14 = v13;
  MSSqliteTrapForDBLockError(v13);

  if (!v14)
  {
    uint64_t v15 = [v6 albumGUID];
    uint64_t v16 = MSSqliteBindStringOrNull(v11, 2, v15);
    int v17 = v16;
    MSSqliteTrapForDBLockError(v16);

    if (!v17)
    {
      id v18 = [v6 email];
      uint64_t v19 = MSSqliteBindStringOrNull(v11, 3, v18);
      int v20 = v19;
      MSSqliteTrapForDBLockError(v19);

      if (!v20)
      {
        id v45 = 0;
        int v21 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v45];
        id v22 = v45;
        int v23 = v22;
        if (v21)
        {
          uint64_t v24 = v11;
          int v25 = v21;
        }
        else
        {
          uint64_t v26 = NSString;
          int v27 = [v22 userInfo];
          id v28 = [v26 stringWithFormat:@"Failed to archive an invitation object. Error: %@ Info: %@", v23, v27];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            BOOL v48 = v28;
            _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
          }

          uint64_t v24 = v11;
          int v25 = 0;
        }
        uint64_t v29 = MSSqliteBindDataOrNull(v24, 4, v25);
        int v30 = v29;
        MSSqliteTrapForDBLockError(v29);
        if (!v30)
        {
          uint64_t v31 = MSSqliteBindDataOrNull(v11, 5, v10);
          int v32 = v31;
          MSSqliteTrapForDBLockError(v31);
          if (!v32)
          {
            uint64_t v33 = sqlite3_step(v11);
            int v34 = v33;
            MSSqliteTrapForDBLockError(v33);
            if (v34 == 101)
            {
              id v35 = [(MSASServerSideModel *)self commandQueue];
              uint64_t v36 = v35;
              if (v9)
              {
                v42[0] = MEMORY[0x1E4F143A8];
                v42[1] = 3221225472;
                v42[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke;
                v42[3] = &unk_1E6C3D998;
                v42[4] = self;
                id v37 = &v43;
                id v43 = v6;
                uint64_t v38 = &v44;
                id v44 = v7;
                [v36 flushQueueCompletionBlock:v42];
              }
              else
              {
                [v35 MSASModel:self didFindNewInvitation:v6 info:v7];

                uint64_t v36 = [(MSASServerSideModel *)self eventQueue];
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_4;
                block[3] = &unk_1E6C3D998;
                void block[4] = self;
                id v37 = &v40;
                id v40 = v6;
                uint64_t v38 = &v41;
                id v41 = v7;
                dispatch_async(v36, block);
              }
            }
          }
        }
      }
    }
  }
  if (v11) {
    sqlite3_reset(v11);
  }
}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_5;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewInvitation:a1[5] info:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewInvitation:a1[5]];
  }
}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_3;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __49__MSASServerSideModel_dbQueueSetInvitation_info___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindInvitationChange:a1[5] info:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindInvitationChange:a1[5]];
  }
}

- (BOOL)dbQueueInvitationWithAlbumGUID:(id)a3 outObject:(id *)a4 outInvitationGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = [(MSASModelBase *)self statementForString:@"select obj, GUID, email, userInfo from Invitations where albumGUID = ?;"];
  id v14 = v12;
  uint64_t v15 = (const char *)[v14 UTF8String];

  uint64_t v16 = sqlite3_bind_text(v13, 1, v15, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v14) = v16;
  MSSqliteTrapForDBLockError(v16);
  if (v14 || (int v19 = sqlite3_step(v13), v19 == 101))
  {
LABEL_2:
    BOOL v17 = 0;
    if (!v13) {
      return v17;
    }
LABEL_3:
    sqlite3_reset(v13);
    return v17;
  }
  if (v19 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2588);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v13, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v13, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDataFromStatementColumn(v13, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v17 = 1;
  if (v13) {
    goto LABEL_3;
  }
  return v17;
}

- (BOOL)dbQueueInvitationWithGUID:(id)a3 outObject:(id *)a4 outAlbumGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7
{
  id v12 = a3;
  uint64_t v13 = [(MSASModelBase *)self statementForString:@"select obj, albumGUID, email, userInfo from Invitations where GUID = ?;"];
  id v14 = v12;
  uint64_t v15 = (const char *)[v14 UTF8String];

  uint64_t v16 = sqlite3_bind_text(v13, 1, v15, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v14) = v16;
  MSSqliteTrapForDBLockError(v16);
  if (v14 || (int v19 = sqlite3_step(v13), v19 == 101))
  {
LABEL_2:
    BOOL v17 = 0;
    if (!v13) {
      return v17;
    }
LABEL_3:
    sqlite3_reset(v13);
    return v17;
  }
  if (v19 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2564);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v13, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v13, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDataFromStatementColumn(v13, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v17 = 1;
  if (v13) {
    goto LABEL_3;
  }
  return v17;
}

- (void)dbQueueDeleteAccessControlWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v24 = 0;
  id v25 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueAccessControlWithGUID:v6 outObject:&v25 outAlbumGUID:&v24 outEmail:0 outUserInfoData:0];
  id v9 = v25;
  id v10 = v24;
  if (v8)
  {
    uint64_t v11 = [(MSASModelBase *)self statementForString:@"delete from AccessControls where GUID = ?;"];
    uint64_t v12 = MSSqliteBindStringOrNull(v11, 1, v6);
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v11);
      int v15 = v14;
      MSSqliteTrapForDBLockError(v14);
      if (v15 == 101)
      {
        uint64_t v16 = [(MSASServerSideModel *)self dbQueueLookupOrCreateAlbumWithGUID:v10];
        BOOL v17 = [(MSASServerSideModel *)self commandQueue];
        [v17 MSASModel:self didFindDeletedAccessControl:v9 inAlbum:v16 info:v7];

        id v18 = [(MSASServerSideModel *)self eventQueue];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke;
        v20[3] = &unk_1E6C3D9C0;
        v20[4] = self;
        id v21 = v9;
        id v22 = v16;
        id v23 = v7;
        id v19 = v16;
        dispatch_async(v18, v20);
      }
    }
    if (v11) {
      sqlite3_reset(v11);
    }
  }
}

void __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __63__MSASServerSideModel_dbQueueDeleteAccessControlWithGUID_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedAccessControl:a1[5] inAlbum:a1[6] info:a1[7]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedAccessControl:a1[5] inAlbum:a1[6]];
  }
}

- (void)dbQueueSetAccessControl:(id)a3 info:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 albumGUID];
  id v65 = 0;
  BOOL v9 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v8 outObject:&v65 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v10 = v65;

  if (v9)
  {
    uint64_t v11 = [v6 GUID];
    id v63 = 0;
    id v64 = 0;
    BOOL v12 = [(MSASServerSideModel *)self dbQueueAccessControlWithGUID:v11 outObject:&v64 outAlbumGUID:0 outEmail:0 outUserInfoData:&v63];
    id v13 = v64;
    id v14 = v63;

    if (v12 && [v13 isEqualToSharingRelationship:v6])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v67 = self;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Not updating access control with an equivalent object.", buf, 0xCu);
      }
    }
    else
    {
      int v15 = [(MSASModelBase *)self statementForString:@"insert or replace into AccessControls (GUID, email, albumGUID, obj, userInfo) values (?, ?, ?, ?, ?);"];
      uint64_t v16 = [v6 GUID];
      uint64_t v17 = MSSqliteBindStringOrNull(v15, 1, v16);
      int v18 = v17;
      MSSqliteTrapForDBLockError(v17);

      if (!v18)
      {
        id v19 = [v6 email];
        uint64_t v20 = MSSqliteBindStringOrNull(v15, 2, v19);
        int v21 = v20;
        MSSqliteTrapForDBLockError(v20);

        if (!v21)
        {
          id v22 = [v6 albumGUID];
          uint64_t v23 = MSSqliteBindStringOrNull(v15, 3, v22);
          int v24 = v23;
          MSSqliteTrapForDBLockError(v23);

          if (!v24)
          {
            id v62 = 0;
            uint64_t v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v62];
            id v26 = v62;
            BOOL v52 = v26;
            id v53 = (void *)v25;
            if (v25)
            {
              int v27 = v15;
              id v28 = (void *)v25;
            }
            else
            {
              id v50 = NSString;
              id v29 = v26;
              int v30 = [v26 userInfo];
              uint64_t v31 = [v50 stringWithFormat:@"Failed to archive an accessControl object. Error: %@ Info: %@", v29, v30];

              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v67 = v31;
                _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
              }

              int v27 = v15;
              id v28 = 0;
            }
            uint64_t v32 = MSSqliteBindDataOrNull(v27, 4, v28);
            int v33 = v32;
            MSSqliteTrapForDBLockError(v32);
            if (!v33)
            {
              uint64_t v34 = MSSqliteBindDataOrNull(v15, 5, v14);
              int v35 = v34;
              MSSqliteTrapForDBLockError(v34);
              if (!v35)
              {
                uint64_t v36 = sqlite3_step(v15);
                int v37 = v36;
                MSSqliteTrapForDBLockError(v36);
                if (v37 == 101)
                {
                  uint64_t v38 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:v7];
                  if (v12)
                  {
                    if ([v13 state] != 1 || objc_msgSend(v6, "state") != 2)
                    {
                      int v39 = [NSNumber numberWithBool:1];
                      [v38 setObject:v39 forKey:@"notInteresting"];
                    }
                    id v40 = [(MSASServerSideModel *)self commandQueue];
                    id v41 = v38;
                    v58[0] = MEMORY[0x1E4F143A8];
                    v58[1] = 3221225472;
                    v58[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke;
                    v58[3] = &unk_1E6C3D9C0;
                    v58[4] = self;
                    int v51 = &v59;
                    id v59 = v6;
                    long long v42 = &v60;
                    id v43 = &v61;
                    id v60 = v10;
                    id v61 = v41;
                    id v44 = v41;
                    [v40 flushQueueCompletionBlock:v58];
                  }
                  else
                  {
                    id v45 = [NSNumber numberWithBool:1];
                    [v38 setObject:v45 forKey:@"notInteresting"];

                    id v46 = [(MSASServerSideModel *)self commandQueue];
                    [v46 MSASModel:self didFindNewAccessControl:v6 inAlbum:v10 info:v38];

                    id v40 = [(MSASServerSideModel *)self eventQueue];
                    id v41 = v38;
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_4;
                    block[3] = &unk_1E6C3D9C0;
                    void block[4] = self;
                    int v51 = &v55;
                    id v55 = v6;
                    long long v42 = &v56;
                    id v43 = &v57;
                    id v56 = v10;
                    id v57 = v41;
                    id v47 = v41;
                    dispatch_async(v40, block);
                  }
                }
              }
            }
          }
        }
      }
      if (v15) {
        sqlite3_reset(v15);
      }
      BOOL v48 = +[MSASPersonInfoManager sharedManager];
      uint64_t v49 = v48;
      if (v48) {
        [v48 updateWithSharingRelationship:v6];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v67 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Rejecting access control destined for non-existent album.", buf, 0xCu);
  }
}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_2;
  v4[3] = &unk_1E6C3D9C0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);
}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_5;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewAccessControl:a1[5] inAlbum:a1[6] info:a1[7]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewAccessControl:a1[5] inAlbum:a1[6]];
  }
}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_3;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __52__MSASServerSideModel_dbQueueSetAccessControl_info___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindAccessControlChange:a1[5] inAlbum:a1[6] info:a1[7]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindAccessControlChange:a1[5] inAlbum:a1[6]];
  }
}

- (BOOL)dbQueueAccessControlWithGUID:(id)a3 outObject:(id *)a4 outAlbumGUID:(id *)a5 outEmail:(id *)a6 outUserInfoData:(id *)a7
{
  id v12 = a3;
  id v13 = [(MSASModelBase *)self statementForString:@"select obj, email, albumGUID, userInfo from AccessControls where GUID = ?;"];
  uint64_t v14 = MSSqliteBindStringOrNull(v13, 1, v12);

  MSSqliteTrapForDBLockError(v14);
  if (v14 || (int v17 = sqlite3_step(v13), v17 == 101))
  {
LABEL_2:
    BOOL v15 = 0;
    if (!v13) {
      return v15;
    }
LABEL_3:
    sqlite3_reset(v13);
    return v15;
  }
  if (v17 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2431);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v13, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v13, 1);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v13, 2);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteDataFromStatementColumn(v13, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v15 = 1;
  if (v13) {
    goto LABEL_3;
  }
  return v15;
}

- (void)dbQueueDeleteAlbumWithGUID:(id)a3 info:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v53 = 0;
  BOOL v8 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v6 outObject:&v53 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v9 = v53;
  id v10 = v9;
  if (v8)
  {
    id v40 = v9;
    id v41 = v7;
    uint64_t v11 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:v7];
    id v12 = [v11 MSASAddEventIsDueToAlbumDeletionAlbumGUID:v6];

    id v13 = [(MSASServerSideModel *)self dbQueueAccessControlGUIDsForAlbumWithGUID:v6];
    [(MSASModelBase *)self dbQueueBeginTransaction];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v20 = (void *)MEMORY[0x1E019E3B0]();
          [(MSASServerSideModel *)self dbQueueDeleteAccessControlWithGUID:v19 info:v12];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v16);
    }

    [(MSASModelBase *)self dbQueueEndTransaction];
    int v21 = [(MSASServerSideModel *)self dbQueueInvitationForAlbumWithGUID:v6];
    id v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 GUID];
      [(MSASServerSideModel *)self dbQueueDeleteInvitationWithGUID:v23 info:v12];
    }
    int v39 = v22;
    int v24 = [(MSASServerSideModel *)self dbQueueAssetCollectionGUIDsInAlbumWithGUID:v6];
    [(MSASModelBase *)self dbQueueBeginTransaction];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v46 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v31 = (void *)MEMORY[0x1E019E3B0]();
          [(MSASServerSideModel *)self dbQueueDeleteAssetCollectionWithGUID:v30 info:v12];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v27);
    }

    [(MSASModelBase *)self dbQueueEndTransaction];
    [(MSASServerSideModel *)self dbQueueDeleteAllAlbumMetadataForAlbumWithGUID:v6 info:v12];
    uint64_t v32 = [(MSASModelBase *)self statementForString:@"delete from Albums where GUID = ?;"];
    uint64_t v33 = MSSqliteBindStringOrNull(v32, 1, v6);
    int v34 = v33;
    MSSqliteTrapForDBLockError(v33);
    id v10 = v40;
    id v7 = v41;
    if (!v34)
    {
      uint64_t v35 = sqlite3_step(v32);
      int v36 = v35;
      MSSqliteTrapForDBLockError(v35);
      if (v36 == 101)
      {
        int v37 = [(MSASServerSideModel *)self commandQueue];
        [v37 MSASModel:self didFindDeletedAlbum:v40 info:v41];

        uint64_t v38 = [(MSASServerSideModel *)self eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke;
        block[3] = &unk_1E6C3D998;
        void block[4] = self;
        id v43 = v40;
        id v44 = v12;
        dispatch_async(v38, block);
      }
    }
    if (v32) {
      sqlite3_reset(v32);
    }
  }
}

void __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke_2;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __55__MSASServerSideModel_dbQueueDeleteAlbumWithGUID_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedAlbum:a1[5] info:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindDeletedAlbum:a1[5]];
  }
}

- (void)dbQueueUpdateAlbumCtag:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 GUID];
  id v28 = 0;
  BOOL v6 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v5 outObject:0 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:&v28 outClientOrgKey:0];
  id v7 = v28;

  if (v6)
  {
    BOOL v8 = [(MSASModelBase *)self statementForString:@"update or ignore Albums set obj = ?, ctag = ? , foreignCtag = ? where GUID = ?;"];
    id v27 = 0;
    id v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v27];
    id v10 = v27;
    uint64_t v11 = v10;
    if (v9)
    {
      uint64_t v12 = MSSqliteBindDataOrNull(v8, 1, v9);
    }
    else
    {
      id v13 = NSString;
      id v14 = [v10 userInfo];
      uint64_t v15 = [v13 stringWithFormat:@"Failed to archive an album object. Error: %@ Info: %@", v11, v14];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v30 = v15;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }

      uint64_t v12 = sqlite3_bind_null(v8, 1);
    }
    int v16 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v16)
    {
      uint64_t v17 = [v4 ctag];
      uint64_t v18 = MSSqliteBindStringOrNull(v8, 2, v17);
      int v19 = v18;
      MSSqliteTrapForDBLockError(v18);

      if (!v19)
      {
        uint64_t v20 = [v4 foreignCtag];
        uint64_t v21 = MSSqliteBindStringOrNull(v8, 3, v20);
        int v22 = v21;
        MSSqliteTrapForDBLockError(v21);

        if (!v22)
        {
          uint64_t v23 = [v4 GUID];
          uint64_t v24 = MSSqliteBindStringOrNull(v8, 4, v23);
          int v25 = v24;
          MSSqliteTrapForDBLockError(v24);

          if (!v25)
          {
            uint64_t v26 = sqlite3_step(v8);
            MSSqliteTrapForDBLockError(v26);
          }
        }
      }
    }

    if (v8) {
      sqlite3_reset(v8);
    }
  }
}

- (void)dbQueueSetAlbum:(id)a3 info:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 GUID];
  id v55 = 0;
  BOOL v9 = [(MSASServerSideModel *)self dbQueueAlbumWithGUID:v8 outObject:0 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:&v55 outClientOrgKey:0];
  id v10 = v55;

  uint64_t v11 = [v6 metadata];
  uint64_t v12 = [v11 objectForKey:@"name"];

  if (!v9 && [v6 relationshipState] == 1)
  {
    id v13 = [(MSASServerSideModel *)self daemon];
    [v13 updateOwnerReputationScoreForAlbum:v6];
  }
  id v14 = [(MSASModelBase *)self statementForString:@"insert or replace into Albums (GUID, name, ctag, foreignCtag, obj, url, userInfo, clientOrgKey) values (?, ?, ?, ?, ?, ?, ?, ?);"];
  uint64_t v15 = [v6 GUID];
  uint64_t v16 = MSSqliteBindStringOrNull(v14, 1, v15);
  int v17 = v16;
  MSSqliteTrapForDBLockError(v16);

  if (!v17)
  {
    uint64_t v18 = MSSqliteBindStringOrNull(v14, 2, v12);
    int v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    if (!v19)
    {
      uint64_t v20 = [v6 ctag];
      uint64_t v21 = MSSqliteBindStringOrNull(v14, 3, v20);
      int v22 = v21;
      MSSqliteTrapForDBLockError(v21);

      if (!v22)
      {
        uint64_t v23 = [v6 foreignCtag];
        uint64_t v24 = MSSqliteBindStringOrNull(v14, 4, v23);
        int v25 = v24;
        MSSqliteTrapForDBLockError(v24);

        if (!v25)
        {
          id v54 = 0;
          uint64_t v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v54];
          id v27 = v54;
          long long v47 = v27;
          if (v26)
          {
            uint64_t v28 = MSSqliteBindDataOrNull(v14, 5, v26);
          }
          else
          {
            id v29 = NSString;
            id v30 = v27;
            uint64_t v31 = [v27 userInfo];
            uint64_t v32 = [v29 stringWithFormat:@"Failed to archive an album object. Error: %@ Info: %@", v30, v31];

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v57 = v32;
              _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }

            uint64_t v28 = MSSqliteBindDataOrNull(v14, 5, 0);
            uint64_t v26 = 0;
          }
          MSSqliteTrapForDBLockError(v28);
          if (!v28)
          {
            uint64_t v33 = [v6 URLString];
            uint64_t v34 = MSSqliteBindStringOrNull(v14, 6, v33);
            int v35 = v34;
            MSSqliteTrapForDBLockError(v34);

            if (!v35)
            {
              uint64_t v36 = MSSqliteBindDataOrNull(v14, 7, v10);
              int v37 = v36;
              MSSqliteTrapForDBLockError(v36);
              if (!v37)
              {
                uint64_t v38 = [v6 clientOrgKey];
                uint64_t v39 = MSSqliteBindStringOrNull(v14, 8, v38);
                int v40 = v39;
                MSSqliteTrapForDBLockError(v39);

                if (!v40)
                {
                  uint64_t v41 = sqlite3_step(v14);
                  int v42 = v41;
                  MSSqliteTrapForDBLockError(v41);
                  if (v42 == 101)
                  {
                    id v43 = [(MSASServerSideModel *)self commandQueue];
                    id v44 = v43;
                    if (v9)
                    {
                      v51[0] = MEMORY[0x1E4F143A8];
                      v51[1] = 3221225472;
                      v51[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke;
                      v51[3] = &unk_1E6C3D998;
                      v51[4] = self;
                      long long v45 = &v52;
                      id v52 = v6;
                      long long v46 = &v53;
                      id v53 = v7;
                      [v44 flushQueueCompletionBlock:v51];
                    }
                    else
                    {
                      [v43 MSASModel:self didFindNewAlbum:v6 info:v7];

                      id v44 = [(MSASServerSideModel *)self eventQueue];
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3221225472;
                      block[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_4;
                      block[3] = &unk_1E6C3D998;
                      void block[4] = self;
                      long long v45 = &v49;
                      id v49 = v6;
                      long long v46 = &v50;
                      id v50 = v7;
                      dispatch_async(v44, block);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  if (v14) {
    sqlite3_reset(v14);
  }
}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_2;
  block[3] = &unk_1E6C3D998;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_5;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_5(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewAlbum:a1[5] info:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindNewAlbum:a1[5]];
  }
}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_3;
  v3[3] = &unk_1E6C3D908;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __44__MSASServerSideModel_dbQueueSetAlbum_info___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindAlbumMetadataChange:a1[5] info:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFindAlbumMetadataChange:a1[5]];
  }
}

- (BOOL)dbQueueAlbumWithGUID:(id)a3 outObject:(id *)a4 outName:(id *)a5 outCtag:(id *)a6 outForeignCtag:(id *)a7 outURLString:(id *)a8 outUserInfoData:(id *)a9 outClientOrgKey:(id *)a10
{
  id v16 = a3;
  int v17 = [(MSASModelBase *)self statementForString:@"select obj, name, ctag, foreignCtag, url, userInfo, clientOrgKey from Albums where GUID = ?;"];
  uint64_t v18 = MSSqliteBindStringOrNull(v17, 1, v16);

  MSSqliteTrapForDBLockError(v18);
  if (v18 || (int v21 = sqlite3_step(v17), v21 == 101))
  {
LABEL_2:
    BOOL v19 = 0;
    if (!v17) {
      return v19;
    }
LABEL_3:
    sqlite3_reset(v17);
    return v19;
  }
  if (v21 != 100)
  {
    MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, 2270);
    goto LABEL_2;
  }
  if (a4)
  {
    MSSqliteObjectFromStatementColumn(v17, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5)
  {
    MSSqliteStringFromStatementColumn(v17, 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    MSSqliteStringFromStatementColumn(v17, 2);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a7)
  {
    MSSqliteStringFromStatementColumn(v17, 3);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a8)
  {
    MSSqliteStringFromStatementColumn(v17, 4);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a9)
  {
    MSSqliteDataFromStatementColumn(v17, 5);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a10)
  {
    MSSqliteStringFromStatementColumn(v17, 6);
    *a10 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v19 = 1;
  if (v17) {
    goto LABEL_3;
  }
  return v19;
}

- (id)focusAssetCollectionGUID
{
  id v2 = [(MSASServerSideModel *)self stateMachine];
  id v3 = [v2 focusAssetCollectionGUID];

  return v3;
}

- (void)setFocusAssetCollectionGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASServerSideModel *)self stateMachine];
  [v5 setFocusAssetCollectionGUID:v4];
}

- (void)setFocusAlbumGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASServerSideModel *)self stateMachine];
  [v5 setFocusAlbumGUID:v4];
}

- (id)serverSideConfiguration
{
  id v2 = [(MSASServerSideModel *)self stateMachine];
  id v3 = [v2 serverSideConfiguration];

  return v3;
}

- (void)retrieveAssetsFromAssetCollectionsWithGUIDs:(id)a3 assetTypeFlags:(int)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke;
    block[3] = &unk_1E6C3D280;
    id v9 = v6;
    id v10 = self;
    int v11 = a4;
    dispatch_async(v7, block);
  }
}

void __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_38;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v41;
  uint64_t v22 = *(void *)v41;
  do
  {
    uint64_t v7 = 0;
    uint64_t v23 = v4;
    do
    {
      if (*(void *)v41 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v40 + 1) + 8 * v7);
      context = (void *)MEMORY[0x1E019E3B0]();
      id v9 = *(void **)(a1 + 40);
      id v38 = 0;
      id v39 = 0;
      int v10 = [v9 dbQueueAssetCollectionWithGUID:v8 outObject:&v39 outCtag:0 outAlbumGUID:&v38 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
      id v29 = v39;
      id v28 = v38;
      if (!v10)
      {
        int v21 = [*(id *)(a1 + 40) eventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_4;
        block[3] = &unk_1E6C3D280;
        void block[4] = *(void *)(a1 + 40);
        void block[5] = v8;
        int v31 = *(_DWORD *)(a1 + 48);
        dispatch_async(v21, block);
        goto LABEL_33;
      }
      if (v5 && ([v28 isEqualToString:v5] & 1) == 0 && objc_msgSend(v2, "count"))
      {
        [*(id *)(a1 + 40) retrieveAssets:v2 inAlbumWithGUID:v5];
        [v2 removeAllObjects];
      }
      uint64_t v26 = v7;
      id v25 = v28;

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      int v11 = [v29 assets];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (!v12)
      {

        goto LABEL_32;
      }
      uint64_t v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v11);
          }
          int v17 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v18 = [v17 mediaAssetType];
          uint64_t v19 = v18;
          int v20 = *(_DWORD *)(a1 + 48);
          if (((v20 & 1) == 0 || v18 != 2) && ((v20 & 2) == 0 || v18 != 3))
          {
            if ((v20 & 2) != 0 && [v29 isPhotoIris] && v19 == 7) {
              goto LABEL_25;
            }
            if (v19 != 5) {
              continue;
            }
          }
          char v14 = 1;
LABEL_25:
          [v2 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v44 count:16];
      }
      while (v13);

      uint64_t v6 = v22;
      uint64_t v4 = v23;
      if (v14)
      {
        id v5 = v25;
        uint64_t v7 = v26;
        goto LABEL_34;
      }
LABEL_32:
      int v21 = [*(id *)(a1 + 40) eventQueue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_2;
      v32[3] = &unk_1E6C3D280;
      v32[4] = *(void *)(a1 + 40);
      v32[5] = v8;
      int v33 = *(_DWORD *)(a1 + 48);
      dispatch_async(v21, v32);
      id v5 = v25;
      uint64_t v7 = v26;
LABEL_33:

LABEL_34:
      ++v7;
    }
    while (v7 != v4);
    uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  }
  while (v4);
LABEL_38:

  if (v2) {
    [*(id *)(a1 + 40) retrieveAssets:v2 inAlbumWithGUID:v5];
  }
}

uint64_t __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_3;
  v2[3] = &unk_1E6C3D2A8;
  long long v3 = *(_OWORD *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 48);
  return [(id)v3 eventQueuePerformBlockOnObservers:v2];
}

uint64_t __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_5;
  v2[3] = &unk_1E6C3D2A8;
  long long v3 = *(_OWORD *)(a1 + 32);
  int v4 = *(_DWORD *)(a1 + 48);
  return [(id)v3 eventQueuePerformBlockOnObservers:v2];
}

void __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didFailToFindAssetsForAssetCollectionGUID:*(void *)(a1 + 40) assetTypeFlags:*(unsigned int *)(a1 + 48)];
  }
}

void __82__MSASServerSideModel_retrieveAssetsFromAssetCollectionsWithGUIDs_assetTypeFlags___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:*(void *)(a1 + 32) didFailToFindAssetsForAssetCollectionGUID:*(void *)(a1 + 40) assetTypeFlags:*(unsigned int *)(a1 + 48)];
  }
}

- (void)retrieveAssets:(id)a3 inAlbumWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v7 && v8)
  {
    id v9 = (void *)[v6 copy];
    int v10 = (void *)[v7 copy];
    int v11 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MSASServerSideModel_retrieveAssets_inAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v15 = v9;
    id v16 = self;
    id v17 = v10;
    id v12 = v10;
    id v13 = v9;
    dispatch_async(v11, block);
  }
}

void __54__MSASServerSideModel_retrieveAssets_inAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v20 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1E019E3B0]();
        id v8 = [v6 batchCreationDate];
        if (v8)
        {
          uint64_t v9 = [v6 photoCreationDate];
          if (v9)
          {
            id v10 = (id)v9;
            uint64_t v1 = (void *)v9;
LABEL_15:

            goto LABEL_16;
          }
          uint64_t v1 = 0;
        }
        int v11 = [v6 assetCollectionGUID];

        if (v8)
        {
        }
        if (v11)
        {
          id v12 = *(void **)(a1 + 40);
          id v13 = [v6 assetCollectionGUID];
          id v18 = 0;
          id v19 = 0;
          int v14 = [v12 dbQueueAssetCollectionWithGUID:v13 outObject:0 outCtag:0 outAlbumGUID:0 outBatchDate:&v19 outPhotoDate:&v18 outPhotoNumber:0 outUserInfoData:0];
          id v8 = v19;
          id v10 = v18;

          if (v14)
          {
            [v6 setBatchCreationDate:v8];
            [v6 setPhotoCreationDate:v10];
          }
          goto LABEL_15;
        }
LABEL_16:
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }

  id v15 = [*(id *)(a1 + 40) stateMachine];
  [v15 retrieveAssets:*(void *)(a1 + 32) inAlbumWithGUID:*(void *)(a1 + 48)];
}

- (void)forgetEverythingInfo:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke;
  block[3] = &unk_1E6C3D198;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke_2;
  int v11 = &unk_1E6C3D258;
  id v12 = v4;
  id v5 = v3;
  id v13 = v5;
  [v4 eventQueuePerformBlockOnObservers:&v8];
  id v6 = objc_msgSend(*(id *)(a1 + 40), "observers", v8, v9, v10, v11, v12);
  [v6 removeAllObjects];

  if (*(void *)(a1 + 48))
  {
    id v7 = [*(id *)(a1 + 40) eventQueue];
    dispatch_async(v7, *(dispatch_block_t *)(a1 + 48));
  }
}

void __60__MSASServerSideModel_forgetEverythingInfo_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModelWillBeForgotten:*(void *)(a1 + 32) info:*(void *)(a1 + 40)];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModelWillBeForgotten:*(void *)(a1 + 32)];
  }
}

- (void)forgetEverythingInfo:(id)a3
{
}

- (void)forgetEverything
{
}

- (void)deleteCommentWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    int v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v21 = 0;
  id v20 = 0;
  id v6 = [v4 dbQueueLookupOrCreateCommentWithGUID:v5 outAssetCollection:&v21 outAlbum:&v20];
  id v7 = v21;
  id v8 = v20;
  uint64_t v9 = *(void **)(a1 + 40);
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v8 == 0)
  {
    id v12 = [v9 eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3D9E8;
    void block[4] = *(void *)(a1 + 40);
    id v16 = v6;
    id v17 = v7;
    id v18 = v8;
    id v19 = *(id *)(a1 + 32);
    dispatch_async(v12, block);
  }
  else
  {
    id v13 = [v9 stateMachine];
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
    [v13 deleteComments:v14 inAssetCollection:v7 inAlbum:v8 info:v3];
  }
  [*(id *)(a1 + 40) dbQueueDeleteCommentWithGUID:*(void *)(a1 + 48) info:v3];
}

void __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_3;
  v3[3] = &unk_1E6C3D970;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __50__MSASServerSideModel_deleteCommentWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v18 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_COMMENT");
    BOOL v10 = [v8 MSErrorWithDomain:@"MSASModelErrorDomain" code:4 description:v9];
    [v18 MSASModel:v3 didFinishDeletingComment:v4 fromAssetCollection:v5 inAlbum:v6 info:v7 error:v10];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    uint64_t v14 = a1[6];
    uint64_t v13 = a1[7];
    id v15 = (void *)MEMORY[0x1E4F28C58];
    id v16 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_COMMENT");
    id v17 = [v15 MSErrorWithDomain:@"MSASModelErrorDomain" code:4 description:v16];
    [v18 MSASModel:v11 didFinishDeletingComment:v12 fromAssetCollection:v14 inAlbum:v13 error:v17];
  }
}

- (void)deleteCommentWithGUID:(id)a3
{
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  if (v9 && v11)
  {
    uint64_t v12 = [(MSASModelBase *)self dbQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke;
    v13[3] = &unk_1E6C3D9C0;
    id v14 = v10;
    id v15 = self;
    id v16 = v9;
    id v17 = v8;
    dispatch_async(v12, v13);
  }
}

void __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v30 = 0;
  uint64_t v6 = [v4 dbQueueLookupOrCreateAssetCollectionWithGUID:v5 outAlbum:&v30];
  id v7 = v30;
  id v8 = *(void **)(a1 + 40);
  if (v7)
  {
    [v8 dbQueueBeginTransaction];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * v13);
          id v15 = (void *)MEMORY[0x1E019E3B0]();
          [*(id *)(a1 + 40) dbQueueSetComment:v14 forAssetCollectionWithGUID:*(void *)(a1 + 48) info:v3];
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v11);
    }

    [*(id *)(a1 + 40) dbQueueEndTransaction];
    id v16 = [*(id *)(a1 + 40) stateMachine];
    [v16 addComments:*(void *)(a1 + 56) toAssetCollection:v6 inAlbum:v7 info:v3];
  }
  else
  {
    id v17 = [v8 eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3D9E8;
    id v18 = *(id *)(a1 + 56);
    uint64_t v19 = *(void *)(a1 + 40);
    id v21 = v18;
    uint64_t v22 = v19;
    id v23 = v6;
    id v24 = 0;
    id v25 = v3;
    dispatch_async(v17, block);

    id v16 = v21;
  }
}

void __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v15 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x1E019E3B0]();
        id v9 = *(void **)(a1 + 40);
        id v8 = *(void **)(a1 + 48);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_3;
        v11[3] = &unk_1E6C3D970;
        v11[4] = v9;
        void v11[5] = v6;
        id v12 = v8;
        id v13 = *(id *)(a1 + 56);
        id v14 = *(id *)(a1 + 64);
        [v9 eventQueuePerformBlockOnObservers:v11];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

void __66__MSASServerSideModel_addComments_toAssetCollectionWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v18 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_ALBUM");
    uint64_t v10 = [v8 MSErrorWithDomain:@"MSASModelErrorDomain" code:3 description:v9];
    [v18 MSASModel:v3 didFinishAddingComment:v4 toAssetCollection:v5 inAlbum:v6 info:v7 error:v10];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    uint64_t v14 = a1[6];
    uint64_t v13 = a1[7];
    long long v15 = (void *)MEMORY[0x1E4F28C58];
    long long v16 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_ALBUM");
    long long v17 = [v15 MSErrorWithDomain:@"MSASModelErrorDomain" code:3 description:v16];
    [v18 MSASModel:v11 didFinishAddingComment:v12 toAssetCollection:v14 inAlbum:v13 error:v17];
  }
}

- (void)addComments:(id)a3 toAssetCollectionWithGUID:(id)a4
{
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [(MSASModelBase *)self dbQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke;
    v12[3] = &unk_1E6C3D9C0;
    id v13 = v10;
    uint64_t v14 = self;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v11, v12);
  }
}

void __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v28 = 0;
  id v27 = 0;
  int v7 = [v5 dbQueueAssetCollectionWithGUID:v6 outObject:&v28 outCtag:0 outAlbumGUID:&v27 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v8 = v28;
  id v9 = v27;
  id v10 = 0;
  if (v7)
  {
    uint64_t v11 = *(void **)(a1 + 40);
    id v26 = 0;
    int v12 = [v11 dbQueueAlbumWithGUID:v9 outObject:&v26 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v10 = v26;
    id v13 = *(void **)(a1 + 40);
    if (v12)
    {
      uint64_t v14 = [v13 dbQueueMaximumCommentIDForAssetCollectionWithGUID:*(void *)(a1 + 48)];
      if (v14) {
        id v15 = (void *)v14;
      }
      else {
        id v15 = &unk_1F367DA38;
      }
      id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v15, "intValue"));
      [*(id *)(a1 + 40) dbQueueSetAssetCollectionMetadataAssetCollectionGUID:*(void *)(a1 + 48) key:@"lastcommentposition" value:v16 info:v3];
      [v4 setObject:v16 forKey:@"lastcommentposition"];
      long long v17 = NSString;
      [*(id *)(a1 + 56) timeIntervalSinceReferenceDate];
      uint64_t v19 = objc_msgSend(v17, "stringWithFormat:", @"%f", v18);
      [*(id *)(a1 + 40) dbQueueSetAssetCollectionMetadataAssetCollectionGUID:*(void *)(a1 + 48) key:@"lastcommenttimestamp" value:v19 info:v3];
      [v4 setObject:v19 forKey:@"lastcommenttimestamp"];
      uint64_t v20 = [*(id *)(a1 + 40) stateMachine];
      [v20 setAssetCollectionSyncedState:v4 forAssetCollection:v8 album:v10 info:v3];
    }
    else
    {
      id v21 = [v13 eventQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_306;
      block[3] = &unk_1E6C3D9C0;
      void block[4] = *(void *)(a1 + 40);
      id v23 = v8;
      id v10 = v10;
      id v24 = v10;
      id v25 = v3;
      dispatch_async(v21, block);
    }
  }
  [*(id *)(a1 + 40) dbQueueSetUnviewedState:0 onAssetCollectionWithGUID:*(void *)(a1 + 48) info:v3];
}

void __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_306(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_2;
  v3[3] = &unk_1E6C3D938;
  v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __94__MSASServerSideModel_markCommentsForAssetCollectionWithGUID_asViewedWithLastViewedDate_info___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishMarkingCommentsAsViewedInAssetCollection:a1[5] inAlbum:a1[6] info:a1[7] error:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishMarkingCommentsAsViewedInAssetCollection:a1[5] inAlbum:a1[6] error:0];
  }
}

- (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4
{
}

- (void)deleteAssetCollectionsWithGUIDs:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke;
    v6[3] = &unk_1E6C3DB28;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

void __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v7 = *(void **)(a1 + 40);
        id v36 = 0;
        id v37 = 0;
        int v8 = [v7 dbQueueAssetCollectionWithGUID:v6 outObject:&v37 outCtag:0 outAlbumGUID:&v36 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
        id v9 = v37;
        id v10 = v36;
        if (v8)
        {
          uint64_t v11 = [v2 objectForKey:v10];
          if (!v11)
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
          }
          [v11 addObject:v9];
          [v2 setObject:v11 forKey:v10];
        }
        else
        {
          uint64_t v11 = [*(id *)(a1 + 40) eventQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_2;
          block[3] = &unk_1E6C3DB28;
          void block[4] = *(void *)(a1 + 40);
          void block[5] = v6;
          dispatch_async(v11, block);
        }

        [*(id *)(a1 + 40) dbQueueDeleteAssetCollectionWithGUID:v6 info:0];
        int v12 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:v10];
        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = [v12 GUID];
        LODWORD(v13) = [v13 dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:v14];

        id v15 = [*(id *)(a1 + 40) eventQueue];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_4;
        v32[3] = &unk_1E6C3D280;
        v32[4] = *(void *)(a1 + 40);
        id v33 = v12;
        int v34 = (int)v13;
        id v16 = v12;
        dispatch_async(v15, v32);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v4);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v17 = [v2 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        id v23 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:v22];
        id v24 = [v2 objectForKey:v22];
        id v25 = [*(id *)(a1 + 40) stateMachine];
        [v25 deleteAssetCollections:v24 inAlbum:v23 info:0];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v42 count:16];
    }
    while (v19);
  }
}

uint64_t __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_2(int8x16_t *a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_3;
  v3[3] = &unk_1E6C3D258;
  int8x16_t v1 = a1[2];
  int8x16_t v4 = vextq_s8(v1, v1, 8uLL);
  return [(id)v1.i64[0] eventQueuePerformBlockOnObservers:v3];
}

uint64_t __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 48) info:0];
}

void __55__MSASServerSideModel_deleteAssetCollectionsWithGUIDs___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = objc_alloc_init(MSASAssetCollection);
    [(MSASAssetCollection *)v3 setGUID:*(void *)(a1 + 32)];
    int8x16_t v4 = *(void **)(a1 + 40);
    id v5 = [v4 _invalidAssetCollectionGUIDErrorwithGUID:*(void *)(a1 + 32)];
    [v9 MSASModel:v4 didFinishDeletingAssetCollection:v3 fromAlbum:0 info:0 error:v5];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_alloc_init(MSASAssetCollection);
    [(MSASAssetCollection *)v6 setGUID:*(void *)(a1 + 32)];
    id v7 = *(void **)(a1 + 40);
    int v8 = [v7 _invalidAssetCollectionGUIDErrorwithGUID:*(void *)(a1 + 32)];
    [v9 MSASModel:v7 didFinishDeletingAssetCollection:v6 fromAlbum:0 error:v8];
  }
}

- (void)deleteAssetCollectionWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    uint64_t v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 MSASAddIsLocalChange];

  int8x16_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v27 = 0;
  id v28 = 0;
  int v6 = [v4 dbQueueAssetCollectionWithGUID:v5 outObject:&v28 outCtag:0 outAlbumGUID:&v27 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v7 = v28;
  id v8 = v27;
  id v9 = *(void **)(a1 + 40);
  if (v6)
  {
    id v10 = [v9 dbQueueLookupOrCreateAlbumWithGUID:v8];
    uint64_t v11 = [*(id *)(a1 + 40) stateMachine];
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
    [v11 deleteAssetCollections:v12 inAlbum:v10 info:v3];
  }
  else
  {
    id v13 = [v9 eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3D998;
    uint64_t v14 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v25 = v14;
    id v26 = v3;
    dispatch_async(v13, block);

    id v10 = 0;
  }
  [*(id *)(a1 + 40) dbQueueDeleteAssetCollectionWithGUID:*(void *)(a1 + 48) info:v3];
  id v15 = *(void **)(a1 + 40);
  id v16 = [v10 GUID];
  LODWORD(v15) = [v15 dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:v16];

  long long v17 = [*(id *)(a1 + 40) eventQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_4;
  v20[3] = &unk_1E6C3D0F8;
  uint64_t v18 = *(void **)(a1 + 32);
  v20[4] = *(void *)(a1 + 40);
  id v21 = v10;
  int v23 = (int)v15;
  id v22 = v18;
  id v19 = v10;
  dispatch_async(v17, v20);
}

void __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E6C3D908;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v5];
}

uint64_t __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
}

void __58__MSASServerSideModel_deleteAssetCollectionWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_alloc_init(MSASAssetCollection);
    [(MSASAssetCollection *)v3 setGUID:a1[4]];
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = [v5 _invalidAssetCollectionGUIDErrorwithGUID:a1[4]];
    [v10 MSASModel:v5 didFinishDeletingAssetCollection:v3 fromAlbum:0 info:v4 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = objc_alloc_init(MSASAssetCollection);
    [(MSASAssetCollection *)v7 setGUID:a1[4]];
    id v8 = (void *)a1[5];
    id v9 = [v8 _invalidAssetCollectionGUIDErrorwithGUID:a1[4]];
    [v10 MSASModel:v8 didFinishDeletingAssetCollection:v7 fromAlbum:0 error:v9];
  }
}

- (void)deleteAssetCollectionWithGUID:(id)a3
{
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4 info:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  long long v31 = v9;
  if (v9 && v11)
  {
    id v27 = self;
    id v28 = v10;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v29 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (!v12)
    {
      uint64_t v14 = 0;
      id v15 = 0;
      goto LABEL_20;
    }
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    id v15 = 0;
    uint64_t v16 = *(void *)v38;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x1E019E3B0]();
        uint64_t v20 = [v18 metadata];
        uint64_t v21 = [v20 objectForKey:@"batchGUID"];
        if (!v21
          || (id v22 = (void *)v21,
              [v20 objectForKey:@"batchDateCreated"],
              int v23 = objc_claimAutoreleasedReturnValue(),
              v23,
              v22,
              !v23))
        {
          if (v15)
          {
            if (v14)
            {
LABEL_12:
              id v24 = (void *)[v20 mutableCopy];
              [v24 setObject:v15 forKey:@"batchDateCreated"];
              [v24 setObject:v14 forKey:@"batchGUID"];
              [v18 setMetadata:v24];

              goto LABEL_13;
            }
          }
          else
          {
            id v15 = [MEMORY[0x1E4F1C9C8] date];
            if (v14) {
              goto LABEL_12;
            }
          }
          uint64_t v14 = [NSString MSMakeUUID];
          goto LABEL_12;
        }
LABEL_13:
        [v18 setAlbumGUID:v31];

        ++v17;
      }
      while (v13 != v17);
      uint64_t v25 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      uint64_t v13 = v25;
      if (!v25)
      {
LABEL_20:

        id v26 = [(MSASModelBase *)v27 dbQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__MSASServerSideModel_addAssetCollections_toAlbumWithGUID_info___block_invoke;
        block[3] = &unk_1E6C3D9C0;
        id v10 = v28;
        id v33 = v28;
        int v34 = v27;
        id v35 = v31;
        id v36 = obj;
        dispatch_async(v26, block);

        id v8 = v29;
        break;
      }
    }
  }
}

void __64__MSASServerSideModel_addAssetCollections_toAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) dbQueueBeginTransaction];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v27 + 1) + 8 * v9);
        uint64_t v11 = (void *)MEMORY[0x1E019E3B0]();
        [*(id *)(a1 + 40) dbQueueSetAssetCollection:v10 inAlbumWithGUID:*(void *)(a1 + 48) info:v3];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) dbQueueEndTransaction];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:30];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x1E019E3B0](v14);
        objc_msgSend(v12, "addObject:", v18, (void)v23);
        if ((unint64_t)[v12 count] >= 0x1E)
        {
          uint64_t v20 = [*(id *)(a1 + 40) stateMachine];
          [v20 addAssetCollections:v12 toAlbum:v4 info:v3];

          uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:30];

          uint64_t v12 = (void *)v21;
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      uint64_t v15 = v14;
    }
    while (v14);
  }

  if ([v12 count])
  {
    id v22 = [*(id *)(a1 + 40) stateMachine];
    [v22 addAssetCollections:v12 toAlbum:v4 info:v3];
  }
}

- (void)addAssetCollections:(id)a3 toAlbumWithGUID:(id)a4
{
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:a5];
    id v13 = [v12 MSASAddIsLocalChange];

    uint64_t v14 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke;
    block[3] = &unk_1E6C3D218;
    void block[4] = self;
    BOOL v20 = a3;
    id v17 = v10;
    id v18 = v13;
    id v19 = v11;
    id v15 = v13;
    dispatch_async(v14, block);
  }
}

void __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2;
  v6[3] = &unk_1E6C3D1F0;
  objc_copyWeak(&v9, &location);
  char v10 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  [v3 setMultipleContributorsEnabled:v4 forAlbum:v2 info:v5 completionBlock:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (v6)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    if (*(unsigned char *)(a1 + 56)) {
      CFStringRef v10 = @"ERROR_MODEL_CANNOT_SET_MULTIPLECONTRIBUTORS";
    }
    else {
      CFStringRef v10 = @"ERROR_MODEL_CANNOT_UNSET_MULTIPLECONTRIBUTORS";
    }
    id v11 = (__CFString *)MSCFCopyLocalizedString(v10);
    uint64_t v12 = [v9 MSErrorWithDomain:@"MSASModelErrorDomain" code:7 description:v11 underlyingError:v6];

    id v13 = [v8 eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3;
    block[3] = &unk_1E6C3D198;
    id v14 = *(id *)(a1 + 40);
    id v29 = v12;
    id v30 = v14;
    id v28 = v5;
    id v15 = v12;
    id v16 = v5;
    dispatch_async(v13, block);
  }
  else
  {
    id v17 = [WeakRetained dbQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4;
    v20[3] = &unk_1E6C3D1C8;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    id v18 = *(id *)(a1 + 32);
    char v26 = *(unsigned char *)(a1 + 56);
    id v21 = v18;
    id v22 = v5;
    id v23 = v8;
    id v24 = *(id *)(a1 + 40);
    id v19 = v5;
    dispatch_async(v17, v20);

    objc_destroyWeak(&v25);
  }
}

uint64_t __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = 0;
  int v5 = [WeakRetained dbQueueAlbumWithGUID:v4 outObject:&v13 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v6 = v13;

  if (v5)
  {
    if (*(unsigned char *)(a1 + 72)) {
      id v7 = @"1";
    }
    else {
      id v7 = @"0";
    }
    [v6 setMetadataValue:v7 forKey:@"allowcontributions"];
    id v8 = objc_loadWeakRetained(v2);
    [v8 dbQueueSetAlbum:v6 info:*(void *)(a1 + 40)];
  }
  id v9 = [*(id *)(a1 + 48) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5;
  block[3] = &unk_1E6C3DB00;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  dispatch_async(v9, block);
}

uint64_t __92__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)setMultipleContributorsEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_completionBlock___block_invoke;
  v10[3] = &unk_1E6C3D120;
  id v11 = v8;
  id v9 = v8;
  [(MSASServerSideModel *)self setMultipleContributorsEnabled:v6 forAlbumWithGUID:a4 info:0 completionBlock:v10];
}

uint64_t __87__MSASServerSideModel_setMultipleContributorsEnabled_forAlbumWithGUID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 info:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  if (v10)
  {
    id v12 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:a5];
    id v13 = [v12 MSASAddIsLocalChange];

    id v14 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke;
    block[3] = &unk_1E6C3D218;
    void block[4] = self;
    BOOL v20 = a3;
    id v17 = v10;
    id v18 = v13;
    id v19 = v11;
    id v15 = v13;
    dispatch_async(v14, block);
  }
}

void __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = [*(id *)(a1 + 32) stateMachine];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2;
  v6[3] = &unk_1E6C3D1F0;
  objc_copyWeak(&v9, &location);
  char v10 = *(unsigned char *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 40);
  [v3 setPublicAccessEnabled:v4 forAlbum:v2 info:v5 completionBlock:v6];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = WeakRetained;
  if (v6)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    if (*(unsigned char *)(a1 + 56)) {
      CFStringRef v10 = @"ERROR_MODEL_CANNOT_SET_PUBLIC";
    }
    else {
      CFStringRef v10 = @"ERROR_MODEL_CANNOT_UNSET_PUBLIC";
    }
    id v11 = (__CFString *)MSCFCopyLocalizedString(v10);
    id v12 = [v9 MSErrorWithDomain:@"MSASModelErrorDomain" code:6 description:v11 underlyingError:v6];

    id v13 = [v8 eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3;
    block[3] = &unk_1E6C3D198;
    id v14 = *(id *)(a1 + 40);
    id v29 = v12;
    id v30 = v14;
    id v28 = v5;
    id v15 = v12;
    id v16 = v5;
    dispatch_async(v13, block);
  }
  else
  {
    id v17 = [WeakRetained dbQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4;
    v20[3] = &unk_1E6C3D1C8;
    objc_copyWeak(&v25, (id *)(a1 + 48));
    id v18 = *(id *)(a1 + 32);
    char v26 = *(unsigned char *)(a1 + 56);
    id v21 = v18;
    id v22 = v5;
    id v23 = v8;
    id v24 = *(id *)(a1 + 40);
    id v19 = v5;
    dispatch_async(v17, v20);

    objc_destroyWeak(&v25);
  }
}

uint64_t __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = 0;
  int v5 = [WeakRetained dbQueueAlbumWithGUID:v4 outObject:&v13 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v6 = v13;

  if (v5)
  {
    if (*(unsigned char *)(a1 + 72)) {
      id v7 = @"1";
    }
    else {
      id v7 = @"0";
    }
    [v6 setMetadataValue:v7 forKey:@"ispublic"];
    [v6 setPublicURLString:0];
    id v8 = objc_loadWeakRetained(v2);
    [v8 dbQueueSetAlbum:v6 info:*(void *)(a1 + 40)];
  }
  id v9 = [*(id *)(a1 + 48) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5;
  block[3] = &unk_1E6C3DB00;
  id v12 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  dispatch_async(v9, block);
}

uint64_t __84__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_info_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)setPublicAccessEnabled:(BOOL)a3 forAlbumWithGUID:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_completionBlock___block_invoke;
  v10[3] = &unk_1E6C3D120;
  id v11 = v8;
  id v9 = v8;
  [(MSASServerSideModel *)self setPublicAccessEnabled:v6 forAlbumWithGUID:a4 info:0 completionBlock:v10];
}

uint64_t __79__MSASServerSideModel_setPublicAccessEnabled_forAlbumWithGUID_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAccessControlEntryWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    id v11 = self;
    id v12 = v6;
    dispatch_sync(v8, block);
  }
}

void __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v19 = 0;
  id v20 = 0;
  int v6 = [v4 dbQueueAccessControlWithGUID:v5 outObject:&v20 outAlbumGUID:&v19 outEmail:0 outUserInfoData:0];
  id v7 = v20;
  id v8 = v19;
  id v9 = *(void **)(a1 + 40);
  if (v6)
  {
    id v10 = [v7 albumGUID];
    uint64_t v11 = [v9 dbQueueLookupOrCreateAlbumWithGUID:v10];

    [*(id *)(a1 + 40) dbQueueDeleteAccessControlWithGUID:*(void *)(a1 + 48) info:v3];
    id v12 = [*(id *)(a1 + 40) stateMachine];
    v21[0] = v7;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v12 removeSharingRelationships:v13 fromOwnedAlbum:v11 info:v3];

    id v8 = (id)v11;
  }
  else
  {
    id v14 = [*(id *)(a1 + 40) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3D998;
    id v15 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v17 = v15;
    id v18 = v3;
    dispatch_async(v14, block);
  }
}

void __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E6C3D908;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v5];
}

void __61__MSASServerSideModel_removeAccessControlEntryWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_alloc_init(MSASSharingRelationship);
    [(MSASSharingRelationship *)v3 setGUID:a1[4]];
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = [v5 _invalidAccessControlGUIDErrorwithGUID:a1[4]];
    [v10 MSASModel:v5 didFinishRemovingAccessControlEntry:v3 fromAlbum:0 info:v4 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = objc_alloc_init(MSASSharingRelationship);
    [(MSASSharingRelationship *)v7 setGUID:a1[4]];
    id v8 = (void *)a1[5];
    id v9 = [v8 _invalidAccessControlGUIDErrorwithGUID:a1[4]];
    [v10 MSASModel:v8 didFinishRemovingAccessControlEntry:v7 fromAlbum:0 error:v9];
  }
}

- (void)removeAccessControlEntryWithGUID:(id)a3
{
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    uint64_t v11 = [(MSASModelBase *)self dbQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__MSASServerSideModel_addAccessControlEntries_toAlbumWithGUID_info___block_invoke;
    v12[3] = &unk_1E6C3D9C0;
    id v13 = v10;
    id v14 = self;
    id v15 = v9;
    id v16 = v8;
    dispatch_async(v11, v12);
  }
}

void __68__MSASServerSideModel_addAccessControlEntries_toAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 48)];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v9++) setAlbumGUID:*(void *)(a1 + 48)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 40) dbQueueBeginTransaction];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * v14);
        id v16 = (void *)MEMORY[0x1E019E3B0](v11);
        objc_msgSend(*(id *)(a1 + 40), "dbQueueSetAccessControl:info:", v15, v3, (void)v18);
        ++v14;
      }
      while (v12 != v14);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      uint64_t v12 = v11;
    }
    while (v11);
  }

  [*(id *)(a1 + 40) dbQueueEndTransaction];
  id v17 = [*(id *)(a1 + 40) stateMachine];
  [v17 addSharingRelationships:*(void *)(a1 + 56) toOwnedAlbum:v4 info:v3];
}

- (void)addAccessControlEntries:(id)a3 toAlbumWithGUID:(id)a4
{
}

- (void)MSASStateMachine:(id)a3 didFinishMarkingAsSpamInvitationForToken:(id)a4 info:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MSASModelBase *)self dbQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke;
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

void __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_2;
  v4[3] = &unk_1E6C3D9C0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);
}

void __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_3;
  v3[3] = &unk_1E6C3D938;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __92__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForToken_info_error___block_invoke_3(void *a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v3 _protocolErrorForUnderlyingError:a1[7]];
    [v7 MSASModel:v3 didFinishMarkingAsSpamInvitationWithToken:v4 info:v5 error:v6];
  }
}

- (void)markAsSpamInvitationWithToken:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MSASServerSideModel.m", 1644, @"Invalid parameter not satisfying: %@", @"invitationToken" object file lineNumber description];
  }
  id v9 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MSASServerSideModel_markAsSpamInvitationWithToken_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v14 = v8;
  id v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __58__MSASServerSideModel_markAsSpamInvitationWithToken_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v4 = [v2 MSASAddIsLocalChange];

  id v3 = [*(id *)(a1 + 40) stateMachine];
  [v3 markAsSpamInvitationForToken:*(void *)(a1 + 48) info:v4];
}

- (void)MSASStateMachine:(id)a3 didFinishMarkingAsSpamInvitationForAlbum:(id)a4 invitationGUID:(id)a5 info:(id)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [(MSASModelBase *)self dbQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke;
  v17[3] = &unk_1E6C3D9C0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

void __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_2;
  v4[3] = &unk_1E6C3D9C0;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v2, v4);
}

void __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_3;
  v5[3] = &unk_1E6C3D938;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  [v2 eventQueuePerformBlockOnObservers:v5];
}

void __107__MSASServerSideModel_MSASStateMachine_didFinishMarkingAsSpamInvitationForAlbum_invitationGUID_info_error___block_invoke_3(void *a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_opt_new();
    [v3 setGUID:a1[4]];
    uint64_t v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    id v6 = [v4 _protocolErrorForUnderlyingError:a1[7]];
    [v7 MSASModel:v4 didFinishMarkingAsSpamInvitation:v3 info:v5 error:v6];
  }
}

- (void)markAsSpamInvitationWithGUID:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MSASServerSideModel.m", 1601, @"Invalid parameter not satisfying: %@", @"invitationGUID" object file lineNumber description];
  }
  id v9 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v14 = v8;
  id v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v20 = 0;
  id v21 = 0;
  int v6 = [v4 dbQueueInvitationWithGUID:v5 outObject:&v21 outAlbumGUID:&v20 outEmail:0 outUserInfoData:0];
  id v7 = v21;
  id v8 = v20;
  id v9 = *(void **)(a1 + 40);
  if (v6)
  {
    id v10 = [v7 albumGUID];
    uint64_t v11 = [v9 dbQueueLookupOrCreateAlbumWithGUID:v10];

    id v12 = *(void **)(a1 + 40);
    id v13 = [v7 albumGUID];
    [v12 dbQueueDeleteAlbumWithGUID:v13 info:v3];

    [*(id *)(a1 + 40) dbQueueDeleteInvitationWithGUID:*(void *)(a1 + 48) info:v3];
    id v14 = [*(id *)(a1 + 40) stateMachine];
    [v14 markAsSpamInvitationForAlbum:v11 invitationGUID:*(void *)(a1 + 48) info:v3];

    id v8 = (id)v11;
  }
  else
  {
    id v15 = [*(id *)(a1 + 40) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3D998;
    id v16 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v18 = v16;
    id v19 = v3;
    dispatch_async(v15, block);
  }
}

void __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E6C3D908;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v5];
}

void __57__MSASServerSideModel_markAsSpamInvitationWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_alloc_init(MSASInvitation);
    [(MSASSharingRelationship *)v3 setGUID:a1[4]];
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = [v5 _invalidInvitationGUIDErrorWithGUID:a1[4]];
    [v7 MSASModel:v5 didFinishMarkingAsSpamInvitation:v3 info:v4 error:v6];
  }
}

- (void)markAsSpamAlbumWithGUID:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"MSASServerSideModel.m", 1589, @"Invalid parameter not satisfying: %@", @"albumGUID" object file lineNumber description];
  }
  id v9 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MSASServerSideModel_markAsSpamAlbumWithGUID_info___block_invoke;
  block[3] = &unk_1E6C3D998;
  id v14 = v8;
  id v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(v9, block);
}

void __52__MSASServerSideModel_markAsSpamAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v5 = [v2 MSASAddIsLocalChange];

  id v3 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) dbQueueDeleteAlbumWithGUID:*(void *)(a1 + 48) info:v5];
  [*(id *)(a1 + 40) dbQueueDeleteInvitationForAlbumWithGUID:*(void *)(a1 + 48) info:v5];
  uint64_t v4 = [*(id *)(a1 + 40) stateMachine];
  [v4 markAsSpamInvitationForAlbum:v3 invitationGUID:0 info:v5];
}

- (void)rejectInvitationWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    id v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v23 = 0;
  int v6 = [v4 dbQueueInvitationWithGUID:v5 outObject:&v23 outAlbumGUID:0 outEmail:0 outUserInfoData:0];
  id v7 = v23;
  id v8 = v7;
  id v9 = *(void **)(a1 + 40);
  if (v6)
  {
    id v10 = [v7 albumGUID];
    id v11 = [v9 dbQueueLookupOrCreateAlbumWithGUID:v10];

    id v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = [NSNumber numberWithInt:1];
    id v14 = [v12 dictionaryWithObject:v13 forKey:@"subscriptionMethod"];
    [v11 setContext:v14];

    id v15 = *(void **)(a1 + 40);
    id v16 = [v8 albumGUID];
    [v15 dbQueueDeleteAlbumWithGUID:v16 info:v3];

    [*(id *)(a1 + 40) dbQueueDeleteInvitationWithGUID:*(void *)(a1 + 48) info:v3];
    id v17 = [*(id *)(a1 + 40) stateMachine];
    [v17 unsubscribeFromAlbum:v11 info:v3];

    id v8 = v11;
  }
  else
  {
    id v18 = [*(id *)(a1 + 40) eventQueue];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_2;
    v20[3] = &unk_1E6C3D998;
    id v19 = *(void **)(a1 + 48);
    void v20[4] = *(void *)(a1 + 40);
    id v21 = v19;
    id v22 = v3;
    dispatch_async(v18, v20);
  }
}

void __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E6C3D908;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v5];
}

void __53__MSASServerSideModel_rejectInvitationWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_alloc_init(MSASInvitation);
    [(MSASSharingRelationship *)v3 setGUID:a1[4]];
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = [v5 _invalidInvitationGUIDErrorWithGUID:a1[4]];
    [v10 MSASModel:v5 didFinishRejectingInvitation:v3 info:v4 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = objc_alloc_init(MSASInvitation);
    [(MSASSharingRelationship *)v7 setGUID:a1[4]];
    id v8 = (void *)a1[5];
    id v9 = [v8 _invalidInvitationGUIDErrorWithGUID:a1[4]];
    [v10 MSASModel:v8 didFinishRejectingInvitation:v7 error:v9];
  }
}

- (void)rejectInvitationWithGUID:(id)a3
{
}

- (void)acceptInvitationWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    id v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v21 = 0;
  id v22 = 0;
  int v6 = [v4 dbQueueInvitationWithGUID:v5 outObject:&v22 outAlbumGUID:&v21 outEmail:0 outUserInfoData:0];
  id v7 = v22;
  id v8 = v21;
  id v9 = *(void **)(a1 + 40);
  if (v6)
  {
    id v10 = [v7 albumGUID];
    id v11 = [v9 dbQueueLookupOrCreateAlbumWithGUID:v10];

    id v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = [NSNumber numberWithInt:1];
    id v14 = [v12 dictionaryWithObject:v13 forKey:@"subscriptionMethod"];
    [v11 setContext:v14];

    [v7 setState:2];
    [*(id *)(a1 + 40) dbQueueSetInvitation:v7 info:v3];
    id v15 = [*(id *)(a1 + 40) stateMachine];
    [v15 subscribeToAlbum:v11 info:v3];

    id v8 = v11;
  }
  else
  {
    id v16 = [*(id *)(a1 + 40) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3D998;
    id v17 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v19 = v17;
    id v20 = v3;
    dispatch_async(v16, block);
  }
}

void __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_3;
  v5[3] = &unk_1E6C3D908;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v5];
}

void __53__MSASServerSideModel_acceptInvitationWithGUID_info___block_invoke_3(void *a1, void *a2)
{
  id v10 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = objc_alloc_init(MSASInvitation);
    [(MSASSharingRelationship *)v3 setGUID:a1[4]];
    uint64_t v5 = (void *)a1[5];
    uint64_t v4 = a1[6];
    id v6 = [v5 _invalidInvitationGUIDErrorWithGUID:a1[4]];
    [v10 MSASModel:v5 didFinishAcceptingInvitation:v3 forAlbum:0 info:v4 error:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = objc_alloc_init(MSASInvitation);
    [(MSASSharingRelationship *)v7 setGUID:a1[4]];
    id v8 = (void *)a1[5];
    id v9 = [v8 _invalidInvitationGUIDErrorWithGUID:a1[4]];
    [v10 MSASModel:v8 didFinishAcceptingInvitation:v7 forAlbum:0 error:v9];
  }
}

- (void)acceptInvitationWithGUID:(id)a3
{
}

- (void)validateInvitationForAlbum:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MSASServerSideModel *)self stateMachine];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke;
  v10[3] = &unk_1E6C3D170;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 validateInvitationForAlbum:v7 completionBlock:v10];
}

void __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3DAD8;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  char v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __66__MSASServerSideModel_validateInvitationForAlbum_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    id v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_INVITATION");
    id v5 = [v2 MSErrorWithDomain:@"MSASModelErrorDomain" code:5 description:v3 underlyingError:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

- (void)acceptInvitationWithToken:(id)a3 info:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:a4];
    char v11 = [v10 MSASAddIsLocalChange];

    id v12 = [(MSASServerSideModel *)self stateMachine];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke;
    v16[3] = &unk_1E6C3D148;
    void v16[4] = self;
    id v17 = v9;
    [v12 acceptInvitationWithToken:v8 info:v11 completionBlock:v16];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    id v14 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_INVITATION");
    id v15 = [v13 MSErrorWithDomain:@"MSASModelErrorDomain" code:5 description:v14 underlyingError:0];

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v15);
  }
}

void __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3D198;
  id v12 = v6;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __70__MSASServerSideModel_acceptInvitationWithToken_info_completionBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
    id v3 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_MODEL_INVALID_INVITATION");
    id v5 = [v2 MSErrorWithDomain:@"MSASModelErrorDomain" code:5 description:v3 underlyingError:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v4();
  }
}

- (void)acceptInvitationWithToken:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__MSASServerSideModel_acceptInvitationWithToken_completionBlock___block_invoke;
  v8[3] = &unk_1E6C3D120;
  id v9 = v6;
  id v7 = v6;
  [(MSASServerSideModel *)self acceptInvitationWithToken:a3 info:0 completionBlock:v8];
}

uint64_t __65__MSASServerSideModel_acceptInvitationWithToken_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_unsubscribeFromAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    char v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __57__MSASServerSideModel_unsubscribeFromAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v5 = [v2 MSASAddIsLocalChange];

  id v3 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) dbQueueDeleteAlbumWithGUID:*(void *)(a1 + 48) info:v5];
  [*(id *)(a1 + 40) dbQueueDeleteInvitationForAlbumWithGUID:*(void *)(a1 + 48) info:v5];
  uint64_t v4 = [*(id *)(a1 + 40) stateMachine];
  [v4 unsubscribeFromAlbum:v3 info:v5];
}

- (void)unsubscribeFromAlbumWithGUID:(id)a3
{
}

- (void)subscribeToAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_subscribeToAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    char v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __53__MSASServerSideModel_subscribeToAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v5 = [v2 MSASAddIsLocalChange];

  id v3 = [*(id *)(a1 + 40) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 48)];
  uint64_t v4 = [*(id *)(a1 + 40) stateMachine];
  [v4 subscribeToAlbum:v3 info:v5];
}

- (void)subscribeToAlbumWithGUID:(id)a3
{
}

- (void)markAlbumGUIDAsViewed:(id)a3 moveLastViewedAssetCollectionMarker:(BOOL)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [(MSASModelBase *)self dbQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke;
    v11[3] = &unk_1E6C3D0A8;
    id v12 = v9;
    id v13 = self;
    id v14 = v8;
    BOOL v15 = a4;
    dispatch_async(v10, v11);
  }
}

void __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v3 = [v2 MSASAddIsLocalChange];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v30 = 0;
  id v31 = 0;
  id v29 = 0;
  int v6 = [v4 dbQueueAlbumWithGUID:v5 outObject:&v31 outName:0 outCtag:&v30 outForeignCtag:&v29 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v7 = v31;
  id v8 = v30;
  id v9 = v29;
  if (v6)
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [*(id *)(a1 + 40) dbQueueSetAlbumMetadataAlbumGUID:*(void *)(a1 + 48) key:@"lastviewedctag" value:v8 info:v3];
    [*(id *)(a1 + 40) dbQueueSetUnviewedState:0 onAlbumWithGUID:*(void *)(a1 + 48) info:v3];
    id v11 = v9;
    if (v9 || (id v11 = v8) != 0) {
      [v10 setObject:v11 forKey:@"lastviewedctag"];
    }
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    if (*(unsigned char *)(a1 + 56))
    {
      id v14 = [v12 dbQueueMaximumPhotoNumberForAlbumWithGUID:v13];
      id v15 = v14;
      if (v14)
      {
        id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v14, "longLongValue"));
        [*(id *)(a1 + 40) dbQueueSetAlbumMetadataAlbumGUID:*(void *)(a1 + 48) key:@"lastassetposition" value:v16 info:v3];
        [v10 setObject:v16 forKey:@"lastassetposition"];
      }
    }
    else
    {
      id v28 = 0;
      int v18 = [v12 dbQueueAlbumMetadataWithAlbumGUID:v13 key:@"lastassetposition" outValue:&v28];
      id v15 = v28;
      if (v18) {
        [v10 setObject:v15 forKey:@"lastassetposition"];
      }
    }

    id v19 = [*(id *)(a1 + 40) stateMachine];
    [v19 setAlbumSyncedState:v10 forAlbum:v7 info:v3];

    LODWORD(v19) = [*(id *)(a1 + 40) dbQueueUnviewedAssetCollectionCountForAlbumWithGUID:*(void *)(a1 + 48)];
    id v20 = [*(id *)(a1 + 40) eventQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_2;
    v24[3] = &unk_1E6C3D0F8;
    void v24[4] = *(void *)(a1 + 40);
    id v25 = v7;
    int v27 = (int)v19;
    id v26 = v3;
    dispatch_async(v20, v24);
  }
  else
  {
    id v17 = [*(id *)(a1 + 40) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_3;
    block[3] = &unk_1E6C3D998;
    void block[4] = *(void *)(a1 + 40);
    id v22 = v7;
    id v23 = v3;
    dispatch_async(v17, block);
  }
}

uint64_t __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueueNotifyObserversOfUpdatedUnviewedCountInAlbum:*(void *)(a1 + 40) unviewedCount:*(unsigned int *)(a1 + 56) info:*(void *)(a1 + 48)];
}

void __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_4;
  v3[3] = &unk_1E6C3D908;
  void v3[4] = v2;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 eventQueuePerformBlockOnObservers:v3];
}

void __86__MSASServerSideModel_markAlbumGUIDAsViewed_moveLastViewedAssetCollectionMarker_info___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishMarkingAlbumAsViewed:a1[5] info:a1[6] error:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModel:a1[4] didFinishMarkingAlbumAsViewed:a1[5] error:0];
  }
}

- (void)markAlbumGUIDAsViewed:(id)a3 info:(id)a4
{
}

- (void)markAlbumGUIDAsViewed:(id)a3
{
}

- (void)deleteAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:a4];
    id v8 = [v7 MSASAddIsLocalChange];

    id v9 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v12 = v6;
    id v13 = v8;
    id v10 = v8;
    dispatch_async(v9, block);
  }
}

void __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v12 = 0;
  char v4 = [v2 dbQueueAlbumWithGUID:v3 outObject:&v12 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v5 = v12;
  if ((v4 & 1) == 0)
  {
    id v6 = +[MSASAlbum album];

    [v6 setGUID:*(void *)(a1 + 40)];
    id v5 = v6;
  }
  if ([v5 relationshipState])
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke_2;
    block[3] = &unk_1E6C3DB28;
    id v8 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v11 = v8;
    dispatch_async(v7, block);
  }
  else
  {
    [*(id *)(a1 + 32) dbQueueDeleteAlbumWithGUID:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
    id v9 = [*(id *)(a1 + 32) stateMachine];
    [v9 deleteAlbum:v5 info:*(void *)(a1 + 48)];
  }
}

uint64_t __48__MSASServerSideModel_deleteAlbumWithGUID_info___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) unsubscribeFromAlbumWithGUID:*(void *)(a1 + 40)];
}

- (void)deleteAlbumWithGUID:(id)a3
{
}

- (void)setMigrationMarker:(id)a3
{
}

- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [(MSASModelBase *)self dbQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__MSASServerSideModel_setClientOrgKey_forAlbumWithGUID_info___block_invoke;
    v12[3] = &unk_1E6C3D9C0;
    id v13 = v10;
    id v14 = self;
    id v15 = v9;
    id v16 = v8;
    dispatch_async(v11, v12);
  }
}

void __61__MSASServerSideModel_setClientOrgKey_forAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  uint64_t v3 = [v2 MSASAddIsLocalChange];

  char v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v8 = 0;
  [v4 dbQueueAlbumWithGUID:v5 outObject:&v8 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v6 = v8;
  id v7 = v6;
  if (v6)
  {
    [v6 setClientOrgKey:*(void *)(a1 + 56)];
    [*(id *)(a1 + 40) dbQueueSetAlbum:v7 info:v3];
  }
}

- (void)setClientOrgKey:(id)a3 forAlbumWithGUID:(id)a4
{
}

- (void)modifyAlbumMetadata:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_modifyAlbumMetadata_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    id v10 = v7;
    id v11 = self;
    id v12 = v6;
    dispatch_async(v8, block);
  }
}

void __48__MSASServerSideModel_modifyAlbumMetadata_info___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:*(void *)(a1 + 32)];
  id v8 = [v2 MSASAddIsLocalChange];

  uint64_t v3 = *(void **)(a1 + 40);
  char v4 = [*(id *)(a1 + 48) GUID];
  uint64_t v5 = [v3 dbQueueLookupOrCreateAlbumWithGUID:v4];

  id v6 = [*(id *)(a1 + 48) metadata];
  [v5 setMetadata:v6];

  [*(id *)(a1 + 40) dbQueueSetAlbum:v5 info:v8];
  id v7 = [*(id *)(a1 + 40) stateMachine];
  [v7 updateAlbum:v5 updateAlbumFlags:0 info:v8];
}

- (void)modifyAlbumMetadata:(id)a3
{
}

- (void)addAlbum:(id)a3 info:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1CA60] MSASDictionaryWithCopyOfDictionary:a4];
    id v8 = [v7 MSASAddIsLocalChange];

    id v9 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MSASServerSideModel_addAlbum_info___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v12 = v6;
    id v13 = v8;
    id v10 = v8;
    dispatch_async(v9, block);
  }
}

void __37__MSASServerSideModel_addAlbum_info___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) dbQueueSetAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 createAlbum:*(void *)(a1 + 40) info:*(void *)(a1 + 48)];
}

- (void)addAlbum:(id)a3
{
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = __Block_byref_object_copy__6923;
    int v18 = __Block_byref_object_dispose__6924;
    id v19 = 0;
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MSASServerSideModel_refreshAccessControlListForAlbumWithGUID_info___block_invoke;
    block[3] = &unk_1E6C3D000;
    id v13 = &v14;
    void block[4] = self;
    id v12 = v6;
    dispatch_sync(v8, block);

    id v9 = [(MSASServerSideModel *)self stateMachine];
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObject:v15[5]];
    [v9 getAccessControlsForAlbums:v10 info:v7];

    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __69__MSASServerSideModel_refreshAccessControlListForAlbumWithGUID_info___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) dbQueueLookupOrCreateAlbumWithGUID:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (void)refreshAccessControlListForAlbumWithGUID:(id)a3
{
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4 info:(id)a5
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    long long v37 = __Block_byref_object_copy__6923;
    long long v38 = __Block_byref_object_dispose__6924;
    id v39 = 0;
    uint64_t v28 = 0;
    id v29 = &v28;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__6923;
    uint64_t v32 = __Block_byref_object_dispose__6924;
    id v33 = &unk_1F367DA20;
    id v10 = [(MSASModelBase *)self dbQueue];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    id v21 = __80__MSASServerSideModel_refreshCommentsForAssetCollectionWithGUID_resetSync_info___block_invoke;
    id v22 = &unk_1E6C3D0D0;
    id v23 = self;
    id v11 = v8;
    id v24 = v11;
    id v25 = &v34;
    BOOL v27 = a4;
    id v26 = &v28;
    dispatch_sync(v10, &v19);

    uint64_t v12 = v29[5];
    id v40 = v11;
    v41[0] = v12;
    id v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1, v19, v20, v21, v22, v23);
    uint64_t v14 = [(MSASServerSideModel *)self stateMachine];
    id v15 = [(id)v35[5] GUID];
    uint64_t v16 = [(id)v35[5] clientOrgKey];
    [v14 checkForCommentChanges:v13 inAlbumWithGUID:v15 withClientOrgKey:v16];

    id v17 = [(MSASServerSideModel *)self stateMachine];
    int v18 = [(id)v35[5] GUID];
    [v17 scheduleEvent:@"flushPendingCommentQueue" assetCollectionGUID:v11 albumGUID:v18 info:v9];

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v34, 8);
  }
}

void __80__MSASServerSideModel_refreshCommentsForAssetCollectionWithGUID_resetSync_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = (id)[v2 dbQueueLookupOrCreateAssetCollectionWithGUID:v3 outAlbum:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!*(unsigned char *)(a1 + 64))
  {
    uint64_t v6 = [*(id *)(a1 + 32) dbQueueMaximumCommentIDForAssetCollectionWithGUID:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)refreshCommentsForAssetCollectionWithGUID:(id)a3 resetSync:(BOOL)a4
{
  if (a3) {
    [(MSASServerSideModel *)self refreshCommentsForAssetCollectionWithGUID:a3 resetSync:a4 info:0];
  }
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4 info:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [(MSASModelBase *)self dbQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__MSASServerSideModel_refreshContentOfAlbumWithGUID_resetSync_info___block_invoke;
    v11[3] = &unk_1E6C3D0A8;
    void v11[4] = self;
    id v12 = v8;
    BOOL v14 = a4;
    id v13 = v9;
    dispatch_async(v10, v11);
  }
}

void __68__MSASServerSideModel_refreshContentOfAlbumWithGUID_resetSync_info___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  int v4 = [v2 dbQueueAlbumWithGUID:v3 outObject:&v8 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  id v5 = v8;
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) stateMachine];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v5];
    [v6 checkForUpdatesInAlbums:v7 resetSync:*(unsigned __int8 *)(a1 + 56) info:*(void *)(a1 + 48)];
  }
}

- (void)refreshContentOfAlbumWithGUID:(id)a3 resetSync:(BOOL)a4
{
}

- (void)refreshResetSync:(BOOL)a3 info:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MSASServerSideModel *)self stateMachine];
  [v7 checkForChangesResetSync:v4 info:v6];
}

- (void)refreshResetSync:(BOOL)a3
{
}

- (void)_reconstruct
{
  uint64_t v3 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MSASServerSideModel__reconstruct__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);

  [(MSASServerSideModel *)self refreshResetSync:1];
}

uint64_t __35__MSASServerSideModel__reconstruct__block_invoke(uint64_t a1)
{
  int8x16_t v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__MSASServerSideModel__reconstruct__block_invoke_2;
  v3[3] = &unk_1E6C3CF88;
  void v3[4] = v1;
  return [v1 eventQueuePerformBlockOnObservers:v3];
}

void __35__MSASServerSideModel__reconstruct__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModelDidDeleteAllAlbumsInAlbumList:*(void *)(a1 + 32)];
  }
}

- (void)reconstruct
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Reconstructing model from the server.", buf, 0xCu);
  }
  id v3 = [(MSASServerSideModel *)self stateMachine];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__MSASServerSideModel_reconstruct__block_invoke;
  v4[3] = &unk_1E6C3DA38;
  v4[4] = self;
  [v3 purgeEverythingCompletionBlock:v4];
}

void __34__MSASServerSideModel_reconstruct__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 scheduleEvent:@"reconstruct" assetCollectionGUID:0 albumGUID:0 info:0];
}

- (void)MSASStateMachineDidUpdateServerCommunicationBackoffDate:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MSASServerSideModel_MSASStateMachineDidUpdateServerCommunicationBackoffDate___block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __79__MSASServerSideModel_MSASStateMachineDidUpdateServerCommunicationBackoffDate___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MSASModelDidUpdateServerCommunicationBackoffDateNotification" object:*(void *)(a1 + 32)];
}

- (id)serverCommunicationBackoffDate
{
  id v2 = [(MSASServerSideModel *)self stateMachine];
  id v3 = [v2 serverCommunicationBackoffDate];

  return v3;
}

- (id)userInfoForCommentWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_userInfoForCommentWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__MSASServerSideModel_userInfoForCommentWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  int v4 = [v2 dbQueueCommentWithGUID:v3 outObject:0 outID:0 outTimestamp:0 outAssetCollectionGUID:0 outIsCaption:0 outUserInfoData:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v5 outError:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)setUserInfo:(id)a3 forCommentWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MSASServerSideModel_setUserInfo_forCommentWithGUID___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __54__MSASServerSideModel_setUserInfo_forCommentWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update or ignore Comments set userInfo = ? where GUID = ?;"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  int v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    id v8 = NSString;
    id v9 = [v5 userInfo];
    id v10 = [v8 stringWithFormat:@"Failed to archive a userInfo object. Error: %@ Info: %@", v6, v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    uint64_t v7 = sqlite3_bind_null(v2, 1);
  }
  int v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    uint64_t v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2) {
    sqlite3_reset(v2);
  }
}

- (id)userInfoForInvitationWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MSASServerSideModel_userInfoForInvitationWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __53__MSASServerSideModel_userInfoForInvitationWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  int v4 = [v2 dbQueueInvitationWithGUID:v3 outObject:0 outAlbumGUID:0 outEmail:0 outUserInfoData:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v5 outError:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)setUserInfo:(id)a3 forInvitationWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_setUserInfo_forInvitationWithGUID___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __57__MSASServerSideModel_setUserInfo_forInvitationWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update or ignore Invitations set userInfo = ? where GUID = ?;"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  int v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    id v8 = NSString;
    id v9 = [v5 userInfo];
    id v10 = [v8 stringWithFormat:@"Failed to archive a userInfo object. Error: %@ Info: %@", v6, v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    uint64_t v7 = sqlite3_bind_null(v2, 1);
  }
  int v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    uint64_t v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2) {
    sqlite3_reset(v2);
  }
}

- (id)userInfoForAccessControlWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MSASServerSideModel_userInfoForAccessControlWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__MSASServerSideModel_userInfoForAccessControlWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  int v4 = [v2 dbQueueAccessControlWithGUID:v3 outObject:0 outAlbumGUID:0 outEmail:0 outUserInfoData:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v5 outError:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)setUserInfo:(id)a3 forAccessControlWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MSASServerSideModel_setUserInfo_forAccessControlWithGUID___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __60__MSASServerSideModel_setUserInfo_forAccessControlWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update or ignore AccessControls set userInfo = ? where GUID = ?;"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  int v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    id v8 = NSString;
    id v9 = [v5 userInfo];
    id v10 = [v8 stringWithFormat:@"Failed to archive a userInfo object. Error: %@ Info: %@", v6, v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    uint64_t v7 = sqlite3_bind_null(v2, 1);
  }
  int v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    uint64_t v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2) {
    sqlite3_reset(v2);
  }
}

- (id)userInfoForAssetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_userInfoForAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__MSASServerSideModel_userInfoForAssetCollectionWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  int v4 = [v2 dbQueueAssetCollectionWithGUID:v3 outObject:0 outCtag:0 outAlbumGUID:0 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v5 outError:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)setUserInfo:(id)a3 forAssetCollectionWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MSASServerSideModel_setUserInfo_forAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __62__MSASServerSideModel_setUserInfo_forAssetCollectionWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update or ignore AssetCollections set userInfo = ? where GUID = ?;"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  int v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    id v8 = NSString;
    id v9 = [v5 userInfo];
    id v10 = [v8 stringWithFormat:@"Failed to archive a userInfo object. Error: %@ Info: %@", v6, v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    uint64_t v7 = sqlite3_bind_null(v2, 1);
  }
  int v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    uint64_t v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2) {
    sqlite3_reset(v2);
  }
}

- (id)userInfoForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MSASServerSideModel_userInfoForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__MSASServerSideModel_userInfoForAlbumWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  int v4 = [v2 dbQueueAlbumWithGUID:v3 outObject:0 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:&v9 outClientOrgKey:0];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v5 outError:0];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)setUserInfo:(id)a3 forAlbumWithGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__MSASServerSideModel_setUserInfo_forAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D998;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __52__MSASServerSideModel_setUserInfo_forAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"update or ignore Albums set userInfo = ? where GUID = ?;"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  int v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = MSSqliteBindDataOrNull(v2, 1, v4);
  }
  else
  {
    id v8 = NSString;
    id v9 = [v5 userInfo];
    id v10 = [v8 stringWithFormat:@"Failed to archive a userInfo object. Error: %@ Info: %@", v6, v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    uint64_t v7 = sqlite3_bind_null(v2, 1);
  }
  int v11 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (!v11)
  {
    uint64_t v12 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    int v13 = v12;
    MSSqliteTrapForDBLockError(v12);
    if (!v13)
    {
      uint64_t v14 = sqlite3_step(v2);
      MSSqliteTrapForDBLockError(v14);
    }
  }

  if (v2) {
    sqlite3_reset(v2);
  }
}

- (id)captionForAssetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__MSASServerSideModel_captionForAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__MSASServerSideModel_captionForAssetCollectionWithGUID___block_invoke(uint64_t a1)
{
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select obj from Comments where assetCollectionGUID = ? and isCaption != 0 order by timestamp limit 1;"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    int v5 = sqlite3_step(v2);
    if (v5 != 101)
    {
      if (v5 == 100)
      {
        uint64_t v6 = MSSqliteObjectFromStatementColumn(v2, 0);
        uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
        id v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = v6;
      }
      else
      {
        MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 1003);
      }
    }
  }
  if (v2)
  {
    sqlite3_reset(v2);
  }
}

- (id)commentWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    int v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__MSASServerSideModel_commentWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    uint64_t v6 = (void *)v13[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__MSASServerSideModel_commentWithGUID___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueCommentWithGUID:v1 outObject:&obj outID:0 outTimestamp:0 outAssetCollectionGUID:0 outIsCaption:0 outUserInfoData:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)dbQueueCommentsForAssetCollectionWithGUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(MSASModelBase *)self dbQueueDB];
    objc_msgSend(NSString, "stringWithFormat:", @"select obj from Comments where assetCollectionGUID = '%@' order by timestamp asc;",
    uint64_t v6 = v4);

    id v7 = +[MSASModelEnumerator enumeratorWithDatabase:v5 query:v6 stepBlock:&__block_literal_global_192];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

id __65__MSASServerSideModel_dbQueueCommentsForAssetCollectionWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

- (id)commentsForAssetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    int v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_commentsForAssetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    int v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    uint64_t v6 = (void *)v13[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__MSASServerSideModel_commentsForAssetCollectionWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueCommentsForAssetCollectionWithGUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQueue:v5];
}

- (id)assetCollectionWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__MSASServerSideModel_assetCollectionWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    int v11 = &v12;
    dispatch_sync(v5, block);

    uint64_t v6 = (void *)v13[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__MSASServerSideModel_assetCollectionWithGUID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAssetCollectionWithGUID:v1 outObject:&obj outCtag:0 outAlbumGUID:0 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)dbQueueAssetCollectionGUIDsInAlbumWithGUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MSASModelBase *)self dbQueueDB];
    objc_msgSend(NSString, "stringWithFormat:", @"select GUID from AssetCollections where albumGUID = '%@' order by albumGUID asc, batchDate asc, photoDate asc, GUID asc;",
    uint64_t v6 = v4);

    id v7 = +[MSASModelEnumerator enumeratorWithDatabase:v5 query:v6 stepBlock:&__block_literal_global_187];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

id __66__MSASServerSideModel_dbQueueAssetCollectionGUIDsInAlbumWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

- (id)assetCollectionGUIDsInAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MSASServerSideModel_assetCollectionGUIDsInAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    int v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    uint64_t v6 = (void *)v13[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __59__MSASServerSideModel_assetCollectionGUIDsInAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueAssetCollectionGUIDsInAlbumWithGUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQueue:v5];
}

- (id)assetCollectionsInAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  uint64_t v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__MSASServerSideModel_assetCollectionsInAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    int v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    uint64_t v6 = (void *)v13[5];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__MSASServerSideModel_assetCollectionsInAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueDB];
  objc_msgSend(NSString, "stringWithFormat:", @"select obj from AssetCollections where albumGUID = '%@' order by albumGUID asc, batchDate asc, photoDate asc, GUID asc;",
  uint64_t v3 = *(void *)(a1 + 40));
  uint64_t v4 = +[MSASModelEnumerator enumeratorWithDatabase:v2 query:v3 stepBlock:&__block_literal_global_182];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQueue:v7];
}

id __55__MSASServerSideModel_assetCollectionsInAlbumWithGUID___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

- (void)videoURLsForAssetCollectionWithGUID:(id)a3 forMediaAssetType:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [(MSASModelBase *)self dbQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke;
    v11[3] = &unk_1E6C3D078;
    void v11[4] = self;
    id v12 = v8;
    unint64_t v14 = a4;
    id v13 = v9;
    dispatch_async(v10, v11);
  }
}

void __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  id v15 = 0;
  int v4 = [v2 dbQueueAssetCollectionWithGUID:v3 outObject:&v16 outCtag:0 outAlbumGUID:&v15 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v5 = v16;
  id v6 = v15;
  id v7 = 0;
  if (v4)
  {
    id v8 = *(void **)(a1 + 32);
    id v14 = 0;
    int v9 = [v8 dbQueueAlbumWithGUID:v6 outObject:&v14 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v7 = v14;
    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) stateMachine];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke_2;
      v12[3] = &unk_1E6C3D050;
      uint64_t v11 = *(void *)(a1 + 56);
      id v13 = *(id *)(a1 + 48);
      [v10 videoURLsForAssetCollection:v5 forMediaAssetType:v11 inAlbum:v7 completionBlock:v12];
    }
  }
}

uint64_t __93__MSASServerSideModel_videoURLsForAssetCollectionWithGUID_forMediaAssetType_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)videoURLForAssetCollectionWithGUID:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke;
    block[3] = &unk_1E6C3D198;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v15 = 0;
  id v14 = 0;
  int v4 = [v2 dbQueueAssetCollectionWithGUID:v3 outObject:&v15 outCtag:0 outAlbumGUID:&v14 outBatchDate:0 outPhotoDate:0 outPhotoNumber:0 outUserInfoData:0];
  id v5 = v15;
  id v6 = v14;
  id v7 = 0;
  if (v4)
  {
    id v8 = *(void **)(a1 + 32);
    id v13 = 0;
    int v9 = [v8 dbQueueAlbumWithGUID:v6 outObject:&v13 outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
    id v7 = v13;
    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) stateMachine];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke_2;
      v11[3] = &unk_1E6C3D028;
      id v12 = *(id *)(a1 + 48);
      [v10 videoURLForAssetCollection:v5 inAlbum:v7 completionBlock:v11];
    }
  }
}

uint64_t __74__MSASServerSideModel_videoURLForAssetCollectionWithGUID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)isPublicAccessEnabledForAlbumWithGUID:(id)a3
{
  return 0;
}

- (id)invitationWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__MSASServerSideModel_invitationWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__MSASServerSideModel_invitationWithGUID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueInvitationWithGUID:v1 outObject:&obj outAlbumGUID:0 outEmail:0 outUserInfoData:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)dbQueueInvitationForAlbumWithGUID:(id)a3
{
  if (a3)
  {
    id v6 = 0;
    [(MSASServerSideModel *)self dbQueueInvitationWithAlbumGUID:a3 outObject:&v6 outInvitationGUID:0 outEmail:0 outUserInfoData:0];
    id v4 = v6;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)invitationForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__MSASServerSideModel_invitationForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __50__MSASServerSideModel_invitationForAlbumWithGUID___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) dbQueueInvitationForAlbumWithGUID:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (id)invitationGUIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6923;
  id v11 = __Block_byref_object_dispose__6924;
  id v12 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__MSASServerSideModel_invitationGUIDs__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __38__MSASServerSideModel_invitationGUIDs__block_invoke(uint64_t a1)
{
  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", [*(id *)(a1 + 32) dbQueueDB], @"select GUID from Invitations order by email;",
  uint64_t v2 = &__block_literal_global_175);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setQueue:v5];
}

id __38__MSASServerSideModel_invitationGUIDs__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

- (id)invitations
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6923;
  id v11 = __Block_byref_object_dispose__6924;
  id v12 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__MSASServerSideModel_invitations__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __34__MSASServerSideModel_invitations__block_invoke(uint64_t a1)
{
  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", [*(id *)(a1 + 32) dbQueueDB], @"select obj from Invitations order by email;",
  uint64_t v2 = &__block_literal_global_170);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setQueue:v5];
}

id __34__MSASServerSideModel_invitations__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

- (id)accessControlWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MSASServerSideModel_accessControlWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __45__MSASServerSideModel_accessControlWithGUID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAccessControlWithGUID:v1 outObject:&obj outAlbumGUID:0 outEmail:0 outUserInfoData:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)dbQueueAccessControlGUIDsForAlbumWithGUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MSASModelBase *)self dbQueueDB];
    objc_msgSend(NSString, "stringWithFormat:", @"select GUID from AccessControls where albumGUID = '%@' order by email asc;",
    id v6 = v4);

    id v7 = +[MSASModelEnumerator enumeratorWithDatabase:v5 query:v6 stepBlock:&__block_literal_global_165];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

id __65__MSASServerSideModel_dbQueueAccessControlGUIDsForAlbumWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

- (id)accessControlGUIDsForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MSASServerSideModel_accessControlGUIDsForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__MSASServerSideModel_accessControlGUIDsForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueAccessControlGUIDsForAlbumWithGUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQueue:v5];
}

- (id)dbQueueAccessControlsForAlbumWithGUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MSASModelBase *)self dbQueueDB];
    objc_msgSend(NSString, "stringWithFormat:", @"select obj from AccessControls where albumGUID = '%@' order by email asc;",
    id v6 = v4);

    id v7 = +[MSASModelEnumerator enumeratorWithDatabase:v5 query:v6 stepBlock:&__block_literal_global_160];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

id __61__MSASServerSideModel_dbQueueAccessControlsForAlbumWithGUID___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

- (id)accessControlsForAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__MSASServerSideModel_accessControlsForAlbumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    id v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __54__MSASServerSideModel_accessControlsForAlbumWithGUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueAccessControlsForAlbumWithGUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setQueue:v5];
}

- (id)albumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6923;
  id v16 = __Block_byref_object_dispose__6924;
  id v17 = 0;
  if (v4)
  {
    id v5 = [(MSASModelBase *)self dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MSASServerSideModel_albumWithGUID___block_invoke;
    block[3] = &unk_1E6C3D000;
    void block[4] = self;
    id v10 = v4;
    id v11 = &v12;
    dispatch_sync(v5, block);

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __37__MSASServerSideModel_albumWithGUID___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 dbQueueAlbumWithGUID:v1 outObject:&obj outName:0 outCtag:0 outForeignCtag:0 outURLString:0 outUserInfoData:0 outClientOrgKey:0];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)dbQueueAlbumGUIDs
{
  uint64_t v2 = [(MSASModelBase *)self dbQueueDB];
  return +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", v2, @"select GUID from Albums order by GUID asc;",
           &__block_literal_global_154);
}

id __40__MSASServerSideModel_dbQueueAlbumGUIDs__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteStringFromStatementColumn(a2, 0);
}

- (id)albumGUIDs
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6923;
  id v11 = __Block_byref_object_dispose__6924;
  id v12 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__MSASServerSideModel_albumGUIDs__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__MSASServerSideModel_albumGUIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dbQueueAlbumGUIDs];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setQueue:v5];
}

- (id)albums
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6923;
  id v11 = __Block_byref_object_dispose__6924;
  id v12 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__MSASServerSideModel_albums__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__MSASServerSideModel_albums__block_invoke(uint64_t a1)
{
  +[MSASModelEnumerator enumeratorWithDatabase:query:stepBlock:](MSASModelEnumerator, "enumeratorWithDatabase:query:stepBlock:", [*(id *)(a1 + 32) dbQueueDB], @"select obj from Albums order by GUID asc;",
  uint64_t v2 = &__block_literal_global_7154);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 32) dbQueue];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setQueue:v5];
}

id __29__MSASServerSideModel_albums__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return MSSqliteObjectFromStatementColumn(a2, 0);
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MSASServerSideModel *)self observers];
    [v5 removeObject:v4];
  }
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(MSASServerSideModel *)self observers];
    [v5 addObject:v4];
  }
}

- (NSCountedSet)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (BOOL)hasEnqueuedActivities
{
  uint64_t v2 = [(MSASServerSideModel *)self stateMachine];
  char v3 = [v2 hasEnqueuedActivities];

  return v3;
}

- (BOOL)hasCommandsInGroupedCommandQueue
{
  uint64_t v2 = [(MSASServerSideModel *)self commandQueue];
  char v3 = [v2 hasEnqueuedItems];

  return v3;
}

- (void)shutDownForDestruction:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(MSASServerSideModel *)self commandQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__MSASServerSideModel_shutDownForDestruction_completionBlock___block_invoke;
  v10[3] = &unk_1E6C3DAD8;
  BOOL v8 = !v4;
  BOOL v12 = v4;
  void v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 shutDownFlush:v8 completionBlock:v10];
}

id __62__MSASServerSideModel_shutDownForDestruction_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v2;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Command Queue has shut down.", buf, 0xCu);
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)MSASServerSideModel;
  return objc_msgSendSuper2(&v6, sel_shutDownForDestruction_completionBlock_, v3, v4);
}

- (void)shutDown
{
}

- (void)cancel
{
  id v2 = [(MSASServerSideModel *)self stateMachine];
  [v2 cancelCompletionBlock:0];
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  *(void *)&v19[5] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MSASServerSideModel;
  unsigned int v6 = [(MSASModelBase *)&v15 dbQueueUpgradeFromDatabaseVersion:*(void *)&a3 currentVersion:*(void *)&a4];
  LOBYTE(v7) = 0;
  if (a3 >= 8 && v6)
  {
    if (a3 < 0)
    {
      errmsg = 0;
      if (!sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists Albums (\n  GUID             text unique primary key,\n  name             text,\n  ctag             text,\n  foreignCtag      text,\n  url              text,\n  obj              blob,\n  userInfo         blob\n);",
              0,
              0,
              &errmsg))
      {
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists AlbumsByName on Albums (name asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create album by name index. Error: %{public}s";
            goto LABEL_71;
          }
LABEL_72:
          sqlite3_free(errmsg);
          goto LABEL_73;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists AlbumsByGUID on Albums (GUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create album by GUID index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists AlbumMetadata (\n  albumGUID        text, \n  key              text, \n  value            text,\n  constraint UniquePerAlbum primary key (albumGUID, key) on conflict replace);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create synced album metadata tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists AccessControls (\n  GUID             text unique primary key,\n  email            text,\n  albumGUID        text,\n  obj              blob,\n  userInfo         blob\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create access control tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists AccessControlsByAlbumGUID on AccessControls (albumGUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create access control Album GUID index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists AccessControlsByAlbumGUID on AccessControls (email asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create access control email index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists Invitations (\n  GUID             text unique primary key,\n  albumGUID        text,\n  email            text,\n  obj              blob,\n  userInfo         blob\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create invitation tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists InvitationsByAlbumGUID on Invitations (albumGUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create invitation index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists InvitationsByEmail on Invitations (albumGUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create invitation email index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists AssetCollections (\n  GUID                text unique primary key,\n  ctag                text,\n  albumGUID           text,\n  batchDate           real,\n  photoDate           real,\n  photoNumber         int,\n  obj                 blob,\n  userInfo            blob\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create asset collection tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists AssetCollectionsByAlbumGUID on AssetCollections (albumGUID asc, batchDate asc, photoDate asc, GUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create asset collection index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists AssetCollectionMetadata (\n  assetCollectionGUID  text, \n  albumGUID            text, \n  key                  text, \n  value                text,\n  constraint UniquePerAssetCollection primary key (assetCollectionGUID, key) on conflict replace);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create synced asset collection metadata tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists AssetCollectionMetadataByAlbum on AssetCollectionMetadata (albumGUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create asset collection metadata index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists Comments (\n  GUID                 text unique primary key,\n  id                   int,\n  timestamp            real,\n  assetCollectionGUID  text,\n  isCaption            int,\n  isMine               int,\n  obj                  blob,\n  userInfo             blob\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create comment tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists CommentsByAssetCollectionGUID on Comments (assetCollectionGUID asc, timestamp asc, GUID asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create comment index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists CommentsByAssetCollectionGUIDAndMine on Comments (assetCollectionGUID asc, timestamp asc, isMine asc);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create comment ownership index. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists GroupedCommand (\n  command              text,\n  variant              blob,\n  invariant            blob\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create grouped command tables. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists CommentCheckQueue (\n  assetCollectionGUID  text unique,\n  albumGUID            text\n);",
               0,
               0,
               &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not create comment checking queue. Error: %{public}s";
            goto LABEL_71;
          }
          goto LABEL_72;
        }
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database indexes. Ignoring. Error: %{public}s", buf, 0x16u);
          }
          sqlite3_free(errmsg);
        }
        goto LABEL_5;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_73:
        LOBYTE(v7) = 0;
        return v7;
      }
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2082;
      *(void *)uint64_t v19 = errmsg;
      id v10 = MEMORY[0x1E4F14500];
      id v11 = "%{public}@: Could not create album tables. Error: %{public}s";
      uint32_t v12 = 22;
    }
    else
    {
      if (a3 <= 8)
      {
LABEL_5:
        errmsg = 0;
        if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "alter table Albums add column clientOrgKey text", 0, 0, &errmsg))
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v17 = self;
            __int16 v18 = 2082;
            *(void *)uint64_t v19 = errmsg;
            uint64_t v8 = MEMORY[0x1E4F14500];
            uint64_t v9 = "%{public}@: Could not add clientOrgKey column to Albums. Error: %{public}s";
LABEL_71:
            _os_log_error_impl(&dword_1DC434000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0x16u);
            goto LABEL_72;
          }
          goto LABEL_72;
        }
        [(MSASModelBase *)self dbQueueSetPersistentString:@"pendingMigration" forKey:@"migrationMarker"];
        goto LABEL_19;
      }
      if (a3 == 9)
      {
LABEL_19:
        LOBYTE(v7) = 1;
        return v7;
      }
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      *(_DWORD *)buf = 138543874;
      id v17 = self;
      __int16 v18 = 1024;
      *(_DWORD *)uint64_t v19 = a3;
      v19[2] = 1024;
      *(_DWORD *)&v19[3] = 9;
      id v10 = MEMORY[0x1E4F14500];
      id v11 = "%{public}@: Cannot migrate from database version %d to %d. Recreating database.";
      uint32_t v12 = 24;
    }
    _os_log_error_impl(&dword_1DC434000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
    goto LABEL_73;
  }
  return v7;
}

- (void)setMaxGroupedCallbackEventIdleInterval:(double)a3
{
  id v4 = [(MSASServerSideModel *)self commandQueue];
  [v4 setMaxGroupedCallbackEventIdleInterval:a3];
}

- (double)maxGroupedCallbackEventIdleInterval
{
  id v2 = [(MSASServerSideModel *)self commandQueue];
  [v2 maxGroupedCallbackEventIdleInterval];
  double v4 = v3;

  return v4;
}

- (void)setMaxGroupedCallbackEventStaleness:(double)a3
{
  id v4 = [(MSASServerSideModel *)self commandQueue];
  [v4 setMaxGroupedCallbackEventStaleness:a3];
}

- (double)maxGroupedCallbackEventStaleness
{
  id v2 = [(MSASServerSideModel *)self commandQueue];
  [v2 maxGroupedCallbackEventStaleness];
  double v4 = v3;

  return v4;
}

- (void)setMaxGroupedCallbackEventBatchCount:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSASServerSideModel *)self commandQueue];
  [v4 setMaxGroupedCallbackEventBatchCount:v3];
}

- (int)maxGroupedCallbackEventBatchCount
{
  id v2 = [(MSASServerSideModel *)self commandQueue];
  int v3 = [v2 maxGroupedCallbackEventBatchCount];

  return v3;
}

- (MSASServerSideModel)initWithPersonID:(id)a3 databasePath:(id)a4 eventQueue:(id)a5
{
  id v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MSASServerSideModel;
  uint64_t v9 = [(MSASModelBase *)&v24 initWithPersonID:a3 databasePath:a4 currentVersion:9];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("MSASServerSideModel member queue", MEMORY[0x1E4F14430]);
    memberQueue = v9->_memberQueue;
    v9->_memberQueue = (OS_dispatch_queue *)v10;

    if (v8)
    {
      uint32_t v12 = (OS_dispatch_queue *)v8;
      eventQueue = v9->_eventQueue;
      v9->_eventQueue = v12;
    }
    else
    {
      uint64_t v14 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      eventQueue = v9->_eventQueue;
      v9->_eventQueue = v14;
    }

    id v16 = objc_alloc_init(MSASServerSideModelGroupedCommandQueue);
    commandQueue = v9->_commandQueue;
    v9->_commandQueue = v16;

    [(MSASGroupedQueue *)v9->_commandQueue setModel:v9];
    __int16 v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v19 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke;
    v22[3] = &unk_1E6C3CFB0;
    id v23 = v9;
    id v20 = (id)[v18 addObserverForName:@"MSASServerSideConfigDidChangeNotification" object:0 queue:v19 usingBlock:v22];
  }
  return v9;
}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 userInfo];
  id v4 = [v3 objectForKey:@"personID"];

  id v5 = [*(id *)(a1 + 32) personID];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    BOOL v7 = [*(id *)(a1 + 32) eventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_2;
    block[3] = &unk_1E6C3DA38;
    id v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);
  }
}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_3;
  v6[3] = &unk_1E6C3CF88;
  id v7 = v2;
  [v7 eventQueuePerformBlockOnObservers:v6];
  int v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_4;
  v4[3] = &unk_1E6C3CF88;
  id v5 = v3;
  [v5 eventQueuePerformBlockOnObservers:v4];
}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModelDidReceiveNewServerSideConfiguration:*(void *)(a1 + 32) info:0];
  }
}

void __64__MSASServerSideModel_initWithPersonID_databasePath_eventQueue___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 MSASModelDidReceiveNewServerSideConfiguration:*(void *)(a1 + 32)];
  }
}

- (MSASServerSideModel)initWithPersonID:(id)a3 databasePath:(id)a4
{
  return [(MSASServerSideModel *)self initWithPersonID:a3 databasePath:a4 eventQueue:MEMORY[0x1E4F14428]];
}

- (void)releaseBusy
{
  id v3 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__MSASServerSideModel_releaseBusy__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __34__MSASServerSideModel_releaseBusy__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 releaseBusy];
}

- (void)retainBusy
{
  id v3 = [(MSASServerSideModel *)self eventQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MSASServerSideModel_retainBusy__block_invoke;
  block[3] = &unk_1E6C3DA38;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __33__MSASServerSideModel_retainBusy__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) daemon];
  [v1 retainBusy];
}

- (MSASServerSideModel)initWithPersonID:(id)a3
{
  id v4 = a3;
  id v5 = MSPathAlbumSharingModelForPersonID(v4);
  int v6 = [(MSASServerSideModel *)self initWithPersonID:v4 databasePath:v5 eventQueue:MEMORY[0x1E4F14428]];

  return v6;
}

- (void)performBlockOnObservers:(id)a3
{
  id v4 = a3;
  id v5 = [(MSASServerSideModel *)self eventQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__MSASServerSideModel_GroupedCommands__performBlockOnObservers___block_invoke;
  v7[3] = &unk_1E6C3DB00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__MSASServerSideModel_GroupedCommands__performBlockOnObservers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventQueuePerformBlockOnObservers:*(void *)(a1 + 40)];
}

- (void)removeCommandsUpToCommandIndex:(int64_t)a3
{
  id v5 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__MSASServerSideModel_GroupedCommands__removeCommandsUpToCommandIndex___block_invoke;
  v6[3] = &unk_1E6C3DAB0;
  void v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __71__MSASServerSideModel_GroupedCommands__removeCommandsUpToCommandIndex___block_invoke(uint64_t a1)
{
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"delete from GroupedCommand where rowid <= ?;"];
  uint64_t v3 = sqlite3_bind_int64(v2, 1, *(void *)(a1 + 40));
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    int v5 = 4885;
  }
  else
  {
    uint64_t v6 = sqlite3_step(v2);
    int v7 = v6;
    MSSqliteTrapForDBLockError(v6);
    if (v7 == 101) {
      goto LABEL_6;
    }
    int v5 = 4886;
  }
  MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), v5);
LABEL_6:
  if (v2)
  {
    sqlite3_reset(v2);
  }
}

- (id)nextCommandGroupMaxCount:(int)a3 outCommand:(id *)a4 outLastCommandIndex:(int64_t *)a5
{
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  BOOL v27 = __Block_byref_object_copy__6923;
  uint64_t v28 = __Block_byref_object_dispose__6924;
  id v29 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__6923;
  id v22 = __Block_byref_object_dispose__6924;
  id v23 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v9 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__MSASServerSideModel_GroupedCommands__nextCommandGroupMaxCount_outCommand_outLastCommandIndex___block_invoke;
  block[3] = &unk_1E6C3D4B8;
  int v13 = a3;
  void block[4] = self;
  void block[5] = &v18;
  void block[6] = &v24;
  block[7] = &v14;
  dispatch_sync(v9, block);

  if ([(id)v25[5] count])
  {
    if (a4) {
      *a4 = (id) v19[5];
    }
    if (a5) {
      *a5 = v15[3];
    }
    id v10 = (id)v25[5];
  }
  else
  {
    id v10 = 0;
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __96__MSASServerSideModel_GroupedCommands__nextCommandGroupMaxCount_outCommand_outLastCommandIndex___block_invoke(uint64_t a1)
{
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select rowid, command, invariant, variant from GroupedCommand order by rowid asc limit ?;"];
  uint64_t v3 = sqlite3_bind_int(v2, 1, *(_DWORD *)(a1 + 64));
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (!v4)
  {
    char v5 = 0;
    id v21 = 0;
    while (1)
    {
      if (v5) {
        goto LABEL_3;
      }
      int v6 = sqlite3_step(v2);
      if (v6 != 101)
      {
        if (v6 == 100)
        {
          sqlite3_int64 v7 = sqlite3_column_int64(v2, 0);
          id v8 = MSSqliteStringFromStatementColumn(v2, 1);
          id v9 = MSSqliteObjectFromStatementColumn(v2, 2);
          id v10 = MSSqliteObjectFromStatementColumn(v2, 3);
          uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v13 = *(void *)(v11 + 40);
          uint32_t v12 = (id *)(v11 + 40);
          if (!v13) {
            objc_storeStrong(v12, v8);
          }
          uint64_t v14 = +[MSASEnqueuedCommand commandwithCommand:v8 variantParam:v10 invariantParam:v9];
          id v15 = v21;
          if (v21 && (v16 = [v21 canBeGroupedWithCommand:v14], id v15 = v21, !v16))
          {
            char v19 = 0;
            int v18 = 2;
          }
          else
          {
            id v22 = v15;
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
            id v17 = v14;

            int v18 = 0;
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
            char v19 = 1;
            id v21 = v17;
          }

          char v20 = 0;
          char v5 = 0;
          if ((v19 & 1) == 0) {
            goto LABEL_20;
          }
          goto LABEL_19;
        }
        MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 4865);
      }
      char v20 = 1;
LABEL_19:
      int v18 = 0;
      char v5 = v20;
LABEL_20:
      if (v18) {
        goto LABEL_3;
      }
    }
  }
  MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 4843);
  id v21 = 0;
LABEL_3:
  if (v2) {
    sqlite3_reset(v2);
  }
}

- (int)commandCount
{
  id v2 = self;
  uint64_t v6 = 0;
  sqlite3_int64 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__MSASServerSideModel_GroupedCommands__commandCount__block_invoke;
  v5[3] = &unk_1E6C3DA60;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(v3, v5);

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __52__MSASServerSideModel_GroupedCommands__commandCount__block_invoke(uint64_t a1)
{
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select count(*) from GroupedCommand;"];
  int v3 = sqlite3_step(v2);
  if (v3 != 101)
  {
    if (v3 != 100)
    {
      MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 4827);
      if (!v2) {
        return;
      }
      goto LABEL_5;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(v2, 0);
  }
  if (!v2) {
    return;
  }
LABEL_5:
  sqlite3_reset(v2);
}

- (void)enqueueCommand:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 command];

  if (v5)
  {
    uint64_t v6 = [(MSASModelBase *)self dbQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__MSASServerSideModel_GroupedCommands__enqueueCommand___block_invoke;
    v7[3] = &unk_1E6C3DB28;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Attempting to enqueue a command without a command string. Rejected and ignored.", buf, 0xCu);
  }
}

void __55__MSASServerSideModel_GroupedCommands__enqueueCommand___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"insert or rollback into GroupedCommand (command, invariant, variant) values (?, ?, ?);"];
  int v3 = [*(id *)(a1 + 40) command];
  MSSqliteBindStringOrNull(v2, 1, v3);

  id v4 = (void *)MEMORY[0x1E4F28DB0];
  char v5 = [*(id *)(a1 + 40) invariantParam];
  id v21 = 0;
  uint64_t v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v21];
  id v7 = v21;

  if (v6)
  {
    MSSqliteBindDataOrNull(v2, 2, v6);
  }
  else
  {
    id v8 = NSString;
    int v9 = [v7 userInfo];
    id v10 = [v8 stringWithFormat:@"Failed to archive an invariantParam object. Error: %@ Info: %@", v7, v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v10;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    sqlite3_bind_null(v2, 2);
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F28DB0];
  uint32_t v12 = [*(id *)(a1 + 40) variantParam];
  id v20 = v7;
  uint64_t v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v20];
  id v14 = v20;

  if (v13)
  {
    MSSqliteBindDataOrNull(v2, 3, v13);
  }
  else
  {
    id v15 = NSString;
    int v16 = [v14 userInfo];
    id v17 = [v15 stringWithFormat:@"Failed to archive an variantParam object. Error: %@ Info: %@", v14, v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v17;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }

    sqlite3_bind_null(v2, 3);
  }
  uint64_t v18 = sqlite3_step(v2);
  int v19 = v18;
  MSSqliteTrapForDBLockError(v18);
  if (v19 != 101) {
    MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 4813);
  }
  if (v2) {
    sqlite3_reset(v2);
  }
}

@end