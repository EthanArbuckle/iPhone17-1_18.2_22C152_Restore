@interface CPLCKBatchUploadPlanner
- (BOOL)_shouldUpdateKeyOnCKRecord:(id)a3;
- (BOOL)_shouldUpdateKeyOnSharedCKRecord:(id)a3;
- (BOOL)didFetchPrivateCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5;
- (BOOL)didFetchSharedCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5;
- (BOOL)planRecordChangeUpload:(id)a3 error:(id *)a4;
- (CKRecordID)currentUserRecordID;
- (CPLCKBatchUploadPlanner)initWithScopeProvider:(id)a3 destinationZoneIdentification:(id)a4 sharedZoneIdentification:(id)a5 propertyMapping:(id)a6 currentUserRecordID:(id)a7 targetMapping:(id)a8 fetchCache:(id)a9 cplEnabledDate:(id)a10;
- (CPLCKRecordFetchCache)fetchCache;
- (CPLCKRecordPropertyMapping)propertyMapping;
- (CPLCKRecordRequestor)recordRequestor;
- (CPLCKSharePlan)sharePlan;
- (CPLCKUnsharePlan)unsharePlan;
- (CPLCloudKitScopeProvider)scopeProvider;
- (CPLCloudKitUploadMetric)metric;
- (CPLCloudKitZoneIdentification)destinationZoneIdentification;
- (CPLCloudKitZoneIdentification)sharedZoneIdentification;
- (CPLFingerprintContext)fingerprintContext;
- (CPLRecordTargetMapping)targetMapping;
- (NSArray)ckRecordIDsToDelete;
- (NSArray)ckRecordsToUpload;
- (NSArray)requestedPrivateCKRecordIDs;
- (NSArray)requestedSharedCKRecordIDs;
- (NSArray)sharedCKRecordIDsToDelete;
- (NSArray)sharedCKRecordsToUpload;
- (NSDate)cplEnabledDate;
- (double)planProgess;
- (double)totalDurationOfUpload;
- (double)uploadedSize;
- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (id)_shareTodoForRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)progressHandler;
- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)willUploadRecords;
- (id)willUploadSharedRecords;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (void)_addCKRecordIDForResourcesUploadProgressTracking:(id)a3 size:(double)a4;
- (void)_addRecordWithScopedIdentifierToShareTodos:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6 force:(BOOL)a7;
- (void)_addRecordWithScopedIdentifierToUnshareTodos:(id)a3 recordClass:(Class)a4 target:(id)a5;
- (void)_copyPrivateMasterWithScopedIdentifier:(id)a3 masterTarget:(id)a4 uploadIndex:(unint64_t)a5 reason:(id)a6;
- (void)_deleteRecord;
- (void)_deleteSharedRecord;
- (void)_dontUnshareRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4;
- (void)_noteMasterWillBeUploadedToPrivateZone:(id)a3;
- (void)_noteMasterWillBeUploadedToSharedZone:(id)a3;
- (void)_noteRecordWithScopedIdentifierWillMoveToSplitState:(id)a3;
- (void)_resetPlannerState;
- (void)_willUpdateCKRecordWithID:(id)a3 onBehalfOfRecordWithScopedIdentifier:(id)a4;
- (void)deleteCKRecordWithRecordID:(id)a3;
- (void)deleteSharedCKRecordWithRecordID:(id)a3;
- (void)didFinishUploadOfRecordsWithError:(id)a3;
- (void)didFinishUploadOfSharedRecordsWithError:(id)a3;
- (void)requestPrivateCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5;
- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6;
- (void)requestSharedCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5;
- (void)setCKAsset:(id)a3 forKey:(id)a4;
- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5;
- (void)setCplEnabledDate:(id)a3;
- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5;
- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4;
- (void)setMetric:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setProgressHandler:(id)a3;
- (void)setRecordRequestor:(id)a3;
- (void)updatePrivateRecord:(id)a3 sharedToRecordWithID:(id)a4;
- (void)updateTargetMappingAfterUpload;
- (void)uploadCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5;
- (void)uploadOfRecordID:(id)a3 didProgress:(double)a4;
- (void)uploadSharedCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5;
@end

@implementation CPLCKBatchUploadPlanner

- (CPLCKBatchUploadPlanner)initWithScopeProvider:(id)a3 destinationZoneIdentification:(id)a4 sharedZoneIdentification:(id)a5 propertyMapping:(id)a6 currentUserRecordID:(id)a7 targetMapping:(id)a8 fetchCache:(id)a9 cplEnabledDate:(id)a10
{
  id v29 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v17 = a9;
  id v18 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CPLCKBatchUploadPlanner;
  v19 = [(CPLCKBatchUploadPlanner *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_scopeProvider, a3);
    objc_storeStrong((id *)&v20->_destinationZoneIdentification, a4);
    objc_storeStrong((id *)&v20->_sharedZoneIdentification, a5);
    objc_storeStrong((id *)&v20->_propertyMapping, a6);
    objc_storeStrong((id *)&v20->_currentUserRecordID, a7);
    objc_storeStrong((id *)&v20->_targetMapping, a8);
    if (v17) {
      v21 = (CPLCKRecordFetchCache *)v17;
    }
    else {
      v21 = objc_alloc_init(CPLCKRecordFetchCache);
    }
    fetchCache = v20->_fetchCache;
    v20->_fetchCache = v21;

    objc_storeStrong((id *)&v20->_cplEnabledDate, a10);
  }

  return v20;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)[(CPLCloudKitScopeProvider *)self->_scopeProvider fingerprintContext];
}

- (void)_noteRecordWithScopedIdentifierWillMoveToSplitState:(id)a3
{
  id v4 = a3;
  scopedIdentifiersMovingToSplitState = self->_scopedIdentifiersMovingToSplitState;
  id v8 = v4;
  if (!scopedIdentifiersMovingToSplitState)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_scopedIdentifiersMovingToSplitState;
    self->_scopedIdentifiersMovingToSplitState = v6;

    id v4 = v8;
    scopedIdentifiersMovingToSplitState = self->_scopedIdentifiersMovingToSplitState;
  }
  [(NSMutableSet *)scopedIdentifiersMovingToSplitState addObject:v4];
}

- (void)_willUpdateCKRecordWithID:(id)a3 onBehalfOfRecordWithScopedIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_100038278();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "If necessary, will update %@ on behalf of %@", (uint8_t *)&v17, 0x16u);
    }
  }
  ckRecordIDToScopedIdentifier = self->_ckRecordIDToScopedIdentifier;
  if (!ckRecordIDToScopedIdentifier)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v11 = self->_ckRecordIDToScopedIdentifier;
    self->_ckRecordIDToScopedIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ckRecordIDToRejectedScopedIdentifier = self->_ckRecordIDToRejectedScopedIdentifier;
    self->_ckRecordIDToRejectedScopedIdentifier = v12;

    ckRecordIDToScopedIdentifier = self->_ckRecordIDToScopedIdentifier;
  }
  [(NSMutableDictionary *)ckRecordIDToScopedIdentifier setObject:v7 forKeyedSubscript:v6];
  v14 = [(NSMutableDictionary *)self->_ckRecordIDToRejectedScopedIdentifier objectForKeyedSubscript:v6];

  if (!v14)
  {
    currentRecordChange = self->_currentRecordChange;
    if (currentRecordChange)
    {
      v16 = [(CPLRecordChange *)currentRecordChange scopedIdentifier];
      [(NSMutableDictionary *)self->_ckRecordIDToRejectedScopedIdentifier setObject:v16 forKeyedSubscript:v6];
    }
    else
    {
      [(NSMutableDictionary *)self->_ckRecordIDToRejectedScopedIdentifier setObject:v7 forKeyedSubscript:v6];
    }
  }
}

- (void)_resetPlannerState
{
  currentRecordChange = self->_currentRecordChange;
  self->_currentRecordChange = 0;

  currentRecordTarget = self->_currentRecordTarget;
  self->_currentRecordTarget = 0;

  recordModificationDate = self->_recordModificationDate;
  self->_recordModificationDate = 0;

  simpleBuilder = self->_simpleBuilder;
  self->_simpleBuilder = 0;

  ckRecordToUpload = self->_ckRecordToUpload;
  self->_ckRecordToUpload = 0;

  id v8 = self->_currentRecordTarget;
  self->_currentRecordTarget = 0;

  currentRecordID = self->_currentRecordID;
  self->_currentRecordID = 0;

  v10 = self->_recordModificationDate;
  self->_recordModificationDate = 0;

  sharedCKRecordToUpload = self->_sharedCKRecordToUpload;
  self->_sharedCKRecordToUpload = 0;

  sharedRecordID = self->_sharedRecordID;
  self->_sharedRecordID = 0;

  pendingCKRecordToUpload = self->_pendingCKRecordToUpload;
  self->_pendingCKRecordToUpload = 0;
}

