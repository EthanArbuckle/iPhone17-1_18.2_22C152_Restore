@interface CKDFetchSubscriptionsOperation
- (BOOL)isFetchAllSubscriptionsOperation;
- (CKDFetchSubscriptionsOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSArray)subscriptionIDs;
- (id)activityCreate;
- (id)subscriptionFetchedProgressBlock;
- (int)operationType;
- (void)_finishOnCallbackQueueWithError:(id)a3;
- (void)_handleSubscriptionFetched:(id)a3 withID:(id)a4 responseCode:(id)a5;
- (void)main;
- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3;
- (void)setSubscriptionFetchedProgressBlock:(id)a3;
- (void)setSubscriptionIDs:(id)a3;
@end

@implementation CKDFetchSubscriptionsOperation

- (CKDFetchSubscriptionsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchSubscriptionsOperation;
  v9 = [(CKDDatabaseOperation *)&v15 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_subscriptionIDs(v6, v7, v8);
    subscriptionIDs = v9->_subscriptionIDs;
    v9->_subscriptionIDs = (NSArray *)v10;

    v9->_isFetchAllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(v6, v12, v13);
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-subscriptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_handleSubscriptionFetched:(id)a3 withID:(id)a4 responseCode:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  id v9 = a4;
  id v10 = a5;
  int v13 = objc_msgSend_code(v10, v11, v12);
  v16 = (uint64_t *)MEMORY[0x1E4F19DD8];
  if (v13 == 1)
  {
    uint64_t v17 = 0;
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v19 = *MEMORY[0x1E4F19DD8];
    uint64_t v20 = sub_1C4E94D98(v10);
    v23 = objc_msgSend_request(self, v21, v22);
    v24 = sub_1C4E940D0(v23, v10);
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_format_(v18, v25, v19, v20, v24, @"Error fetching subscription %@", v9);
  }
  if (!(v8 | v17))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v26 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C4CFF000, v26, OS_LOG_TYPE_ERROR, "Unexpectedly received no subscription but also a successful error code", buf, 2u);
    }
    v27 = (void *)MEMORY[0x1E4F1A280];
    uint64_t v28 = *v16;
    uint64_t v29 = sub_1C4E94D98(v10);
    v32 = objc_msgSend_request(self, v30, v31);
    v33 = sub_1C4E940D0(v32, v10);
    uint64_t v17 = objc_msgSend_errorWithDomain_code_userInfo_format_(v27, v34, v28, v29, v33, @"Error fetching subscription %@", v9);
  }
  v35 = objc_msgSend_callbackQueue(self, v14, v15);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4EA74F0;
  block[3] = &unk_1E64F0DF0;
  block[4] = self;
  id v40 = (id)v8;
  id v41 = v9;
  id v42 = (id)v17;
  id v36 = (id)v17;
  id v37 = v9;
  id v38 = (id)v8;
  dispatch_async(v35, block);
}

- (int)operationType
{
  return 301;
}

- (void)main
{
  v4 = objc_msgSend_subscriptionIDs(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {

LABEL_4:
    objc_initWeak(&location, self);
    v11 = [CKDFetchSubscriptionsURLRequest alloc];
    v14 = objc_msgSend_subscriptionIDs(self, v12, v13);
    v16 = objc_msgSend_initWithOperation_subscriptionIDs_(v11, v15, (uint64_t)self, v14);

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = sub_1C4EA7848;
    v34[3] = &unk_1E64F4B10;
    objc_copyWeak(&v35, &location);
    objc_msgSend_setSubscriptionFetchedBlock_(v16, v17, (uint64_t)v34);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1C4EA78D4;
    v32[3] = &unk_1E64F4B38;
    objc_copyWeak(&v33, &location);
    objc_msgSend_setErrorFetchingAllSubscriptionsBlock_(v16, v18, (uint64_t)v32);
    objc_initWeak(&from, v16);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = sub_1C4EA7B04;
    uint64_t v28 = &unk_1E64F0170;
    objc_copyWeak(&v29, &location);
    objc_copyWeak(&v30, &from);
    objc_msgSend_setCompletionBlock_(v16, v19, (uint64_t)&v25);
    objc_msgSend_setRequest_(self, v20, (uint64_t)v16, v25, v26, v27, v28);
    v23 = objc_msgSend_container(self, v21, v22);
    objc_msgSend_performRequest_(v23, v24, (uint64_t)v16);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&location);
    return;
  }
  char AllSubscriptionsOperation = objc_msgSend_isFetchAllSubscriptionsOperation(self, v7, v8);

  if (AllSubscriptionsOperation) {
    goto LABEL_4;
  }
  objc_msgSend_finishWithError_(self, v10, 0);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4 = a3;
  objc_msgSend_setSubscriptionFetchedProgressBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDFetchSubscriptionsOperation;
  [(CKDOperation *)&v6 _finishOnCallbackQueueWithError:v4];
}

- (id)subscriptionFetchedProgressBlock
{
  return self->_subscriptionFetchedProgressBlock;
}

- (void)setSubscriptionFetchedProgressBlock:(id)a3
{
}

- (NSArray)subscriptionIDs
{
  return self->_subscriptionIDs;
}

- (void)setSubscriptionIDs:(id)a3
{
}

- (BOOL)isFetchAllSubscriptionsOperation
{
  return self->_isFetchAllSubscriptionsOperation;
}

- (void)setIsFetchAllSubscriptionsOperation:(BOOL)a3
{
  self->_isFetchchar AllSubscriptionsOperation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionIDs, 0);
  objc_storeStrong(&self->_subscriptionFetchedProgressBlock, 0);
}

@end