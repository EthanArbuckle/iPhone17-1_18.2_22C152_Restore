@interface CKMergeableValueID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (CKMergeableValueID)initWithCoder:(id)a3;
- (CKMergeableValueID)initWithData:(id)a3 zoneName:(id)a4 zoneOwner:(id)a5;
- (CKMergeableValueID)initWithData:(id)a3 zoneName:(id)a4 zoneOwner:(id)a5 recordName:(id)a6 recordFieldName:(id)a7 encrypted:(BOOL)a8;
- (CKMergeableValueID)initWithName:(id)a3;
- (CKMergeableValueID)initWithName:(id)a3 recordID:(id)a4 key:(id)a5 encrypted:(BOOL)a6;
- (CKMergeableValueID)initWithName:(id)a3 zoneID:(id)a4;
- (CKRoughlyEquivalentProperties)equivalencyProperties;
- (NSData)identifier;
- (NSString)recordFieldName;
- (NSString)recordName;
- (NSString)zoneName;
- (NSString)zoneOwner;
- (id)description;
- (id)name;
- (id)recordID;
- (id)zoneID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKMergeableValueID

- (CKMergeableValueID)initWithName:(id)a3
{
  v5 = objc_msgSend_dataUsingEncoding_(a3, a2, 4, v3);
  v7 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_(self, v6, (uint64_t)v5, 0, 0);

  return v7;
}

- (CKMergeableValueID)initWithData:(id)a3 zoneName:(id)a4 zoneOwner:(id)a5 recordName:(id)a6 recordFieldName:(id)a7 encrypted:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v22 = a7;
  if ((v18 != 0) != (v22 != 0))
  {
    v50 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v19, v20, v21);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v50, v51, (uint64_t)a2, (uint64_t)self, @"CKMergeableValueID.m", 36, @"Record name and record field name must either both be nil, or both be present");
  }
  v52.receiver = self;
  v52.super_class = (Class)CKMergeableValueID;
  v26 = [(CKMergeableValueID *)&v52 init];
  if (v26)
  {
    uint64_t v27 = objc_msgSend_copy(v15, v23, v24, v25);
    identifier = v26->_identifier;
    v26->_identifier = (NSData *)v27;

    uint64_t v32 = objc_msgSend_copy(v16, v29, v30, v31);
    zoneName = v26->_zoneName;
    v26->_zoneName = (NSString *)v32;

    uint64_t v37 = objc_msgSend_copy(v17, v34, v35, v36);
    zoneOwner = v26->_zoneOwner;
    v26->_zoneOwner = (NSString *)v37;

    uint64_t v42 = objc_msgSend_copy(v18, v39, v40, v41);
    recordName = v26->_recordName;
    v26->_recordName = (NSString *)v42;

    uint64_t v47 = objc_msgSend_copy(v22, v44, v45, v46);
    recordFieldName = v26->_recordFieldName;
    v26->_recordFieldName = (NSString *)v47;

    v26->_encrypted = a8;
  }

  return v26;
}

- (CKMergeableValueID)initWithData:(id)a3 zoneName:(id)a4 zoneOwner:(id)a5
{
  return (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_recordName_recordFieldName_encrypted_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, 0, 0, 0);
}

- (CKMergeableValueID)initWithName:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = objc_msgSend_anonymousCKUserID(v7, v8, v9, v10);

  if (v11) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v12, *MEMORY[0x1E4F1C3C8], @"Anonymous user ID not currently supported");
  }
  v14 = objc_msgSend_dataUsingEncoding_(v6, v12, 4, v13);
  id v18 = objc_msgSend_zoneName(v7, v15, v16, v17);
  id v22 = objc_msgSend_ownerName(v7, v19, v20, v21);

  uint64_t v24 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_(self, v23, (uint64_t)v14, (uint64_t)v18, v22);
  return v24;
}

