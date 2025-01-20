@interface __NSCFURLLocalStreamTaskFromDataTask
- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 disavow:(id)a4;
- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 inputStream:(id)a4 ouptutStream:(id)a5 disavow:(id)a6;
- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 remainingInputStream:(id)a4 remainingOutputStream:(id)a5 disavow:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_onqueue_ioTickFromDataTaskConversion:(uint64_t)a1;
- (void)_unimp:(uint64_t)a1;
- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4;
- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 alternatePathAvailable:(int)a4;
- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5;
- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5;
- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5;
- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6;
- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6;
- (void)connection:(id)a3 waitingWithReason:(int64_t)a4;
- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6;
- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5;
- (void)dealloc;
@end

@implementation __NSCFURLLocalStreamTaskFromDataTask

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  return self;
}

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
}

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v5 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_184085000, v5, OS_LOG_TYPE_ERROR, "NSURLSessionStreamTask: received streams out of order", v6, 2u);
  }
}

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
}

- (void)_unimp:(uint64_t)a1
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = a2;
      _os_log_fault_impl(&dword_184085000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s should not be called at this point for a stream task that turned into a data task.", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
}

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
}

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:_willSendRequestForEstablishedConnection:completion:]");
  v6 = (void (*)(id, void))*((void *)a5 + 2);

  v6(a5, 0);
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
}

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  if (a4 && dispatch_data_get_size((dispatch_data_t)a4))
  {
    dispatch_retain((dispatch_object_t)a4);
    v8 = [(__NSCFURLLocalStreamTask *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77____NSCFURLLocalStreamTaskFromDataTask_connection_didReceiveData_completion___block_invoke;
    block[3] = &unk_1E52581A0;
    block[5] = self;
    block[6] = a5;
    block[4] = a4;
    dispatch_async(v8, block);
  }
  else
  {
    v9 = (void (*)(id))*((void *)a5 + 2);
    v9(a5);
  }
}

- (void)_onqueue_ioTickFromDataTaskConversion:(uint64_t)a1
{
  if (a1)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78____NSCFURLLocalStreamTaskFromDataTask__onqueue_ioTickFromDataTaskConversion___block_invoke;
    v5[3] = &unk_1E5258228;
    v5[4] = a1;
    objc_msgSend(*(id *)(a1 + 768), "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v5, a2));
    [(__NSCFURLLocalStreamTask *)a1 _onqueue_ioTick];
  }
}

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:challenged:authCallback:]");
  v6 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);

  v6(a5, 2, 0);
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  v6 = [(__NSCFURLLocalStreamTask *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77____NSCFURLLocalStreamTaskFromDataTask_connection_didFinishLoadingWithError___block_invoke;
  v7[3] = &unk_1E5257FB0;
  v7[4] = self;
  v7[5] = a4;
  dispatch_async(v6, v7);
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:didReceiveResponse:completion:]");
  uint64_t v7 = 0;
  long long v6 = xmmword_18430C280;
  (*((void (**)(id, long long *))a5 + 2))(a5, &v6);
}

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:request:needsNewBodyStreamFromOffset:callback:]");
  uint64_t v7 = (void (*)(id, void))*((void *)a6 + 2);

  v7(a6, 0);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:request:needsNewBodyStreamCallback:]");
  long long v6 = (void (*)(id, void))*((void *)a5 + 2);

  v6(a5, 0);
}

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  -[__NSCFURLLocalStreamTaskFromDataTask _unimp:]((uint64_t)self, (uint64_t)"-[__NSCFURLLocalStreamTaskFromDataTask connection:wasRedirected:newRequest:responseCallback:]");
  uint64_t v7 = (void (*)(id, void))*((void *)a6 + 2);

  v7(a6, 0);
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  myWriteToHisReadWork = self->_myWriteToHisReadWork;
  if (myWriteToHisReadWork)
  {
    self->_myWriteToHisReadWork = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v4 = [(NSMutableArray *)myWriteToHisReadWork countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(myWriteToHisReadWork);
          }
          uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v8)
          {
            v9 = *(void (***)(void))(v8 + 16);
            if (v9)
            {
              *(void *)(v8 + 16) = 0;
              v9[2](v9);
              _Block_release(v9);
            }
          }
        }
        uint64_t v5 = [(NSMutableArray *)myWriteToHisReadWork countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
  }
  myReadToHisWrite = self->_myReadToHisWrite;
  self->_myReadToHisWrite = 0;
  if (myReadToHisWrite) {
    CFRelease(myReadToHisWrite);
  }
  myWriteToHisRead = self->_myWriteToHisRead;
  self->_myWriteToHisRead = 0;
  if (myWriteToHisRead) {
    CFRelease(myWriteToHisRead);
  }
  v12.receiver = self;
  v12.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  [(__NSCFURLLocalStreamTask *)&v12 dealloc];
}

- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 inputStream:(id)a4 ouptutStream:(id)a5 disavow:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  uint64_t v8 = [(__NSCFURLLocalStreamTask *)&v12 _initWithExistingTask:a3 disavow:a6];
  v9 = (__NSCFURLLocalStreamTaskFromDataTask *)v8;
  if (v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86____NSCFURLLocalStreamTaskFromDataTask_initWithTask_inputStream_ouptutStream_disavow___block_invoke;
    v11[3] = &unk_1E52582F0;
    v11[4] = v8;
    v11[5] = a4;
    v11[6] = a5;
    objc_msgSend(v8[101], "addObject:", +[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v11, (uint64_t)"init_with_task_with_socket_streams"));
  }
  return v9;
}

- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 remainingInputStream:(id)a4 remainingOutputStream:(id)a5 disavow:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  uint64_t v8 = [(__NSCFURLLocalStreamTask *)&v11 _initWithExistingTask:a3 disavow:a6];
  if (v8)
  {
    v8->_myWriteToHisReadWork = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __104____NSCFURLLocalStreamTaskFromDataTask_initWithTask_remainingInputStream_remainingOutputStream_disavow___block_invoke;
    v10[3] = &unk_1E52582F0;
    v10[4] = a4;
    v10[5] = a5;
    v10[6] = v8;
    [(NSMutableArray *)v8->super._pendingWork addObject:+[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v10, (uint64_t)"init_with_task")];
  }
  return v8;
}

- (__NSCFURLLocalStreamTaskFromDataTask)initWithTask:(id)a3 disavow:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)__NSCFURLLocalStreamTaskFromDataTask;
  uint64_t v4 = [(__NSCFURLLocalStreamTask *)&v7 _initWithExistingTask:a3 disavow:a4];
  if (v4)
  {
    v4->_myWriteToHisReadWork = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61____NSCFURLLocalStreamTaskFromDataTask_initWithTask_disavow___block_invoke;
    v6[3] = &unk_1E5258228;
    v6[4] = v4;
    [(NSMutableArray *)v4->super._pendingWork addObject:+[__NSCFURLLocalStreamTaskWorkBlockOp opWithBlock:description:]((uint64_t)__NSCFURLLocalStreamTaskWorkBlockOp, v6, (uint64_t)"init_with_task")];
  }
  return v4;
}

@end