- (BOOL)planRecordChangeUpload:(id)a3 error:(id *)a4
{
  id v8 = a3;
  [(CPLCKBatchUploadPlanner *)self _resetPlannerState];
  p_currentRecordChange = (id *)&self->_currentRecordChange;
  objc_storeStrong((id *)&self->_currentRecordChange, a3);
  if (!_CPLSilentLogging)
  {
    v10 = sub_100038278();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = *p_currentRecordChange;
      uint64_t v12 = [*p_currentRecordChange attachedDiffTracker];
      v13 = (void *)v12;
      CFStringRef v14 = @"no diff tracker";
      if (v12) {
        CFStringRef v14 = (const __CFString *)v12;
      }
      int v67 = 138412546;
      id v68 = v11;
      __int16 v69 = 2112;
      CFStringRef v70 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Planning %@ (%@)", (uint8_t *)&v67, 0x16u);
    }
  }
  v15 = [v8 scopedIdentifier];
  v16 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v15];
  currentRecordTarget = self->_currentRecordTarget;
  self->_currentRecordTarget = v16;

  id v18 = self->_currentRecordTarget;
  if (!v18) {
    sub_1001C6DE8(v8, a2, self);
  }
  destinationZoneIdentification = self->_destinationZoneIdentification;
  id v20 = [(CPLRecordTarget *)v18 scopedIdentifier];
  v21 = [v20 identifier];
  v22 = [(CPLCloudKitZoneIdentification *)destinationZoneIdentification recordIDWithRecordName:v21];
  currentRecordID = self->_currentRecordID;
  self->_currentRecordID = v22;

  [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:self->_currentRecordID onBehalfOfRecordWithScopedIdentifier:v15];
  if (self->_sharedZoneIdentification)
  {
    id v24 = [(CPLRecordTarget *)self->_currentRecordTarget otherScopedIdentifier];
    id v25 = v24;
    if (v24)
    {
      id v26 = [v24 scopeIdentifier];
      id v27 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification scopeIdentifier];
      unsigned int v28 = [v26 isEqualToString:v27];

      if (v28)
      {
        sharedZoneIdentification = self->_sharedZoneIdentification;
        objc_super v30 = [v25 identifier];
        v31 = [(CPLCloudKitZoneIdentification *)sharedZoneIdentification recordIDWithRecordName:v30];
        sharedRecordID = self->_sharedRecordID;
        self->_sharedRecordID = v31;

        [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:self->_sharedRecordID onBehalfOfRecordWithScopedIdentifier:v15];
      }
    }
    if ([v8 isMasterChange] && objc_msgSend(v8, "isFullRecord"))
    {
      if (!self->_mastersNotYetUploadedToPrivateZone)
      {
        v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        mastersNotYetUploadedToPrivateZone = self->_mastersNotYetUploadedToPrivateZone;
        self->_mastersNotYetUploadedToPrivateZone = v33;
      }
      if (!self->_mastersNotYetUploadedToSharedZone)
      {
        v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        mastersNotYetUploadedToSharedZone = self->_mastersNotYetUploadedToSharedZone;
        self->_mastersNotYetUploadedToSharedZone = v35;
      }
      v37 = self->_mastersNotYetUploadedToPrivateZone;
      v38 = [v8 scopedIdentifier];
      [(NSMutableDictionary *)v37 setObject:v8 forKeyedSubscript:v38];

      v39 = self->_mastersNotYetUploadedToSharedZone;
      v40 = [v8 scopedIdentifier];
      [(NSMutableDictionary *)v39 setObject:v8 forKeyedSubscript:v40];
    }
  }
  v41 = objc_alloc_init(CPLCloudKitResourceCountAndSize);
  if (![v8 isDelete])
  {
    if ([v8 isMasterChange])
    {
      scopedIdentifiersNeedingToCallProgressHandler = self->_scopedIdentifiersNeedingToCallProgressHandler;
      if (!scopedIdentifiersNeedingToCallProgressHandler)
      {
        v44 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        v45 = self->_scopedIdentifiersNeedingToCallProgressHandler;
        self->_scopedIdentifiersNeedingToCallProgressHandler = v44;

        scopedIdentifiersNeedingToCallProgressHandler = self->_scopedIdentifiersNeedingToCallProgressHandler;
      }
      [(NSMutableSet *)scopedIdentifiersNeedingToCallProgressHandler addObject:v15];
    }
    if (![v8 prepareWithCKRecordBuilder:self resourceCountAndSize:v41 scopeProvider:self error:a4])
    {
      BOOL v51 = 0;
      goto LABEL_62;
    }
    if (self->_metric)
    {
      if (sub_1000379A4((uint64_t)v41) || sub_1000379D4((uint64_t)v41))
      {
        [(CPLCloudKitUploadMetric *)self->_metric setItemCount:(char *)[(CPLCloudKitUploadMetric *)self->_metric itemCount] + 1];
        [(CPLCloudKitUploadMetric *)self->_metric setUploadSize:(char *)[(CPLCloudKitUploadMetric *)self->_metric uploadSize] + sub_1000379A4((uint64_t)v41)];
        [(CPLCloudKitUploadMetric *)self->_metric setReferencedResourcesSize:(char *)[(CPLCloudKitUploadMetric *)self->_metric referencedResourcesSize]+ sub_1000379D4((uint64_t)v41)];
        [(CPLCloudKitUploadMetric *)self->_metric setReferencedResourcesCount:(char *)[(CPLCloudKitUploadMetric *)self->_metric referencedResourcesCount]+ sub_1000379BC((uint64_t)v41)];
      }
      else
      {
        [(CPLCloudKitUploadMetric *)self->_metric setOtherItemCount:(char *)[(CPLCloudKitUploadMetric *)self->_metric otherItemCount] + 1];
      }
    }
    if (!self->_sharedZoneIdentification
      || ![v8 supportsSharingScopedIdentifier]
      || ![v8 hasChangeType:64])
    {
      goto LABEL_44;
    }
    v46 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification scopeIdentifier];
    unsigned int v47 = [v8 isSharedInScopeWithIdentifier:v46];

    uint64_t v48 = [v8 relatedScopedIdentifier];
    v49 = (void *)v48;
    if (!v47)
    {
      if (v48)
      {
        id v60 = [v8 relatedRecordClass];
        v61 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v49];
        [(CPLCKBatchUploadPlanner *)self _addRecordWithScopedIdentifierToUnshareTodos:v49 recordClass:v60 target:v61];
      }
      v62 = [v8 scopedIdentifier];
      -[CPLCKBatchUploadPlanner _addRecordWithScopedIdentifierToUnshareTodos:recordClass:target:](self, "_addRecordWithScopedIdentifierToUnshareTodos:recordClass:target:", v62, [v8 recordClass], self->_currentRecordTarget);
      goto LABEL_71;
    }
    if (!v48)
    {
LABEL_70:
      v62 = [v8 updateSharingContributorUserIdentifiers];
      v65 = [v8 scopedIdentifier];
      -[CPLCKBatchUploadPlanner _addRecordWithScopedIdentifierToShareTodos:recordClass:proposedContributorUserIdentifiers:target:force:](self, "_addRecordWithScopedIdentifierToShareTodos:recordClass:proposedContributorUserIdentifiers:target:force:", v65, [v8 recordClass], v62, self->_currentRecordTarget, 0);

LABEL_71:
      goto LABEL_44;
    }
    if (([(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord] & 1) == 0)
    {
      if ([v8 _relatedRecordShouldBeShared])
      {
        uint64_t v50 = 1;
        goto LABEL_69;
      }
      if ([v8 isAssetChange])
      {
        v66 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v49];
        if ([v66 targetState] == (id)3) {
          [(CPLCKBatchUploadPlanner *)self _copyPrivateMasterWithScopedIdentifier:v49 masterTarget:v66 uploadIndex:0 reason:@"sharing asset with split master"];
        }
      }
    }
    uint64_t v50 = 0;
LABEL_69:
    id v63 = [v8 relatedRecordClass];
    v64 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v49];
    [(CPLCKBatchUploadPlanner *)self _addRecordWithScopedIdentifierToShareTodos:v49 recordClass:v63 proposedContributorUserIdentifiers:0 target:v64 force:v50];

    goto LABEL_70;
  }
  id v42 = [(CPLRecordTarget *)self->_currentRecordTarget targetState];
  if ((unint64_t)v42 < 2)
  {
    [(CPLCKBatchUploadPlanner *)self _deleteRecord];
  }
  else
  {
    if (v42 != (id)2)
    {
      if (v42 != (id)3) {
        goto LABEL_44;
      }
      [(CPLCKBatchUploadPlanner *)self _deleteRecord];
    }
    [(CPLCKBatchUploadPlanner *)self _deleteSharedRecord];
  }
LABEL_44:
  if (self->_ckRecordToUpload)
  {
    if (!self->_uploadContext)
    {
      v52 = objc_alloc_init(CPLCloudKitUploadOperationContext);
      uploadContext = self->_uploadContext;
      self->_uploadContext = v52;
    }
    if (self->_sharedZoneIdentification
      && ([*p_currentRecordChange isMasterChange] & 1) == 0
      && [*p_currentRecordChange supportsSharingScopedIdentifier])
    {
      unsigned int v54 = [(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord];
      char v55 = v54;
      [(CPLCloudKitUploadOperationContext *)self->_uploadContext addRecord:self->_currentRecordChange forRecordID:self->_currentRecordID ignoreResources:v54 ^ 1];
      if ((v55 & 1) == 0) {
        goto LABEL_55;
      }
    }
    else
    {
      [(CPLCloudKitUploadOperationContext *)self->_uploadContext addRecord:self->_currentRecordChange forRecordID:self->_currentRecordID ignoreResources:0];
    }
    if (sub_1000379A4((uint64_t)v41)) {
      [(CPLCKBatchUploadPlanner *)self _addCKRecordIDForResourcesUploadProgressTracking:self->_currentRecordID size:(double)(unint64_t)sub_1000379A4((uint64_t)v41)];
    }
  }
LABEL_55:
  if (self->_sharedCKRecordToUpload)
  {
    if (self->_sharedUploadContext)
    {
      v56 = objc_alloc_init(CPLCloudKitUploadOperationContext);
      sharedUploadContext = self->_sharedUploadContext;
      self->_sharedUploadContext = v56;

      v58 = self->_sharedUploadContext;
    }
    else
    {
      v58 = 0;
    }
    [(CPLCloudKitUploadOperationContext *)v58 addRecord:self->_currentRecordChange forRecordID:self->_sharedRecordID ignoreResources:0];
    if (sub_1000379A4((uint64_t)v41)) {
      [(CPLCKBatchUploadPlanner *)self _addCKRecordIDForResourcesUploadProgressTracking:self->_sharedRecordID size:(double)(unint64_t)sub_1000379A4((uint64_t)v41)];
    }
  }
  BOOL v51 = 1;
LABEL_62:

  return v51;
}

- (void)_addCKRecordIDForResourcesUploadProgressTracking:(id)a3 size:(double)a4
{
  id v9 = a3;
  self->_uploadTotalSize = self->_uploadTotalSize + a4;
  if (!self->_sizesPerRecordID)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sizesPerRecordID = self->_sizesPerRecordID;
    self->_sizesPerRecordID = v6;
  }
  id v8 = +[NSNumber numberWithDouble:a4];
  [(NSMutableDictionary *)self->_sizesPerRecordID setObject:v8 forKeyedSubscript:v9];
}

