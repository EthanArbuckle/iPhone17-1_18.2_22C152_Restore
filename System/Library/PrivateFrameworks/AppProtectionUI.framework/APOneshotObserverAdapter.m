@interface APOneshotObserverAdapter
- (APOneshotObserverAdapter)initWithController:(id)a3 completionHandler:(id)a4;
- (void)enablementController:(id)a3 didCompleteWithError:(id)a4;
- (void)kickoff;
@end

@implementation APOneshotObserverAdapter

- (APOneshotObserverAdapter)initWithController:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APOneshotObserverAdapter;
  v9 = [(APOneshotObserverAdapter *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_controller, a3);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    v21[4] = __Block_byref_object_dispose_;
    v11 = v10;
    v22 = v11;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __65__APOneshotObserverAdapter_initWithController_completionHandler___block_invoke;
    v18 = &unk_26522D948;
    id v19 = v8;
    v20 = v21;
    uint64_t v12 = [&v15 copy];
    id completion = v11->_completion;
    v11->_id completion = (id)v12;

    objc_msgSend(v7, "registerObserver:", v11, v15, v16, v17, v18);
    _Block_object_dispose(v21, 8);
  }
  return v10;
}

void __65__APOneshotObserverAdapter_initWithController_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)kickoff
{
}

- (void)enablementController:(id)a3 didCompleteWithError:(id)a4
{
  (*((void (**)(id, BOOL, id))self->_completion + 2))(self->_completion, a4 == 0, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end