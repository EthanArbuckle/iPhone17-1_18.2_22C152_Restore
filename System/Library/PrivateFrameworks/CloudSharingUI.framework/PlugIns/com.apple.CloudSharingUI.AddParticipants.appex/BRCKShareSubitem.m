@interface BRCKShareSubitem
+ (BOOL)supportsSecureCoding;
- (BRCKShareSubitem)initWithCoder:(id)a3;
- (BRCKShareSubitem)initWithShare:(id)a3;
- (CKShare)originalShare;
- (int64_t)publicPermission;
@end

@implementation BRCKShareSubitem

- (BRCKShareSubitem)initWithShare:(id)a3
{
  id v5 = a3;
  [v5 participants];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (NSString *)[v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    while (2)
    {
      for (i = 0; i != v7; i = (NSString *)((char *)i + 1))
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v10 role] == (id)1)
        {
          v11 = [v10 userIdentity];
          v12 = [v11 userRecordID];
          v7 = [v12 recordName];

          goto LABEL_11;
        }
      }
      v7 = (NSString *)[v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v13 = objc_alloc((Class)CKRecordZoneID);
  if (v7) {
    v14 = v7;
  }
  else {
    v14 = CKCurrentUserDefaultName;
  }
  id v15 = [v13 initWithZoneName:@"__NONE__" ownerName:v14];
  id v16 = [objc_alloc((Class)CKRecord) initWithRecordType:CKRecordTypeUserRecord zoneID:v15];
  id v17 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"__NONE__" zoneID:v15];
  v24.receiver = self;
  v24.super_class = (Class)BRCKShareSubitem;
  v18 = [(BRCKShareSubitem *)&v24 initWithRootRecord:v16 shareID:v17];
  if (v18)
  {
    id v19 = [v6 mutableCopy];
    [(BRCKShareSubitem *)v18 setAllParticipants:v19];

    objc_storeStrong((id *)&v18->_originalShare, a3);
    v18->_publicPermission = (int64_t)[v5 publicPermission];
    v20 = [v5 objectForKeyedSubscript:CKShareTitleKey];
    [(BRCKShareSubitem *)v18 setObject:v20 forKeyedSubscript:CKShareTitleKey];

    v21 = [v5 objectForKeyedSubscript:CKShareTypeKey];
    [(BRCKShareSubitem *)v18 setObject:v21 forKeyedSubscript:CKShareTypeKey];

    v22 = [v5 objectForKeyedSubscript:CKShareThumbnailImageDataKey];
    [(BRCKShareSubitem *)v18 setObject:v22 forKeyedSubscript:CKShareThumbnailImageDataKey];
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (BRCKShareSubitem)initWithCoder:(id)a3
{
  return 0;
}

- (int64_t)publicPermission
{
  return self->_publicPermission;
}

- (CKShare)originalShare
{
  return self->_originalShare;
}

- (void).cxx_destruct
{
}

@end