- (id)_shareTodoForRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  destinationZoneIdentification = self->_destinationZoneIdentification;
  id v13 = a6;
  CFStringRef v14 = [v13 scopedIdentifier];
  v15 = [v14 identifier];
  v16 = [(CPLCloudKitZoneIdentification *)destinationZoneIdentification recordIDWithRecordName:v15];

  sharedZoneIdentification = self->_sharedZoneIdentification;
  id v18 = [v13 otherScopedIdentifier];

  __int16 v19 = [v18 identifier];
  id v20 = [(CPLCloudKitZoneIdentification *)sharedZoneIdentification recordIDWithRecordName:v19];

  if ([v11 count])
  {
    v21 = [(CKRecordID *)self->_currentUserRecordID recordName];
    unsigned __int8 v22 = [v11 containsObject:v21];

    if ((v22 & 1) == 0)
    {
      id v23 = [v11 mutableCopy];
      id v24 = [(CKRecordID *)self->_currentUserRecordID recordName];
      [v23 addObject:v24];

      id v11 = v23;
    }
  }
  id v25 = [CPLCKShareRecordTodo alloc];
  id v26 = [(CPLRecordChange *)self->_currentRecordChange recordModificationDate];
  if (v26)
  {
    id v27 = sub_100038DA0((id *)&v25->super.isa, v10, a4, v16, v20, v11, v26);
  }
  else
  {
    unsigned int v28 = +[NSDate date];
    id v27 = sub_100038DA0((id *)&v25->super.isa, v10, a4, v16, v20, v11, v28);
  }
  return v27;
}

- (void)_dontUnshareRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4
{
  id v9 = a3;
  if ((Class)objc_opt_class() != a4)
  {
    dontUnshareScopedIdentifier = self->_dontUnshareScopedIdentifier;
    if (!dontUnshareScopedIdentifier)
    {
      id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v8 = self->_dontUnshareScopedIdentifier;
      self->_dontUnshareScopedIdentifier = v7;

      dontUnshareScopedIdentifier = self->_dontUnshareScopedIdentifier;
    }
    [(NSMutableSet *)dontUnshareScopedIdentifier addObject:v9];
  }
}

- (void)_addRecordWithScopedIdentifierToShareTodos:(id)a3 recordClass:(Class)a4 proposedContributorUserIdentifiers:(id)a5 target:(id)a6 force:(BOOL)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if ([v14 shouldUploadToOtherRecord] && !a7)
  {
    if (!_CPLSilentLogging)
    {
      v15 = sub_100038278();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Already shared %@", buf, 0xCu);
      }
    }
LABEL_13:
    [(CPLCKBatchUploadPlanner *)self _dontUnshareRecordWithScopedIdentifier:v12 recordClass:a4];
    goto LABEL_14;
  }
  if ([(CPLCKUnsharePlan *)self->_unsharePlan hasShareTodoForScopedIdentifier:v12])
  {
    if (!_CPLSilentLogging)
    {
      v16 = sub_100038278();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Remove plan to unshare %@", buf, 0xCu);
      }
    }
    [(CPLCKUnsharePlan *)self->_unsharePlan removeShareTodoForScopedIdentifier:v12];
    goto LABEL_13;
  }
  if (![(CPLCKSharePlan *)self->_sharePlan hasShareTodoForScopedIdentifier:v12])
  {
    if (!self->_sharePlan)
    {
      int v17 = [[CPLCKSharePlan alloc] initWithPlanner:self];
      sharePlan = self->_sharePlan;
      self->_sharePlan = v17;
    }
    uint64_t v19 = [(CPLCKBatchUploadPlanner *)self _shareTodoForRecordWithScopedIdentifier:v12 recordClass:a4 proposedContributorUserIdentifiers:v13 target:v14];
    id v20 = (void *)v19;
    if (v19)
    {
      [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:*(void *)(v19 + 24) onBehalfOfRecordWithScopedIdentifier:v12];
      uint64_t v21 = v20[4];
    }
    else
    {
      [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:0 onBehalfOfRecordWithScopedIdentifier:v12];
      uint64_t v21 = 0;
    }
    [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v21 onBehalfOfRecordWithScopedIdentifier:v12];
    if (!_CPLSilentLogging)
    {
      unsigned __int8 v22 = sub_100038278();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification engineScope];
        if (v20) {
          id v23 = (void *)v20[3];
        }
        else {
          id v23 = 0;
        }
        id v28 = v23;
        id v24 = [v28 recordName];
        if (v20) {
          id v25 = (void *)v20[4];
        }
        else {
          id v25 = 0;
        }
        id v26 = v25;
        id v27 = [v26 recordName];
        *(_DWORD *)buf = 138413058;
        id v31 = v12;
        __int16 v32 = 2112;
        v33 = v29;
        __int16 v34 = 2112;
        v35 = v24;
        __int16 v36 = 2112;
        v37 = v27;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will move %@ to %@ (%@ -> %@)", buf, 0x2Au);
      }
    }
    [(CPLCKSharePlan *)self->_sharePlan addShareTodo:v20];
  }
LABEL_14:
}

- (void)_addRecordWithScopedIdentifierToUnshareTodos:(id)a3 recordClass:(Class)a4 target:(id)a5
{
  id v8 = (objc_class *)a3;
  id v9 = a5;
  id v10 = [(CPLCKBatchUploadPlanner *)self _shareTodoForRecordWithScopedIdentifier:v8 recordClass:a4 proposedContributorUserIdentifiers:0 target:v9];
  if ([(objc_class *)a4 isSubclassOfClass:objc_opt_class()]
    && [v9 shouldUploadToOtherRecord]
    && (!v10 ? (uint64_t v11 = 0) : (uint64_t v11 = v10[4]),
        [(NSMutableDictionary *)self->_requestedSharedCKRecordIDs objectForKeyedSubscript:v11], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100038278();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification scopeIdentifier];
        int v27 = 138412802;
        Class v28 = a4;
        __int16 v29 = 2112;
        objc_super v30 = v8;
        __int16 v31 = 2114;
        __int16 v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "We are already planning to copy shared <%@ %@> to %{public}@ - no need to unshare", (uint8_t *)&v27, 0x20u);
      }
    }
  }
  else if ([v9 shouldUploadToOtherRecord])
  {
    if (([(NSMutableSet *)self->_dontUnshareScopedIdentifier containsObject:v8] & 1) != 0
      || [(CPLCKSharePlan *)self->_sharePlan hasShareTodoForScopedIdentifier:v8])
    {
      if (!_CPLSilentLogging)
      {
        v15 = sub_100038278();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412290;
          Class v28 = v8;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Won't unshare %@", (uint8_t *)&v27, 0xCu);
        }
      }
    }
    else if (![(CPLCKUnsharePlan *)self->_unsharePlan hasShareTodoForScopedIdentifier:v8])
    {
      if (!self->_unsharePlan)
      {
        v16 = [[CPLCKUnsharePlan alloc] initWithPlanner:self];
        unsharePlan = self->_unsharePlan;
        self->_unsharePlan = v16;
      }
      if (v10)
      {
        [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v10[3] onBehalfOfRecordWithScopedIdentifier:v8];
        uint64_t v18 = v10[4];
      }
      else
      {
        [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:0 onBehalfOfRecordWithScopedIdentifier:v8];
        uint64_t v18 = 0;
      }
      [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v18 onBehalfOfRecordWithScopedIdentifier:v8];
      if (!_CPLSilentLogging)
      {
        uint64_t v19 = sub_100038278();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification engineScope];
          if (v10) {
            uint64_t v21 = (void *)v10[4];
          }
          else {
            uint64_t v21 = 0;
          }
          id v22 = v21;
          id v23 = [v22 recordName];
          if (v10) {
            id v24 = (void *)v10[3];
          }
          else {
            id v24 = 0;
          }
          id v25 = v24;
          id v26 = [v25 recordName];
          int v27 = 138413058;
          Class v28 = v8;
          __int16 v29 = 2112;
          objc_super v30 = v20;
          __int16 v31 = 2112;
          __int16 v32 = v23;
          __int16 v33 = 2112;
          __int16 v34 = v26;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Will move back %@ from %@ (%@ -> %@)", (uint8_t *)&v27, 0x2Au);
        }
      }
      [(CPLCKUnsharePlan *)self->_unsharePlan addShareTodo:v10];
    }
  }
}

- (void)_deleteRecord
{
  if ([(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification supportsDeletionOfRecord:self->_currentRecordChange scopeProvider:self])
  {
    if ([(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification supportsDirectDeletionOfRecord:self->_currentRecordChange scopeProvider:self])
    {
      currentRecordID = self->_currentRecordID;
      [(CPLCKBatchUploadPlanner *)self deleteCKRecordWithRecordID:currentRecordID];
    }
    else
    {
      currentRecordChange = self->_currentRecordChange;
      id v7 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zone];
      id v9 = +[CKRecord cpl_expungedRecordFromCPLRecordChange:currentRecordChange inZone:v7 target:self->_currentRecordTarget];

      id v8 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
      [(CPLCKBatchUploadPlanner *)self uploadCKRecord:v9 forScopedIdentifier:v8 triggeringKey:@"isExpunged"];
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v4 = sub_100038278();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_currentRecordChange;
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dropping %@", buf, 0xCu);
    }
  }
}

- (void)_deleteSharedRecord
{
  if (!self->_sharedRecordID) {
    sub_1001C6EC0((uint64_t)self, (uint64_t)a2);
  }
  if ([(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification supportsDeletionOfRecord:self->_currentRecordChange scopeProvider:self])
  {
    if ([(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification supportsDirectDeletionOfRecord:self->_currentRecordChange scopeProvider:self])
    {
      sharedRecordID = self->_sharedRecordID;
      [(CPLCKBatchUploadPlanner *)self deleteSharedCKRecordWithRecordID:sharedRecordID];
    }
    else
    {
      currentRecordChange = self->_currentRecordChange;
      id v7 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification zone];
      id v9 = +[CKRecord cpl_expungedSharedRecordFromCPLRecordChange:currentRecordChange inZone:v7 target:self->_currentRecordTarget];

      id v8 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
      [(CPLCKBatchUploadPlanner *)self uploadSharedCKRecord:v9 forScopedIdentifier:v8 triggeringKey:@"isExpunged"];
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v4 = sub_100038278();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_currentRecordChange;
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dropping %@ (shared)", buf, 0xCu);
    }
  }
}

- (void)deleteCKRecordWithRecordID:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    v5 = sub_100038278();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will delete shared %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  ckRecordIDsToDelete = self->_ckRecordIDsToDelete;
  if (!ckRecordIDsToDelete)
  {
    id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v8 = self->_ckRecordIDsToDelete;
    self->_ckRecordIDsToDelete = v7;

    ckRecordIDsToDelete = self->_ckRecordIDsToDelete;
  }
  [(NSMutableArray *)ckRecordIDsToDelete addObject:v4];
}

- (void)uploadCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = sub_100038278();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v8 recordID];
      int v16 = 138543618;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will update %{public}@ (triggered by %@)", (uint8_t *)&v16, 0x16u);
    }
  }
  ckRecordsToUpload = self->_ckRecordsToUpload;
  if (!ckRecordsToUpload)
  {
    id v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v15 = self->_ckRecordsToUpload;
    self->_ckRecordsToUpload = v14;

    ckRecordsToUpload = self->_ckRecordsToUpload;
  }
  [(NSMutableArray *)ckRecordsToUpload addObject:v8];
}

