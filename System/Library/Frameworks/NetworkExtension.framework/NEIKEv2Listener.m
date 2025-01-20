@interface NEIKEv2Listener
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 includeP2P:(BOOL)a9;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8;
- (NSObject)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 listenerUDPPort:(void *)a6 listenerInterface:(void *)a7 listenerQueue:(void *)a8 delegate:(void *)a9 delegateQueue:(char)a10 includeP2P:;
- (NSObject)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 packetDelegate:(void *)a6 listenerQueue:(void *)a7 delegate:(void *)a8 delegateQueue:;
- (OS_dispatch_queue)listenerQueue;
- (void)cancel;
- (void)createListenerWithParameters:(unsigned int)a3 attempt:;
- (void)dealloc;
- (void)invalidatingTransport:(id)a3;
- (void)receivePacket:(id)a3 transport:(id)a4;
- (void)requestConfigurationForSession:(id)a3 sessionConfig:(id)a4 childConfig:(id)a5 validateAuthBlock:(id)a6 responseBlock:(id)a7;
- (void)sessionFailedBeforeRequestingConfiguration:(id)a3;
@end

@implementation NEIKEv2Listener

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_packetDelegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_packetDelegateTransport, 0);
  objc_storeStrong((id *)&self->_connectionTransports, 0);
  objc_storeStrong((id *)&self->_sessionsBeforeAuth, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_kernelSASessionName, 0);
  objc_storeStrong((id *)&self->_saSession, 0);
  objc_storeStrong((id *)&self->_ikeConfig, 0);

  objc_storeStrong((id *)&self->_listenerQueue, 0);
}

- (OS_dispatch_queue)listenerQueue
{
  return self->_listenerQueue;
}

- (void)cancel
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling IKE listener", buf, 2u);
  }

  if (self)
  {
    self->_cancelled = 1;
    listener = self->_listener;
    if (listener)
    {
      nw_listener_cancel(listener);
      objc_storeStrong((id *)&self->_listener, 0);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    sessionsBeforeAuth = self->_sessionsBeforeAuth;
  }
  else
  {
    sessionsBeforeAuth = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
  }
  v6 = sessionsBeforeAuth;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v10++) invalidate];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  if (self)
  {
    [(NSMutableSet *)self->_sessionsBeforeAuth removeAllObjects];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    connectionTransports = self->_connectionTransports;
  }
  else
  {
    [0 removeAllObjects];
    connectionTransports = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
  }
  v12 = connectionTransports;
  uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](*(void *)(*((void *)&v17 + 1) + 8 * v16++), 0, 0);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v14);
  }

  if (self)
  {
    [(NSMutableSet *)self->_connectionTransports removeAllObjects];
    -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:]((uint64_t)self->_packetDelegateTransport, 0, 0);
    objc_storeStrong((id *)&self->_packetDelegateTransport, 0);
  }
  else
  {
    objc_msgSend(0, "removeAllObjects", (void)v17);
    -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](0, 0, 0);
  }
}

