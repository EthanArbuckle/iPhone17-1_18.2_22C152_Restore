@interface IKDocumentServiceRequest
- (IKAppDocument)appDocument;
- (NSDictionary)responseDictionary;
- (void)didCloseViewModelLink:(id)a3 withErrorDictionary:(id)a4;
- (void)documentDidChangeForViewModelLink:(id)a3;
- (void)onCancel;
- (void)onSend;
- (void)responseDictionaryDidChangeForViewModelLink:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IKDocumentServiceRequest

- (void)setDelegate:(id)a3
{
  v3 = self;
  v6.receiver = self;
  v6.super_class = (Class)IKDocumentServiceRequest;
  id v4 = a3;
  [(IKServiceRequest *)&v6 setDelegate:v4];
  p_dsrDelegateFlags = &v3->_dsrDelegateFlags;
  v3->_dsrDelegateFlags.hasResponseDictionaryDidChange = objc_opt_respondsToSelector() & 1;
  LOBYTE(v3) = objc_opt_respondsToSelector();

  p_dsrDelegateFlags->hasDocumentDidChange = v3 & 1;
}

- (void)onSend
{
  v3 = [(IKServiceRequest *)self serviceContext];
  id v4 = [v3 element];

  v5 = [v4 appDocument];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  objc_super v6 = [(IKServiceRequest *)self serviceContext];
  id v17 = [v6 contextDictionary];

  objc_initWeak(&location, self);
  v7 = [(IKServiceRequest *)self appContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__IKDocumentServiceRequest_onSend__block_invoke;
  v10[3] = &unk_1E6DE3DB8;
  objc_copyWeak(&v14, &location);
  id v8 = v4;
  id v11 = v8;
  id v9 = v5;
  id v12 = v9;
  v13 = v16;
  [v7 evaluate:v10 completionBlock:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(v16, 8);
}

void __34__IKDocumentServiceRequest_onSend__block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 40) retrieveJSElementForViewElement:v4 jsContext:v17];
      if (v5)
      {
        objc_super v6 = (void *)v5;
        v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v7)
        {
          id v8 = (void *)[v7 mutableCopy];
        }
        else
        {
          id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
        }
        id v9 = v8;
        [v8 setObject:v6 forKeyedSubscript:@"source"];
        uint64_t v10 = [v9 copy];
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        id v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
    }
    v13 = [WeakRetained appContext];
    id v14 = [v13 jsViewModelService];
    v15 = [v14 openLinkForType:@"document" document:0 extraInfo:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    objc_storeWeak(WeakRetained + 5, v15);
    [v15 setDelegate:WeakRetained];
    v16 = [v15 document];

    if (v16) {
      [WeakRetained documentDidChangeForViewModelLink:v15];
    }
  }
}

- (void)onCancel
{
  objc_initWeak(&location, self);
  v3 = [(IKServiceRequest *)self appContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__IKDocumentServiceRequest_onCancel__block_invoke;
  v4[3] = &unk_1E6DE3DE0;
  objc_copyWeak(&v5, &location);
  [v3 evaluate:v4 completionBlock:0];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__IKDocumentServiceRequest_onCancel__block_invoke(uint64_t a1)
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

- (void)responseDictionaryDidChangeForViewModelLink:(id)a3
{
  id v4 = a3;
  id v5 = [v4 asPrivateIKJSViewModelLink];
  objc_super v6 = [v5 responseDictionary];
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v6;

  objc_initWeak(&location, self);
  id v8 = [(IKServiceRequest *)self appContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__IKDocumentServiceRequest_responseDictionaryDidChangeForViewModelLink___block_invoke;
  v9[3] = &unk_1E6DE3E08;
  objc_copyWeak(&v10, &location);
  [v8 evaluateDelegateBlockSync:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __72__IKDocumentServiceRequest_responseDictionaryDidChangeForViewModelLink___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[48])
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 responseDictionaryDidChangeForDocumentServiceRequest:v3];

    WeakRetained = v3;
  }
}

- (void)documentDidChangeForViewModelLink:(id)a3
{
  id v17 = a3;
  p_link = &self->_link;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_link);
  id v10 = [WeakRetained document];
  if (v10)
  {
    uint64_t v11 = [IKAppDocument alloc];
    uint64_t v12 = [(IKServiceRequest *)self appContext];
    id v15 = objc_loadWeakRetained((id *)&self->_link);
    id v3 = [v15 document];
    id v4 = [(IKServiceRequest *)self appContext];
    id v5 = [v4 jsViewModelService];
    objc_super v6 = [(IKServiceRequest *)self serviceContext];
    p_link = [v6 contextDictionary];
    v16 = (void *)v12;
    v13 = [(IKAppDocument *)v11 initWithAppContext:v12 document:v3 owner:v5 extraInfo:p_link];
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong((id *)&self->_appDocument, v13);
  if (v10)
  {
  }
  objc_initWeak(&location, self);
  id v14 = [(IKServiceRequest *)self appContext];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__IKDocumentServiceRequest_documentDidChangeForViewModelLink___block_invoke;
  v18[3] = &unk_1E6DE3E08;
  objc_copyWeak(&v19, &location);
  [v14 evaluateDelegateBlockSync:v18];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __62__IKDocumentServiceRequest_documentDidChangeForViewModelLink___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[49])
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained delegate];
    [v2 documentDidChangeForDocumentServiceRequest:v3];

    id WeakRetained = v3;
  }
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
  v9[2] = __70__IKDocumentServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke;
  v9[3] = &unk_1E6DE3A98;
  void v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 evaluateDelegateBlockSync:v9];
}

uint64_t __70__IKDocumentServiceRequest_didCloseViewModelLink_withErrorDictionary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedWithStatus:errorDictionary:", *(void *)(a1 + 40) != 0);
}

- (NSDictionary)responseDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (IKAppDocument)appDocument
{
  return (IKAppDocument *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDocument, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_destroyWeak((id *)&self->_link);
}

@end