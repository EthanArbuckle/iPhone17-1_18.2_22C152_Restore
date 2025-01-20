@interface CKRecordZoneID(HDCloudSync)
+ (id)hd_attachmentZoneIDWithSyncCircleIdentifier:()HDCloudSync;
+ (id)hd_contextSyncZoneIDForSyncCircleIdentifier:()HDCloudSync;
+ (id)hd_individualSyncZoneIDWithSyncCircleIdentifier:()HDCloudSync storeIdentifier:;
+ (id)hd_masterZoneIDForSyncCircleIdentifier:()HDCloudSync;
+ (id)hd_privateMetadataZoneIDForSyncCircleIdentifier:()HDCloudSync;
+ (id)hd_sharedSummaryZoneIDWithSyncCircleIdentifier:()HDCloudSync userIdentifier:;
+ (id)hd_stateSyncZoneIDForSyncCircleIdentifier:()HDCloudSync domain:;
+ (id)hd_unifiedSyncZoneIDForSyncCircleIdentifier:()HDCloudSync;
- (BOOL)hd_isSharedSummaryZoneIDForUserIdentifier:()HDCloudSync syncCircleIdentifier:;
- (id)hd_storeIdentifier;
- (id)hd_syncCircleIdentifier;
- (id)hd_withOwnerName:()HDCloudSync;
- (uint64_t)hd_isAttachmentZoneIDForSyncCircleIdentifier:()HDCloudSync;
- (uint64_t)hd_isContextSyncZoneIDForSyncCircleIdentifier:()HDCloudSync;
- (uint64_t)hd_isIndividualSyncZoneIDForStoreIdentifier:()HDCloudSync syncCircleIdentifier:;
- (uint64_t)hd_isMasterZoneIDForSyncCircleIdentifier:()HDCloudSync;
- (uint64_t)hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:()HDCloudSync;
- (uint64_t)hd_isStateSyncZoneIDForSyncCircleIdentifier:()HDCloudSync domain:;
- (uint64_t)hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:()HDCloudSync;
@end

@implementation CKRecordZoneID(HDCloudSync)

+ (id)hd_masterZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, @"Master");
}

- (uint64_t)hd_isMasterZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, @"Master");
}

+ (id)hd_unifiedSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, @"UnifiedSync");
}

- (uint64_t)hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, @"UnifiedSync");
}

+ (id)hd_privateMetadataZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, @"PrivateMetadata");
}

- (uint64_t)hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, @"PrivateMetadata");
}

+ (id)hd_individualSyncZoneIDWithSyncCircleIdentifier:()HDCloudSync storeIdentifier:
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 containsString:@":"])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"CKRecordZoneID+HDCloudSync.m", 80, @"Invalid parameter not satisfying: %@", @"![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]" object file lineNumber description];
  }
  v9 = NSString;
  v10 = [v7 UUIDString];
  v11 = [v9 stringWithFormat:@"%@%@%@", v8, @":", v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1A320]);
  v13 = (void *)[v12 initWithZoneName:v11 ownerName:*MEMORY[0x1E4F19C08]];

  return v13;
}

- (uint64_t)hd_isIndividualSyncZoneIDForStoreIdentifier:()HDCloudSync syncCircleIdentifier:
{
  v6 = [a1 zoneName];
  id v7 = [v6 componentsSeparatedByString:@":"];

  if ([v7 count] == 2
    && (id v8 = objc_alloc(MEMORY[0x1E4F29128]),
        [v7 objectAtIndexedSubscript:1],
        v9 = objc_claimAutoreleasedReturnValue(),
        *a3 = (id)[v8 initWithUUIDString:v9],
        v9,
        *a3))
  {
    *a4 = [v7 objectAtIndexedSubscript:0];
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)hd_sharedSummaryZoneIDWithSyncCircleIdentifier:()HDCloudSync userIdentifier:
{
  id v7 = a4;
  id v8 = a3;
  if ([v8 containsString:@":"])
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"CKRecordZoneID+HDCloudSync.m", 101, @"Invalid parameter not satisfying: %@", @"![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]" object file lineNumber description];
  }
  v9 = NSString;
  uint64_t v10 = [v7 UUIDString];
  v11 = [v9 stringWithFormat:@"%@%@%@%@%@", v8, @":", @"SummarySharing", @":", v10];

  id v12 = objc_alloc(MEMORY[0x1E4F1A320]);
  v13 = (void *)[v12 initWithZoneName:v11 ownerName:*MEMORY[0x1E4F19C08]];

  return v13;
}

+ (id)hd_attachmentZoneIDWithSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, @"Attachment");
}

- (uint64_t)hd_isAttachmentZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, @"Attachment");
}

+ (id)hd_contextSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return +[CKRecordZoneID _hd_zoneIDForSyncCircleIdentifier:name:](a1, a3, @"ContextSync");
}

- (uint64_t)hd_isContextSyncZoneIDForSyncCircleIdentifier:()HDCloudSync
{
  return -[CKRecordZoneID _hd_isZoneIDForSyncCircleIdentifier:name:](a1, a3, @"ContextSync");
}

