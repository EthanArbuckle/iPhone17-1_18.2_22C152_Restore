@interface AVOperation
+ (int64_t)statusOfOperations:(id)a3 error:(id *)a4;
+ (void)initialize;
- (AVOperation)init;
- (BOOL)_setStatus:(int64_t)a3 error:(id)a4 resultingStatus:(int64_t *)a5 failureReason:(id *)a6;
- (BOOL)evaluateDependenciesAndMarkAsExecuting;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSError)error;
- (int64_t)status;
- (void)dealloc;
- (void)markAsCancelled;
- (void)markAsCompleted;
- (void)markAsFailedWithError:(id)a3;
@end

@implementation AVOperation

+ (void)initialize
{
}

- (AVOperation)init
{
  uint64_t v4 = objc_opt_class();
  AVRequireConcreteObject(self, a2, v4);
  v7.receiver = self;
  v7.super_class = (Class)AVOperation;
  v5 = [(AVOperation *)&v7 init];
  if (v5) {
    v5->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avoperation.ivars");
  }
  return v5;
}

- (void)dealloc
{
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue) {
    dispatch_release(ivarAccessQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVOperation;
  [(AVOperation *)&v4 dealloc];
}

- (int64_t)status
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__AVOperation_status__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__AVOperation_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 256);
  return result;
}

- (NSError)error
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  uint64_t v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__AVOperation_error__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  int64_t v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__AVOperation_error__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 264) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)evaluateDependenciesAndMarkAsExecuting
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (![(AVOperation *)self _setStatus:1 error:0 resultingStatus:&v25 failureReason:&v24])
  {
    v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@", v4, v5, v6, v7, v8, v24), 0 reason userInfo];
    objc_exception_throw(v18);
  }
  if ([(AVOperation *)self isCancelled]) {
    goto LABEL_15;
  }
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = (void *)[(AVOperation *)self dependencies];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 addObject:v15];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v12);
  }
  uint64_t v19 = 0;
  int64_t v16 = +[AVOperation statusOfOperations:v9 error:&v19];
  if (v16 != 2)
  {
    if (v16 == 4)
    {
      [(AVOperation *)self markAsFailedWithError:v19];
      return [(AVOperation *)self status] == 1;
    }
LABEL_15:
    [(AVOperation *)self markAsCancelled];
  }
  return [(AVOperation *)self status] == 1;
}

- (BOOL)isExecuting
{
  return [(AVOperation *)self status] == 1;
}

- (BOOL)isFinished
{
  return [(AVOperation *)self status] > 1;
}

- (BOOL)isReady
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = (void *)[(AVOperation *)self dependencies];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) isFinished];
      if (!v7) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_setStatus:(int64_t)a3 error:(id)a4 resultingStatus:(int64_t *)a5 failureReason:(id *)a6
{
  if (!a3)
  {
    uint64_t v19 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)"requestedStatus != AVOperationStatusUnknown"), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__11;
  uint64_t v25 = __Block_byref_object_dispose__12;
  uint64_t v26 = 0;
  [(AVOperation *)self willChangeValueForKey:@"isExecuting"];
  [(AVOperation *)self willChangeValueForKey:@"isFinished"];
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__AVOperation__setStatus_error_resultingStatus_failureReason___block_invoke;
  block[3] = &unk_1E57B6548;
  block[6] = &v35;
  block[7] = &v31;
  block[10] = a3;
  block[11] = a6;
  block[4] = self;
  block[5] = a4;
  block[8] = &v27;
  block[9] = &v21;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  int v14 = *((unsigned __int8 *)v36 + 24);
  if (*((unsigned char *)v36 + 24))
  {
    if (*((unsigned char *)v28 + 24))
    {
      uint64_t v15 = v22[5];
      if (v15) {
        (*(void (**)(void))(v15 + 16))();
      }
    }
    [(AVOperation *)self didChangeValueForKey:@"isExecuting"];
    [(AVOperation *)self didChangeValueForKey:@"isFinished"];
    if (*((unsigned char *)v28 + 24)) {
      [(AVOperation *)self didEnterTerminalState];
    }

    int64_t v16 = v36;
    int v14 = *((unsigned __int8 *)v36 + 24);
    if (a5 && *((unsigned char *)v36 + 24))
    {
      *a5 = v32[3];
      int v14 = *((unsigned __int8 *)v16 + 24);
    }
  }
  BOOL v17 = v14 != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v17;
}

