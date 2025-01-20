@interface SGDelivery(Building)
+ (id)deliveryForEntity:()Building origin:;
+ (id)deliveryForEntity:()Building store:;
@end

@implementation SGDelivery(Building)

+ (id)deliveryForEntity:()Building origin:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 duplicateKey];
  v8 = [v7 deliveryKey];

  v9 = [v5 duplicateKey];
  v10 = [v9 parentKey];

  uint64_t v11 = [v6 externalKey];
  if (!v11) {
    goto LABEL_9;
  }
  v12 = (void *)v11;
  v13 = [v6 externalKey];
  uint64_t v14 = [v13 length];

  if (!v14) {
    goto LABEL_9;
  }
  if ([v10 entityType] == 5)
  {
    v15 = [v6 externalKey];
    v16 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v17 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:v16];

    v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = (void *)[[NSString alloc] initWithFormat:@"message:%@", v17];
    v20 = [v18 URLWithString:v19];
  }
  else
  {
    if ([v10 entityType] != 13) {
      goto LABEL_9;
    }
    v21 = (void *)MEMORY[0x1E4F5D9D8];
    v17 = [v6 externalKey];
    v20 = [v21 urlForEKEventFromTextMessageWithUniqueIdentifier:v17];
  }

  if (v20)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F5D9D0]);
    v23 = [v5 recordId];
    uint64_t v24 = [v8 provider];
    v25 = [v8 trackingNumber];
    v26 = (void *)[v22 initWithRecordId:v23 origin:v6 parentURL:v20 provider:v24 trackingNumber:v25];

    goto LABEL_10;
  }
LABEL_9:
  v26 = 0;
LABEL_10:

  return v26;
}

+ (id)deliveryForEntity:()Building store:
{
  id v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F5DAC8];
    id v9 = a3;
    v10 = [v9 duplicateKey];
    uint64_t v11 = [v9 sourceKey];
    v12 = [v8 originForDuplicateKey:v10 sourceKey:v11 store:v7];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28B00];
    id v16 = a3;
    v10 = [v15 currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"SGDelivery+Building.m", 25, @"Invalid parameter not satisfying: %@", @"store" object file lineNumber description];
    v12 = 0;
  }

  v13 = [a1 deliveryForEntity:a3 origin:v12];

  return v13;
}

@end