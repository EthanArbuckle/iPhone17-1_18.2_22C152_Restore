@interface CKDFetchRegisteredBundleIDsURLRequest
- (BOOL)requiresTokenRegistration;
- (id)applicationBundleIdentifierForContainerAccess;
- (id)bundleIDsFetchedBlock;
- (id)generateRequestOperations;
- (id)requestDidParseProtobufObject:(id)a3;
- (id)requestOperationClasses;
- (id)sourceApplicationSecondaryIdentifier;
- (void)fillOutEquivalencyPropertiesBuilder:(id)a3;
- (void)requestDidParseNodeFailure:(id)a3;
- (void)setBundleIDsFetchedBlock:(id)a3;
@end

@implementation CKDFetchRegisteredBundleIDsURLRequest

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKDFetchRegisteredBundleIDsURLRequest;
  [(CKDURLRequest *)&v3 fillOutEquivalencyPropertiesBuilder:a3];
}

- (id)requestOperationClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  objc_super v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v2, (uint64_t)v5, 1);
  return v3;
}

- (BOOL)requiresTokenRegistration
{
  return 0;
}

- (id)applicationBundleIdentifierForContainerAccess
{
  return @"com.apple.cloudd";
}

- (id)sourceApplicationSecondaryIdentifier
{
  return 0;
}

- (id)generateRequestOperations
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  objc_super v3 = (void *)*MEMORY[0x1E4F1A530];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A530], OS_LOG_TYPE_INFO))
  {
    v6 = v3;
    v9 = objc_msgSend_requestUUID(self, v7, v8);
    v12 = objc_msgSend_container(self, v10, v11);
    v15 = objc_msgSend_containerID(v12, v13, v14);
    *(_DWORD *)buf = 138543618;
    v26 = v9;
    __int16 v27 = 2114;
    v28 = v15;
    _os_log_impl(&dword_1C4CFF000, v6, OS_LOG_TYPE_INFO, "req: %{public}@, \"Getting Bundle IDs for container %{public}@\"", buf, 0x16u);
  }
  uint64_t v16 = objc_msgSend_operationType(self, v4, v5);
  v18 = objc_msgSend_operationRequestWithType_(self, v17, v16);
  v19 = objc_opt_new();
  objc_msgSend_setBundlesForContainerRequest_(v18, v20, (uint64_t)v19);

  v24 = v18;
  v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v21, (uint64_t)&v24, 1);

  return v22;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasBundlesForContainerResponse(v4, v5, v6))
  {
    v9 = objc_msgSend_bundlesForContainerResponse(v4, v7, v8);
    v12 = objc_msgSend_bundleIDs(v9, v10, v11);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend_bundleIDsFetchedBlock(self, v7, v8);

  if (v13)
  {
    objc_msgSend_bundleIDsFetchedBlock(self, v14, v15);
    uint64_t v16 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_result(v4, v17, v18);
    ((void (**)(void, void *, void *))v16)[2](v16, v12, v19);
  }
  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v13 = a3;
  uint64_t v6 = objc_msgSend_bundleIDsFetchedBlock(self, v4, v5);

  if (v6)
  {
    objc_msgSend_bundleIDsFetchedBlock(self, v7, v8);
    v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_result(v13, v10, v11);
    ((void (**)(void, void, void *))v9)[2](v9, 0, v12);
  }
}

- (id)bundleIDsFetchedBlock
{
  return self->_bundleIDsFetchedBlock;
}

- (void)setBundleIDsFetchedBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end