@interface BCSCloudKitQueryProvider
- (id)_shardRecordNameForType:(int64_t)a3 index:(int64_t)a4 count:(int64_t)a5;
- (id)_shardRecordTypeForType:(int64_t)a3;
- (id)queryForFetchConfigItemWithType:(int64_t)a3;
- (id)queryForFetchItemsWithStartIndex:(int64_t)a3 endIndex:(int64_t)a4 type:(int64_t)a5;
- (id)queryForFetchShardIdentifier:(id)a3;
@end

@implementation BCSCloudKitQueryProvider

- (id)queryForFetchConfigItemWithType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v3 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:@"config-v1"];
      v4 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v3 action:0];
      v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"recordID", v4];
      id v6 = objc_alloc(MEMORY[0x263EFD7B0]);
      v7 = @"ChatSuggestConfig";
      goto LABEL_7;
    case 2:
      v3 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:@"config-v2"];
      v4 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v3 action:0];
      v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"recordID", v4];
      id v6 = objc_alloc(MEMORY[0x263EFD7B0]);
      v7 = @"DomainLinkConfig";
      goto LABEL_7;
    case 3:
      v3 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:@"caller-id-config-v1"];
      v4 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v3 action:0];
      v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"recordID", v4];
      id v6 = objc_alloc(MEMORY[0x263EFD7B0]);
      v7 = @"CallerIdConfig";
      goto LABEL_7;
    case 4:
      v3 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:@"BrandedEmail-config-v1"];
      v4 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v3 action:0];
      v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@ AND %K == %@", @"recordID", v4, @"assetType", @"BrandedEmail"];
      id v6 = objc_alloc(MEMORY[0x263EFD7B0]);
      v7 = @"BcaConfig";
LABEL_7:
      v8 = (void *)[v6 initWithRecordType:v7 predicate:v5];

      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)queryForFetchShardIdentifier:(id)a3
{
  id v4 = a3;
  v5 = -[BCSCloudKitQueryProvider _shardRecordNameForType:index:count:](self, "_shardRecordNameForType:index:count:", [v4 type], objc_msgSend(v4, "startIndex"), objc_msgSend(v4, "shardCount"));
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v5];
  v7 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v6 action:0];
  v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"recordID", v7];
  id v9 = objc_alloc(MEMORY[0x263EFD7B0]);
  uint64_t v10 = [v4 type];

  v11 = [(BCSCloudKitQueryProvider *)self _shardRecordTypeForType:v10];
  v12 = (void *)[v9 initWithRecordType:v11 predicate:v8];

  return v12;
}

- (id)queryForFetchItemsWithStartIndex:(int64_t)a3 endIndex:(int64_t)a4 type:(int64_t)a5
{
  switch(a5)
  {
    case 3:
      v12 = (void *)MEMORY[0x263F08A98];
      v13 = [NSNumber numberWithLongLong:a3];
      v14 = [NSNumber numberWithLongLong:a4];
      id v9 = [v12 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"hash", v13, @"hash", v14];

      id v10 = objc_alloc(MEMORY[0x263EFD7B0]);
      v11 = @"CallerId";
      goto LABEL_7;
    case 2:
      v15 = (void *)MEMORY[0x263F08A98];
      v16 = [NSNumber numberWithLongLong:a3];
      v17 = [NSNumber numberWithLongLong:a4];
      id v9 = [v15 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"hashPrefix", v16, @"hashPrefix", v17];

      id v10 = objc_alloc(MEMORY[0x263EFD7B0]);
      v11 = @"BusinessLink";
      goto LABEL_7;
    case 1:
      id v6 = (void *)MEMORY[0x263F08A98];
      v7 = [NSNumber numberWithLongLong:a3];
      v8 = [NSNumber numberWithLongLong:a4];
      id v9 = [v6 predicateWithFormat:@"%K >= %@ AND %K <= %@", @"hash", v7, @"hash", v8];

      id v10 = objc_alloc(MEMORY[0x263EFD7B0]);
      v11 = @"ChatSuggest";
LABEL_7:
      v18 = (void *)[v10 initWithRecordType:v11 predicate:v9];

      goto LABEL_9;
  }
  v18 = 0;
LABEL_9:

  return v18;
}

- (id)_shardRecordNameForType:(int64_t)a3 index:(int64_t)a4 count:(int64_t)a5
{
  if ((unint64_t)(a3 - 1) <= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", off_264249C68[a3 - 1], a4, a5, v5);
    self = (BCSCloudKitQueryProvider *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)_shardRecordTypeForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 3) {
    return @"ChatSuggestFilter";
  }
  else {
    return off_264249C90[a3 - 2];
  }
}

@end