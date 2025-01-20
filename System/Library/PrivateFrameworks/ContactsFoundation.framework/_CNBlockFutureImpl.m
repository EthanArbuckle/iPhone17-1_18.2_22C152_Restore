@interface _CNBlockFutureImpl
+ (id)implWithBlock:(id)a3;
+ (id)implWithSchedulerProvider:(id)a3 block:(id)a4;
+ (id)lazyImplWithBlock:(id)a3;
+ (id)lazyImplWithSchedulerProvider:(id)a3 block:(id)a4;
+ (id)log;
- (BOOL)_nts_isFinished;
- (BOOL)cancel;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (BOOL)nts_isFinished;
- (BOOL)nts_mayResumeQueue;
- (BOOL)workBlockScheduled;
- (CNSuspendableSchedulerDecorator)blockScheduler;
- (NSConditionLock)stateLock;
- (_CNBlockFutureImpl)init;
- (_CNBlockFutureImpl)initWithSchedulerProvider:(id)a3;
- (id)futureResult;
- (id)futureResultFromAsynchronousLookupBeforeDate:(id)a3 error:(id *)a4;
- (id)futureResultFromImmediateLookup;
- (id)resultBeforeDate:(id)a3 error:(id *)a4;
- (void)_flushCompletionBlocks;
- (void)addFailureBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)addWriterBlock:(id)a3;
- (void)dealloc;
- (void)implicitlyResumeQueue;
- (void)nts_resumeQueue;
- (void)resumeQueue;
- (void)setWorkBlockScheduled:(BOOL)a3;
- (void)updateDescriptionWithBuilder:(id)a3;
@end

@implementation _CNBlockFutureImpl

- (BOOL)workBlockScheduled
{
  return self->_workBlockScheduled;
}

- (void)nts_resumeQueue
{
  if (self->_queueSuspended)
  {
    self->_queueSuspended = 0;
    [(CNSuspendableSchedulerDecorator *)self->_blockScheduler resume];
  }
}

- (void)dealloc
{
  [(_CNBlockFutureImpl *)self resumeQueue];
  v3.receiver = self;
  v3.super_class = (Class)_CNBlockFutureImpl;
  [(_CNBlockFutureImpl *)&v3 dealloc];
}

