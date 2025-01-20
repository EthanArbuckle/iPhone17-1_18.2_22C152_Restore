@interface __NSCFLocalUploadTask
- (BOOL)isKindOfClass:(Class)a3;
- (__NSCFLocalUploadTask)initWithResumeData:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5;
- (id)resumeCallback;
- (void)_onqueue_cancelByProducingResumeData:(id)a3;
- (void)_private_completionAfterMetrics;
- (void)_private_errorCompletionAfterMetrics;
- (void)_private_issueDidFinish;
- (void)_task_onqueue_didFinish;
- (void)cancelByProducingResumeData:(id)a3;
- (void)dealloc;
- (void)setResumeCallback:(id)a3;
@end

@implementation __NSCFLocalUploadTask

- (void)_task_onqueue_didFinish
{
  [(NSURLSessionTask *)self _finishProgressReporting];
  if (self && self->super.super._pendingResponseDisposition)
  {
    self->super.super._pendingResponseDisposition_didFinish = 1;
  }
  else
  {
    -[__CFN_TaskMetrics completeWithError:]((uint64_t)[(NSURLSessionTask *)self _metrics], [(NSURLSessionTask *)self error]);
    if ([(__NSCFLocalSessionTask *)self _needSendingMetrics])
    {
      [(__NSCFLocalSessionTask *)self _didSendMetrics];
      v3 = -[NSURLSessionTaskMetrics initWithMetrics:]((id *)[NSURLSessionTaskMetrics alloc], [(NSURLSessionTask *)self _metrics]);
      -[NSURLSessionTaskMetrics collectWithCompletionHandler:queue:]((uint64_t)v3, &v4, [(NSURLSessionTask *)self workQueue]);
    }
    else
    {
      -[__NSCFLocalUploadTask _private_completionAfterMetrics](self);
    }
  }
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)__NSCFLocalUploadTask;
  if (-[__NSCFLocalDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (void)_private_completionAfterMetrics
{
  if (a1)
  {
    if ([a1 error] && !objc_msgSend(a1, "resumeCallback"))
    {
      -[__NSCFLocalUploadTask _private_errorCompletionAfterMetrics](a1);
    }
    else
    {
      if ([a1 resumeCallback])
      {
        uint64_t v11 = 0;
        id v3 = -[__NSCFResumableUploadState createResumeData:]((void *)[a1 resumableUploadState], &v11);
        if (v11)
        {
          objc_msgSend(a1, "setError:");
          -[__NSCFLocalUploadTask _private_errorCompletionAfterMetrics](a1);
        }
        else
        {
          id v4 = v3;
          objc_super v5 = _Block_copy((const void *)[a1 resumeCallback]);
          [a1 setResumeCallback:0];
          v6 = (void *)[a1 error:*MEMORY[0x1E4F289A0] code:-999];
          v7 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
          objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(v6, "userInfo"));
          if (v4) {
            [v7 setObject:v4 forKey:@"NSURLSessionUploadTaskResumeData"];
          }
          uint64_t v8 = objc_msgSend(MEMORY[0x1E4F290A8], "errorWithDomain:code:userInfo:", objc_msgSend(v6, "domain"), objc_msgSend(v6, "code"), v7);
          uint64_t v9 = [a1 session];
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __56____NSCFLocalUploadTask__private_completionAfterMetrics__block_invoke;
          v10[3] = &unk_1E5258028;
          v10[4] = v4;
          v10[5] = v5;
          -[NSURLSession runDelegateBlock:](v9, v10);
          [a1 setError:v8];
        }
      }
      [(__NSCFLocalUploadTask *)a1 _private_issueDidFinish];
    }
  }
}

- (id)resumeCallback
{
  return objc_getProperty(self, a2, 944, 1);
}

- (void)_private_issueDidFinish
{
  if (objc_getProperty(a1, a2, 784, 1))
  {
    id Property = objc_getProperty(a1, v3, 784, 1);
    objc_super v5 = _Block_copy(Property);
    objc_setProperty_atomic_copy(a1, v6, 0, 784);
    uint64_t v8 = __48____NSCFLocalUploadTask__private_issueDidFinish__block_invoke;
    uint64_t v9 = &unk_1E5258028;
    v10 = a1;
    uint64_t v11 = v5;
    if (objc_msgSend(a1, "_callCompletionHandlerInline", MEMORY[0x1E4F143A8], 3221225472)) {
      v8((uint64_t)&v7);
    }
    else {
      -[NSURLSession runDelegateBlock:]([a1 session], &v7);
    }
  }
  else if ((a1[927] & 1) == 0)
  {
    a1[927] = 1;
    -[NSURLSession _onqueue_didCompleteTask:withError:]([a1 session], a1, objc_msgSend(a1, "error"));
  }
  [a1 setState:3];
  -[__NSURLSessionLocal removeUnresumedTask:]([a1 session], (uint64_t)a1);
}

- (void)setResumeCallback:(id)a3
{
}

- (void)dealloc
{
  [(__NSCFLocalUploadTask *)self setResumeCallback:0];
  v3.receiver = self;
  v3.super_class = (Class)__NSCFLocalUploadTask;
  [(__NSCFLocalSessionTask *)&v3 dealloc];
}

- (__NSCFLocalUploadTask)initWithResumeData:(id)a3 ident:(unint64_t)a4 taskGroup:(id)a5
{
  uint64_t v8 = +[__NSCFResumableUploadState rusWithResumeData:]((uint64_t)__NSCFResumableUploadState, a3);
  if (!v8) {
    return 0;
  }
  v10 = v8;
  if (!objc_getProperty(v8, v9, 32, 1)) {
    return 0;
  }
  id Property = objc_getProperty(v10, v11, 32, 1);
  v16.receiver = self;
  v16.super_class = (Class)__NSCFLocalUploadTask;
  v13 = [(__NSCFLocalSessionTask *)&v16 initWithOriginalRequest:Property ident:a4 taskGroup:a5];
  v14 = v13;
  if (v13) {
    [(NSURLSessionTask *)v13 setResumableUploadState:v10];
  }
  return v14;
}

- (void)cancelByProducingResumeData:(id)a3
{
  objc_super v5 = [(NSURLSessionTask *)self workQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53____NSCFLocalUploadTask_cancelByProducingResumeData___block_invoke;
  v6[3] = &unk_1E5258028;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

- (void)_onqueue_cancelByProducingResumeData:(id)a3
{
  if ([(NSURLSessionTask *)self state] > NSURLSessionTaskStateCanceling)
  {
    SEL v6 = [(NSURLSessionTask *)self session];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_3;
    v8[3] = &unk_1E5257FD8;
    v8[4] = a3;
    -[NSURLSession runDelegateBlock:]((uint64_t)v6, v8);
  }
  else if (*(&self->_startedProducingResumeData + 3))
  {
    if ([(__NSCFLocalUploadTask *)self resumeCallback])
    {
      objc_super v5 = _Block_copy([(__NSCFLocalUploadTask *)self resumeCallback]);
      [(__NSCFLocalUploadTask *)self setResumeCallback:0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke_2;
      v9[3] = &unk_1E5252C28;
      v9[4] = v5;
      v9[5] = a3;
      [(__NSCFLocalUploadTask *)self setResumeCallback:v9];
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62____NSCFLocalUploadTask__onqueue_cancelByProducingResumeData___block_invoke;
      block[3] = &unk_1E5257FD8;
      block[4] = a3;
      dispatch_async(global_queue, block);
    }
  }
  else
  {
    [(__NSCFLocalUploadTask *)self setResumeCallback:a3];
    *(&self->_startedProducingResumeData + 3) = 1;
    v11.receiver = self;
    v11.super_class = (Class)__NSCFLocalUploadTask;
    [(__NSCFLocalSessionTask *)&v11 _onqueue_cancel];
  }
}

- (void)_private_errorCompletionAfterMetrics
{
  v2 = (void *)[a1 error];
  if (v2)
  {
    id v4 = v2;
    objc_super v5 = (void *)[v2 domain];
    if ((([v5 isEqualToString:*MEMORY[0x1E4F289A0]] & 1) != 0
       || [v5 isEqualToString:@"_nsurlsessiondErrorDomain"])
      && [v4 code] != -999)
    {
      SEL v6 = (void *)[v4 userInfo];
      if (!v6 || ![v6 objectForKey:@"NSURLSessionUploadTaskResumeData"])
      {
        id v7 = -[__NSCFResumableUploadState createResumeData:]((void *)[a1 resumableUploadState], 0);
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = objc_msgSend((id)objc_msgSend(a1, "error"), "userInfo");
          if (v9)
          {
            id v10 = (id)[v9 mutableCopy];
            [v10 setObject:v8 forKeyedSubscript:@"NSURLSessionUploadTaskResumeData"];
          }
          else
          {
            id v10 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithObject:v8 forKey:@"NSURLSessionUploadTaskResumeData"];
          }
          objc_msgSend(a1, "setError:", objc_msgSend(MEMORY[0x1E4F290A8], "errorWithDomain:code:userInfo:", objc_msgSend((id)objc_msgSend(a1, "error"), "domain"), objc_msgSend((id)objc_msgSend(a1, "error"), "code"), v10));
        }
      }
    }
  }

  [(__NSCFLocalUploadTask *)a1 _private_issueDidFinish];
}

@end