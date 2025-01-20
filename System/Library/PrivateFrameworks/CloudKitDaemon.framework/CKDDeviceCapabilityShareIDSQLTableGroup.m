@interface CKDDeviceCapabilityShareIDSQLTableGroup
+ (id)_groupNameForContainer:(id)a3;
- (id)createTables:(id *)a3;
@end

@implementation CKDDeviceCapabilityShareIDSQLTableGroup

+ (id)_groupNameForContainer:(id)a3
{
  v3 = NSString;
  v4 = sub_1C4FC499C(a3);
  v6 = objc_msgSend_stringWithFormat_(v3, v5, @"%@", v4);

  v8 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(MEMORY[0x1E4F1A378], v7, 3, v6, @"DeviceCapabilityShareIDSQLTableGroup");

  return v8;
}

- (id)createTables:(id *)a3
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CKDZoneIDCacheTable);
  v4 = [CKDShareIDCacheTable alloc];
  v6 = objc_msgSend_initWithZoneIDTable_(v4, v5, (uint64_t)v3);
  v7 = [CKDZoneShareCacheTable alloc];
  v9 = objc_msgSend_initWithShareIDTable_(v7, v8, (uint64_t)v6);
  v10 = [CKDShareIDCacheRecordTable alloc];
  v12 = objc_msgSend_initWithShareIDTable_(v10, v11, (uint64_t)v6);
  v16[0] = v3;
  v16[1] = v6;
  v16[2] = v9;
  v16[3] = v12;
  v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v13, (uint64_t)v16, 4);

  return v14;
}

@end