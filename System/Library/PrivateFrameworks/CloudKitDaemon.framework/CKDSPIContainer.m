@interface CKDSPIContainer
- (void)clearAssetCacheWithDatabaseScope:(int64_t)a3 completionHandler:(id)a4;
- (void)clearAuthTokensWithRecordID:(id)a3 databaseScope:(int64_t)a4;
- (void)clearCachesForRecordWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5;
- (void)clearCachesForZoneWithZoneID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5;
- (void)clearCachesWithOptions:(unint64_t)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5;
- (void)clearContainerFromMetadataCache;
- (void)clearInvalidatedPCSCacheEntriesIfNeeded;
- (void)clearPILSCacheForLookupInfos:(id)a3;
- (void)clearRecordCacheWithDatabaseScope:(int64_t)a3;
- (void)countAssetCacheItemsWithDatabaseScope:(int64_t)a3 completionHandler:(id)a4;
- (void)currentDeviceIDWithCompletionHandler:(id)a3;
- (void)decryptPersonalInfoOnShare:(id)a3 completionHandler:(id)a4;
- (void)dropDetachedContainersWithCompletionHandler:(id)a3;
- (void)fetchPCSFromCacheForRecordWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchPCSFromCacheForShareWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchPCSFromCacheForZoneWithZoneID:(id)a3 databaseScope:(int64_t)a4 localCacheOnly:(BOOL)a5 completionHandler:(id)a6;
- (void)frameworkCachesDirectoryWithCompletionHandler:(id)a3;
- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3;
- (void)getNewWebSharingIdentityWithCompletionHandler:(id)a3;
- (void)getOutstandingOperationCountWithCompletionHandler:(id)a3;
- (void)getRecordPCSDiagnosticsForZonesWithCompletionHandler:(id)a3;
- (void)getRegisteredItemCountWithCompletionHandler:(id)a3;
- (void)globalPerUserBoundaryKeyWithCompletionHandler:(id)a3;
- (void)lastKnownDeviceCountWithCompletionHandler:(id)a3;
- (void)performAggregateZonePCSOperation:(id)a3 withBlock:(id)a4;
- (void)performArchiveRecordsOperation:(id)a3 withBlock:(id)a4;
- (void)performCompleteParticipantVettingOperation:(id)a3 withBlock:(id)a4;
- (void)performDeserializeRecordModificationsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchArchivedRecordsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchMergeableDeltaMetadataOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchMergeableDeltasOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchRecordVersionsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchRegisteredBundleIDsOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchShareParticipantKeyOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchUserQuotaOperation:(id)a3 withBlock:(id)a4;
- (void)performFetchWhitelistedBundleIDsOperation:(id)a3 withBlock:(id)a4;
- (void)performInitiateParticipantVettingOperation:(id)a3 withBlock:(id)a4;
- (void)performMarkAssetBrokenOperation:(id)a3 withBlock:(id)a4;
- (void)performModifyRecordAccessOperation:(id)a3 withBlock:(id)a4;
- (void)performModifyWebSharingOperation:(id)a3 withBlock:(id)a4;
- (void)performPublishAssetsOperation:(id)a3 withBlock:(id)a4;
- (void)performRepairAssetsOperation:(id)a3 withBlock:(id)a4;
- (void)performReplaceMergeableDeltasOperation:(id)a3 withBlock:(id)a4;
- (void)performSerializeRecordModificationsOperation:(id)a3 withBlock:(id)a4;
- (void)performUploadMergeableDeltasOperation:(id)a3 withBlock:(id)a4;
- (void)representativeDataclassEnabledWithCompletionHandler:(id)a3;
- (void)resetAllApplicationPermissionsWithCompletionHandler:(id)a3;
- (void)serverEnvironmentWithCompletionHandler:(id)a3;
- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3;
- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4 completionHandler:(id)a5;
- (void)setFakeResponseOperationResult:(id)a3 forNextRequestOfClassName:(id)a4 forItemID:(id)a5 withLifetime:(int)a6 completionHandler:(id)a7;
- (void)showAssetCacheWithDatabaseScope:(int64_t)a3;
- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4;
- (void)tossConfigWithCompletionHandler:(id)a3;
@end

@implementation CKDSPIContainer