- (void)updatePrivateRecord:(id)a3 sharedToRecordWithID:(id)a4
{
}

- (void)deleteSharedCKRecordWithRecordID:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    v5 = sub_100038278();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will delete shared %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  sharedCKRecordIDsToDelete = self->_sharedCKRecordIDsToDelete;
  if (!sharedCKRecordIDsToDelete)
  {
    id v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    id v8 = self->_sharedCKRecordIDsToDelete;
    self->_sharedCKRecordIDsToDelete = v7;

    sharedCKRecordIDsToDelete = self->_sharedCKRecordIDsToDelete;
  }
  [(NSMutableArray *)sharedCKRecordIDsToDelete addObject:v4];
}

- (void)uploadSharedCKRecord:(id)a3 forScopedIdentifier:(id)a4 triggeringKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CPLSilentLogging)
  {
    uint64_t v11 = sub_100038278();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v8 recordID];
      int v16 = 138543618;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will update shared %{public}@ (triggered by %@)", (uint8_t *)&v16, 0x16u);
    }
  }
  sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
  if (!sharedCKRecordsToUpload)
  {
    id v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v15 = self->_sharedCKRecordsToUpload;
    self->_sharedCKRecordsToUpload = v14;

    sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
  }
  [(NSMutableArray *)sharedCKRecordsToUpload addObject:v8];
}

- (void)requestSharedCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  requestedSharedCKRecordIDs = self->_requestedSharedCKRecordIDs;
  if (requestedSharedCKRecordIDs)
  {
    id v12 = [(NSMutableDictionary *)requestedSharedCKRecordIDs objectForKeyedSubscript:v8];

    if (v12) {
      goto LABEL_10;
    }
  }
  else
  {
    id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v14 = self->_requestedSharedCKRecordIDs;
    self->_requestedSharedCKRecordIDs = v13;
  }
  if (!_CPLSilentLogging)
  {
    v15 = sub_100038278();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      currentRecordChange = self->_currentRecordChange;
      int v18 = 138543874;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = currentRecordChange;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Will fetch shared %{public}@ for %@ before upload because %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
  id v17 = objc_retainBlock(v9);
  [(NSMutableDictionary *)self->_requestedSharedCKRecordIDs setObject:v17 forKeyedSubscript:v8];

LABEL_10:
}

- (BOOL)didFetchSharedCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableDictionary *)self->_requestedSharedCKRecordIDs objectForKeyedSubscript:v9];
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    char v12 = (*(uint64_t (**)(uint64_t, id, id, id *))(v10 + 16))(v10, v9, v8, a5);
    [(NSMutableDictionary *)self->_requestedSharedCKRecordIDs removeObjectForKey:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100038278();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412546;
        id v18 = v8;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received unrequested fetch record %@ for %@", (uint8_t *)&v17, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    v15 = v14;
    if (a5) {
      *a5 = v14;
    }

    char v12 = 0;
  }

  return v12;
}

- (NSArray)requestedSharedCKRecordIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_requestedSharedCKRecordIDs allKeys];
}

- (void)requestPrivateCKRecordWithRecordIDBeforeUpload:(id)a3 fetchedBlock:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  requestedPrivateCKRecordIDs = self->_requestedPrivateCKRecordIDs;
  if (requestedPrivateCKRecordIDs)
  {
    char v12 = [(NSMutableDictionary *)requestedPrivateCKRecordIDs objectForKeyedSubscript:v8];

    if (v12) {
      goto LABEL_15;
    }
  }
  else
  {
    id v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v14 = self->_requestedPrivateCKRecordIDs;
    self->_requestedPrivateCKRecordIDs = v13;
  }
  v15 = [(NSMutableDictionary *)self->_requestedPrivateCKRecordIDs objectForKeyedSubscript:v8];

  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      id v18 = sub_100038278();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        currentRecordChange = self->_currentRecordChange;
        int v20 = 138543874;
        id v21 = v8;
        __int16 v22 = 2112;
        id v23 = currentRecordChange;
        __int16 v24 = 2114;
        id v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Will fetch private %{public}@ for %@ before upload because %{public}@", (uint8_t *)&v20, 0x20u);
      }
    }
    int v16 = objc_retainBlock(v9);
    [(NSMutableDictionary *)self->_requestedPrivateCKRecordIDs setObject:v16 forKeyedSubscript:v8];
    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    int v16 = sub_100038278();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = self->_currentRecordChange;
      int v20 = 138543874;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v17;
      __int16 v24 = 2114;
      id v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Will also fetch private %{public}@ for %@ before upload because %{public}@", (uint8_t *)&v20, 0x20u);
    }
LABEL_14:
  }
LABEL_15:
}

- (BOOL)didFetchPrivateCKRecord:(id)a3 forRecordWithRecordID:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableDictionary *)self->_requestedPrivateCKRecordIDs objectForKeyedSubscript:v9];
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    char v12 = (*(uint64_t (**)(uint64_t, id, id, id *))(v10 + 16))(v10, v9, v8, a5);
    [(NSMutableDictionary *)self->_requestedPrivateCKRecordIDs removeObjectForKey:v9];
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_100038278();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412546;
        id v18 = v8;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received unrequested fetch record %@ for %@", (uint8_t *)&v17, 0x16u);
      }
    }
    id v14 = +[CPLErrors unknownError];
    v15 = v14;
    if (a5) {
      *a5 = v14;
    }

    char v12 = 0;
  }

  return v12;
}

- (NSArray)requestedPrivateCKRecordIDs
{
  return (NSArray *)[(NSMutableDictionary *)self->_requestedPrivateCKRecordIDs allKeys];
}

- (double)uploadedSize
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  progressSizesPerRecordID = self->_progressSizesPerRecordID;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A550;
  v5[3] = &unk_1002777F0;
  v5[4] = &v6;
  [(NSMutableDictionary *)progressSizesPerRecordID enumerateKeysAndObjectsUsingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)planProgess
{
  double result = 0.0;
  if (self->_uploadTotalSize > 0.0)
  {
    [(CPLCKBatchUploadPlanner *)self uploadedSize];
    return fmin(v4 / self->_uploadTotalSize, 1.0);
  }
  return result;
}

- (id)willUploadRecords
{
  if (!_CPLSilentLogging)
  {
    double v3 = sub_100038278();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      double v4 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification cloudKitScope];
      if (self->_ckRecordsToUpload) {
        ckRecordsToUpload = self->_ckRecordsToUpload;
      }
      else {
        ckRecordsToUpload = (NSMutableArray *)&__NSArray0__struct;
      }
      uint64_t v6 = [(NSMutableArray *)ckRecordsToUpload cplFullDescription];
      int v11 = 138412546;
      char v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Will upload to %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  self->_dateOfFirstUploadProgress = 0;

  [(CPLCKBatchUploadPlanner *)self _resetPlannerState];
  requestedSharedCKRecordIDs = self->_requestedSharedCKRecordIDs;
  self->_requestedSharedCKRecordIDs = 0;

  uploadContext = self->_uploadContext;
  return uploadContext;
}

- (void)uploadOfRecordID:(id)a3 didProgress:(double)a4
{
  id v22 = a3;
  id v7 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sizesPerRecordID, "objectForKeyedSubscript:");
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    if (v9 > 0.0)
    {
      double v10 = v9;
      if (!self->_dateOfFirstUploadProgress)
      {
        int v11 = +[NSDate date];
        dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
        self->_dateOfFirstUploadProgress = v11;
      }
      if (!self->_progressSizesPerRecordID)
      {
        __int16 v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->_sizesPerRecordID, "count"));
        progressSizesPerRecordID = self->_progressSizesPerRecordID;
        self->_progressSizesPerRecordID = v13;
      }
      v15 = +[NSNumber numberWithDouble:v10 * a4];
      [(NSMutableDictionary *)self->_progressSizesPerRecordID setObject:v15 forKeyedSubscript:v22];
    }
  }
  uint64_t v16 = [(CPLCKBatchUploadPlanner *)self scopedIdentifierForCKRecordID:v22];
  if (v16)
  {
    int v17 = (void *)v16;
    if (self->_progressHandler
      && [(NSMutableSet *)self->_scopedIdentifiersNeedingToCallProgressHandler containsObject:v16])
    {
      float v18 = a4;
      (*((void (**)(float))self->_progressHandler + 2))(v18);
    }
  }
  else
  {
    __int16 v19 = (CPLCKBatchUploadPlanner *)sub_1001C6FA8(v22, a2, self);
    [(CPLCKBatchUploadPlanner *)v19 didFinishUploadOfRecordsWithError:v21];
  }
}

- (void)didFinishUploadOfRecordsWithError:(id)a3
{
  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  if (dateOfFirstUploadProgress)
  {
    [(NSDate *)dateOfFirstUploadProgress timeIntervalSinceNow];
    self->_totalDurationOfUpload = self->_totalDurationOfUpload + fmax(-v5, 0.0);
    uint64_t v6 = self->_dateOfFirstUploadProgress;
    self->_dateOfFirstUploadProgress = 0;
  }
  uploadContext = self->_uploadContext;
  self->_uploadContext = 0;
}

- (id)willUploadSharedRecords
{
  if (self->_sharedZoneIdentification) {
    BOOL v3 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    double v4 = sub_100038278();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double v5 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification cloudKitScope];
      if (self->_sharedCKRecordsToUpload) {
        sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
      }
      else {
        sharedCKRecordsToUpload = (NSMutableArray *)&__NSArray0__struct;
      }
      id v7 = [(NSMutableArray *)sharedCKRecordsToUpload cplFullDescription];
      int v11 = 138412546;
      char v12 = v5;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Will upload to shared %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  self->_dateOfFirstUploadProgress = 0;

  sharedUploadContext = self->_sharedUploadContext;
  return sharedUploadContext;
}

