@interface MGRemoteQueryServer
- (BOOL)invalidated;
- (MGRemoteQueryServer)initWithHomeHash:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5;
- (MGRemoteQueryServerDelegate)delegate;
- (NSArray)clients;
- (NSError)error;
- (NSString)description;
- (NSString)homeHash;
- (OS_dispatch_queue)dispatchQueue;
- (OS_nw_listener)listener;
- (id)_clientAdd:(id)a3;
- (id)_clientFind:(id)a3;
- (id)_prepareListenerAdvertisement;
- (id)_prepareListenerIdentity;
- (id)_prepareListenerParameters;
- (id)_prepareListenerTLS;
- (unint64_t)_transactionCount;
- (unint64_t)_unsafe_transactionCount;
- (unsigned)_connectionLimit;
- (void)_clientRemove:(id)a3;
- (void)_handleNewConnection:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_prepareListenerHTTP:(id)a3;
- (void)_prepareListenerHandlers;
- (void)_startListener;
- (void)_updateConnectionLimit;
- (void)clientInvalidated:(id)a3;
- (void)clientLostTransaction:(id)a3;
- (void)dealloc;
- (void)setClients:(id)a3;
- (void)setError:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setListener:(id)a3;
@end

@implementation MGRemoteQueryServer

- (MGRemoteQueryServer)initWithHomeHash:(id)a3 delegate:(id)a4 dispatchQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MGRemoteQueryServer;
  v11 = [(MGRemoteQueryServer *)&v22 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v12->_dispatchQueue, a5);
    uint64_t v13 = [MEMORY[0x263EFF8C0] array];
    clients = v12->_clients;
    v12->_clients = (NSArray *)v13;

    error = v12->_error;
    v12->_error = 0;

    v12->_invalidated = 0;
    uint64_t v16 = [v8 copy];
    homeHash = v12->_homeHash;
    v12->_homeHash = (NSString *)v16;

    v18 = [(MGRemoteQueryServer *)v12 dispatchQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__MGRemoteQueryServer_initWithHomeHash_delegate_dispatchQueue___block_invoke;
    block[3] = &unk_26485E378;
    v21 = v12;
    dispatch_async(v18, block);
  }
  return v12;
}

uint64_t __63__MGRemoteQueryServer_initWithHomeHash_delegate_dispatchQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListener];
}

- (void)dealloc
{
  [(MGRemoteQueryServer *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MGRemoteQueryServer;
  [(MGRemoteQueryServer *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MGRemoteQueryServer *)self clients];
  uint64_t v7 = [v6 count];
  unint64_t v8 = [(MGRemoteQueryServer *)self _unsafe_transactionCount];
  id v9 = [(MGRemoteQueryServer *)self listener];
  BOOL v10 = [(MGRemoteQueryServer *)self invalidated];
  uint64_t v11 = 78;
  if (v10) {
    uint64_t v11 = 89;
  }
  v12 = [v3 stringWithFormat:@"<%@: %p, _clients = %lu, _transactions = %lu, _listener = %@, _invalidated = %c>", v5, self, v7, v8, v9, v11];

  return (NSString *)v12;
}

- (void)_startListener
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v4 = [(MGRemoteQueryServer *)self listener];

  if (v4)
  {
    v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = [(MGRemoteQueryServer *)self listener];
      int v10 = 134218242;
      uint64_t v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = (uint64_t)v6;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p server already listening %@", (uint8_t *)&v10, 0x16u);
LABEL_10:
    }
  }
  else
  {
    if (![(MGRemoteQueryServer *)self invalidated])
    {
      v5 = [(MGRemoteQueryServer *)self _prepareListenerParameters];
      v6 = [(MGRemoteQueryServer *)self _prepareListenerAdvertisement];
      uint64_t v7 = nw_listener_create(v5);
      [(MGRemoteQueryServer *)self setListener:v7];
      unint64_t v8 = [(MGRemoteQueryServer *)self dispatchQueue];
      nw_listener_set_queue(v7, v8);

      nw_listener_set_advertise_descriptor(v7, v6);
      [(MGRemoteQueryServer *)self _updateConnectionLimit];
      [(MGRemoteQueryServer *)self _prepareListenerHandlers];
      id v9 = MGLogForCategory(5);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134218496;
        uint64_t v11 = self;
        __int16 v12 = 2048;
        uint64_t v13 = 1;
        __int16 v14 = 2048;
        uint64_t v15 = 1;
        _os_log_impl(&dword_229257000, v9, OS_LOG_TYPE_DEFAULT, "%p server starting, versions %lu->%lu", (uint8_t *)&v10, 0x20u);
      }

      nw_listener_start(v7);
      goto LABEL_10;
    }
    v5 = MGLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      uint64_t v11 = self;
      _os_log_error_impl(&dword_229257000, v5, OS_LOG_TYPE_ERROR, "%p server invalidated, not starting", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_invalidate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (![(MGRemoteQueryServer *)self invalidated])
  {
    objc_super v3 = MGLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v10 = self;
      _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p server invalidating", buf, 0xCu);
    }

    [(MGRemoteQueryServer *)self setInvalidated:1];
    v4 = [MEMORY[0x263EFF8C0] array];
    [(MGRemoteQueryServer *)self setClients:v4];

    v5 = [(MGRemoteQueryServer *)self listener];
    [(MGRemoteQueryServer *)self setListener:0];
    v6 = [(MGRemoteQueryServer *)self dispatchQueue];
    if (v5)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __34__MGRemoteQueryServer__invalidate__block_invoke;
      block[3] = &unk_26485E378;
      id v8 = v5;
      dispatch_async(v6, block);
    }
    else
    {
      [(MGRemoteQueryServer *)self _invalidated];
    }
  }
}