- (void)resumeQueue
{
  objc_super v3 = [(_CNBlockFutureImpl *)self stateLock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33___CNBlockFutureImpl_resumeQueue__block_invoke;
  v4[3] = &unk_1E569F9D8;
  v4[4] = self;
  CNRunWithLock(v3, v4);
}

- (void)addFailureBlock:(id)a3
{
  id v4 = a3;
  [(_CNBlockFutureImpl *)self implicitlyResumeQueue];
  objc_initWeak(&location, self);
  v5 = [(_CNBlockFutureImpl *)self blockScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___CNBlockFutureImpl_addFailureBlock___block_invoke;
  v7[3] = &unk_1E56A0FD0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (_CNBlockFutureImpl)initWithSchedulerProvider:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_CNBlockFutureImpl;
  v5 = [(_CNBlockFutureImpl *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v5->_stateLock;
    v5->_stateLock = (NSConditionLock *)v6;

    [(NSConditionLock *)v5->_stateLock setName:@"CNFuture state lock"];
    id v8 = objc_alloc_init(CNFutureResult);
    futureResult = v5->_futureResult;
    v5->_futureResult = v8;

    v10 = [v4 immediateScheduler];
    uint64_t v11 = +[CNSuspendableSchedulerDecorator suspendedSchedulerWithScheduler:v10];
    blockScheduler = v5->_blockScheduler;
    v5->_blockScheduler = (CNSuspendableSchedulerDecorator *)v11;

    v5->_queueSuspended = 1;
    v13 = v5;
  }

  return v5;
}

- (id)resultBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(_CNBlockFutureImpl *)self implicitlyResumeQueue];
  if ([(_CNBlockFutureImpl *)self isFinished])
  {
    v7 = [(_CNBlockFutureImpl *)self futureResultFromImmediateLookup];
LABEL_4:
    id v8 = [v7 result];
    id v9 = [v7 error];
    v10 = +[CNFoundationError ifResultIsNil:v8 setOutputError:a4 toError:v9];

    goto LABEL_6;
  }
  v7 = [(_CNBlockFutureImpl *)self futureResultFromAsynchronousLookupBeforeDate:v6 error:a4];
  if (v7) {
    goto LABEL_4;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  [(_CNBlockFutureImpl *)self implicitlyResumeQueue];
  objc_initWeak(&location, self);
  v5 = [(_CNBlockFutureImpl *)self blockScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___CNBlockFutureImpl_addSuccessBlock___block_invoke;
  v7[3] = &unk_1E56A0FD0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)implicitlyResumeQueue
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  objc_super v3 = [(_CNBlockFutureImpl *)self stateLock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43___CNBlockFutureImpl_implicitlyResumeQueue__block_invoke;
  v4[3] = &unk_1E56A0FA8;
  v4[4] = self;
  void v4[5] = &v5;
  CNRunWithLock(v3, v4);

  if (*((unsigned char *)v6 + 24)) {
    [(CNSuspendableSchedulerDecorator *)self->_blockScheduler resume];
  }
  _Block_object_dispose(&v5, 8);
}

- (CNSuspendableSchedulerDecorator)blockScheduler
{
  return self->_blockScheduler;
}

- (id)futureResult
{
  objc_super v3 = [(_CNBlockFutureImpl *)self stateLock];
  [v3 lock];

  id v4 = (void *)[(CNFutureResult *)self->_futureResult copy];
  uint64_t v5 = [(_CNBlockFutureImpl *)self stateLock];
  [v5 unlock];

  return v4;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[CNObservableContractEnforcement shouldSwizzleNilResults])
  {
    BOOL v8 = ((unint64_t)v6 | (unint64_t)v7) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    BOOL v9 = v6 != 0;
    BOOL v10 = v7 != 0;
    if ((v9 ^ v10))
    {
LABEL_27:
      v13 = v6;
      goto LABEL_28;
    }
LABEL_13:
    v14 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_CNBlockFutureImpl finishWithResult:error:].cold.4();
    }

    objc_super v15 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_CNBlockFutureImpl finishWithResult:error:]();
    }

    v16 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_CNBlockFutureImpl finishWithResult:error:]();
    }

    v17 = +[CNObservable os_log_protocol];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_CNBlockFutureImpl finishWithResult:error:](v17);
    }

    v18 = CNObserverProtocolExceptionNullMarker[0];
    v28[0] = CNObserverProtocolExceptionResultKey[0];
    v28[1] = CNObserverProtocolExceptionErrorKey[0];
    if (v9) {
      v19 = (__CFString *)v6;
    }
    else {
      v19 = CNObserverProtocolExceptionNullMarker[0];
    }
    if (v10) {
      v18 = (__CFString *)v7;
    }
    v29[0] = v19;
    v29[1] = v18;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
    CNFutureThrowProtocolExceptionWithReason(@"Either the result or error must be non-nil", v20);

    goto LABEL_27;
  }
  uint64_t v11 = +[CNObservable os_log_protocol];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[_CNBlockFutureImpl finishWithResult:error:].cold.6();
  }

  v12 = +[CNObservable os_log_protocol];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[_CNBlockFutureImpl finishWithResult:error:](v12);
  }

  v13 = [MEMORY[0x1E4F1CA98] null];
  if (!v13)
  {
    BOOL v10 = 0;
    BOOL v9 = 0;
    goto LABEL_13;
  }
