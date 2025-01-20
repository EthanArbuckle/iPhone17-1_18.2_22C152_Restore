@interface MKFResidentSyncMetadata
+ (id)fetchRequest;
- (BOOL)validateForInsertOrUpdate:(id *)a3;
@end

@implementation MKFResidentSyncMetadata

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)MKFResidentSyncMetadata;
  BOOL v5 = -[HMDManagedObject validateForInsertOrUpdate:](&v15, sel_validateForInsertOrUpdate_);
  if (v5)
  {
    v6 = [(MKFResidentSyncMetadata *)self home];

    if (v6)
    {
      uint64_t v7 = [(MKFResidentSyncMetadata *)self lastSyncToken];
      if (!v7)
      {
LABEL_6:
        LOBYTE(v5) = 1;
        return v5;
      }
      v8 = (void *)v7;
      uint64_t v9 = [(MKFResidentSyncMetadata *)self lastSeenToken];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [(MKFResidentSyncMetadata *)self lastSyncTimestamp];

        if (v11) {
          goto LABEL_6;
        }
      }
      else
      {
      }
      if (a3)
      {
        v12 = @"lastSeenToken and lastSyncTimestamp are required if lastSyncToken is set";
        goto LABEL_12;
      }
    }
    else if (a3)
    {
      v12 = @"home is required";
LABEL_12:
      objc_msgSend(MEMORY[0x263F087E8], "hmd_validationErrorWithDescription:", v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = 0;
      *a3 = v13;
      return v5;
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"ResidentSyncMetadata"];
}

@end