@interface BDSCloudSyncDiagnosticCloudDataInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticCloudDataInfo)initWithCoder:(id)a3;
- (BDSCloudSyncDiagnosticCloudDataInfo)initWithIdentifier:(id)a3 saltedHashedID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)stateForLog;
- (NSString)identifier;
- (NSString)saltedHashedID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSaltedHashedID:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticCloudDataInfo

- (BDSCloudSyncDiagnosticCloudDataInfo)initWithIdentifier:(id)a3 saltedHashedID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BDSCloudSyncDiagnosticCloudDataInfo;
  v9 = [(BDSCloudSyncDiagnosticCloudDataInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_saltedHashedID, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    char v13 = 0;
    if (!self || !v5) {
      goto LABEL_13;
    }
    v14 = objc_msgSend_identifier(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v22 = objc_msgSend_identifier(v5, v15, v16, v17, v18, v19, v20, v21);
    if (v14 == (void *)v22)
    {
    }
    else
    {
      v30 = (void *)v22;
      v31 = objc_msgSend_identifier(self, v23, v24, v25, v26, v27, v28, v29);
      v39 = objc_msgSend_identifier(v5, v32, v33, v34, v35, v36, v37, v38);
      int isEqual = objc_msgSend_isEqual_(v31, v40, (uint64_t)v39, v41, v42, v43, v44, v45);

      if (!isEqual)
      {
        char v13 = 0;
LABEL_13:

        return v13;
      }
    }
    v54 = objc_msgSend_saltedHashedID(self, v47, v48, v49, v50, v51, v52, v53);
    v69 = objc_msgSend_saltedHashedID(v5, v55, v56, v57, v58, v59, v60, v61);
    if (v54 == v69)
    {
      char v13 = 1;
    }
    else
    {
      v70 = objc_msgSend_saltedHashedID(self, v62, v63, v64, v65, v66, v67, v68);
      v78 = objc_msgSend_saltedHashedID(v5, v71, v72, v73, v74, v75, v76, v77);
      char v13 = objc_msgSend_isEqual_(v70, v79, (uint64_t)v78, v80, v81, v82, v83, v84);
    }
    goto LABEL_13;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticCloudDataInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = (BDSCloudSyncDiagnosticCloudDataInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"identifier", v15, v16, v17, v18);
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, @"saltedHashedID", v23, v24, v25, v26);
    saltedHashedID = v12->_saltedHashedID;
    v12->_saltedHashedID = (NSString *)v27;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"identifier", v14, v15, v16, v17);

  objc_msgSend_saltedHashedID(self, v18, v19, v20, v21, v22, v23, v24);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v30, @"saltedHashedID", v26, v27, v28, v29);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSCloudSyncDiagnosticCloudDataInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_identifier(self, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v20 = objc_msgSend_copy(v12, v13, v14, v15, v16, v17, v18, v19);
    objc_msgSend_setIdentifier_(v11, v21, (uint64_t)v20, v22, v23, v24, v25, v26);

    uint64_t v34 = objc_msgSend_saltedHashedID(self, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v42 = objc_msgSend_copy(v34, v35, v36, v37, v38, v39, v40, v41);
    objc_msgSend_setSaltedHashedID_(v11, v43, (uint64_t)v42, v44, v45, v46, v47, v48);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v12 = objc_msgSend_identifier(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_saltedHashedID(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v27 = objc_msgSend_stringWithFormat_(v3, v21, @"<%@: identifier:%@, saltedHashedID:%@>", v22, v23, v24, v25, v26, v4, v12, v20);

  return v27;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v11 = objc_msgSend_identifier(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"identifier", v13, v14, v15, v16);

  uint64_t v24 = objc_msgSend_saltedHashedID(self, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, @"saltedHashedID", v26, v27, v28, v29);

  return (NSDictionary *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)saltedHashedID
{
  return self->_saltedHashedID;
}

- (void)setSaltedHashedID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saltedHashedID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end