- (void)dealloc
{
  [(NEIKEv2Listener *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2Listener;
  [(NEIKEv2Listener *)&v3 dealloc];
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  long long v20 = v19;
  if (!v14)
  {
    long long v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v25, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    long long v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null packetDelegate";
    goto LABEL_15;
  }
  if (!v18)
  {
    long long v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    long long v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:]";
      long long v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    long long v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:](self, v14, 0, v15, v16, v17, v18, v19);
  long long v21 = self;
LABEL_6:

  return v21;
}

- (NSObject)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 packetDelegate:(void *)a6 listenerQueue:(void *)a7 delegate:(void *)a8 delegateQueue:
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v49 = a8;
  if (a1)
  {
    v51.receiver = a1;
    v51.super_class = (Class)NEIKEv2Listener;
    long long v21 = objc_msgSendSuper2(&v51, sel_init);
    if (v21)
    {
      long long v22 = v21;
      id v48 = v17;
      id v23 = v16;
      long long v24 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      Class isa = v22[7].isa;
      v22[7].Class isa = v24;

      v26 = (objc_class *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      Class v27 = v22[8].isa;
      v22[8].Class isa = v26;

      uint64_t v28 = [v15 copy];
      Class v29 = v22[3].isa;
      v22[3].Class isa = (Class)v28;

      [(objc_class *)v22[3].isa setServerMode:1];
      objc_storeStrong((id *)&v22[4].isa, a3);
      objc_storeStrong((id *)&v22[5].isa, a4);
      if (v19)
      {
        v30 = (objc_class *)v19;
        v31 = v22[2].isa;
        v22[2].Class isa = v30;
      }
      else
      {
        v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v32 = dispatch_queue_create("com.apple.networkextension.ikev2.listener", v31);
        Class v33 = v22[2].isa;
        v22[2].Class isa = (Class)v32;
      }
      objc_storeWeak((id *)&v22[10].isa, v20);
      objc_storeStrong((id *)&v22[11].isa, a8);
      objc_storeWeak((id *)&v22[12].isa, v18);
      v34 = [v15 localEndpoint];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        [v15 localEndpoint];
      }
      else {
      v36 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"::" port:@"500"];
      }
      v37 = [v15 remoteEndpoint];
      objc_opt_class();
      char v38 = objc_opt_isKindOfClass();

      if (v38) {
        [v15 remoteEndpoint];
      }
      else {
      v39 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"::1" port:@"500"];
      }
      v40 = [v22 listenerQueue];
      v41 = +[NEIKEv2Transport createTransport:remote:local:localPort:boundInterface:queue:socketGetBlock:packetDelegate:]((uint64_t)NEIKEv2Transport, 0, v39, v36, 0, 0, v40, 0, v18);
      Class v42 = v22[9].isa;
      v22[9].Class isa = (Class)v41;

      uint64_t v43 = (uint64_t)v22[9].isa;
      if (v43)
      {
        -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:](v43, v22, 1);
        v44 = v22;
        id v16 = v23;
      }
      else
      {
        v45 = ne_log_obj();
        id v16 = v23;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v45, OS_LOG_TYPE_FAULT, "[NEIKEv2Transport createTransport] failed", buf, 2u);
        }

        v44 = 0;
      }
      id v17 = v48;
    }
    else
    {
      long long v22 = ne_log_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
      }
      v44 = 0;
    }
    v46 = v49;
  }
  else
  {
    v44 = 0;
    v46 = v49;
  }

  return v44;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8 includeP2P:(BOOL)a9
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  long long v21 = v20;
  if (!v15)
  {
    long long v24 = ne_log_obj();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    Class v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    int v25 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_FAULT, v25, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v17)
  {
    long long v24 = ne_log_obj();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    Class v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    int v25 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }
  if (!v19)
  {
    long long v24 = ne_log_obj();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    Class v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegat"
          "eQueue:includeP2P:]";
    int v25 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v20)
  {
    long long v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      Class v27 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:deleg"
            "ateQueue:includeP2P:]";
      int v25 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    long long v22 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v15, 0, v16, v17, 0, v18, v19, v20, a9);
  long long v22 = self;
LABEL_6:

  return v22;
}

