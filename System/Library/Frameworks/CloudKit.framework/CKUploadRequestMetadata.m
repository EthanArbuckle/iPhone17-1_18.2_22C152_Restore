@interface CKUploadRequestMetadata
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)recordID;
- (CKRecordID)repairZoneRecordID;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (CKUploadRequestMetadata)initWithCoder:(id)a3;
- (CKUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7;
- (NSString)fieldName;
- (NSString)recordType;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)description;
- (int64_t)databaseScope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKUploadRequestMetadata

+ (void)initialize
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v6, 2);
  sub_18AF14F44((uint64_t)a1, v3, v5, 0, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKUploadRequestMetadata)initWithRepairZoneRecordID:(id)a3 databaseScope:(int64_t)a4 recordID:(id)a5 recordType:(id)a6 fieldName:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v39.receiver = self;
  v39.super_class = (Class)CKUploadRequestMetadata;
  v16 = [(CKUploadRequestMetadata *)&v39 init];
  v20 = v16;
  if (v16)
  {
    v16->_databaseScope = a4;
    uint64_t v21 = objc_msgSend_copy(v13, v17, v18, v19);
    recordID = v20->_recordID;
    v20->_recordID = (CKRecordID *)v21;

    uint64_t v26 = objc_msgSend_copy(v14, v23, v24, v25);
    recordType = v20->_recordType;
    v20->_recordType = (NSString *)v26;

    uint64_t v31 = objc_msgSend_copy(v15, v28, v29, v30);
    fieldName = v20->_fieldName;
    v20->_fieldName = (NSString *)v31;

    uint64_t v36 = objc_msgSend_copy(v12, v33, v34, v35);
    repairZoneRecordID = v20->_repairZoneRecordID;
    v20->_repairZoneRecordID = (CKRecordID *)v36;
  }
  return v20;
}

- (CKUploadRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKUploadRequestMetadata;
  v5 = [(CKUploadRequestMetadata *)&v31 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    v7 = NSStringFromSelector(sel_databaseScope);
    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v8, (uint64_t)v7, v9);

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_recordID);
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v10, (uint64_t)v11);
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector(sel_recordType);
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v15, (uint64_t)v16);
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v18;

    uint64_t v20 = objc_opt_class();
    uint64_t v21 = NSStringFromSelector(sel_fieldName);
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v20, (uint64_t)v21);
    fieldName = v5->_fieldName;
    v5->_fieldName = (NSString *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v26 = NSStringFromSelector(sel_repairZoneRecordID);
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v25, (uint64_t)v26);
    repairZoneRecordID = v5->_repairZoneRecordID;
    v5->_repairZoneRecordID = (CKRecordID *)v28;
  }

  return v5;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  v3 = objc_opt_new();
  id v4 = NSNumber;
  uint64_t v8 = objc_msgSend_databaseScope(self, v5, v6, v7);
  v11 = objc_msgSend_numberWithInteger_(v4, v9, v8, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"databaseScope");

  v16 = objc_msgSend_recordType(self, v13, v14, v15);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v17, (uint64_t)v16, @"recordType");

  uint64_t v21 = objc_msgSend_fieldName(self, v18, v19, v20);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v22, (uint64_t)v21, @"fieldName");

  uint64_t v26 = objc_msgSend_recordID(self, v23, v24, v25);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v27, (uint64_t)v26, @"recordID");

  objc_super v31 = objc_msgSend_repairZoneRecordID(self, v28, v29, v30);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v32, (uint64_t)v31, @"repairZoneRecordID");

  uint64_t v36 = objc_msgSend_properties(v3, v33, v34, v35);

  return (CKRoughlyEquivalentProperties *)v36;
}

