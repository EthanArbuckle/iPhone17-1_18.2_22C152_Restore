@interface CKRecord(AXCloudKitHelperAdditionsGroup)
- (id)name;
- (uint64_t)basePunctuationGroup;
- (uint64_t)entries;
- (uint64_t)setBasePunctuationGroup:()AXCloudKitHelperAdditionsGroup;
- (uint64_t)setEntries:()AXCloudKitHelperAdditionsGroup;
- (void)setName:()AXCloudKitHelperAdditionsGroup;
@end

@implementation CKRecord(AXCloudKitHelperAdditionsGroup)

- (uint64_t)entries
{
  return [a1 objectForKey:@"entries"];
}

- (uint64_t)setEntries:()AXCloudKitHelperAdditionsGroup
{
  return [a1 setObject:a3 forKey:@"entries"];
}

- (id)name
{
  v1 = [a1 encryptedValues];
  v2 = [v1 objectForKey:@"name"];

  return v2;
}

- (void)setName:()AXCloudKitHelperAdditionsGroup
{
  id v4 = a3;
  id v5 = [a1 encryptedValues];
  [v5 setObject:v4 forKey:@"name"];
}

- (uint64_t)basePunctuationGroup
{
  return [a1 objectForKey:@"basePunctuationGroup"];
}

- (uint64_t)setBasePunctuationGroup:()AXCloudKitHelperAdditionsGroup
{
  return [a1 setObject:a3 forKey:@"basePunctuationGroup"];
}

@end