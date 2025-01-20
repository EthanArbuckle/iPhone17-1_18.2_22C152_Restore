@interface CKDRemoveAnonymousShareFromSharedDBOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDRemoveAnonymousShareFromSharedDBOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (NSDictionary)encryptedAnonymousSharesToRemove;
- (id)activityCreate;
- (id)anonymousShareRemovedBlock;
- (int)operationType;
- (void)_removeAnonymousShareFromSharedDB;
- (void)main;
- (void)setAnonymousShareRemovedBlock:(id)a3;
- (void)setEncryptedAnonymousSharesToRemove:(id)a3;
@end

@implementation CKDRemoveAnonymousShareFromSharedDBOperation

- (CKDRemoveAnonymousShareFromSharedDBOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKDRemoveAnonymousShareFromSharedDBOperation;
  v9 = [(CKDDatabaseOperation *)&v18 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_encryptedAnonymousSharesToRemove(v6, v7, v8);
    encryptedAnonymousSharesToRemove = v9->_encryptedAnonymousSharesToRemove;
    v9->_encryptedAnonymousSharesToRemove = (NSDictionary *)v10;

    uint64_t v14 = objc_msgSend_anonymousShareRemovedBlock(v6, v12, v13);
    id anonymousShareRemovedBlock = v9->_anonymousShareRemovedBlock;
    v9->_id anonymousShareRemovedBlock = (id)v14;

    objc_msgSend_setDatabaseScope_(v9, v16, 3);
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/RemoveAnonymousShareFromSharedDB", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
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
    objc_msgSend__removeAnonymousShareFromSharedDB(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Call _removeAnonymousShareFromSharedDB";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDRemoveAnonymousShareFromSharedDBOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)operationType
{
  return 271;
}

- (void)_removeAnonymousShareFromSharedDB
{
  uint64_t v3 = [CKDAnonymousShareRemoveURLRequest alloc];
  id v6 = objc_msgSend_encryptedAnonymousSharesToRemove(self, v4, v5);
  uint64_t v8 = objc_msgSend_initWithOperation_encryptedAnonymousSharesToRemove_(v3, v7, (uint64_t)self, v6);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v11 = objc_msgSend_stateTransitionGroup(self, v9, v10);
  dispatch_group_enter(v11);

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1C4E4A738;
  v22[3] = &unk_1E64F41A8;
  objc_copyWeak(&v23, &location);
  objc_msgSend_setAnonymousShareRemovedBlock_(v8, v12, (uint64_t)v22);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1C4E4A7E0;
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

- (NSDictionary)encryptedAnonymousSharesToRemove
{
  return self->_encryptedAnonymousSharesToRemove;
}

- (void)setEncryptedAnonymousSharesToRemove:(id)a3
{
}

- (id)anonymousShareRemovedBlock
{
  return self->_anonymousShareRemovedBlock;
}

- (void)setAnonymousShareRemovedBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anonymousShareRemovedBlock, 0);
  objc_storeStrong((id *)&self->_encryptedAnonymousSharesToRemove, 0);
}

@end