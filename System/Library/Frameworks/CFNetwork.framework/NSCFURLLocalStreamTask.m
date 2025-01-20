@interface NSCFURLLocalStreamTask
@end

@implementation NSCFURLLocalStreamTask

void __48____NSCFURLLocalStreamTask_stopSecureConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57____NSCFURLLocalStreamTask__onqueue_stopSecureConnection__block_invoke;
    v4[3] = &unk_1E5258228;
    v4[4] = v1;
    objc_msgSend(*(id *)(v1 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v4, (uint64_t)"stopSecure"));
    [(__NSCFURLLocalStreamTask *)v1 _onqueue_ioTick];
  }
}

uint64_t __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(void *)(a1 + 32));
}

uint64_t __43____NSCFURLLocalStreamTask__onqueue_ioTick__block_invoke_49(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_ioTick](*(void *)(a1 + 32));
}

uint64_t __49____NSCFURLLocalStreamTask__onqueue_closeWriteOp__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](*(void *)(a1 + 32));
}

uint64_t __48____NSCFURLLocalStreamTask__onqueue_closeReadOp__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](*(void *)(a1 + 32));
}

BOOL __55____NSCFURLLocalStreamTask__onqueue_shufflePendingFor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

void __49____NSCFURLLocalStreamTask_startSecureConnection__block_invoke(uint64_t a1)
{
}

uint64_t __58____NSCFURLLocalStreamTask__onqueue_startSecureConnection__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_startSecureConnection](*(void *)(a1 + 32));
}

void __37____NSCFURLLocalStreamTask_closeRead__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37____NSCFURLLocalStreamTask_closeRead__block_invoke_2;
  v6[3] = &unk_1E5258228;
  v6[4] = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(v3 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v6, (uint64_t)"closeRead"));
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(__NSCFURLLocalStreamTask *)v5 _onqueue_ioTick];
}

void __37____NSCFURLLocalStreamTask_closeRead__block_invoke_2(uint64_t a1)
{
}

void __38____NSCFURLLocalStreamTask_closeWrite__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38____NSCFURLLocalStreamTask_closeWrite__block_invoke_2;
  v6[3] = &unk_1E5258228;
  v6[4] = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(v3 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v6, (uint64_t)"closeWrite"));
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(__NSCFURLLocalStreamTask *)v5 _onqueue_ioTick];
}

void __38____NSCFURLLocalStreamTask_closeWrite__block_invoke_2(uint64_t a1)
{
}

void __42____NSCFURLLocalStreamTask_captureStreams__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 704);
    if (!v4) {
      uint64_t v4 = *(void *)(v3 + 696);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(__NSCFURLSessionDelegateWrapper *)v4 didBecomeInputOutputStream])
  {
    uint64_t v5 = *(__CFWriteStream **)(a1 + 32);
    if (*((void *)v5 + 99) && *((void *)v5 + 100))
    {
      -[__NSCFURLLocalStreamTask _onqueue_captureStreams](v5);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __42____NSCFURLLocalStreamTask_captureStreams__block_invoke_34;
      v10[3] = &unk_1E5258228;
      v10[4] = v5;
      uint64_t v7 = +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v10, (uint64_t)"captureStreams");
      v8 = *(void **)(*(void *)(a1 + 32) + 904);
      if (!v8)
      {
        *(void *)(*(void *)(a1 + 32) + 904) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
        v8 = *(void **)(*(void *)(a1 + 32) + 904);
      }
      [v8 addObject:v7];
    }
  }
  else
  {
    if (CFNLog::onceToken != -1) {
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
    }
    uint64_t v6 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "session"), "delegate");
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v9;
      _os_log_error_impl(&dword_184085000, v6, OS_LOG_TYPE_ERROR, "NSURLSession delegate does not support -[NSURLSessionStreamTask captureStreams]; delegate = %@",
        buf,
        0xCu);
    }
    -[__NSCFURLLocalStreamTask _onqueue_cancel](*(void *)(a1 + 32));
  }
}

void __42____NSCFURLLocalStreamTask_captureStreams__block_invoke_34(uint64_t a1)
{
}

uint64_t __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke(uint64_t a1)
{
  return -[__NSCFURLLocalStreamTask _onqueue_captureStreams](*(void *)(a1 + 32));
}

