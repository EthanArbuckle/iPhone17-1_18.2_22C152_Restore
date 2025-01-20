@interface CPLCloudKitReshareRecordsTask
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CPLCloudKitReshareRecordsTask)initWithController:(id)a3 records:(id)a4 sourceScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (CPLEngineScope)destinationScope;
- (CPLEngineScope)sourceScope;
- (NSDictionary)records;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)completionHandler;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (void)_deleteSourceRecordIDs:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitReshareRecordsTask

- (CPLCloudKitReshareRecordsTask)initWithController:(id)a3 records:(id)a4 sourceScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)CPLCloudKitReshareRecordsTask;
  v19 = [(CPLCloudKitTransportTask *)&v25 initWithController:a3];
  if (v19)
  {
    v20 = (NSDictionary *)[v14 copy];
    records = v19->_records;
    v19->_records = v20;

    id v22 = [v18 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v22;

    objc_storeStrong((id *)&v19->_sourceScope, a5);
    objc_storeStrong((id *)&v19->_destinationScope, a6);
    [(CPLCloudKitTransportTask *)v19 setTransportScopeMapping:v17];
  }

  return v19;
}

- (void)_deleteSourceRecordIDs:(id)a3
{
  id v4 = a3;
  id v14 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v14];
  id v6 = v14;
  if (v5)
  {
    id v7 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:0 recordIDsToDelete:v4];
    v8 = [(CPLCloudKitTransportTask *)self fetchCache];
    v9 = v8;
    if (v8)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10006E830;
      v12[3] = &unk_1002779A0;
      v12[4] = self;
      id v13 = v8;
      [v7 setPerRecordDeleteBlock:v12];
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006E8EC;
    v10[3] = &unk_100278DE8;
    v10[4] = self;
    id v11 = v4;
    [v7 setModifyRecordsCompletionBlock:v10];
    [(CPLCloudKitTransportTask *)self launchOperation:v7 type:[(CPLCloudKitZoneIdentification *)self->_sourceIdentification operationType] withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  v42[0] = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:v42];
  id v4 = v42[0];
  if (v3)
  {
    unsigned __int8 v5 = [(CPLEngineScope *)self->_sourceScope scopeIdentifier];
    id v6 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v5];

    id v7 = [v6 zoneID];

    if (v7)
    {
      v8 = [(CPLEngineScope *)self->_destinationScope scopeIdentifier];
      v9 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v8];

      v10 = [v9 zoneID];

      if (v10)
      {
        id v11 = [(CPLCloudKitTransportTask *)self controller];
        v12 = [v11 zoneIdentificationForCloudKitScope:v6 engineScope:self->_sourceScope];
        sourceIdentification = self->_sourceIdentification;
        self->_sourceIdentification = v12;

        id v14 = [(CPLCloudKitTransportTask *)self controller];
        id v15 = [v14 zoneIdentificationForCloudKitScope:v9 engineScope:self->_destinationScope];
        destinationIdentification = self->_destinationIdentification;
        self->_destinationIdentification = v15;

        id v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSDictionary count](self->_records, "count"));
        id v18 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSDictionary count](self->_records, "count"));
        id v19 = objc_alloc_init((Class)NSMutableArray);
        v20 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSDictionary count](self->_records, "count"));
        rejectedMapping = self->_rejectedMapping;
        self->_rejectedMapping = v20;

        records = self->_records;
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_10006F000;
        v38[3] = &unk_100278E10;
        v38[4] = self;
        id v23 = v19;
        id v39 = v23;
        id v40 = v17;
        id v41 = v18;
        id v24 = v18;
        id v25 = v17;
        [(NSDictionary *)records enumerateKeysAndObjectsUsingBlock:v38];
        v26 = +[NSDate date];
        recordModificationDate = self->_recordModificationDate;
        self->_recordModificationDate = v26;

        v28 = +[CPLCKRecordPropertyMapping sharedInstance];
        mapping = self->_mapping;
        self->_mapping = v28;

        int64_t v30 = [(CPLCloudKitZoneIdentification *)self->_sourceIdentification operationType];
        int64_t v31 = [(CPLCloudKitZoneIdentification *)self->_destinationIdentification operationType];
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10006F148;
        v35[3] = &unk_100278E38;
        id v36 = v23;
        v37 = self;
        id v32 = v23;
        [(CPLCloudKitTransportTask *)self moveRecordsWithIDs:v25 followRemapping:1 sourceType:v30 destinationRecordIDs:v24 destinationType:v31 helper:self completionHandler:v35];
      }
      else
      {
        id completionHandler = (void (**)(id, id))self->_completionHandler;
        id v25 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone for destination scope"];
        completionHandler[2](completionHandler, v25);
      }
    }
    else
    {
      v33 = (void (**)(id, void *))self->_completionHandler;
      v9 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone for source scope"];
      v33[2](v33, v9);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSMutableDictionary *)self->_rejectedMapping objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = objc_alloc((Class)CPLScopedIdentifier);
    v9 = [(CPLCloudKitZoneIdentification *)self->_destinationIdentification scopeIdentifier];
    v10 = [v4 recordName];
    id v7 = [v8 initWithScopeIdentifier:v9 identifier:v10];
  }
  return v7;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CPLCloudKitTransportTask *)self scopedIdentifierForCKRecordID:v7];
  currentSourceScopedIdentifier = self->_currentSourceScopedIdentifier;
  self->_currentSourceScopedIdentifier = v9;

  if (!self->_currentSourceScopedIdentifier) {
    sub_1001CB484((uint64_t)v7, (uint64_t)a2, (uint64_t)self);
  }
  -[NSDictionary objectForKeyedSubscript:](self->_records, "objectForKeyedSubscript:");
  id v11 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue();
  currentSharedRecord = self->_currentSharedRecord;
  self->_currentSharedRecord = v11;

  if (!self->_currentSharedRecord) {
    sub_1001CB56C(&self->_currentSourceScopedIdentifier, (uint64_t)a2, (uint64_t)self);
  }
  unint64_t v18 = (unint64_t)v7;
  uint64_t v13 = [v8 recordID];
  if (v18 && v13)
  {
    unsigned __int8 v14 = [(id)v18 isEqual:v13];

    if (v14) {
      goto LABEL_11;
    }
  }
  else
  {

    if (!(v18 | v13)) {
      goto LABEL_11;
    }
  }
  id v15 = [(NSMutableDictionary *)self->_rejectedMapping objectForKeyedSubscript:v18];
  if (v15)
  {
    rejectedMapping = self->_rejectedMapping;
    id v17 = [v8 recordID];
    [(NSMutableDictionary *)rejectedMapping setObject:v15 forKeyedSubscript:v17];
  }
