@interface BDSCloudSyncDiagnosticEntityInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticEntityInfo)initWithCoder:(id)a3;
- (BDSCloudSyncDiagnosticEntityInfo)initWithName:(id)a3 enabledSync:(BOOL)a4 dirtyCloudDataInfos:(id)a5;
- (BOOL)enabledSync;
- (BOOL)isEqual:(id)a3;
- (NSArray)dirtyCloudDataInfos;
- (NSDictionary)stateForLog;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDirtyCloudDataInfos:(id)a3;
- (void)setEnabledSync:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticEntityInfo

- (BDSCloudSyncDiagnosticEntityInfo)initWithName:(id)a3 enabledSync:(BOOL)a4 dirtyCloudDataInfos:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BDSCloudSyncDiagnosticEntityInfo;
  v11 = [(BDSCloudSyncDiagnosticEntityInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_enabledSync = a4;
    objc_storeStrong((id *)&v12->_dirtyCloudDataInfos, a5);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if (self != a3)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = BUDynamicCast();

    char isEqualToArray = 0;
    if (!self || !v5) {
      goto LABEL_15;
    }
    objc_super v14 = objc_msgSend_name(self, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v22 = objc_msgSend_name(v5, v15, v16, v17, v18, v19, v20, v21);
    if (v14 == (void *)v22)
    {
    }
    else
    {
      v30 = (void *)v22;
      v31 = objc_msgSend_name(self, v23, v24, v25, v26, v27, v28, v29);
      v39 = objc_msgSend_name(v5, v32, v33, v34, v35, v36, v37, v38);
      int isEqual = objc_msgSend_isEqual_(v31, v40, (uint64_t)v39, v41, v42, v43, v44, v45);

      if (!isEqual)
      {
LABEL_10:
        char isEqualToArray = 0;
LABEL_15:

        return isEqualToArray;
      }
    }
    int v54 = objc_msgSend_enabledSync(self, v47, v48, v49, v50, v51, v52, v53);
    if (v54 == objc_msgSend_enabledSync(v5, v55, v56, v57, v58, v59, v60, v61))
    {
      v69 = objc_msgSend_dirtyCloudDataInfos(self, v62, v63, v64, v65, v66, v67, v68);
      v84 = objc_msgSend_dirtyCloudDataInfos(v5, v70, v71, v72, v73, v74, v75, v76);
      if (v69 == v84)
      {
        char isEqualToArray = 1;
      }
      else
      {
        v85 = objc_msgSend_dirtyCloudDataInfos(self, v77, v78, v79, v80, v81, v82, v83);
        v93 = objc_msgSend_dirtyCloudDataInfos(v5, v86, v87, v88, v89, v90, v91, v92);
        char isEqualToArray = objc_msgSend_isEqualToArray_(v85, v94, (uint64_t)v93, v95, v96, v97, v98, v99);
      }
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticEntityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = (BDSCloudSyncDiagnosticEntityInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v13, @"name", v15, v16, v17, v18);
    name = v12->_name;
    v12->_name = (NSString *)v19;

    v12->_enabledSync = objc_msgSend_decodeBoolForKey_(v4, v21, @"enabledSync", v22, v23, v24, v25, v26);
    uint64_t v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v36 = objc_msgSend_setWithObjects_(v27, v30, v28, v31, v32, v33, v34, v35, v29, 0);
    uint64_t v42 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v37, (uint64_t)v36, @"dirtyCloudDataInfos", v38, v39, v40, v41);
    dirtyCloudDataInfos = v12->_dirtyCloudDataInfos;
    v12->_dirtyCloudDataInfos = (NSArray *)v42;
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_name(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)v12, @"name", v14, v15, v16, v17);

  uint64_t v25 = objc_msgSend_enabledSync(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeBool_forKey_(v4, v26, v25, @"enabledSync", v27, v28, v29, v30);
  objc_msgSend_dirtyCloudDataInfos(self, v31, v32, v33, v34, v35, v36, v37);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v43, @"dirtyCloudDataInfos", v39, v40, v41, v42);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSCloudSyncDiagnosticEntityInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_name(self, v4, v5, v6, v7, v8, v9, v10);
    uint64_t v20 = objc_msgSend_copy(v12, v13, v14, v15, v16, v17, v18, v19);
    objc_msgSend_setName_(v11, v21, (uint64_t)v20, v22, v23, v24, v25, v26);

    uint64_t v34 = objc_msgSend_enabledSync(self, v27, v28, v29, v30, v31, v32, v33);
    objc_msgSend_setEnabledSync_(v11, v35, v34, v36, v37, v38, v39, v40);
    uint64_t v48 = objc_msgSend_dirtyCloudDataInfos(self, v41, v42, v43, v44, v45, v46, v47);
    uint64_t v56 = objc_msgSend_copy(v48, v49, v50, v51, v52, v53, v54, v55);
    objc_msgSend_setDirtyCloudDataInfos_(v11, v57, (uint64_t)v56, v58, v59, v60, v61, v62);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v12 = objc_msgSend_name(self, v5, v6, v7, v8, v9, v10, v11);
  unsigned int v20 = objc_msgSend_enabledSync(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v28 = objc_msgSend_dirtyCloudDataInfos(self, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v36 = objc_msgSend_count(v28, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v44 = objc_msgSend_dirtyCloudDataInfos(self, v37, v38, v39, v40, v41, v42, v43);
  uint64_t v51 = objc_msgSend_stringWithFormat_(v3, v45, @"<%@: name:%@, enabledSync:%d, dirtyInfos(count=%lu):%@>", v46, v47, v48, v49, v50, v4, v12, v20, v36, v44);

  return v51;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v11 = objc_msgSend_name(self, v4, v5, v6, v7, v8, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v12, (uint64_t)v11, @"name", v13, v14, v15, v16);

  uint64_t v17 = NSNumber;
  uint64_t v25 = objc_msgSend_enabledSync(self, v18, v19, v20, v21, v22, v23, v24);
  uint64_t v32 = objc_msgSend_numberWithBool_(v17, v26, v25, v27, v28, v29, v30, v31);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v33, (uint64_t)v32, @"enabledSync", v34, v35, v36, v37);

  uint64_t v45 = objc_msgSend_dirtyCloudDataInfos(self, v38, v39, v40, v41, v42, v43, v44);

  if (v45)
  {
    uint64_t v53 = objc_msgSend_dirtyCloudDataInfos(self, v46, v47, v48, v49, v50, v51, v52);
    uint64_t v60 = objc_msgSend_valueForKey_(v53, v54, @"stateForLog", v55, v56, v57, v58, v59);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v61, (uint64_t)v60, @"dirtyCloudDataInfos", v62, v63, v64, v65);
  }
  return (NSDictionary *)v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)enabledSync
{
  return self->_enabledSync;
}

- (void)setEnabledSync:(BOOL)a3
{
  self->_enabledSync = a3;
}

- (NSArray)dirtyCloudDataInfos
{
  return self->_dirtyCloudDataInfos;
}

- (void)setDirtyCloudDataInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyCloudDataInfos, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end