- (BOOL)hd_isSharedSummaryZoneIDForUserIdentifier:()HDCloudSync syncCircleIdentifier:
{
  v6 = [a1 zoneName];
  id v7 = [v6 componentsSeparatedByString:@":"];

  if ([v7 count] == 3
    && ([v7 objectAtIndexedSubscript:1],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"SummarySharing"],
        v8,
        v9))
  {
    *a4 = [v7 objectAtIndexedSubscript:0];
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    v11 = [v7 objectAtIndexedSubscript:2];
    *a3 = (id)[v10 initWithUUIDString:v11];

    BOOL v12 = *a3 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)hd_stateSyncZoneIDForSyncCircleIdentifier:()HDCloudSync domain:
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 containsString:@":"])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"CKRecordZoneID+HDCloudSync.m", 148, @"Invalid parameter not satisfying: %@", @"![syncCircleIdentifier containsString:RecordZoneIDComponentsSeparator]" object file lineNumber description];
  }
  int v9 = [NSString stringWithFormat:@"%@%@%@%@%@", v7, @":", @"StateSync", @":", v8];
  id v10 = objc_alloc(MEMORY[0x1E4F1A320]);
  v11 = (void *)[v10 initWithZoneName:v9 ownerName:*MEMORY[0x1E4F19C08]];

  return v11;
}

- (uint64_t)hd_isStateSyncZoneIDForSyncCircleIdentifier:()HDCloudSync domain:
{
  v6 = [a1 zoneName];
  id v7 = [v6 componentsSeparatedByString:@":"];

  if ([v7 count] == 3
    && ([v7 objectAtIndexedSubscript:1],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:@"StateSync"],
        v8,
        v9))
  {
    *a3 = [v7 objectAtIndexedSubscript:0];
    *a4 = [v7 objectAtIndexedSubscript:2];
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)hd_syncCircleIdentifier
{
  id v34 = 0;
  int v2 = objc_msgSend(a1, "hd_isMasterZoneIDForSyncCircleIdentifier:", &v34);
  id v3 = v34;
  id v4 = v3;
  if (v2) {
    goto LABEL_4;
  }
  id v33 = v3;
  int v5 = objc_msgSend(a1, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v33);
  id v6 = v33;

  if (v5) {
    goto LABEL_6;
  }
  id v32 = v6;
  int v7 = objc_msgSend(a1, "hd_isPrivateMetadataZoneIDForSyncCircleIdentifier:", &v32);
  id v4 = v32;

  if (v7)
  {
LABEL_4:
    id v8 = v4;
LABEL_7:
    id v10 = v8;
    id v11 = v8;
    goto LABEL_8;
  }
  id v31 = v4;
  int v9 = objc_msgSend(a1, "hd_isAttachmentZoneIDForSyncCircleIdentifier:", &v31);
  id v6 = v31;

  if (v9)
  {
LABEL_6:
    id v8 = v6;
    goto LABEL_7;
  }
  id v29 = 0;
  id v30 = v6;
  int v13 = objc_msgSend(a1, "hd_isStateSyncZoneIDForSyncCircleIdentifier:domain:", &v30, &v29);
  id v14 = v30;

  id v15 = v29;
  if (v13)
  {
    id v16 = v14;
  }
  else
  {
    id v28 = v14;
    int v17 = objc_msgSend(a1, "hd_isContextSyncZoneIDForSyncCircleIdentifier:", &v28);
    id v18 = v28;

    if (!v17)
    {
      id v26 = v18;
      id v27 = 0;
      int v19 = objc_msgSend(a1, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v27, &v26);
      id v20 = v27;
      id v21 = v26;

      if (v19)
      {
        id v10 = v21;
        id v11 = v10;
      }
      else
      {
        id v24 = v21;
        id v25 = 0;
        int v22 = objc_msgSend(a1, "hd_isIndividualSyncZoneIDForStoreIdentifier:syncCircleIdentifier:", &v25, &v24);
        id v23 = v25;
        id v11 = v24;

        id v10 = 0;
        if (v22) {
          id v10 = v11;
        }
      }
      goto LABEL_22;
    }
    id v16 = v18;
  }
  id v10 = v16;
  id v11 = v16;
LABEL_22:

LABEL_8:

  return v10;
}

- (id)hd_storeIdentifier
{
  id v6 = 0;
  id v7 = 0;
  int v1 = objc_msgSend(a1, "hd_isIndividualSyncZoneIDForStoreIdentifier:syncCircleIdentifier:", &v7, &v6);
  id v2 = v7;
  id v3 = v6;
  id v4 = 0;
  if (v1) {
    id v4 = v2;
  }

  return v4;
}

- (id)hd_withOwnerName:()HDCloudSync
{
  id v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [a1 zoneName];
  id v8 = (void *)[v6 initWithZoneName:v7 ownerName:v5];

  return v8;
}

@end