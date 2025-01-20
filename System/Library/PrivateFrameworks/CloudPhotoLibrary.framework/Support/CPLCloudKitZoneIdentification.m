@interface CPLCloudKitZoneIdentification
+ (BOOL)isScopeReadonlyFromCKShare:(id)a3;
+ (BOOL)isSupportedShare:(id)a3;
+ (BOOL)isSupportedShareType:(id)a3;
+ (BOOL)isSupportedZoneID:(id)a3;
+ (BOOL)shouldProtectZoneIDFromDeletion:(id)a3;
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (NSArray)recordNamesForScopeInfo;
+ (NSArray)shareTypes;
+ (NSArray)supportedZonePrefixes;
+ (NSString)libraryInfoRecordName;
+ (NSString)rootRecordName;
+ (NSString)shareRecordName;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
+ (int64_t)_permissionFromCKShare:(id)a3;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (BOOL)_isScopeReadonlyFromCKShare:(id)a3;
- (BOOL)isSupportedShare:(id)a3;
- (BOOL)isSupportedShareType:(id)a3;
- (BOOL)supportsDeletionOfRecord:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDeletionOfRecordClass:(Class)a3;
- (BOOL)supportsDirectDeletionOfRecord:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDirectDeletionOfRecordClass:(Class)a3;
- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsDownloadOfRecordClass:(Class)a3;
- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4;
- (BOOL)supportsUploadOfRecordClass:(Class)a3;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (CKRecordID)rootRecordID;
- (CKRecordID)shareRecordIDToDelete;
- (CKRecordZone)zone;
- (CKRecordZoneID)zoneID;
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitZoneIdentification)initWithCloudKitScope:(id)a3 engineScope:(id)a4;
- (CPLEngineScope)engineScope;
- (NSString)libraryInfoRecordName;
- (NSString)rootRecordType;
- (NSString)scopeIdentifier;
- (NSString)shareRecordName;
- (id)_baseScopeChange;
- (id)_rootRef;
- (id)newScopeIdentifierRelativeToMainScopeIdentifier:(id)a3;
- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3;
- (id)recordIDWithRecordName:(id)a3;
- (id)recordsToFetchForScopeInfoWithCurrentUserID:(id)a3;
- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)scopeFlagsUpdateFromCKRecords:(id)a3;
- (id)scopedIdentifierWithIdentifier:(id)a3;
- (id)shareType;
- (id)shareTypeForScopeChange:(id)a3;
- (id)updatedFlagsFromCKRecord:(id)a3;
- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6;
- (int64_t)databaseScope;
- (int64_t)operationType;
- (int64_t)scopeType;
- (void)setupRootOnRecord:(id)a3;
- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4;
- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLCloudKitZoneIdentification

+ (BOOL)shouldProtectZoneIDFromDeletion:(id)a3
{
  v3 = [a3 zoneName];
  unsigned __int8 v4 = [v3 hasPrefix:CPLPrimaryScopeIdentifier];

  return v4;
}

