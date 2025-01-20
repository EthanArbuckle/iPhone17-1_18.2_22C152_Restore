@interface SKProductsRequest
- (NSSet)_productIdentifiers;
- (SKProductsRequest)init;
- (SKProductsRequest)initWithProductIdentifiers:(NSSet *)productIdentifiers;
- (void)_logEventWithPrimaryError:(id)a3 mappedError:(id)a4;
- (void)_start;
- (void)_startWithCompletionHandler:(id)a3;
@end

@implementation SKProductsRequest

- (NSSet)_productIdentifiers
{
  return (NSSet *)*((id *)self->_productsRequestInternal + 1);
}

- (SKProductsRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductsRequest;
  v2 = [(SKRequest *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductsRequestInternal);
    id productsRequestInternal = v2->_productsRequestInternal;
    v2->_id productsRequestInternal = v3;
  }
  return v2;
}

- (SKProductsRequest)initWithProductIdentifiers:(NSSet *)productIdentifiers
{
  v4 = productIdentifiers;
  v5 = [(SKProductsRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [(NSSet *)v4 copy];
    id productsRequestInternal = v5->_productsRequestInternal;
    v8 = (void *)productsRequestInternal[1];
    productsRequestInternal[1] = v6;
  }
  return v5;
}

- (void)_start
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__SKProductsRequest__start__block_invoke;
  v3[3] = &unk_1E5FA9AD8;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  [(SKProductsRequest *)self _startWithCompletionHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __27__SKProductsRequest__start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!dyld_program_sdk_at_least())
  {
    v7 = MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = dispatch_get_global_queue(21, 0);
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  v8 = _SKErrorFromNSError(v6);
  [*(id *)(a1 + 32) _logEventWithPrimaryError:v6 mappedError:v8];
LABEL_6:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SKProductsRequest__start__block_invoke_2;
  block[3] = &unk_1E5FA9AB0;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v13 = v8;
  id v14 = v5;
  id v10 = v5;
  id v11 = v8;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __27__SKProductsRequest__start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained delegate];
  if (*(void *)(a1 + 32))
  {
    char v3 = objc_opt_respondsToSelector();
    id v4 = WeakRetained;
    if ((v3 & 1) == 0) {
      goto LABEL_9;
    }
    [v2 request:WeakRetained didFailWithError:*(void *)(a1 + 32)];
    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector()) {
    [v2 productsRequest:WeakRetained didReceiveResponse:*(void *)(a1 + 40)];
  }
  char v5 = objc_opt_respondsToSelector();
  id v4 = WeakRetained;
  if (v5)
  {
    [v2 requestDidFinish:WeakRetained];
LABEL_8:
    id v4 = WeakRetained;
  }
LABEL_9:
  [v4 _shutdownRequest];
}

- (void)_logEventWithPrimaryError:(id)a3 mappedError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(SKOneErrorEvent);
  [(SKBaseErrorEvent *)v7 setUserAction:5];
  [(SKBaseErrorEvent *)v7 setPrimaryError:v6];

  [(SKBaseErrorEvent *)v7 setMappedError:v5];
  +[SKAnalyticsManager sendEvent:v7];
}

- (void).cxx_destruct
{
}

- (void)_startWithCompletionHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;

  sub_1B014BBB4((uint64_t)&unk_1E9B1B628, v5);
}

@end