- (NSObject)initWithListenerIKEConfig:(void *)a3 saSession:(void *)a4 kernelSASessionName:(void *)a5 listenerUDPPort:(void *)a6 listenerInterface:(void *)a7 listenerQueue:(void *)a8 delegate:(void *)a9 delegateQueue:(char)a10 includeP2P:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  id v18 = a3;
  id v53 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v52 = a9;
  if (!a1)
  {
    long long v24 = 0;
    id v48 = v52;
    int v25 = v53;
    goto LABEL_22;
  }
  if ((unint64_t)([v19 longLongValue] - 0x10000) > 0xFFFFFFFFFFFF0000)
  {
    v54.receiver = a1;
    v54.super_class = (Class)NEIKEv2Listener;
    id v26 = [&v54 init];
    if (v26)
    {
      uint64_t v27 = (uint64_t)v26;
      id obj = v22;
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      Class v29 = *(void **)(v27 + 56);
      *(void *)(v27 + 56) = v28;

      uint64_t v30 = [v17 copy];
      v31 = *(void **)(v27 + 24);
      *(void *)(v27 + 24) = v30;

      [*(id *)(v27 + 24) setServerMode:1];
      objc_storeStrong((id *)(v27 + 32), a3);
      objc_storeStrong((id *)(v27 + 40), a4);
      if (v21)
      {
        id v32 = v21;
        Class v33 = *(NSObject **)(v27 + 16);
        *(void *)(v27 + 16) = v32;
      }
      else
      {
        Class v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v34 = dispatch_queue_create("com.apple.networkextension.ikev2.listener", v33);
        v35 = *(void **)(v27 + 16);
        *(void *)(v27 + 16) = v34;
      }
      objc_storeWeak((id *)(v27 + 80), v22);
      objc_storeStrong((id *)(v27 + 88), a9);
      legacy_tcp_socket = nw_parameters_create_legacy_tcp_socket();
      v37 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
      options = nw_udp_create_options();
      nw_protocol_stack_set_transport_protocol(v37, options);

      nw_parameters_set_data_mode();
      host = nw_endpoint_create_host("::", (const char *)[v19 UTF8String]);
      nw_parameters_set_local_endpoint(legacy_tcp_socket, host);
      if (a10) {
        nw_parameters_set_use_awdl();
      }
      if (v20)
      {
        id v40 = v18;
        [v20 UTF8String];
        v41 = nw_interface_create_with_name();
        if (v41) {
          nw_parameters_require_interface(legacy_tcp_socket, v41);
        }

        id v18 = v40;
      }
      if ([v17 forceUDPEncapsulation] && v37)
      {
        id v50 = v19;
        id v42 = v21;
        id v43 = v20;
        id v44 = v17;
        id v45 = v18;
        v46 = NEIKEv2TransportCopyNATTFramerDefinition();
        v47 = nw_framer_create_options(v46);
        nw_protocol_stack_prepend_application_protocol(v37, v47);

        id v18 = v45;
        id v17 = v44;
        id v20 = v43;
        id v21 = v42;
        id v19 = v50;
      }
      -[NEIKEv2Listener createListenerWithParameters:attempt:](v27, legacy_tcp_socket, 0);
      a1 = (id)v27;

      long long v24 = a1;
      int v25 = v53;
      id v22 = obj;
      goto LABEL_21;
    }
    a1 = ne_log_obj();
    if (os_log_type_enabled(a1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19DDAF000, a1, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }
  else
  {
    id v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v19;
      _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, "Invalid listenerUDPPort \"%@\"", buf, 0xCu);
    }
  }
  long long v24 = 0;
  int v25 = v53;
LABEL_21:
  id v48 = v52;

LABEL_22:
  return v24;
}