- (CPLCloudKitZoneIdentification)initWithCloudKitScope:(id)a3 engineScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() supportsCloudKitScope:v6 engineScope:v7])
  {
    v26.receiver = self;
    v26.super_class = (Class)CPLCloudKitZoneIdentification;
    v8 = [(CPLCloudKitZoneIdentification *)&v26 init];
    if (!v8)
    {
LABEL_17:
      self = v8;
      v14 = self;
      goto LABEL_18;
    }
    uint64_t v9 = (uint64_t)[v6 options];
    uint64_t v10 = v9;
    uint64_t v11 = [(CPLCloudKitZoneIdentification *)v8 shareRecordName];
    v12 = (void *)v11;
    if (v11 && CKRecordNameZoneWideShare)
    {
      unsigned __int8 v13 = [(id)v11 isEqual:CKRecordNameZoneWideShare];

      if ((v13 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      unint64_t v15 = v11 | (unint64_t)CKRecordNameZoneWideShare;

      if (v15)
      {
LABEL_10:
        v16 = [v6 zoneID];
        v17 = [v16 ownerName];
        unsigned int v18 = [v17 isEqualToString:CKCurrentUserDefaultName];

        if (v18) {
          uint64_t v19 = v10;
        }
        else {
          uint64_t v19 = v10 | 2;
        }
        if (v19 == v9)
        {
          v20 = (CPLCloudKitScope *)v6;
          cloudKitScope = v8->_cloudKitScope;
          v8->_cloudKitScope = v20;
        }
        else
        {
          v22 = [CPLCloudKitScope alloc];
          cloudKitScope = [v6 zone];
          v23 = [(CPLCloudKitScope *)v22 initWithZone:cloudKitScope options:v19];
          v24 = v8->_cloudKitScope;
          v8->_cloudKitScope = v23;
        }
        objc_storeStrong((id *)&v8->_engineScope, a4);
        goto LABEL_17;
      }
    }
    uint64_t v10 = v9 | 4;
    goto LABEL_10;
  }
  v14 = 0;
LABEL_18:

  return v14;
}

+ (NSArray)recordNamesForScopeInfo
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  unsigned __int8 v4 = [a1 rootRecordName];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = [a1 shareRecordName];
  if (v5) {
    [v3 addObject:v5];
  }
  id v6 = [a1 libraryInfoRecordName];
  if (v6) {
    [v3 addObject:v6];
  }

  return (NSArray *)v3;
}

+ (id)recordsToFetchToIdentifyZoneID:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  id v6 = a3;
  id v7 = [a1 recordNamesForScopeInfo];
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_alloc((Class)CKRecordID);
        id v16 = objc_msgSend(v15, "initWithRecordName:zoneID:", v14, v6, (void)v18);
        [v8 addObject:v16];
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  return 0;
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return 0;
}

- (id)recordsToFetchForScopeInfoWithCurrentUserID:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  id v7 = [v6 zoneID];
  id v8 = objc_msgSend(v5, "recordsToFetchToIdentifyZoneID:proposedScopeType:currentUserID:", v7, -[CPLEngineScope scopeType](self->_engineScope, "scopeType"), v4);

  return v8;
}

- (BOOL)supportsZoneDelete
{
  return 0;
}

- (BOOL)supportsZoneCreation
{
  return 0;
}

- (CKRecordID)shareRecordIDToDelete
{
  return 0;
}

- (id)recordsToUpdateFromScopeChange:(id)a3 currentUserID:(id)a4
{
  return &__NSArray0__struct;
}

