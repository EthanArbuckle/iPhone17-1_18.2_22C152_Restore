@interface CKUploadRequestConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)configurationFromBaseContainer:(id)a3;
+ (id)resolvedConfigurationWithBaseContainer:(id)a3 overrides:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CKRecordZoneID)repairZoneID;
- (CKUploadRequestConfiguration)initWithCoder:(id)a3;
- (CKUploadRequestConfiguration)initWithSqliteRepresentation:(id)a3;
- (NSString)applicationBundleIdentifierOverride;
- (NSString)containerIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initFromBaseContainer:(id)a3;
- (id)sqliteRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationBundleIdentifierOverride:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setRepairZoneID:(id)a3;
@end

@implementation CKUploadRequestConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)resolvedConfigurationWithBaseContainer:(id)a3 overrides:(id)a4
{
  id v5 = a4;
  v8 = v5;
  if (a3)
  {
    objc_msgSend_configurationFromBaseContainer_(CKUploadRequestConfiguration, v6, (uint64_t)a3, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_containerIdentifier(v8, v10, v11, v12);
    if (v16) {
      objc_msgSend_setContainerIdentifier_(v9, v13, (uint64_t)v16, v15);
    }
    v20 = objc_msgSend_applicationBundleIdentifierOverride(v8, v13, v14, v15);
    if (v20) {
      objc_msgSend_setApplicationBundleIdentifierOverride_(v9, v17, (uint64_t)v20, v19);
    }
    v23 = objc_msgSend_repairZoneID(v8, v17, v18, v19);
    if (v23) {
      objc_msgSend_setRepairZoneID_(v9, v21, (uint64_t)v23, v22);
    }
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

+ (id)configurationFromBaseContainer:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_initFromBaseContainer_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (id)initFromBaseContainer:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKUploadRequestConfiguration;
  v8 = [(CKUploadRequestConfiguration *)&v27 init];
  if (v8)
  {
    id v9 = NSString;
    v10 = objc_msgSend_containerIdentifier(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v9, v11, @"com.apple.cloudkit.metadata-%@", @"%@", 0, v10);
    containerIdentifier = v8->_containerIdentifier;
    v8->_containerIdentifier = (NSString *)v12;

    uint64_t v14 = NSString;
    uint64_t v18 = objc_msgSend_primaryIdentifier(v4, v15, v16, v17);
    uint64_t v20 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v14, v19, @"com.apple.upload-request-proxy.%@", @"%@", 0, v18);
    applicationBundleIdentifierOverride = v8->_applicationBundleIdentifierOverride;
    v8->_applicationBundleIdentifierOverride = (NSString *)v20;

    uint64_t v22 = [CKRecordZoneID alloc];
    uint64_t v24 = objc_msgSend_initWithZoneName_ownerName_(v22, v23, @"RepairZone", @"__defaultOwner__");
    repairZoneID = v8->_repairZoneID;
    v8->_repairZoneID = (CKRecordZoneID *)v24;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CKUploadRequestConfiguration);
  v8 = objc_msgSend_containerIdentifier(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  containerIdentifier = v4->_containerIdentifier;
  v4->_containerIdentifier = (NSString *)v12;

  uint64_t v17 = objc_msgSend_applicationBundleIdentifierOverride(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);
  applicationBundleIdentifierOverride = v4->_applicationBundleIdentifierOverride;
  v4->_applicationBundleIdentifierOverride = (NSString *)v21;

  v26 = objc_msgSend_repairZoneID(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_copy(v26, v27, v28, v29);
  repairZoneID = v4->_repairZoneID;
  v4->_repairZoneID = (CKRecordZoneID *)v30;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_containerIdentifier(self, v5, v6, v7);
  id v9 = NSStringFromSelector(sel_containerIdentifier);
  objc_msgSend_encodeObject_forKey_(v23, v10, (uint64_t)v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_applicationBundleIdentifierOverride(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_applicationBundleIdentifierOverride);
  objc_msgSend_encodeObject_forKey_(v23, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_repairZoneID(self, v17, v18, v19);
  uint64_t v21 = NSStringFromSelector(sel_repairZoneID);
  objc_msgSend_encodeObject_forKey_(v23, v22, (uint64_t)v20, (uint64_t)v21);
}

- (CKUploadRequestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKUploadRequestConfiguration;
  id v5 = [(CKUploadRequestConfiguration *)&v23 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_containerIdentifier);
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v7, (uint64_t)v8);
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = NSStringFromSelector(sel_applicationBundleIdentifierOverride);
    uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, (uint64_t)v13);
    applicationBundleIdentifierOverride = v5->_applicationBundleIdentifierOverride;
    v5->_applicationBundleIdentifierOverride = (NSString *)v15;

    uint64_t v17 = objc_opt_class();
    uint64_t v18 = NSStringFromSelector(sel_repairZoneID);
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v17, (uint64_t)v18);
    repairZoneID = v5->_repairZoneID;
    v5->_repairZoneID = (CKRecordZoneID *)v20;
  }

  return v5;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_containerIdentifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_applicationBundleIdentifierOverride(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKUploadRequestConfiguration *)a3;
  if (self == v4)
  {
    char v32 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v9 = objc_msgSend_containerIdentifier(v5, v6, v7, v8);
      uint64_t v13 = objc_msgSend_containerIdentifier(self, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (objc_msgSend_applicationBundleIdentifierOverride(v5, v15, v16, v17),
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_applicationBundleIdentifierOverride(self, v19, v20, v21),
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = CKObjectsAreBothNilOrEqual(v18, v22),
            v22,
            v18,
            v23))
      {
        objc_super v27 = objc_msgSend_repairZoneID(v5, v24, v25, v26);
        v31 = objc_msgSend_repairZoneID(self, v28, v29, v30);
        char v32 = CKObjectsAreBothNilOrEqual(v27, v31);
      }
      else
      {
        char v32 = 0;
      }
    }
    else
    {
      char v32 = 0;
    }
  }

  return v32;
}