- (void)createListenerWithParameters:(unsigned int)a3 attempt:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v5 = a2;
  if ((*(unsigned char *)(a1 + 8) & 1) == 0)
  {
    if (a3 >= 5)
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LODWORD(location) = 67109378;
        HIDWORD(location) = a3;
        __int16 v30 = 2112;
        v31 = v5;
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "failed to create a listener after %u retries (parameters %@)", (uint8_t *)&location, 0x12u);
      }
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v7 = *(NSObject **)(a1 + 48);
    if (v7) {
      nw_listener_cancel(v7);
    }
    nw_listener_t v8 = nw_listener_create(v5);
    uint64_t v9 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v8;

    uint64_t v10 = *(void **)(a1 + 48);
    if (!v10)
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location) = 0;
        _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "nw_listener_create failed", (uint8_t *)&location, 2u);
      }
      goto LABEL_14;
    }
    v11 = v10;
    v12 = [(id)a1 listenerQueue];
    nw_listener_set_queue(v11, v12);

    objc_initWeak(&location, (id)a1);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 48);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke;
    handler[3] = &unk_1E59909E0;
    objc_copyWeak(&v27, &location);
    id v15 = v13;
    id v25 = v15;
    char v28 = a3;
    id v26 = v5;
    nw_listener_set_state_changed_handler(v14, handler);

    id v16 = *(id *)(a1 + 48);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_4;
    v21[3] = &unk_1E5990A08;
    objc_copyWeak(&v23, &location);
    id v17 = v15;
    id v22 = v17;
    nw_listener_set_new_connection_handler(v16, v21);

    id v18 = *(id *)(a1 + 48);
    nw_listener_start(v18);

    id v19 = ne_log_large_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEFAULT, "Created IKE listener", v20, 2u);
    }

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }
LABEL_15:
}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[6] != *(void *)(a1 + 32) || (WeakRetained[1] & 1) != 0)
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v7[6];
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134218240;
        uint64_t v19 = v12;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "ignoring update for a stale listener %p != %p", buf, 0x16u);
      }

      nw_listener_cancel(*(nw_listener_t *)(a1 + 32));
    }
    else if (a2 == 3 && nw_error_get_error_code(v5) == 48)
    {
      dispatch_time_t v8 = dispatch_time(0x8000000000000000, 200000000 * *(unsigned __int8 *)(a1 + 56) + 200000000);
      uint64_t v9 = [v7 listenerQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_2;
      block[3] = &unk_1E59909B8;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      id v15 = *(id *)(a1 + 40);
      char v17 = *(unsigned char *)(a1 + 56);
      dispatch_after(v8, v9, block);

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v19) = a2;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "IKE listener released, ignoring state change to %d", buf, 8u);
    }
  }
}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v3;
    uint64_t v12 = "IKE listener released, cancelling connection %@";
LABEL_51:
    uint64_t v13 = v9;
    uint32_t v14 = 12;
    goto LABEL_52;
  }
  uint64_t v6 = WeakRetained[6];
  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_time_t v8 = ne_log_obj();
  uint64_t v9 = v8;
  if (v6 != v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *((void *)v5 + 6);
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v11;
      uint64_t v12 = "ignoring new connection for a stale listener %p != %p";
      uint64_t v13 = v9;
      uint32_t v14 = 22;
LABEL_52:
      _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    }
LABEL_53:

    nw_connection_cancel(v3);
    goto LABEL_54;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Received incoming IKE connection %@", buf, 0xCu);
  }

  id v15 = v3;
  id v16 = v15;
  char v17 = v15;
  if (*((unsigned char *)v5 + 8))
  {
LABEL_49:

    uint64_t v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_53;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v16;
    uint64_t v12 = "IKE listener failed to handle new connection, cancelling %@";
    goto LABEL_51;
  }
  if (!v15)
  {
    id v53 = ne_log_obj();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Listener handleNewConnection:]";
      _os_log_fault_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_FAULT, "%s called with null connection", buf, 0xCu);
    }
    char v17 = 0;
    goto LABEL_48;
  }
  id v18 = nw_connection_copy_endpoint(v15);
  uint64_t v19 = v18;
  if (!v18)
  {
    objc_super v54 = ne_log_obj();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Listener handleNewConnection:]";
      v55 = "%s called with null remoteEndpoint";
      id v56 = v54;
      uint32_t v57 = 12;
LABEL_36:
      _os_log_fault_impl(&dword_19DDAF000, v56, OS_LOG_TYPE_FAULT, v55, buf, v57);
    }
LABEL_47:
    id v53 = v19;

    char v17 = v16;
