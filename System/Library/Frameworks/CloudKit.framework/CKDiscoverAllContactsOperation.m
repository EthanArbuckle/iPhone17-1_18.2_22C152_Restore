@interface CKDiscoverAllContactsOperation
- (BOOL)CKOperationShouldRun:(id *)a3;
- (id)discoverAllContactsCompletionBlock;
- (void)setDiscoverAllContactsCompletionBlock:(id)a3;
@end

@implementation CKDiscoverAllContactsOperation

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v4 = (void *)ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_FAULT))
  {
    v9 = v4;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543362;
    v13 = v11;
    _os_log_fault_impl(&dword_18AF10000, v9, OS_LOG_TYPE_FAULT, "%{public}@ is deprecated, and will be removed in a future release.", buf, 0xCu);

    if (!a3) {
      return 0;
    }
    goto LABEL_5;
  }
  if (a3)
  {
LABEL_5:
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKInternalErrorDomain", 1001, @"%@ is deprecated, and will be removed in a future release.", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)discoverAllContactsCompletionBlock
{
  return self->_discoverAllContactsCompletionBlock;
}

- (void)setDiscoverAllContactsCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end