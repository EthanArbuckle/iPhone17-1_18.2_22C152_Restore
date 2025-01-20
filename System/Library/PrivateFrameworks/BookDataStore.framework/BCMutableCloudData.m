@interface BCMutableCloudData
+ (BOOL)supportsSecureCoding;
- (BCCloudDataPrivacyDelegate)privacyDelegate;
- (BCMutableCloudData)init;
- (BCMutableCloudData)initWithCloudData:(id)a3;
- (BCMutableCloudData)initWithCoder:(id)a3;
- (BCMutableCloudData)initWithRecord:(id)a3;
- (BOOL)deletedFlag;
- (BOOL)isEqual:(id)a3;
- (CKRecord)systemFields;
- (NSData)ckSystemFields;
- (NSDate)modificationDate;
- (NSString)localRecordID;
- (id)configuredRecordFromAttributes;
- (id)identifier;
- (id)recordType;
- (id)zoneName;
- (int64_t)editGeneration;
- (int64_t)syncGeneration;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)incrementEditGeneration;
- (void)setDeletedFlag:(BOOL)a3;
- (void)setEditGeneration:(int64_t)a3;
- (void)setLocalRecordID:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPrivacyDelegate:(id)a3;
- (void)setSyncGeneration:(int64_t)a3;
- (void)setSystemFields:(id)a3;
@end

@implementation BCMutableCloudData

- (BCMutableCloudData)init
{
  v12.receiver = self;
  v12.super_class = (Class)BCMutableCloudData;
  v2 = [(BCMutableCloudData *)&v12 init];
  if (v2 && BUIsRunningTests())
  {
    v10 = objc_msgSend_nullPrivacyDelegate(BCCloudDataNullPrivacyDelegate, v3, v4, v5, v6, v7, v8, v9);
    objc_storeWeak((id *)&v2->_privacyDelegate, v10);
  }
  return v2;
}

- (BCMutableCloudData)initWithCloudData:(id)a3
{
  id v4 = a3;
  v19 = (BCMutableCloudData *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v19)
  {
    v20 = objc_msgSend_privacyDelegate(v4, v12, v13, v14, v15, v16, v17, v18);

    if (!v20)
    {
      v28 = BDSCloudKitLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_2361F9504();
      }
    }
    v29 = objc_msgSend_privacyDelegate(v4, v21, v22, v23, v24, v25, v26, v27);
    objc_storeWeak((id *)&v19->_privacyDelegate, v29);

    v19->_deletedFlag = objc_msgSend_deletedFlag(v4, v30, v31, v32, v33, v34, v35, v36);
    uint64_t v44 = objc_msgSend_modificationDate(v4, v37, v38, v39, v40, v41, v42, v43);
    modificationDate = v19->_modificationDate;
    v19->_modificationDate = (NSDate *)v44;

    v19->_editGeneration = objc_msgSend_editGeneration(v4, v46, v47, v48, v49, v50, v51, v52);
    v19->_syncGeneration = objc_msgSend_syncGeneration(v4, v53, v54, v55, v56, v57, v58, v59);
    uint64_t v67 = objc_msgSend_systemFields(v4, v60, v61, v62, v63, v64, v65, v66);
    systemFields = v19->_systemFields;
    v19->_systemFields = (CKRecord *)v67;
  }
  return v19;
}

- (BCMutableCloudData)initWithRecord:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)BCMutableCloudData;
    uint64_t v6 = [(BCMutableCloudData *)&v19 init];
    uint64_t v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_systemFields, a3);
      v7->_deletedFlag = 0;
      uint64_t v15 = objc_msgSend_modificationDate(v5, v8, v9, v10, v11, v12, v13, v14);
      modificationDate = v7->_modificationDate;
      v7->_modificationDate = (NSDate *)v15;

      v7->_editGeneration = 0;
      v7->_syncGeneration = 0;
    }
  }
  else
  {
    uint64_t v17 = BDSCloudKitLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_2361F9538();
    }

    uint64_t v7 = 0;
  }

  return v7;
}

- (NSData)ckSystemFields
{
  v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F956C();
  }

  uint64_t v10 = objc_msgSend_data(MEMORY[0x263EFF8F8], v3, v4, v5, v6, v7, v8, v9);
  return (NSData *)v10;
}

- (id)recordType
{
  v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F95A0();
  }

  return &stru_26E976C40;
}

- (id)identifier
{
  v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F95D4();
  }

  return 0;
}

- (id)zoneName
{
  v2 = BDSCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_2361F949C();
  }

  return &stru_26E976C40;
}

