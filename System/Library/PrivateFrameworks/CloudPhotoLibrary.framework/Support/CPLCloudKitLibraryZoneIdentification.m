@interface CPLCloudKitLibraryZoneIdentification
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)libraryInfoRecordName;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)primaryZoneIDFromProposedZoneIDs:(id)a3;
+ (id)recordNamesForScopeInfo;
+ (id)supportedZonePrefixes;
+ (int64_t)_scopeTypeForCloudKitScope:(id)a3;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (BOOL)_simulateExitForScopeIdentifier:(id)a3;
- (BOOL)supportsZoneCreation;
- (BOOL)supportsZoneDelete;
- (id)_libraryStateFromCKRecord:(id)a3;
- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5;
- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5;
@end

@implementation CPLCloudKitLibraryZoneIdentification

+ (id)primaryZoneIDFromProposedZoneIDs:(id)a3
{
  id v3 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v21;
    v8 = (void *)CPLPrimaryScopeIdentifier;
    uint64_t v19 = -1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v10 zoneName];
        if ([v11 hasPrefix:v8])
        {
          if ([v11 isEqualToString:v8])
          {
            uint64_t v12 = 0;
          }
          else
          {
            objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v8, "length"));
            uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
            v13 = v6;
            v15 = id v14 = v3;
            id v16 = [v15 integerValue];
            if (v16) {
              uint64_t v12 = (uint64_t)v16;
            }

            id v3 = v14;
            v6 = v13;
          }
          if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 > v19)
          {
            id v17 = v10;

            uint64_t v19 = v12;
            v6 = v17;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)supportedZonePrefixes
{
  return (id)_CPLAllLibraryScopeIdentifierPrefixes(a1, a2);
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return 0;
}

+ (id)recordNamesForScopeInfo
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CPLCloudKitLibraryZoneIdentification;
  v2 = objc_msgSendSuper2(&v5, "recordNamesForScopeInfo");
  id v3 = [v2 arrayByAddingObject:@"PrimarySync-0000-ZS"];

  return v3;
}

+ (int64_t)_scopeTypeForCloudKitScope:(id)a3
{
  return 1;
}

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 zoneID];
  v6 = [v5 zoneName];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = objc_msgSend(a1, "supportedZonePrefixes", 0);
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([v6 hasPrefix:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)])
        {
          id v12 = [a1 _scopeTypeForCloudKitScope:v4];
          goto LABEL_11;
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return (int64_t)v12;
}

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [a1 _scopeTypeForCloudKitScope:v9];
  if (v11 != (id)a4)
  {
    if (a4)
    {
      a4 = 0;
      goto LABEL_27;
    }
    int64_t v12 = (int64_t)v11;
    v13 = [v9 zoneID];
    if (![a1 isSupportedZoneID:v13])
    {
      a4 = 0;
LABEL_26:

      goto LABEL_27;
    }
    long long v14 = [a1 shareRecordName];
    if (!v14) {
      goto LABEL_9;
    }
    long long v15 = [v10 cplRecordWithName:v14 zonedID:v13];
    if (v15)
    {
      if ([a1 isSupportedShare:v15])
      {

LABEL_9:
        long long v16 = [v10 cplRecordWithName:@"PrimarySync-0000-LI" zonedID:v13];
        long long v17 = v16;
        if (v16)
        {
          v18 = [v16 recordType];
          unsigned int v19 = [v18 isEqualToString:@"CPLLibraryInfo"];

          if (v19) {
            a4 = v12;
          }
          else {
            a4 = 0;
          }
        }
        else
        {
          a4 = v12;
        }

        goto LABEL_25;
      }
      if (!_CPLSilentLogging)
      {
        long long v20 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v26 = 138543874;
          v27 = v14;
          __int16 v28 = 2114;
          id v29 = v9;
          __int16 v30 = 2112;
          v31 = v15;
          long long v21 = "Unexpected share record %{public}@ in %{public}@: %@ - zone is broken or unsupported";
          long long v22 = v20;
          os_log_type_t v23 = OS_LOG_TYPE_ERROR;
          uint32_t v24 = 32;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
    }
    else if (!_CPLSilentLogging)
    {
      long long v20 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138543618;
        v27 = v14;
        __int16 v28 = 2114;
        id v29 = v9;
        long long v21 = "Expected share record %{public}@ is not yet found in %{public}@ - zone is not yet ready to be used";
        long long v22 = v20;
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        uint32_t v24 = 22;
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, (uint8_t *)&v26, v24);
      }
LABEL_23:
    }
    a4 = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_27:

  return a4;
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  id v6 = a3;
  id v7 = [a4 scopeType];
  id v8 = [a1 _scopeTypeForCloudKitScope:v6];

  return v7 == v8;
}

+ (id)libraryInfoRecordName
{
  return @"PrimarySync-0000-LI";
}