- (id)_baseScopeChange
{
  id v3 = [(CPLEngineScope *)self->_engineScope scopeType];
  id v4 = [(CPLEngineScope *)self->_engineScope scopeIdentifier];
  id v5 = +[CPLScopeChange newScopeChangeInferClassWithScopeIdentifier:v4 type:v3];

  return v5;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(CPLCloudKitZoneIdentification *)self _baseScopeChange];
  unsigned __int8 v13 = [(CPLCloudKitZoneIdentification *)self libraryInfoRecordName];
  if (v13)
  {
    uint64_t v14 = [(CPLCloudKitZoneIdentification *)self zoneID];
    id v15 = [v9 cplRecordWithName:v13 zonedID:v14];

    if (v15)
    {
      id v16 = [(CPLCloudKitZoneIdentification *)self zone];
      [v12 updateWithLibraryInfoCKRecord:v15 zone:v16 userRecordID:v10];
    }
  }
  v17 = [(CPLCloudKitZoneIdentification *)self shareRecordName];
  if (v17)
  {
    long long v18 = [(CPLCloudKitZoneIdentification *)self zoneID];
    long long v19 = [v9 cplRecordWithName:v17 zonedID:v18];

    if (v19 && [(CPLCloudKitZoneIdentification *)self isSupportedShare:v19]) {
      [v12 updateWithCKShare:v19 currentUserID:v10];
    }
  }
  long long v20 = [(CPLCloudKitZoneIdentification *)self rootRecordID];
  if (v20)
  {
    SEL v30 = a2;
    long long v21 = [v9 objectForKeyedSubscript:v20];
    uint64_t v22 = [(CPLCloudKitZoneIdentification *)self rootRecordType];
    if (!v22) {
      sub_1001CD87C((uint64_t)self, (uint64_t)v30);
    }
    v23 = (void *)v22;
    v31 = v13;
    id v24 = v9;
    id v25 = v10;
    id v26 = v11;
    if (v21)
    {
      v27 = [v21 recordType];
      unsigned int v28 = [v27 isEqualToString:v23];

      if (v28) {
        [v12 updateWithRootCKRecord:v21];
      }
    }

    id v11 = v26;
    id v10 = v25;
    id v9 = v24;
    unsigned __int8 v13 = v31;
  }

  return v12;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    sub_1001CD95C((uint64_t)self, (uint64_t)a2);
  }
  uint64_t v12 = v11;
  unsigned __int8 v13 = [(CPLCloudKitZoneIdentification *)self libraryInfoRecordName];
  if (v13)
  {
    uint64_t v14 = [v12 selfIfMatchesRecordName:v13];
    if (v14)
    {
      id v15 = [v9 copy];
      id v16 = [(CPLCloudKitZoneIdentification *)self zone];
      [v15 updateWithLibraryInfoCKRecord:v14 zone:v16 userRecordID:v10];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }
  v17 = [(CPLCloudKitZoneIdentification *)self shareRecordName];
  if (v17)
  {
    long long v18 = [v12 selfIfMatchesRecordName:v17];
    if (v18 && [(CPLCloudKitZoneIdentification *)self isSupportedShare:v18])
    {
      if (!v15) {
        id v15 = [v9 copy];
      }
      [v15 updateWithCKShare:v18 currentUserID:v10];
    }
  }
  long long v19 = [(CPLCloudKitZoneIdentification *)self rootRecordID];
  if (v19)
  {
    SEL v29 = a2;
    long long v20 = [v12 recordID];
    if ([v20 isEqual:v19]) {
      long long v21 = v12;
    }
    else {
      long long v21 = 0;
    }
    id v22 = v21;

    if (v22)
    {
      uint64_t v23 = [(CPLCloudKitZoneIdentification *)self rootRecordType];
      if (!v23) {
        sub_1001CDA3C((uint64_t)self, (uint64_t)v29);
      }
      id v24 = (void *)v23;
      SEL v30 = v9;
      id v25 = v10;
      id v26 = [v22 recordType];
      unsigned int v27 = [v26 isEqualToString:v24];

      if (v27)
      {
        if (!v15) {
          id v15 = [v30 copy];
        }
        [v15 updateWithRootCKRecord:v22];
      }
      id v10 = v25;

      id v9 = v30;
    }
  }
  return v15;
}

- (id)scopeFlagsUpdateFromCKRecords:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)CPLEngineScopeFlagsUpdate);
  id v7 = [(CPLCloudKitZoneIdentification *)self shareRecordName];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() shareTypes];
    if (!v8) {
      sub_1001CDB1C((uint64_t)self, (uint64_t)a2);
    }
    id v9 = (void *)v8;
    id v10 = [(CPLCloudKitZoneIdentification *)self zoneID];
    uint64_t v11 = [v5 cplRecordWithName:v7 zonedID:v10];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      if ([(CPLCloudKitZoneIdentification *)self isSupportedShare:v11]) {
        objc_msgSend(v6, "setValue:forFlag:", -[CPLCloudKitZoneIdentification _isScopeReadonlyFromCKShare:](self, "_isScopeReadonlyFromCKShare:", v12), 1);
      }
    }
  }

  return v6;
}

