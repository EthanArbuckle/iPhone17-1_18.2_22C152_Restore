@interface CKDAddAnonymousShareToSharedDBOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDAddAnonymousShareToSharedDBOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSDictionary)encryptedAnonymousSharesToAdd;
- (id)activityCreate;
- (id)anonymousShareSavedBlock;
- (int)operationType;
- (void)_addAnonymousSharesToSharedDB;
- (void)main;
- (void)setAnonymousShareSavedBlock:(id)a3;
- (void)setEncryptedAnonymousSharesToAdd:(id)a3;
@end

@implementation CKDAddAnonymousShareToSharedDBOperation

- (CKDAddAnonymousShareToSharedDBOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKDAddAnonymousShareToSharedDBOperation;
  v9 = [(CKDDatabaseOperation *)&v18 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_encryptedAnonymousSharesToAdd(v6, v7, v8);
    encryptedAnonymousSharesToAdd = v9->_encryptedAnonymousSharesToAdd;
    v9->_encryptedAnonymousSharesToAdd = (NSDictionary *)v10;

    uint64_t v14 = objc_msgSend_anonymousShareSavedBlock(v6, v12, v13);
    id anonymousShareSavedBlock = v9->_anonymousShareSavedBlock;
    v9->_id anonymousShareSavedBlock = (id)v14;

    objc_msgSend_setDatabaseScope_(v9, v16, 3);
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/AddAnonymousShareToSharedDB", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    uint64_t v10 = objc_msgSend_error(self, v8, v9);
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);
  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend__addAnonymousSharesToSharedDB(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Call _addAnonymousShareToSharedDB";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDAddAnonymousShareToSharedDBOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)operationType
{
  return 270;
}

- (void)_addAnonymousSharesToSharedDB
{
  uint64_t v3 = [CKDAnonymousShareAddURLRequest alloc];
  id v6 = objc_msgSend_encryptedAnonymousSharesToAdd(self, v4, v5);
  uint64_t v8 = objc_msgSend_initWithOperation_encryptedAnonymousSharesToAdd_(v3, v7, (uint64_t)self, v6);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v11 = objc_msgSend_stateTransitionGroup(self, v9, v10);
  dispatch_group_enter(v11);

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C501D754;
  v22[3] = &unk_1E64F41A8;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setAnonymousShareSavedBlock_(v8, v12, (uint64_t)v22);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C501D7FC;
  v19[3] = &unk_1E64F0170;
  objc_copyWeak(&v20, &location);
  objc_copyWeak(&v21, &from);
  objc_msgSend_setCompletionBlock_(v8, v13, (uint64_t)v19);
  objc_msgSend_setRequest_(self, v14, (uint64_t)v8);
  v17 = objc_msgSend_container(self, v15, v16);
  objc_msgSend_performRequest_(v17, v18, (uint64_t)v8);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)main
{
}

- (NSDictionary)encryptedAnonymousSharesToAdd
{
  return self->_encryptedAnonymousSharesToAdd;
}

- (void)setEncryptedAnonymousSharesToAdd:(id)a3
{
}

- (id)anonymousShareSavedBlock
{
  return self->_anonymousShareSavedBlock;
}

- (void)setAnonymousShareSavedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareSavedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToAdd, 0);
}

@end