LABEL_48:

    goto LABEL_49;
  }
  nw_endpoint_type_t type = nw_endpoint_get_type(v18);
  if (type != nw_endpoint_type_address)
  {
    nw_endpoint_type_t v58 = type;
    objc_super v54 = ne_log_obj();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v58;
      v55 = "Unexpected endpoint type %d";
      id v56 = v54;
      uint32_t v57 = 8;
      goto LABEL_36;
    }
    goto LABEL_47;
  }
  uint64_t v21 = [v5 listenerQueue];
  uint64_t v22 = v16;
  id v23 = v21;
  self;
  if (!v23)
  {
    ne_log_obj();
    long long v24 = (NEIKEv2Transport *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "+[NEIKEv2Transport createTransportWithConnection:queue:]";
      _os_log_fault_impl(&dword_19DDAF000, &v24->super, OS_LOG_TYPE_FAULT, "%s called with null queue", buf, 0xCu);
    }
    goto LABEL_39;
  }
  long long v24 = objc_alloc_init(NEIKEv2Transport);
  if (!v24)
  {
LABEL_39:
    id v52 = 0;
    goto LABEL_40;
  }
  id v25 = nw_connection_copy_parameters(v22);
  int ip_protocol = nw_parameters_get_ip_protocol();
  v61 = v19;
  if (ip_protocol == 6)
  {
    if (nw_parameters_get_tls()) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = 2;
    }
    v24->_transportType = v31;
  }
  else if (ip_protocol == 17)
  {
    nw_protocol_stack_t v27 = nw_parameters_copy_default_protocol_stack(v25);
    BOOL v30 = 0;
    if (v27)
    {
      id v28 = NEIKEv2TransportCopyNATTFramerDefinition();
      char v29 = nw_protocol_stack_includes_protocol();

      if (v29) {
        BOOL v30 = 1;
      }
    }
    v24->_transportType = v30;
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F38BE8];
  nw_endpoint_t v33 = nw_connection_copy_endpoint(v22);
  dispatch_queue_t v34 = [v32 endpointWithCEndpoint:v33];
  objc_setProperty_atomic(v24, v35, v34, 24);

  v36 = (void *)MEMORY[0x1E4F38BE8];
  v37 = (void *)MEMORY[0x19F3B8130](v25);
  char v38 = [v36 endpointWithCEndpoint:v37];
  objc_setProperty_atomic(v24, v39, v38, 16);

  objc_setProperty_atomic(v24, v40, v23, 72);
  objc_setProperty_atomic(v24, v41, v22, 56);
  Property = objc_getProperty(v24, v42, 56, 1);
  nw_connection_set_queue(Property, v23);
  id v45 = objc_getProperty(v24, v44, 56, 1);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = __56__NEIKEv2Transport_createTransportWithConnection_queue___block_invoke;
  v63 = &unk_1E5991090;
  v46 = v24;
  v64 = v46;
  MEMORY[0x19F3B7D00](v45, buf);
  id v48 = objc_getProperty(v46, v47, 56, 1);
  nw_connection_start(v48);
  os_unfair_lock_lock((os_unfair_lock_t)&g_transport_lock);
  id v49 = (void *)g_transports;
  if (!g_transports)
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objc_super v51 = (void *)g_transports;
    g_transports = (uint64_t)v50;

    id v49 = (void *)g_transports;
  }
  [v49 addObject:v46];
  os_unfair_lock_unlock((os_unfair_lock_t)&g_transport_lock);
  long long v24 = v46;

  id v52 = v24;
  uint64_t v19 = v61;
LABEL_40:

  v59 = ne_log_obj();
  v60 = v59;
  if (!v52)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[NEIKEv2Listener handleNewConnection:]";
      _os_log_fault_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_FAULT, "%s called with null transport", buf, 0xCu);
    }

    objc_super v54 = 0;
    goto LABEL_47;
  }
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v52;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    _os_log_impl(&dword_19DDAF000, v60, OS_LOG_TYPE_DEFAULT, "Created %@ with connection %@", buf, 0x16u);
  }

  [*((id *)v5 + 8) addObject:v52];
  -[NEIKEv2Transport setWildcardDelegate:preventsInvalidation:]((uint64_t)v52, v5, 0);

LABEL_54:
}

