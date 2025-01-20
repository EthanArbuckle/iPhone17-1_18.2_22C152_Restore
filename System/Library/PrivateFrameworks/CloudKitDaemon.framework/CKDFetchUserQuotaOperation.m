@interface CKDFetchUserQuotaOperation
- (CKDFetchUserQuotaOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (id)activityCreate;
- (int)operationType;
- (unint64_t)quotaAvailable;
- (void)main;
- (void)setQuotaAvailable:(unint64_t)a3;
@end

@implementation CKDFetchUserQuotaOperation

- (CKDFetchUserQuotaOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKDFetchUserQuotaOperation;
  return [(CKDDatabaseOperation *)&v5 initWithOperationInfo:a3 container:a4];
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-user-quota", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 243;
}

- (void)main
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
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
    __int16 v35 = 2048;
    v36 = self;
    __int16 v37 = 2114;
    v38 = v21;
    __int16 v39 = 2112;
    v40 = v26;
    _os_log_debug_impl(&dword_1C4CFF000, v14, OS_LOG_TYPE_DEBUG, "Fetch user quota operation <%{public}@: %p; %{public}@, %@> is starting",
      location,
      0x2Au);
  }
  v4 = [CKDFetchUserQuotaURLRequest alloc];
  v6 = objc_msgSend_initWithOperation_(v4, v5, (uint64_t)self);
  objc_initWeak((id *)location, self);
  objc_initWeak(&from, v6);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C4E10CE0;
  v30[3] = &unk_1E64F3A08;
  objc_copyWeak(&v31, (id *)location);
  objc_copyWeak(&v32, &from);
  objc_msgSend_setQuotaFetchedBlock_(v6, v7, (uint64_t)v30);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4E10ED8;
  v27[3] = &unk_1E64F0170;
  objc_copyWeak(&v28, (id *)location);
  objc_copyWeak(&v29, &from);
  objc_msgSend_setCompletionBlock_(v6, v8, (uint64_t)v27);
  objc_msgSend_setRequest_(self, v9, (uint64_t)v6);
  v12 = objc_msgSend_container(self, v10, v11);
  objc_msgSend_performRequest_(v12, v13, (uint64_t)v6);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&from);
  objc_destroyWeak((id *)location);
}

- (unint64_t)quotaAvailable
{
  return self->_quotaAvailable;
}

- (void)setQuotaAvailable:(unint64_t)a3
{
  self->_quotaAvailable = a3;
}

@end