- (id)sqliteRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_containerIdentifier(self, v4, v5, v6);
  uint64_t v8 = NSStringFromSelector(sel_containerIdentifier);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, (uint64_t)v7, (uint64_t)v8);

  uint64_t v13 = objc_msgSend_applicationBundleIdentifierOverride(self, v10, v11, v12);
  int v14 = NSStringFromSelector(sel_applicationBundleIdentifierOverride);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v13, (uint64_t)v14);

  uint64_t v19 = objc_msgSend_repairZoneID(self, v16, v17, v18);
  int v23 = objc_msgSend_sqliteRepresentation(v19, v20, v21, v22);
  uint64_t v24 = NSStringFromSelector(sel_repairZoneID);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v23, (uint64_t)v24);

  id v34 = 0;
  objc_super v27 = objc_msgSend_dataWithJSONObject_options_error_(MEMORY[0x1E4F28D90], v26, (uint64_t)v3, 0, &v34);
  id v28 = v34;
  if (v28)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v29 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v28;
      _os_log_error_impl(&dword_18AF10000, v29, OS_LOG_TYPE_ERROR, "Error converting CKUploadRequestConfiguration to JSON: %@", buf, 0xCu);
    }
  }
  id v30 = [NSString alloc];
  char v32 = objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v27, 4);

  return v32;
}

- (CKUploadRequestConfiguration)initWithSqliteRepresentation:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_dataUsingEncoding_(v4, v8, 4, v9);
    id v38 = 0;
    uint64_t v12 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v11, (uint64_t)v10, 0, &v38);
    id v13 = v38;
    if (v13 || !v12)
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      v35 = ck_log_facility_ck;
      if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v13;
        _os_log_error_impl(&dword_18AF10000, v35, OS_LOG_TYPE_ERROR, "Error converting JSON data to CKUploadRequestConfiguration: %@", buf, 0xCu);
      }
      id v34 = 0;
    }
    else
    {
      v37.receiver = self;
      v37.super_class = (Class)CKUploadRequestConfiguration;
      int v14 = [(CKUploadRequestConfiguration *)&v37 init];
      if (v14)
      {
        uint64_t v15 = NSStringFromSelector(sel_containerIdentifier);
        uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v12, v16, (uint64_t)v15, v17);
        containerIdentifier = v14->_containerIdentifier;
        v14->_containerIdentifier = (NSString *)v18;

        uint64_t v20 = NSStringFromSelector(sel_applicationBundleIdentifierOverride);
        uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v12, v21, (uint64_t)v20, v22);
        applicationBundleIdentifierOverride = v14->_applicationBundleIdentifierOverride;
        v14->_applicationBundleIdentifierOverride = (NSString *)v23;

        uint64_t v25 = [CKRecordZoneID alloc];
        uint64_t v26 = NSStringFromSelector(sel_repairZoneID);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v12, v27, (uint64_t)v26, v28);
        uint64_t v32 = objc_msgSend_initWithSqliteRepresentation_(v25, v30, (uint64_t)v29, v31);
        repairZoneID = v14->_repairZoneID;
        v14->_repairZoneID = (CKRecordZoneID *)v32;
      }
      self = v14;
      id v34 = self;
    }
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifierOverride
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
}

- (CKRecordZoneID)repairZoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRepairZoneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairZoneID, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverride, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end