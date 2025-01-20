@interface CKDTokenRegistrationURLRequest
- (BOOL)requiresTokenRegistration;
- (BOOL)skipBundleIDCheck;
- (CKDTokenRegistrationURLRequest)initWithOperation:(id)a3 apsToken:(id)a4 apsEnvironmentString:(id)a5 bundleID:(id)a6 skipBundleIDCheck:(BOOL)a7;
- (NSData)apsToken;
- (NSString)apsEnvironmentString;
- (NSString)bundleID;
- (id)applicationBundleIdentifierForContainerAccess;
- (id)applicationBundleIdentifierForNetworkAttribution;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)sourceApplicationSecondaryIdentifier;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)setApsEnvironmentString:(id)a3;
- (void)setApsToken:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setSkipBundleIDCheck:(BOOL)a3;
@end

@implementation CKDTokenRegistrationURLRequest

- (CKDTokenRegistrationURLRequest)initWithOperation:(id)a3 apsToken:(id)a4 apsEnvironmentString:(id)a5 bundleID:(id)a6 skipBundleIDCheck:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKDTokenRegistrationURLRequest;
  v16 = [(CKDURLRequest *)&v19 initWithOperation:a3];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_apsToken, a4);
    objc_storeStrong((id *)&v17->_apsEnvironmentString, a5);
    objc_storeStrong((id *)&v17->_bundleID, a6);
    v17->_skipBundleIDCheck = a7;
  }

  return v17;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDTokenRegistrationURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v13 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_apsEnvironmentString(self, v5, v6, v13.receiver, v13.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"apsEnvironmentString");

  v11 = objc_msgSend_bundleID(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"bundleID");
}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (id)generateRequestOperations
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v3;
    v9 = objc_msgSend_requestUUID(self, v7, v8);
    v12 = objc_msgSend_container(self, v10, v11);
    id v15 = objc_msgSend_applicationBundleID(v12, v13, v14);
    v18 = objc_msgSend_apsToken(self, v16, v17);
    v21 = objc_msgSend_debugDescription(v18, v19, v20);
    v24 = objc_msgSend_apsEnvironmentString(self, v22, v23);
    v27 = objc_msgSend_bundleID(self, v25, v26);
    *(_DWORD *)buf = 138544387;
    v85 = v9;
    __int16 v86 = 2114;
    v87 = v15;
    __int16 v88 = 2113;
    v89 = v21;
    __int16 v90 = 2114;
    v91 = v24;
    __int16 v92 = 2114;
    v93 = v27;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Sending token registration for %{public}@ with token %{private}@ in aps environment %{public}@ with bundleID %{public}@\"", buf, 0x34u);
  }
  uint64_t v28 = objc_msgSend_operationType(self, v4, v5);
  v30 = objc_msgSend_operationRequestWithType_(self, v29, v28);
  v31 = objc_opt_new();
  objc_msgSend_setTokenRegistrationRequest_(v30, v32, (uint64_t)v31);

  v33 = objc_opt_new();
  v36 = objc_msgSend_tokenRegistrationRequest(v30, v34, v35);
  objc_msgSend_setTokenRegistrationBody_(v36, v37, (uint64_t)v33);

  v40 = objc_msgSend_apsToken(self, v38, v39);
  v43 = objc_msgSend_tokenRegistrationRequest(v30, v41, v42);
  v46 = objc_msgSend_tokenRegistrationBody(v43, v44, v45);
  objc_msgSend_setToken_(v46, v47, (uint64_t)v40);

  v50 = objc_msgSend_apsEnvironmentString(self, v48, v49);
  BOOL v52 = objc_msgSend_compare_options_(v50, v51, *MEMORY[0x1E4F4E1C8], 1) == 0;
  v55 = objc_msgSend_tokenRegistrationRequest(v30, v53, v54);
  v58 = objc_msgSend_tokenRegistrationBody(v55, v56, v57);
  objc_msgSend_setApnsEnv_(v58, v59, v52);

  v62 = objc_msgSend_bundleID(self, v60, v61);
  v65 = objc_msgSend_tokenRegistrationRequest(v30, v63, v64);
  v68 = objc_msgSend_tokenRegistrationBody(v65, v66, v67);
  objc_msgSend_setBundleIdentifier_(v68, v69, (uint64_t)v62);

  uint64_t v72 = objc_msgSend_skipBundleIDCheck(self, v70, v71);
  v75 = objc_msgSend_tokenRegistrationRequest(v30, v73, v74);
  v78 = objc_msgSend_tokenRegistrationBody(v75, v76, v77);
  objc_msgSend_setSkipBundleIDCheck_(v78, v79, v72);

  v83 = v30;
  v81 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v80, (uint64_t)&v83, 1);

  return v81;
}

- (id)applicationBundleIdentifierForContainerAccess
{
  return @"com.apple.cloudd";
}

- (id)applicationBundleIdentifierForNetworkAttribution
{
  return @"com.apple.cloudd";
}

- (id)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  return 0;
}

- (NSData)apsToken
{
  return self->_apsToken;
}

- (void)setApsToken:(id)a3
{
}

- (NSString)apsEnvironmentString
{
  return self->_apsEnvironmentString;
}

- (void)setApsEnvironmentString:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)skipBundleIDCheck
{
  return self->_skipBundleIDCheck;
}

- (void)setSkipBundleIDCheck:(BOOL)a3
{
  self->_skipBundleIDCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end