void __34__MGRemoteQueryServer__invalidate__block_invoke(uint64_t a1)
{
}

- (void)_invalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_super v3 = MGLogForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v7 = self;
    _os_log_impl(&dword_229257000, v3, OS_LOG_TYPE_DEFAULT, "%p server invalidated", buf, 0xCu);
  }

  v4 = [(MGRemoteQueryServer *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__MGRemoteQueryServer__invalidated__block_invoke;
  block[3] = &unk_26485E378;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __35__MGRemoteQueryServer__invalidated__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (v4)
  {
    v2 = *(void **)(a1 + 32);
    objc_super v3 = [v2 error];
    [v4 serverInvalidated:v2 withError:v3];
  }
}

- (id)_prepareListenerParameters
{
  objc_super v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x22A6B39E0](*MEMORY[0x263F14470]);
  v5 = [(MGRemoteQueryServer *)self _prepareListenerTLS];
  secure_tcp = nw_parameters_create_secure_tcp(v5, v4);
  nw_parameters_set_include_peer_to_peer(secure_tcp, 0);
  nw_parameters_set_local_only(secure_tcp, 1);
  nw_parameters_set_server_mode();
  nw_parameters_set_reuse_local_address(secure_tcp, 1);
  nw_parameters_set_attach_protocol_listener();
  [(MGRemoteQueryServer *)self _prepareListenerHTTP:secure_tcp];

  return secure_tcp;
}

- (id)_prepareListenerTLS
{
  objc_super v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__MGRemoteQueryServer__prepareListenerTLS__block_invoke;
  v7[3] = &unk_26485E508;
  v7[4] = self;
  id v4 = (void *)MEMORY[0x22A6B39E0](v7);
  v5 = (void *)MEMORY[0x22A6B39E0]();

  return v5;
}

void __42__MGRemoteQueryServer__prepareListenerTLS__block_invoke(uint64_t a1, id a2)
{
  options = a2;
  objc_super v3 = [*(id *)(a1 + 32) _prepareListenerIdentity];
  if (v3) {
    sec_protocol_options_set_local_identity(options, v3);
  }
  sec_protocol_options_add_tls_application_protocol(options, (const char *)[@"h2" UTF8String]);
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);
}

- (id)_prepareListenerIdentity
{
  v2 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v2);

  SelfSignedIdentity = (__SecIdentity *)_CFHTTPServerCreateSelfSignedIdentity();
  if (SelfSignedIdentity)
  {
    id v4 = SelfSignedIdentity;
    sec_identity_t v5 = sec_identity_create(SelfSignedIdentity);
    CFRelease(v4);
  }
  else
  {
    sec_identity_t v5 = 0;
  }
  return v5;
}

