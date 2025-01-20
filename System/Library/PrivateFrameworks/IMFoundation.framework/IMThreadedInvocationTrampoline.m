@interface IMThreadedInvocationTrampoline
- (IMThreadedInvocationTrampoline)initWithTarget:(id)a3 thread:(id)a4 immediateForMatchingThread:(BOOL)a5;
- (void)forwardInvocation:(id)a3;
@end

@implementation IMThreadedInvocationTrampoline

- (IMThreadedInvocationTrampoline)initWithTarget:(id)a3 thread:(id)a4 immediateForMatchingThread:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IMThreadedInvocationTrampoline;
  v10 = [(IMThreadedInvocationTrampoline *)&v15 init];
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setTarget_(v10, v11, (uint64_t)v8, v12);
    objc_storeStrong((id *)&v13->_thread, a4);
    v13->_immediateForMatchingThread = a5;
  }

  return v13;
}

- (void)forwardInvocation:(id)a3
{
  id v15 = a3;
  objc_msgSend_retainArguments(v15, v4, v5, v6);
  thread = self->_thread;
  if (thread)
  {
    if (self->_immediateForMatchingThread)
    {
      v10 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v7, v8, (uint64_t)thread);
      char isEqual = objc_msgSend_isEqual_(v10, v11, (uint64_t)self->_thread, v12);

      if (isEqual)
      {
        objc_msgSend_performInvocation_(self, v7, (uint64_t)v15, v14);
        goto LABEL_8;
      }
      thread = self->_thread;
    }
    objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)thread, v15, 0);
  }
  else
  {
    objc_msgSend_performSelectorInBackground_withObject_(self, v7, (uint64_t)sel_performInvocation_, (uint64_t)v15);
  }
LABEL_8:
}

- (void).cxx_destruct
{
}

@end