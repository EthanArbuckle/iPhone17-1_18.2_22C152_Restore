@interface CPLCloudKitCMMZoneIdentification
+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4;
+ (id)libraryInfoRecordName;
+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3;
+ (id)rootRecordName;
+ (id)shareRecordName;
+ (id)shareTypes;
+ (id)supportedZonePrefixes;
+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3;
+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
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
- (id)rootRecordType;
- (id)shareRecordIDToDelete;
- (id)shareTypeForScopeChange:(id)a3;
@end

@implementation CPLCloudKitCMMZoneIdentification

+ (id)supportedZonePrefixes
{
  uint64_t v4 = CPLScopeIdentifierPrefixForMomentShare;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

+ (id)prefixForNewScopesRelativeToMainScopeIdentifier:(id)a3
{
  return CPLScopeIdentifierPrefixForMomentShare;
}

+ (int64_t)proposedScopeTypeForCloudKitScope:(id)a3
{
  id v4 = a3;
  v5 = [v4 zoneID];
  v6 = [v5 zoneName];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = objc_msgSend(a1, "supportedZonePrefixes", 0);
  int64_t v8 = (int64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([v6 hasPrefix:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          if ([v4 isShared]) {
            int64_t v8 = 3;
          }
          else {
            int64_t v8 = 2;
          }
          goto LABEL_13;
        }
      }
      int64_t v8 = (int64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v8;
}

+ (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ((unint64_t)(a4 - 2) >= 2)
  {
    if (!a4)
    {
      long long v13 = [v10 zoneID];
      if (![a1 isSupportedZoneID:v13])
      {
        a4 = 0;
LABEL_18:

        goto LABEL_19;
      }
      long long v14 = [v11 cplRecordWithName:@"cmm-share" zonedID:v13];
      long long v15 = [v11 cplRecordWithName:@"cmm-root" zonedID:v13];
      if (v14 && ([a1 isSupportedShare:v14] & 1) == 0)
      {

        long long v14 = 0;
      }
      if (v15)
      {
        v16 = [v15 recordType];
        unsigned __int8 v17 = [v16 isEqualToString:@"CMMRoot"];

        if (v17)
        {
          if (v14)
          {
            if ([v10 isShared]) {
              a4 = 3;
            }
            else {
              a4 = 2;
            }
            goto LABEL_17;
          }
        }
        else
        {

          long long v15 = 0;
        }
      }
      a4 = 0;
LABEL_17:

      goto LABEL_18;
    }
    a4 = 0;
  }
LABEL_19:

  return a4;
}

+ (BOOL)supportsCloudKitScope:(id)a3 engineScope:(id)a4
{
  return ((unint64_t)objc_msgSend(a4, "scopeType", a3) & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)rootRecordName
{
  return @"cmm-root";
}

- (id)rootRecordType
{
  return @"CMMRoot";
}

+ (id)shareRecordName
{
  return @"cmm-share";
}

+ (id)shareTypes
{
  if (+[CPLFingerprintScheme supportsEPP]) {
    return &off_1002942F0;
  }
  else {
    return &off_100294308;
  }
}

+ (id)libraryInfoRecordName
{
  return @"library-info";
}

- (id)shareTypeForScopeChange:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    sub_1001CDBFC((uint64_t)v5, (uint64_t)self, (uint64_t)a2);
  }
  if (+[CPLFingerprintScheme alwaysCreateEPPMomentShares](CPLFingerprintScheme, "alwaysCreateEPPMomentShares") & 1) != 0|| ([v5 hasEPPAssets])
  {
    v6 = @"photos_links";
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    v6 = [(CPLCloudKitZoneIdentification *)&v8 shareTypeForScopeChange:v5];
  }

  return v6;
}

- (BOOL)supportsZoneDelete
{
  return (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)2;
}

- (BOOL)supportsZoneCreation
{
  return (id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)2;
}

- (id)shareRecordIDToDelete
{
  if ((id)[(CPLCloudKitZoneIdentification *)self scopeType] == (id)3)
  {
    v3 = [(CPLCloudKitZoneIdentification *)self recordIDWithRecordName:@"cmm-share"];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)supportsUploadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_10009DC68();
  if (objc_msgSend(v8, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v9 = [(CPLCloudKitZoneIdentification *)&v11 supportsUploadOfChange:v6 scopeProvider:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)supportsDownloadOfChange:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_10009DC68();
  if (objc_msgSend(v8, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v9 = [(CPLCloudKitZoneIdentification *)&v11 supportsDownloadOfChange:v6 scopeProvider:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)supportsDirectDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_10009DC68();
  if (objc_msgSend(v8, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v9 = [(CPLCloudKitZoneIdentification *)&v11 supportsDirectDeletionOfRecord:v6 scopeProvider:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)supportsDeletionOfRecord:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_10009DC68();
  if (objc_msgSend(v8, "containsObject:", objc_msgSend(v6, "recordClass")))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v9 = [(CPLCloudKitZoneIdentification *)&v11 supportsDeletionOfRecord:v6 scopeProvider:v7];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)supportsUploadOfRecordClass:(Class)a3
{
  id v5 = sub_10009DC68();
  if ([v5 containsObject:a3])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v6 = [(CPLCloudKitZoneIdentification *)&v8 supportsUploadOfRecordClass:a3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)supportsDownloadOfRecordClass:(Class)a3
{
  id v5 = sub_10009DC68();
  if ([v5 containsObject:a3])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v6 = [(CPLCloudKitZoneIdentification *)&v8 supportsDownloadOfRecordClass:a3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)supportsDirectDeletionOfRecordClass:(Class)a3
{
  id v5 = sub_10009DC68();
  if ([v5 containsObject:a3])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v6 = [(CPLCloudKitZoneIdentification *)&v8 supportsDirectDeletionOfRecordClass:a3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)supportsDeletionOfRecordClass:(Class)a3
{
  id v5 = sub_10009DC68();
  if ([v5 containsObject:a3])
  {
    v8.receiver = self;
    v8.super_class = (Class)CPLCloudKitCMMZoneIdentification;
    BOOL v6 = [(CPLCloudKitZoneIdentification *)&v8 supportsDeletionOfRecordClass:a3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end