@interface NWURLSessionDelegateQueue
- (void)runDelegateBlock:(void *)a1;
@end

@implementation NWURLSessionDelegateQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dispatchQueue, 0);

  objc_storeStrong((id *)&self->__operationQueue, 0);
}

void __42__NWURLSessionDelegateQueue_delegateQueue__block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (!v3 || !objc_getProperty(v3, a2, 16, 1))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    v6 = *(void **)(a1 + 32);
    if (v6) {
      objc_setProperty_atomic(v6, v4, v5, 16);
    }

    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 16, 1);
    }
    [Property setMaxConcurrentOperationCount:1];
    v9 = *(void **)(a1 + 32);
    if (v9) {
      v9 = (void *)v9[3];
    }
    v12 = v9;
    id v11 = *(id *)(a1 + 32);
    if (v11) {
      id v11 = objc_getProperty(v11, v10, 16, 1);
    }
    [v11 setUnderlyingQueue:v12];
  }
}

- (void)runDelegateBlock:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = a1[3];
    dispatch_block_t block = v3;
    if (v4) {
      dispatch_async(v4, v3);
    }
    else {
      objc_msgSend(objc_getProperty(a1, (SEL)v3, 16, 1), "addOperationWithBlock:", v3);
    }
    id v3 = block;
  }
}

@end