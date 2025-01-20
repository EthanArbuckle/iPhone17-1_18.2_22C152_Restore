@interface CKDDeviceCapabilityTableGroup
+ (double)expirationTime;
+ (id)_groupNameForContainer:(id)a3;
- (id)createTables:(id *)a3;
@end

@implementation CKDDeviceCapabilityTableGroup

+ (id)_groupNameForContainer:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = sub_1C4FC499C(v4);
  v8 = objc_msgSend_deviceID(v4, v6, v7);

  v10 = objc_msgSend_stringWithFormat_(v3, v9, @"%@-%@", v5, v8);

  v12 = objc_msgSend_groupNameWithDomain_domainIdentifier_groupName_(MEMORY[0x1E4F1A378], v11, 3, v10, @"DeviceCapabilityUsageSQLCache");

  return v12;
}

- (id)createTables:(id *)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(CKDDeviceCapabilityUsageSQLTable);
  id v4 = objc_alloc_init(CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable);
  v8[0] = v3;
  v8[1] = v4;
  v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, 2);

  return v6;
}

+ (double)expirationTime
{
  return 15552000.0;
}

@end