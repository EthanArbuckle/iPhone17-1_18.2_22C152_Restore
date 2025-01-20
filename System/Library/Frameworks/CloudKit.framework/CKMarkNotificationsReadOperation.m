@interface CKMarkNotificationsReadOperation
- (BOOL)CKOperationShouldRun:(id *)a3;
- (CKMarkNotificationsReadOperation)initWithNotificationIDsToMarkRead:(NSArray *)notificationIDs;
- (NSArray)notificationIDs;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)markNotificationsReadCompletionBlock;
- (void)setMarkNotificationsReadCompletionBlock:(void *)markNotificationsReadCompletionBlock;
- (void)setNotificationIDs:(NSArray *)notificationIDs;
@end

@implementation CKMarkNotificationsReadOperation

- (CKMarkNotificationsReadOperation)initWithNotificationIDsToMarkRead:(NSArray *)notificationIDs
{
  v4.receiver = self;
  v4.super_class = (Class)CKMarkNotificationsReadOperation;
  return [(CKOperation *)&v4 init];
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  objc_super v4 = (void *)ck_log_facility_ck;
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
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v7, @"CKInternalErrorDomain", 1017, @"%@ is no longer supported", v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  v8 = objc_msgSend_markNotificationsReadCompletionBlock(self, v5, v6, v7);

  if (v8)
  {
    objc_msgSend_markNotificationsReadCompletionBlock(self, v9, v10, v11);
    v12 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_CKClientSuitableError(v4, v13, v14, v15);
    ((void (**)(void, void, void *))v12)[2](v12, 0, v16);

    objc_msgSend_setMarkNotificationsReadCompletionBlock_(self, v17, 0, v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CKMarkNotificationsReadOperation;
  [(CKOperation *)&v19 _finishOnCallbackQueueWithError:v4];
}

- (NSArray)notificationIDs
{
  return self->_notificationIDs;
}

- (void)setNotificationIDs:(NSArray *)notificationIDs
{
}

- (void)markNotificationsReadCompletionBlock
{
  return self->_markNotificationsReadCompletionBlock;
}

- (void)setMarkNotificationsReadCompletionBlock:(void *)markNotificationsReadCompletionBlock
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_markNotificationsReadCompletionBlock, 0);

  objc_storeStrong((id *)&self->_notificationIDs, 0);
}

@end