LABEL_11:
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CPLRecordChange *)self->_currentSharedRecord recordChangeData];
  if (!v9
    || (+[CPLArchiver unarchiveObjectWithData:v9 ofClass:objc_opt_class()], v10 = objc_claimAutoreleasedReturnValue(), (id v11 = v10) == 0))
  {
LABEL_16:
    id v26 = objc_alloc((Class)CKRecord);
    v27 = [v7 recordType];
    id v11 = [v26 initWithRecordType:v27 recordID:v8];

    [v11 setKnownToServer:1];
    [v11 setEtag:@"-gateon"];
    goto LABEL_17;
  }
  v12 = [v10 recordType];
  uint64_t v13 = [v7 recordType];
  unsigned __int8 v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v22 = sub_10006EB70();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        currentSourceScopedIdentifier = self->_currentSourceScopedIdentifier;
        id v23 = [(CPLRecordChange *)self->_currentSharedRecord scopedIdentifier];
        id v24 = [v7 recordType];
        id v25 = [v11 recordType];
        *(_DWORD *)buf = 138413058;
        id v39 = currentSourceScopedIdentifier;
        __int16 v40 = 2112;
        id v41 = v23;
        __int16 v42 = 2112;
        v43 = v24;
        __int16 v44 = 2112;
        v45 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Trying to move %@ to %@ but source is %@ while destination is %@", buf, 0x2Au);
      }
    }

    goto LABEL_16;
  }
  id v15 = [v11 recordID];
  unsigned __int8 v16 = [v15 isEqual:v8];

  if (_CPLSilentLogging) {
    char v17 = 1;
  }
  else {
    char v17 = v16;
  }
  if ((v17 & 1) == 0)
  {
    unint64_t v18 = sub_10006EB70();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v36 = self->_currentSourceScopedIdentifier;
      id v19 = [(CPLRecordChange *)self->_currentSharedRecord scopedIdentifier];
      v20 = [v7 recordID];
      v21 = [v11 recordID];
      *(_DWORD *)buf = 138413058;
      id v39 = v36;
      __int16 v40 = 2112;
      id v41 = v19;
      __int16 v42 = 2112;
      v43 = v20;
      __int16 v44 = 2112;
      v45 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Trying to move %@ to %@ but proposed record ID is %@ while expected record ID is %@", buf, 0x2Au);
    }
  }
