@interface CKRecordID(HMDBackingStoreLocal)
+ (id)parseFromString:()HMDBackingStoreLocal;
- (id)encodeForKey;
@end

@implementation CKRecordID(HMDBackingStoreLocal)

- (id)encodeForKey
{
  v2 = NSString;
  v3 = [a1 zoneID];
  v4 = [v3 ownerName];
  v5 = [a1 zoneID];
  v6 = [v5 zoneName];
  v7 = [a1 recordName];
  v8 = [v2 stringWithFormat:@"%@/%@/%@", v4, v6, v7];

  return v8;
}

+ (id)parseFromString:()HMDBackingStoreLocal
{
  v3 = [a3 componentsSeparatedByString:@"/"];
  if ([v3 count] == 3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1A320]);
    v5 = [v3 objectAtIndex:1];
    v6 = [v3 objectAtIndex:0];
    v7 = (void *)[v4 initWithZoneName:v5 ownerName:v6];

    id v8 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    v9 = [v3 objectAtIndex:2];
    v10 = (void *)[v8 initWithRecordName:v9 zoneID:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end