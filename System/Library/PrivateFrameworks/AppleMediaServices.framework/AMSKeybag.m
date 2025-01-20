@interface AMSKeybag
+ (AMSKeybag)sharedInstance;
- (AMSFairPlayContext)fairPlayContext;
- (AMSKeybag)init;
- (BOOL)importDiversityBagWithData:(id)a3 error:(id *)a4;
- (BOOL)importKeybagWithData:(id)a3 error:(id *)a4;
- (OS_dispatch_queue)dispatchQueue;
- (id)keybagSyncDataWithAccountID:(id)a3 transactionType:(unsigned int)a4 error:(id *)a5;
- (unsigned)fairplayContextWithError:(id *)a3;
- (void)resetContext;
- (void)setDispatchQueue:(id)a3;
- (void)setFairPlayContext:(id)a3;
@end

@implementation AMSKeybag

- (AMSKeybag)init
{
  v8.receiver = self;
  v8.super_class = (Class)AMSKeybag;
  v2 = [(AMSKeybag *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ams.AMSKeybag.dispatch", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(AMSFairPlayContext);
    fairPlayContext = v2->_fairPlayContext;
    v2->_fairPlayContext = v5;
  }
  return v2;
}

+ (AMSKeybag)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AMSKeybag_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB38D9B8 != -1) {
    dispatch_once(&qword_1EB38D9B8, block);
  }
  v2 = (void *)_MergedGlobals_116;
  return (AMSKeybag *)v2;
}

uint64_t __27__AMSKeybag_sharedInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_116 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (unsigned)fairplayContextWithError:(id *)a3
{
  v4 = [(AMSKeybag *)self fairPlayContext];
  LODWORD(a3) = [v4 fairplayContextIDWithError:a3];

  return a3;
}

- (BOOL)importKeybagWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__39;
  v24 = __Block_byref_object_dispose__39;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__AMSKeybag_importKeybagWithData_error___block_invoke;
  v11[3] = &unk_1E55A3478;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v20;
  dispatch_sync(dispatchQueue, v11);
  if (a4) {
    *a4 = (id) v21[5];
  }
  char v9 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

void __40__AMSKeybag_importKeybagWithData_error___block_invoke(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    return;
  }
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 fairplayContextWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4 && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    [*(id *)(a1 + 32) bytes];
    [*(id *)(a1 + 32) length];
    ha0dkchaters6();
    if (v5)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Import error with status: %ld", v5);
      uint64_t v7 = AMSError(505, @"Fairplay Import error", v6, 0);
      uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      return;
    }
    goto LABEL_6;
  }
}

- (BOOL)importDiversityBagWithData:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  return 0;
}

- (id)keybagSyncDataWithAccountID:(id)a3 transactionType:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__39;
  v28 = __Block_byref_object_dispose__39;
  id v29 = 0;
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__39;
  uint64_t v22 = __Block_byref_object_dispose__39;
  id v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AMSKeybag_keybagSyncDataWithAccountID_transactionType_error___block_invoke;
  block[3] = &unk_1E55A34A0;
  block[4] = self;
  v15 = &v18;
  id v10 = v8;
  unsigned int v17 = a4;
  id v14 = v10;
  uint64_t v16 = &v24;
  dispatch_sync(dispatchQueue, block);
  if (a5) {
    *a5 = (id) v19[5];
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __63__AMSKeybag_keybagSyncDataWithAccountID_transactionType_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 fairplayContextWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v18 = 0;
    unsigned int v17 = 0;
    uint64_t v5 = [*(id *)(a1 + 40) longLongValue];
    Mt76Vq80ux(v4, v5, 0, *(unsigned int *)(a1 + 64), (uint64_t)&v18, (uint64_t)&v17);
    if (v6)
    {
      int v7 = v6;
      id v8 = NSString;
      char v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v5];
      id v10 = AMSHashIfNeeded(v9);
      id v11 = [v8 stringWithFormat:@"KBSync generation error for dsid: %@, status: %ld", v10, v7];
      uint64_t v12 = AMSError(505, @"Keybag Error", v11, 0);
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v18 length:v17];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      char v9 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }

    if (v18) {
      jEHf8Xzsv8K(v18);
    }
  }
}

- (void)resetContext
{
  id v2 = [(AMSKeybag *)self fairPlayContext];
  [v2 destroyContext];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (AMSFairPlayContext)fairPlayContext
{
  return self->_fairPlayContext;
}

- (void)setFairPlayContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlayContext, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end