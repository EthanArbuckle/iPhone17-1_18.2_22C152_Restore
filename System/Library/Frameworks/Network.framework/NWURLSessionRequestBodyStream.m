@interface NWURLSessionRequestBodyStream
- (int64_t)countOfBytesSent;
- (void)close;
- (void)pollStream;
- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation NWURLSessionRequestBodyStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  v11 = __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke;
  v12 = &unk_1E5249FB0;
  id v14 = v6;
  unint64_t v15 = a4;
  v13 = self;
  v7 = (void *)MEMORY[0x1E4F18D80];
  id v8 = v6;
  v9 = (__CFRunLoop *)[v7 resourceLoaderRunLoop];
  if (CFRunLoopGetCurrent() == v9)
  {
    v11((uint64_t)block);
  }
  else
  {
    CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x1E4F1D418], block);
    CFRunLoopWakeUp(v9);
  }
}

void __52__NWURLSessionRequestBodyStream_stream_handleEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if ((unint64_t)(v2 - 1) < 2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    -[NWURLSessionRequestBodyStream pollStream](v6);
  }
  else
  {
    if (v2 == 8)
    {
      v7 = [NWURLError alloc];
      if (v7)
      {
        uint64_t v8 = *MEMORY[0x1E4F289A0];
        v13.receiver = v7;
        v13.super_class = (Class)NWURLError;
        id v12 = objc_msgSendSuper2(&v13, sel_initWithDomain_code_userInfo_, v8, -1021, 0);
      }
      else
      {
        id v12 = 0;
      }
      v9 = [*(id *)(a1 + 40) streamError];
      [v12 setUnderlyingError:v9];
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        uint64_t v11 = *(void *)(v10 + 40);
      }
      else {
        uint64_t v11 = 0;
      }
      -[NWURLSessionReadRequest putError:](v11, v12);

      v5 = v12;
    }
    else
    {
      if (v2 != 16) {
        return;
      }
      uint64_t v3 = *(void *)(a1 + 32);
      if (v3)
      {
        uint64_t v4 = *(void *)(v3 + 40);
        if (v4)
        {
          *(unsigned char *)(v4 + 8) = 1;
          -[NWURLSessionReadRequest tryFulfillRequest](v4);
        }
      }
      v5 = 0;
    }
  }
}

- (void)pollStream
{
  if (a1)
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    if (Current != (CFRunLoopRef)[MEMORY[0x1E4F18D80] resourceLoaderRunLoop]) {
      __assert_rtn("-[NWURLSessionRequestBodyStream pollStream]", "NWURLSessionRequest.m", 353, "CFRunLoopGetCurrent() == NSURLConnection.resourceLoaderRunLoop");
    }
    if ([*(id *)(a1 + 16) hasBytesAvailable])
    {
      uint64_t v3 = *(void *)(a1 + 40);
      if (v3)
      {
        if (*(void *)(v3 + 32))
        {
          uint64_t v4 = *(void *)(v3 + 24);
          if (v4)
          {
            alloc = dispatch_data_create_alloc();
            subrange = 0;
            while (1)
            {
              uint64_t v7 = [*(id *)(a1 + 16) read:subrange maxLength:v4];
              uint64_t v8 = v7;
              if (v7 <= 0) {
                break;
              }
              subrange += v7;
              v4 -= v7;
              if (!v4 || ([*(id *)(a1 + 16) hasBytesAvailable] & 1) == 0) {
                goto LABEL_11;
              }
            }
            if (!v7)
            {
LABEL_11:
              uint64_t v9 = [*(id *)(a1 + 16) streamStatus];
              char v11 = v8 < 1 || v9 == 5;
              if (subrange) {
                subrange = (char *)dispatch_data_create_subrange(alloc, 0, (size_t)subrange);
              }
              -[NWURLSessionReadRequest putData:complete:](*(void *)(a1 + 40), subrange, v11);
              goto LABEL_20;
            }
            id v12 = [NWURLError alloc];
            if (v12)
            {
              uint64_t v13 = *MEMORY[0x1E4F289A0];
              v15.receiver = v12;
              v15.super_class = (Class)NWURLError;
              subrange = (char *)objc_msgSendSuper2(&v15, sel_initWithDomain_code_userInfo_, v13, -1021, 0);
            }
            else
            {
              subrange = 0;
            }
            id v14 = [*(id *)(a1 + 16) streamError];
            [subrange setUnderlyingError:v14];
            -[NWURLSessionReadRequest putError:](*(void *)(a1 + 40), subrange);

LABEL_20:
          }
        }
      }
    }
  }
}

- (void)close
{
  uint64_t v3 = (__CFRunLoop *)[MEMORY[0x1E4F18D80] resourceLoaderRunLoop];
  uint64_t v4 = (const void *)*MEMORY[0x1E4F1D418];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __38__NWURLSessionRequestBodyStream_close__block_invoke;
  block[3] = &unk_1E524BAA8;
  block[4] = self;
  CFRunLoopPerformBlock(v3, v4, block);
  CFRunLoopWakeUp(v3);
}

uint64_t __38__NWURLSessionRequestBodyStream_close__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 16);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 close];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 16);
  }
  else {
    v5 = 0;
  }

  return [v5 setDelegate:0];
}

- (void)readMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (__CFRunLoop *)[MEMORY[0x1E4F18D80] resourceLoaderRunLoop];
  uint64_t v10 = (const void *)*MEMORY[0x1E4F1D418];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  v12[3] = &unk_1E523C650;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  CFRunLoopPerformBlock(v9, v10, v12);
  CFRunLoopWakeUp(v9);
}

void __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 8))
    {
LABEL_3:
      uint64_t v3 = *(_OWORD **)(v2 + 40);
      goto LABEL_4;
    }
    *(unsigned char *)(v2 + 8) = 1;
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 16);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_msgSend(v6, "setDelegate:");
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v7 = (void *)v7[2];
  }
  id v8 = (void *)MEMORY[0x1E4F1CAC0];
  uint64_t v9 = v7;
  uint64_t v10 = [v8 currentRunLoop];
  [v9 scheduleInRunLoop:v10 forMode:*MEMORY[0x1E4F1C3A0]];

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(void **)(v11 + 16);
  }
  else {
    id v12 = 0;
  }
  [v12 open];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    goto LABEL_3;
  }
  uint64_t v3 = 0;
LABEL_4:
  long long v13 = *(_OWORD *)(a1 + 48);
  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2;
  newValue[3] = &unk_1E523C628;
  newValue[4] = v2;
  id v15 = *(id *)(a1 + 40);
  if (v3)
  {
    v3[1] = v13;
    objc_setProperty_nonatomic_copy(v3, v4, newValue, 32);
    -[NWURLSessionReadRequest tryFulfillRequest]((uint64_t)v3);
  }
  -[NWURLSessionRequestBodyStream pollStream](*(void *)(a1 + 32));
}

void __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(NSObject **)(v9 + 32);
  }
  else {
    uint64_t v10 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  void block[2] = __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_3;
  block[3] = &unk_1E5243F38;
  id v15 = v7;
  uint64_t v16 = v9;
  id v11 = *(id *)(a1 + 40);
  char v19 = a3;
  id v17 = v8;
  id v18 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

uint64_t __93__NWURLSessionRequestBodyStream_readMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      *(void *)(v2 + 24) += dispatch_data_get_size(*(dispatch_data_t *)(a1 + 32));
    }
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

- (int64_t)countOfBytesSent
{
  if (self) {
    return *(void *)(self + 24);
  }
  return self;
}

@end