@interface CKRequestAssetOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (CKRequestAssetOperation)initWithAssetMetadata:(id)a3 requestCallback:(id)a4;
- (CKUploadRequestMetadata)metadata;
- (id)assetRequestCompletionBlock;
- (id)requestCallback;
- (int64_t)state;
- (void)setAssetRequestCompletionBlock:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRequestCallback:(id)a3;
- (void)setState:(int64_t)a3;
- (void)start;
@end

@implementation CKRequestAssetOperation

- (CKRequestAssetOperation)initWithAssetMetadata:(id)a3 requestCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CKRequestAssetOperation;
  v9 = [(CKRequestAssetOperation *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    uint64_t v14 = objc_msgSend_copy(v8, v11, v12, v13);
    id requestCallback = v10->_requestCallback;
    v10->_id requestCallback = (id)v14;
  }
  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)setState:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  int64_t state = obj->_state;
  if (state != a3)
  {
    BOOL v7 = a3 == 1 || state == 1;
    int v8 = v7;
    if (v7) {
      objc_msgSend_willChangeValueForKey_(obj, v4, @"isExecuting", v5);
    }
    BOOL v9 = a3 == 2 || state == 2;
    int v10 = v9;
    if (v9) {
      objc_msgSend_willChangeValueForKey_(obj, v4, @"isFinished", v5);
    }
    obj->_int64_t state = a3;
    if (v8) {
      objc_msgSend_didChangeValueForKey_(obj, v4, @"isExecuting", v5);
    }
    if (v10) {
      objc_msgSend_didChangeValueForKey_(obj, v4, @"isFinished", v5);
    }
  }
  objc_sync_exit(obj);
}

- (int64_t)state
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (BOOL)isExecuting
{
  return objc_msgSend_state(self, a2, v2, v3) == 1;
}

- (BOOL)isFinished
{
  return objc_msgSend_state(self, a2, v2, v3) == 2;
}

- (void)start
{
  if ((objc_msgSend_isCancelled(self, a2, v2, v3) & 1) == 0)
  {
    if (objc_msgSend_state(self, v5, v6, v7))
    {
      v18 = [CKException alloc];
      id v20 = (id)objc_msgSend_initWithName_format_(v18, v19, *MEMORY[0x1E4F1C3C8], @"The operation must be in the Pending state at start");
      objc_exception_throw(v20);
    }
    objc_initWeak(&location, self);
    objc_msgSend_setState_(self, v8, 1, v9);
    objc_msgSend_requestCallback(self, v10, v11, v12);
    uint64_t v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    objc_super v17 = objc_msgSend_metadata(self, v14, v15, v16);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_18B0EBC70;
    v21[3] = &unk_1E5464338;
    objc_copyWeak(&v22, &location);
    ((void (**)(void, void *, void *))v13)[2](v13, v17, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (CKUploadRequestMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (id)assetRequestCompletionBlock
{
  return self->_assetRequestCompletionBlock;
}

- (void)setAssetRequestCompletionBlock:(id)a3
{
}

- (id)requestCallback
{
  return self->_requestCallback;
}

- (void)setRequestCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestCallback, 0);
  objc_storeStrong(&self->_assetRequestCompletionBlock, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

@end