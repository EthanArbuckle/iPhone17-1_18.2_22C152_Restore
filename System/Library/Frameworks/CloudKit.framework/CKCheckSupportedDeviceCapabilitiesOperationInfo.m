@interface CKCheckSupportedDeviceCapabilitiesOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKCheckSupportedDeviceCapabilitiesOperationInfo)initWithCoder:(id)a3;
- (CKDeviceCapabilityCheckOptions)options;
- (NSArray)desiredCapabilitySets;
- (NSArray)zoneIDs;
- (void)encodeWithCoder:(id)a3;
- (void)setDesiredCapabilitySets:(id)a3;
- (void)setOptions:(id)a3;
- (void)setZoneIDs:(id)a3;
@end

@implementation CKCheckSupportedDeviceCapabilitiesOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v21.receiver = self;
  v21.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperationInfo;
  [(CKDatabaseOperationInfo *)&v21 encodeWithCoder:v4];
  v9 = objc_msgSend_zoneIDs(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"recordZoneIDs");

  v14 = objc_msgSend_desiredCapabilitySets(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"desiredCapabilitySets");

  v19 = objc_msgSend_options(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"options");
}

- (CKCheckSupportedDeviceCapabilitiesOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKCheckSupportedDeviceCapabilitiesOperationInfo;
  v5 = [(CKDatabaseOperationInfo *)&v32 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    uint64_t v14 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, @"recordZoneIDs");
    zoneIDs = v5->_zoneIDs;
    v5->_zoneIDs = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v23 = objc_msgSend_setWithObjects_(v16, v21, v17, v22, v18, v19, v20, 0);
    uint64_t v25 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, @"desiredCapabilitySets");
    desiredCapabilitySets = v5->_desiredCapabilitySets;
    v5->_desiredCapabilitySets = (NSArray *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"options");
    options = v5->_options;
    v5->_options = (CKDeviceCapabilityCheckOptions *)v29;
  }

  return v5;
}

- (NSArray)zoneIDs
{
  return self->_zoneIDs;
}

- (void)setZoneIDs:(id)a3
{
}

- (NSArray)desiredCapabilitySets
{
  return self->_desiredCapabilitySets;
}

- (void)setDesiredCapabilitySets:(id)a3
{
}

- (CKDeviceCapabilityCheckOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_desiredCapabilitySets, 0);

  objc_storeStrong((id *)&self->_zoneIDs, 0);
}

@end