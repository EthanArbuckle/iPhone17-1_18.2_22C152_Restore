@interface CKDiscoverUserInfosOperation
- (BOOL)CKOperationShouldRun:(id *)a3;
- (CKDiscoverUserInfosOperation)initWithEmailAddresses:(id)a3 userRecordIDs:(id)a4;
- (NSArray)emailAddresses;
- (NSArray)userRecordIDs;
- (id)discoverUserInfosCompletionBlock;
- (void)setDiscoverUserInfosCompletionBlock:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setUserRecordIDs:(id)a3;
@end

@implementation CKDiscoverUserInfosOperation

- (CKDiscoverUserInfosOperation)initWithEmailAddresses:(id)a3 userRecordIDs:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKDiscoverUserInfosOperation;
  return [(CKOperation *)&v5 init];
}

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
    objc_super v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKInternalErrorDomain", 1001, @"%@ is deprecated, and will be removed in a future release.", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSArray)userRecordIDs
{
  return self->_userRecordIDs;
}

- (void)setUserRecordIDs:(id)a3
{
}

- (id)discoverUserInfosCompletionBlock
{
  return self->_discoverUserInfosCompletionBlock;
}

- (void)setDiscoverUserInfosCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoverUserInfosCompletionBlock, 0);
  objc_storeStrong((id *)&self->_userRecordIDs, 0);

  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end