- (void)frameworkCachesDirectoryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D75708;
  v10[3] = &unk_1E64F0790;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)performFetchRecordVersionsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchRecordVersionsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D758E4;
  v16[3] = &unk_1E64F1628;
  objc_copyWeak(&v18, &location);
  id v13 = v6;
  id v17 = v13;
  objc_msgSend_setRecordVersionFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)performFetchArchivedRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchArchivedRecordsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4D75D9C;
  v27[3] = &unk_1E64F1388;
  objc_copyWeak(&v29, &location);
  id v13 = v6;
  id v28 = v13;
  objc_msgSend_setRecordFetchedBlock_(v12, v14, (uint64_t)v27);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1C4D75F6C;
  v24[3] = &unk_1E64F1650;
  id v15 = v13;
  id v25 = v15;
  objc_copyWeak(&v26, &location);
  objc_msgSend_setServerChangeTokenUpdatedBlock_(v12, v16, (uint64_t)v24);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = sub_1C4D76104;
  v22 = &unk_1E64F09E0;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setCompletionBlock_(v12, v17, (uint64_t)&v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v12, v7, v19, v20, v21, v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v26);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (void)performArchiveRecordsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDArchiveRecordsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D762B4;
  v16[3] = &unk_1E64F1678;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setRecordArchivedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performPublishAssetsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDPublishAssetsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D76568;
  v16[3] = &unk_1E64F16A0;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAssetPublishedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performRepairAssetsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDRepairAssetsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D7684C;
  v16[3] = &unk_1E64F16C8;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAssetOrPackageRepairedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performMarkAssetBrokenOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDMarkAssetBrokenOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D76B08;
  v16[3] = &unk_1E64F1678;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setAssetOrPackageMarkedBrokenBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performModifyWebSharingOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDModifyWebSharingOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D76E48;
  v21[3] = &unk_1E64F16F0;
  id v13 = v6;
  id v22 = v13;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setRecordWebSharedBlock_(v12, v14, (uint64_t)v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D76FD8;
  v18[3] = &unk_1E64F1678;
  id v15 = v13;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  objc_msgSend_setRecordWebUnsharedBlock_(v12, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v12, v7);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)getNewWebSharingIdentityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D771EC;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)getNewWebSharingIdentityDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4D77564;
  v7[3] = &unk_1E64F1718;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_getNewWebSharingIdentityWithCompletionHandler_(self, v6, (uint64_t)v7);
}

- (void)performSerializeRecordModificationsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDSerializeRecordModificationsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = sub_1C4D77738;
  id v18 = &unk_1E64F1740;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setSerializeCompletionBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performDeserializeRecordModificationsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDDeserializeRecordModificationsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = sub_1C4D77900;
  id v18 = &unk_1E64F1768;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setDeserializeCompletionBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performModifyRecordAccessOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDModifyRecordAccessOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D77B7C;
  v21[3] = &unk_1E64F16F0;
  id v13 = v6;
  id v22 = v13;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setAccessWasGrantedBlock_(v12, v14, (uint64_t)v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D77D0C;
  v18[3] = &unk_1E64F1678;
  id v15 = v13;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  objc_msgSend_setAccessWasRevokedBlock_(v12, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v12, v7);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)performCompleteParticipantVettingOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDCompleteParticipantVettingOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1C4D7804C;
  v21[3] = &unk_1E64F1790;
  id v13 = v6;
  id v22 = v13;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setVerifyProgressURLReconstructedBlock_(v12, v14, (uint64_t)v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D78190;
  v18[3] = &unk_1E64F17B8;
  id v15 = v13;
  id v19 = v15;
  objc_copyWeak(&v20, &location);
  objc_msgSend_setVerifyProgressShareMetadataFetchedBlock_(v12, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v12, v7);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)performFetchShareParticipantKeyOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchShareParticipantKeyOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D78428;
  v16[3] = &unk_1E64F17E0;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setShareParticipantKeyFetchedBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)decryptPersonalInfoOnShare:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10 = objc_msgSend_uncancellableOperationQueue(self, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D78674;
  v14[3] = &unk_1E64F1830;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v11 = v6;
  id v12 = v7;
  objc_msgSend_addOperationWithBlock_(v10, v13, (uint64_t)v14);
}

- (void)performInitiateParticipantVettingOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDInitiateParticipantVettingOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D78BE0;
  v16[3] = &unk_1E64F1858;
  id v13 = v6;
  id v17 = v13;
  objc_copyWeak(&v18, &location);
  objc_msgSend_setParticipantVettingProgressBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&location);
}

