@interface BDSCloudSyncDiagnosticInfo
+ (BOOL)supportsSecureCoding;
- (BDSCloudSyncDiagnosticDatabaseInfo)privateDatabaseInfo;
- (BDSCloudSyncDiagnosticInfo)initWithCoder:(id)a3;
- (BDSCloudSyncDiagnosticInfo)initWithEnabledSync:(BOOL)a3 accountStatus:(int64_t)a4 container:(id)a5 gettingAccountInfo:(BOOL)a6 privateDatabaseInfo:(id)a7 privateDatabaseSyncEngineInfo:(id)a8 entityInfos:(id)a9;
- (BDSCloudSyncDiagnosticSyncEngineInfo)privateDatabaseSyncEngineInfo;
- (BOOL)enabledSync;
- (BOOL)gettingAccountInfo;
- (NSArray)entityInfos;
- (NSDictionary)stateForLog;
- (NSString)container;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)accountStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setContainer:(id)a3;
- (void)setEnabledSync:(BOOL)a3;
- (void)setEntityInfos:(id)a3;
- (void)setGettingAccountInfo:(BOOL)a3;
- (void)setPrivateDatabaseInfo:(id)a3;
- (void)setPrivateDatabaseSyncEngineInfo:(id)a3;
@end

@implementation BDSCloudSyncDiagnosticInfo