LABEL_28:
  v21 = [(_CNBlockFutureImpl *)self stateLock];
  [v21 lock];

  v22 = [(_CNBlockFutureImpl *)self stateLock];
  uint64_t v23 = [v22 condition];

  if (v23 == 1)
  {
    v26 = [(_CNBlockFutureImpl *)self stateLock];
    [v26 unlock];
  }
  else
  {
    [(CNFutureResult *)self->_futureResult setResult:v13 error:v7];
    BOOL v24 = [(_CNBlockFutureImpl *)self nts_mayResumeQueue];
    v25 = [(_CNBlockFutureImpl *)self stateLock];
    [v25 unlockWithCondition:1];

    if (v24) {
      [(CNSuspendableSchedulerDecorator *)self->_blockScheduler resume];
    }
  }

  return v23 != 1;
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (BOOL)nts_mayResumeQueue
{
  BOOL queueSuspended = self->_queueSuspended;
  self->_BOOL queueSuspended = 0;
  return queueSuspended;
}

- (BOOL)isFinished
{
  objc_super v3 = [(_CNBlockFutureImpl *)self stateLock];
  [v3 lock];

  LOBYTE(v3) = [(_CNBlockFutureImpl *)self _nts_isFinished];
  id v4 = [(_CNBlockFutureImpl *)self stateLock];
  [v4 unlock];

  return (char)v3;
}

- (id)futureResultFromImmediateLookup
{
  v2 = (void *)[(CNFutureResult *)self->_futureResult copy];

  return v2;
}

- (BOOL)_nts_isFinished
{
  v2 = [(_CNBlockFutureImpl *)self stateLock];
  BOOL v3 = [v2 condition] == 1;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockScheduler, 0);
  objc_storeStrong((id *)&self->_futureResult, 0);

  objc_storeStrong((id *)&self->_stateLock, 0);
}

+ (id)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_38);
  }
  v2 = (void *)log_cn_once_object_1;

  return v2;
}

+ (id)implWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 implWithSchedulerProvider:v5 block:v4];

  return v6;
}

+ (id)implWithSchedulerProvider:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)[objc_alloc((Class)a1) initWithSchedulerProvider:v7];

  [v8 resumeQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___CNBlockFutureImpl_implWithSchedulerProvider_block___block_invoke;
  v14[3] = &unk_1E569F468;
  id v16 = v6;
  id v9 = v8;
  id v15 = v9;
  id v10 = v6;
  [v9 addWriterBlock:v14];
  uint64_t v11 = v15;
  id v12 = v9;

  return v12;
}

+ (id)lazyImplWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CNSchedulerProvider defaultProvider];
  id v6 = [a1 lazyImplWithSchedulerProvider:v5 block:v4];

  return v6;
}

+ (id)lazyImplWithSchedulerProvider:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)[objc_alloc((Class)a1) initWithSchedulerProvider:v6];
  objc_initWeak(&location, v8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58___CNBlockFutureImpl_lazyImplWithSchedulerProvider_block___block_invoke;
  v11[3] = &unk_1E56A0F80;
  id v9 = v7;
  id v12 = v9;
  objc_copyWeak(&v13, &location);
  [v8 addWriterBlock:v11];
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);

  return v8;
}

- (_CNBlockFutureImpl)init
{
  BOOL v3 = +[CNSchedulerProvider defaultProvider];
  id v4 = [(_CNBlockFutureImpl *)self initWithSchedulerProvider:v3];

  return v4;
}

- (void)updateDescriptionWithBuilder:(id)a3
{
  id v13 = a3;
  id v4 = [(_CNBlockFutureImpl *)self stateLock];
  int v5 = [v4 tryLock];

  if (v5)
  {
    id v6 = [(_CNBlockFutureImpl *)self stateLock];
    uint64_t v7 = [v6 condition];

    if (v7) {
      BOOL v8 = @"finished";
    }
    else {
      BOOL v8 = @"ready";
    }
    id v9 = (id)[v13 appendName:@"state" object:v8];
    id v10 = [(_CNBlockFutureImpl *)self stateLock];
    [v10 unlock];
  }
  else
  {
    id v11 = (id)[v13 appendName:@"state" object:@"locked"];
  }
  id v12 = (id)[v13 appendName:@"result" object:self->_futureResult];
}