void __56__NEIKEv2Listener_createListenerWithParameters_attempt___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_super v3 = WeakRetained;
  if (WeakRetained)
  {
    -[NEIKEv2Listener createListenerWithParameters:attempt:](WeakRetained, *(void *)(a1 + 32), (*(unsigned char *)(a1 + 48) + 1));
  }
  else
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "IKE listener released, not setting up listener", v5, 2u);
    }
  }
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  __int16 v20 = v19;
  if (!v14)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }
  if (!v18)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    id v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
      long long v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    uint64_t v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v14, 0, v15, v16, 0, v17, v18, v19, 0);
  uint64_t v21 = self;
LABEL_6:

  return v21;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 kernelSASessionName:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = v21;
  if (!v15)
  {
    id v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    id v26 = "%s called with null ikeConfig";
LABEL_18:
    _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_19;
  }
  if (!v17)
  {
    id v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    id v26 = "%s called with null listenerUDPPort";
    goto LABEL_18;
  }
  if (!v20)
  {
    id v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    id v26 = "%s called with null delegate";
    goto LABEL_18;
  }
  if (!v21)
  {
    id v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueu"
          "e:delegate:delegateQueue:]";
    id v26 = "%s called with null delegateQueue";
    goto LABEL_18;
  }
  if (!v18)
  {
    id v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQu"
            "eue:delegate:delegateQueue:]";
      id v26 = "%s called with null listenerInterface";
      goto LABEL_18;
    }
LABEL_19:

    id v23 = 0;
    goto LABEL_7;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v15, 0, v16, v17, v18, v19, v20, v21, 0);
  id v23 = self;
LABEL_7:

  return v23;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 packetDelegate:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, v24, (uint8_t *)&v25, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null packetDelegate";
    goto LABEL_15;
  }
  if (!v18)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    int v25 = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    id v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      int v25 = 136315138;
      id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:packetDelegate:listenerQueue:delegate:delegateQueue:]";
      long long v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    id v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:packetDelegate:listenerQueue:delegate:delegateQueue:](self, v14, v15, 0, v16, v17, v18, v19);
  id v21 = self;
LABEL_6:

  return v21;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerQueue:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (!v14)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null ikeConfig";
LABEL_15:
    _os_log_fault_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_FAULT, v24, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v16)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null listenerUDPPort";
    goto LABEL_15;
  }
  if (!v18)
  {
    id v23 = ne_log_obj();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315138;
    id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
    long long v24 = "%s called with null delegate";
    goto LABEL_15;
  }
  if (!v19)
  {
    id v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v26 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerQueue:delegate:delegateQueue:]";
      long long v24 = "%s called with null delegateQueue";
      goto LABEL_15;
    }
LABEL_16:

    id v21 = 0;
    goto LABEL_6;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v14, v15, 0, v16, 0, v17, v18, v19, 0);
  id v21 = self;
LABEL_6:

  return v21;
}

- (NEIKEv2Listener)initWithListenerIKEConfig:(id)a3 saSession:(id)a4 listenerUDPPort:(id)a5 listenerInterface:(id)a6 listenerQueue:(id)a7 delegate:(id)a8 delegateQueue:(id)a9
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = v21;
  if (!v15)
  {
    int v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    id v26 = "%s called with null ikeConfig";
LABEL_18:
    _os_log_fault_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_FAULT, v26, buf, 0xCu);
    goto LABEL_19;
  }
  if (!v17)
  {
    int v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    id v26 = "%s called with null listenerUDPPort";
    goto LABEL_18;
  }
  if (!v20)
  {
    int v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    id v26 = "%s called with null delegate";
    goto LABEL_18;
  }
  if (!v21)
  {
    int v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delegate"
          ":delegateQueue:]";
    id v26 = "%s called with null delegateQueue";
    goto LABEL_18;
  }
  if (!v18)
  {
    int v25 = ne_log_obj();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "-[NEIKEv2Listener initWithListenerIKEConfig:saSession:listenerUDPPort:listenerInterface:listenerQueue:delega"
            "te:delegateQueue:]";
      id v26 = "%s called with null listenerInterface";
      goto LABEL_18;
    }
