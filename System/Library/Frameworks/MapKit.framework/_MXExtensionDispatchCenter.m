@interface _MXExtensionDispatchCenter
- (_MXExtensionDispatchCenter)initWithExtensionProvider:(id)a3;
- (_MXExtensionProvider)extensionProvider;
- (id)addExtensionsUpdateHandler:(id)a3;
- (void)dispatchExtensions:(id)a3 error:(id)a4;
- (void)removeExtensionUpdateHandler:(id)a3;
@end

@implementation _MXExtensionDispatchCenter

- (void)dispatchExtensions:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  id v21 = 0;
  lock = self->_lock;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke;
  block[3] = &unk_1E54B8200;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(lock, block);
  v9 = (void *)v17[5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55___MXExtensionDispatchCenter_dispatchExtensions_error___block_invoke_2;
  v12[3] = &unk_1E54BB848;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [v9 enumerateObjectsUsingBlock:v12];

  _Block_object_dispose(&v16, 8);
}

- (id)addExtensionsUpdateHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  lock = self->_lock;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __57___MXExtensionDispatchCenter_addExtensionsUpdateHandler___block_invoke;
  id v14 = &unk_1E54B8630;
  v15 = self;
  id v6 = v4;
  id v16 = v6;
  dispatch_sync(lock, &v11);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);
  v8 = objc_msgSend(WeakRetained, "_currentExtensions", v11, v12, v13, v14, v15);

  if (v8) {
    (*((void (**)(id, void *, void))v6 + 2))(v6, v8, 0);
  }
  v9 = (void *)MEMORY[0x18C139AE0](v6);

  return v9;
}

- (_MXExtensionDispatchCenter)initWithExtensionProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MXExtensionDispatchCenter;
  v5 = [(_MXExtensionDispatchCenter *)&v13 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionProvider, v4);
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.maps._MXExtensionDispatchCenter", v7);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    handlers = v6->_handlers;
    v6->_handlers = (NSHashTable *)v10;
  }
  return v6;
}

- (void)removeExtensionUpdateHandler:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59___MXExtensionDispatchCenter_removeExtensionUpdateHandler___block_invoke;
  v7[3] = &unk_1E54B8248;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(lock, v7);
}

- (_MXExtensionProvider)extensionProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionProvider);

  return (_MXExtensionProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionProvider);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end