@interface CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable
+ (Class)entryClass;
+ (id)dbProperties;
- (CKContainerID)containerID;
- (CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable)init;
- (id)_lastSentCapabilityAndUsage;
- (void)_updateLastSentCapabilities:(id)a3 capabilitySetSavedDate:(id)a4;
- (void)_updateUsageSavedDate:(id)a3;
- (void)setContainerID:(id)a3;
@end

@implementation CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable

+ (id)dbProperties
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"rowID";
  v4[1] = @"deviceCapabilityStringSet";
  v5[0] = &unk_1F20AC6C0;
  v5[1] = &unk_1F20AC738;
  v4[2] = @"capabilitySetSavedDate";
  v4[3] = @"usageSavedDate";
  v5[2] = &unk_1F20AC708;
  v5[3] = &unk_1F20AC708;
  v2 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v5, v4, 4);
  return v2;
}

+ (Class)entryClass
{
  return (Class)objc_opt_class();
}

- (CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKDDeviceCapabilityLastSentCapabilitiesAndUsageTable;
  return [(CKSQLiteCacheTable *)&v3 initWithLogicalTableName:@"LastSentTable" entryCountLimit:1 dataSizeLimit:0 expirationTime:0.0 expireDelay:86400.0];
}

- (void)_updateLastSentCapabilities:(id)a3 capabilitySetSavedDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1C4EE5500;
  v12[3] = &unk_1E64F0458;
  id v13 = v6;
  id v14 = v7;
  v15 = self;
  id v8 = v7;
  id v9 = v6;
  id v11 = (id)objc_msgSend_performTransaction_(self, v10, (uint64_t)v12);
}

- (void)_updateUsageSavedDate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1C4EE5770;
  v8[3] = &unk_1E64F2090;
  id v9 = v4;
  v10 = self;
  id v5 = v4;
  id v7 = (id)objc_msgSend_performTransaction_(self, v6, (uint64_t)v8);
}

- (id)_lastSentCapabilityAndUsage
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1C4EE3554;
  v10 = sub_1C4EE3564;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1C4EE5A1C;
  v5[3] = &unk_1E64F5500;
  v5[4] = self;
  void v5[5] = &v6;
  id v2 = (id)objc_msgSend_performTransaction_(self, a2, (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end