void __51____NSCFURLLocalStreamTask__onqueue_captureStreams__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
  objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_cleanupAndBreakCycles");
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 760);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 40))(v2);
  }

  uint64_t v3 = *(void **)(a1 + 48);
}

uint64_t __43____NSCFURLLocalStreamTask__onqueue_cancel__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 1) {
    [*(id *)(a1 + 32) resume];
  }
  [*(id *)(a1 + 32) setState:2];
  -[__NSCFURLLocalStreamTask _onqueue_errorOrCancelError](*(void **)(a1 + 32));
  -[__NSCFURLLocalStreamTask _onqueue_closeReadOp](*(void **)(a1 + 32));
  -[__NSCFURLLocalStreamTask _onqueue_closeWriteOp](*(void **)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 32);

  return -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v2);
}

void __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) state];
  uint64_t v3 = *(int **)(a1 + 32);
  if (v2 <= 1 && v3[194] < 3)
  {
    uint64_t v6 = [__NSCFURLLocalStreamTaskWorkWrite alloc];
    if (v6)
    {
      uint64_t v7 = [(__NSCFURLLocalStreamTaskWorkWrite *)v6 init];
      v8 = (void *)v7;
      if (v7) {
        *(void *)(v7 + 8) = "writeData";
      }
    }
    else
    {
      v8 = 0;
    }
    v8[7] = [*(id *)(a1 + 40) length];
    v8[2] = *(void *)(a1 + 56);
    v8[3] = 0;
    objc_initWeak(&location, (id)[*(id *)(a1 + 32) session]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E5257378;
    objc_copyWeak(&v14, &location);
    aBlock[4] = *(void *)(a1 + 48);
    v8[8] = _Block_copy(aBlock);
    [*(id *)(*(void *)(a1 + 32) + 808) addObject:v8];

    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 856);
    if (v9)
    {
      id v10 = (id)[v9 mutableCopy];
      [v10 appendData:*(void *)(a1 + 40)];
    }
    else
    {
      id v10 = *(id *)(a1 + 40);
    }
    *(void *)(*(void *)(a1 + 32) + 856) = v10;
    if ([*(id *)(a1 + 32) state] != 1) {
      [(__NSCFURLLocalStreamTask *)*(void *)(a1 + 32) _onqueue_ioTick];
    }
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v4 = [v3 session];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_2;
    v16[3] = &unk_1E5258028;
    uint64_t v5 = *(void *)(a1 + 48);
    v16[4] = *(void *)(a1 + 32);
    v16[5] = v5;
    -[NSURLSession runDelegateBlock:](v4, v16);
  }
}

uint64_t __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) state];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3 < 2) {
    uint64_t v5 = -[__NSCFURLLocalStreamTask _onqueue_errorOrCancelError](v4);
  }
  else {
    uint64_t v5 = (void *)v4[117];
  }
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *))(v2 + 16);

  return v6(v2, v5);
}

void __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_4;
  v6[3] = &unk_1E5258028;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v6);
}

uint64_t __64____NSCFURLLocalStreamTask_writeData_timeout_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __84____NSCFURLLocalStreamTask_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t *a1)
{
  uint64_t v1 = a1[4];
  if (v1)
  {
    uint64_t v3 = a1[6];
    uint64_t v2 = a1[7];
    uint64_t v4 = a1[8];
    uint64_t v5 = (void *)a1[5];
    if ([(id)a1[4] state] <= 1 && *(int *)(v1 + 776) < 3)
    {
      uint64_t v7 = [__NSCFURLLocalStreamTaskWorkRead alloc];
      if (v7)
      {
        uint64_t v8 = [(__NSCFURLLocalStreamTaskWorkRead *)v7 init];
        uint64_t v9 = v8;
        if (v8) {
          *(void *)(v8 + 8) = "readData";
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      *(_DWORD *)(v9 + 44) = v3;
      *(_DWORD *)(v9 + 48) = v2;
      *(void *)(v9 + 16) = v4;
      *(void *)(v9 + 24) = 0;
      objc_initWeak(&location, (id)[(id)v1 session]);
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2;
      v16 = &unk_1E5257328;
      objc_copyWeak(&v18, &location);
      uint64_t v17 = (uint64_t)v5;
      *(void *)(v9 + 56) = _Block_copy(&aBlock);
      [*(id *)(v1 + 808) addObject:v9];

      [(__NSCFURLLocalStreamTask *)v1 _onqueue_ioTick];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v6 = [(id)v1 session];
      uint64_t aBlock = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke;
      v16 = &unk_1E5258028;
      uint64_t v17 = v1;
      id v18 = v5;
      -[NSURLSession runDelegateBlock:](v6, &aBlock);
    }
  }
}

uint64_t __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = a1 + 32;
  uint64_t v2 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  int v5 = v2[833];
  uint64_t v6 = [v2 state];
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6 < 2) {
    uint64_t v8 = -[__NSCFURLLocalStreamTask _onqueue_errorOrCancelError](v7);
  }
  else {
    uint64_t v8 = (void *)v7[117];
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, void, BOOL, void *))(v3 + 16);

  return v9(v3, 0, v5 != 0, v8);
}

