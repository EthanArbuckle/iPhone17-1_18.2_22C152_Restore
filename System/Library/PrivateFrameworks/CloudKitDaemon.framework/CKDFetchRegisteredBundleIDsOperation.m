@interface CKDFetchRegisteredBundleIDsOperation
- (CKDFetchRegisteredBundleIDsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)bundleIDs;
- (id)_unitTestBundleIDsByContainerID:(id)a3;
- (id)activityCreate;
- (int)operationType;
- (void)main;
- (void)setBundleIDs:(id)a3;
@end

@implementation CKDFetchRegisteredBundleIDsOperation

- (id)_unitTestBundleIDsByContainerID:(id)a3
{
  uint64_t v3 = qword_1EBBCFB20;
  id v5 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EBBCFB20, &unk_1F20426F0);
  }
  v6 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1EBBCFB28, v4, (uint64_t)v5);

  return v6;
}

- (CKDFetchRegisteredBundleIDsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKDFetchRegisteredBundleIDsOperation;
  return [(CKDOperation *)&v5 initWithOperationInfo:a3 container:a4];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-registered-bundle-ids", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 244;
}

- (void)main
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v14 = v3;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v18 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v17, 1, 0, 0);
    v21 = objc_msgSend_CKPropertiesStyleString(v18, v19, v20);
    v23 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v22, 0, 1, 0);
    v26 = objc_msgSend_CKPropertiesStyleString(v23, v24, v25);
    *(_DWORD *)location = 138544130;
    *(void *)&location[4] = v16;
    __int16 v38 = 2048;
    v39 = self;
    __int16 v40 = 2114;
    v41 = v21;
    __int16 v42 = 2112;
    v43 = v26;
    _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Fetch registered bundleIDs operation <%{public}@: %p; %{public}@, %@> is starting",
      location,
      0x2Au);
  }
  v4 = [CKDFetchRegisteredBundleIDsURLRequest alloc];
  v6 = objc_msgSend_initWithOperation_(v4, v5, (uint64_t)self);
  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v6);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1C4D47168;
  v33[3] = &unk_1E64F0288;
  objc_copyWeak(&v34, (id *)location);
  objc_copyWeak(&v35, &from);
  v33[4] = self;
  objc_msgSend_setBundleIDsFetchedBlock_(v6, v7, (uint64_t)v33);
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = sub_1C4D473E8;
  v30 = &unk_1E64F0170;
  objc_copyWeak(&v31, (id *)location);
  objc_copyWeak(&v32, &from);
  objc_msgSend_setCompletionBlock_(v6, v8, (uint64_t)&v27);
  objc_msgSend_setRequest_(self, v9, (uint64_t)v6, v27, v28, v29, v30);
  v12 = objc_msgSend_container(self, v10, v11);
  objc_msgSend_performRequest_(v12, v13, (uint64_t)v6);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end