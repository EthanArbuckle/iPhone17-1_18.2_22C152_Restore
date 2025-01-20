@interface CULiveAction
- (BOOL)direct;
- (CULiveAction)init;
- (CULiveAction)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSArray)destinationIDs;
- (NSString)originatingHomeKitAccessoryID;
- (NSString)speakText;
- (NSURL)soundFileURL;
- (OS_dispatch_queue)dispatchQueue;
- (id)invalidationHandler;
- (int)alertType;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)setAlertType:(int)a3;
- (void)setDestinationIDs:(id)a3;
- (void)setDirect:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setOriginatingHomeKitAccessoryID:(id)a3;
- (void)setSoundFileURL:(id)a3;
- (void)setSpeakText:(id)a3;
@end

@implementation CULiveAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakText, 0);
  objc_storeStrong((id *)&self->_soundFileURL, 0);
  objc_storeStrong((id *)&self->_originatingHomeKitAccessoryID, 0);
  objc_storeStrong((id *)&self->_destinationIDs, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setSpeakText:(id)a3
{
}

- (NSString)speakText
{
  return self->_speakText;
}

- (void)setSoundFileURL:(id)a3
{
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (void)setOriginatingHomeKitAccessoryID:(id)a3
{
}

- (NSString)originatingHomeKitAccessoryID
{
  return self->_originatingHomeKitAccessoryID;
}

- (void)setDirect:(BOOL)a3
{
  self->_direct = a3;
}

- (BOOL)direct
{
  return self->_direct;
}

- (void)setDestinationIDs:(id)a3
{
}

- (NSArray)destinationIDs
{
  return self->_destinationIDs;
}

- (void)setAlertType:(int)a3
{
  self->_alertType = a3;
}

- (int)alertType
{
  return self->_alertType;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CULiveAction_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__CULiveAction_invalidate__block_invoke(uint64_t a1)
{
  v12 = (uint64_t (**)(void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 24));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  v9 = v12;
  if (v12)
  {
    uint64_t v4 = v12[2](v12);
    v9 = v12;
  }
  if (gLogCategory_CULiveAction <= 30)
  {
    if (gLogCategory_CULiveAction != -1
      || (uint64_t v4 = _LogCategory_Initialize((uint64_t)&gLogCategory_CULiveAction, 0x1Eu), v9 = v12, v4))
    {
      uint64_t v4 = LogPrintF((uint64_t)&gLogCategory_CULiveAction, (uint64_t)"-[CULiveAction invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidated", v5, v6, v7, v8, v11);
      v9 = v12;
    }
  }
  return MEMORY[0x1F41817F8](v4, v9);
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CULiveAction_activateWithCompletion___block_invoke;
  block[3] = &unk_1E55BFC80;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, block);
}

void __39__CULiveAction_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960561, (uint64_t)"Not supported, use HomeKit instead", a4, a5, a6, a7, a8, v15);
  id v16 = (id)v9;
  if (gLogCategory_CULiveAction <= 90)
  {
    if (gLogCategory_CULiveAction != -1
      || (v14 = _LogCategory_Initialize((uint64_t)&gLogCategory_CULiveAction, 0x5Au), uint64_t v9 = (uint64_t)v16, v14))
    {
      LogPrintF((uint64_t)&gLogCategory_CULiveAction, (uint64_t)"-[CULiveAction activateWithCompletion:]_block_invoke", 0x5Au, (uint64_t)"### Activate failed: %{error}", v10, v11, v12, v13, v9);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CULiveAction)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v12 = [(CULiveAction *)self init];
  if (!v12)
  {
    if (a4)
    {
      uint64_t v15 = (void *)*MEMORY[0x1E4F28760];
      id v16 = "init failed";
LABEL_9:
      NSErrorF_safe(v15, 4294960540, (uint64_t)v16, v7, v8, v9, v10, v11, v17);
      uint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_10:
    uint64_t v13 = 0;
    goto LABEL_4;
  }
  if (MEMORY[0x192FAB6C0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      uint64_t v15 = (void *)*MEMORY[0x1E4F28760];
      id v16 = "XPC non-dict";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  uint64_t v13 = v12;
LABEL_4:

  return v13;
}

- (CULiveAction)init
{
  v6.receiver = self;
  v6.super_class = (Class)CULiveAction;
  uint64_t v2 = [(CULiveAction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    id v4 = v3;
  }

  return v3;
}

@end