- (void)_prepareListenerHTTP:(id)a3
{
  id v4 = a3;
  sec_identity_t v5 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  protocol = nw_http_messaging_create_options();
  v6 = nw_parameters_copy_default_protocol_stack(v4);

  nw_protocol_stack_prepend_application_protocol(v6, protocol);
}

- (id)_prepareListenerAdvertisement
{
  objc_super v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  objc_msgSend(NSString, "stringWithFormat:", @"%lu", 1);
  id v4 = objc_claimAutoreleasedReturnValue();
  sec_identity_t v5 = (const char *)[v4 UTF8String];

  objc_msgSend(NSString, "stringWithFormat:", @"%lu", 1);
  id v6 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (const char *)[v6 UTF8String];

  dictionary = nw_txt_record_create_dictionary();
  id v9 = (const char *)[@"v" UTF8String];
  size_t v10 = strlen(v5);
  nw_txt_record_set_key(dictionary, v9, (const uint8_t *)v5, v10);
  uint64_t v11 = (const char *)[@"m" UTF8String];
  size_t v12 = strlen(v7);
  nw_txt_record_set_key(dictionary, v11, (const uint8_t *)v7, v12);
  uint64_t v13 = [(MGRemoteQueryServer *)self homeHash];
  if ([v13 length])
  {
    __int16 v14 = (const char *)[v13 UTF8String];
    uint64_t v15 = (const char *)[@"h" UTF8String];
    size_t v16 = strlen(v14);
    nw_txt_record_set_key(dictionary, v15, (const uint8_t *)v14, v16);
  }
  bonjour_service = nw_advertise_descriptor_create_bonjour_service(0, (const char *)[@"_mediagroups._tcp" UTF8String], 0);
  nw_advertise_descriptor_set_txt_record_object(bonjour_service, dictionary);

  return bonjour_service;
}

- (void)_prepareListenerHandlers
{
  objc_super v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__1;
  __int16 v14 = __Block_byref_object_dispose__1;
  id v15 = [(MGRemoteQueryServer *)self listener];
  id v4 = v11[5];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke;
  handler[3] = &unk_26485E3A0;
  objc_copyWeak(&v9, &location);
  handler[4] = &v10;
  nw_listener_set_state_changed_handler(v4, handler);
  sec_identity_t v5 = v11[5];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke_16;
  v6[3] = &unk_26485E530;
  objc_copyWeak(&v7, &location);
  nw_listener_set_new_connection_handler(v5, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  _Block_object_dispose(&v10, 8);

  objc_destroyWeak(&location);
}

void __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  sec_identity_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (a2 == 4)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    [v7 _invalidated];
  }
  else if (a2 == 3 && WeakRetained)
  {
    uint64_t v8 = MGLogForCategory(5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218242;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_error_impl(&dword_229257000, v8, OS_LOG_TYPE_ERROR, "%p server listener failed, error %@", (uint8_t *)&v12, 0x16u);
    }

    CFErrorRef v9 = nw_error_copy_cf_error(v5);
    [v7 setError:v9];
    [v7 _invalidate];
  }
}

void __47__MGRemoteQueryServer__prepareListenerHandlers__block_invoke_16(uint64_t a1, void *a2)
{
  connection = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained invalidated] & 1) == 0) {
    [v4 _handleNewConnection:connection];
  }
  else {
    nw_connection_cancel(connection);
  }
}

