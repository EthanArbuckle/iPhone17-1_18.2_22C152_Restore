@interface CKDTokenDeletionURLRequest
- (BOOL)requiresTokenRegistration;
- (CKDTokenDeletionURLRequest)initWithOperation:(id)a3 apsToken:(id)a4 apsEnvironmentString:(id)a5 bundleID:(id)a6;
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
@end

@implementation CKDTokenDeletionURLRequest

- (CKDTokenDeletionURLRequest)initWithOperation:(id)a3 apsToken:(id)a4 apsEnvironmentString:(id)a5 bundleID:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKDTokenDeletionURLRequest;
  v14 = [(CKDURLRequest *)&v17 initWithOperation:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_apsToken, a4);
    objc_storeStrong((id *)&v15->_apsEnvironmentString, a5);
    objc_storeStrong((id *)&v15->_bundleID, a6);
  }

  return v15;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKDTokenDeletionURLRequest;
  id v4 = a3;
  [(CKDURLRequest *)&v13 fillOutEquivalencyPropertiesBuilder:v4];
  v7 = objc_msgSend_apsEnvironmentString(self, v5, v6, v13.receiver, v13.super_class);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, (uint64_t)v7, @"apsEnvironmentString");

  id v11 = objc_msgSend_bundleID(self, v9, v10);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v12, (uint64_t)v11, @"bundleID");
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)generateRequestOperations
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v3;
    v9 = objc_msgSend_requestUUID(self, v7, v8);
    id v12 = objc_msgSend_apsToken(self, v10, v11);
    v15 = objc_msgSend_apsEnvironmentString(self, v13, v14);
    v18 = objc_msgSend_bundleID(self, v16, v17);
    *(_DWORD *)buf = 138544131;
    v66 = v9;
    __int16 v67 = 2113;
    v68 = v12;
    __int16 v69 = 2114;
    v70 = v15;
    __int16 v71 = 2114;
    v72 = v18;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Unregistering token %{private}@ in aps environment %{public}@ for bundleID %{public}@\"", buf, 0x2Au);
  }
  uint64_t v19 = objc_msgSend_operationType(self, v4, v5);
  v21 = objc_msgSend_operationRequestWithType_(self, v20, v19);
  v22 = objc_opt_new();
  objc_msgSend_setTokenUnregistrationRequest_(v21, v23, (uint64_t)v22);

  v24 = objc_opt_new();
  v27 = objc_msgSend_tokenUnregistrationRequest(v21, v25, v26);
  objc_msgSend_setTokenRegistrationBody_(v27, v28, (uint64_t)v24);

  v31 = objc_msgSend_apsToken(self, v29, v30);
  v34 = objc_msgSend_tokenUnregistrationRequest(v21, v32, v33);
  v37 = objc_msgSend_tokenRegistrationBody(v34, v35, v36);
  objc_msgSend_setToken_(v37, v38, (uint64_t)v31);

  v41 = objc_msgSend_apsEnvironmentString(self, v39, v40);
  BOOL v43 = objc_msgSend_compare_options_(v41, v42, *MEMORY[0x1E4F4E1C8], 1) == 0;
  v46 = objc_msgSend_tokenUnregistrationRequest(v21, v44, v45);
  v49 = objc_msgSend_tokenRegistrationBody(v46, v47, v48);
  objc_msgSend_setApnsEnv_(v49, v50, v43);

  v53 = objc_msgSend_bundleID(self, v51, v52);
  v56 = objc_msgSend_tokenUnregistrationRequest(v21, v54, v55);
  v59 = objc_msgSend_tokenRegistrationBody(v56, v57, v58);
  objc_msgSend_setBundleIdentifier_(v59, v60, (uint64_t)v53);

  v64 = v21;
  v62 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v61, (uint64_t)&v64, 1);

  return v62;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_apsEnvironmentString, 0);
  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end