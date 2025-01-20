@interface SGRemoteObjectProxy
+ (id)_copyInvocationToHeapIfNeeded:(id)a3;
- (SGRemoteObjectProxy)initWithConnection:(id)a3 queuesRequestsIfBusy:(BOOL)a4;
- (SGRemoteObjectProxy)initWithInProcessSuggestManager:(id)a3;
- (void)_forwardStackInvocation:(id)a3;
@end

@implementation SGRemoteObjectProxy

uint64_t __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithTarget:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProcessSuggestManager, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_8(void *a1, void *a2)
{
  id v6 = a2;
  (*(void (**)(void))(a1[6] + 16))();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a1[8], a1[4], @"SGSuggestionsService.m", 287, @"Invalid parameter not satisfying: %@", @"[response isKindOfClass:[SGXPCResponse class]]" object file lineNumber description];
  }
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
  id v4 = self;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_6(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  [*(id *)(a1 + 40) lock];
  id v3 = [*(id *)(a1 + 48) firstObject];
  if (v3) {
    [*(id *)(a1 + 48) removeObjectAtIndex:0];
  }
  [*(id *)(a1 + 40) unlock];
  v2 = [v3 target];
  [v3 invokeWithTarget:v2];
}

+ (id)_copyInvocationToHeapIfNeeded:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (malloc_size(v5)) {
    return v5;
  }
  v7 = (void *)MEMORY[0x1A6265250]();
  v8 = [v5 methodSignature];
  v9 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v8];
  v10 = [v5 target];
  [v9 setTarget:v10];

  if ([v8 numberOfArguments])
  {
    size_t v11 = 0;
    if ([v8 numberOfArguments])
    {
      unint64_t v12 = 0;
      NSUInteger v13 = 1;
      do
      {
        sizep[0] = 0;
        NSGetSizeAndAlignment((const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", v12, 0), sizep, alignp);
        if (v11 <= sizep[0]) {
          size_t v11 = sizep[0];
        }
        if (v13 <= alignp[0]) {
          NSUInteger v13 = alignp[0];
        }
        ++v12;
      }
      while (v12 < [v8 numberOfArguments]);
    }
    else
    {
      NSUInteger v13 = 1;
    }
    size_t v14 = v13 - 1 + v11;
    alignp[0] = 0;
    alignp[1] = 0;
    if (v14 >= 0x201)
    {
      if (v13 <= 8) {
        size_t v19 = 8;
      }
      else {
        size_t v19 = v13;
      }
      int v20 = malloc_type_posix_memalign((void **)alignp, v19, v11, 0xD5813BDDuLL);
      LOBYTE(alignp[1]) = 0;
      if (v20)
      {
        id v21 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v21);
      }
    }
    else
    {
      v15 = (char *)alignp - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, v14);
      alignp[0] = (unint64_t)&v15[v13 - 1] / v13 * v13;
      LOBYTE(alignp[1]) = 1;
    }
    *(_OWORD *)sizep = *(_OWORD *)alignp;
    if (objc_msgSend(v8, "numberOfArguments", alignp[0]))
    {
      unint64_t v16 = 0;
      do
      {
        [v5 getArgument:sizep atIndex:v16];
        [v9 setArgument:sizep atIndex:v16++];
      }
      while (v16 < [v8 numberOfArguments]);
    }
    if (!LOBYTE(sizep[1])) {
      free((void *)sizep[0]);
    }
  }
  id v6 = v9;

  if (!malloc_size(v6))
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"SGSuggestionsService.m", 177, @"expected invocation copy %p (%@) to be heap allocated", v6, v6 object file lineNumber description];
  }
  return v6;
}

