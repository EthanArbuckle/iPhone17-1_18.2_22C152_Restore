@interface INAppIntentDispatcher
- (INAppIntentDispatcher)initWithDelegate:(id)a3;
- (INIntentDeliveringDelegate)delegate;
- (void)dispatchIntentForwardingAction:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation INAppIntentDispatcher

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (INIntentDeliveringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INIntentDeliveringDelegate *)WeakRetained;
}

- (void)dispatchIntentForwardingAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v8 = (void *)getWFOnScreenContentExtractorClass_softClass;
    uint64_t v22 = getWFOnScreenContentExtractorClass_softClass;
    if (!getWFOnScreenContentExtractorClass_softClass)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __getWFOnScreenContentExtractorClass_block_invoke;
      v18[3] = &unk_1E5520EB8;
      v18[4] = &v19;
      __getWFOnScreenContentExtractorClass_block_invoke((uint64_t)v18);
      v8 = (void *)v20[3];
    }
    v9 = v8;
    _Block_object_dispose(&v19, 8);
    v10 = (INIntentDeliverer *)objc_alloc_init(v9);
    [(INIntentDeliverer *)v10 handleAction:v6 completionHandler:v7];
  }
  else
  {
    v11 = [INIntentDeliverer alloc];
    if (v6) {
      [v6 hostProcessAuditToken];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    v12 = [(INIntentDeliverer *)v11 initWithQueue:MEMORY[0x1E4F14428] auditToken:v17];
    v13 = [(INAppIntentDispatcher *)self delegate];
    [(INIntentDeliverer *)v12 setDelegate:v13];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__INAppIntentDispatcher_dispatchIntentForwardingAction_completionHandler___block_invoke;
    v14[3] = &unk_1E551EDB0;
    v15 = v12;
    id v16 = v7;
    v10 = v12;
    [v6 executeLocallyWithIntentDeliverer:v10 completionHandler:v14];
  }
}

uint64_t __74__INAppIntentDispatcher_dispatchIntentForwardingAction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (INAppIntentDispatcher)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INAppIntentDispatcher;
  v5 = [(INAppIntentDispatcher *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

@end