LABEL_19:

    id v23 = 0;
    goto LABEL_7;
  }
  self = -[NEIKEv2Listener initWithListenerIKEConfig:saSession:kernelSASessionName:listenerUDPPort:listenerInterface:listenerQueue:delegate:delegateQueue:includeP2P:](&self->super, v15, v16, 0, v17, v18, v19, v20, v21, 0);
  id v23 = self;
LABEL_7:

  return v23;
}

- (void)invalidatingTransport:(id)a3
{
  if (self) {
    self = (NEIKEv2Listener *)self->_connectionTransports;
  }
  [(NEIKEv2Listener *)self removeObject:a3];
}

- (void)receivePacket:(id)a3 transport:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = [(NEIKEv2Listener *)self listenerQueue];
  dispatch_assert_queue_V2(v8);

  if (!self || !self->_cancelled)
  {
    if (!v6 || (v6[11] & 1) == 0)
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        uint64_t v11 = "Listener received responder packet %@";
LABEL_41:
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (v6[10])
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        uint64_t v11 = "Listener received response packet %@";
        goto LABEL_41;
      }
      goto LABEL_12;
    }
    id v12 = objc_getProperty(v6, v9, 40, 1);
    uint64_t v13 = [v12 value];

    if (v13)
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        uint64_t v11 = "Listener received packet with non-zero responder SPI %@";
        goto LABEL_41;
      }
LABEL_12:

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v6;
        uint64_t v11 = "Listener received non SA_INIT packet %@";
        goto LABEL_41;
      }
      goto LABEL_12;
    }
    if (self)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_packetDelegate);
      id v15 = self->_ikeConfig;
      if (WeakRetained) {
        goto LABEL_21;
      }
      ikeConfig = self->_ikeConfig;
    }
    else
    {
      id v15 = 0;
      ikeConfig = 0;
    }
    id v17 = v15;
    id v18 = ikeConfig;
    id v15 = (NEIKEv2IKESAConfiguration *)[(NEIKEv2IKESAConfiguration *)v18 copy];

    if (v7) {
      id Property = objc_getProperty(v7, v19, 24, 1);
    }
    else {
      id Property = 0;
    }
    id v21 = Property;
    uint64_t v22 = (void *)[v21 copy];
    [(NEIKEv2IKESAConfiguration *)v15 setRemoteEndpoint:v22];

    id WeakRetained = 0;
    uint64_t v10 = 0;
    id v23 = 0;
    if (!self)
    {
LABEL_22:
      BOOL v24 = v23 == 0;
      int v25 = [NEIKEv2Session alloc];
      id v26 = [(NEIKEv2Listener *)self listenerQueue];
      if (v24)
      {
        if (self)
        {
          kernelSASessionName = self->_kernelSASessionName;
          p_super = &v25->super;
          SEL v35 = v15;
          v36 = self;
          v37 = v26;
        }
        else
        {
          p_super = &v25->super;
          SEL v35 = v15;
          v36 = 0;
          v37 = v26;
          kernelSASessionName = 0;
        }
        uint64_t v32 = -[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:kernelSASessionName:transport:packetDelegate:](p_super, v35, v36, v37, kernelSASessionName, v7, v10);
      }
      else
      {
        if (self)
        {
          saSession = self->_saSession;
          id v28 = &v25->super;
          uint64_t v29 = v15;
          BOOL v30 = self;
          uint64_t v31 = v26;
        }
        else
        {
          id v28 = &v25->super;
          uint64_t v29 = v15;
          BOOL v30 = 0;
          uint64_t v31 = v26;
          saSession = 0;
        }
        uint64_t v32 = -[NEIKEv2Session initWithIKEConfig:configurationDelegate:queue:saSession:shouldCopySASession:transport:packetDelegate:](v28, v29, v30, v31, saSession, v7, v10);
      }
      char v38 = v32;

      if (v38)
      {
        if (self) {
          sessionsBeforeAuth = self->_sessionsBeforeAuth;
        }
        else {
          sessionsBeforeAuth = 0;
        }
        [(NSMutableSet *)sessionsBeforeAuth addObject:v38];
        SEL v40 = ne_log_large_obj();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v38;
          __int16 v49 = 2112;
          id v50 = v6;
          _os_log_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_DEFAULT, "Created new session %@ to handle %@", buf, 0x16u);
        }

        [v38 receivePacket:v6];
        if (self)
        {
          id v41 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_initWeak((id *)buf, v41);

          delegateQueue = self->_delegateQueue;
        }
        else
        {
          delegateQueue = 0;
          *(void *)buf = 0;
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __43__NEIKEv2Listener_receivePacket_transport___block_invoke;
        block[3] = &unk_1E5990A30;
        id v43 = delegateQueue;
        objc_copyWeak(&v47, (id *)buf);
        void block[4] = self;
        v46 = v38;
        dispatch_async(v43, block);

        objc_destroyWeak(&v47);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        SEL v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = "-[NEIKEv2Listener receivePacket:transport:]";
          _os_log_fault_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_FAULT, "%s called with null newSession", buf, 0xCu);
        }
      }
      goto LABEL_12;
    }