- (void)performFetchUserQuotaOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchUserQuotaOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D78E58;
  v14[3] = &unk_1E64F09E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v13, (uint64_t)v12, v7, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)performFetchMergeableDeltasOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchMergeableDeltasOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = sub_1C4D7911C;
  id v18 = &unk_1E64F1880;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setDeltasFetchedBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performFetchMergeableDeltaMetadataOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchMergeableDeltaMetadataOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = sub_1C4D793D4;
  id v18 = &unk_1E64F1880;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setMetadataFetchedBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performReplaceMergeableDeltasOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDReplaceMergeableDeltasOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = sub_1C4D7968C;
  id v18 = &unk_1E64F18A8;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setPerReplacementCompletionBlock_(v12, v13, (uint64_t)&v15);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v14, (uint64_t)v12, v7, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performUploadMergeableDeltasOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDUploadMergeableDeltasOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D799A8;
  v18[3] = &unk_1E64F18D0;
  objc_copyWeak(&v19, &location);
  objc_msgSend_setUploadDeltaCompletionBlock_(v12, v13, (uint64_t)v18);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D79B60;
  v16[3] = &unk_1E64F18A8;
  objc_copyWeak(&v17, &location);
  objc_msgSend_setReplaceDeltasRequestCompletionBlock_(v12, v14, (uint64_t)v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, v7);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performFetchWhitelistedBundleIDsOperation:(id)a3 withBlock:(id)a4
{
}

- (void)performFetchRegisteredBundleIDsOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [CKDFetchRegisteredBundleIDsOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(&location, v12);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D79DFC;
  v14[3] = &unk_1E64F09E0;
  objc_copyWeak(&v15, &location);
  objc_msgSend_performOperation_initialMessageReplyBlock_customCompletionBlock_(self, v13, (uint64_t)v12, v7, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)serverPreferredPushEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D7A048;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)serverEnvironmentWithCompletionHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1A208];
  id v5 = a3;
  objc_msgSend_defaultConvenienceOperationConfiguration(v4, v6, v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v8, v9, (uint64_t)v16);
  v10 = [CKDOperationInfoHolderOperation alloc];
  id v12 = objc_msgSend_containerForOperationInfo_(self, v11, (uint64_t)v8);
  v14 = objc_msgSend_initWithOperationInfo_container_(v10, v13, (uint64_t)v8, v12);

  objc_msgSend_fetchServerEnvironmentForOperation_withCompletionHandler_(self, v15, (uint64_t)v14, v5);
}

- (void)currentDeviceIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D7A58C;
  v10[3] = &unk_1E64F0790;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)globalPerUserBoundaryKeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D7A6B8;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)performAggregateZonePCSOperation:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [CKDAggregateZonePCSOperation alloc];
  v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v7);
  id v13 = (id)objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v7, v10);

  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v12, (uint64_t)v13, v6);
}

- (void)countAssetCacheItemsWithDatabaseScope:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v9 = objc_msgSend_uncancellableOperationQueue(self, v7, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D7ADCC;
  v12[3] = &unk_1E64F1970;
  id v13 = v6;
  int64_t v14 = a3;
  v12[4] = self;
  id v10 = v6;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v12);
}

- (void)clearAssetCacheWithDatabaseScope:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v8 = objc_msgSend_uncancellableOperationQueue(self, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4D7AEE0;
  v11[3] = &unk_1E64F0E18;
  v11[4] = self;
  id v12 = v5;
  id v9 = v5;
  objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);
}

- (void)showAssetCacheWithDatabaseScope:(int64_t)a3
{
  id v4 = objc_msgSend_uncancellableOperationQueue(self, a2, a3);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1C4D7AFC0;
  v6[3] = &unk_1E64F05C8;
  v6[4] = self;
  objc_msgSend_addOperationWithBlock_(v4, v5, (uint64_t)v6);
}