- (BDSCloudSyncDiagnosticInfo)initWithEnabledSync:(BOOL)a3 accountStatus:(int64_t)a4 container:(id)a5 gettingAccountInfo:(BOOL)a6 privateDatabaseInfo:(id)a7 privateDatabaseSyncEngineInfo:(id)a8 entityInfos:(id)a9
{
  id v22 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)BDSCloudSyncDiagnosticInfo;
  v18 = [(BDSCloudSyncDiagnosticInfo *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_enabledSync = a3;
    v18->_accountStatus = a4;
    objc_storeStrong((id *)&v18->_container, a5);
    v19->_gettingAccountInfo = a6;
    objc_storeStrong((id *)&v19->_privateDatabaseInfo, a7);
    objc_storeStrong((id *)&v19->_privateDatabaseSyncEngineInfo, a8);
    objc_storeStrong((id *)&v19->_entityInfos, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSCloudSyncDiagnosticInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v18 = (BDSCloudSyncDiagnosticInfo *)objc_msgSend_init(self, v5, v6, v7, v8, v9, v10, v11);
  if (v18)
  {
    v18->_enabledSync = objc_msgSend_decodeBoolForKey_(v4, v12, @"enabledSync", v13, v14, v15, v16, v17);
    v18->_accountStatus = objc_msgSend_decodeIntegerForKey_(v4, v19, @"accountStatus", v20, v21, v22, v23, v24);
    uint64_t v25 = objc_opt_class();
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"container", v27, v28, v29, v30);
    container = v18->_container;
    v18->_container = (NSString *)v31;

    v18->_gettingAccountInfo = objc_msgSend_decodeBoolForKey_(v4, v33, @"gettingAccountInfo", v34, v35, v36, v37, v38);
    uint64_t v39 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"privateDatabaseInfo", v41, v42, v43, v44);
    privateDatabaseInfo = v18->_privateDatabaseInfo;
    v18->_privateDatabaseInfo = (BDSCloudSyncDiagnosticDatabaseInfo *)v45;

    uint64_t v47 = objc_opt_class();
    uint64_t v53 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, @"privateDatabaseSyncEngineInfo", v49, v50, v51, v52);
    privateDatabaseSyncEngineInfo = v18->_privateDatabaseSyncEngineInfo;
    v18->_privateDatabaseSyncEngineInfo = (BDSCloudSyncDiagnosticSyncEngineInfo *)v53;

    v55 = (void *)MEMORY[0x263EFFA08];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    v64 = objc_msgSend_setWithObjects_(v55, v58, v56, v59, v60, v61, v62, v63, v57, 0);
    uint64_t v70 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v65, (uint64_t)v64, @"entityInfos", v66, v67, v68, v69);
    entityInfos = v18->_entityInfos;
    v18->_entityInfos = (NSArray *)v70;
  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v12 = objc_msgSend_enabledSync(self, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend_encodeBool_forKey_(v4, v13, v12, @"enabledSync", v14, v15, v16, v17);
  uint64_t v25 = objc_msgSend_accountStatus(self, v18, v19, v20, v21, v22, v23, v24);
  objc_msgSend_encodeInteger_forKey_(v4, v26, v25, @"accountStatus", v27, v28, v29, v30);
  uint64_t v38 = objc_msgSend_container(self, v31, v32, v33, v34, v35, v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v39, (uint64_t)v38, @"container", v40, v41, v42, v43);

  uint64_t v51 = objc_msgSend_gettingAccountInfo(self, v44, v45, v46, v47, v48, v49, v50);
  objc_msgSend_encodeBool_forKey_(v4, v52, v51, @"gettingAccountInfo", v53, v54, v55, v56);
  v64 = objc_msgSend_privateDatabaseInfo(self, v57, v58, v59, v60, v61, v62, v63);
  objc_msgSend_encodeObject_forKey_(v4, v65, (uint64_t)v64, @"privateDatabaseInfo", v66, v67, v68, v69);

  v77 = objc_msgSend_privateDatabaseSyncEngineInfo(self, v70, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"privateDatabaseSyncEngineInfo", v79, v80, v81, v82);

  objc_msgSend_entityInfos(self, v83, v84, v85, v86, v87, v88, v89);
  id v95 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v90, (uint64_t)v95, @"entityInfos", v91, v92, v93, v94);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v11 = objc_alloc_init(BDSCloudSyncDiagnosticInfo);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_enabledSync(self, v4, v5, v6, v7, v8, v9, v10);
    objc_msgSend_setEnabledSync_(v11, v13, v12, v14, v15, v16, v17, v18);
    uint64_t v26 = objc_msgSend_accountStatus(self, v19, v20, v21, v22, v23, v24, v25);
    objc_msgSend_setAccountStatus_(v11, v27, v26, v28, v29, v30, v31, v32);
    uint64_t v40 = objc_msgSend_container(self, v33, v34, v35, v36, v37, v38, v39);
    objc_msgSend_setContainer_(v11, v41, (uint64_t)v40, v42, v43, v44, v45, v46);

    uint64_t v54 = objc_msgSend_gettingAccountInfo(self, v47, v48, v49, v50, v51, v52, v53);
    objc_msgSend_setGettingAccountInfo_(v11, v55, v54, v56, v57, v58, v59, v60);
    uint64_t v68 = objc_msgSend_privateDatabaseInfo(self, v61, v62, v63, v64, v65, v66, v67);
    uint64_t v76 = objc_msgSend_copy(v68, v69, v70, v71, v72, v73, v74, v75);
    objc_msgSend_setPrivateDatabaseInfo_(v11, v77, (uint64_t)v76, v78, v79, v80, v81, v82);

    v90 = objc_msgSend_privateDatabaseSyncEngineInfo(self, v83, v84, v85, v86, v87, v88, v89);
    v98 = objc_msgSend_copy(v90, v91, v92, v93, v94, v95, v96, v97);
    objc_msgSend_setPrivateDatabaseSyncEngineInfo_(v11, v99, (uint64_t)v98, v100, v101, v102, v103, v104);

    v112 = objc_msgSend_entityInfos(self, v105, v106, v107, v108, v109, v110, v111);
    v120 = objc_msgSend_copy(v112, v113, v114, v115, v116, v117, v118, v119);
    objc_msgSend_setEntityInfos_(v11, v121, (uint64_t)v120, v122, v123, v124, v125, v126);
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unsigned int v12 = objc_msgSend_enabledSync(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_accountStatus(self, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v28 = objc_msgSend_container(self, v21, v22, v23, v24, v25, v26, v27);
  unsigned int v36 = objc_msgSend_gettingAccountInfo(self, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v44 = objc_msgSend_privateDatabaseInfo(self, v37, v38, v39, v40, v41, v42, v43);
  uint64_t v52 = objc_msgSend_privateDatabaseSyncEngineInfo(self, v45, v46, v47, v48, v49, v50, v51);
  uint64_t v60 = objc_msgSend_entityInfos(self, v53, v54, v55, v56, v57, v58, v59);
  uint64_t v67 = objc_msgSend_stringWithFormat_(v3, v61, @"<%@: enabledSync:%d, accountStatus:%ld, container:%@, gettingAccountInfo:%d, privateDatabase:%@, privateDatabaseSyncEngine:%@, entities:%@>", v62, v63, v64, v65, v66, v4, v12, v20, v28, v36, v44, v52, v60);

  return v67;
}

- (NSDictionary)stateForLog
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v4 = NSNumber;
  uint64_t v12 = objc_msgSend_enabledSync(self, v5, v6, v7, v8, v9, v10, v11);
  uint64_t v19 = objc_msgSend_numberWithBool_(v4, v13, v12, v14, v15, v16, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, @"enabledSync", v21, v22, v23, v24);

  uint64_t v25 = NSNumber;
  uint64_t v33 = objc_msgSend_accountStatus(self, v26, v27, v28, v29, v30, v31, v32);
  uint64_t v40 = objc_msgSend_numberWithInteger_(v25, v34, v33, v35, v36, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v41, (uint64_t)v40, @"accountStatus", v42, v43, v44, v45);

  uint64_t v53 = objc_msgSend_container(self, v46, v47, v48, v49, v50, v51, v52);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v54, (uint64_t)v53, @"container", v55, v56, v57, v58);

  uint64_t v59 = NSNumber;
  uint64_t v67 = objc_msgSend_gettingAccountInfo(self, v60, v61, v62, v63, v64, v65, v66);
  uint64_t v74 = objc_msgSend_numberWithBool_(v59, v68, v67, v69, v70, v71, v72, v73);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v75, (uint64_t)v74, @"gettingAccountInfo", v76, v77, v78, v79);

  uint64_t v87 = objc_msgSend_privateDatabaseInfo(self, v80, v81, v82, v83, v84, v85, v86);
  uint64_t v95 = objc_msgSend_stateForLog(v87, v88, v89, v90, v91, v92, v93, v94);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v96, (uint64_t)v95, @"privateDatabaseInfo", v97, v98, v99, v100);

  uint64_t v108 = objc_msgSend_privateDatabaseSyncEngineInfo(self, v101, v102, v103, v104, v105, v106, v107);
  uint64_t v116 = objc_msgSend_stateForLog(v108, v109, v110, v111, v112, v113, v114, v115);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v117, (uint64_t)v116, @"privateDatabaseSyncEngineInfo", v118, v119, v120, v121);

  v129 = objc_msgSend_entityInfos(self, v122, v123, v124, v125, v126, v127, v128);

  if (v129)
  {
    v137 = objc_msgSend_entityInfos(self, v130, v131, v132, v133, v134, v135, v136);
    v144 = objc_msgSend_valueForKey_(v137, v138, @"stateForLog", v139, v140, v141, v142, v143);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v145, (uint64_t)v144, @"entityInfos", v146, v147, v148, v149);
  }
  return (NSDictionary *)v3;
}

- (BOOL)enabledSync
{
  return self->_enabledSync;
}

- (void)setEnabledSync:(BOOL)a3
{
  self->_enabledSync = a3;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (NSString)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)gettingAccountInfo
{
  return self->_gettingAccountInfo;
}

- (void)setGettingAccountInfo:(BOOL)a3
{
  self->_gettingAccountInfo = a3;
}

- (BDSCloudSyncDiagnosticDatabaseInfo)privateDatabaseInfo
{
  return self->_privateDatabaseInfo;
}

- (void)setPrivateDatabaseInfo:(id)a3
{
}

- (BDSCloudSyncDiagnosticSyncEngineInfo)privateDatabaseSyncEngineInfo
{
  return self->_privateDatabaseSyncEngineInfo;
}

- (void)setPrivateDatabaseSyncEngineInfo:(id)a3
{
}

- (NSArray)entityInfos
{
  return self->_entityInfos;
}

- (void)setEntityInfos:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityInfos, 0);
  objc_storeStrong((id *)&self->_privateDatabaseSyncEngineInfo, 0);
  objc_storeStrong((id *)&self->_privateDatabaseInfo, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end