- (void)didFinishUploadOfSharedRecordsWithError:(id)a3
{
  dateOfFirstUploadProgress = self->_dateOfFirstUploadProgress;
  if (dateOfFirstUploadProgress)
  {
    [(NSDate *)dateOfFirstUploadProgress timeIntervalSinceNow];
    self->_totalDurationOfUpload = self->_totalDurationOfUpload + fmax(-v5, 0.0);
    uint64_t v6 = self->_dateOfFirstUploadProgress;
    self->_dateOfFirstUploadProgress = 0;
  }
  sharedUploadContext = self->_sharedUploadContext;
  self->_sharedUploadContext = 0;
}

- (void)updateTargetMappingAfterUpload
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = self->_scopedIdentifiersMovingToSplitState;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        double v9 = -[CPLRecordTargetMapping targetForRecordWithScopedIdentifier:](self->_targetMapping, "targetForRecordWithScopedIdentifier:", v8, (void)v14);
        id v10 = objc_alloc((Class)CPLRecordTarget);
        int v11 = [v9 otherScopedIdentifier];
        id v12 = [v10 initWithScopedIdentifier:v8 otherScopedIdentifier:v11 targetState:3];

        [(CPLRecordTargetMapping *)self->_targetMapping setTarget:v12 forRecordWithScopedIdentifier:v8];
      }
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  requestedSharedCKRecordIDs = self->_requestedSharedCKRecordIDs;
  self->_requestedSharedCKRecordIDs = 0;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return [(CPLCloudKitScopeProvider *)self->_scopeProvider cloudKitScopeForScopeIdentifier:a3];
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  return [(CPLCloudKitScopeProvider *)self->_scopeProvider zoneIDFromScopeIdentifier:a3];
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  return [(CPLCloudKitScopeProvider *)self->_scopeProvider scopeIdentifierFromZoneID:a3];
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_ckRecordIDToScopedIdentifier objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CPLCloudKitScopeProvider *)self->_scopeProvider scopedIdentifierForCKRecordID:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_ckRecordIDToRejectedScopedIdentifier objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(CPLCKBatchUploadPlanner *)self scopedIdentifierForCKRecordID:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_noteMasterWillBeUploadedToPrivateZone:(id)a3
{
  id v4 = a3;
  mastersUploadedToPrivateZone = self->_mastersUploadedToPrivateZone;
  id v8 = v4;
  if (!mastersUploadedToPrivateZone)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_mastersUploadedToPrivateZone;
    self->_mastersUploadedToPrivateZone = v6;

    id v4 = v8;
    mastersUploadedToPrivateZone = self->_mastersUploadedToPrivateZone;
  }
  [(NSMutableSet *)mastersUploadedToPrivateZone addObject:v4];
  [(NSMutableDictionary *)self->_mastersNotYetUploadedToPrivateZone removeObjectForKey:v8];
}

- (void)_noteMasterWillBeUploadedToSharedZone:(id)a3
{
  id v4 = a3;
  mastersUploadedToSharedZone = self->_mastersUploadedToSharedZone;
  id v8 = v4;
  if (!mastersUploadedToSharedZone)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v7 = self->_mastersUploadedToSharedZone;
    self->_mastersUploadedToSharedZone = v6;

    id v4 = v8;
    mastersUploadedToSharedZone = self->_mastersUploadedToSharedZone;
  }
  [(NSMutableSet *)mastersUploadedToSharedZone addObject:v4];
  [(NSMutableDictionary *)self->_mastersNotYetUploadedToSharedZone removeObjectForKey:v8];
}

- (BOOL)_shouldUpdateKeyOnCKRecord:(id)a3
{
  id v5 = a3;
  if ([(CPLCKRecordPropertyMapping *)self->_propertyMapping isKeyReadOnly:v5 recordClass:[(CPLRecordChange *)self->_currentRecordChange recordClass]])
  {
    goto LABEL_2;
  }
  if (self->_sharedZoneIdentification
    && [(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord])
  {
    if ([(CPLRecordTarget *)self->_currentRecordTarget targetState] == (id)2 && !self->_ckRecordToUpload)
    {
      if (![(CPLCKRecordPropertyMapping *)self->_propertyMapping shouldSplitIndirectRecordForKey:v5 recordClass:[(CPLRecordChange *)self->_currentRecordChange recordClass]])
      {
        if ([(CPLCKRecordPropertyMapping *)self->_propertyMapping shouldUpdateKeyOnPrivateRecord:v5 recordClass:[(CPLRecordChange *)self->_currentRecordChange recordClass]])
        {
          currentRecordChange = self->_currentRecordChange;
          id v63 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zone];
          CPLBaseCKRecordFromCPLRecordChange(currentRecordChange, v63, self->_currentRecordTarget);
          v64 = (CKRecord *)objc_claimAutoreleasedReturnValue();
          pendingCKRecordToUpload = self->_pendingCKRecordToUpload;
          self->_pendingCKRecordToUpload = v64;

          v66 = [[CPLSimpleCKRecordBuilder alloc] initWithBaseCKRecord:self->_pendingCKRecordToUpload scopeProvider:self currentUserRecordID:self->_currentUserRecordID targetMapping:self->_targetMapping];
          simpleBuilder = self->_simpleBuilder;
          self->_simpleBuilder = v66;
        }
        goto LABEL_2;
      }
    }
    else if (![(CPLCKRecordPropertyMapping *)self->_propertyMapping shouldUpdateKeyOnPrivateRecord:v5 recordClass:[(CPLRecordChange *)self->_currentRecordChange recordClass]])
    {
LABEL_2:
      BOOL v6 = 0;
LABEL_65:

      return v6;
    }
  }
  if (self->_ckRecordToUpload)
  {
LABEL_64:
    BOOL v6 = 1;
    goto LABEL_65;
  }
  id v7 = self->_pendingCKRecordToUpload;
  if (v7)
  {
    id v8 = v7;
    ckRecordToUpload = self->_ckRecordToUpload;
    self->_ckRecordToUpload = v8;
  }
  else
  {
    id v10 = self->_currentRecordChange;
    ckRecordToUpload = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zone];
    CPLBaseCKRecordFromCPLRecordChange(v10, ckRecordToUpload, self->_currentRecordTarget);
    int v11 = (CKRecord *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_ckRecordToUpload;
    self->_ckRecordToUpload = v11;
  }
  __int16 v13 = self->_pendingCKRecordToUpload;
  self->_pendingCKRecordToUpload = 0;

  if ([(CPLRecordChange *)self->_currentRecordChange isMasterChange])
  {
    long long v14 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
    [(CPLCKBatchUploadPlanner *)self _noteMasterWillBeUploadedToPrivateZone:v14];
  }
  if (self->_cplEnabledDate
    && [(CPLRecordChange *)self->_currentRecordChange isAssetChange])
  {
    [(CPLRecordChange *)self->_currentRecordChange setMostRecentAddedDateOnCKRecord:self->_ckRecordToUpload withCPLEnabledDate:self->_cplEnabledDate];
  }
  if ([(CPLRecordChange *)self->_currentRecordChange isFullRecord]) {
    [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification setupRootOnRecord:self->_ckRecordToUpload];
  }
  recordModificationDate = self->_recordModificationDate;
  if (recordModificationDate) {
    [(CKRecord *)self->_ckRecordToUpload setObject:recordModificationDate forKey:@"recordModificationDate"];
  }
  long long v16 = self->_ckRecordToUpload;
  long long v17 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
  [(CPLCKBatchUploadPlanner *)self uploadCKRecord:v16 forScopedIdentifier:v17 triggeringKey:v5];

  if (!self->_sharedZoneIdentification)
  {
LABEL_63:
    v74 = [[CPLSimpleCKRecordBuilder alloc] initWithBaseCKRecord:self->_ckRecordToUpload scopeProvider:self currentUserRecordID:self->_currentUserRecordID targetMapping:self->_targetMapping];
    v75 = self->_simpleBuilder;
    self->_simpleBuilder = v74;

    goto LABEL_64;
  }
  if ([(CPLRecordTarget *)self->_currentRecordTarget targetState] == (id)2)
  {
    [(CPLCKBatchUploadPlanner *)self updatePrivateRecord:self->_ckRecordToUpload sharedToRecordWithID:self->_sharedRecordID];
    float v18 = [(CPLRecordTarget *)self->_currentRecordTarget scopedIdentifier];
    [(CPLCKBatchUploadPlanner *)self _noteRecordWithScopedIdentifierWillMoveToSplitState:v18];

    unsigned int v19 = [(CPLCKRecordPropertyMapping *)self->_propertyMapping doesRecordClassSupportSparseRecords:[(CPLRecordChange *)self->_currentRecordChange recordClass]];
    CFStringRef v20 = @"shared record needs private properties to be uploaded but can't be sparse";
    if (v19) {
      CFStringRef v20 = @"creating private sparse record from shared record";
    }
    CFStringRef v128 = v20;
    id v21 = [(CPLRecordTarget *)self->_currentRecordTarget otherScopedIdentifier];
    id v22 = [v21 identifier];

    id v23 = objc_alloc((Class)CKRecordID);
    __int16 v24 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification zoneID];
    id v25 = [v23 initWithRecordName:v22 zoneID:v24];

    id v26 = [(CPLRecordChange *)self->_currentRecordChange recordClass];
    int v27 = a2;
    Class v28 = [CPLCKSplitCopyHelper alloc];
    __int16 v29 = self->_ckRecordToUpload;
    int64_t v30 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification databaseScope];
    __int16 v31 = [(CKRecord *)self->_ckRecordToUpload recordID];
    __int16 v32 = v28;
    a2 = v27;
    __int16 v33 = [(CPLCKSplitCopyHelper *)v32 initWithBaseCKRecord:v29 sourceRecordID:v25 fromPrivateRecord:0 recordClass:v26 sourceDatabaseScope:v30 destinationRecordID:v31 planner:self];

    v144[0] = _NSConcreteStackBlock;
    v144[1] = 3221225472;
    v144[2] = sub_10003BF04;
    v144[3] = &unk_100277818;
    v146 = self;
    v147 = v27;
    v145 = v33;
    __int16 v34 = v33;
    [(CPLCKBatchUploadPlanner *)self requestSharedCKRecordWithRecordIDBeforeUpload:v25 fetchedBlock:v144 reason:v128];
  }
  unsigned int v35 = [(CPLRecordChange *)self->_currentRecordChange isAssetChange];
  __int16 v36 = self->_currentRecordChange;
  if (!v35)
  {
    id v42 = [(CPLRecordChange *)v36 relatedScopedIdentifier];
    if (!v42)
    {
LABEL_62:

      goto LABEL_63;
    }
    v43 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v42];
    if (v43)
    {
      v44 = v43;
      if ([v43 targetState] != (id)2
        || ([(NSMutableSet *)self->_scopedIdentifiersMovingToSplitState containsObject:v42] & 1) != 0)
      {
        goto LABEL_61;
      }
      SEL v125 = a2;
      v45 = [v44 otherScopedIdentifier];
      uint64_t v46 = [v45 identifier];

      id v47 = objc_alloc((Class)CKRecordID);
      uint64_t v48 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification zoneID];
      v129 = (void *)v46;
      id v49 = [v47 initWithRecordName:v46 zoneID:v48];

      id v124 = [(CPLRecordChange *)self->_currentRecordChange relatedRecordClass];
      id v50 = [v124 newRecordWithScopedIdentifier:v42];
      BOOL v51 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zone];
      v52 = CPLBaseCKRecordFromCPLRecordChange(v50, v51, v44);

      [(CPLCKBatchUploadPlanner *)self updatePrivateRecord:v52 sharedToRecordWithID:v49];
      v53 = [v52 recordID];
      [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v53 onBehalfOfRecordWithScopedIdentifier:v42];

      [(NSMutableArray *)self->_ckRecordsToUpload insertObject:v52 atIndex:(char *)[(NSMutableArray *)self->_ckRecordsToUpload count] - 1];
      [(CPLCKBatchUploadPlanner *)self _noteRecordWithScopedIdentifierWillMoveToSplitState:v42];
      unsigned int v54 = self->_recordModificationDate;
      if (v54) {
        [v52 setObject:v54 forKeyedSubscript:@"recordModificationDate"];
      }
      if ([v50 isAssetChange]) {
        [v50 setMostRecentAddedDateOnCKRecord:v52 withCPLEnabledDate:self->_cplEnabledDate];
      }
      v121 = v54;
      if ([(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification supportsDeletionOfRecord:v50 scopeProvider:self]&& ![(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification supportsDirectDeletionOfRecord:v50 scopeProvider:self])
      {
        [v52 setObject:&__kCFBooleanFalse forKeyedSubscript:@"isExpunged"];
        char v55 = +[NSNumber numberWithBool:[(CPLRecordChange *)self->_currentRecordChange inTrash]];
        [v52 setObject:v55 forKeyedSubscript:@"isDeleted"];
      }
      v56 = [CPLCKSplitCopyHelper alloc];
      int64_t v57 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification databaseScope];
      v58 = [v52 recordID];
      v59 = [(CPLCKSplitCopyHelper *)v56 initWithBaseCKRecord:v52 sourceRecordID:v49 fromPrivateRecord:0 recordClass:v124 sourceDatabaseScope:v57 destinationRecordID:v58 planner:self];

      v131[0] = _NSConcreteStackBlock;
      v131[1] = 3221225472;
      v131[2] = sub_10003C264;
      v131[3] = &unk_100277818;
      v133 = self;
      SEL v134 = v125;
      v132 = v59;
      id v60 = v59;
      [(CPLCKBatchUploadPlanner *)self requestSharedCKRecordWithRecordIDBeforeUpload:v49 fetchedBlock:v131 reason:@"shared related record needs to be in private zone"];

      goto LABEL_47;
    }
    if (!_CPLSilentLogging)
    {
      v110 = sub_100038278();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        id v111 = [(CPLRecordChange *)self->_currentRecordChange relatedRecordClass];
        v112 = self->_currentRecordChange;
        *(_DWORD *)buf = 138412802;
        id v149 = v111;
        __int16 v150 = 2112;
        v151 = v42;
        __int16 v152 = 2112;
        v153 = v112;
        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_ERROR, "Target for <%@ %@> related to %@ should be known here", buf, 0x20u);
      }
    }
    v113 = +[NSAssertionHandler currentHandler];
    v114 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCKBatchUploadPlanner.m"];
    [v113 handleFailureInMethod:a2, self, v114, 929, @"Target for <%@ %@> related to %@ should be known here", -[CPLRecordChange relatedRecordClass](self->_currentRecordChange, "relatedRecordClass"), v42, self->_currentRecordChange object file lineNumber description];
