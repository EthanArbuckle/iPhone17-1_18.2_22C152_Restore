@interface CPLCloudKitLibraryShareZoneIdentification
+ (BOOL)isSupportedShareType:(id)a3;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
+ (id)shareRecordName;
+ (id)shareTypes;
+ (id)supportedZonePrefixes;
+ (int64_t)_scopeTypeForCloudKitScope:(id)a3;
- (BOOL)isSupportedShareType:(id)a3;
- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDownloadOfRecordClass:(Class)a3;
- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (CPLCloudKitScope)stagingCloudKitScope;
- (id)cloudKitScope;
- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3;
- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)scopeFlagsUpdateFromCKRecords:(id)a3;
- (id)shareRecordIDToDelete;
- (id)updatedFlagsFromCKRecord:(id)a3;
- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6;
- (void)setStagingCloudKitScope:(id)a3;
- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4;
- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLCloudKitLibraryShareZoneIdentification

+ (id)supportedZonePrefixes
{
  v4[0] = CPLPrimarySharingScopeIdentifierPrefix;
  v4[1] = CPLPrimarySharingScopeIdentifierPrefixForParallelUniverse;
  v2 = +[NSArray arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return (id)CPLSharingScopePrefixForScopeWithIdentifier();
}

+ (int64_t)_scopeTypeForCloudKitScope:(id)a3
{
  if ([a3 isShared]) {
    return 5;
  }
  else {
    return 4;
  }
}

+ (id)shareRecordName
{
  return CKRecordNameZoneWideShare;
}

+ (id)shareTypes
{
  uint64_t v4 = CKPhotosSharedLibraryShareType;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

+ (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shared_library"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLCloudKitLibraryShareZoneIdentification;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, "isSupportedShareType:", v4);
  }

  return v5;
}

- (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"shared_library"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
    BOOL v5 = [(CPLCloudKitZoneIdentification *)&v7 isSupportedShareType:v4];
  }

  return v5;
}

- (BOOL)supportsZoneDelete
{
  return (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)4;
}

- (BOOL)supportsZoneCreation
{
  return (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)4;
}

- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsSharing])
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
    BOOL v8 = [(CPLCloudKitZoneIdentification *)&v10 supportsUploadOfChange:v6 scopeProvider:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)supportsDownloadOfRecordClass:(Class)a3
{
  unsigned int v5 = [(objc_class *)a3 supportsSharing];
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
    LOBYTE(v5) = [(CPLCloudKitZoneIdentification *)&v7 supportsDownloadOfRecordClass:a3];
  }
  return v5;
}

- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsSharing])
  {
    v10.receiver = self;
    v10.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
    BOOL v8 = [(CPLCloudKitZoneIdentification *)&v10 supportsDownloadOfChange:v6 scopeProvider:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)cloudKitScope
{
  stagingCloudKitScope = self->_stagingCloudKitScope;
  if (stagingCloudKitScope)
  {
    v3 = stagingCloudKitScope;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
    v3 = [(CPLCloudKitZoneIdentification *)&v5 cloudKitScope];
  }
  return v3;
}

- (id)shareRecordIDToDelete
{
  if ((id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)5)
  {
    v3 = [(CPLCloudKitZoneIdentification *)self recordIDWithRecordName:CKRecordNameZoneWideShare];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___CPLCloudKitLibraryShareZoneIdentification;
  objc_super v10 = objc_msgSendSuper2(&v16, "recordsToFetchToIdentifyZoneID:proposedScopeType:currentUserID:", v8, a4, v9);
  id v11 = [v10 mutableCopy];

  id v12 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"ParticipantExitStates" zoneID:v8];
  [v11 addObject:v12];

  id v13 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"ExitConfig" zoneID:v8];
  [v11 addObject:v13];

  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing])
  {
    v14 = CPLLibraryShareSettingsRecordID(v8, v9);
    if (v14) {
      [v11 addObject:v14];
    }
  }
  return v11;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  id v12 = [(CPLCloudKitLibraryZoneIdentification *)&v28 scopeChangeFromCKRecords:v9 currentUserID:v10 previousScopeChange:v11];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_1001CDCE8(self, (uint64_t)v12, (uint64_t)a2);
  }
  id v13 = [(CPLCloudKitZoneIdentification *)self zoneID];
  v14 = [v9 cplRecordWithName:@"ParticipantExitStates" zonedID:v13];

  if (v14)
  {
    v15 = [v14 recordType];
    unsigned int v16 = [v15 isEqualToString:@"ParticipantExitStates"];

    if (v16) {
      [v12 updateWithExitStatesRecord:v14];
    }
  }
  if (self->_stagingCloudKitScope || (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)4)
  {
    v17 = [(CPLCloudKitZoneIdentification *)self zoneID];
    v18 = [v9 cplRecordWithName:@"ExitConfig" zonedID:v17];

    if (v18)
    {
      v19 = [v18 recordType];
      unsigned int v20 = [v19 isEqualToString:@"SharedSyncExitConfig"];

      if (v20) {
        [v12 updateWithExitConfigRecord:v18];
      }
    }
  }
  else
  {
    [v12 updateExitConfigFromPreviousScopeChange:v11];
  }
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing])
  {
    v21 = [(CPLCloudKitZoneIdentification *)self zoneID];
    v22 = CPLLibraryShareSettingsRecordID(v21, v10);

    if (v22)
    {
      v23 = [v9 objectForKeyedSubscript:v22];
      v24 = v23;
      if (v23)
      {
        v25 = [v23 recordType];
        unsigned int v26 = [v25 isEqualToString:@"CPLScopeUserSettings"];

        if (v26) {
          [v12 updateLibraryShareSettingsWithCKRecord:v24];
        }
      }
    }
  }

  return v12;
}

- (id)scopeFlagsUpdateFromCKRecords:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  v3 = [(CPLCloudKitZoneIdentification *)&v5 scopeFlagsUpdateFromCKRecords:a3];
  return v3;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  id v12 = [(CPLCloudKitLibraryZoneIdentification *)&v28 updatedScopeChangeFromScopeChange:v9 currentUserID:v10 withCKRecord:v11];
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_1001CDE04(self, (uint64_t)v12, (uint64_t)a2);
    }
  }
  id v13 = [v11 recordType];
  if ([v13 isEqualToString:@"ParticipantExitStates"])
  {
    v14 = [v11 recordID];
    v15 = [v14 recordName];
    unsigned int v16 = [v15 isEqualToString:@"ParticipantExitStates"];

    if (v16)
    {
      if (!v12) {
        id v12 = [v9 copy];
      }
      [v12 updateWithExitStatesRecord:v11];
      goto LABEL_17;
    }
  }
  else
  {
  }
  v17 = [v11 recordType];
  if ([v17 isEqualToString:@"SharedSyncExitConfig"])
  {
    v18 = [v11 recordID];
    v19 = [v18 recordName];
    unsigned int v20 = [v19 isEqualToString:@"ExitConfig"];

    if (v20
      && (self->_stagingCloudKitScope || (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)4))
    {
      if (!v12) {
        id v12 = [v9 copy];
      }
      [v12 updateWithExitConfigRecord:v11];
    }
  }
  else
  {
  }
LABEL_17:
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing])
  {
    v21 = [v11 recordType];
    unsigned int v22 = [v21 isEqualToString:@"CPLScopeUserSettings"];

    if (v22)
    {
      v23 = [(CPLCloudKitZoneIdentification *)self zoneID];
      v24 = CPLLibraryShareSettingsRecordID(v23, v10);

      if (v24)
      {
        v25 = [v11 recordID];
        unsigned int v26 = [v25 isEqual:v24];

        if (v26)
        {
          if (!v12) {
            id v12 = [v9 copy];
          }
          [v12 updateLibraryShareSettingsWithCKRecord:v11];
        }
      }
    }
  }

  return v12;
}

