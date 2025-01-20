@interface CKDThrottleTableGroup
+ (BOOL)rebootShouldClearData;
+ (id)groupName;
- (id)createTables:(id *)a3;
@end

@implementation CKDThrottleTableGroup

+ (id)groupName
{
  return (id)objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(MEMORY[0x1E4F1A378], a2, 0, 0, @"Throttle");
}

+ (BOOL)rebootShouldClearData
{
  return 1;
}

- (id)createTables:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1A468]);
  v5 = objc_msgSend_initWithLogicalTableName_(v3, v4, @"Throttle");
  v9[0] = v5;
  v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v9, 1);

  return v7;
}

@end