- (void)addWriterBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [(_CNBlockFutureImpl *)self blockScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37___CNBlockFutureImpl_addWriterBlock___block_invoke;
  v7[3] = &unk_1E56A0FD0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];

  [(_CNBlockFutureImpl *)self setWorkBlockScheduled:1];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)futureResultFromAsynchronousLookupBeforeDate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  id v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke;
  block[3] = &unk_1E56A0FF8;
  objc_copyWeak(&v26, &location);
  id v8 = v7;
  v22 = v8;
  BOOL v24 = &v28;
  id v9 = v6;
  id v23 = v9;
  v25 = &v32;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
  id v11 = [(_CNBlockFutureImpl *)self blockScheduler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73___CNBlockFutureImpl_futureResultFromAsynchronousLookupBeforeDate_error___block_invoke_26;
  v19[3] = &unk_1E56A00D8;
  id v12 = v10;
  id v20 = v12;
  [v11 performBlock:v19];

  [v9 timeIntervalSinceNow];
  if (v13 <= 1000000000.0) {
    dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
  }
  else {
    dispatch_time_t v14 = -1;
  }
  if (dispatch_group_wait(v8, v14) || !*((unsigned char *)v29 + 24))
  {
    id v15 = +[CNFoundationError timeoutError];
    id v16 = v15;
    if (a4) {
      *a4 = v15;
    }

    id v17 = 0;
  }
  else
  {
    id v17 = (id)v33[5];
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (BOOL)isCancelled
{
  BOOL v3 = [(_CNBlockFutureImpl *)self stateLock];
  [v3 lock];

  if ([(_CNBlockFutureImpl *)self nts_isFinished])
  {
    id v4 = [(CNFutureResult *)self->_futureResult error];
    BOOL v5 = +[CNFoundationError isCanceledError:v4];
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = [(_CNBlockFutureImpl *)self stateLock];
  [v6 unlock];

  return v5;
}

- (BOOL)nts_isFinished
{
  v2 = [(_CNBlockFutureImpl *)self stateLock];
  BOOL v3 = [v2 condition] == 1;

  return v3;
}

- (BOOL)cancel
{
  BOOL v3 = [(_CNBlockFutureImpl *)self stateLock];
  [v3 lock];

  id v4 = [(_CNBlockFutureImpl *)self stateLock];
  uint64_t v5 = [v4 condition];

  if (v5 == 1)
  {
    id v8 = [(_CNBlockFutureImpl *)self stateLock];
    [v8 unlock];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    [(CNFutureResult *)self->_futureResult setError:v6];

    LODWORD(v6) = [(_CNBlockFutureImpl *)self nts_mayResumeQueue];
    uint64_t v7 = [(_CNBlockFutureImpl *)self stateLock];
    [v7 unlockWithCondition:1];

    if (v6) {
      [(CNSuspendableSchedulerDecorator *)self->_blockScheduler resume];
    }
  }
  return v5 != 1;
}

- (void)_flushCompletionBlocks
{
  id v2 = [(_CNBlockFutureImpl *)self blockScheduler];
  [v2 performBlock:&__block_literal_global_36_0];
}

- (void)setWorkBlockScheduled:(BOOL)a3
{
  self->_workBlockScheduled = a3;
}

- (void)finishWithResult:(NSObject *)a1 error:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_19091D000, a1, v3, "Call stack: %{public}@", v4);
}

- (void)finishWithResult:error:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_19091D000, v0, v1, "Error : %{public}@", v2);
}

- (void)finishWithResult:error:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_1(&dword_19091D000, v0, v1, "Result: %{public}@", v2);
}

- (void)finishWithResult:error:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_19091D000, v0, OS_LOG_TYPE_ERROR, "A promise was finished incorrectly", v1, 2u);
}

- (void)finishWithResult:error:.cold.6()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_19091D000, v0, OS_LOG_TYPE_ERROR, "Swizzling a nil result", v1, 2u);
}

@end