- (id)updatedFlagsFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLCloudKitZoneIdentification *)self shareRecordName];
  if (v5 && ([v4 selfIfMatchesRecordName:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = (void *)v6;
    if ([(CPLCloudKitZoneIdentification *)self isSupportedShare:v6])
    {
      id v8 = objc_alloc_init((Class)CPLEngineScopeFlagsUpdate);
      objc_msgSend(v8, "setValue:forFlag:", -[CPLCloudKitZoneIdentification _isScopeReadonlyFromCKShare:](self, "_isScopeReadonlyFromCKShare:", v7), 1);
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withDeletedCKRecordID:(id)a5 recordType:(id)a6
{
  return 0;
}

- (id)updatedFlagsFromDeletedCKRecordID:(id)a3 recordType:(id)a4
{
  return 0;
}

+ (NSArray)supportedZonePrefixes
{
  return (NSArray *)&__NSArray0__struct;
}

+ (BOOL)isSupportedZoneID:(id)a3
{
  id v4 = [a3 zoneName];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(a1, "supportedZonePrefixes", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([v4 hasPrefix:*(void *)(*((void *)&v10 + 1) + 8 * i)])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  return 0;
}

+ (NSString)rootRecordName
{
  return 0;
}

+ (NSString)shareRecordName
{
  return 0;
}

+ (NSArray)shareTypes
{
  return 0;
}

+ (BOOL)isSupportedShareType:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = objc_msgSend(a1, "shareTypes", 0);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (BOOL)isSupportedShare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKey:CKShareTypeKey];
    if (v5) {
      unsigned __int8 v6 = [a1 isSupportedShareType:v5];
    }
    else {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)isSupportedShareType:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() isSupportedShareType:v3];

  return v4;
}

- (BOOL)isSupportedShare:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [(id)objc_opt_class() isSupportedShare:v3];

  return v4;
}

+ (NSString)libraryInfoRecordName
{
  return 0;
}

- (id)proposedStagingZoneIdentificationWithCurrentUserID:(id)a3
{
  return 0;
}

- (CKRecordID)rootRecordID
{
  id v3 = [(id)objc_opt_class() rootRecordName];
  if (v3)
  {
    unsigned __int8 v4 = [(CPLCloudKitZoneIdentification *)self recordIDWithRecordName:v3];
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return (CKRecordID *)v4;
}

- (NSString)rootRecordType
{
  return 0;
}

- (NSString)shareRecordName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shareRecordName];
}

- (id)shareType
{
  v2 = objc_opt_class();
  return _[v2 shareType];
}

- (id)shareTypeForScopeChange:(id)a3
{
  id v3 = [(id)objc_opt_class() shareTypes];
  unsigned __int8 v4 = [v3 firstObject];

  return v4;
}

- (NSString)libraryInfoRecordName
{
  v2 = objc_opt_class();
  return (NSString *)[v2 libraryInfoRecordName];
}

- (id)_rootRef
{
  if (self->_hasCachedRootRef)
  {
    id v3 = self->_cachedRootRef;
  }
  else
  {
    self->_hasCachedRootRef = 1;
    unsigned __int8 v4 = [(CPLCloudKitZoneIdentification *)self rootRecordID];
    if (v4)
    {
      id v5 = (CKReference *)[objc_alloc((Class)CKReference) initWithRecordID:v4 action:0];
      cachedRootRef = self->_cachedRootRef;
      self->_cachedRootRef = v5;
    }
    else
    {
      cachedRootRef = self->_cachedRootRef;
      self->_cachedRootRef = 0;
    }

    id v3 = self->_cachedRootRef;
  }
  return v3;
}

- (int64_t)operationType
{
  v2 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  int64_t v3 = CPLCloudKitOperationTypeForScope(v2);

  return v3;
}

- (int64_t)databaseScope
{
  v2 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  id v3 = [v2 databaseScope];

  return (int64_t)v3;
}

- (void)setupRootOnRecord:(id)a3
{
  id v5 = a3;
  unsigned __int8 v4 = [(CPLCloudKitZoneIdentification *)self _rootRef];
  if (v4) {
    [v5 setParent:v4];
  }
}

- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v5 = [a3 recordClass];
  return [(CPLCloudKitZoneIdentification *)self supportsUploadOfRecordClass:v5];
}

- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[CPLFingerprintScheme supportsEPP]) {
    goto LABEL_6;
  }
  if (![v6 isAssetChange])
  {
    if ([v6 isMasterChange]) {
      goto LABEL_4;
    }
LABEL_6:
    LOBYTE(self) = -[CPLCloudKitZoneIdentification supportsDownloadOfRecordClass:](self, "supportsDownloadOfRecordClass:", [v6 recordClass]);
    goto LABEL_7;
  }
  id v8 = [v6 relatedIdentifier];

  if (!v8) {
    goto LABEL_6;
  }
LABEL_4:
  self = [v7 fingerprintContext];
  id v9 = [v6 fingerprintSchemeWithContext:self];

  LODWORD(self) = [v9 isMMCSv2] ^ 1;
LABEL_7:

  return (char)self;
}

- (BOOL)supportsDirectDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  return [a3 supportsDirectDeletion];
}

- (BOOL)supportsDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  return [a3 supportsDeletion];
}

- (BOOL)supportsUploadOfRecordClass:(Class)a3
{
  return 1;
}

- (BOOL)supportsDownloadOfRecordClass:(Class)a3
{
  return 1;
}

- (BOOL)supportsDirectDeletionOfRecordClass:(Class)a3
{
  return [(objc_class *)a3 supportsDirectDeletion];
}

- (BOOL)supportsDeletionOfRecordClass:(Class)a3
{
  return [(objc_class *)a3 supportsDeletion];
}

- (id)recordIDWithRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  id v6 = [v5 recordIDWithRecordName:v4];

  return v6;
}

- (id)scopedIdentifierWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CPLScopedIdentifier);
  id v6 = [(CPLEngineScope *)self->_engineScope scopeIdentifier];
  id v7 = [v5 initWithScopeIdentifier:v6 identifier:v4];

  return v7;
}

- (CKRecordZoneID)zoneID
{
  v2 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  id v3 = [v2 zoneID];

  return (CKRecordZoneID *)v3;
}

- (CKRecordZone)zone
{
  v2 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  id v3 = [v2 zone];

  return (CKRecordZone *)v3;
}

- (NSString)scopeIdentifier
{
  return (NSString *)[(CPLEngineScope *)self->_engineScope scopeIdentifier];
}

- (int64_t)scopeType
{
  return (int64_t)[(CPLEngineScope *)self->_engineScope scopeType];
}

- (void)validateAcceptSharedScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (void)validateCreateScopeTask:(id)a3 completionHandler:(id)a4
{
}

- (id)newScopeIdentifierRelativeToMainScopeIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() prefixForNewScopesRelativeToMainScopeIdentifier:v3];

  if (v4)
  {
    id v5 = CPLSharingScopeUUID();
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[NSUUID UUID];
    }
    id v9 = v7;

    id v10 = objc_alloc((Class)NSString);
    long long v11 = [v9 UUIDString];
    id v8 = [v10 initWithFormat:@"%@%@", v4, v11];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return 0;
}

+ (int64_t)_permissionFromCKShare:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentUserParticipant];
  id v5 = v4;
  if (v4) {
    id v6 = [v4 permission];
  }
  else {
    id v6 = [v3 publicPermission];
  }
  int64_t v7 = (int64_t)v6;

  return v7;
}

- (BOOL)_isScopeReadonlyFromCKShare:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() isScopeReadonlyFromCKShare:v4];

  if (!v5) {
    return 0;
  }
  id v6 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  unsigned __int8 v7 = [v6 isShared];

  return v7;
}

+ (BOOL)isScopeReadonlyFromCKShare:(id)a3
{
  return [a1 _permissionFromCKShare:a3] == (id)2;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)engineScope
{
  return self->_engineScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineScope, 0);
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong((id *)&self->_cachedRootRef, 0);
}

@end