LABEL_17:
  sourceRelatedRecordName = self->_sourceRelatedRecordName;
  self->_sourceRelatedRecordName = 0;

  v29 = objc_msgSend(-[CPLRecordChange recordClass](self->_currentSharedRecord, "recordClass"), "ckPropertyForRelatedIdentifier");
  if (!v29) {
    goto LABEL_25;
  }
  int64_t v30 = [v7 objectForKeyedSubscript:v29];
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v31 = v30;
      id v32 = self->_sourceRelatedRecordName;
      self->_sourceRelatedRecordName = v31;
LABEL_23:

      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v32 = [v30 recordID];
      v33 = [v32 recordName];
      v34 = self->_sourceRelatedRecordName;
      self->_sourceRelatedRecordName = v33;

      goto LABEL_23;
    }
  }
LABEL_24:

LABEL_25:
  return v11;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"dateExpunged"])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(CPLRecordChange *)self->_currentSharedRecord recordClass];
    if ([(CPLCKRecordPropertyMapping *)self->_mapping isKeyReadOnly:v4 recordClass:v6]) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = [(CPLCKRecordPropertyMapping *)self->_mapping shouldUpdateKeyOnSharedRecord:v4 recordClass:v6];
    }
  }

  return v5;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  sourceRelatedRecordName = self->_sourceRelatedRecordName;
  if (sourceRelatedRecordName && [(NSString *)sourceRelatedRecordName isEqual:v5])
  {
    uint64_t v7 = [(CPLRecordChange *)self->_currentSharedRecord relatedIdentifier];
    id v8 = (void *)v7;
    if (v7) {
      v9 = (void *)v7;
    }
    else {
      v9 = v5;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = v5;
  }

  return v10;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 setObject:self->_recordModificationDate forKey:@"recordModificationDate"];
  id v6 = [(CPLRecordChange *)self->_currentSharedRecord recordClass];
  if (![(CPLCloudKitZoneIdentification *)self->_destinationIdentification supportsDirectDeletionOfRecordClass:v6])
  {
    [v5 setObject:&__kCFBooleanFalse forKey:@"isExpunged"];
    uint64_t v7 = [v5 objectForKey:@"isDeleted"];

    if (!v7) {
      [v5 setObject:&__kCFBooleanFalse forKey:@"isDeleted"];
    }
    if ([v6 isSubclassOfClass:objc_opt_class()]) {
      [v5 setObject:self->_recordModificationDate forKey:@"mostRecentAddedDate"];
    }
  }
  if ([v6 supportsSharingScopedIdentifier])
  {
    [v5 setObject:0 forKey:@"linkedShareZoneName"];
    [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
    [v5 setObject:0 forKey:@"linkedShareRecordName"];
  }
  return v5;
}

- (NSDictionary)records
{
  return self->_records;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (CPLEngineScope)sourceScope
{
  return self->_sourceScope;
}

- (CPLEngineScope)destinationScope
{
  return self->_destinationScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationScope, 0);
  objc_storeStrong((id *)&self->_sourceScope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_rejectedMapping, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong((id *)&self->_sourceRelatedRecordName, 0);
  objc_storeStrong((id *)&self->_currentSharedRecord, 0);
  objc_storeStrong((id *)&self->_currentSourceScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_recordModificationDate, 0);
  objc_storeStrong((id *)&self->_destinationIdentification, 0);
  objc_storeStrong((id *)&self->_sourceIdentification, 0);
}

@end