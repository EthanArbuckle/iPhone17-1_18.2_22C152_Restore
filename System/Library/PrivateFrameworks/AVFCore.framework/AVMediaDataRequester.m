@interface AVMediaDataRequester
- (AVMediaDataRequester)init;
- (AVMediaDataRequester)initWithMediaDataConsumer:(id)a3 requestQueue:(id)a4 requestBlock:(id)a5;
- (BOOL)_isInvalidatePending;
- (OS_dispatch_queue)requestQueue;
- (id)requestBlock;
- (void)_requestMediaDataIfReady;
- (void)_setInvalidatePending;
- (void)dealloc;
- (void)invalidate;
- (void)startRequestingMediaData;
@end

@implementation AVMediaDataRequester

- (AVMediaDataRequester)initWithMediaDataConsumer:(id)a3 requestQueue:(id)a4 requestBlock:(id)a5
{
  v25.receiver = self;
  v25.super_class = (Class)AVMediaDataRequester;
  v9 = [(AVMediaDataRequester *)&v25 init];
  v10 = v9;
  if (v9)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5)
        {
          if (objc_opt_respondsToSelector())
          {
            v10->_mediaDataConsumer = (AVMediaDataRequesterConsumer *)a3;
            dispatch_retain((dispatch_object_t)a4);
            v10->_requestQueue = (OS_dispatch_queue *)a4;
            v10->_requestBlock = (id)[a5 copy];
            v10->_invalidateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
            return v10;
          }
          v23 = v10;
          v18 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v19 = *MEMORY[0x1E4F1C3C8];
          v20 = "[mediaDataConsumer respondsToSelector:@selector(isReadyForMoreMediaData)]";
        }
        else
        {
          v22 = v9;
          v18 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v19 = *MEMORY[0x1E4F1C3C8];
          v20 = "requestBlock != nil";
        }
      }
      else
      {
        v21 = v9;
        v18 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v19 = *MEMORY[0x1E4F1C3C8];
        v20 = "requestQueue != NULL";
      }
    }
    else
    {
      v12 = v9;
      v18 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v19 = *MEMORY[0x1E4F1C3C8];
      v20 = "mediaDataConsumer != nil";
    }
    v24 = (void *)[v18 exceptionWithName:v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, @"invalid parameter not satisfying: %s", v13, v14, v15, v16, v17, (uint64_t)v20), 0 reason userInfo];
    objc_exception_throw(v24);
  }
  return v10;
}

- (AVMediaDataRequester)init
{
  return [(AVMediaDataRequester *)self initWithMediaDataConsumer:0 requestQueue:0 requestBlock:0];
}

- (void)dealloc
{
  requestQueue = self->_requestQueue;
  if (requestQueue) {
    dispatch_release(requestQueue);
  }
  if (self->_invalidateMutex)
  {
    FigSimpleMutexDestroy();
    self->_invalidateMutex = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVMediaDataRequester;
  [(AVMediaDataRequester *)&v4 dealloc];
}

- (void)startRequestingMediaData
{
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVMediaDataRequester_startRequestingMediaData__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

uint64_t __48__AVMediaDataRequester_startRequestingMediaData__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestMediaDataIfReady];
}

- (void)_setInvalidatePending
{
  MEMORY[0x199715030](self->_invalidateMutex, a2);
  self->_invalidatePending = 1;
  JUMPOUT(0x199715040);
}

- (BOOL)_isInvalidatePending
{
  MEMORY[0x199715030](self->_invalidateMutex, a2);
  BOOL invalidatePending = self->_invalidatePending;
  MEMORY[0x199715040](self->_invalidateMutex);
  return invalidatePending;
}

- (void)invalidate
{
  [(AVMediaDataRequester *)self _setInvalidatePending];
  requestQueue = self->_requestQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVMediaDataRequester_invalidate__block_invoke;
  block[3] = &unk_1E57B1E80;
  block[4] = self;
  dispatch_async(requestQueue, block);
}

void __34__AVMediaDataRequester_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {

    *(void *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v4 = *(void **)(v2 + 8);
  if (v4)
  {

    *(void *)(*(void *)(a1 + 32) + 8) = 0;
  }
}

- (void)_requestMediaDataIfReady
{
  v3 = (void *)MEMORY[0x199715AE0](self, a2);
  if ([(AVMediaDataRequesterConsumer *)self->_mediaDataConsumer isReadyForMoreMediaData])
  {
    if (self->_requestBlock)
    {
      if (![(AVMediaDataRequester *)self _isInvalidatePending])
      {
        (*((void (**)(void))self->_requestBlock + 2))();
        if ([(AVMediaDataRequesterConsumer *)self->_mediaDataConsumer isReadyForMoreMediaData])
        {
          if (self->_requestBlock)
          {
            requestQueue = self->_requestQueue;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __48__AVMediaDataRequester__requestMediaDataIfReady__block_invoke;
            block[3] = &unk_1E57B1E80;
            block[4] = self;
            dispatch_async(requestQueue, block);
          }
        }
      }
    }
  }
}

uint64_t __48__AVMediaDataRequester__requestMediaDataIfReady__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestMediaDataIfReady];
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (id)requestBlock
{
  return self->_requestBlock;
}

@end