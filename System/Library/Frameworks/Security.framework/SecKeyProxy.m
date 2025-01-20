@interface SecKeyProxy
+ (__SecIdentity)createIdentityFromEndpoint:(id)a3 error:(id *)a4;
+ (__SecKey)createItemFromEndpoint:(id)a3 certificate:(id *)a4 error:(id *)a5;
+ (__SecKey)createKeyFromEndpoint:(id)a3 error:(id *)a4;
+ (id)targetForKey:(__SecKey *)a3 error:(__CFError *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (SecKeyProxy)initWithIdentity:(__SecIdentity *)a3;
- (SecKeyProxy)initWithKey:(__SecKey *)a3;
- (SecKeyProxy)initWithKey:(__SecKey *)a3 certificate:(id)a4;
- (id)clientConnectionHandler;
- (id)clientDisconnectionHandler;
- (void)dealloc;
- (void)invalidate;
- (void)setClientConnectionHandler:(id)a3;
- (void)setClientDisconnectionHandler:(id)a3;
@end

@implementation SecKeyProxy

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientDisconnectionHandler, 0);
  objc_storeStrong(&self->_clientConnectionHandler, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_certificate, 0);

  objc_storeStrong(&self->_key, 0);
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)dealloc
{
  [(SecKeyProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SecKeyProxy;
  [(SecKeyProxy *)&v3 dealloc];
}

- (void)invalidate
{
}

- (void)setClientDisconnectionHandler:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  v5 = _Block_copy(v4);

  id clientDisconnectionHandler = obj->_clientDisconnectionHandler;
  obj->_id clientDisconnectionHandler = v5;

  objc_sync_exit(obj);
}

- (id)clientDisconnectionHandler
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = _Block_copy(v2->_clientDisconnectionHandler);
  objc_sync_exit(v2);

  return v3;
}

- (void)setClientConnectionHandler:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  v5 = _Block_copy(v4);

  id clientConnectionHandler = obj->_clientConnectionHandler;
  obj->_id clientConnectionHandler = v5;

  objc_sync_exit(obj);
}

- (id)clientConnectionHandler
{
  v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = _Block_copy(v2->_clientConnectionHandler);
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED8768C8];
  [v7 setExportedInterface:v8];

  v9 = [[SecKeyProxyTarget alloc] initWithKey:self->_key certificate:self->_certificate];
  [v7 setExportedObject:v9];

  v10 = [(NSXPCListener *)self->_listener _queue];
  [v7 _setQueue:v10];

  unint64_t add = atomic_fetch_add(&self->_clientCount, 1uLL);
  v12 = self;
  objc_sync_enter(v12);
  v13 = [(SecKeyProxy *)v12 clientConnectionHandler];

  if (v13)
  {
    v14 = [(SecKeyProxy *)v12 clientConnectionHandler];
    ((void (**)(void, BOOL))v14)[2](v14, add == 0);
  }
  objc_sync_exit(v12);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v12);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __50__SecKeyProxy_listener_shouldAcceptNewConnection___block_invoke;
  v19 = &unk_1E5481428;
  objc_copyWeak(&v20, &location);
  [v7 setInvalidationHandler:&v16];
  objc_msgSend(v7, "resume", v16, v17, v18, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

void __50__SecKeyProxy_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (atomic_ullong *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t add = atomic_fetch_add(WeakRetained + 4, 0xFFFFFFFFFFFFFFFFLL);
    id v6 = WeakRetained;
    objc_super v3 = WeakRetained;
    objc_sync_enter(v3);
    id v4 = [(atomic_ullong *)v3 clientDisconnectionHandler];

    if (v4)
    {
      v5 = [(atomic_ullong *)v3 clientDisconnectionHandler];
      ((void (**)(void, BOOL))v5)[2](v5, add == 1);
    }
    objc_sync_exit(v3);

    WeakRetained = v6;
  }
}

