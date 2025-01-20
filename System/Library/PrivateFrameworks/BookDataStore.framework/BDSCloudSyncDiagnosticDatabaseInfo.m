@interface BDSCloudSyncDiagnosticDatabaseInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticDatabaseInfo)initWithAttached:(BOOL)a3 establishedSalt:(BOOL)a4 container:(id)a5;
- (BDSCloudSyncDiagnosticDatabaseInfo)initWithCoder:(id)a3;
- (BOOL)attached;
- (BOOL)establishedSalt;
- (NSDictionary)stateForLog;
- (NSString)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttached:(BOOL)a3;
- (void)setContainer:(id)a3;
- (void)setEstablishedSalt:(BOOL)a3;
@end

@implementation BDSCloudSyncDiagnosticDatabaseInfo

- (BDSCloudSyncDiagnosticDatabaseInfo)initWithAttached:(BOOL)a3 establishedSalt:(BOOL)a4 container:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BDSCloudSyncDiagnosticDatabaseInfo;
  v10 = [(BDSCloudSyncDiagnosticDatabaseInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_attached = a3;
    v10->_establishedSalt = a4;
    objc_storeStrong((id *)&v10->_container, a5);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticDatabaseInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v18 = (BDSCloudSyncDiagnosticDatabaseInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v18)
  {
    v18->_attached = objc_msgSend_decodeBoolForKey_(v4, v12, @"attached", v13, v14, v15, v16, v17);
    v18->_establishedSalt = objc_msgSend_decodeBoolForKey_(v4, v19, @"establishedSalt", v20, v21, v22, v23, v24);
    uint64_t v25 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"container", v27, v28, v29, v30);
    container = v18->_container;
    v18->_container = (NSString *)v31;
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_attached(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeBool_forKey_(v4, v13, v12, @"attached", v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_establishedSalt(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeBool_forKey_(v4, v26, v25, @"establishedSalt", v27, v28, v29, v30);
  objc_msgSend_container(self, v31, v32, v33, v34, v35, v36, v37);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v43, @"container", v39, v40, v41, v42);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSCloudSyncDiagnosticDatabaseInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_attached(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setAttached_(v11, v13, v12, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_establishedSalt(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setEstablishedSalt_(v11, v27, v26, v28, v29, v30, v31, v32);
    uint64_t v40 = objc_msgSend_container(self, v33, v34, v35, v36, v37, v38, v39);
    objc_msgSend_setContainer_(v11, v41, (uint64_t)v40, v42, v43, v44, v45, v46);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v12 = objc_msgSend_attached(self, v5, v6, v7, v8, v9, v10, v11);
  unsigned int v20 = objc_msgSend_establishedSalt(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v28 = objc_msgSend_container(self, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v35 = objc_msgSend_stringWithFormat_(v3, v29, @"<%@: attached:%d, establishedSalt:%d, container:%@>", v30, v31, v32, v33, v34, v4, v12, v20, v28);

  return v35;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = NSNumber;
  uint64_t v12 = objc_msgSend_attached(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithBool_(v4, v13, v12, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, @"attached", v21, v22, v23, v24);

  uint64_t v25 = NSNumber;
  uint64_t v33 = objc_msgSend_establishedSalt(self, v26, v27, v28, v29, v30, v31, v32);
  uint64_t v40 = objc_msgSend_numberWithBool_(v25, v34, v33, v35, v36, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v41, (uint64_t)v40, @"establishedSalt", v42, v43, v44, v45);

  uint64_t v53 = objc_msgSend_container(self, v46, v47, v48, v49, v50, v51, v52);
  v59 = (void *)v53;
  if (v53) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v54, v53, @"container", v55, v56, v57, v58);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v54, @"<nil>", @"container", v55, v56, v57, v58);
  }

  return (NSDictionary *)v3;
}

- (BOOL)attached
{
  return self->_attached;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)establishedSalt
{
  return self->_establishedSalt;
}

- (void)setEstablishedSalt:(BOOL)a3
{
  self->_establishedSalt = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end