- (void)clearRecordCacheWithDatabaseScope:(int64_t)a3
{
  id v5 = objc_msgSend_uncancellableOperationQueue(self, a2, a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1C4D7B05C;
  v7[3] = &unk_1E64F1998;
  void v7[4] = self;
  v7[5] = a3;
  objc_msgSend_addOperationWithBlock_(v5, v6, (uint64_t)v7);
}

- (void)clearAuthTokensWithRecordID:(id)a3 databaseScope:(int64_t)a4
{
  id v6 = a3;
  id v9 = objc_msgSend_uncancellableOperationQueue(self, v7, v8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D7B26C;
  v12[3] = &unk_1E64F19C0;
  id v13 = v6;
  int64_t v14 = self;
  int64_t v15 = a4;
  id v10 = v6;
  objc_msgSend_addOperationWithBlock_(v9, v11, (uint64_t)v12);
}

- (void)clearCachesWithOptions:(unint64_t)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v11 = objc_msgSend_uncancellableOperationQueue(self, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4D7B42C;
  v14[3] = &unk_1E64F19E8;
  unint64_t v16 = a3;
  int64_t v17 = a4;
  void v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  objc_msgSend_addOperationWithBlock_(v11, v13, (uint64_t)v14);
}

- (void)clearCachesForRecordWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D7B894;
  v16[3] = &unk_1E64F1A10;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);
}

- (void)clearCachesForZoneWithZoneID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D7B9F4;
  v16[3] = &unk_1E64F1A10;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);
}

- (void)fetchPCSFromCacheForZoneWithZoneID:(id)a3 databaseScope:(int64_t)a4 localCacheOnly:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v14 = objc_msgSend_uncancellableOperationQueue(self, v12, v13);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D7BB3C;
  v18[3] = &unk_1E64F1A38;
  void v18[4] = self;
  id v19 = v10;
  BOOL v22 = a5;
  id v20 = v11;
  int64_t v21 = a4;
  id v15 = v11;
  id v16 = v10;
  objc_msgSend_addOperationWithBlock_(v14, v17, (uint64_t)v18);
}

- (void)fetchPCSFromCacheForShareWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D7BD08;
  v16[3] = &unk_1E64F1A10;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);
}

- (void)fetchPCSFromCacheForRecordWithRecordID:(id)a3 databaseScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v12 = objc_msgSend_uncancellableOperationQueue(self, v10, v11);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1C4D7BED0;
  v16[3] = &unk_1E64F1A10;
  void v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  int64_t v19 = a4;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend_addOperationWithBlock_(v12, v15, (uint64_t)v16);
}

- (void)clearInvalidatedPCSCacheEntriesIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    id v8 = v3;
    uint64_t v11 = objc_msgSend_containerID(self, v9, v10);
    *(_DWORD *)buf = 138412290;
    id v14 = v11;
    _os_log_debug_impl(&dword_1C4CFF000, v8, OS_LOG_TYPE_DEBUG, "Clearing the persisted PCS cache for container %@", buf, 0xCu);
  }
  id v6 = objc_msgSend_uncancellableOperationQueue(self, v4, v5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4D7C118;
  v12[3] = &unk_1E64F05C8;
  void v12[4] = self;
  objc_msgSend_addOperationWithBlock_(v6, v7, (uint64_t)v12);
}

- (void)getOutstandingOperationCountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D7C24C;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)getRegisteredItemCountWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D7C5F8;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)dropDetachedContainersWithCompletionHandler:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  uint64_t v6 = objc_msgSend_sharedDetachedContainers(CKDContainer, v4, v5);
  id v9 = objc_msgSend_allObjects(v6, v7, v8);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v10 = v9;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v50, v54, 16);
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = *(void *)v51;
    uint64_t v45 = *(void *)v51;
    do
    {
      uint64_t v17 = 0;
      uint64_t v47 = v15;
      do
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v10);
        }
        id v18 = *(void **)(*((void *)&v50 + 1) + 8 * v17);
        int64_t v19 = objc_msgSend_appContainerTuple(v18, v13, v14);
        BOOL v22 = objc_msgSend_appContainerTuple(self, v20, v21);
        if (objc_msgSend_isEqual_(v19, v23, (uint64_t)v22))
        {
          id v26 = objc_msgSend_entitlements(v18, v24, v25);
          objc_msgSend_entitlements(self, v27, v28);
          v30 = id v29 = self;
          if (objc_msgSend_isEqual_(v26, v31, (uint64_t)v30))
          {
            objc_msgSend_options(v18, v32, v33);
            v35 = id v34 = v10;
            v38 = objc_msgSend_options(self, v36, v37);
            int isEqual = objc_msgSend_isEqual_(v35, v39, (uint64_t)v38);

            id v10 = v34;
            uint64_t v16 = v45;

            self = v29;
            uint64_t v15 = v47;
            if (!isEqual) {
              goto LABEL_13;
            }
            int64_t v19 = objc_msgSend_sharedDetachedContainers(CKDContainer, v13, v14);
            objc_msgSend_removeObject_(v19, v40, (uint64_t)v18);
          }
          else
          {

            uint64_t v15 = v47;
          }
        }
        else
        {
        }