void __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5257300;
  uint64_t v9 = *(void *)(a1 + 32);
  void v10[5] = a4;
  v10[6] = v9;
  char v11 = a3;
  v10[4] = a2;
  -[NSURLSession runDelegateBlock:]((uint64_t)Weak, v10);
}

uint64_t __93____NSCFURLLocalStreamTask__onqueue_readDataOfMinLength_maxLength_timeout_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

uint64_t __34____NSCFURLLocalStreamTask_cancel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result <= 1)
  {
    [*(id *)(a1 + 32) setState:2];
    uint64_t v3 = *(void *)(a1 + 32);
    return -[__NSCFURLLocalStreamTask _onqueue_cancel](v3);
  }
  return result;
}

void __43____NSCFURLLocalStreamTask__onqueue_resume__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(int *)(v2 + 776) < 2)
  {
    if (*(void *)(v2 + 760))
    {
      -[__NSURLSessionLocal addConnectionlessTask:]([(id)v2 session], *(void *)(a1 + 32));
      *(_DWORD *)(*(void *)(a1 + 32) + 776) = 1;
      uint64_t v6 = *(void (**)(void))(**(void **)(*(void *)(a1 + 32) + 760) + 32);
      v6();
    }
    else
    {
      *(_DWORD *)(v2 + 776) = 4;
      -[__NSCFURLLocalStreamTask _onqueue_unscheduleStreams](*(__CFWriteStream **)(a1 + 32));
      uint64_t v7 = *(void *)(a1 + 32);
      if (*(void *)(v7 + 792))
      {
        CFReadStreamSetProperty(*(CFReadStreamRef *)(v7 + 792), (CFStreamPropertyKey)&unk_1EC09F398, 0);
        CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 792));
        *(void *)(*(void *)(a1 + 32) + 792) = 0;
        uint64_t v7 = *(void *)(a1 + 32);
      }
      if (*(void *)(v7 + 800))
      {
        CFRelease(*(CFTypeRef *)(v7 + 800));
        *(void *)(*(void *)(a1 + 32) + 800) = 0;
        uint64_t v7 = *(void *)(a1 + 32);
      }
      -[__NSCFURLLocalStreamTask _onqueue_checkForCompletion](v7);
    }
  }
  else
  {
    -[__NSCFURLLocalStreamTask _onqueue_scheduleStreams]((void *)v2);
    uint64_t v5 = *(void *)(a1 + 32);
    [(__NSCFURLLocalStreamTask *)v5 _onqueue_ioTick];
  }
}

uint64_t __34____NSCFURLLocalStreamTask_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_resume");
}

void __34____NSCFURLLocalStreamTask_resume__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t __35____NSCFURLLocalStreamTask_suspend__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (!result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __35____NSCFURLLocalStreamTask_suspend__block_invoke_2;
    v4[3] = &unk_1E5258228;
    v4[4] = v3;
    if (v3) {
      return objc_msgSend(*(id *)(v3 + 808), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v4, (uint64_t)"suspend"));
    }
  }
  return result;
}

void __35____NSCFURLLocalStreamTask_suspend__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

__CFWriteStream *__35____NSCFURLLocalStreamTask_suspend__block_invoke_2(uint64_t a1)
{
  uint64_t result = (__CFWriteStream *)[*(id *)(a1 + 32) state];
  if (!result)
  {
    [*(id *)(a1 + 32) setState:1];
    uint64_t v3 = *(__CFWriteStream **)(a1 + 32);
    return -[__NSCFURLLocalStreamTask _onqueue_unscheduleStreams](v3);
  }
  return result;
}