- (id)_libraryStateFromCKRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"enabled"];
  objc_super v5 = v4;
  if (v4 && ([v4 BOOLValue] & 1) == 0)
  {
    id v9 = [v3 objectForKey:@"disabledTime"];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[NSDate date];
    }
    id v7 = v11;

    int64_t v12 = [v3 objectForKey:@"deleteTime"];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v7 dateByAddingTimeInterval:2592000.0];
    }
    id v8 = v14;

    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = 0;
    id v8 = 0;
  }
  id v15 = objc_alloc_init((Class)CPLLibraryState);
  [v15 setDisabled:v6];
  [v15 setDisabledDate:v7];
  [v15 setDeleteDate:v8];

  return v15;
}

- (BOOL)_simulateExitForScopeIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:CPLPrimaryScopeIdentifier])
  {
    unsigned __int8 v4 = 0;
  }
  else
  {
    objc_super v5 = CPLUniverseNameFromMainScopeIdentifier();
    if (v5)
    {
      id v6 = [objc_alloc((Class)NSString) initWithFormat:@"CPLSimulateExitFor%@", v5];
      id v7 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v4 = [v7 BOOLForKey:v6];
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
  }
  return v4;
}

- (id)scopeChangeFromCKRecords:(id)a3 currentUserID:(id)a4 previousScopeChange:(id)a5
{
  v23.receiver = self;
  v23.super_class = (Class)CPLCloudKitLibraryZoneIdentification;
  id v8 = a3;
  id v9 = [(CPLCloudKitZoneIdentification *)&v23 scopeChangeFromCKRecords:v8 currentUserID:a4 previousScopeChange:a5];
  id v10 = [(CPLCloudKitZoneIdentification *)self zoneID];
  id v11 = [v8 cplRecordWithName:@"PrimarySync-0000-ZS" zonedID:v10];

  if (!v11
    || ([v11 recordType],
        int64_t v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:@"CPLZoneState"],
        v12,
        !v13))
  {
    id v15 = 0;
    goto LABEL_7;
  }
  id v14 = [(CPLCloudKitLibraryZoneIdentification *)self _libraryStateFromCKRecord:v11];
  id v15 = v14;
  if (!v14)
  {
LABEL_7:
    int v16 = 1;
    goto LABEL_8;
  }
  if ([v14 isDisabled]) {
    goto LABEL_12;
  }
  int v16 = 0;
LABEL_8:
  long long v17 = [(CPLCloudKitZoneIdentification *)self scopeIdentifier];
  unsigned int v18 = [(CPLCloudKitLibraryZoneIdentification *)self _simulateExitForScopeIdentifier:v17];

  if (v18)
  {
    if (v16) {
      id v15 = objc_alloc_init((Class)CPLLibraryState);
    }
    [v15 setDisabled:1];
    unsigned int v19 = +[NSDate date];
    [v15 setDisabledDate:v19];

    long long v20 = [v15 disabledDate];
    long long v21 = [v20 dateByAddingTimeInterval:2592000.0];
    [v15 setDeleteDate:v21];
  }
LABEL_12:
  [v9 setLibraryState:v15];

  return v9;
}

- (id)updatedScopeChangeFromScopeChange:(id)a3 currentUserID:(id)a4 withCKRecord:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CPLCloudKitLibraryZoneIdentification;
  id v10 = [(CPLCloudKitZoneIdentification *)&v23 updatedScopeChangeFromScopeChange:v8 currentUserID:a4 withCKRecord:v9];
  id v11 = [v9 recordType];
  if ([v11 isEqualToString:@"CPLZoneState"])
  {
    int64_t v12 = [v9 recordID];
    unsigned int v13 = [v12 recordName];
    unsigned int v14 = [v13 isEqualToString:@"PrimarySync-0000-ZS"];

    if (v14)
    {
      uint64_t v15 = [(CPLCloudKitLibraryZoneIdentification *)self _libraryStateFromCKRecord:v9];
      if (v15)
      {
        int v16 = (void *)v15;
        if (!v10) {
          id v10 = [v8 copy];
        }
        if (([v16 isDisabled] & 1) == 0)
        {
          long long v17 = [(CPLCloudKitZoneIdentification *)self scopeIdentifier];
          unsigned int v18 = [(CPLCloudKitLibraryZoneIdentification *)self _simulateExitForScopeIdentifier:v17];

          if (v18)
          {
            [v16 setDisabled:1];
            unsigned int v19 = +[NSDate date];
            [v16 setDisabledDate:v19];

            long long v20 = [v16 disabledDate];
            long long v21 = [v20 dateByAddingTimeInterval:2592000.0];
            [v16 setDeleteDate:v21];
          }
        }
        [v10 setLibraryState:v16];
      }
    }
  }

  return v10;
}

- (BOOL)supportsZoneDelete
{
  return 1;
}

- (BOOL)supportsZoneCreation
{
  v2 = [(CPLCloudKitZoneIdentification *)self cloudKitScope];
  char v3 = [v2 isShared] ^ 1;

  return v3;
}

@end