LABEL_13:
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v50, v54, 16);
    }
    while (v15);
  }

  if (v44)
  {
    v43 = objc_msgSend_cancellationQueue(self, v41, v42);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4D7C9EC;
    block[3] = &unk_1E64F0A80;
    id v49 = v44;
    dispatch_async(v43, block);
  }
}

- (void)resetAllApplicationPermissionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v5, v6);
  uint64_t v8 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v8, v9, (uint64_t)v7);
  id v10 = [CKDResetUserPrivacySettingsOperation alloc];
  uint64_t v12 = objc_msgSend_containerForOperationInfo_(self, v11, (uint64_t)v8);
  uint64_t v14 = objc_msgSend_initWithOperationInfo_container_(v10, v13, (uint64_t)v8, v12);

  objc_initWeak(&location, v14);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1C4D7CB7C;
  v18[3] = &unk_1E64F0768;
  objc_copyWeak(&v20, &location);
  id v15 = v4;
  id v19 = v15;
  objc_msgSend_setCompletionBlock_(v14, v16, (uint64_t)v18);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v17, (uint64_t)v14, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)statusGroupsForApplicationPermission:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v8 = objc_msgSend_defaultConvenienceOperationConfiguration(MEMORY[0x1E4F1A208], v6, v7);
  id v9 = objc_opt_new();
  objc_msgSend_setResolvedConfiguration_(v9, v10, (uint64_t)v8);
  id v11 = [CKDBatchFetchUserPrivacySettingsOperation alloc];
  id v13 = objc_msgSend_containerForOperationInfo_(self, v12, (uint64_t)v9);
  id v15 = objc_msgSend_initWithOperationInfo_container_(v11, v14, (uint64_t)v9, v13);

  objc_initWeak(&location, v15);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4D7CDE0;
  v19[3] = &unk_1E64F0768;
  objc_copyWeak(&v21, &location);
  id v16 = v5;
  id v20 = v16;
  objc_msgSend_setCompletionBlock_(v15, v17, (uint64_t)v19);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v18, (uint64_t)v15, 0);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)clearContainerFromMetadataCache
{
  objc_msgSend_deviceContext(self, a2, v2);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_metadataCache(v11, v4, v5);
  id v9 = objc_msgSend_containerID(self, v7, v8);
  objc_msgSend_removeContainerID_(v6, v10, (uint64_t)v9);
}

- (void)clearPILSCacheForLookupInfos:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_backgroundPublicIdentityLookupService(self, v5, v6);
  objc_msgSend_removeCacheForLookupInfos_(v7, v8, (uint64_t)v4);

  objc_msgSend_foregroundPublicIdentityLookupService(self, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeCacheForLookupInfos_(v12, v11, (uint64_t)v4);
}

- (void)representativeDataclassEnabledWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_uncancellableOperationQueue(self, v5, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4D7D06C;
  v10[3] = &unk_1E64F0E18;
  v10[4] = self;
  id v11 = v4;
  id v8 = v4;
  objc_msgSend_addOperationWithBlock_(v7, v9, (uint64_t)v10);
}

- (void)getRecordPCSDiagnosticsForZonesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_INFO, "Getting Record PCS diagnostics for all zones", (uint8_t *)buf, 2u);
  }
  uint64_t v6 = objc_opt_new();
  objc_msgSend_setDatabaseScope_(v6, v7, 2);
  id v8 = [CKDFetchRecordPCSDiagnosticsOperation alloc];
  uint64_t v10 = objc_msgSend_containerForOperationInfo_(self, v9, (uint64_t)v6);
  id v12 = objc_msgSend_initWithOperationInfo_container_(v8, v11, (uint64_t)v6, v10);

  objc_initWeak(buf, v12);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = sub_1C4D7D364;
  id v19 = &unk_1E64F1A88;
  id v13 = v4;
  id v20 = v13;
  objc_copyWeak(&v21, buf);
  objc_msgSend_setCompletionBlock_(v12, v14, (uint64_t)&v16);
  objc_msgSend_performOperation_initialMessageReplyBlock_(self, v15, (uint64_t)v12, 0, v16, v17, v18, v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(buf);
}

