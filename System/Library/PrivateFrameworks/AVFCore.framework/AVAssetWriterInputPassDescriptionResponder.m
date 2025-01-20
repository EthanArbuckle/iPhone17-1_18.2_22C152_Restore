@interface AVAssetWriterInputPassDescriptionResponder
- (AVAssetWriterInputPassDescriptionResponder)init;
- (AVAssetWriterInputPassDescriptionResponder)initWithCallbackQueue:(id)a3 block:(id)a4;
- (BOOL)_hasStoppedResponding;
- (void)_releaseAndClearCallbackBlock_invokeOnSerializationQueue;
- (void)dealloc;
- (void)respondToNewPassDescription:(id)a3;
- (void)stopRespondingToPassDescriptions;
@end

@implementation AVAssetWriterInputPassDescriptionResponder

- (AVAssetWriterInputPassDescriptionResponder)init
{
  return [(AVAssetWriterInputPassDescriptionResponder *)self initWithCallbackQueue:0 block:0];
}

- (AVAssetWriterInputPassDescriptionResponder)initWithCallbackQueue:(id)a3 block:(id)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 5260, @"Invalid parameter not satisfying: %@", @"queue != NULL");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 5261, @"Invalid parameter not satisfying: %@", @"block != nil");
LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)AVAssetWriterInputPassDescriptionResponder;
  v8 = [(AVAssetWriterInputPassDescriptionResponder *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_callbackQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v9->_callbackBlock = (id)[a4 copy];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9->_serializationQueue = (OS_dispatch_queue *)dispatch_queue_create("AVAssetWriterInputPassDescriptionResponder serialization queue", v10);
  }
  return v9;
}

- (void)dealloc
{
  callbackQueue = self->_callbackQueue;
  if (callbackQueue) {
    dispatch_release(callbackQueue);
  }
  serializationQueue = self->_serializationQueue;
  if (serializationQueue) {
    dispatch_release(serializationQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetWriterInputPassDescriptionResponder;
  [(AVAssetWriterInputPassDescriptionResponder *)&v5 dealloc];
}

- (void)respondToNewPassDescription:(id)a3
{
  serializationQueue = self->_serializationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(serializationQueue, v4);
}

void __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = v2[5];
  char v5 = [v2 _hasStoppedResponding];
  if (v3 != v4)
  {
    if (v5) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    goto LABEL_8;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v6 + 32)) {
    char v7 = 1;
  }
  else {
    char v7 = v5;
  }
  if ((v7 & 1) == 0)
  {
LABEL_8:

    *(void *)(*(void *)(a1 + 40) + 40) = *(id *)(a1 + 32);
    id v8 = *(id *)(*(void *)(a1 + 40) + 48);
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = *(NSObject **)(v9 + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke_2;
    v11[3] = &unk_1E57B3748;
    v11[4] = v9;
    v11[5] = v8;
    dispatch_async(v10, v11);
    if (!*(void *)(a1 + 32)) {
      objc_msgSend(*(id *)(a1 + 40), "_releaseAndClearCallbackBlock_invokeOnSerializationQueue");
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 32) = 1;
  }
}

void __74__AVAssetWriterInputPassDescriptionResponder_respondToNewPassDescription___block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasStoppedResponding] & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v2 = *(void **)(a1 + 40);
  }
}

- (void)_releaseAndClearCallbackBlock_invokeOnSerializationQueue
{
  self->_callbackBlock = 0;
}

- (void)stopRespondingToPassDescriptions
{
  FigAtomicIncrement32();
  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVAssetWriterInputPassDescriptionResponder_stopRespondingToPassDescriptions__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

uint64_t __78__AVAssetWriterInputPassDescriptionResponder_stopRespondingToPassDescriptions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_releaseAndClearCallbackBlock_invokeOnSerializationQueue");
}

- (BOOL)_hasStoppedResponding
{
  return self->_stoppedResponding > 0;
}

@end