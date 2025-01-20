@interface CADLocalXPCProxyObject
- (CADLocalXPCProxyObject)initWithWrappedObject:(id)a3 queue:(id)a4 errorHandler:(id)a5 synchronous:(BOOL)a6 connection:(id)a7;
- (id)_replacementArgumentValueForURLWrapper:(id)a3;
- (id)_updatedArgumentValueForArgumentValue:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_fixupArgumentsForInvocation:(id)a3;
- (void)_forwardInvocationAsynchronously:(id)a3;
- (void)_forwardInvocationSynchronously:(id)a3;
- (void)forwardInvocation:(id)a3;
@end

@implementation CADLocalXPCProxyObject

uint64_t __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CADLocalXPCProxyObject;
  v5 = -[CADLocalXPCProxyObject methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [self->_wrappedObject methodSignatureForSelector:a3];
  }
  v8 = v7;

  return v8;
}

void __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTarget:*(void *)(a1 + 32)];
  [v3 retainArguments];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)forwardInvocation:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  char v5 = [WeakRetained isValid];

  if (v5)
  {
    if (self->_synchronous) {
      [(CADLocalXPCProxyObject *)self _forwardInvocationSynchronously:v7];
    }
    else {
      [(CADLocalXPCProxyObject *)self _forwardInvocationAsynchronously:v7];
    }
  }
  else if (self->_errorHandler)
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
    (*((void (**)(void))self->_errorHandler + 2))();
  }
}

- (void)_forwardInvocationSynchronously:(id)a3
{
  id v4 = a3;
  [v4 setTarget:self->_wrappedObject];
  [(CADLocalXPCProxyObject *)self _fixupArgumentsForInvocation:v4];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  id v26 = 0;
  uint64_t v5 = [MEMORY[0x1E4F57788] replyBlockArgumentIndex:v4];
  id v6 = 0;
  id v20 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    v8 = (void *)[MEMORY[0x1E4F57788] copyReplyBlockFromInvocation:v4];
    _Block_signature(v8);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke;
    v16 = &unk_1E624F428;
    id v17 = v8;
    v19 = &v21;
    id v6 = v7;
    v18 = v6;
    id v20 = (id)__NSMakeSpecialForwardingCaptureBlock();
    [v4 setArgument:&v20 atIndex:v5];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CADLocalXPCProxyObject__forwardInvocationSynchronously___block_invoke_2;
  block[3] = &unk_1E624E508;
  id v10 = v4;
  id v12 = v10;
  dispatch_sync(queue, block);
  if (v6) {
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (v22[5])
  {
    -[CADLocalXPCProxyObject _fixupArgumentsForInvocation:](self, "_fixupArgumentsForInvocation:");
    [(id)v22[5] invoke];
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_fixupArgumentsForInvocation:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 methodSignature];
  if ([v5 numberOfArguments])
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = v5;
      v8 = (const char *)[v7 getArgumentTypeAtIndex:v6];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = [&unk_1F151DA20 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(&unk_1F151DA20);
            }
            if (!strcmp(v8, (const char *)[*(id *)(*((void *)&v18 + 1) + 8 * v12) UTF8String]))
            {
              uint64_t v17 = 0;
              [v4 getArgument:&v17 atIndex:v6];
              if (v17)
              {
                uint64_t v13 = -[CADLocalXPCProxyObject _updatedArgumentValueForArgumentValue:](self, "_updatedArgumentValueForArgumentValue:");
                id v16 = v13;
                if (v13)
                {
                  CFTypeRef v14 = CFRetain(v13);
                  CFAutorelease(v14);
                  [v4 setArgument:&v16 atIndex:v6];
                }
              }
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v15 = [&unk_1F151DA20 countByEnumeratingWithState:&v18 objects:v22 count:16];
          uint64_t v10 = v15;
        }
        while (v15);
      }
      ++v6;
    }
    while (objc_msgSend(v7, "numberOfArguments", v16) != v6);
  }
}

uint64_t __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _updatedArgumentValueForArgumentValue:a2];
  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v11 = v5;
    if (!v6)
    {
      uint64_t v7 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v6 setObject:v11 atIndexedSubscript:a3];
  }
  return MEMORY[0x1F41817F8]();
}

- (id)_updatedArgumentValueForArgumentValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CADLocalXPCProxyObject *)self _replacementArgumentValueForURLWrapper:v4];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__9;
    long long v21 = __Block_byref_object_dispose__9;
    id v22 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke;
    v14[3] = &unk_1E624F450;
    v14[4] = self;
    id v16 = &v17;
    id v7 = v6;
    id v15 = v7;
    [v7 enumerateObjectsUsingBlock:v14];
    id v5 = (id)v18[5];
    uint64_t v8 = v15;
LABEL_7:

    _Block_object_dispose(&v17, 8);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x3032000000;
    long long v20 = __Block_byref_object_copy__9;
    long long v21 = __Block_byref_object_dispose__9;
    id v22 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke_2;
    v11[3] = &unk_1E624F478;
    v11[4] = self;
    uint64_t v13 = &v17;
    id v7 = v9;
    id v12 = v7;
    [v7 enumerateKeysAndObjectsUsingBlock:v11];
    id v5 = (id)v18[5];
    uint64_t v8 = v12;
    goto LABEL_7;
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

- (CADLocalXPCProxyObject)initWithWrappedObject:(id)a3 queue:(id)a4 errorHandler:(id)a5 synchronous:(BOOL)a6 connection:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CADLocalXPCProxyObject;
  uint64_t v17 = [(CADLocalXPCProxyObject *)&v22 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong(&v17->_wrappedObject, a3);
    objc_storeStrong((id *)&v18->_queue, a4);
    uint64_t v19 = MEMORY[0x1C1867AB0](v15);
    id errorHandler = v18->_errorHandler;
    v18->_id errorHandler = (id)v19;

    v18->_synchronous = a6;
    objc_storeWeak((id *)&v18->_connection, v16);
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_wrappedObject, 0);
}

- (void)_forwardInvocationAsynchronously:(id)a3
{
  id v4 = a3;
  [v4 setTarget:self->_wrappedObject];
  [(CADLocalXPCProxyObject *)self _fixupArgumentsForInvocation:v4];
  uint64_t v5 = [MEMORY[0x1E4F57788] replyBlockArgumentIndex:v4];
  id v19 = 0;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = v5;
    id v7 = (void *)[MEMORY[0x1E4F57788] copyReplyBlockFromInvocation:v4];
    _Block_signature(v7);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke;
    id v16 = &unk_1E624E850;
    id v17 = v7;
    long long v18 = self;
    id v8 = v7;
    id v19 = (id)__NSMakeSpecialForwardingCaptureBlock();
    [v4 setArgument:&v19 atIndex:v6];
  }
  [v4 retainArguments];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_4;
  v11[3] = &unk_1E624E508;
  id v12 = v4;
  id v10 = v4;
  dispatch_async(queue, v11);
}

void __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setTarget:*(void *)(a1 + 32)];
  [v3 retainArguments];
  if (_block_invoke_onceToken_0 != -1) {
    dispatch_once(&_block_invoke_onceToken_0, &__block_literal_global_28);
  }
  id v4 = _block_invoke_asyncQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_3;
  v6[3] = &unk_1E624E580;
  v6[4] = *(void *)(a1 + 40);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_2()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("XPCReplyQueue", v2);
  v1 = (void *)_block_invoke_asyncQueue;
  _block_invoke_asyncQueue = (uint64_t)v0;
}

uint64_t __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _fixupArgumentsForInvocation:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return [v2 invoke];
}

uint64_t __59__CADLocalXPCProxyObject__forwardInvocationAsynchronously___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

void __64__CADLocalXPCProxyObject__updatedArgumentValueForArgumentValue___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  id v5 = [*(id *)(a1 + 32) _updatedArgumentValueForArgumentValue:a3];
  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v6 setObject:v5 forKeyedSubscript:v10];
  }
}

- (id)_replacementArgumentValueForURLWrapper:(id)a3
{
  id v3 = a3;
  id v4 = [CADEmulatedSecurityScopedURLWrapper alloc];
  id v5 = [v3 url];

  uint64_t v6 = [(CADEmulatedSecurityScopedURLWrapper *)v4 initWithOriginalURL:v5];
  return v6;
}

@end