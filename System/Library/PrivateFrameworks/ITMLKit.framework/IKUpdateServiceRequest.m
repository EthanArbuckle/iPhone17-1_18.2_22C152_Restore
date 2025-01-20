@interface IKUpdateServiceRequest
- (void)didCloseViewModelLink:(id)a3 withErrorDictionary:(id)a4;
- (void)documentDidChangeForViewModelLink:(id)a3;
- (void)onCancel;
- (void)onSend;
@end

@implementation IKUpdateServiceRequest

- (void)onSend
{
  v3 = [(IKServiceRequest *)self serviceContext];
  v4 = [v3 element];

  v5 = [v4 appDocument];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__27;
  v17[4] = __Block_byref_object_dispose__27;
  v6 = [(IKServiceRequest *)self serviceContext];
  id v18 = [v6 contextDictionary];

  objc_initWeak(&location, self);
  v7 = [(IKServiceRequest *)self appContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__IKUpdateServiceRequest_onSend__block_invoke;
  v10[3] = &unk_1E6DE6CC8;
  objc_copyWeak(&v15, &location);
  id v8 = v5;
  id v11 = v8;
  id v9 = v4;
  v13 = self;
  v14 = v17;
  id v12 = v9;
  [v7 evaluate:v10 completionBlock:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(v17, 8);
}

void __32__IKUpdateServiceRequest_onSend__block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v4 = [*(id *)(a1 + 32) retrieveJSElementForViewElement:*(void *)(a1 + 40) jsContext:v18];
    if (v4)
    {
      v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v5)
      {
        v6 = (void *)[v5 mutableCopy];
      }
      else
      {
        v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
      }
      v7 = v6;
      [v6 setObject:v4 forKeyedSubscript:@"target"];
      uint64_t v8 = [v7 copy];
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    id v11 = [*(id *)(a1 + 32) jsDocument];
    id v12 = [*(id *)(a1 + 48) appContext];
    v13 = [v12 jsViewModelService];
    v14 = [v13 openLinkForType:@"update" document:v11 extraInfo:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    objc_storeWeak(WeakRetained + 5, v14);
    [v14 setDelegate:*(void *)(a1 + 48)];
    uint64_t v15 = [v14 document];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [v14 document];

      if (v17 != v11) {
        [WeakRetained documentDidChangeForViewModelLink:v14];
      }
    }
  }
}

- (void)onCancel
{
  objc_initWeak(&location, self);
  v3 = [(IKServiceRequest *)self appContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__IKUpdateServiceRequest_onCancel__block_invoke;
  v4[3] = &unk_1E6DE3DE0;
  objc_copyWeak(&v5, &location);
  [v3 evaluate:v4 completionBlock:0];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __34__IKUpdateServiceRequest_onCancel__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 5;
    id v5 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    [v3 setDelegate:0];

    id v4 = objc_loadWeakRetained(v2);
    [v4 cancel];

    objc_storeWeak(v2, 0);
    WeakRetained = v5;
  }
}

- (void)documentDidChangeForViewModelLink:(id)a3
{
  p_link = &self->_link;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_link);
  v6 = [WeakRetained document];
  if (v6)
  {
    v7 = [IKAppDocument alloc];
    uint64_t v8 = [(IKServiceRequest *)self appContext];
    id v9 = objc_loadWeakRetained((id *)p_link);
    v10 = [v9 document];
    id v11 = [(IKServiceRequest *)self appContext];
    id v12 = [v11 jsViewModelService];
    v13 = [(IKAppDocument *)v7 initWithAppContext:v8 document:v10 owner:v12];
  }
  else
  {
    v13 = 0;
  }

  v14 = [(IKServiceRequest *)self appContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__IKUpdateServiceRequest_documentDidChangeForViewModelLink___block_invoke;
  v16[3] = &unk_1E6DE3A98;
  v16[4] = self;
  v17 = v13;
  uint64_t v15 = v13;
  [v14 evaluateDelegateBlockSync:v16];
}

void __60__IKUpdateServiceRequest_documentDidChangeForViewModelLink___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 updateServiceRequest:*(void *)(a1 + 32) documentDidChange:*(void *)(a1 + 40)];
}

- (void)didCloseViewModelLink:(id)a3 withErrorDictionary:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_link);
  [WeakRetained setDelegate:0];

  objc_storeWeak((id *)&self->_link, 0);
  v7 = [(IKServiceRequest *)self appContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__IKUpdateServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke;
  v9[3] = &unk_1E6DE3A98;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 evaluateDelegateBlockSync:v9];
}

uint64_t __68__IKUpdateServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithStatus:errorDictionary:", *(void *)(a1 + 40) != 0);
}

- (void).cxx_destruct
{
}

@end