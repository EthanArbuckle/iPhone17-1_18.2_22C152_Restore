@interface CNObservableContractTerminationContext
+ (id)currentContext;
+ (unint64_t)currentThreadId;
- (CNObservableContractTerminationContext)initWithCallStack:(id)a3 threadId:(unint64_t)a4;
- (NSArray)callStack;
- (unint64_t)threadId;
@end

@implementation CNObservableContractTerminationContext

- (void).cxx_destruct
{
}

+ (id)currentContext
{
  v3 = [MEMORY[0x1E4F29060] callStackSymbols];
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithCallStack:threadId:", v3, objc_msgSend(a1, "currentThreadId"));

  return v4;
}

- (CNObservableContractTerminationContext)initWithCallStack:(id)a3 threadId:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNObservableContractTerminationContext;
  v7 = [(CNObservableContractTerminationContext *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    callStack = v7->_callStack;
    v7->_callStack = (NSArray *)v8;

    v7->_threadId = a4;
    v10 = v7;
  }

  return v7;
}

+ (unint64_t)currentThreadId
{
  __uint64_t v4 = 0;
  if (!pthread_threadid_np(0, &v4)) {
    return v4;
  }
  v2 = pthread_self();
  return pthread_mach_thread_np(v2);
}

- (NSArray)callStack
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)threadId
{
  return self->_threadId;
}

@end