- (void)tossConfigWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v5 = *MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C4CFF000, v5, OS_LOG_TYPE_INFO, "Tossing client configuration", buf, 2u);
  }
  id v8 = objc_msgSend_uncancellableOperationQueue(self, v6, v7);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1C4D7D4F8;
  v11[3] = &unk_1E64F0E18;
  v11[4] = self;
  id v12 = v4;
  id v9 = v4;
  objc_msgSend_addOperationWithBlock_(v8, v10, (uint64_t)v11);
}

- (void)lastKnownDeviceCountWithCompletionHandler:(id)a3
{
  id v11 = (void (**)(id, uint64_t))a3;
  uint64_t v6 = objc_msgSend_accountOrNil(self, v4, v5);
  id v9 = v6;
  if (v6) {
    uint64_t KnownDeviceCount = objc_msgSend_lastKnownDeviceCount(v6, v7, v8);
  }
  else {
    uint64_t KnownDeviceCount = 0;
  }
  v11[2](v11, KnownDeviceCount);
}

- (void)setFakeError:(id)a3 forNextRequestOfClassName:(id)a4 completionHandler:(id)a5
{
  id v35 = a4;
  id v8 = a5;
  id v9 = a3;
  id v12 = objc_msgSend_fakeErrorsByClassName(self, v10, v11);

  if (!v12)
  {
    id v15 = objc_opt_new();
    objc_msgSend_setFakeErrorsByClassName_(self, v16, (uint64_t)v15);
  }
  uint64_t v17 = objc_msgSend_fakeErrorsByClassName(self, v13, v14);
  id v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v35);

  if (!v19)
  {
    BOOL v22 = objc_opt_new();
    uint64_t v25 = objc_msgSend_fakeErrorsByClassName(self, v23, v24);
    objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v22, v35);
  }
  v27 = objc_msgSend_fakeErrorsByClassName(self, v20, v21);
  id v29 = objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)v35);
  id v30 = objc_alloc(MEMORY[0x1E4F1A470]);
  v31 = _Block_copy(v8);

  uint64_t v33 = objc_msgSend_initWithObject1_object2_(v30, v32, (uint64_t)v9, v31);
  objc_msgSend_addObject_(v29, v34, (uint64_t)v33);
}

- (void)setFakeResponseOperationResult:(id)a3 forNextRequestOfClassName:(id)a4 forItemID:(id)a5 withLifetime:(int)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v54 = a3;
  id v13 = a4;
  id v14 = a5;
  id v17 = a7;
  if ((int)v8 <= 0)
  {
    long long v52 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v15, v16);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v52, v53, (uint64_t)a2, self, @"CKDContainer.m", 4609, @"Invalid fake response lifetime");
  }
  id v18 = objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v15, v16);

  if (!v18)
  {
    uint64_t v21 = objc_opt_new();
    objc_msgSend_setFakeResponseOperationResultByClassNameByItemID_(self, v22, (uint64_t)v21);
  }
  id v23 = objc_msgSend_fakeResponseOperationLifetimeByClassName(self, v19, v20);

  if (!v23)
  {
    id v26 = objc_opt_new();
    objc_msgSend_setFakeResponseOperationLifetimeByClassName_(self, v27, (uint64_t)v26);
  }
  uint64_t v28 = objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v24, v25);
  id v30 = objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)v13);

  if (!v30)
  {
    v31 = objc_opt_new();
    id v34 = objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v32, v33);
    objc_msgSend_setObject_forKeyedSubscript_(v34, v35, (uint64_t)v31, v13);
  }
  id v36 = objc_alloc(MEMORY[0x1E4F1A470]);
  uint64_t v37 = _Block_copy(v17);
  v39 = objc_msgSend_initWithObject1_object2_(v36, v38, (uint64_t)v54, v37);
  uint64_t v42 = objc_msgSend_fakeResponseOperationResultByClassNameByItemID(self, v40, v41);
  id v44 = objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)v13);
  objc_msgSend_setObject_forKeyedSubscript_(v44, v45, (uint64_t)v39, v14);

  uint64_t v47 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v46, v8);
  long long v50 = objc_msgSend_fakeResponseOperationLifetimeByClassName(self, v48, v49);
  objc_msgSend_setObject_forKeyedSubscript_(v50, v51, (uint64_t)v47, v13);
}

@end