LABEL_21:
    id v23 = self->_saSession;
    uint64_t v10 = WeakRetained;
    goto LABEL_22;
  }
LABEL_13:
}

uint64_t __43__NEIKEv2Listener_receivePacket_transport___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v4 listener:*(void *)(a1 + 32) receivedNewSession:*(void *)(a1 + 40)];
    }
  }

  return MEMORY[0x1F4181878]();
}

- (void)sessionFailedBeforeRequestingConfiguration:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = (char *)a3;
  id v5 = ne_log_obj();
  uint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "Session %@ failed before requesting configuration", (uint8_t *)&v8, 0xCu);
    }

    if (self) {
      sessionsBeforeAuth = self->_sessionsBeforeAuth;
    }
    else {
      sessionsBeforeAuth = 0;
    }
    [(NSMutableSet *)sessionsBeforeAuth removeObject:v4];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[NEIKEv2Listener sessionFailedBeforeRequestingConfiguration:]";
      _os_log_fault_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_FAULT, "%s called with null session", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)requestConfigurationForSession:(id)a3 sessionConfig:(id)a4 childConfig:(id)a5 validateAuthBlock:(id)a6 responseBlock:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v12;
    _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, "Session %@ requesting configuration", buf, 0xCu);
  }

  if (self)
  {
    [(NSMutableSet *)self->_sessionsBeforeAuth removeObject:v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      id v19 = WeakRetained;
      id v20 = (void *)[v13 copy];
      id v21 = (void *)[v14 copy];
      delegateQueue = self->_delegateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke;
      block[3] = &unk_1E5990990;
      id v28 = v19;
      uint64_t v29 = self;
      id v30 = v12;
      id v31 = v20;
      id v32 = v21;
      id v33 = v15;
      id v34 = v16;
      id v23 = v21;
      id v24 = v20;
      id v25 = v19;
      dispatch_async(delegateQueue, block);

      goto LABEL_6;
    }
  }
  else
  {
    [0 removeObject:v12];
  }
  id v26 = ne_log_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "Listener delegate is nil, returning failure", buf, 2u);
  }

  (*((void (**)(id, void, void, void))v16 + 2))(v16, 0, 0, 0);
LABEL_6:
}

void __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke_2;
  v8[3] = &unk_1E5990968;
  v8[4] = v3;
  id v10 = *(id *)(a1 + 80);
  id v9 = *(id *)(a1 + 48);
  [v2 requestConfigurationForListener:v3 session:v4 sessionConfig:v5 childConfig:v6 validateAuthBlock:v7 responseBlock:v8];
}

void __108__NEIKEv2Listener_requestConfigurationForSession_sessionConfig_childConfig_validateAuthBlock_responseBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 listenerQueue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = *(void *)(a1 + 48);
  id v13 = (id)[v9 copy];

  id v12 = (void *)[v8 copy];
  (*(void (**)(uint64_t, id, void *, uint64_t))(v11 + 16))(v11, v13, v12, a4);
}

@end