- (id)updatedFlagsFromCKRecord:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  v3 = [(CPLCloudKitZoneIdentification *)&v5 updatedFlagsFromCKRecord:a3];
  return v3;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  id v15 = [(CPLCloudKitZoneIdentification *)&v23 updatedScopeChangeFromScopeChange:v11 currentUserID:v12 withDeletedCKRecordID:v13 recordType:v14];
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      sub_1001CDF20(self, (uint64_t)v15, (uint64_t)a2);
    }
  }
  if ([v14 isEqualToString:@"ParticipantExitStates"]
    && ([v13 recordName],
        unsigned int v16 = objc_claimAutoreleasedReturnValue(),
        unsigned int v17 = [v16 isEqualToString:@"ParticipantExitStates"],
        v16,
        v17))
  {
    if (!v15) {
      id v15 = [v11 copy];
    }
    [v15 updateWithExitStatesRecord:0];
  }
  else if ([v14 isEqualToString:@"SharedSyncExitConfig"])
  {
    v18 = [v13 recordName];
    unsigned int v19 = [v18 isEqualToString:@"ExitConfig"];

    if (v19)
    {
      if (self->_stagingCloudKitScope || (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)4)
      {
        if (!v15) {
          id v15 = [v11 copy];
        }
        [v15 updateWithExitConfigRecord:0];
      }
    }
  }
  if (+[CPLLibraryShareScopeChange serverSupportsLibraryShareSettingsRecordSyncing](CPLLibraryShareScopeChange, "serverSupportsLibraryShareSettingsRecordSyncing")&& [v14 isEqualToString:@"CPLScopeUserSettings"])
  {
    unsigned int v20 = [(CPLCloudKitZoneIdentification *)self zoneID];
    v21 = CPLLibraryShareSettingsRecordID(v20, v12);

    if (v21 && [v13 isEqual:v21])
    {
      if (!v15) {
        id v15 = [v11 copy];
      }
      [v15 updateLibraryShareSettingsWithCKRecord:0];
    }
  }
  return v15;
}

- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  id v4 = [(CPLCloudKitZoneIdentification *)&v6 updatedFlagsFromDeletedCKRecordID:a3 recordType:a4];
  return v4;
}

- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPLCloudKitLibraryShareZoneIdentification;
  id v8 = [(CPLCloudKitZoneIdentification *)&v13 recordsToUpdateFromScopeChange:v6 currentUserID:v7];
  id v9 = [v8 mutableCopy];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(CPLCloudKitZoneIdentification *)self zoneID];
    id v11 = [v6 ckRecordForLibraryShareSettingsWithZoneID:v10 userID:v7];

    if (v11) {
      [v9 addObject:v11];
    }
  }
  return v9;
}

- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CPLCloudKitZoneIdentification *)self engineScope];
  id v6 = [v5 scopeType];

  if (v6 == (id)5)
  {
    id v7 = [(CPLCloudKitLibraryShareZoneIdentification *)self cloudKitScope];
    id v8 = [v7 zoneID];
    id v9 = [(CPLCloudKitLibraryShareZoneIdentification *)self cloudKitScope];
    id v10 = [v9 zoneID];
    id v11 = [v10 zoneName];
    id v12 = CPLStagingZoneNameFromZoneName(v11, v4);

    if (v12)
    {
      id v13 = objc_alloc((Class)CKRecordZoneID);
      id v14 = [v8 ownerName];
      id v15 = objc_msgSend(v13, "initWithZoneName:ownerName:databaseScope:", v12, v14, objc_msgSend(v8, "databaseScope"));

      unsigned int v16 = -[CPLCloudKitScope initWithZoneID:options:]([CPLCloudKitScope alloc], "initWithZoneID:options:", v15, [v7 options]);
      id v17 = objc_alloc((Class)CPLEngineScope);
      v18 = objc_msgSend(v15, "cpl_zoneName");
      id v19 = [v17 initWithScopeIdentifier:v18 scopeType:6];

      unsigned int v20 = [(CPLCloudKitZoneIdentification *)[CPLCloudKitStagingZoneIdentification alloc] initWithCloudKitScope:v16 engineScope:v19];
    }
    else
    {
      unsigned int v20 = 0;
    }
  }
  else
  {
    unsigned int v20 = 0;
  }

  return v20;
}

- (CPLCloudKitScope)stagingCloudKitScope
{
  return self->_stagingCloudKitScope;
}

- (void)setStagingCloudKitScope:(id)a3
{
}

- (void).cxx_destruct
{
}

@end