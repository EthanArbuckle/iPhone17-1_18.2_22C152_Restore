@interface AFKeyValueObserver
- (AFKeyValueObserver)initWithObject:(id)a3 keyPath:(id)a4 handler:(id)a5 deliveryOptions:(id)a6;
- (void)_handleObservedChangeWithOldValue:(id)a3 andNewValue:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AFKeyValueObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryOptions, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_invalidation, 0);
}

- (void)invalidate
{
}

- (void)_handleObservedChangeWithOldValue:(id)a3 andNewValue:(id)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isInvalid);
  if ((v4 & 1) == 0) {
    (*((void (**)(void))self->_handler + 2))();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if ((void *)AFKeyValueObservingContext == a6)
  {
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_isInvalid);
    if ((v14 & 1) == 0)
    {
      v15 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
      v16 = [v13 objectForKey:*MEMORY[0x1E4F284C8]];
      v17 = [(AFKeyValueObservingDeliveryOptions *)self->_deliveryOptions queue];
      if (v17)
      {
        objc_initWeak(&location, self);
        dispatch_qos_class_t v18 = [(AFKeyValueObservingDeliveryOptions *)self->_deliveryOptions qosClass];
        if (v18)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
          block[3] = &unk_1E592A3E0;
          v19 = &v31;
          objc_copyWeak(&v31, &location);
          v23 = &v29;
          id v29 = v15;
          v22 = &v30;
          id v30 = v16;
          dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v18, 0, block);
          v21 = (void *)MEMORY[0x19F3A50D0]();
        }
        else
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
          v24[3] = &unk_1E592A3E0;
          v19 = &v27;
          objc_copyWeak(&v27, &location);
          v23 = &v25;
          id v25 = v15;
          v22 = &v26;
          id v26 = v16;
          v21 = (void *)MEMORY[0x19F3A50D0](v24);
        }
        if ([(AFKeyValueObservingDeliveryOptions *)self->_deliveryOptions asynchronous]) {
          dispatch_async(v17, v21);
        }
        else {
          dispatch_sync(v17, v21);
        }

        objc_destroyWeak(v19);
        objc_destroyWeak(&location);
      }
      else
      {
        [(AFKeyValueObserver *)self _handleObservedChangeWithOldValue:v15 andNewValue:v16];
      }
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)AFKeyValueObserver;
    [(AFKeyValueObserver *)&v33 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleObservedChangeWithOldValue:*(void *)(a1 + 32) andNewValue:*(void *)(a1 + 40)];
}

void __69__AFKeyValueObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleObservedChangeWithOldValue:*(void *)(a1 + 32) andNewValue:*(void *)(a1 + 40)];
}

- (AFKeyValueObserver)initWithObject:(id)a3 keyPath:(id)a4 handler:(id)a5 deliveryOptions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)AFKeyValueObserver;
  v15 = [(AFKeyValueObserver *)&v32 init];
  if (v15)
  {
    if (!v11)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v15, @"AFKeyValueObserving.m", 61, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v13)
      {
LABEL_6:
        atomic_store(0, (unsigned __int8 *)&v15->_isInvalid);
        uint64_t v16 = [v13 copy];
        id handler = v15->_handler;
        v15->_id handler = (id)v16;

        objc_storeStrong((id *)&v15->_deliveryOptions, a6);
        objc_initWeak(&location, v11);
        dispatch_qos_class_t v18 = [AFOneArgumentSafetyBlock alloc];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __69__AFKeyValueObserver_initWithObject_keyPath_handler_deliveryOptions___block_invoke;
        v27[3] = &unk_1E592A3B8;
        v30[1] = (id)a2;
        v19 = v15;
        v28 = v19;
        objc_copyWeak(v30, &location);
        id v20 = v12;
        id v29 = v20;
        uint64_t v21 = [(AFOneArgumentSafetyBlock *)v18 initWithBlock:v27 defaultValue:0];
        invalidation = v19->_invalidation;
        v19->_invalidation = (AFOneArgumentSafetyBlock *)v21;

        [v11 addObserver:v19 forKeyPath:v20 options:7 context:AFKeyValueObservingContext];
        objc_destroyWeak(v30);

        objc_destroyWeak(&location);
        goto LABEL_7;
      }
    }
    else
    {
      id v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v15, @"AFKeyValueObserving.m", 62, @"Invalid parameter not satisfying: %@", @"[keyPath isKindOfClass:[NSString class]]" object file lineNumber description];

      if (v13) {
        goto LABEL_6;
      }
    }
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v15, @"AFKeyValueObserving.m", 63, @"Invalid parameter not satisfying: %@", @"handler != nil" object file lineNumber description];

    goto LABEL_6;
  }
LABEL_7:

  return v15;
}

void __69__AFKeyValueObserver_initWithObject_keyPath_handler_deliveryOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v9 = v3;
  if (!v3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"AFKeyValueObserving.m", 71, @"Invalid parameter not satisfying: %@", @"observer != nil" object file lineNumber description];

    v3 = 0;
  }
  atomic_store(1u, v3 + 8);
  unsigned __int8 v4 = atomic_load(v3 + 8);
  if ((v4 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"AFKeyValueObserving.m", 73, @"AFKeyValueObserver %p is expected to be invalid.", v9);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained removeObserver:v9 forKeyPath:*(void *)(a1 + 40) context:AFKeyValueObservingContext];
  }
}

- (void)dealloc
{
  [(AFKeyValueObserver *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFKeyValueObserver;
  [(AFKeyValueObserver *)&v3 dealloc];
}

@end