void __55____NSCFURLLocalStreamTask__copySocketStreamProperties__block_invoke(uint64_t a1, const void *a2, const void *a3)
{
}

void __51____NSCFURLLocalStreamTask__init_setupTimeoutTimer__block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));

  [(__NSCFURLLocalStreamTask *)(uint64_t)Weak _onqueue_ioTick];
}

void __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke_2;
  block[3] = &unk_1E5258228;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __69____NSCFURLLocalStreamTask__onqueue_readStream_writeStreamAvailable___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1120) = 1;
  [(__NSCFURLLocalStreamTask *)*(void *)(a1 + 32) _onqueue_ioTick];
}

void __70____NSCFURLLocalStreamTask__onqueue_needClientCert_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70____NSCFURLLocalStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2;
  block[3] = &unk_1E52573C8;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v7;
  uint64_t v12 = a2;
  dispatch_async(v6, block);
}

void __70____NSCFURLLocalStreamTask__onqueue_needClientCert_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[4];
  if (v1)
  {
    uint64_t v3 = a1[7];
    uint64_t v2 = a1[8];
    if ((unint64_t)(v2 - 2) < 2)
    {
      (*(void (**)(void, void))(v3 + 16))(a1[7], 0);
      -[__NSCFURLLocalStreamTask _onqueue_cancel](v1);
    }
    else
    {
      if (v2 == 1) {
        goto LABEL_19;
      }
      if (v2) {
        return;
      }
      uint64_t v4 = (void *)a1[6];
      if (!v4) {
        goto LABEL_19;
      }
      uint64_t v5 = [v4 _CFURLCredential];
      if (!v5) {
        goto LABEL_19;
      }
      uint64_t v6 = v5;
      if (URLCredential::Class(void)::sOnce_URLCredential != -1) {
        dispatch_once(&URLCredential::Class(void)::sOnce_URLCredential, &__block_literal_global_10148);
      }
      if (*(_DWORD *)(v6 + 48) == 3
        && (uint64_t v7 = v6 + 16, (v8 = (*(uint64_t (**)(uint64_t))(*(void *)(v6 + 16) + 120))(v6 + 16)) != 0))
      {
        long long v9 = (const void *)v8;
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
        CFArrayAppendValue(Mutable, v9);
        CFArrayRef v11 = (const __CFArray *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 112))(v7);
        if (v11)
        {
          CFArrayRef v12 = v11;
          if (CFArrayGetCount(v11) >= 1)
          {
            CFContainerEnumeratorBase::setup((unint64_t)v15, v12, MEMORY[0x1E4F1C1E0], (uint64_t (*)(CFTypeRef, unint64_t))CFContainerEnumeratorBase::_claimArrayData);
            uint64_t v18 = 0;
            while (1)
            {
              uint64_t v13 = v18;
              if (v18 >= v16) {
                break;
              }
              ++v18;
              CFArrayAppendValue(Mutable, *(const void **)(v17 + 8 * v13));
            }
            CFContainerEnumeratorBase::~CFContainerEnumeratorBase((CFContainerEnumeratorBase *)v15);
          }
        }
        (*(void (**)(uint64_t, __CFArray *))(v3 + 16))(v3, Mutable);
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
      else
      {
LABEL_19:
        uint64_t v14 = *(void (**)(uint64_t, void))(v3 + 16);
        v14(v3, 0);
      }
    }
  }
}

void __71____NSCFURLLocalStreamTask__onqueue_needServerTrust_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71____NSCFURLLocalStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2;
  block[3] = &unk_1E52573C8;
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v7;
  uint64_t v12 = a2;
  dispatch_async(v6, block);
}

uint64_t __71____NSCFURLLocalStreamTask__onqueue_needServerTrust_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = *(void *)(result + 56);
    uint64_t v3 = *(void *)(v2 + 64);
    if ((unint64_t)(v3 - 2) < 2)
    {
      (*(void (**)(uint64_t, uint64_t))(result + 16))(result, 2);
      return -[__NSCFURLLocalStreamTask _onqueue_cancel](v1);
    }
    else
    {
      if (v3 == 1)
      {
        uint64_t v4 = *(uint64_t (**)(void))(result + 16);
      }
      else
      {
        if (v3) {
          return result;
        }
        uint64_t v4 = *(uint64_t (**)(void))(result + 16);
      }
      return v4();
    }
  }
  return result;
}

@end