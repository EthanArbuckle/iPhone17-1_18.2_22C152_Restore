@interface SHLCloudGroupTransformer
+ (id)baseCloudRecordFromGroup:(id)a3;
+ (id)cloudBackedItemFromLibraryGroup:(id)a3;
+ (id)libraryGroupFromCloudBackedItem:(id)a3;
@end

@implementation SHLCloudGroupTransformer

+ (id)libraryGroupFromCloudBackedItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 record];
  v5 = [v4 recordType];
  unsigned int v6 = [v5 isEqualToString:@"Group"];

  if (v6)
  {
    id v7 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    v8 = [v3 record];
    [v8 encodeSystemFieldsWithCoder:v7];

    v9 = [SHLLibraryItemMetadata alloc];
    v10 = [v7 encodedData];
    v11 = [(SHLLibraryItemMetadata *)v9 initWithEncodedSystemData:v10];

    v12 = [SHLLibraryGroup alloc];
    v13 = [v3 record];
    v14 = [v13 recordID];
    v15 = [v14 recordName];
    v16 = [(SHLLibraryGroup *)v12 initWithIdentifier:v15 metadata:v11];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)cloudBackedItemFromLibraryGroup:(id)a3
{
  id v3 = [a1 baseCloudRecordFromGroup:a3];
  if (v3) {
    v4 = [[SHLCloudBackedItem alloc] initWithRecord:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)baseCloudRecordFromGroup:(id)a3
{
  id v3 = a3;
  v4 = [v3 metadata];

  if (v4)
  {
    id v5 = objc_alloc((Class)NSKeyedUnarchiver);
    unsigned int v6 = [v3 metadata];

    id v7 = [v6 encodedSystemData];
    uint64_t v16 = 0;
    id v8 = [v5 initForReadingFromData:v7 error:&v16];

    id v9 = [objc_alloc((Class)CKRecord) initWithCoder:v8];
    [v8 finishDecoding];
  }
  else
  {
    id v10 = objc_alloc((Class)CKRecordID);
    v11 = [v3 identifier];

    v12 = +[SHLCloudContext sharedContext];
    v13 = [v12 shazamLibraryZone];
    v14 = [v13 zoneID];
    id v8 = [v10 initWithRecordName:v11 zoneID:v14];

    id v9 = [objc_alloc((Class)CKRecord) initWithRecordType:@"Group" recordID:v8];
  }

  return v9;
}

@end