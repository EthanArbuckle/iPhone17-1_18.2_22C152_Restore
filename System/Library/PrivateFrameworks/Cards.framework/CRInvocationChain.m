@interface CRInvocationChain
- (BOOL)_isEligibleForSelector:(SEL)a3;
- (BOOL)_respondsToSelector:(SEL)a3;
- (BOOL)isEligibleForSelector:(SEL)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (CRInvocationChain)init;
- (CRInvocationChainDelegate)delegate;
- (NSPointerArray)_chainedObjects;
- (id)_methodSignatureForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_accessChainedObjectsSafely:(id)a3;
- (void)_addChainedObject:(id)a3;
- (void)_enumerateChainedObjectsUsingBlock:(id)a3;
- (void)_forwardInvocation:(id)a3;
- (void)_setChainedObjects:(id)a3;
- (void)addChainedObject:(id)a3;
- (void)enumerateChainedObjectsUsingBlock:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CRInvocationChain

- (CRInvocationChain)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRInvocationChain;
  id v2 = [(CRInvocationChain *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cards.CRInvocationChain.chainedObjectsAccessQueue", v3);
    v5 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v4;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 1), (const void *)_CRInvocationChainRecursiveKey, *((void **)v2 + 1), 0);
  }
  return (CRInvocationChain *)v2;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__CRInvocationChain_forwardInvocation___block_invoke;
  v6[3] = &unk_2647EEE58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRInvocationChain *)self _accessChainedObjectsSafely:v6];
}

uint64_t __39__CRInvocationChain_forwardInvocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forwardInvocation:*(void *)(a1 + 40)];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__CRInvocationChain_respondsToSelector___block_invoke;
  v5[3] = &unk_2647EEE80;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(CRInvocationChain *)self _accessChainedObjectsSafely:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__CRInvocationChain_respondsToSelector___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _respondsToSelector:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__CRInvocationChain_methodSignatureForSelector___block_invoke;
  v5[3] = &unk_2647EEE80;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(CRInvocationChain *)self _accessChainedObjectsSafely:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__CRInvocationChain_methodSignatureForSelector___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _methodSignatureForSelector:*(void *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

- (void)addChainedObject:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__CRInvocationChain_addChainedObject___block_invoke;
  v6[3] = &unk_2647EEE58;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRInvocationChain *)self _accessChainedObjectsSafely:v6];
}

uint64_t __38__CRInvocationChain_addChainedObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addChainedObject:*(void *)(a1 + 40)];
}

- (void)enumerateChainedObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CRInvocationChain_enumerateChainedObjectsUsingBlock___block_invoke;
  v6[3] = &unk_2647EEEA8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CRInvocationChain *)self _accessChainedObjectsSafely:v6];
}

uint64_t __55__CRInvocationChain_enumerateChainedObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateChainedObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (BOOL)isEligibleForSelector:(SEL)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__CRInvocationChain_isEligibleForSelector___block_invoke;
  v5[3] = &unk_2647EEE80;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  [(CRInvocationChain *)self _accessChainedObjectsSafely:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__CRInvocationChain_isEligibleForSelector___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isEligibleForSelector:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_accessChainedObjectsSafely:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    specific = dispatch_get_specific((const void *)_CRInvocationChainRecursiveKey);
    chainedObjectsAccessQueue = self->_chainedObjectsAccessQueue;
    if (specific == chainedObjectsAccessQueue)
    {
      v4[2](v4);
    }
    else
    {
      uint64_t v11 = 0;
      v12 = &v11;
      uint64_t v13 = 0x3032000000;
      v14 = __Block_byref_object_copy_;
      v15 = __Block_byref_object_dispose_;
      id v16 = 0;
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __49__CRInvocationChain__accessChainedObjectsSafely___block_invoke;
      v8[3] = &unk_2647EEED0;
      char v9 = v4;
      v10 = &v11;
      dispatch_sync(chainedObjectsAccessQueue, v8);
      id v7 = (void *)v12[5];
      if (v7) {
        objc_exception_throw(v7);
      }

      _Block_object_dispose(&v11, 8);
    }
  }
}