- (void)encodeWithCoder:(id)a3
{
  id v35 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t v8 = objc_msgSend_databaseScope(self, v5, v6, v7);
  uint64_t v9 = NSStringFromSelector(sel_databaseScope);
  objc_msgSend_encodeInteger_forKey_(v35, v10, v8, (uint64_t)v9);

  uint64_t v14 = objc_msgSend_recordID(self, v11, v12, v13);
  uint64_t v15 = NSStringFromSelector(sel_recordID);
  objc_msgSend_encodeObject_forKey_(v35, v16, (uint64_t)v14, (uint64_t)v15);

  uint64_t v20 = objc_msgSend_recordType(self, v17, v18, v19);
  uint64_t v21 = NSStringFromSelector(sel_recordType);
  objc_msgSend_encodeObject_forKey_(v35, v22, (uint64_t)v20, (uint64_t)v21);

  uint64_t v26 = objc_msgSend_fieldName(self, v23, v24, v25);
  v27 = NSStringFromSelector(sel_fieldName);
  objc_msgSend_encodeObject_forKey_(v35, v28, (uint64_t)v26, (uint64_t)v27);

  v32 = objc_msgSend_repairZoneRecordID(self, v29, v30, v31);
  v33 = NSStringFromSelector(sel_repairZoneRecordID);
  objc_msgSend_encodeObject_forKey_(v35, v34, (uint64_t)v32, (uint64_t)v33);
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_databaseScope(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_recordID(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;
  v17 = objc_msgSend_recordType(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_hash(v17, v18, v19, v20);
  uint64_t v25 = objc_msgSend_fieldName(self, v22, v23, v24);
  uint64_t v29 = v13 ^ v21 ^ objc_msgSend_hash(v25, v26, v27, v28);
  v33 = objc_msgSend_repairZoneRecordID(self, v30, v31, v32);
  unint64_t v37 = v29 ^ objc_msgSend_hash(v33, v34, v35, v36);

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKUploadRequestMetadata *)a3;
  if (self == v4)
  {
    char v59 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
    {
      uint64_t v8 = v4;
      uint64_t v12 = objc_msgSend_databaseScope(self, v9, v10, v11);
      if (v12 != objc_msgSend_databaseScope(v8, v13, v14, v15)) {
        goto LABEL_10;
      }
      uint64_t v19 = objc_msgSend_recordID(self, v16, v17, v18);
      uint64_t v23 = objc_msgSend_recordID(v8, v20, v21, v22);
      int isEqual = objc_msgSend_isEqual_(v19, v24, (uint64_t)v23, v25);

      if (!isEqual) {
        goto LABEL_10;
      }
      uint64_t v30 = objc_msgSend_recordType(self, v27, v28, v29);
      uint64_t v34 = objc_msgSend_recordType(v8, v31, v32, v33);
      int v37 = objc_msgSend_isEqual_(v30, v35, (uint64_t)v34, v36);

      if (!v37) {
        goto LABEL_10;
      }
      v41 = objc_msgSend_fieldName(self, v38, v39, v40);
      v45 = objc_msgSend_fieldName(v8, v42, v43, v44);
      int v48 = objc_msgSend_isEqual_(v41, v46, (uint64_t)v45, v47);

      if (v48)
      {
        v52 = objc_msgSend_repairZoneRecordID(self, v49, v50, v51);
        v56 = objc_msgSend_repairZoneRecordID(v8, v53, v54, v55);
        char v59 = objc_msgSend_isEqual_(v52, v57, (uint64_t)v56, v58);
      }
      else
      {
LABEL_10:
        char v59 = 0;
      }
    }
    else
    {
      char v59 = 0;
    }
  }

  return v59;
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3, a4, a5);
  uint64_t v11 = objc_msgSend_repairZoneRecordID(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_recordName(v11, v12, v13, v14);
  objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v16, @"requestRecordName", (uint64_t)v15);

  if (v5)
  {
    unint64_t v20 = objc_msgSend_databaseScope(self, v17, v18, v19);
    uint64_t v21 = CKDatabaseScopeString(v20);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v22, @"databaseScope", (uint64_t)v21);

    uint64_t v26 = objc_msgSend_recordID(self, v23, v24, v25);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v27, @"recordID", (uint64_t)v26);

    uint64_t v31 = objc_msgSend_recordType(self, v28, v29, v30);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v32, @"recordType", (uint64_t)v31);

    uint64_t v36 = objc_msgSend_fieldName(self, v33, v34, v35);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v7, v37, @"fieldName", (uint64_t)v36);
  }

  return v7;
}

- (id)description
{
  return (id)((uint64_t (*)(CKUploadRequestMetadata *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (CKRecordID)repairZoneRecordID
{
  return self->_repairZoneRecordID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairZoneRecordID, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_recordType, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

@end