- (void)_forwardStackInvocation:(id)a3
{
  id v5 = +[SGRemoteObjectProxy _copyInvocationToHeapIfNeeded:a3];
  id v6 = (void *)MEMORY[0x1A6265250]();
  v7 = [v5 target];

  if (v7 == self)
  {
    if (self->_inProcessSuggestManager)
    {
      if (_forwardStackInvocation___pasOnceToken6 != -1) {
        dispatch_once(&_forwardStackInvocation___pasOnceToken6, &__block_literal_global_2157);
      }
      v8 = (id)_forwardStackInvocation___pasExprOnceResult;
      [v5 retainArguments];
      v9 = self->_inProcessSuggestManager;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_2;
      v59[3] = &unk_1E5B8E908;
      id v60 = v5;
      v10 = v9;
      v61 = v10;
      size_t v11 = (void *)MEMORY[0x1A62654A0](v59);
      if (+[SGDaemonConnection usingSyncXPC]) {
        dispatch_sync(v8, v11);
      }
      else {
        dispatch_async(v8, v11);
      }
    }
    else
    {
      unint64_t v12 = self->_connection;
      if (_forwardStackInvocation___pasOnceToken7 != -1) {
        dispatch_once(&_forwardStackInvocation___pasOnceToken7, &__block_literal_global_18);
      }
      id v13 = (id)_forwardStackInvocation___pasExprOnceResult_16;
      if (_forwardStackInvocation___pasOnceToken8 != -1) {
        dispatch_once(&_forwardStackInvocation___pasOnceToken8, &__block_literal_global_21_2159);
      }
      id v14 = (id)_forwardStackInvocation___pasExprOnceResult_19;
      if (_forwardStackInvocation___pasOnceToken9 != -1) {
        dispatch_once(&_forwardStackInvocation___pasOnceToken9, &__block_literal_global_25);
      }
      id v15 = (id)_forwardStackInvocation___pasExprOnceResult_23;
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_6;
      v55[3] = &unk_1E5B8E930;
      id v16 = v13;
      id v56 = v16;
      id v17 = v15;
      id v57 = v17;
      id v18 = v14;
      id v58 = v18;
      size_t v19 = (void (**)(void))MEMORY[0x1A62654A0](v55);
      if (self->_queuesRequestsIfBusy
        && [MEMORY[0x1E4F93B18] waitForSemaphore:v16 timeoutSeconds:0.0] == 1)
      {
        [v5 retainArguments];
        [v17 lock];
        [v18 addObject:v5];
        [v17 unlock];
      }
      else
      {
        id v40 = v18;
        v41 = v12;
        int v20 = v19;
        id v21 = [v5 methodSignature];
        uint64_t v22 = [v21 numberOfArguments];

        id v23 = [v5 methodSignature];
        uint64_t v24 = v22 - 1;
        LODWORD(v22) = strcmp((const char *)[v23 getArgumentTypeAtIndex:v22 - 1], "@?");

        if (v22)
        {
          size_t v19 = v20;
          id v18 = v40;
          unint64_t v12 = v41;
          if (self->_queuesRequestsIfBusy
            || ![MEMORY[0x1E4F93B18] waitForSemaphore:v16 timeoutSeconds:0.0])
          {
            v19[2](v19);
            v25 = [(SGDaemonConnection *)self->_connection remoteObjectProxy];
            [v5 invokeWithTarget:v25];

            v26 = [(SGDaemonConnection *)self->_connection xpcConnection];
            v53[0] = MEMORY[0x1E4F143A8];
            v53[1] = 3221225472;
            v53[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_7;
            v53[3] = &unk_1E5B90528;
            v54 = v41;
            [v26 addBarrierBlock:v53];
          }
        }
        else
        {
          id v52 = 0;
          [v5 getArgument:&v52 atIndex:v24];
          if (v52) {
            v27 = (void *)[v52 copy];
          }
          else {
            v27 = 0;
          }
          size_t v19 = v20;
          if (self->_queuesRequestsIfBusy
            || [MEMORY[0x1E4F93B18] waitForSemaphore:v16 timeoutSeconds:0.0] != 1)
          {
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_8;
            v46[3] = &unk_1E5B8E958;
            v31 = v20;
            SEL v50 = a2;
            id v48 = v31;
            v46[4] = self;
            id v32 = v27;
            id v49 = v32;
            v39 = v27;
            v33 = v41;
            v47 = v33;
            id v51 = (id)[v46 copy];
            v34 = [v5 methodSignature];
            objc_msgSend(v5, "setArgument:atIndex:", &v51, objc_msgSend(v34, "numberOfArguments") - 1);

            [v5 retainArguments];
            connection = self->_connection;
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_9;
            v42[3] = &unk_1E5B8E980;
            v36 = v31;
            size_t v19 = v20;
            id v44 = v36;
            id v45 = v32;
            v43 = v33;
            v37 = [(SGDaemonConnection *)connection remoteObjectProxyWithErrorHandler:v42];
            [v5 invokeWithTarget:v37];

            v27 = v39;
            id v38 = self;

            id v18 = v40;
          }
          else
          {
            id v18 = v40;
            if (v27)
            {
              v28 = (void (**)(void, void *))v27;
              v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGErrorDomain" code:7 userInfo:0];
              v30 = +[SGXPCResponse3 responseWithError:v29];
              v28[2](v28, v30);

              v27 = v28;
            }
          }

          unint64_t v12 = v41;
        }
      }
    }
  }
  else
  {
    v62.receiver = self;
    v62.super_class = (Class)SGRemoteObjectProxy;
    [(SGRemoteObjectProxy *)&v62 forwardInvocation:v5];
  }
}

- (SGRemoteObjectProxy)initWithInProcessSuggestManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGRemoteObjectProxy;
  id v6 = [(SGRemoteObjectProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inProcessSuggestManager, a3);
  }

  return v7;
}

- (SGRemoteObjectProxy)initWithConnection:(id)a3 queuesRequestsIfBusy:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SGRemoteObjectProxy;
  v8 = [(SGRemoteObjectProxy *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_queuesRequestsIfBusy = a4;
  }

  return v9;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_3()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  dispatch_semaphore_t v1 = dispatch_semaphore_create(10);
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult_16;
  _forwardStackInvocation___pasExprOnceResult_16 = (uint64_t)v1;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_5()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult_23;
  _forwardStackInvocation___pasExprOnceResult_23 = v1;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_4()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult_19;
  _forwardStackInvocation___pasExprOnceResult_19 = v1;
}

id __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_7()
{
  return self;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_9(uint64_t a1, void *a2)
{
  id v6 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = +[SGXPCResponse3 responseWithError:v6];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  id v5 = self;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke()
{
  v0 = (void *)MEMORY[0x1A6265250]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"SGRemoteObjectProxy-inProcessSuggestManager"];
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult;
  _forwardStackInvocation___pasExprOnceResult = v1;
}

@end