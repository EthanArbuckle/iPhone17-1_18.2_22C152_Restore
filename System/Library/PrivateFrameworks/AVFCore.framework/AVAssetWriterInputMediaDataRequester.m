@interface AVAssetWriterInputMediaDataRequester
- (AVAssetWriterInputMediaDataRequester)init;
- (AVAssetWriterInputMediaDataRequester)initWithRequestQueue:(id)a3 requestBlock:(id)a4;
- (AVAssetWriterInputMediaDataRequesterDelegate)delegate;
- (OS_dispatch_queue)requestQueue;
- (void)_collectUncollectables_invokedFromDeallocAndFinalize;
- (void)dealloc;
- (void)requestMediaDataIfNecessary;
- (void)setDelegate:(id)a3;
@end

@implementation AVAssetWriterInputMediaDataRequester

- (AVAssetWriterInputMediaDataRequester)initWithRequestQueue:(id)a3 requestBlock:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)AVAssetWriterInputMediaDataRequester;
  v7 = [(AVAssetWriterInputMediaDataRequester *)&v21 init];
  v8 = v7;
  if (v7)
  {
    if (a3)
    {
      if (a4)
      {
        dispatch_retain((dispatch_object_t)a3);
        v8->_requestQueue = (OS_dispatch_queue *)a3;
        v8->_requestBlock = (id)[a4 copy];
        v8->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.mediadatarequester.ivars");
        return v8;
      }
      v19 = v7;
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v18 = "block != nil";
    }
    else
    {
      v10 = v7;
      v16 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v17 = *MEMORY[0x1E4F1C3C8];
      v18 = "queue != NULL";
    }
    v20 = (void *)[v16 exceptionWithName:v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v11, v12, v13, v14, v15, (uint64_t)v18), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  return v8;
}

- (AVAssetWriterInputMediaDataRequester)init
{
  return [(AVAssetWriterInputMediaDataRequester *)self initWithRequestQueue:0 requestBlock:0];
}

- (void)_collectUncollectables_invokedFromDeallocAndFinalize
{
  requestQueue = self->_requestQueue;
  if (requestQueue) {
    dispatch_release(requestQueue);
  }
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
  {
    dispatch_release(ivarAccessQueue);
  }
}

- (void)dealloc
{
  [(AVAssetWriterInputMediaDataRequester *)self _collectUncollectables_invokedFromDeallocAndFinalize];
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputMediaDataRequester;
  [(AVAssetWriterInputMediaDataRequester *)&v3 dealloc];
}

- (AVAssetWriterInputMediaDataRequesterDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__AVAssetWriterInputMediaDataRequester_delegate__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  objc_super v3 = (AVAssetWriterInputMediaDataRequesterDelegate *)[(id)v7[5] referencedObject];

  _Block_object_dispose(&v6, 8);
  return v3;
}

id __48__AVAssetWriterInputMediaDataRequester_delegate__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 32);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  v4 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  ivarAccessQueue = self->_ivarAccessQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AVAssetWriterInputMediaDataRequester_setDelegate___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = v4;
  v6[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __52__AVAssetWriterInputMediaDataRequester_setDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);

  *(void *)(*(void *)(a1 + 40) + 32) = *(void *)(a1 + 32);
}

- (void)requestMediaDataIfNecessary
{
  objc_super v3 = (void *)MEMORY[0x199715AE0](self, a2);
  v4 = [(AVAssetWriterInputMediaDataRequester *)self delegate];
  if (v4)
  {
    if ([(AVAssetWriterInputMediaDataRequesterDelegate *)v4 mediaDataRequesterShouldRequestMediaData])
    {
      (*((void (**)(void))self->_requestBlock + 2))();
      v5 = [(AVAssetWriterInputMediaDataRequester *)self delegate];
      if (v5)
      {
        if ([(AVAssetWriterInputMediaDataRequesterDelegate *)v5 mediaDataRequesterShouldRequestMediaData])
        {
          uint64_t v6 = [(AVAssetWriterInputMediaDataRequester *)self requestQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__AVAssetWriterInputMediaDataRequester_requestMediaDataIfNecessary__block_invoke;
          block[3] = &unk_1E57B1E80;
          block[4] = self;
          dispatch_async((dispatch_queue_t)v6, block);
        }
      }
    }
  }
}

uint64_t __67__AVAssetWriterInputMediaDataRequester_requestMediaDataIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestMediaDataIfNecessary];
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

@end