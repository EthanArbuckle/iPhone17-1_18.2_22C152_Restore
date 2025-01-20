@interface CLRunLoopSiloThread
- (BOOL)shouldCancelThread;
- (CLRunLoopSiloThread)init;
- (CLRunLoopSiloThread)initWithCurrentThread;
- (CLRunLoopSiloThread)initWithRunLoop:(__CFRunLoop *)a3;
- (NSRunLoop)underlyingRunLoop;
- (NSThread)underlyingThread;
- (_opaque_pthread_t)threadId;
- (void)dealloc;
@end

@implementation CLRunLoopSiloThread

- (NSRunLoop)underlyingRunLoop
{
  return self->_underlyingRunLoop;
}

- (CLRunLoopSiloThread)initWithCurrentThread
{
  v8.receiver = self;
  v8.super_class = (Class)CLRunLoopSiloThread;
  v2 = [(CLRunLoopSiloThread *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29060] currentThread];
    underlyingThread = v2->_underlyingThread;
    v2->_underlyingThread = (NSThread *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    underlyingRunLoop = v2->_underlyingRunLoop;
    v2->_underlyingRunLoop = (NSRunLoop *)v5;

    v2->_threadId = pthread_self();
    v2->_shouldCancelThread = 0;
  }
  return v2;
}

- (CLRunLoopSiloThread)init
{
  v20.receiver = self;
  v20.super_class = (Class)CLRunLoopSiloThread;
  v2 = [(CLRunLoopSiloThread *)&v20 init];
  if (!v2) {
    goto LABEL_11;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1A4555DF8;
  v18 = sub_1A4555E08;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  id v3 = objc_alloc(MEMORY[0x1E4F29060]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4555E10;
  v11[3] = &unk_1E5B3E8F8;
  v2 = v2;
  v12 = v2;
  v13 = &v14;
  uint64_t v4 = [v3 initWithBlock:v11];
  underlyingThread = v2->_underlyingThread;
  v2->_underlyingThread = (NSThread *)v4;

  [(NSThread *)v2->_underlyingThread start];
  intptr_t v6 = dispatch_semaphore_wait((dispatch_semaphore_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  if (v6)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
    }
    v7 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "CLRunLoopSilo initialization timed out", v10, 2u);
    }

    v2 = 0;
  }
  else
  {
    v2->_shouldCancelThread = 1;
  }

  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    objc_super v8 = 0;
  }
  else
  {
LABEL_11:
    v2 = v2;
    objc_super v8 = v2;
  }

  return v8;
}

- (CLRunLoopSiloThread)initWithRunLoop:(__CFRunLoop *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CLRunLoopSiloThread;
  uint64_t v4 = [(CLRunLoopSiloThread *)&v20 init];
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_1A4555DF8;
  v18 = sub_1A4555E08;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  uint64_t v5 = (const void *)*MEMORY[0x1E4F1D410];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A45560BC;
  block[3] = &unk_1E5B3E8F8;
  uint64_t v4 = v4;
  v12 = v4;
  v13 = &v14;
  CFRunLoopPerformBlock(a3, v5, block);
  intptr_t v6 = dispatch_semaphore_wait((dispatch_semaphore_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  if (v6)
  {
    if (qword_1EB30CE70 != -1) {
      dispatch_once(&qword_1EB30CE70, &unk_1EF7F4F00);
    }
    v7 = qword_1EB30CE68;
    if (os_log_type_enabled((os_log_t)qword_1EB30CE68, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A4540000, v7, OS_LOG_TYPE_FAULT, "CLRunLoopSilo initialization timed out", v10, 2u);
    }

    uint64_t v4 = 0;
  }
  else
  {
    v4->_shouldCancelThread = 0;
  }

  _Block_object_dispose(&v14, 8);
  if (v6)
  {
    objc_super v8 = 0;
  }
  else
  {
LABEL_11:
    uint64_t v4 = v4;
    objc_super v8 = v4;
  }

  return v8;
}

- (void)dealloc
{
  if (self->_shouldCancelThread)
  {
    CFRunLoopStop([(NSRunLoop *)self->_underlyingRunLoop getCFRunLoop]);
    [(NSThread *)self->_underlyingThread cancel];
  }
  v3.receiver = self;
  v3.super_class = (Class)CLRunLoopSiloThread;
  [(CLRunLoopSiloThread *)&v3 dealloc];
}

- (_opaque_pthread_t)threadId
{
  return self->_threadId;
}

- (NSThread)underlyingThread
{
  return self->_underlyingThread;
}

- (BOOL)shouldCancelThread
{
  return self->_shouldCancelThread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingThread, 0);
  objc_storeStrong((id *)&self->_underlyingRunLoop, 0);
}

@end