uint64_t __49__CRInvocationChain__accessChainedObjectsSafely___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSPointerArray)_chainedObjects
{
  chainedObjects = self->_chainedObjects;
  if (!chainedObjects)
  {
    id v4 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    id v5 = self->_chainedObjects;
    self->_chainedObjects = v4;

    chainedObjects = self->_chainedObjects;
  }
  [(NSPointerArray *)chainedObjects addPointer:0];
  [(NSPointerArray *)self->_chainedObjects compact];
  uint64_t v6 = self->_chainedObjects;
  return v6;
}

- (void)_forwardInvocation:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CRInvocationChain *)self _chainedObjects];
  uint64_t v6 = NSStringFromSelector((SEL)[v4 selector]);
  id v7 = CRLogContextCards;
  if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_DEBUG)) {
    [(CRInvocationChain *)v6 _forwardInvocation:v7];
  }
  uint64_t v19 = v6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
        v14 = [(CRInvocationChain *)self delegate];
        int v15 = [v14 invocationChain:self shouldForwardInvocation:v4 toTarget:v13];

        if ((objc_opt_respondsToSelector() & 1) != 0 && v15)
        {
          v18 = CRLogContextCards;
          v17 = (void *)v19;
          if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v26 = v19;
            __int16 v27 = 2112;
            uint64_t v28 = v13;
            _os_log_impl(&dword_226EA8000, v18, OS_LOG_TYPE_INFO, "Invoking invocation %@ with target: %@", buf, 0x16u);
          }
          [v4 invokeWithTarget:v13];

          goto LABEL_18;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v16 = CRLogContextCards;
  v17 = (void *)v19;
  if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR)) {
    -[CRInvocationChain _forwardInvocation:](v19, v16);
  }
  v20.receiver = self;
  v20.super_class = (Class)CRInvocationChain;
  [(CRInvocationChain *)&v20 forwardInvocation:v4];
LABEL_18:
}

- (BOOL)_respondsToSelector:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)CRInvocationChain;
  BOOL v5 = -[CRInvocationChain respondsToSelector:](&v16, sel_respondsToSelector_);
  if ([(CRInvocationChain *)self _isEligibleForSelector:a3])
  {
    [(CRInvocationChain *)self _chainedObjects];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if (objc_opt_respondsToSelector())
          {
            BOOL v5 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (id)_methodSignatureForSelector:(SEL)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(CRInvocationChain *)self _chainedObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) methodSignatureForSelector:a3];
        if (v10)
        {
          uint64_t v11 = (void *)v10;

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)CRInvocationChain;
  uint64_t v11 = [(CRInvocationChain *)&v13 methodSignatureForSelector:a3];
LABEL_11:

  return v11;
}

- (void)_addChainedObject:(id)a3
{
  id v4 = a3;
  id v5 = [(CRInvocationChain *)self _chainedObjects];
  [v5 addPointer:v4];
}

- (void)_enumerateChainedObjectsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void, char *))a3;
  if (v4)
  {
    [(CRInvocationChain *)self _chainedObjects];
    char v14 = 0;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
        if (v14) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

- (BOOL)_isEligibleForSelector:(SEL)a3
{
  char v3 = [(CRInvocationChain *)self _chainedObjects];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (CRInvocationChainDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRInvocationChainDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)_setChainedObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chainedObjects, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chainedObjectsAccessQueue, 0);
}

void __49__CRInvocationChain__accessChainedObjectsSafely___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_begin_catch(a1);
  uint64_t v5 = *(void *)(*(void *)(a3 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  objc_end_catch();
}

- (void)_forwardInvocation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226EA8000, a2, OS_LOG_TYPE_ERROR, "No members of the chain were eligble for invocation %@", (uint8_t *)&v2, 0xCu);
}

- (void)_forwardInvocation:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_226EA8000, log, OS_LOG_TYPE_DEBUG, "Forwarding invocation %@ to candidates: %@", (uint8_t *)&v3, 0x16u);
}

@end