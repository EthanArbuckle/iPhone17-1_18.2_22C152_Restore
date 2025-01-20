@interface CPLCloudKitMoveBackCopyHelper
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (CKRecordID)userRecordID;
- (CPLCloudKitMoveBackCopyHelper)initWithUserRecordID:(id)a3 scopeProvider:(id)a4;
- (CPLCloudKitScopeProvider)scopeProvider;
- (CPLFingerprintContext)fingerprintContext;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
@end

@implementation CPLCloudKitMoveBackCopyHelper

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)[(CPLCloudKitScopeProvider *)self->_scopeProvider fingerprintContext];
}

- (CPLCloudKitMoveBackCopyHelper)initWithUserRecordID:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CPLCloudKitMoveBackCopyHelper;
  v9 = [(CPLCloudKitMoveBackCopyHelper *)&v15 init];
  if (v9)
  {
    uint64_t v10 = +[CPLCKRecordPropertyMapping sharedInstance];
    mapping = v9->_mapping;
    v9->_mapping = (CPLCKRecordPropertyMapping *)v10;

    uint64_t v12 = +[NSDate date];
    recordModificationDate = v9->_recordModificationDate;
    v9->_recordModificationDate = (NSDate *)v12;

    objc_storeStrong((id *)&v9->_userRecordID, a3);
    objc_storeStrong((id *)&v9->_scopeProvider, a4);
  }

  return v9;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  id v4 = a4;
  v5 = [v4 objectForKeyedSubscript:@"remappedRef"];

  if (v5 && !_CPLSilentLogging)
  {
    v6 = sub_1000BC19C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 recordType];
      id v8 = [v4 recordID];
      v9 = [v8 cplFullDescription];
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring remapped <%@ %@>", (uint8_t *)&v11, 0x16u);
    }
  }

  return v5 == 0;
}

- (void)prepareCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  objc_msgSend(a4, "recordType", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  self->_recordClass = (Class)CPLRecordChangeClassForCKRecordType(v5);
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v7, "cpl_destinationRecordIDInPrivateScopeWithCurrentUserRecordID:proposedDestinationRecordID:", self->_userRecordID, v8);
  if (([v9 isEqual:v8] & 1) == 0 && !_CPLSilentLogging)
  {
    uint64_t v10 = sub_1000BC19C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v7 recordID];
      uint64_t v12 = [v11 cplFullDescription];
      __int16 v13 = [v9 cplFullDescription];
      v14 = [v8 cplFullDescription];
      int v19 = 138412802;
      v20 = v12;
      __int16 v21 = 2112;
      v22 = v13;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Moving %@ to %@ instead of %@", (uint8_t *)&v19, 0x20u);
    }
  }
  id v15 = objc_alloc((Class)CKRecord);
  v16 = [v7 recordType];
  id v17 = [v15 initWithRecordType:v16 recordID:v9];

  return v17;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  return 1;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 setObject:self->_recordModificationDate forKey:@"recordModificationDate"];
  [v5 setObject:0 forKey:@"linkedShareZoneName"];
  [v5 setObject:0 forKey:@"linkedShareZoneOwner"];
  [v5 setObject:0 forKey:@"linkedShareRecordName"];
  return v5;
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
  return [(CPLCloudKitScopeProvider *)self->_scopeProvider scopedIdentifierForCKRecordID:a3];
}

- (id)rejectedScopedIdentifierForRejectedCKRecordID:(id)a3
{
  return [(CPLCloudKitScopeProvider *)self->_scopeProvider rejectedScopedIdentifierForRejectedCKRecordID:a3];
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (CPLCloudKitScopeProvider)scopeProvider
{
  return self->_scopeProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopeProvider, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_recordModificationDate, 0);
  objc_storeStrong((id *)&self->_mapping, 0);
}

@end