__CFString *__62__AVOperation__setStatus_error_resultingStatus_failureReason___block_invoke(__CFString *result)
{
  v1 = result;
  uint64_t v2 = *((void *)result[1].isa + 32);
  uint64_t data = (uint64_t)result[2].data;
  if (v2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = data == 3;
  }
  if (v4)
  {
    uint64_t v2 = 0;
LABEL_18:
    *(void *)(*(void *)(result[1].length + 8) + 24) = v2;
    char v8 = 1;
    goto LABEL_22;
  }
  length = (void *)result[2].length;
  if (v2) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = data <= 1;
  }
  if (!v6)
  {
    uint64_t result = @"Cannot enter a terminal state until the receiver starts executing";
    goto LABEL_20;
  }
  if (v2 < 2 || data > 1)
  {
    if (v2 < 2) {
      uint64_t v2 = (uint64_t)result[2].data;
    }
    goto LABEL_18;
  }
  uint64_t result = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"Cannot regress from a terminal state %d to a non-terminal state %d", v2, data);
LABEL_20:
  char v8 = 0;
  if (length) {
    void *length = result;
  }
LABEL_22:
  *(unsigned char *)(*((void *)v1[1].data + 1) + 24) = v8;
  if (*(unsigned char *)(*((void *)v1[1].data + 1) + 24))
  {
    if (*(void *)(*(void *)(v1[1].length + 8) + 24) != *((void *)v1[1].isa + 32))
    {
      *(unsigned char *)(*((void *)v1[2].isa + 1) + 24) = (uint64_t)v1[2].data > 1;
      uint64_t result = (__CFString *)[(id)v1[1].info copy];
      *((void *)v1[1].isa + 33) = result;
      *((void *)v1[1].isa + 32) = v1[2].data;
      if (*(unsigned char *)(*((void *)v1[2].isa + 1) + 24))
      {
        *(void *)(*(void *)(v1[2].info + 8) + 40) = objc_msgSend((id)objc_msgSend(v1[1].isa, "completionBlock"), "copy");
        isa = v1[1].isa;
        return (__CFString *)[isa setCompletionBlock:0];
      }
    }
  }
  return result;
}

- (void)markAsCompleted
{
  uint64_t v10 = 0;
  if (![(AVOperation *)self _setStatus:2 error:0 resultingStatus:0 failureReason:&v10])
  {
    long long v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@", v4, v5, v6, v7, v8, v10), 0 reason userInfo];
    objc_exception_throw(v9);
  }
}

- (void)markAsFailedWithError:(id)a3
{
  uint64_t v11 = 0;
  if (![(AVOperation *)self _setStatus:4 error:a3 resultingStatus:0 failureReason:&v11])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@", v5, v6, v7, v8, v9, v11), 0 reason userInfo];
    objc_exception_throw(v10);
  }
}

- (void)markAsCancelled
{
  uint64_t v10 = 0;
  if (![(AVOperation *)self _setStatus:3 error:0 resultingStatus:0 failureReason:&v10])
  {
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"%@", v4, v5, v6, v7, v8, v10), 0 reason userInfo];
    objc_exception_throw(v9);
  }
}

+ (int64_t)statusOfOperations:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    int64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    uint64_t v12 = v9;
    while (2)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(a3);
      }
      uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      int64_t result = [v13 status];
      uint64_t v9 = 1;
      switch(result)
      {
        case 1:
          goto LABEL_8;
        case 2:
          char v8 = 1;
          uint64_t v9 = v12;
LABEL_8:
          ++v11;
          uint64_t v12 = v9;
          if (v7 != v11) {
            continue;
          }
          int64_t result = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
          int64_t v7 = result;
          if (result) {
            goto LABEL_3;
          }
          int v15 = 1;
          LOBYTE(v12) = v9;
          if (v8)
          {
LABEL_18:
            if (v12)
            {
              int64_t v16 = 0;
LABEL_20:
              if (v15) {
                return v16;
              }
              return result;
            }
          }
          else
          {
LABEL_11:
            if (v12)
            {
              int64_t v16 = 1;
              goto LABEL_20;
            }
          }
          if (!v15) {
            return result;
          }
          break;
        case 3:
          goto LABEL_17;
        case 4:
          if (a4) {
            *a4 = (id)[v13 error];
          }
          int64_t result = 4;
          goto LABEL_17;
        default:
          int64_t result = 0;
LABEL_17:
          int v15 = 0;
          if (v8) {
            goto LABEL_18;
          }
          goto LABEL_11;
      }
      break;
    }
  }
  return 2;
}

@end