- (CKRecord)systemFields
{
  uint64_t v9 = objc_msgSend_privacyDelegate(self, a2, v2, v3, v4, v5, v6, v7);
  if (objc_msgSend_establishedSalt(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    uint64_t v24 = objc_msgSend_identifier(self, v17, v18, v19, v20, v21, v22, v23);

    if (v24)
    {
      uint64_t v32 = objc_msgSend_recordType(self, v25, v26, v27, v28, v29, v30, v31);
      uint64_t v40 = objc_msgSend_identifier(self, v33, v34, v35, v36, v37, v38, v39);
      v46 = objc_msgSend_recordNameFromRecordType_identifier_(v9, v41, (uint64_t)v32, (uint64_t)v40, v42, v43, v44, v45);

      systemFields = self->_systemFields;
      if (!systemFields
        || (objc_msgSend_recordID(systemFields, v47, v48, v49, v50, v51, v52, v53),
            uint64_t v55 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_recordName(v55, v56, v57, v58, v59, v60, v61, v62),
            uint64_t v63 = objc_claimAutoreleasedReturnValue(),
            char isEqualToString = objc_msgSend_isEqualToString_(v63, v64, (uint64_t)v46, v65, v66, v67, v68, v69),
            v63,
            v55,
            (isEqualToString & 1) == 0))
      {
        id v71 = objc_alloc(MEMORY[0x263EFD808]);
        v79 = objc_msgSend_zoneName(self, v72, v73, v74, v75, v76, v77, v78);
        v85 = objc_msgSend_initWithZoneName_ownerName_(v71, v80, (uint64_t)v79, *MEMORY[0x263EFD488], v81, v82, v83, v84);

        id v86 = objc_alloc(MEMORY[0x263EFD7E8]);
        v92 = objc_msgSend_initWithRecordName_zoneID_(v86, v87, (uint64_t)v46, (uint64_t)v85, v88, v89, v90, v91);
        id v93 = objc_alloc(MEMORY[0x263EFD7C8]);
        v101 = objc_msgSend_recordType(self, v94, v95, v96, v97, v98, v99, v100);
        v107 = (CKRecord *)objc_msgSend_initWithRecordType_recordID_(v93, v102, (uint64_t)v101, (uint64_t)v92, v103, v104, v105, v106);
        v108 = self->_systemFields;
        self->_systemFields = v107;

        objc_msgSend_incrementEditGeneration(self, v109, v110, v111, v112, v113, v114, v115);
      }
    }
  }
  v116 = self->_systemFields;

  return v116;
}

- (void)incrementEditGeneration
{
  uint64_t v10 = objc_msgSend_editGeneration(self, a2, v2, v3, v4, v5, v6, v7) + 1;
  objc_msgSend_setEditGeneration_(self, v9, v10, v11, v12, v13, v14, v15);
}

- (id)configuredRecordFromAttributes
{
  uint64_t v9 = objc_msgSend_systemFields(self, a2, v2, v3, v4, v5, v6, v7);
  uint64_t v17 = objc_msgSend_identifier(self, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v25 = objc_msgSend_encryptedValuesByKey(v9, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_setObject_forKeyedSubscript_(v25, v26, (uint64_t)v17, @"localRecordIDEncrypted", v27, v28, v29, v30);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = BUDynamicCast();

  uint64_t v6 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v5, v7, v6, v8, v9, v10, v11, v12))
  {
    uint64_t v20 = objc_msgSend_identifier(self, v13, v14, v15, v16, v17, v18, v19);
    uint64_t v28 = objc_msgSend_identifier(v5, v21, v22, v23, v24, v25, v26, v27);
    char isEqualToString = objc_msgSend_isEqualToString_(v20, v29, (uint64_t)v28, v30, v31, v32, v33, v34);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v8 = objc_msgSend_identifier(self, a2, v2, v3, v4, v5, v6, v7);
  unint64_t v16 = objc_msgSend_hash(v8, v9, v10, v11, v12, v13, v14, v15);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v69 = a3;
  uint64_t v11 = objc_msgSend_identifier(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(v69, v12, (uint64_t)v11, @"localRecordID", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_deletedFlag(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_encodeBool_forKey_(v69, v25, v24, @"deletedFlag", v26, v27, v28, v29);
  uint64_t v37 = objc_msgSend_modificationDate(self, v30, v31, v32, v33, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v69, v38, (uint64_t)v37, @"modificationDate", v39, v40, v41, v42);

  uint64_t v50 = objc_msgSend_editGeneration(self, v43, v44, v45, v46, v47, v48, v49);
  objc_msgSend_encodeInt64_forKey_(v69, v51, v50, @"editGeneration", v52, v53, v54, v55);
  uint64_t v63 = objc_msgSend_syncGeneration(self, v56, v57, v58, v59, v60, v61, v62);
  objc_msgSend_encodeInt64_forKey_(v69, v64, v63, @"syncGeneration", v65, v66, v67, v68);
}

- (BCMutableCloudData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = (BCMutableCloudData *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"localRecordID", v15, v16, v17, v18);
    localRecordID = v12->_localRecordID;
    v12->_localRecordID = (NSString *)v19;

    v12->_deletedFlag = objc_msgSend_decodeBoolForKey_(v4, v21, @"deletedFlag", v22, v23, v24, v25, v26);
    uint64_t v27 = objc_opt_class();
    uint64_t v33 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"modificationDate", v29, v30, v31, v32);
    modificationDate = v12->_modificationDate;
    v12->_modificationDate = (NSDate *)v33;

    v12->_editGeneration = objc_msgSend_decodeInt64ForKey_(v4, v35, @"editGeneration", v36, v37, v38, v39, v40);
    v12->_syncGeneration = objc_msgSend_decodeInt64ForKey_(v4, v41, @"syncGeneration", v42, v43, v44, v45, v46);
  }

  return v12;
}

- (BOOL)deletedFlag
{
  return self->_deletedFlag;
}

- (void)setDeletedFlag:(BOOL)a3
{
  self->_deletedFlag = a3;
}

- (int64_t)editGeneration
{
  return self->_editGeneration;
}

- (void)setEditGeneration:(int64_t)a3
{
  self->_editGeneration = a3;
}

- (int64_t)syncGeneration
{
  return self->_syncGeneration;
}

- (void)setSyncGeneration:(int64_t)a3
{
  self->_syncGeneration = a3;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (void)setSystemFields:(id)a3
{
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);
  return (BCCloudDataPrivacyDelegate *)WeakRetained;
}

- (void)setPrivacyDelegate:(id)a3
{
}

- (NSString)localRecordID
{
  return self->_localRecordID;
}

- (void)setLocalRecordID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecordID, 0);
  objc_destroyWeak((id *)&self->_privacyDelegate);
  objc_storeStrong((id *)&self->_systemFields, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end