- (CKMergeableValueID)initWithName:(id)a3 recordID:(id)a4 key:(id)a5 encrypted:(BOOL)a6
{
  BOOL v46 = a6;
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v15 = objc_msgSend_zoneID(v11, v12, v13, v14);
  v19 = objc_msgSend_anonymousCKUserID(v15, v16, v17, v18);

  if (v19) {
    objc_msgSend_raise_format_(MEMORY[0x1E4F1CA00], v20, *MEMORY[0x1E4F1C3C8], @"Anonymous user ID not currently supported");
  }
  id v22 = objc_msgSend_dataUsingEncoding_(v9, v20, 4, v21);
  v26 = objc_msgSend_zoneID(v11, v23, v24, v25);
  uint64_t v30 = objc_msgSend_zoneName(v26, v27, v28, v29);
  v34 = objc_msgSend_zoneID(v11, v31, v32, v33);
  v38 = objc_msgSend_ownerName(v34, v35, v36, v37);
  uint64_t v42 = objc_msgSend_recordName(v11, v39, v40, v41);

  v44 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_recordName_recordFieldName_encrypted_(self, v43, (uint64_t)v22, (uint64_t)v30, v38, v42, v10, v46);
  return v44;
}

- (id)name
{
  id v3 = [NSString alloc];
  id v7 = objc_msgSend_identifier(self, v4, v5, v6);
  id v9 = objc_msgSend_initWithData_encoding_(v3, v8, (uint64_t)v7, 4);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v7 = (CKMergeableValueID *)a3;
  if (v7 == self)
  {
    LOBYTE(v25) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      v12 = objc_msgSend_identifier(self, v9, v10, v11);
      v19 = objc_msgSend_identifier(v8, v13, v14, v15);
      if (v12 != v19)
      {
        id v3 = objc_msgSend_identifier(self, v16, v17, v18);
        uint64_t v5 = objc_msgSend_identifier(v8, v20, v21, v22);
        if (!objc_msgSend_isEqual_(v3, v23, (uint64_t)v5, v24))
        {
          LOBYTE(v25) = 0;
          goto LABEL_38;
        }
      }
      v26 = objc_msgSend_zoneName(self, v16, v17, v18);
      uint64_t v33 = objc_msgSend_zoneName(v8, v27, v28, v29);
      if (v26 == v33)
      {
        v102 = v26;
      }
      else
      {
        v4 = objc_msgSend_zoneName(self, v30, v31, v32);
        v106 = objc_msgSend_zoneName(v8, v34, v35, v36);
        if (!objc_msgSend_isEqual_(v4, v37, (uint64_t)v106, v38))
        {
          LOBYTE(v25) = 0;
LABEL_36:

LABEL_37:
          if (v12 == v19)
          {
LABEL_39:

            goto LABEL_40;
          }
LABEL_38:

          goto LABEL_39;
        }
        v102 = v26;
      }
      uint64_t v39 = objc_msgSend_zoneOwner(self, v30, v31, v32);
      uint64_t v104 = objc_msgSend_zoneOwner(v8, v40, v41, v42);
      v105 = (void *)v39;
      v103 = v12;
      if (v39 == v104)
      {
        v99 = v4;
      }
      else
      {
        BOOL v46 = objc_msgSend_zoneOwner(self, v43, v44, v45);
        v100 = objc_msgSend_zoneOwner(v8, v47, v48, v49);
        v101 = v46;
        if (!objc_msgSend_isEqual_(v46, v50, (uint64_t)v100, v51))
        {
          v68 = v3;
          v69 = v33;
          LOBYTE(v25) = 0;
          v70 = (void *)v104;
          v71 = v105;
LABEL_34:

LABEL_35:
          v26 = v102;
          uint64_t v33 = v69;
          BOOL v90 = v102 == v69;
          id v3 = v68;
          v12 = v103;
          if (v90) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
        v99 = v4;
      }
      objc_super v52 = objc_msgSend_recordName(self, v43, v44, v45);
      uint64_t v56 = objc_msgSend_recordName(v8, v53, v54, v55);
      v60 = (void *)v56;
      if (v52 == (void *)v56)
      {
        v97 = v5;
        v98 = v3;
      }
      else
      {
        v94 = (void *)v56;
        v61 = v52;
        v62 = objc_msgSend_recordName(self, v57, v58, v59);
        v95 = objc_msgSend_recordName(v8, v63, v64, v65);
        v96 = v62;
        if (!objc_msgSend_isEqual_(v62, v66, (uint64_t)v95, v67))
        {
          LOBYTE(v25) = 0;
          objc_super v52 = v61;
          v60 = v94;
          goto LABEL_31;
        }
        v97 = v5;
        v98 = v3;
        objc_super v52 = v61;
        v60 = v94;
      }
      v72 = objc_msgSend_recordFieldName(self, v57, v58, v59);
      v79 = objc_msgSend_recordFieldName(v8, v73, v74, v75);
      if (v72 != v79)
      {
        v92 = v72;
        v80 = objc_msgSend_recordFieldName(self, v76, v77, v78);
        v93 = objc_msgSend_recordFieldName(v8, v81, v82, v83);
        v94 = v80;
        if (!objc_msgSend_isEqual_(v80, v84, (uint64_t)v93, v85))
        {
          LOBYTE(v25) = 0;
          v72 = v92;
          goto LABEL_29;
        }
        v72 = v92;
      }
      int isEncrypted = objc_msgSend_isEncrypted(self, v76, v77, v78);
      int v25 = isEncrypted ^ objc_msgSend_isEncrypted(v8, v87, v88, v89) ^ 1;
      if (v72 == v79)
      {

        goto LABEL_30;
      }
LABEL_29:

LABEL_30:
      uint64_t v5 = v97;
      id v3 = v98;
      if (v52 == v60)
      {
        v68 = v98;
        v69 = v33;
LABEL_33:

        v71 = v105;
        v70 = (void *)v104;
        v4 = v99;
        if (v105 == (void *)v104) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
LABEL_31:
      v68 = v3;
      v69 = v33;

      goto LABEL_33;
    }
    LOBYTE(v25) = 0;
  }
LABEL_40:

  return v25;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_identifier(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_zoneName(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_zoneOwner(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_recordName(self, v26, v27, v28);
  uint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_recordFieldName(self, v34, v35, v36);
  unint64_t v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (id)description
{
  uint64_t v3 = objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_appendFormat_(v3, v6, @"<%@ %p;", v7, v5, self);

  uint64_t v11 = objc_msgSend_name(self, v8, v9, v10);
  uint64_t v15 = (void *)v11;
  if (v11) {
    objc_msgSend_appendFormat_(v3, v12, @" name=%@,", v14, v11);
  }
  uint64_t v16 = objc_msgSend_zoneName(self, v12, v13, v14);
  uint64_t v20 = (void *)v16;
  if (v16) {
    objc_msgSend_appendFormat_(v3, v17, @" zoneName=%@,", v19, v16);
  }
  uint64_t v21 = objc_msgSend_zoneOwner(self, v17, v18, v19);
  uint64_t v25 = (void *)v21;
  if (v21) {
    objc_msgSend_appendFormat_(v3, v22, @" zoneOwner=%@,", v24, v21);
  }
  uint64_t v26 = objc_msgSend_recordName(self, v22, v23, v24);
  uint64_t v30 = (void *)v26;
  if (v26) {
    objc_msgSend_appendFormat_(v3, v27, @" recordName=%@,", v29, v26);
  }
  uint64_t v31 = objc_msgSend_recordFieldName(self, v27, v28, v29);
  uint64_t v35 = (void *)v31;
  if (v31) {
    objc_msgSend_appendFormat_(v3, v32, @" fieldName=%@,", v34, v31);
  }
  if (objc_msgSend_isEncrypted(self, v32, v33, v34)) {
    objc_msgSend_appendFormat_(v3, v36, @" encrypted=%@", v37, @"Yes");
  }
  else {
    objc_msgSend_appendFormat_(v3, v36, @" encrypted=%@", v37, @"NO");
  }
  objc_msgSend_appendFormat_(v3, v38, @">", v39);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKMergeableValueID)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"i");
  uint64_t v8 = objc_opt_class();
  uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"z");
  uint64_t v11 = objc_opt_class();
  uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"o");
  uint64_t v14 = objc_opt_class();
  uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"r");
  uint64_t v17 = objc_opt_class();
  uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, @"f");
  uint64_t v22 = objc_msgSend_decodeBoolForKey_(v4, v20, @"e", v21);

  uint64_t v24 = (CKMergeableValueID *)objc_msgSend_initWithData_zoneName_zoneOwner_recordName_recordFieldName_encrypted_(self, v23, (uint64_t)v7, (uint64_t)v10, v13, v16, v19, v22);
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v34 = a3;
  uint64_t v7 = objc_msgSend_identifier(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v34, v8, (uint64_t)v7, @"i");

  uint64_t v12 = objc_msgSend_zoneName(self, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v34, v13, (uint64_t)v12, @"z");

  uint64_t v17 = objc_msgSend_zoneOwner(self, v14, v15, v16);
  objc_msgSend_encodeObject_forKey_(v34, v18, (uint64_t)v17, @"o");

  uint64_t v22 = objc_msgSend_recordName(self, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v34, v23, (uint64_t)v22, @"r");

  uint64_t v27 = objc_msgSend_recordFieldName(self, v24, v25, v26);
  objc_msgSend_encodeObject_forKey_(v34, v28, (uint64_t)v27, @"f");

  uint64_t isEncrypted = objc_msgSend_isEncrypted(self, v29, v30, v31);
  objc_msgSend_encodeBool_forKey_(v34, v33, isEncrypted, @"e");
}