- (void)_handleNewConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sec_identity_t v5 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  if ([(MGRemoteQueryServer *)self invalidated])
  {
    id v6 = MGLogForCategory(5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 134218242;
      *(void *)&location[4] = self;
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_error_impl(&dword_229257000, v6, OS_LOG_TYPE_ERROR, "%p server invalidated, not handling %@", location, 0x16u);
    }

    nw_connection_cancel(v4);
  }
  else
  {
    id v7 = [(MGRemoteQueryServer *)self _clientFind:v4];
    if (v7
      || ([(MGRemoteQueryServer *)self clients],
          CFErrorRef v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 count],
          v9,
          v10 != -1)
      && ([(MGRemoteQueryServer *)self _clientAdd:v4],
          (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = MGLogForCategory(5);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 134218498;
        *(void *)&location[4] = self;
        __int16 v16 = 2048;
        v17 = v7;
        __int16 v18 = 2112;
        v19 = v4;
        _os_log_debug_impl(&dword_229257000, v8, OS_LOG_TYPE_DEBUG, "%p server attempting to use client %p to service new connection %@", location, 0x20u);
      }

      objc_initWeak((id *)location, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __44__MGRemoteQueryServer__handleNewConnection___block_invoke;
      v12[3] = &unk_26485E580;
      objc_copyWeak(&v14, (id *)location);
      v12[4] = self;
      uint64_t v13 = v4;
      [v7 addNewConnection:v13 completion:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)location);
    }
    else
    {
      uint64_t v11 = MGLogForCategory(5);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id location = 134218242;
        *(void *)&location[4] = self;
        __int16 v16 = 2112;
        v17 = v4;
        _os_log_error_impl(&dword_229257000, v11, OS_LOG_TYPE_ERROR, "%p server has no client to handle new connection %@", location, 0x16u);
      }

      nw_connection_cancel(v4);
      [(MGRemoteQueryServer *)self _updateConnectionLimit];
    }
  }
}

void __44__MGRemoteQueryServer__handleNewConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  sec_identity_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained dispatchQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__MGRemoteQueryServer__handleNewConnection___block_invoke_2;
    v9[3] = &unk_26485E558;
    uint64_t v11 = a2;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    v9[4] = v5;
    v9[5] = v7;
    id v10 = v8;
    dispatch_async(v6, v9);
  }
}

void __44__MGRemoteQueryServer__handleNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 56);
  switch(v2)
  {
    case 3:
      id v4 = MGLogForCategory(5);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void *)(a1 + 48);
        int v12 = 134218242;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_error_impl(&dword_229257000, v4, OS_LOG_TYPE_ERROR, "%p server retrying accept of %@", (uint8_t *)&v12, 0x16u);
      }

      [*(id *)(a1 + 40) _handleNewConnection:*(void *)(a1 + 48)];
      break;
    case 2:
      nw_connection_cancel(*(nw_connection_t *)(a1 + 48));
      sec_identity_t v5 = *(void **)(a1 + 32);
      [v5 _updateConnectionLimit];
      break;
    case 1:
      objc_super v3 = MGLogForCategory(5);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = [*(id *)(a1 + 40) clients];
        uint64_t v8 = [v7 count];
        uint64_t v9 = [*(id *)(a1 + 40) _transactionCount];
        int v12 = 134218496;
        uint64_t v13 = v6;
        __int16 v14 = 2048;
        uint64_t v15 = v8;
        __int16 v16 = 2048;
        uint64_t v17 = v9;
        _os_log_debug_impl(&dword_229257000, v3, OS_LOG_TYPE_DEBUG, "%p server accepted, now %lu/%lu clients", (uint8_t *)&v12, 0x20u);
      }
      break;
  }
}

- (id)_clientAdd:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sec_identity_t v5 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  nw_endpoint_t v6 = nw_connection_copy_endpoint(v4);
  uint64_t v7 = [MGRemoteQueryServerClient alloc];
  uint64_t v8 = [(MGRemoteQueryServer *)self dispatchQueue];
  uint64_t v9 = [(MGRemoteQueryServerClient *)v7 initWithPeer:v6 delegate:self dispatchQueue:v8];

  uint64_t v10 = [(MGRemoteQueryServer *)self clients];
  uint64_t v11 = [v10 arrayByAddingObject:v9];

  [(MGRemoteQueryServer *)self setClients:v11];
  int v12 = MGLogForCategory(5);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 134219010;
    uint64_t v15 = self;
    __int16 v16 = 2048;
    uint64_t v17 = [v11 count];
    __int16 v18 = 2048;
    unint64_t v19 = [(MGRemoteQueryServer *)self _transactionCount];
    __int16 v20 = 2048;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v4;
    _os_log_debug_impl(&dword_229257000, v12, OS_LOG_TYPE_DEBUG, "%p server now %lu/%lu clients after adding client %p for connection %@", (uint8_t *)&v14, 0x34u);
  }

  return v9;
}

