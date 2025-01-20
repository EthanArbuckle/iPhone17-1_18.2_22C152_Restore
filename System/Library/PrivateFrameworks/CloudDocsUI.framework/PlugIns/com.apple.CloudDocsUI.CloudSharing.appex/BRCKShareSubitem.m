@interface BRCKShareSubitem
+ (BOOL)supportsSecureCoding;
- (BRCKShareSubitem)initWithCoder:(id)a3;
- (BRCKShareSubitem)initWithShare:(id)a3;
- (int64_t)publicPermission;
@end

@implementation BRCKShareSubitem

- (BRCKShareSubitem)initWithShare:(id)a3
{
  id v4 = a3;
  [v4 participants];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)[v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v6; i = (NSString *)((char *)i + 1))
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v9 role] == (id)1)
        {
          v10 = [v9 userIdentity];
          v11 = [v10 userRecordID];
          v6 = [v11 recordName];

          goto LABEL_11;
        }
      }
      v6 = (NSString *)[v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v12 = objc_alloc((Class)CKRecordZoneID);
  if (v6) {
    v13 = v6;
  }
  else {
    v13 = CKCurrentUserDefaultName;
  }
  id v14 = [v12 initWithZoneName:@"__NONE__" ownerName:v13];
  id v15 = [objc_alloc((Class)CKRecord) initWithRecordType:CKRecordTypeUserRecord zoneID:v14];
  id v16 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"__NONE__" zoneID:v14];
  v23.receiver = self;
  v23.super_class = (Class)BRCKShareSubitem;
  v17 = [(BRCKShareSubitem *)&v23 initWithRootRecord:v15 shareID:v16];
  if (v17)
  {
    id v18 = [v5 mutableCopy];
    [(BRCKShareSubitem *)v17 setAllParticipants:v18];

    v17->_publicPermission = (int64_t)[v4 publicPermission];
    v19 = [v4 objectForKeyedSubscript:CKShareTitleKey];
    [(BRCKShareSubitem *)v17 setObject:v19 forKeyedSubscript:CKShareTitleKey];

    v20 = [v4 objectForKeyedSubscript:CKShareTypeKey];
    [(BRCKShareSubitem *)v17 setObject:v20 forKeyedSubscript:CKShareTypeKey];

    v21 = [v4 objectForKeyedSubscript:CKShareThumbnailImageDataKey];
    [(BRCKShareSubitem *)v17 setObject:v21 forKeyedSubscript:CKShareThumbnailImageDataKey];
  }
  return v17;
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

@end