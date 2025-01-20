@interface CKRecord(AXCloudKitHelperAdditions)
- (uint64_t)setUuid:()AXCloudKitHelperAdditions;
- (uint64_t)setVersion:()AXCloudKitHelperAdditions;
- (uint64_t)uuid;
- (uint64_t)version;
@end

@implementation CKRecord(AXCloudKitHelperAdditions)

- (uint64_t)uuid
{
  return [a1 objectForKey:@"uuid"];
}

- (uint64_t)setUuid:()AXCloudKitHelperAdditions
{
  return [a1 setObject:a3 forKey:@"uuid"];
}

- (uint64_t)version
{
  return [a1 objectForKey:@"version"];
}

- (uint64_t)setVersion:()AXCloudKitHelperAdditions
{
  return [a1 setObject:a3 forKey:@"version"];
}

@end