- (id)_clientFind:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sec_identity_t v5 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  nw_endpoint_t v6 = nw_connection_copy_endpoint(v4);
  uint64_t v7 = nw_endpoint_copy_address_string(v6);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [NSString stringWithUTF8String:v7];
    free(v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([v9 length])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v10 = [(MGRemoteQueryServer *)self clients];
    id v11 = (id)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      v21 = v4;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v10);
          }
          int v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v15 = [v14 peer];
          nw_endpoint_type_t type = nw_endpoint_get_type(v6);
          if (type == nw_endpoint_get_type(v15))
          {
            uint64_t v17 = nw_endpoint_copy_address_string(v15);
            if (v17)
            {
              __int16 v18 = v17;
              unint64_t v19 = [NSString stringWithUTF8String:v17];
              free(v18);
              if (v9 && v19 && ([v9 isEqual:v19] & 1) != 0)
              {
                id v11 = v14;

                goto LABEL_22;
              }
            }
            else
            {
              unint64_t v19 = 0;
            }
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
LABEL_22:
      id v4 = v21;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_clientRemove:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  sec_identity_t v5 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v5);

  nw_endpoint_t v6 = [(MGRemoteQueryServer *)self clients];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:v4];
  [(MGRemoteQueryServer *)self setClients:v7];
  uint64_t v8 = MGLogForCategory(5);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218752;
    uint64_t v10 = self;
    __int16 v11 = 2048;
    uint64_t v12 = [v7 count];
    __int16 v13 = 2048;
    unint64_t v14 = [(MGRemoteQueryServer *)self _transactionCount];
    __int16 v15 = 2048;
    id v16 = v4;
    _os_log_debug_impl(&dword_229257000, v8, OS_LOG_TYPE_DEBUG, "%p server now %lu/%lu clients after removing client %p", (uint8_t *)&v9, 0x2Au);
  }

  [(MGRemoteQueryServer *)self _updateConnectionLimit];
}

- (void)clientLostTransaction:(id)a3
{
  id v4 = [(MGRemoteQueryServer *)self dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__MGRemoteQueryServer_clientLostTransaction___block_invoke;
  block[3] = &unk_26485E378;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __45__MGRemoteQueryServer_clientLostTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateConnectionLimit];
}

- (void)clientInvalidated:(id)a3
{
  id v4 = a3;
  sec_identity_t v5 = [(MGRemoteQueryServer *)self dispatchQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__MGRemoteQueryServer_clientInvalidated___block_invoke;
  v7[3] = &unk_26485E468;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __41__MGRemoteQueryServer_clientInvalidated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clientRemove:*(void *)(a1 + 40)];
}

- (unint64_t)_transactionCount
{
  objc_super v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  return [(MGRemoteQueryServer *)self _unsafe_transactionCount];
}

- (unint64_t)_unsafe_transactionCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [(MGRemoteQueryServer *)self clients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) transactionCount];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_updateConnectionLimit
{
  uint64_t v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v5 = [(MGRemoteQueryServer *)self listener];
  if (![(MGRemoteQueryServer *)self invalidated] && v5)
  {
    uint64_t v4 = [(MGRemoteQueryServer *)self listener];
    nw_listener_set_new_connection_limit(v4, [(MGRemoteQueryServer *)self _connectionLimit]);
  }
  MEMORY[0x270F9A758]();
}

- (unsigned)_connectionLimit
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MGRemoteQueryServer *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = [(MGRemoteQueryServer *)self _transactionCount];
  if (v4 >= 0x15) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = 20 - v4;
  }
  uint64_t v6 = MGLogForCategory(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134218240;
    long long v9 = self;
    __int16 v10 = 2048;
    unint64_t v11 = v5;
    _os_log_debug_impl(&dword_229257000, v6, OS_LOG_TYPE_DEBUG, "%p server allowing %lu new connections", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (MGRemoteQueryServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MGRemoteQueryServerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_nw_listener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSString)homeHash
{
  return self->_homeHash;
}

- (NSArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_homeHash, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end