- (id)zoneID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_zoneName(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v6 = [CKRecordZoneID alloc];
    uint64_t v10 = objc_msgSend_zoneName(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_zoneOwner(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_initWithZoneName_ownerName_(v6, v15, (uint64_t)v10, (uint64_t)v14);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = self;
      _os_log_fault_impl(&dword_18AF10000, v17, OS_LOG_TYPE_FAULT, "Trying to access nil zone ID on mergeable value ID: %@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)recordID
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_zoneID(self, a2, v2, v3);
  if (v8
    && (objc_msgSend_recordName(self, v5, v6, v7), uint64_t v9 = objc_claimAutoreleasedReturnValue(),
                                                   v9,
                                                   v9))
  {
    uint64_t v10 = [CKRecordID alloc];
    uint64_t v14 = objc_msgSend_recordName(self, v11, v12, v13);
    uint64_t v16 = objc_msgSend_initWithRecordName_zoneID_(v10, v15, (uint64_t)v14, (uint64_t)v8);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_FAULT))
    {
      int v19 = 138412290;
      uint64_t v20 = self;
      _os_log_fault_impl(&dword_18AF10000, v17, OS_LOG_TYPE_FAULT, "Trying to access nil record ID on mergeable value ID: %@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (CKRoughlyEquivalentProperties)equivalencyProperties
{
  uint64_t v3 = objc_opt_new();
  uint64_t v7 = objc_msgSend_identifier(self, v4, v5, v6);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v8, (uint64_t)v7, @"identifier");

  uint64_t v12 = objc_msgSend_properties(v3, v9, v10, v11);

  return (CKRoughlyEquivalentProperties *)v12;
}

- (NSData)identifier
{
  return self->_identifier;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)zoneOwner
{
  return self->_zoneOwner;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (NSString)recordFieldName
{
  return self->_recordFieldName;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordFieldName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
  objc_storeStrong((id *)&self->_zoneOwner, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end