LABEL_107:

    abort();
  }
  if (![(CPLRecordChange *)v36 hasChangeType:64]) {
    goto LABEL_53;
  }
  v37 = self->_currentRecordChange;
  v38 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification scopeIdentifier];
  LOBYTE(v37) = [(CPLRecordChange *)v37 isSharedInScopeWithIdentifier:v38];

  if ((v37 & 1) == 0)
  {
    if ([(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord])
    {
LABEL_53:
      if (![(CPLRecordChange *)self->_currentRecordChange hasChangeType:2]) {
        goto LABEL_63;
      }
      if ([(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord])goto LABEL_63; {
      uint64_t v68 = [(CPLRecordChange *)self->_currentRecordChange relatedScopedIdentifier];
      }
      if (!v68) {
        goto LABEL_63;
      }
      __int16 v69 = (void *)v68;
      CFStringRef v70 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v68];
      id v71 = [v70 targetState];

      if (v71 != (id)2) {
        goto LABEL_63;
      }
      int v72 = 1;
      CFStringRef v73 = @"private asset is pointing to indirect master";
      goto LABEL_59;
    }
    int v72 = 1;
    CFStringRef v73 = @"private asset needs to copy shared master back to private zone";
LABEL_59:
    id v42 = self->_currentRecordChange;
    v44 = [(CPLRecordChange *)v42 masterScopedIdentifier];
    if (!v44
      || ([(NSMutableSet *)self->_mastersUploadedToPrivateZone containsObject:v44] & 1) != 0)
    {
      goto LABEL_61;
    }
    if (v72) {
      [(CPLCKBatchUploadPlanner *)self _noteRecordWithScopedIdentifierWillMoveToSplitState:v44];
    }
    [(CPLCKUnsharePlan *)self->_unsharePlan removeShareTodoForScopedIdentifier:v44];
    v77 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v44];
    if (v77)
    {
      v61 = v77;
      if ([v77 targetState] != (id)2) {
        goto LABEL_48;
      }
      id v78 = objc_alloc((Class)CKRecordID);
      [v61 scopedIdentifier];
      v80 = v79 = v61;
      v81 = [v80 identifier];
      v82 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zoneID];
      id v126 = [v78 initWithRecordName:v81 zoneID:v82];

      id v83 = objc_alloc((Class)CKRecordID);
      v129 = v79;
      v84 = [v79 otherScopedIdentifier];
      v85 = [v84 identifier];
      v86 = v85;
      if (!v85)
      {
        id v123 = [v129 scopedIdentifier];
        v86 = [v123 identifier];
      }
      v87 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification zoneID];
      id v88 = [v83 initWithRecordName:v86 zoneID:v87];

      if (!v85)
      {
      }
      v89 = (char *)[(NSMutableArray *)self->_ckRecordsToUpload count] - 1;
      [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v126 onBehalfOfRecordWithScopedIdentifier:v44];
      [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v88 onBehalfOfRecordWithScopedIdentifier:v44];
      v135[0] = _NSConcreteStackBlock;
      v135[1] = 3221225472;
      v135[2] = sub_10003C118;
      v135[3] = &unk_100277868;
      v135[4] = self;
      id v136 = v44;
      id v137 = v88;
      id v138 = v126;
      v139 = (__CFString *)v73;
      v140 = v89;
      id v50 = v126;
      id v49 = v88;
      [(CPLCKBatchUploadPlanner *)self requestSharedCKRecordWithRecordIDBeforeUpload:v49 fetchedBlock:v135 reason:v73];

LABEL_47:
      v61 = v129;
LABEL_48:

LABEL_61:
      goto LABEL_62;
    }
    if (!_CPLSilentLogging)
    {
      v115 = sub_100038278();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v149 = v44;
        __int16 v150 = 2112;
        v151 = v42;
        _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "Missing target for %@ to upload %@", buf, 0x16u);
      }
    }
    v113 = +[NSAssertionHandler currentHandler];
    v114 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCKBatchUploadPlanner.m"];
    [v113 handleFailureInMethod:a2, self, v114, 886, @"Missing target for %@ to upload %@", v44, v42, v117 object file lineNumber description];
    goto LABEL_107;
  }
  if (![(CPLRecordChange *)self->_currentRecordChange _relatedRecordShouldBeShared]|| ([(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord] & 1) != 0)
  {
    goto LABEL_53;
  }
  v39 = [(CPLRecordChange *)self->_currentRecordChange relatedScopedIdentifier];
  v40 = a2;
  if (!v39
    || ([(NSMutableSet *)self->_mastersUploadedToPrivateZone containsObject:v39] & 1) != 0)
  {
    id v41 = v39;
LABEL_34:

    a2 = v40;
    goto LABEL_53;
  }
  v90 = [(NSMutableDictionary *)self->_mastersNotYetUploadedToPrivateZone objectForKeyedSubscript:v39];
  v91 = v90;
  if (!v90)
  {
LABEL_100:

    int v72 = 0;
    CFStringRef v73 = @"asset/master needs to be uploaded to private zone first before being shared";
    a2 = v40;
    goto LABEL_59;
  }
  if ([v90 isFullRecord])
  {
    uint64_t v92 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v39];
    if (v92)
    {
      v93 = (void *)v92;
      v94 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zone];
      v122 = v93;
      uint64_t v95 = CPLBaseCKRecordFromCPLRecordChange(v91, v94, v93);

      v127 = (void *)v95;
      v130 = [[CPLSimpleCKRecordBuilder alloc] initWithBaseCKRecord:v95 scopeProvider:self currentUserRecordID:self->_currentUserRecordID targetMapping:self->_targetMapping];
      sharedCKRecordsToUpload = self->_sharedCKRecordsToUpload;
      v142[0] = _NSConcreteStackBlock;
      v142[1] = 3221225472;
      v142[2] = sub_10003C0A4;
      v142[3] = &unk_100277840;
      id v41 = v39;
      id v143 = v41;
      id v97 = [(NSMutableArray *)sharedCKRecordsToUpload indexOfObjectWithOptions:2 passingTest:v142];
      if (v97 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v98 = v97;
        if (!_CPLSilentLogging)
        {
          v99 = sub_100038278();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v149 = v41;
            _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEBUG, "Removing shared master %@ from uploads as it will be moved later", buf, 0xCu);
          }
        }
        [(NSMutableArray *)self->_sharedCKRecordsToUpload removeObjectAtIndex:v98];
      }
      v100 = objc_alloc_init(CPLCloudKitResourceCountAndSize);
      id v141 = 0;
      unsigned int v101 = [v91 prepareWithCKRecordBuilder:v130 resourceCountAndSize:v100 scopeProvider:self error:&v141];
      id v123 = v141;
      unsigned int v120 = v101;
      if (v101)
      {
        if (self->_metric)
        {
          if (sub_1000379A4((uint64_t)v100) || sub_1000379D4((uint64_t)v100))
          {
            [(CPLCloudKitUploadMetric *)self->_metric setItemCount:(char *)[(CPLCloudKitUploadMetric *)self->_metric itemCount] + 1];
            [(CPLCloudKitUploadMetric *)self->_metric setUploadSize:(char *)[(CPLCloudKitUploadMetric *)self->_metric uploadSize] + sub_1000379A4((uint64_t)v100)];
            [(CPLCloudKitUploadMetric *)self->_metric setReferencedResourcesSize:(char *)[(CPLCloudKitUploadMetric *)self->_metric referencedResourcesSize]+ sub_1000379D4((uint64_t)v100)];
            [(CPLCloudKitUploadMetric *)self->_metric setReferencedResourcesCount:(char *)[(CPLCloudKitUploadMetric *)self->_metric referencedResourcesCount]+ sub_1000379BC((uint64_t)v100)];
          }
          else
          {
            [(CPLCloudKitUploadMetric *)self->_metric setOtherItemCount:(char *)[(CPLCloudKitUploadMetric *)self->_metric otherItemCount] + 1];
          }
        }
        if (!_CPLSilentLogging)
        {
          v102 = sub_100038278();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            [v127 recordID];
            v103 = v119 = v100;
            v118 = (CPLRecordChange *)[(CPLRecordChange *)self->_currentRecordChange recordClass];
            v104 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
            *(_DWORD *)buf = 138543874;
            id v149 = v103;
            __int16 v150 = 2112;
            v151 = v118;
            __int16 v152 = 2112;
            v153 = v104;
            _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "Will update %{public}@ (triggered by sharing <%@ %@>)", buf, 0x20u);

            v100 = v119;
          }
        }
        [(CPLCKBatchUploadPlanner *)self _noteMasterWillBeUploadedToPrivateZone:v41];
        ckRecordsToUpload = self->_ckRecordsToUpload;
        v106 = (char *)[(NSMutableArray *)ckRecordsToUpload count] - 1;
        v107 = ckRecordsToUpload;
        v108 = v127;
        [(NSMutableArray *)v107 insertObject:v127 atIndex:v106];
        v109 = [v127 recordID];
        [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v109 onBehalfOfRecordWithScopedIdentifier:v41];
      }
      else
      {
        v108 = v127;
        if (_CPLSilentLogging) {
          goto LABEL_98;
        }
        v109 = sub_100038278();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v149 = v91;
          __int16 v150 = 2112;
          v151 = (CPLRecordChange *)v123;
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Failed to create CKRecord for %@: %@", buf, 0x16u);
        }
      }

LABEL_98:
      if (v120)
      {

        goto LABEL_34;
      }
      goto LABEL_100;
    }
  }
  else
  {
    sub_1001C7158(v91, a2, self);
  }
  uint64_t v116 = sub_1001C7080(v91, a2, self);
  return sub_10003BF04(v116);
}

- (void)_copyPrivateMasterWithScopedIdentifier:(id)a3 masterTarget:(id)a4 uploadIndex:(unint64_t)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc((Class)CKRecordID);
  long long v14 = [v11 otherScopedIdentifier];
  long long v15 = [v14 identifier];
  long long v16 = v15;
  if (!v15)
  {
    BOOL v6 = [v11 scopedIdentifier];
    long long v16 = [v6 identifier];
  }
  long long v17 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification zoneID];
  id v18 = [v13 initWithRecordName:v16 zoneID:v17];

  if (!v15)
  {
  }
  id v19 = objc_alloc((Class)CKRecordID);
  CFStringRef v20 = [v11 scopedIdentifier];
  id v21 = [v20 identifier];
  id v22 = [(CPLCloudKitZoneIdentification *)self->_destinationZoneIdentification zoneID];
  id v23 = [v19 initWithRecordName:v21 zoneID:v22];

  [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v18 onBehalfOfRecordWithScopedIdentifier:v10];
  [(CPLCKBatchUploadPlanner *)self _willUpdateCKRecordWithID:v23 onBehalfOfRecordWithScopedIdentifier:v10];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10003C64C;
  v33[3] = &unk_100277890;
  v33[4] = self;
  id v34 = v10;
  id v35 = v11;
  id v36 = v18;
  id v37 = v23;
  id v38 = v12;
  uint64_t v39 = v30;
  uint64_t v40 = v32;
  id v24 = v12;
  id v25 = v23;
  id v26 = v18;
  id v27 = v11;
  id v28 = v10;
  [(CPLCKBatchUploadPlanner *)self requestPrivateCKRecordWithRecordIDBeforeUpload:v25 fetchedBlock:v33 reason:v24];
}

- (BOOL)_shouldUpdateKeyOnSharedCKRecord:(id)a3
{
  id v5 = a3;
  if (![(CPLCKRecordPropertyMapping *)self->_propertyMapping isKeyReadOnly:v5 recordClass:[(CPLRecordChange *)self->_currentRecordChange recordClass]]&& self->_sharedZoneIdentification&& [(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord]&& [(CPLCKRecordPropertyMapping *)self->_propertyMapping shouldUpdateKeyOnSharedRecord:v5 recordClass:[(CPLRecordChange *)self->_currentRecordChange recordClass]])
  {
    if (!self->_sharedCKRecordToUpload)
    {
      currentRecordChange = self->_currentRecordChange;
      double v9 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification zone];
      CPLBaseSharedCKRecordFromCPLRecordChange(currentRecordChange, v9, self->_currentRecordTarget);
      id v10 = (CKRecord *)objc_claimAutoreleasedReturnValue();
      sharedCKRecordToUpload = self->_sharedCKRecordToUpload;
      self->_sharedCKRecordToUpload = v10;

      id v12 = [[CPLSimpleCKRecordBuilder alloc] initWithBaseCKRecord:self->_sharedCKRecordToUpload scopeProvider:self currentUserRecordID:self->_currentUserRecordID targetMapping:self->_targetMapping];
      simpleBuilderForSharedCKRecord = self->_simpleBuilderForSharedCKRecord;
      self->_simpleBuilderForSharedCKRecord = v12;

      if ([(CPLRecordChange *)self->_currentRecordChange isMasterChange])
      {
        long long v14 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
        [(CPLCKBatchUploadPlanner *)self _noteMasterWillBeUploadedToSharedZone:v14];
      }
      recordModificationDate = self->_recordModificationDate;
      if (recordModificationDate) {
        [self->_sharedCKRecordToUpload setObject:recordModificationDate forKey:@"recordModificationDate"];
      }
      long long v16 = self->_sharedCKRecordToUpload;
      long long v17 = [(CPLRecordChange *)self->_currentRecordChange scopedIdentifier];
      [(CPLCKBatchUploadPlanner *)self uploadSharedCKRecord:v16 forScopedIdentifier:v17 triggeringKey:v5];

      if (self->_sharedZoneIdentification)
      {
        if ([(CPLRecordChange *)self->_currentRecordChange isAssetChange])
        {
          if ([(CPLRecordChange *)self->_currentRecordChange hasChangeType:2])
          {
            if ([(CPLRecordTarget *)self->_currentRecordTarget shouldUploadToOtherRecord])
            {
              uint64_t v18 = [(CPLRecordChange *)self->_currentRecordChange relatedScopedIdentifier];
              if (v18)
              {
                id v19 = (void *)v18;
                CFStringRef v20 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v18];
                unsigned __int8 v21 = [v20 shouldUploadToOtherRecord];

                if ((v21 & 1) == 0)
                {
                  id v22 = self->_currentRecordChange;
                  id v23 = [(CPLRecordChange *)v22 masterScopedIdentifier];
                  if (v23
                    && ([(NSMutableSet *)self->_mastersUploadedToPrivateZone containsObject:v23] & 1) == 0)
                  {
                    [(CPLCKBatchUploadPlanner *)self _noteRecordWithScopedIdentifierWillMoveToSplitState:v23];
                    id v24 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v23];
                    if (!v24)
                    {
                      if (!_CPLSilentLogging)
                      {
                        id v26 = sub_100038278();
                        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v30 = v23;
                          __int16 v31 = 2112;
                          uint64_t v32 = v22;
                          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Missing target for %@ to upload %@", buf, 0x16u);
                        }
                      }
                      id v27 = +[NSAssertionHandler currentHandler];
                      id v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCKBatchUploadPlanner.m"];
                      [v27 handleFailureInMethod:a2, self, v28, 1107, @"Missing target for %@ to upload %@", v23, v22 object file lineNumber description];

                      abort();
                    }
                    id v25 = v24;
                    if (([v24 shouldUploadToOtherRecord] & 1) == 0) {
                      [(CPLCKBatchUploadPlanner *)self _copyPrivateMasterWithScopedIdentifier:v23 masterTarget:v25 uploadIndex:(char *)[(NSMutableArray *)self->_sharedCKRecordsToUpload count] - 1 reason:@"shared asset is pointing to direct master"];
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v20 = a3;
  id v8 = a4;
  double v9 = v8;
  if (self->_recordModificationDate
    || ![v8 isEqualToString:@"recordModificationDate"])
  {
    if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnCKRecord:v9]) {
      [(CPLSimpleCKRecordBuilder *)self->_simpleBuilder setObject:v20 forKey:v9];
    }
    if (![(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnSharedCKRecord:v9]) {
      goto LABEL_16;
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    sharedCKRecordToUpload = self->_sharedCKRecordToUpload;
    if (isKindOfClass)
    {
      long long v14 = [v20 cplCopyCleanAsset];
      [sharedCKRecordToUpload setObject:v14 forKey:v9];

      goto LABEL_16;
    }
    id v11 = sharedCKRecordToUpload;
LABEL_15:
    [(CKRecord *)v11 setObject:v20 forKey:v9];
    goto LABEL_16;
  }
  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v15 = (CPLCKBatchUploadPlanner *)sub_1001C74F0(v20, a2, self);
      [(CPLCKBatchUploadPlanner *)v15 setEncryptedObject:v17 forKey:v18 validateClass:v19];
      return;
    }
    objc_storeStrong((id *)&self->_recordModificationDate, a3);
    ckRecordToUpload = self->_ckRecordToUpload;
    if (ckRecordToUpload) {
      [(CKRecord *)ckRecordToUpload setObject:v20 forKey:v9];
    }
    id v11 = self->_sharedCKRecordToUpload;
    if (v11) {
      goto LABEL_15;
    }
  }
LABEL_16:
}

- (void)setEncryptedObject:(id)a3 forKey:(id)a4 validateClass:(Class)a5
{
  id v9 = a3;
  id v8 = a4;
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnCKRecord:v8]) {
    [(CPLSimpleCKRecordBuilder *)self->_simpleBuilder setEncryptedObject:v9 forKey:v8 validateClass:a5];
  }
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnSharedCKRecord:v8]) {
    [self->_sharedCKRecordToUpload cpl_setEncryptedObject:v9 forKey:v8 validateClass:a5];
  }
}

- (void)setLegacyEncryptedObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnCKRecord:v6]) {
    [(CPLSimpleCKRecordBuilder *)self->_simpleBuilder setLegacyEncryptedObject:v7 forKey:v6];
  }
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnSharedCKRecord:v6]) {
    [self->_sharedCKRecordToUpload cpl_setLegacyEncryptedObject:v7 forKey:v6];
  }
}

