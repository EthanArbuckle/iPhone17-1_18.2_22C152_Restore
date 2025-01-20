@interface CPLCloudKitDefaultZoneManager
+ (CPLCloudKitDefaultZoneManager)sharedInstance;
+ (id)_defaultIdentificationClasses;
- (BOOL)isNewCloudKitScope:(id)a3 compatibleWithOldCloudKitScope:(id)a4;
- (CPLCloudKitDefaultZoneManager)initWithIdentificationClasses:(id)a3;
- (CPLFingerprintContext)fingerprintContext;
- (NSArray)identificationClasses;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)init_;
- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)tentativeZoneIdentifierForZoneID:(id)a3;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4;
- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
@end

@implementation CPLCloudKitDefaultZoneManager

+ (id)_defaultIdentificationClasses
{
  if (qword_1002CEA20 != -1) {
    dispatch_once(&qword_1002CEA20, &stru_100279FF0);
  }
  v2 = (void *)qword_1002CEA18;
  return v2;
}

+ (CPLCloudKitDefaultZoneManager)sharedInstance
{
  if (qword_1002CEA30 != -1) {
    dispatch_once(&qword_1002CEA30, &stru_10027A010);
  }
  v2 = (void *)qword_1002CEA28;
  return (CPLCloudKitDefaultZoneManager *)v2;
}

- (CPLCloudKitDefaultZoneManager)initWithIdentificationClasses:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLCloudKitDefaultZoneManager;
  v5 = [(CPLCloudKitDefaultZoneManager *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    identificationClasses = v5->_identificationClasses;
    v5->_identificationClasses = v6;
  }
  return v5;
}

- (id)init_
{
  v3 = [(id)objc_opt_class() _defaultIdentificationClasses];
  id v4 = [(CPLCloudKitDefaultZoneManager *)self initWithIdentificationClasses:v3];

  return v4;
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return 0;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ownerName];
  v5 = [v3 zoneName];

  v6 = (void *)CPLPrimaryScopeIdentifier;
  if ([v5 hasPrefix:CPLPrimaryScopeIdentifier])
  {
    id v7 = v6;

    v5 = v7;
  }
  if (v4 && ![v4 isEqualToString:CKCurrentUserDefaultName])
  {
    id v8 = +[CPLScopedIdentifier descriptionWithScopeIdentifier:v4 identifier:v5];
  }
  else
  {
    id v8 = v5;
  }
  objc_super v9 = v8;

  return v9;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  v5 = [v4 zoneID];
  v6 = [(CPLCloudKitDefaultZoneManager *)self scopeIdentifierFromZoneID:v5];
  id v7 = objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v6);

  return v7;
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)+[CPLFingerprintContext sharedContext];
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CPLPrimaryScopeIdentifier;
  if ([v3 isEqualToString:CPLPrimaryScopeIdentifier])
  {
    id v5 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v4 ownerName:CKCurrentUserDefaultName];
  }
  else
  {
    v6 = +[CPLScopedIdentifier scopedIdentifierWithString:v3 includeScopeIndex:0 defaultScopeIdentifier:CKCurrentUserDefaultName];
    id v7 = objc_alloc((Class)CKRecordZoneID);
    id v8 = [v6 identifier];
    objc_super v9 = [v6 scopeIdentifier];
    id v5 = [v7 initWithZoneName:v8 ownerName:v9];
  }
  return v5;
}

- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v11 = self->_identificationClasses;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v17 = objc_msgSend(v8, "zoneID", (void)v21);
        v18 = [v16 recordsToFetchToIdentifyZoneID:v17 proposedScopeType:a4 currentUserID:v9];
        [v10 addObjectsFromArray:v18];
      }
      id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  v19 = [v10 allObjects];

  return v19;
}

- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = self->_identificationClasses;
  id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v17), "scopeTypeForCloudKitScope:proposedScopeType:fetchedRecords:currentUserID:", v10, a4, v11, v12, (void)v21);
        if (v18)
        {
          int64_t v19 = (int64_t)v18;
          goto LABEL_11;
        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  int64_t v19 = 0;
LABEL_11:

  return v19;
}

- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = self->_identificationClasses;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_alloc(*(Class *)(*((void *)&v17 + 1) + 8 * i));
        id v14 = (CPLCloudKitUnknownIdentification *)objc_msgSend(v13, "initWithCloudKitScope:engineScope:", v6, v7, (void)v17);
        if (v14)
        {
          id v15 = v14;

          goto LABEL_11;
        }
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = [(CPLCloudKitZoneIdentification *)[CPLCloudKitUnknownIdentification alloc] initWithCloudKitScope:v6 engineScope:v7];
LABEL_11:

  return v15;
}

- (BOOL)isNewCloudKitScope:(id)a3 compatibleWithOldCloudKitScope:(id)a4
{
  id v5 = a4;
  id v6 = [a3 zoneID];
  uint64_t v7 = [v6 zoneName];
  uint64_t v8 = [v6 ownerName];
  id v9 = [v5 zoneID];

  uint64_t v10 = [v9 zoneName];
  uint64_t v11 = [v9 ownerName];
  id v12 = (void *)v11;
  if (v11 && v8)
  {
    if (([(id)v11 isEqual:v8] & 1) == 0) {
      goto LABEL_9;
    }
LABEL_6:
    if (v10 && v7)
    {
      if (([(id)v10 isEqual:v7] & 1) == 0) {
        goto LABEL_9;
      }
    }
    else if (v10 | v7)
    {
      goto LABEL_9;
    }
    unsigned __int8 v17 = 1;
    goto LABEL_16;
  }
  if (!(v11 | v8)) {
    goto LABEL_6;
  }
LABEL_9:
  if ([v12 isEqualToString:CKCurrentUserDefaultName]
    && (uint64_t v13 = CPLPrimaryScopeIdentifier, [(id)v10 hasPrefix:CPLPrimaryScopeIdentifier])
    && [(id)v7 hasPrefix:v13])
  {
    v19[0] = v9;
    v19[1] = v6;
    id v14 = +[NSArray arrayWithObjects:v19 count:2];
    id v15 = +[CPLCloudKitLibraryZoneIdentification primaryZoneIDFromProposedZoneIDs:v14];

    uint64_t v16 = [v15 zoneName];
    unsigned __int8 v17 = [v16 isEqual:v7];
  }
  else
  {
    unsigned __int8 v17 = 0;
  }
LABEL_16:

  return v17;
}

- (id)tentativeZoneIdentifierForZoneID:(id)a3
{
  id v5 = a3;
  id v6 = [[CPLCloudKitScope alloc] initWithZoneID:v5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = self->_identificationClasses;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
      id v13 = [v12 proposedScopeTypeForCloudKitScope:v6];
      if (v13) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v13;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:

    id v14 = 0;
  }
  id v12 = objc_opt_class();
LABEL_12:
  id v15 = objc_msgSend(v5, "cpl_zoneName");
  id v16 = [objc_alloc((Class)CPLEngineScope) initWithScopeIdentifier:v15 scopeType:v14];
  id v17 = [objc_alloc((Class)v12) initWithCloudKitScope:v6 engineScope:v16];
  if (v17)
  {
    long long v18 = v17;
  }
  else
  {
    id v19 = [objc_alloc((Class)CPLEngineScope) initWithScopeIdentifier:v15 scopeType:0];

    id v20 = [objc_alloc((Class)v12) initWithCloudKitScope:v6 engineScope:v19];
    if (!v20)
    {
      if (!_CPLSilentLogging)
      {
        long long v22 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v6;
          __int16 v31 = 2112;
          id v32 = v19;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to create fallback identification from %@/%@", buf, 0x16u);
        }
      }
      long long v23 = +[NSAssertionHandler currentHandler];
      long long v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CPLCloudKitZoneIdentification.m"];
      [v23 handleFailureInMethod:a2, self, v24, 1454, @"Unable to create fallback identification from %@/%@", v6, v19, (void)v25 object file lineNumber description];

      abort();
    }
    long long v18 = v20;
    id v16 = v19;
  }

  return v18;
}

- (NSArray)identificationClasses
{
  return self->_identificationClasses;
}

- (void).cxx_destruct
{
}

@end