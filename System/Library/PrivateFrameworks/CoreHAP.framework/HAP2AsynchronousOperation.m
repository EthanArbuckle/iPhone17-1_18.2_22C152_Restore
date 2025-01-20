@interface HAP2AsynchronousOperation
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (HAP2AsynchronousOperation)init;
- (HAP2AsynchronousOperation)initWithName:(id)a3;
- (HAP2AsynchronousOperation)initWithName:(id)a3 optionalActivity:(id)a4;
- (HMFActivity)activity;
- (NSError)error;
- (void)_setFinalStateWithError:(int)a3 cancelled:;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)main;
- (void)start;
@end

@implementation HAP2AsynchronousOperation

- (void)finish
{
}

- (void)_setFinalStateWithError:(int)a3 cancelled:
{
  id v5 = a2;
  if (a1)
  {
    [a1 willChangeValueForKey:@"isExecuting"];
    [a1 willChangeValueForKey:@"isFinished"];
    if (v5) {
      [a1 willChangeValueForKey:@"isCancelled"];
    }
    v6 = (void *)a1[34];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __63__HAP2AsynchronousOperation__setFinalStateWithError_cancelled___block_invoke;
    v15 = &unk_1E69F2938;
    v16 = a1;
    char v18 = a3;
    id v7 = v5;
    id v17 = v7;
    [v6 performWritingBlock:&v12];
    if (v5) {
      [a1 didChangeValueForKey:@"isCancelled"];
    }
    [a1 didChangeValueForKey:@"isFinished"];
    [a1 didChangeValueForKey:@"isExecuting"];
    v8 = [a1 activity];
    v9 = v8;
    if (a3)
    {
      v10 = @"Canceled";
    }
    else
    {
      if (v5)
      {
        [v8 markWithFormat:@"Finished with error: %@", v7, v12, v13, v14, v15, v16];
LABEL_12:

        v11 = [a1 activity];
        [v11 invalidate];

        goto LABEL_13;
      }
      v10 = @"Finished";
    }
    [v8 markWithReason:v10];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)start
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__9503;
  v19 = __Block_byref_object_dispose__9504;
  id v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [(HAP2AsynchronousOperation *)self willChangeValueForKey:@"isExecuting"];
  [(HAP2AsynchronousOperation *)self willChangeValueForKey:@"isFinished"];
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v4 = propertyLock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__HAP2AsynchronousOperation_start__block_invoke;
  v10[3] = &unk_1E69F1DE8;
  v10[4] = self;
  v10[5] = &v15;
  v10[6] = &v11;
  [(HAP2PropertyLock *)v4 performWritingBlock:v10];

  [(HAP2AsynchronousOperation *)self didChangeValueForKey:@"isExecuting"];
  [(HAP2AsynchronousOperation *)self didChangeValueForKey:@"isFinished"];
  id v5 = (void *)v16[5];
  if (v5) {
    objc_exception_throw(v5);
  }
  if (*((unsigned char *)v12 + 24))
  {
    v6 = [(HAP2AsynchronousOperation *)self activity];
    [v6 begin];
    v9 = [(HAP2AsynchronousOperation *)self activity];

    id v7 = [(HAP2AsynchronousOperation *)self activity];
    [v7 markWithReason:@"Started"];

    v8 = (void *)MEMORY[0x1D944E080]();
    [(HAP2AsynchronousOperation *)self main];
    __HMFActivityScopeLeave();
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

- (HMFActivity)activity
{
  return self->_activity;
}

- (BOOL)isExecuting
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  char v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HAP2AsynchronousOperation_isExecuting__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isFinished
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  char v11 = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HAP2AsynchronousOperation_isFinished__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__HAP2AsynchronousOperation_isFinished__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 249);
  return result;
}

uint64_t __40__HAP2AsynchronousOperation_isExecuting__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 248);
  return result;
}

void __63__HAP2AsynchronousOperation__setFinalStateWithError_cancelled___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 249))
  {
    if (*(unsigned char *)(a1 + 48))
    {
      *(unsigned char *)(v1 + 250) = 1;
      uint64_t v1 = *(void *)(a1 + 32);
    }
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_storeStrong((id *)(v1 + 256), v3);
      uint64_t v1 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v1 + 248))
    {
      *(unsigned char *)(v1 + 248) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 249) = 1;
    }
  }
}

uint64_t __34__HAP2AsynchronousOperation_start__block_invoke(void *a1)
{
  v2 = (unsigned char *)a1[4];
  if (v2[248])
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    char v5 = @"Operation is already executing.";
LABEL_10:
    *(void *)(*(void *)(a1[5] + 8) + 40) = [v3 exceptionWithName:v4 reason:v5 userInfo:0];
    return MEMORY[0x1F41817F8]();
  }
  uint64_t result = [v2 isReady];
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v4 = *MEMORY[0x1E4F1C3C8];
    char v5 = @"Operation is not ready.";
    goto LABEL_10;
  }
  id v7 = (unsigned char *)a1[4];
  if (v7[250])
  {
    v7[249] = 1;
    id v7 = (unsigned char *)a1[4];
  }
  if (!v7[249])
  {
    v7[248] = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (HAP2AsynchronousOperation)initWithName:(id)a3 optionalActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAP2AsynchronousOperation;
  uint64_t v8 = [(HAP2AsynchronousOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = +[HAP2PropertyLock lockWithName:@"HAP2AsynchronousOperation.propertyLock"];
    propertyLock = v8->_propertyLock;
    v8->_propertyLock = (HAP2PropertyLock *)v9;

    if (!v7) {
      id v7 = (id)[objc_alloc(MEMORY[0x1E4F653F0]) initWithName:v6 parent:0 options:16];
    }
    objc_storeStrong((id *)&v8->_activity, v7);
    [(HAP2AsynchronousOperation *)v8 setName:v6];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"executing"] & 1) != 0
    || ([v4 isEqualToString:@"finished"] & 1) != 0
    || ([v4 isEqualToString:@"cancelled"] & 1) != 0
    || ([v4 isEqualToString:@"isExecuting"] & 1) != 0
    || ([v4 isEqualToString:@"isFinished"] & 1) != 0
    || ([v4 isEqualToString:@"isCancelled"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___HAP2AsynchronousOperation;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)finishWithError:(id)a3
{
}

- (void)cancelWithError:(id)a3
{
}

- (void)cancel
{
  id v3 = [MEMORY[0x1E4F28C58] hapErrorWithCode:2];
  [(HAP2AsynchronousOperation *)self cancelWithError:v3];
}

- (void)main
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  unsigned __int8 v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (NSError)error
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__9503;
  objc_super v12 = __Block_byref_object_dispose__9504;
  id v13 = 0;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__HAP2AsynchronousOperation_error__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSError *)v5;
}

void __34__HAP2AsynchronousOperation_error__block_invoke(uint64_t a1)
{
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isCancelled
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  char v11 = 0;
  id v4 = propertyLock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HAP2AsynchronousOperation_isCancelled__block_invoke;
  v7[3] = &unk_1E69F44F0;
  v7[4] = self;
  v7[5] = &v8;
  [(HAP2PropertyLock *)v4 performReadingBlock:v7];

  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __40__HAP2AsynchronousOperation_isCancelled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 250);
  return result;
}

- (HAP2AsynchronousOperation)initWithName:(id)a3
{
  return [(HAP2AsynchronousOperation *)self initWithName:a3 optionalActivity:0];
}

- (HAP2AsynchronousOperation)init
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  char v5 = [(HAP2AsynchronousOperation *)self initWithName:v4];

  return v5;
}

@end