- (void)setCKAsset:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnCKRecord:v6])
  {
    [(CPLSimpleCKRecordBuilder *)self->_simpleBuilder setCKAsset:v9 forKey:v6];
    if (![(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnSharedCKRecord:v6]) {
      goto LABEL_7;
    }
    id v7 = [v9 cplCopyCleanAsset];
  }
  else
  {
    if (![(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnSharedCKRecord:v6]) {
      goto LABEL_7;
    }
    id v7 = v9;
  }
  id v8 = v7;
  [self->_sharedCKRecordToUpload setObject:v7 forKey:v6];

LABEL_7:
}

- (void)setCKReferenceWithScopedIdentifier:(id)a3 forKey:(id)a4 referenceAction:(unint64_t)a5
{
  id v15 = a3;
  id v8 = a4;
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnCKRecord:v8]) {
    [(CPLSimpleCKRecordBuilder *)self->_simpleBuilder setCKReferenceWithScopedIdentifier:v15 forKey:v8 referenceAction:a5];
  }
  if ([(CPLCKBatchUploadPlanner *)self _shouldUpdateKeyOnSharedCKRecord:v8])
  {
    id v9 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v15];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 otherScopedIdentifier];
      id v12 = [v11 identifier];
    }
    else
    {
      id v12 = [v15 identifier];
    }
    id v13 = [(CPLCloudKitZoneIdentification *)self->_sharedZoneIdentification recordIDWithRecordName:v12];
    id v14 = [objc_alloc((Class)CKReference) initWithRecordID:v13 action:a5];
    [self->_sharedCKRecordToUpload setObject:v14 forKey:v8];
  }
}

- (void)requestRecordWithID:(id)a3 cloudKitScope:(id)a4 forKey:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [(CPLCKBatchUploadPlanner *)self recordBuilderForKey:a5];
  if (!self->_recordRequestor)
  {
    id v14 = [[CPLCKRecordRequestor alloc] initWithFetchCache:self->_fetchCache scopeProvider:self];
    recordRequestor = self->_recordRequestor;
    self->_recordRequestor = v14;
  }
  SEL v16 = self->_recordRequestor;
  id v17 = self->_currentRecordID;
  uint64_t v18 = CPLCloudKitOperationTypeForScope(v10);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003D470;
  v21[3] = &unk_1002778B8;
  id v22 = v13;
  id v23 = v11;
  id v19 = v13;
  id v20 = v11;
  [(CPLCKRecordRequestor *)v16 requestRecordWithRecordID:v12 operationType:v18 forRecordWithRecordID:v17 completionHandler:v21];
}

- (id)_recordIDFromScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 scopeIdentifier];
  id v10 = [(CPLCKBatchUploadPlanner *)self cloudKitScopeForScopeIdentifier:v9];

  if (v10)
  {
    id v11 = [v8 identifier];
    a5 = [v10 recordIDWithRecordName:v11];

    *a4 = v10;
  }
  else if (a5)
  {
    id v12 = [v8 scopeIdentifier];
    *a5 = +[CPLErrors cplErrorWithCode:2001, @"Can't find CloudKit scope for %@", v12 description];

    a5 = 0;
  }

  return a5;
}

- (id)recordIDForResourcesOfRecordWithScopedIdentifier:(id)a3 cloudKitScope:(id *)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v9];
  if (v10)
  {
    id v11 = v10;
    id v12 = [v10 resourceScopedIdentifier];
    id v13 = [(CPLCKBatchUploadPlanner *)self _recordIDFromScopedIdentifier:v12 cloudKitScope:a4 error:a5];

    return v13;
  }
  else
  {
    id v15 = (CPLCKBatchUploadPlanner *)sub_1001C76C4(v9, a2, self);
    return [(CPLCKBatchUploadPlanner *)v15 scopeProvider];
  }
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (CPLCloudKitZoneIdentification)destinationZoneIdentification
{
  return self->_destinationZoneIdentification;
}

- (CPLCloudKitZoneIdentification)sharedZoneIdentification
{
  return self->_sharedZoneIdentification;
}

- (CPLCKRecordPropertyMapping)propertyMapping
{
  return self->_propertyMapping;
}

- (CKRecordID)currentUserRecordID
{
  return self->_currentUserRecordID;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (CPLCKRecordFetchCache)fetchCache
{
  return self->_fetchCache;
}

- (NSDate)cplEnabledDate
{
  return self->_cplEnabledDate;
}

- (void)setCplEnabledDate:(id)a3
{
}

- (CPLCloudKitUploadMetric)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (CPLCKRecordRequestor)recordRequestor
{
  return self->_recordRequestor;
}

- (void)setRecordRequestor:(id)a3
{
}

- (NSArray)ckRecordsToUpload
{
  return &self->_ckRecordsToUpload->super;
}

- (NSArray)ckRecordIDsToDelete
{
  return &self->_ckRecordIDsToDelete->super;
}

- (NSArray)sharedCKRecordsToUpload
{
  return &self->_sharedCKRecordsToUpload->super;
}

- (NSArray)sharedCKRecordIDsToDelete
{
  return &self->_sharedCKRecordIDsToDelete->super;
}

- (double)totalDurationOfUpload
{
  return self->_totalDurationOfUpload;
}

- (CPLCKSharePlan)sharePlan
{
  return self->_sharePlan;
}

- (CPLCKUnsharePlan)unsharePlan
{
  return self->_unsharePlan;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsharePlan, 0);
  objc_storeStrong((id *)&self->_sharePlan, 0);
  objc_storeStrong((id *)&self->_recordRequestor, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_metric, 0);
  objc_storeStrong((id *)&self->_cplEnabledDate, 0);
  objc_storeStrong((id *)&self->_fetchCache, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_currentUserRecordID, 0);
  objc_storeStrong((id *)&self->_propertyMapping, 0);
  objc_storeStrong((id *)&self->_sharedZoneIdentification, 0);
  objc_storeStrong((id *)&self->_destinationZoneIdentification, 0);
  objc_storeStrong((id *)&self->_scopeProvider, 0);
  objc_storeStrong((id *)&self->_dateOfFirstUploadProgress, 0);
  objc_storeStrong((id *)&self->_progressSizesPerRecordID, 0);
  objc_storeStrong((id *)&self->_sizesPerRecordID, 0);
  objc_storeStrong((id *)&self->_sharedUploadContext, 0);
  objc_storeStrong((id *)&self->_uploadContext, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiersNeedingToCallProgressHandler, 0);
  objc_storeStrong((id *)&self->_recordModificationDate, 0);
  objc_storeStrong((id *)&self->_unionBuilderForCKRecords, 0);
  objc_storeStrong((id *)&self->_simpleBuilderForSharedCKRecord, 0);
  objc_storeStrong((id *)&self->_sharedCKRecordToUpload, 0);
  objc_storeStrong((id *)&self->_sharedRecordID, 0);
  objc_storeStrong((id *)&self->_ckRecordToUpload, 0);
  objc_storeStrong((id *)&self->_pendingCKRecordToUpload, 0);
  objc_storeStrong((id *)&self->_simpleBuilder, 0);
  objc_storeStrong((id *)&self->_currentRecordID, 0);
  objc_storeStrong((id *)&self->_currentRecordTarget, 0);
  objc_storeStrong((id *)&self->_currentRecordChange, 0);
  objc_storeStrong((id *)&self->_indirectRecordsUploadedToPrivateZone, 0);
  objc_storeStrong((id *)&self->_mastersNotYetUploadedToSharedZone, 0);
  objc_storeStrong((id *)&self->_mastersUploadedToSharedZone, 0);
  objc_storeStrong((id *)&self->_mastersNotYetUploadedToPrivateZone, 0);
  objc_storeStrong((id *)&self->_mastersUploadedToPrivateZone, 0);
  objc_storeStrong((id *)&self->_requestedPrivateCKRecordIDs, 0);
  objc_storeStrong((id *)&self->_requestedSharedCKRecordIDs, 0);
  objc_storeStrong((id *)&self->_dontUnshareScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedCKRecordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_sharedCKRecordsToUpload, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiersMovingToSplitState, 0);
  objc_storeStrong((id *)&self->_ckRecordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_ckRecordsToUpload, 0);
  objc_storeStrong((id *)&self->_ckRecordIDToRejectedScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_ckRecordIDToScopedIdentifier, 0);
}

@end