- (SecKeyProxy)initWithIdentity:(__SecIdentity *)a3
{
  unint64_t v5 = *((void *)a3 + 3);
  CFRetain((CFTypeRef)v5);
  unint64_t v6 = *((void *)a3 + 2);
  CFRetain((CFTypeRef)v6);
  if (v5 | v6)
  {
    CFDataRef v8 = SecCertificateCopyData((SecCertificateRef)v6);
    if (v8)
    {
      self = [(SecKeyProxy *)self initWithKey:v5 certificate:v8];
      id v7 = self;
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (SecKeyProxy)initWithKey:(__SecKey *)a3
{
  return [(SecKeyProxy *)self initWithKey:a3 certificate:0];
}

- (SecKeyProxy)initWithKey:(__SecKey *)a3 certificate:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SecKeyProxy;
  CFDataRef v8 = [(SecKeyProxy *)&v16 init];
  v9 = v8;
  if (v8)
  {
    if (a3)
    {
      CFRetain(a3);
      id key = v9->_key;
      v9->_id key = a3;
    }
    else
    {
      id key = v8->_key;
      v8->_id key = 0;
    }

    objc_storeStrong((id *)&v9->_certificate, a4);
    uint64_t v11 = [MEMORY[0x1E4F29290] anonymousListener];
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v11;

    [(NSXPCListener *)v9->_listener setDelegate:v9];
    v13 = v9->_listener;
    dispatch_queue_t v14 = dispatch_queue_create("SecKeyProxy", 0);
    [(NSXPCListener *)v13 _setQueue:v14];

    [(NSXPCListener *)v9->_listener resume];
  }

  return v9;
}

+ (__SecIdentity)createIdentityFromEndpoint:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v14 = 0;
  unint64_t v5 = (void *)[a1 createItemFromEndpoint:a3 certificate:&v14 error:a4];
  CFDataRef v6 = (const __CFData *)v14;
  CFDataRef v7 = v6;
  if (!v5) {
    goto LABEL_7;
  }
  if (!v6)
  {
    if (a4)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F1D158];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16[0] = @"Attempt to create remote identity from key-only proxy";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      [v11 errorWithDomain:v12 code:-50 userInfo:v9];
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  uint64_t v8 = *MEMORY[0x1E4F1CF80];
  v9 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6);
  v10 = (__SecIdentity *)SecIdentityCreate(v8, v9, v5);
LABEL_6:

LABEL_8:
  return v10;
}

+ (__SecKey)createKeyFromEndpoint:(id)a3 error:(id *)a4
{
  return (__SecKey *)[a1 createItemFromEndpoint:a3 certificate:0 error:a4];
}

+ (__SecKey)createItemFromEndpoint:(id)a3 certificate:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v7];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED8768C8];
  [v8 setRemoteObjectInterface:v9];

  [v8 resume];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12051;
  v25 = __Block_byref_object_dispose__12052;
  id v26 = 0;
  uint64_t v15 = 0;
  objc_super v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12051;
  v19 = __Block_byref_object_dispose__12052;
  id v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke;
  v14[3] = &unk_1E5481470;
  v14[4] = &v21;
  v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke_2;
  v13[3] = &unk_1E5481498;
  v13[4] = &v15;
  [v10 initializeWithReply:v13];

  if (v22[5])
  {
    [v8 invalidate];
    uint64_t v11 = 0;
    if (a5) {
      *a5 = (id) v22[5];
    }
  }
  else
  {
    if (a4) {
      *a4 = (id) v16[5];
    }
    uint64_t v11 = (__SecKey *)SecKeyCreate(*MEMORY[0x1E4F1CF80], (uint64_t)&SecRemoteKeyDescriptor, (uint64_t)v8, 0, 0);
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F1D158];
  uint64_t v11 = *MEMORY[0x1E4F28A50];
  v12[0] = a2;
  unint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a2;
  id v7 = [v5 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v8 = [v3 errorWithDomain:v4 code:-25300 userInfo:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __56__SecKeyProxy_createItemFromEndpoint_certificate_error___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)targetForKey:(__SecKey *)a3 error:(__CFError *)a4
{
  uint64_t v4 = (void *)*((void *)a3 + 3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__SecKeyProxy_targetForKey_error___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a4;
  unint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v7];

  return v5;
}

void __34__SecKeyProxy_targetForKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = v3;
    **(void **)(a1 + 32) = v3;
    id v3 = v4;
  }
}

@end