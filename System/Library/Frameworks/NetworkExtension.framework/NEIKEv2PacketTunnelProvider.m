@interface NEIKEv2PacketTunnelProvider
- (BOOL)NEIKEv2ProviderAuthenticate:(unsigned char *)a1;
- (BOOL)tryAlternateServerAddresses;
- (NEIKEv2PacketTunnelProvider)init;
- (_BYTE)stopObserving;
- (id)description;
- (uint64_t)invokeStartTunnelCompletionHandler:(uint64_t)a1;
- (uint64_t)tunnelBringup;
- (void)configureProxyPathIfNeeded;
- (void)dealloc;
- (void)handleCompanionProxyDatapathFailure:(void *)a1;
- (void)handleInterfaceChange:(uint64_t)a1;
- (void)handleInterfaceDown;
- (void)invalidateCompanionProxyDatapath;
- (void)invokeCancelTunnel:(unsigned char *)a1;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reset:(uint64_t)a1;
- (void)resolveServerAddressIfNeeded:(void *)a1;
- (void)setInterfaceAvailability;
- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4;
- (void)startIKEv2TunnelWithOptions:(uint64_t)a1;
- (void)startRekeyTimer:(void *)a1;
- (void)startTunnelWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stopIKEv2TunnelWithReason:(void *)a3 completionHandler:;
- (void)stopTunnelWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)wake;
- (void)watchIKESocketChange;
@end

@implementation NEIKEv2PacketTunnelProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scopedPathEvaluator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_companionProxyDatapath, 0);
  objc_storeStrong((id *)&self->_g_notification, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_dnsResolverCompletionHandler, 0);
  objc_storeStrong(&self->_stopTunnelCompletionHandler, 0);
  objc_storeStrong(&self->_startTunnelCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mobikeHandle, 0);
  objc_storeStrong((id *)&self->_getSocketSemaphore, 0);
  objc_storeStrong((id *)&self->_rekey, 0);
  objc_storeStrong((id *)&self->_resolverWaitTimer, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_remoteTrafficSelectors, 0);
  objc_storeStrong((id *)&self->_localTrafficSelectors, 0);

  objc_storeStrong((id *)&self->_ikeConfig, 0);
}

- (void)setTunnelNetworkSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      v9 = "(Set)";
    }
    else {
      v9 = "(Clear)";
    }
    v10 = [(NEProvider *)self defaultPath];
    v11 = [v10 scopedInterface];
    v12 = [(NEProvider *)self defaultPath];
    v13 = v12;
    if (v11) {
      [v12 scopedInterface];
    }
    else {
    v14 = [v12 interface];
    }
    v15 = [v14 interfaceName];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v25 = v15;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: Performing setTunnelNetworkSettings %s (%@)", buf, 0x20u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v25 = __Block_byref_object_copy__12137;
  v26 = __Block_byref_object_dispose__12138;
  v16 = self;
  v27 = v16;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__NEIKEv2PacketTunnelProvider_setTunnelNetworkSettings_completionHandler___block_invoke;
  v20[3] = &unk_1E5990BE8;
  v23 = buf;
  id v17 = v6;
  id v21 = v17;
  id v18 = v7;
  id v22 = v18;
  v19.receiver = v16;
  v19.super_class = (Class)NEIKEv2PacketTunnelProvider;
  [(NEPacketTunnelProvider *)&v19 setTunnelNetworkSettings:v17 completionHandler:v20];

  _Block_object_dispose(buf, 8);
}

void __74__NEIKEv2PacketTunnelProvider_setTunnelNetworkSettings_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ne_log_obj();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (a1[4]) {
      v8 = "(Set)";
    }
    else {
      v8 = "(Clear)";
    }
    if (v7) {
      id Property = objc_getProperty(*(id *)(*(void *)(a1[6] + 8) + 40), v6, 208, 1);
    }
    else {
      id Property = 0;
    }
    v11 = [Property scopedInterface];
    id v12 = *(id *)(*(void *)(a1[6] + 8) + 40);
    if (v11)
    {
      if (v12) {
        id v12 = objc_getProperty(v12, v10, 208, 1);
      }
      id v13 = v12;
      v14 = [v13 scopedInterface];
    }
    else
    {
      if (v12) {
        id v12 = objc_getProperty(v12, v10, 208, 1);
      }
      id v13 = v12;
      v14 = [v13 interface];
    }
    id v22 = v14;
    v23 = [v14 interfaceName];
    int v26 = 138413058;
    uint64_t v27 = v7;
    __int16 v28 = 2080;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v23;
    __int16 v32 = 2112;
    id v33 = v3;
    _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@: setTunnelNetworkSettings %s failed (%@): %@", (uint8_t *)&v26, 0x2Au);
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    uint64_t v16 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (a1[4]) {
      id v17 = "(Set)";
    }
    else {
      id v17 = "(Clear)";
    }
    if (v16) {
      id v18 = objc_getProperty(*(id *)(*(void *)(a1[6] + 8) + 40), v15, 208, 1);
    }
    else {
      id v18 = 0;
    }
    v11 = [v18 scopedInterface];
    id v20 = *(id *)(*(void *)(a1[6] + 8) + 40);
    if (v11)
    {
      if (v20) {
        id v20 = objc_getProperty(v20, v19, 208, 1);
      }
      id v13 = v20;
      id v21 = [v13 scopedInterface];
    }
    else
    {
      if (v20) {
        id v20 = objc_getProperty(v20, v19, 208, 1);
      }
      id v13 = v20;
      id v21 = [v13 interface];
    }
    id v22 = v21;
    v23 = [v21 interfaceName];
    int v26 = 138412802;
    uint64_t v27 = v16;
    __int16 v28 = 2080;
    v29 = v17;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings %s completed (%@)", (uint8_t *)&v26, 0x20u);
  }

LABEL_27:
  if (a1[5])
  {
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v26 = 138412290;
      uint64_t v27 = v25;
      _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEFAULT, "%@: setTunnelNetworkSettings calling completionHandler", (uint8_t *)&v26, 0xCu);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  v10 = (NEIKEv2PacketTunnelProvider *)a4;
  id v12 = a5;
  if (v10 == self)
  {
    if ([v9 isEqualToString:@"protocolConfiguration"])
    {
      queue = v10->_queue;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v20[3] = &unk_1E59932C0;
      void v20[4] = v10;
      uint64_t v16 = v20;
      goto LABEL_12;
    }
    if ([v9 isEqualToString:@"defaultPath"])
    {
      queue = v10->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      block[3] = &unk_1E59932C0;
      block[4] = v10;
      uint64_t v16 = block;
      goto LABEL_12;
    }
  }
  if (self) {
    id Property = objc_getProperty(self, v11, 272, 1);
  }
  else {
    id Property = 0;
  }
  v14 = (NEIKEv2PacketTunnelProvider *)Property;
  if (v14 == v10)
  {
    int v17 = [v9 isEqualToString:@"path"];

    if (!v17) {
      goto LABEL_13;
    }
    queue = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v18[3] = &unk_1E59932C0;
    v18[4] = self;
    uint64_t v16 = v18;
LABEL_12:
    dispatch_async(queue, v16);
    goto LABEL_13;
  }

LABEL_13:
}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v35[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(unsigned char *)(v1 + 77) & 1) == 0)
  {
    uint64_t v2 = *(void *)(v1 + 248);
    char v3 = *(unsigned char *)(v1 + 73);
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v1;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, "%@: handleConfigChange", (uint8_t *)&buf, 0xCu);
    }

    if (objc_getProperty((id)v1, v5, 240, 1))
    {
      if (*(unsigned char *)(v1 + 78))
      {
        *(unsigned char *)(v1 + 77) = 1;
        objc_initWeak((id *)&v28, (id)v1);
        uint64_t v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel due to config change", (uint8_t *)&buf, 0xCu);
        }

        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v33 = __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke;
        uint64_t v34 = &unk_1E5992C58;
        objc_copyWeak(v35, (id *)&v28);
        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((unsigned char *)v1, 0, &buf);
        objc_destroyWeak(v35);
        objc_destroyWeak((id *)&v28);
      }
      else
      {
        id v6 = ne_log_obj();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v1;
          _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel due to Config Change", (uint8_t *)&buf, 0xCu);
        }

        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((unsigned char *)v1, 0, 0);
        uint64_t v7 = objc_alloc_init(NEIKEv2Server);
        objc_setProperty_atomic((id)v1, v8, v7, 128);

        id v9 = [(id)v1 protocolConfiguration];
        v10 = [v9 serverAddress];
        id Property = objc_getProperty((id)v1, v11, 128, 1);
        if (Property) {
          objc_setProperty_atomic(Property, v13, v10, 16);
        }

        *(void *)(v1 + 248) = v2;
        *(unsigned char *)(v1 + 73) = v3;
        v14 = [NEIKEv2MOBIKE alloc];
        id v16 = objc_getProperty((id)v1, v15, 264, 1);
        int v17 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v14->super.isa, v16, (void *)v1);
        objc_setProperty_atomic((id)v1, v18, v17, 168);

        id v20 = objc_getProperty((id)v1, v19, 128, 1);
        if (v20) {
          objc_setProperty_atomic(v20, v21, 0, 24);
        }
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v33 = __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke_169;
        uint64_t v34 = &unk_1E5990AD8;
        v35[0] = (id)v1;
        -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:]((void *)v1, &buf);
        [(id)v1 setReasserting:(~*(_DWORD *)(v1 + 84) & 0xF) == 0];
        *(_DWORD *)(v1 + 84) &= 0xFFFFFFF0;
        id v22 = *(void **)(v1 + 88);
        *(void *)(v1 + 88) = 0;

        v23 = *(void **)(v1 + 96);
        *(void *)(v1 + 96) = 0;

        v24 = *(void **)(v1 + 104);
        *(void *)(v1 + 104) = 0;

        uint64_t v25 = ne_log_obj();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412546;
          uint64_t v29 = v1;
          __int16 v30 = 2080;
          v31 = "-[NEIKEv2PacketTunnelProvider handleConfigChange]";
          _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_DEFAULT, "%@: %s: bringing up tunnel", (uint8_t *)&v28, 0x16u);
        }
      }
    }
    else
    {
      int v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v1;
        _os_log_debug_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_DEBUG, "%@: No tunnel, ignore config change", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1 || (*(unsigned char *)(v1 + 77) & 1) != 0) {
    return;
  }
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = [(id)v1 defaultPath];
    uint64_t v4 = [v3 scopedInterface];
    SEL v5 = [(id)v1 defaultPath];
    v101 = v5;
    if (v4) {
      [v5 scopedInterface];
    }
    else {
    id v6 = [v5 interface];
    }
    uint64_t v7 = [v6 interfaceName];
    SEL v8 = [(id)v1 defaultPath];
    id v9 = [v8 scopedInterface];
    v10 = [(id)v1 defaultPath];
    SEL v11 = v10;
    v102 = (void *)v4;
    v104 = v3;
    if (v9) {
      [v10 scopedInterface];
    }
    else {
    id v12 = [v10 interface];
    }
    uint64_t v13 = [v12 interfaceIndex];
    v14 = [(id)v1 defaultPath];
    *(_DWORD *)long long buf = 138413058;
    uint64_t v107 = v1;
    __int16 v108 = 2112;
    *(void *)v109 = v7;
    *(_WORD *)&v109[8] = 2048;
    uint64_t v110 = v13;
    __int16 v111 = 1024;
    LODWORD(v112) = [v14 status] == 1;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: New scoped interface %@ (%lu) (SATISFIED: %d)", buf, 0x26u);
  }
  SEL v15 = [(id)v1 defaultPath];
  id v16 = [v15 scopedInterface];
  int v17 = [(id)v1 defaultPath];
  SEL v18 = v17;
  if (v16) {
    [v17 scopedInterface];
  }
  else {
  SEL v19 = [v17 interface];
  }
  uint64_t v20 = [v19 interfaceIndex];
  id Property = objc_getProperty((id)v1, v21, 240, 1);
  if (v20 == -[NEIKEv2Session interfaceIndex]((uint64_t)Property))
  {
    id v24 = objc_getProperty((id)v1, v23, 240, 1);
    int v25 = -[NEIKEv2Session interfaceIndex]((uint64_t)v24);

    if (v25)
    {
      int v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = *(void *)(v1 + 248);
        int v28 = [(id)v1 defaultPath];
        uint64_t v29 = [v28 scopedInterface];
        __int16 v30 = [(id)v1 defaultPath];
        v31 = v30;
        if (v29) {
          [v30 scopedInterface];
        }
        else {
        v73 = [v30 interface];
        }
        uint64_t v74 = [v73 interfaceIndex];
        *(_DWORD *)long long buf = 138412802;
        uint64_t v107 = v1;
        __int16 v108 = 2048;
        *(void *)v109 = v27;
        *(_WORD *)&v109[8] = 2048;
        uint64_t v110 = v74;
        _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_INFO, "%@: Ignoring interface change to: %lu --> %lu\n", buf, 0x20u);
      }
LABEL_85:

      return;
    }
  }
  else
  {
  }
  __int16 v32 = [(id)v1 defaultPath];
  objc_setProperty_atomic((id)v1, v33, v32, 208);

  uint64_t v34 = &OBJC_IVAR___NEIKEv2IKESA__error;
  uint64_t v35 = *(void *)(v1 + 248);
  char v103 = *(unsigned char *)(v1 + 75);
  char v105 = *(unsigned char *)(v1 + 74);
  if (objc_msgSend(objc_getProperty((id)v1, v36, 208, 1), "status") == 1)
  {
    v38 = objc_msgSend(objc_getProperty((id)v1, v37, 208, 1), "scopedInterface");
    id v40 = objc_getProperty((id)v1, v39, 208, 1);
    if (v38) {
      [v40 scopedInterface];
    }
    else {
    v41 = [v40 interface];
    }
    *(void *)(v1 + 248) = [v41 interfaceIndex];

    *(void *)(v1 + 256) = objc_msgSend(objc_getProperty((id)v1, v42, 208, 1), "status");
    v44 = objc_msgSend(objc_getProperty((id)v1, v43, 208, 1), "scopedInterface");
    id v46 = objc_getProperty((id)v1, v45, 208, 1);
    v47 = v46;
    if (v44) {
      [v46 scopedInterface];
    }
    else {
    v48 = [v46 interface];
    }
    if ([v48 type] == 2) {
      *(unsigned char *)(v1 + 73) = 1;
    }
    else {
      *(unsigned char *)(v1 + 73) = objc_msgSend(objc_getProperty((id)v1, v49, 208, 1), "usesInterfaceType:", 2);
    }

    v51 = objc_msgSend(objc_getProperty((id)v1, v50, 208, 1), "scopedInterface");
    id v53 = objc_getProperty((id)v1, v52, 208, 1);
    if (v51) {
      [v53 scopedInterface];
    }
    else {
    v54 = [v53 interface];
    }
    *(unsigned char *)(v1 + 74) = [v54 subtype] == 5001;
  }
  else
  {
    *(void *)(v1 + 248) = 0;
    *(void *)(v1 + 256) = 2;
    *(unsigned char *)(v1 + 73) = 0;
    *(unsigned char *)(v1 + 74) = 0;
  }
  *(unsigned char *)(v1 + 75) = 0;
  v55 = objc_msgSend(objc_getProperty((id)v1, v37, 208, 1), "interface");
  uint64_t v56 = [v55 subtype];

  if (v56 != 5001) {
    goto LABEL_72;
  }
  uint64_t v58 = 1;
  if ((objc_msgSend(objc_getProperty((id)v1, v57, 208, 1), "usesInterfaceType:", 1) & 1) == 0)
  {
    uint64_t v58 = 2;
    if (!objc_msgSend(objc_getProperty((id)v1, v59, 208, 1), "usesInterfaceType:", 2)) {
      uint64_t v58 = 0;
    }
  }
  if (objc_msgSend(objc_getProperty((id)v1, v59, 208, 1), "usesInterfaceType:", 3)) {
    uint64_t v61 = 3;
  }
  else {
    uint64_t v61 = v58;
  }
  *(unsigned char *)(v1 + 75) = v61 != 0;
  id v62 = objc_getProperty((id)v1, v60, 128, 1);
  if (!v62
    || (id v64 = objc_getProperty(v62, v63, 56, 1)) == 0
    || (v65 = v64,
        v66 = (os_unfair_lock_s *)objc_getProperty((id)v1, v63, 232, 1),
        unsigned int v67 = -[NEIKEv2CompanionDatapath connected](v66),
        v65,
        !v67))
  {
    id v88 = objc_getProperty((id)v1, v63, 128, 1);
    if (v88)
    {
      id v90 = objc_getProperty(v88, v89, 56, 1);
      uint64_t v34 = &OBJC_IVAR___NEIKEv2IKESA__error;
      if (v90)
      {
        char v91 = *(unsigned char *)(v1 + 75);

        if ((v91 & 1) == 0)
        {
          int v26 = ne_log_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v107 = v1;
            _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_DEFAULT, "%@: No outbound companion path detected. Ignoring companion path", buf, 0xCu);
          }
          goto LABEL_85;
        }
      }
    }
    else
    {
      uint64_t v34 = &OBJC_IVAR___NEIKEv2IKESA__error;
    }
    if ((v105 & 1) != 0 && (*(unsigned char *)(v1 + 75) & 1) != 0 && (v103 & 1) == 0)
    {
      v98 = ne_log_obj();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v107 = v1;
        _os_log_impl(&dword_19DDAF000, v98, OS_LOG_TYPE_DEFAULT, "%@: outbound companion path detected", buf, 0xCu);
      }

      goto LABEL_91;
    }
    goto LABEL_72;
  }
  if (objc_msgSend(objc_getProperty((id)v1, v63, 208, 1), "status") == 1)
  {
    if ((*(unsigned char *)(v1 + 75) & 1) == 0)
    {
      v69 = ne_log_obj();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v107 = v1;
        v70 = "%@: No companion outbound path detected. Cancelling companion path";
        v71 = v69;
        uint32_t v72 = 12;
LABEL_63:
        _os_log_impl(&dword_19DDAF000, v71, OS_LOG_TYPE_DEFAULT, v70, buf, v72);
        goto LABEL_64;
      }
      goto LABEL_64;
    }
    v76 = objc_getProperty((id)v1, v68, 232, 1);
    if (v76) {
      uint64_t v78 = v76[3];
    }
    else {
      uint64_t v78 = 0;
    }
    if (v61 != v78 || (*(unsigned char *)(v1 + 79) & 1) != 0)
    {
      v69 = ne_log_obj();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v82 = objc_getProperty((id)v1, v81, 232, 1);
        if (v82) {
          int v83 = v82[6];
        }
        else {
          int v83 = 0;
        }
        *(_DWORD *)long long buf = 138412802;
        uint64_t v107 = v1;
        __int16 v108 = 1024;
        *(_DWORD *)v109 = v83;
        *(_WORD *)&v109[4] = 1024;
        *(_DWORD *)&v109[6] = v61;
        v70 = "%@: MOBIKE tunnel due to Companion network path change %u --> %u";
        v71 = v69;
        uint32_t v72 = 24;
        goto LABEL_63;
      }
LABEL_64:

      [(NEIKEv2PacketTunnelProvider *)(void *)v1 invalidateCompanionProxyDatapath];
      v86 = objc_getProperty((id)v1, v85, 128, 1);
      [(NEIKEv2Server *)v86 resetPathProxyState];
      uint64_t v34 = &OBJC_IVAR___NEIKEv2IKESA__error;
LABEL_91:
      v99 = ne_log_obj();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
      {
        uint64_t v100 = *(void *)(v1 + v34[192]);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v107 = v1;
        __int16 v108 = 2048;
        *(void *)v109 = v35;
        *(_WORD *)&v109[8] = 2048;
        uint64_t v110 = v100;
        _os_log_impl(&dword_19DDAF000, v99, OS_LOG_TYPE_INFO, "%@: Scoped interface changed: %lu --> %lu\n", buf, 0x20u);
      }

      -[NEIKEv2PacketTunnelProvider handleInterfaceChange:](v1, (const char *)1);
      return;
    }
    id v79 = objc_getProperty((id)v1, v77, 240, 1);
    objc_msgSend(v79, "sendKeepaliveWithRetries:retryIntervalInMilliseconds:callbackQueue:callback:", 3, 1000, objc_getProperty((id)v1, v80, 264, 1), &__block_literal_global_12409);

    uint64_t v34 = &OBJC_IVAR___NEIKEv2IKESA__error;
LABEL_72:
    v92 = ne_log_obj();
    if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
    {
      uint64_t v93 = *(void *)(v1 + v34[192]);
      if (*(void *)(v1 + 256) == 1) {
        v94 = "SATISFIED";
      }
      else {
        v94 = "UNSATISFIED";
      }
      char v95 = *(unsigned char *)(v1 + 73);
      *(_DWORD *)long long buf = 138413058;
      if (v95) {
        v96 = " Cellular";
      }
      else {
        v96 = "";
      }
      uint64_t v107 = v1;
      __int16 v108 = 2048;
      *(void *)v109 = v93;
      *(_WORD *)&v109[8] = 2080;
      uint64_t v110 = (uint64_t)v94;
      __int16 v111 = 2080;
      v112 = v96;
      _os_log_impl(&dword_19DDAF000, v92, OS_LOG_TYPE_INFO, "%@: Updated scoped ifIndex %lu (%s%s)", buf, 0x2Au);
    }

    if (v35 == *(void *)(v1 + v34[192]) && (!v35 || objc_getProperty((id)v1, v97, 240, 1)))
    {
      int v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v107 = v1;
        _os_log_debug_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_DEBUG, "%@: Scoped interface unchanged, ignore\n", buf, 0xCu);
      }
      goto LABEL_85;
    }
    goto LABEL_91;
  }
  v75 = ne_log_obj();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v107 = v1;
    _os_log_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_DEFAULT, "%@: tearing down tunnel due to Companion link loss", buf, 0xCu);
  }

  -[NEIKEv2PacketTunnelProvider handleInterfaceDown]((void *)v1);
}

void __78__NEIKEv2PacketTunnelProvider_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1 && (v1[77] & 1) == 0)
  {
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = objc_msgSend(objc_getProperty(v1, v3, 272, 1), "path");
      uint64_t v5 = [v4 scopedInterface];
      id v7 = objc_getProperty(v1, v6, 272, 1);
      SEL v8 = [v7 path];
      __int16 v32 = (void *)v5;
      SEL v33 = v4;
      __int16 v30 = v8;
      if (v5) {
        [v8 scopedInterface];
      }
      else {
      id v9 = [v8 interface];
      }
      v10 = [v9 interfaceName];
      id v12 = objc_msgSend(objc_getProperty(v1, v11, 272, 1), "path");
      uint64_t v13 = [v12 scopedInterface];
      id v15 = objc_getProperty(v1, v14, 272, 1);
      id v16 = [v15 path];
      int v17 = v16;
      v31 = v7;
      uint64_t v29 = v9;
      if (v13) {
        [v16 scopedInterface];
      }
      else {
      SEL v18 = [v16 interface];
      }
      uint64_t v19 = [v18 interfaceIndex];
      SEL v21 = objc_msgSend(objc_getProperty(v1, v20, 272, 1), "path");
      *(_DWORD *)long long buf = 138413058;
      uint64_t v35 = v1;
      __int16 v36 = 2112;
      v37 = v10;
      __int16 v38 = 2048;
      uint64_t v39 = v19;
      __int16 v40 = 1024;
      BOOL v41 = [v21 status] == 1;
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: Scoped path changed %@ (%lu) (SATISFIED: %d)", buf, 0x26u);
    }
    v23 = objc_msgSend(objc_getProperty(v1, v22, 272, 1), "path");
    uint64_t v24 = [v23 status];

    if (v24 != 1)
    {
      int v25 = ne_log_obj();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v35 = v1;
        _os_log_impl(&dword_19DDAF000, v25, OS_LOG_TYPE_INFO, "%@: Scoped path went UNSATISFIED, flap tunnel", buf, 0xCu);
      }

      if (objc_getProperty(v1, v26, 272, 1))
      {
        objc_msgSend(objc_getProperty(v1, v27, 272, 1), "removeObserver:forKeyPath:", v1, @"path");
        objc_setProperty_atomic(v1, v28, 0, 272);
      }
      -[NEIKEv2PacketTunnelProvider handleInterfaceChange:]((uint64_t)v1, (const char *)1);
    }
  }
}

- (void)handleInterfaceChange:(uint64_t)a1
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int v2 = (int)a2;
  [(NEIKEv2PacketTunnelProvider *)(void *)a1 configureProxyPathIfNeeded];
  id v5 = objc_getProperty((id)a1, v4, 240, 1);
  if (v5) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v2 == 0;
  }
  if (v7)
  {
  }
  else if ((*(unsigned char *)(a1 + 78) & 1) == 0)
  {
    SEL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 248);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v46 = a1;
      __int16 v47 = 2048;
      uint64_t v48 = v9;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting tunnel on scoped interface UP (%lu)", buf, 0x16u);
    }

    if (*(void *)(a1 + 256) == 1)
    {
      uint64_t v10 = [(id)a1 protocolConfiguration];
      if (v10)
      {
        SEL v11 = (void *)v10;
        id v12 = [(id)a1 protocolConfiguration];
        uint64_t v13 = [v12 serverAddress];

        if (v13)
        {
          SEL v14 = ne_log_obj();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = *(void *)(a1 + 248);
            *(_DWORD *)long long buf = 138412546;
            uint64_t v46 = a1;
            __int16 v47 = 2048;
            uint64_t v48 = v15;
            _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, "%@: Calling startIKEv2TunnelWithOptions on scoped interface UP (%lu)", buf, 0x16u);
          }

          -[NEIKEv2PacketTunnelProvider reset:](a1, 1);
          id Property = objc_getProperty((id)a1, v16, 112, 1);
          -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:](a1, Property);
        }
      }
    }
    return;
  }
  if (*(unsigned char *)(a1 + 79))
  {
    id v23 = objc_getProperty((id)a1, v6, 128, 1);
    id v25 = objc_getProperty((id)a1, v24, 208, 1);
    -[NEIKEv2Server getViableServerAddressForPath:](v23, v25);
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    id v27 = objc_getProperty((id)a1, v26, 168, 1);
    if (v27) {
      objc_setProperty_atomic(v27, v28, 0, 16);
    }
    uint64_t v29 = objc_getProperty((id)a1, v28, 128, 1);
    if (v29 && (v29[8] & 1) != 0)
    {
      if (*(unsigned char *)(a1 + 75))
      {
        id v33 = objc_getProperty((id)a1, v30, 128, 1);
        if (v33) {
          id v33 = objc_getProperty(v33, v34, 56, 1);
        }
        id v31 = v33;
        uint64_t v35 = [v31 port];
        id v37 = objc_getProperty((id)a1, v36, 168, 1);
        if (v37) {
          objc_setProperty_atomic(v37, v38, v35, 16);
        }
      }
      else
      {
        id v31 = v43;
        id v43 = 0;
      }
    }
    id v39 = objc_getProperty((id)a1, v30, 168, 1);
    __int16 v40 = *(void **)(a1 + 248);
    id v41 = v39;
    uint64_t v42 = [(id)a1 defaultPath];
    -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v41, v40, [v42 status], v43, 0);
  }
  else if (v2)
  {
    if (*(unsigned char *)(a1 + 78)) {
      goto LABEL_32;
    }
    if (*(void *)(a1 + 256) != 1) {
      goto LABEL_32;
    }
    uint64_t v18 = [(id)a1 protocolConfiguration];
    if (!v18) {
      goto LABEL_32;
    }
    uint64_t v19 = (void *)v18;
    SEL v20 = [(id)a1 protocolConfiguration];
    SEL v21 = [v20 serverAddress];

    if (v21)
    {
      SEL v22 = ne_log_obj();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v46 = a1;
        _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel before reattempting on new path", buf, 0xCu);
      }

      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke;
      v44[3] = &unk_1E59932C0;
      v44[4] = a1;
      -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:]((unsigned char *)a1, 0, v44);
    }
    else
    {
LABEL_32:
      __int16 v32 = ne_log_obj();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v46 = a1;
        _os_log_impl(&dword_19DDAF000, v32, OS_LOG_TYPE_DEFAULT, "%@: Disconnect tunnel: scoped interface changed / status not satisfied", buf, 0xCu);
      }

      -[NEIKEv2PacketTunnelProvider handleInterfaceDown]((void *)a1);
    }
  }
}

- (void)configureProxyPathIfNeeded
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  char v3 = objc_msgSend(objc_getProperty(a1, a2, 208, 1), "interface");
  if ([v3 subtype] != 5001)
  {

    goto LABEL_20;
  }
  id v5 = objc_msgSend(objc_getProperty(a1, v4, 208, 1), "proxySettings");

  if (!v5)
  {
LABEL_20:
    [(NEIKEv2PacketTunnelProvider *)a1 invalidateCompanionProxyDatapath];
    id Property = objc_getProperty(a1, v23, 128, 1);
    [(NEIKEv2Server *)Property resetPathProxyState];
    return;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  self = a1;
  BOOL v7 = objc_msgSend(objc_getProperty(a1, v6, 208, 1), "proxySettings");
  uint64_t v34 = [v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v34)
  {
    uint64_t v8 = *(void *)v43;
    uint64_t v9 = *MEMORY[0x1E4F41ED0];
    uint64_t v10 = *MEMORY[0x1E4F41ED8];
    id v37 = v7;
    uint64_t v33 = *(void *)v43;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v35 = v11;
        id v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v39 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              uint64_t v19 = [v18 objectForKeyedSubscript:v9];
              SEL v20 = [v18 objectForKeyedSubscript:v10];
              SEL v21 = [v18 objectForKeyedSubscript:@"kCFStreamPropertySOCKSVersion"];
              if ([v21 isEqualToString:@"shoes"])
              {
                SEL v26 = objc_getProperty(self, v22, 128, 1);
                if (v26) {
                  v26[8] = 1;
                }
                id v27 = (void *)MEMORY[0x1E4F38BF0];
                SEL v28 = [v19 stringValue];
                uint64_t v29 = [v27 endpointWithHostname:v20 port:v28];
                id v31 = objc_getProperty(self, v30, 128, 1);
                if (v31) {
                  objc_setProperty_atomic(v31, v32, v29, 56);
                }

                BOOL v7 = v37;
                goto LABEL_28;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v11 = v35 + 1;
        BOOL v7 = v37;
        uint64_t v8 = v33;
      }
      while (v35 + 1 != v34);
      uint64_t v34 = [v37 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v34);
  }
LABEL_28:
}

- (void)reset:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    SEL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      uint64_t v24 = a1;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, "%@: Reset", (uint8_t *)&v23, 0xCu);
    }

    if (a2 && objc_getProperty((id)a1, v5, 240, 1)) {
      objc_setProperty_atomic((id)a1, v6, 0, 240);
    }
    BOOL v7 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    uint64_t v8 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    uint64_t v9 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;

    *(_DWORD *)(a1 + 84) = 0;
    *(void *)(a1 + 120) = 0;
    *(unsigned char *)(a1 + 76) = 0;
    uint64_t v10 = *(void **)(a1 + 192);
    *(void *)(a1 + 192) = 0;

    uint64_t v11 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;

    id v12 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = 0;

    *(unsigned char *)(a1 + 79) = 0;
    *(unsigned char *)(a1 + 80) = 0;
    uint64_t v14 = *(void **)(a1 + 152);
    if (v14)
    {
      [(NEIKEv2Rekey *)v14 invalidateTimers];
      uint64_t v15 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = 0;
    }
    uint64_t v16 = *(void **)(a1 + 136);
    if (v16)
    {
      int v17 = [(id)a1 context];
      [v16 removeObserver:v17 forKeyPath:@"resolvedEndpoints"];

      uint64_t v18 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = 0;
    }
    uint64_t v19 = *(NSObject **)(a1 + 144);
    if (v19)
    {
      dispatch_source_cancel(v19);
      SEL v20 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = 0;
    }
    if (objc_getProperty((id)a1, v13, 272, 1))
    {
      objc_msgSend(objc_getProperty((id)a1, v21, 272, 1), "removeObserver:forKeyPath:", a1, @"path");
      objc_setProperty_atomic((id)a1, v22, 0, 272);
    }
  }
}

- (void)startIKEv2TunnelWithOptions:(uint64_t)a1
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 77))
    {
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v59 = a1;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Start IKEv2 Tunnel Skipped, provider disposed", buf, 0xCu);
      }
      goto LABEL_9;
    }
    if (objc_getProperty((id)a1, v3, 240, 1))
    {
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v59 = a1;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Start IKEv2 Tunnel Skipped, has active ike session", buf, 0xCu);
      }
LABEL_9:

      goto LABEL_10;
    }
    if (!v4)
    {
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v59 = a1;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: Start IKEv2 Tunnel Skipped, null options", buf, 0xCu);
      }
      goto LABEL_9;
    }
    SEL v6 = [(id)a1 protocolConfiguration];

    if (v6)
    {
      uint64_t v8 = [(id)a1 protocolConfiguration];
      *(void *)(a1 + 200) = [v8 tunnelKind];
    }
    objc_setProperty_atomic((id)a1, v7, v4, 112);
    if (!*(void *)(a1 + 248) || *(void *)(a1 + 256) != 1)
    {
      id v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void **)(a1 + 248);
        uint64_t v25 = *(void *)(a1 + 256);
        *(_DWORD *)long long buf = 138412802;
        uint64_t v59 = a1;
        __int16 v60 = 2048;
        uint64_t v61 = v24;
        __int16 v62 = 2048;
        uint64_t v63 = v25;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "%@: Start IKEv2 Tunnel Skipped, interface not ready (ifindex %lu, Satisfied %lu)", buf, 0x20u);
      }
      goto LABEL_9;
    }
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(a1 + 248);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v59 = a1;
      __int16 v60 = 2048;
      uint64_t v61 = v10;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@: Starting IKEv2 Tunnel on scoped ifindex %lu", buf, 0x16u);
    }

    uint64_t v11 = [(id)a1 protocolConfiguration];
    if (!v11) {
      goto LABEL_33;
    }
    id v12 = [(id)a1 protocolConfiguration];
    id v13 = [v12 serverAddress];
    BOOL v14 = v13 == 0;

    if (v14)
    {
LABEL_33:
      SEL v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v59 = a1;
        _os_log_error_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_ERROR, "%@: NULL configuration / serverAddress", buf, 0xCu);
      }

      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:]((unsigned char *)a1, (const char *)0xA);
    }
    else
    {
      uint64_t v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v53 = [(id)a1 protocolConfiguration];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v59 = a1;
        __int16 v60 = 2112;
        uint64_t v61 = v53;
        _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@: Starting IKEv2 Tunnel with configuration %@", buf, 0x16u);
      }
      if (ne_session_disable_restrictions()
        && ([(id)a1 protocolConfiguration],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            [v16 serverAddress],
            int v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v17 isEqualToString:@"0.0.0.0"],
            v17,
            v16,
            v18))
      {
        uint64_t v19 = ne_log_obj();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v59 = a1;
          _os_log_debug_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEBUG, "%@: Starting a tunnel to 0.0.0.0, marking connected immediately", buf, 0xCu);
        }

        SEL v20 = [(NETunnelNetworkSettings *)[NEPacketTunnelNetworkSettings alloc] initWithTunnelRemoteAddress:@"0.0.0.0"];
        SEL v21 = [[NEIPv4Settings alloc] initWithAddresses:&unk_1EF08D360 subnetMasks:&unk_1EF08D378];
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        int v23 = [[NEIPv4Route alloc] initWithDestinationAddress:@"0.0.0.0" subnetMask:@"255.255.255.255"];
        [v22 addObject:v23];

        [(NEIPv4Settings *)v21 setIncludedRoutes:v22];
        [(NEPacketTunnelNetworkSettings *)v20 setIPv4Settings:v21];
        objc_initWeak((id *)buf, (id)a1);
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke;
        v56[3] = &unk_1E59924B8;
        objc_copyWeak(&v57, (id *)buf);
        [(id)a1 setTunnelNetworkSettings:v20 completionHandler:v56];
        objc_destroyWeak(&v57);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        id v27 = [(id)a1 protocolConfiguration];
        if (![v27 useExtendedAuthentication]) {
          goto LABEL_40;
        }
        SEL v28 = [v27 username];
        BOOL v29 = [v28 length] == 0;

        if (v29) {
          goto LABEL_40;
        }
        SEL v30 = [v4 objectForKeyedSubscript:@"Password"];
        BOOL v31 = v30 == 0;

        if (!v31) {
          goto LABEL_40;
        }
        __int16 v32 = [v27 passwordKeychainItem];
        uint64_t v33 = [v32 persistentReference];
        BOOL v34 = v33 == 0;

        if (v34)
        {
          if (!-[NEIKEv2PacketTunnelProvider NEIKEv2ProviderAuthenticate:]((unsigned char *)a1, v4))
          {
            v54 = ne_log_obj();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v59 = a1;
              _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "%@: Cancel IKEv2 tunnel, popping prompt for password failed", buf, 0xCu);
            }

            -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:]((unsigned char *)a1, (const char *)0x17);
          }
        }
        else
        {
LABEL_40:
          uint64_t v35 = objc_alloc_init(NEIKEv2Server);
          objc_setProperty_atomic((id)a1, v36, v35, 128);

          id v37 = [NEIKEv2MOBIKE alloc];
          id Property = objc_getProperty((id)a1, v38, 264, 1);
          long long v40 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v37->super.isa, Property, (void *)a1);
          objc_setProperty_atomic((id)a1, v41, v40, 168);

          long long v42 = [(id)a1 protocolConfiguration];
          long long v43 = [v42 serverAddress];
          id v45 = objc_getProperty((id)a1, v44, 128, 1);
          if (v45) {
            objc_setProperty_atomic(v45, v46, v43, 16);
          }

          uint64_t v48 = objc_msgSend(objc_getProperty((id)a1, v47, 208, 1), "scopedInterface");
          id v50 = objc_getProperty((id)a1, v49, 208, 1);
          if (v48) {
            [v50 scopedInterface];
          }
          else {
          v51 = [v50 interface];
          }
          *(void *)(a1 + 248) = [v51 interfaceIndex];

          *(void *)(a1 + 256) = objc_msgSend(objc_getProperty((id)a1, v52, 208, 1), "status");
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_114;
          v55[3] = &unk_1E5990AD8;
          v55[4] = a1;
          -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:]((void *)a1, v55);
        }
      }
    }
  }
LABEL_10:
}

void __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 264, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke_2;
  block[3] = &unk_1E59932C0;
  block[4] = v4;
  dispatch_async(Property, block);
}

- (void)stopIKEv2TunnelWithReason:(void *)a3 completionHandler:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    SEL v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@: Stopping IKEv2 Tunnel with reason %ld", buf, 0x16u);
    }

    id Property = objc_getProperty(a1, v7, 128, 1);
    if (Property) {
      objc_setProperty_atomic(Property, v9, 0, 64);
    }
    if (objc_getProperty(a1, v9, 240, 1))
    {
      -[NEIKEv2PacketTunnelProvider reset:]((uint64_t)a1, 0);
      if (objc_getProperty(a1, v11, 240, 1))
      {
        if (a1[42])
        {
          uint64_t v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEFAULT, "%@: tunnelTeardown (graceful) - Clearing tunnel configuration", buf, 0xCu);
          }

          [a1 setTunnelNetworkSettings:0 completionHandler:0];
          int v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, "%@: tunnelTeardown (graceful) - Invalidating session", buf, 0xCu);
          }

          id v19 = objc_getProperty(a1, v18, 240, 1);
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __45__NEIKEv2PacketTunnelProvider_tunnelTeardown__block_invoke;
          uint64_t v25 = &unk_1E59932C0;
          SEL v26 = a1;
          [v19 invalidateWithCompletionHandler:1 completionHandler:buf];
        }
        else
        {
          objc_msgSend(objc_getProperty(a1, v12, 240, 1), "invalidate");
          id v13 = ne_log_obj();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = objc_getProperty(a1, v14, 240, 1);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEFAULT, "%@: Invalidated session (%@)", buf, 0x16u);
          }
        }
      }
      if (a1[42])
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __75__NEIKEv2PacketTunnelProvider_stopIKEv2TunnelWithReason_completionHandler___block_invoke;
        v22[3] = &unk_1E59936F8;
        v22[4] = a1;
        int v23 = v5;
        SEL v20 = _Block_copy(v22);
        objc_setProperty_atomic_copy(a1, v21, v20, 184);

        goto LABEL_22;
      }
      objc_setProperty_atomic(a1, v12, 0, 240);
    }
    [(NEIKEv2PacketTunnelProvider *)a1 invalidateCompanionProxyDatapath];
    if (v5) {
      v5[2](v5);
    }
  }
LABEL_22:
}

- (void)handleInterfaceDown
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__12137;
  v4[4] = __Block_byref_object_dispose__12138;
  uint64_t v1 = a1;
  id v5 = v1;
  v1[77] = 1;
  int v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    SEL v7 = v1;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel since interface is down", buf, 0xCu);
  }

  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke;
  v3[3] = &unk_1E5990B78;
  v3[4] = v4;
  [v1 setTunnelNetworkSettings:0 completionHandler:v3];
  _Block_object_dispose(v4, 8);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id Property = *(NSObject **)(*(void *)(v3 + 8) + 40);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 264, 1);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_2;
  block[3] = &unk_1E5990B50;
  block[4] = v3;
  dispatch_async(Property, block);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned char **)(*(void *)(v1 + 8) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_3;
  v3[3] = &unk_1E5990B50;
  v3[4] = v1;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v2, 3, v3);
}

void __50__NEIKEv2PacketTunnelProvider_handleInterfaceDown__block_invoke_3(uint64_t a1)
{
}

- (void)invokeCancelTunnel:(unsigned char *)a1
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = (int)a2;
    a1[77] = 1;
    objc_setProperty_atomic(a1, a2, 0, 216);
    -[NEIKEv2PacketTunnelProvider stopObserving](a1);
    uint64_t v4 = NEResourcesCopyLocalizedNSString(@"VPN_HEADER", @"VPN_HEADER");
    id v5 = 0;
    SEL v6 = 0;
    switch(v2)
    {
      case 4:
        SEL v7 = @"VPN Error 5";
        goto LABEL_14;
      case 7:
      case 18:
      case 28:
        SEL v7 = @"VPN Error 1";
        goto LABEL_14;
      case 10:
        SEL v7 = @"VPN Error 6";
        goto LABEL_14;
      case 17:
        SEL v7 = @"VPN Error 4";
        goto LABEL_14;
      case 20:
        SEL v7 = @"VPN Error 8";
        goto LABEL_14;
      case 23:
        SEL v7 = @"VPN Error 14";
        goto LABEL_14;
      case 24:
      case 25:
        SEL v7 = @"VPN Error 3";
        goto LABEL_14;
      case 26:
        SEL v7 = @"VPN Error 20";
        goto LABEL_14;
      case 27:
        SEL v7 = @"VPN Error 21";
        goto LABEL_14;
      case 29:
        SEL v7 = @"VPN Error 22";
        goto LABEL_14;
      case 30:
        SEL v7 = @"VPN Error 23";
LABEL_14:
        uint64_t v8 = NEResourcesCopyLocalizedNSString(v7, v7);
        id v5 = (void *)v8;
        SEL v6 = 0;
        if (v4 && v8)
        {
          uint64_t v9 = *MEMORY[0x1E4F28568];
          v11[0] = @"LocalizedHeader";
          v11[1] = v9;
          v12[0] = v4;
          v12[1] = v8;
          SEL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
        }
        break;
      default:
        break;
    }
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IKEv2ProviderDisconnectionErrorDomain" code:v2 userInfo:v6];
    if ((-[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]((uint64_t)a1, v10) & 1) == 0) {
      [a1 cancelTunnelWithError:v10];
    }
  }
}

- (_BYTE)stopObserving
{
  if (result)
  {
    uint64_t v1 = result;
    if (result[81])
    {
      [result removeObserver:result forKeyPath:@"protocolConfiguration"];
      result = (unsigned char *)[v1 removeObserver:v1 forKeyPath:@"defaultPath"];
      v1[81] = 0;
    }
  }
  return result;
}

- (uint64_t)invokeStartTunnelCompletionHandler:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    if (objc_getProperty((id)a1, v3, 176, 1))
    {
      id Property = (void (**)(id, id))objc_getProperty((id)a1, v5, 176, 1);
      Property[2](Property, v4);
      objc_setProperty_atomic_copy((id)a1, v7, 0, 176);
      uint64_t v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412546;
        uint64_t v11 = a1;
        __int16 v12 = 2080;
        id v13 = "-[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]";
        _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: %s: Invoked start tunnel completion handler", (uint8_t *)&v10, 0x16u);
      }

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __75__NEIKEv2PacketTunnelProvider_stopIKEv2TunnelWithReason_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  [(NEIKEv2PacketTunnelProvider *)*(void **)(a1 + 32) invalidateCompanionProxyDatapath];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)invalidateCompanionProxyDatapath
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1 && objc_getProperty(a1, a2, 232, 1))
  {
    id Property = (os_unfair_lock_s *)objc_getProperty(a1, v3, 232, 1);
    if (Property)
    {
      uint64_t v6 = (uint64_t)Property;
      SEL v7 = Property + 3;
      os_unfair_lock_lock(Property + 3);
      objc_storeWeak((id *)(v6 + 88), 0);
      if (*(unsigned char *)(v6 + 9) != 3)
      {
        uint64_t v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138412290;
          uint64_t v10 = v6;
          _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: cancel", (uint8_t *)&v9, 0xCu);
        }

        -[NEIKEv2CompanionDatapath cancelLocked](v6);
      }
      os_unfair_lock_unlock(v7);
    }
    objc_setProperty_atomic(a1, v5, 0, 232);
  }
}

void __45__NEIKEv2PacketTunnelProvider_tunnelTeardown__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 184, 1))
  {
    id Property = *(void (***)(void))(a1 + 32);
    if (Property) {
      id Property = (void (**)(void))objc_getProperty(Property, v4, 184, 1);
    }
    Property[2]();
    SEL v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_setProperty_atomic_copy(v7, v6, 0, 184);
    }
  }
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      id v11 = objc_getProperty(*(id *)(a1 + 32), v9, 240, 1);
    }
    else {
      id v11 = 0;
    }
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: tunnelTeardown (graceful) - Invalidated session (%@)", (uint8_t *)&v14, 0x16u);
  }

  id v13 = *(void **)(a1 + 32);
  if (v13) {
    objc_setProperty_atomic(v13, v12, 0, 240);
  }
}

void __53__NEIKEv2PacketTunnelProvider_handleInterfaceChange___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [NEIKEv2MOBIKE alloc];
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id Property = objc_getProperty(v4, v2, 264, 1);
    uint64_t v6 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
    id Property = 0;
  }
  uint64_t v8 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v3->super.isa, Property, v6);
  int v9 = *(void **)(a1 + 32);
  if (v9) {
    objc_setProperty_atomic(v9, v7, v8, 168);
  }

  uint64_t v10 = -[NEIKEv2PacketTunnelProvider tunnelBringup](*(void *)(a1 + 32));
  if (v10)
  {
    id v11 = (const char *)v10;
    __int16 v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2080;
      id v17 = "-[NEIKEv2PacketTunnelProvider handleInterfaceChange:]_block_invoke_2";
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%@: %s: Failed tunnel bringup on new path", (uint8_t *)&v14, 0x16u);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(unsigned char **)(a1 + 32), v11);
  }
}

- (uint64_t)tunnelBringup
{
  v259[12] = *(id *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = [(id)a1 packetFlow];
    if (v1) {
      uint64_t v2 = v1[11];
    }
    else {
      uint64_t v2 = 0;
    }
    *(void *)(a1 + 120) = v2;

    if (!*(void *)(a1 + 120))
    {
      oslog = ne_log_obj();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_19DDAF000, oslog, OS_LOG_TYPE_ERROR, "%@: null virtualInterface, skip tunnel bringup", buf, 0xCu);
      }
      uint64_t v22 = 10;
      goto LABEL_254;
    }
    [(NEIKEv2PacketTunnelProvider *)(void *)a1 configureProxyPathIfNeeded];
    id v4 = [(id)a1 protocolConfiguration];
    id Property = objc_getProperty((id)a1, v5, 208, 1);
    uint64_t v7 = *(void *)(a1 + 248);
    id v8 = Property;
    id v10 = objc_getProperty((id)a1, v9, 112, 1);
    id v12 = objc_getProperty((id)a1, v11, 128, 1);
    id v13 = v4;
    v227 = (id *)v8;
    id v14 = v10;
    id v15 = v12;
    self;
    if (NEInitCFTypes_onceToken != -1) {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
    }
    if (v13)
    {
      __int16 v16 = objc_alloc_init(NEIKEv2IKESAConfiguration);
      if (v7 && if_indextoname(v7, buf))
      {
        id v17 = [NSString stringWithUTF8String:buf];
        [(NEIKEv2IKESAConfiguration *)v16 setOutgoingInterfaceName:v17];
      }
      if ([v13 tunnelKind] == 2) {
        [(NEIKEv2IKESAConfiguration *)v16 setRandomizeLocalPort:1];
      }
      id v19 = v15;
      if (v15)
      {
        if (objc_getProperty(v15, v18, 56, 1))
        {
          SEL v21 = objc_msgSend(objc_getProperty(v15, v20, 56, 1), "port");
          v226 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v21, "intValue"));
        }
        else
        {
          v226 = 0;
        }
        id v19 = v15;
      }
      else
      {
        v226 = 0;
      }
      CFStringRef v23 = (const __CFString *)-[NEIKEv2Server getViableServerAddressForPath:](v19, v227);
      uint64_t v24 = NECreateAddressStructFromString(v23, (uint64_t)v226, 0);
      if (v24)
      {
        uint64_t v25 = v24;
        SEL v26 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v24];
        [(NEIKEv2IKESAConfiguration *)v16 setRemoteEndpoint:v26];

        free(v25);
        if (([v13 disableRedirect] & 1) == 0)
        {
          if (v15 && objc_getProperty(v15, v27, 32, 1))
          {
            CFStringRef v29 = (const __CFString *)objc_getProperty(v15, v28, 32, 1);
            SEL v30 = NECreateAddressStructFromString(v29, 0, 0);
            if (v30)
            {
              BOOL v31 = v30;
              __int16 v32 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v30];
              [(NEIKEv2IKESAConfiguration *)v16 setRedirectedFromServer:v32];

              free(v31);
            }
          }
          else
          {
            [(NEIKEv2IKESAConfiguration *)v16 setAllowRedirect:1];
          }
        }
        *(_DWORD *)v250 = 0;
        id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v35 = [v13 IKESecurityAssociationParametersArray];
        BOOL v36 = [v35 count] == 0;

        if (v36)
        {
          long long v42 = [v13 IKESecurityAssociationParameters];
          id v37 = +[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]((uint64_t)NEIKEv2Helper, v13, v42, v14, (unsigned int *)v250);

          if (v37) {
            [v34 addObject:v37];
          }
        }
        else
        {
          long long v237 = 0u;
          long long v238 = 0u;
          long long v235 = 0u;
          long long v236 = 0u;
          id v37 = [v13 IKESecurityAssociationParametersArray];
          uint64_t v38 = [v37 countByEnumeratingWithState:&v235 objects:buf count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v236;
            do
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v236 != v39) {
                  objc_enumerationMutation(v37);
                }
                SEL v41 = +[NEIKEv2Helper createIKESAProposalFromProtocol:saParameters:options:nonceSize:]((uint64_t)NEIKEv2Helper, v13, *(void **)(*((void *)&v235 + 1) + 8 * i), v14, (unsigned int *)v250);
                if (v41) {
                  [v34 addObject:v41];
                }
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v235 objects:buf count:16];
            }
            while (v38);
          }
        }

        if ([v34 count])
        {
          [(NEIKEv2IKESAConfiguration *)v16 setNonceSize:*(unsigned int *)v250];
          [(NEIKEv2IKESAConfiguration *)v16 setStrictNonceSizeChecks:1];
          [(NEIKEv2IKESAConfiguration *)v16 setProposals:v34];
          long long v43 = [v13 ppkConfiguration];
          id v45 = v43;
          if (v43) {
            id v46 = objc_getProperty(v43, v44, 32, 1);
          }
          else {
            id v46 = 0;
          }
          id v47 = v46;
          uint64_t v48 = [v47 persistentReference];
          BOOL v49 = v48 == 0;

          if (!v49) {
            [(NEIKEv2IKESAConfiguration *)v16 setRequestPPK:1];
          }
          self;
          oslog = v16;
        }
        else
        {
          id v50 = ne_log_obj();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v245 = 0;
            _os_log_error_impl(&dword_19DDAF000, v50, OS_LOG_TYPE_ERROR, "empty ike proposals array", v245, 2u);
          }

          oslog = 0;
        }
      }
      else
      {
        uint64_t v33 = ne_log_obj();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v227;
          _os_log_error_impl(&dword_19DDAF000, v33, OS_LOG_TYPE_ERROR, "no viable server address found for path %@", buf, 0xCu);
        }

        oslog = 0;
      }
    }
    else
    {
      ne_log_obj();
      __int16 v16 = (NEIKEv2IKESAConfiguration *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DDAF000, &v16->super, OS_LOG_TYPE_ERROR, "createIKESAConfigFromProtocol: null protocol", buf, 2u);
      }
      oslog = 0;
    }

    if (!oslog)
    {
      v73 = ne_log_obj();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_19DDAF000, v73, OS_LOG_TYPE_ERROR, "%@: failed to create ikeConfig", buf, 0xCu);
      }
      uint64_t v22 = 10;
      goto LABEL_253;
    }
    if (*(void *)(a1 + 224))
    {
      v51 = ne_log_obj();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[NEIKEv2PacketTunnelProvider tunnelBringup]";
        _os_log_impl(&dword_19DDAF000, v51, OS_LOG_TYPE_DEFAULT, "%@: %s: Fallback to use random local port", buf, 0x16u);
      }

      [oslog setRandomizeLocalPort:1];
    }
    SEL v52 = ne_log_large_obj();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = oslog;
      _os_log_debug_impl(&dword_19DDAF000, v52, OS_LOG_TYPE_DEBUG, "%@: ikeConfig %@", buf, 0x16u);
    }

    id v53 = [(id)a1 protocolConfiguration];
    self;
    if (NEInitCFTypes_onceToken == -1)
    {
      if (v53)
      {
LABEL_67:
        v54 = objc_alloc_init(NEIKEv2ChildSAConfiguration);
        [(NEIKEv2ChildSAConfiguration *)v54 setMode:2];
        id v228 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v55 = objc_alloc_init(NEIKEv2TrafficSelector);
        uint64_t v56 = NECreateAddressStructFromString(@"0.0.0.0", 0, 0);
        id v57 = NECreateAddressStructFromString(@"255.255.255.255", 0, 0);
        uint64_t v58 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v56];
        [(NEIKEv2TrafficSelector *)v55 setStartAddress:v58];

        uint64_t v59 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v57];
        [(NEIKEv2TrafficSelector *)v55 setEndAddress:v59];

        [(NEIKEv2TrafficSelector *)v55 setStartPort:0];
        [(NEIKEv2TrafficSelector *)v55 setEndPort:0xFFFFLL];
        [(NEIKEv2TrafficSelector *)v55 setIpProtocol:0];
        [v228 addObject:v55];
        free(v56);
        free(v57);
        __int16 v60 = objc_alloc_init(NEIKEv2TrafficSelector);

        uint64_t v61 = NECreateAddressStructFromString(@"::", 0, 0);
        __int16 v62 = NECreateAddressStructFromString(@"ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff", 0, 0);
        uint64_t v63 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v61];
        [(NEIKEv2TrafficSelector *)v60 setStartAddress:v63];

        uint64_t v64 = [MEMORY[0x1E4F38BC8] endpointWithAddress:v62];
        [(NEIKEv2TrafficSelector *)v60 setEndAddress:v64];

        [(NEIKEv2TrafficSelector *)v60 setStartPort:0];
        [(NEIKEv2TrafficSelector *)v60 setEndPort:0xFFFFLL];
        [(NEIKEv2TrafficSelector *)v60 setIpProtocol:0];
        [v228 addObject:v60];
        free(v61);
        free(v62);
        [(NEIKEv2ChildSAConfiguration *)v54 setLocalTrafficSelectors:v228];
        [(NEIKEv2ChildSAConfiguration *)v54 setRemoteTrafficSelectors:v228];
        id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v66 = [v53 childSecurityAssociationParametersArray];
        BOOL v67 = [v66 count] == 0;

        if (v67)
        {
          uint64_t v74 = [v53 childSecurityAssociationParameters];
          v68 = +[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]((uint64_t)NEIKEv2Helper, v53, v74);

          if (v68) {
            [v65 addObject:v68];
          }
        }
        else
        {
          long long v237 = 0u;
          long long v238 = 0u;
          long long v235 = 0u;
          long long v236 = 0u;
          v68 = [v53 childSecurityAssociationParametersArray];
          uint64_t v69 = [v68 countByEnumeratingWithState:&v235 objects:buf count:16];
          if (v69)
          {
            uint64_t v70 = *(void *)v236;
            do
            {
              for (uint64_t j = 0; j != v69; ++j)
              {
                if (*(void *)v236 != v70) {
                  objc_enumerationMutation(v68);
                }
                uint32_t v72 = +[NEIKEv2Helper createIKEv2ChildSAProposalFromProtocol:saParameters:]((uint64_t)NEIKEv2Helper, v53, *(void **)(*((void *)&v235 + 1) + 8 * j));
                if (v72) {
                  [v65 addObject:v72];
                }
              }
              uint64_t v69 = [v68 countByEnumeratingWithState:&v235 objects:buf count:16];
            }
            while (v69);
          }
        }

        if ([v65 count])
        {
          [(NEIKEv2ChildSAConfiguration *)v54 setProposals:v65];
          -[NEIKEv2ChildSAConfiguration setOpportunisticPFS:](v54, "setOpportunisticPFS:", [v53 opportunisticPFS]);
          v73 = v54;
        }
        else
        {
          v75 = ne_log_obj();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v250 = 0;
            _os_log_error_impl(&dword_19DDAF000, v75, OS_LOG_TYPE_ERROR, "empty child proposals array", v250, 2u);
          }

          v73 = 0;
        }

        goto LABEL_93;
      }
    }
    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
      if (v53) {
        goto LABEL_67;
      }
    }
    ne_log_obj();
    v54 = (NEIKEv2ChildSAConfiguration *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v54->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19DDAF000, &v54->super, OS_LOG_TYPE_ERROR, "createIKEv2ChildSAConfigFromProtocol: null protocol", buf, 2u);
    }
    v73 = 0;
LABEL_93:

    if (!v73)
    {
      v84 = ne_log_obj();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = a1;
        _os_log_error_impl(&dword_19DDAF000, v84, OS_LOG_TYPE_ERROR, "%@: failed to create childConfig", buf, 0xCu);
      }
      uint64_t v22 = 10;
      goto LABEL_252;
    }
    v76 = ne_log_large_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v73;
      _os_log_debug_impl(&dword_19DDAF000, v76, OS_LOG_TYPE_DEBUG, "%@: childConfig %@", buf, 0x16u);
    }

    v77 = [(id)a1 protocolConfiguration];
    id v79 = objc_getProperty((id)a1, v78, 112, 1);
    char v229 = *(unsigned char *)(a1 + 41);
    id v80 = v77;
    id v81 = v79;
    self;
    if (NEInitCFTypes_onceToken == -1)
    {
      if (v80) {
        goto LABEL_98;
      }
    }
    else
    {
      dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_24415);
      if (v80)
      {
LABEL_98:
        v82 = objc_alloc_init(NEIKEv2SessionConfiguration);
        if ([v80 minimumTLSVersion] == 1)
        {
          int v83 = @"1.0";
        }
        else if ([v80 minimumTLSVersion] == 2)
        {
          int v83 = @"1.1";
        }
        else
        {
          if ([v80 minimumTLSVersion] != 3) {
            goto LABEL_108;
          }
          int v83 = @"1.2";
        }
        [(NEIKEv2SessionConfiguration *)v82 setTlsMinimumVersion:v83];
LABEL_108:
        if ([v80 maximumTLSVersion] == 1)
        {
          SEL v85 = @"1.0";
        }
        else if ([v80 maximumTLSVersion] == 2)
        {
          SEL v85 = @"1.1";
        }
        else
        {
          if ([v80 maximumTLSVersion] != 3) {
            goto LABEL_115;
          }
          SEL v85 = @"1.2";
        }
        [(NEIKEv2SessionConfiguration *)v82 setTlsMaximumVersion:v85];
LABEL_115:
        [(NEIKEv2SessionConfiguration *)v82 setBlackholeDetectionEnabled:v229 & 1];
        v86 = [v80 localIdentifier];

        if (!v86) {
          goto LABEL_126;
        }
        v87 = [v80 localIdentifier];
        uint64_t v88 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, v87);

        if (v88 == 5)
        {
          v92 = [v80 localIdentifier];
          id v90 = (char *)NECreateAddressStructFromString(v92, 0, 0);

          if (v90)
          {
            uint64_t v91 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v90 + 8 length:16];
            goto LABEL_122;
          }
        }
        else
        {
          if (v88 != 1)
          {
            v94 = [v80 localIdentifier];
            uint64_t v93 = [v94 dataUsingEncoding:4];

            goto LABEL_125;
          }
          v89 = [v80 localIdentifier];
          id v90 = (char *)NECreateAddressStructFromString(v89, 0, 0);

          if (v90)
          {
            uint64_t v91 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v90 + 4 length:4];
LABEL_122:
            uint64_t v93 = (void *)v91;
            free(v90);
LABEL_125:
            id v95 = +[NEIKEv2Identifier createIdentifierWithType:v88 data:v93];
            [(NEIKEv2SessionConfiguration *)v82 setLocalIdentifier:v95];

LABEL_126:
            v96 = [v80 remoteIdentifier];

            if (!v96) {
              goto LABEL_137;
            }
            v97 = [v80 remoteIdentifier];
            uint64_t v98 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, v97);

            if (v98 == 5)
            {
              v102 = [v80 remoteIdentifier];
              uint64_t v100 = (char *)NECreateAddressStructFromString(v102, 0, 0);

              if (v100)
              {
                uint64_t v101 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v100 + 8 length:16];
                goto LABEL_133;
              }
            }
            else
            {
              if (v98 != 1)
              {
                v104 = [v80 remoteIdentifier];
                char v103 = [v104 dataUsingEncoding:4];

                goto LABEL_136;
              }
              v99 = [v80 remoteIdentifier];
              uint64_t v100 = (char *)NECreateAddressStructFromString(v99, 0, 0);

              if (v100)
              {
                uint64_t v101 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v100 + 4 length:4];
LABEL_133:
                char v103 = (void *)v101;
                free(v100);
LABEL_136:
                id v105 = +[NEIKEv2Identifier createIdentifierWithType:v98 data:v103];
                [(NEIKEv2SessionConfiguration *)v82 setRemoteIdentifier:v105];

LABEL_137:
                uint64_t v106 = [v80 authenticationMethod];
                if (v106 == 2)
                {
                  uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:2];
                }
                else if (v106 == 1)
                {
                  switch([v80 certificateType])
                  {
                    case 2:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:9];
                      break;
                    case 3:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:10];
                      break;
                    case 4:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:11];
                      break;
                    case 5:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithDigitalSignature:3];
                      break;
                    case 6:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:245];
                      break;
                    case 7:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithDigitalSignature:4];
                      break;
                    default:
                      uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:1];
                      break;
                  }
                }
                else
                {
                  uint64_t v107 = [[NEIKEv2AuthenticationProtocol alloc] initWithMethod:0];
                }
                __int16 v108 = v107;
                [(NEIKEv2SessionConfiguration *)v82 setAuthenticationProtocol:v107];

                v109 = [(NEIKEv2SessionConfiguration *)v82 authenticationProtocol];
                uint64_t v110 = (void *)[v109 copy];
                [(NEIKEv2SessionConfiguration *)v82 setRemoteAuthentication:v110];

                __int16 v111 = [v80 sharedSecretKeychainItem];
                v112 = [v111 persistentReference];
                BOOL v113 = v112 == 0;

                if (!v113)
                {
                  v114 = [v80 sharedSecretKeychainItem];
                  v115 = [v114 persistentReference];
                  [(NEIKEv2SessionConfiguration *)v82 setSharedSecretReference:v115];
                }
                v116 = [v80 identityReferenceInternal];
                BOOL v117 = v116 == 0;

                if (!v117)
                {
                  v119 = [v80 identityReferenceInternal];
                  [(NEIKEv2SessionConfiguration *)v82 setLocalCertificateReference:v119];
                }
                id v120 = objc_getProperty(v80, v118, 96, 1);
                v121 = [v120 keyPersistentReference];
                BOOL v122 = v121 == 0;

                if (!v122)
                {
                  id v124 = objc_getProperty(v80, v123, 96, 1);
                  v125 = [v124 keyPersistentReference];
                  [(NEIKEv2SessionConfiguration *)v82 setLocalCertificateKeyReference:v125];
                }
                id v126 = objc_getProperty(v80, v123, 96, 1);
                -[NEIKEv2SessionConfiguration setLocalCertificateIsModernSystem:](v82, "setLocalCertificateIsModernSystem:", [v126 isModernSystem]);

                if ([v80 natKeepAliveOffloadEnable] == 2)
                {
                  [(NEIKEv2SessionConfiguration *)v82 setNatTraversalKeepaliveOffloadEnabled:1];
                  if ([v80 natKeepAliveOffloadInterval]) {
                    -[NEIKEv2SessionConfiguration setNatTraversalKeepaliveOffloadInterval:](v82, "setNatTraversalKeepaliveOffloadInterval:", (int)[v80 natKeepAliveOffloadInterval]);
                  }
                }
                if ([v80 deadPeerDetectionRate])
                {
                  uint64_t v127 = [v80 deadPeerDetectionRate];
                  self;
                  uint64_t v128 = v127 - 1;
                  if ((unint64_t)(v127 - 1) <= 2)
                  {
                    uint64_t v129 = qword_19DF9D1F0[v128];
                    uint64_t v130 = dword_19DF9D208[v128];
                    [(NEIKEv2SessionConfiguration *)v82 setDeadPeerDetectionEnabled:1];
                    [(NEIKEv2SessionConfiguration *)v82 setDeadPeerDetectionMaxRetryCount:v130];
                    [(NEIKEv2SessionConfiguration *)v82 setDeadPeerDetectionRetryIntervalMilliseconds:1000];
                    [(NEIKEv2SessionConfiguration *)v82 setDeadPeerDetectionInterval:v129];
                  }
                }
                if ([v80 disconnectOnIdle]
                  && [v80 disconnectOnIdleTimeout])
                {
                  [(NEIKEv2SessionConfiguration *)v82 setIdleTimeoutEnabled:1];
                  uint64_t v131 = (int)[v80 disconnectOnIdleTimeout];
                }
                else
                {
                  if ((v229 & 1) == 0 && [v80 tunnelKind] != 2)
                  {
LABEL_164:
                    if (([v80 disableMOBIKE] & 1) == 0) {
                      [(NEIKEv2SessionConfiguration *)v82 setNegotiateMOBIKE:1];
                    }
                    if ([v80 enableRevocationCheck])
                    {
                      [(NEIKEv2SessionConfiguration *)v82 setEnableCertificateRevocationCheck:1];
                      if ([v80 strictRevocationCheck]) {
                        [(NEIKEv2SessionConfiguration *)v82 setStrictCertificateRevocationCheck:1];
                      }
                    }
                    v133 = [v81 objectForKeyedSubscript:@"AccountName"];
                    BOOL v134 = v133 == 0;

                    if (v134)
                    {
                      v136 = [v80 username];
                      BOOL v137 = v136 == 0;

                      if (v137) {
                        goto LABEL_174;
                      }
                      uint64_t v135 = [v80 username];
                    }
                    else
                    {
                      uint64_t v135 = [v81 objectForKeyedSubscript:@"AccountName"];
                    }
                    v138 = (void *)v135;
                    [(NEIKEv2SessionConfiguration *)v82 setUsername:v135];

LABEL_174:
                    v139 = [v81 objectForKeyedSubscript:@"Password"];
                    BOOL v140 = v139 == 0;

                    if (v140)
                    {
                      v182 = [v80 passwordKeychainItem];
                      if (!v182) {
                        goto LABEL_177;
                      }
                      v183 = [v80 passwordKeychainItem];
                      v184 = [v183 persistentReference];
                      BOOL v185 = v184 == 0;

                      if (v185) {
                        goto LABEL_177;
                      }
                      v141 = [v80 passwordKeychainItem];
                      v186 = [v141 persistentReference];
                      [(NEIKEv2SessionConfiguration *)v82 setPasswordReference:v186];
                    }
                    else
                    {
                      v141 = [v81 objectForKeyedSubscript:@"Password"];
                      [(NEIKEv2SessionConfiguration *)v82 setPassword:v141];
                    }

LABEL_177:
                    v142 = [v80 serverCertificateCommonName];
                    BOOL v143 = v142 == 0;

                    if (!v143)
                    {
                      v144 = [v80 serverCertificateCommonName];
                      [(NEIKEv2SessionConfiguration *)v82 setRemoteCertificateHostname:v144];
                    }
                    v145 = [v80 serverCertificateIssuerCommonName];
                    BOOL v146 = v145 == 0;

                    if (!v146)
                    {
                      v147 = [v80 serverCertificateIssuerCommonName];
                      [(NEIKEv2SessionConfiguration *)v82 setRemoteCertificateAuthorityName:v147];
                    }
                    if ([v80 disableInitialContact]) {
                      [(NEIKEv2SessionConfiguration *)v82 setInitialContactDisabled:1];
                    }
                    id v148 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    id v149 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv4AddressAttribute alloc] initEmptyRequest];
                    [v148 addObject:v149];

                    if ([v80 useConfigurationAttributeInternalIPSubnet])
                    {
                      id v150 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv4SubnetAttribute alloc] initEmptyRequest];
                      [v148 addObject:v150];
                    }
                    id v151 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv4NetmaskAttribute alloc] initEmptyRequest];
                    [v148 addObject:v151];

                    id v152 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv4DHCPAttribute alloc] initEmptyRequest];
                    [v148 addObject:v152];

                    id v153 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv4DNSAttribute alloc] initEmptyRequest];
                    [v148 addObject:v153];

                    id v154 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv6AddressAttribute alloc] initEmptyRequest];
                    [v148 addObject:v154];

                    if ([v80 useConfigurationAttributeInternalIPSubnet])
                    {
                      v155 = [NEIKEv2IPv6SubnetAttribute alloc];
                      v156 = [MEMORY[0x1E4F38BC8] endpointWithHostname:@"::" port:@"0"];
                      v157 = [(NEIKEv2SubnetAttribute *)v155 initWithAddress:v156 ipv4SubnetMask:0];
                      [v148 addObject:v157];
                    }
                    id v158 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv6DHCPAttribute alloc] initEmptyRequest];
                    [v148 addObject:v158];

                    id v159 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2IPv6DNSAttribute alloc] initEmptyRequest];
                    [v148 addObject:v159];

                    id v160 = [(NEIKEv2ConfigurationAttribute *)[NEIKEv2DNSDomainAttribute alloc] initEmptyRequest];
                    [v148 addObject:v160];

                    v161 = objc_alloc_init(NEIKEv2ConfigurationMessage);
                    v163 = v161;
                    if (v161)
                    {
                      v161->_configurationType = 1;
                      objc_setProperty_atomic(v161, v162, v148, 16);
                    }
                    [(NEIKEv2SessionConfiguration *)v82 setConfigurationRequest:v163];
                    v164 = [v80 ppkConfiguration];
                    v166 = v164;
                    if (v164) {
                      id v167 = objc_getProperty(v164, v165, 32, 1);
                    }
                    else {
                      id v167 = 0;
                    }
                    id v168 = v167;
                    v169 = [v168 persistentReference];
                    BOOL v170 = v169 == 0;

                    if (!v170)
                    {
                      v171 = [v80 ppkConfiguration];
                      v173 = v171;
                      if (v171) {
                        id v174 = objc_getProperty(v171, v172, 32, 1);
                      }
                      else {
                        id v174 = 0;
                      }
                      id v175 = v174;
                      v176 = [v175 persistentReference];
                      [(NEIKEv2SessionConfiguration *)v82 setPpkReference:v176];

                      v177 = [v80 ppkConfiguration];
                      v178 = [v177 identifier];
                      v179 = [v178 dataUsingEncoding:4];
                      [(NEIKEv2SessionConfiguration *)v82 setPpkID:v179];

                      [(NEIKEv2SessionConfiguration *)v82 setPpkIDType:2];
                      v180 = [v80 ppkConfiguration];
                      -[NEIKEv2SessionConfiguration setPpkMandatory:](v82, "setPpkMandatory:", [v180 isMandatory]);
                    }
                    self;
                    v181 = v82;

                    v84 = v181;
                    goto LABEL_209;
                  }
                  v132 = ne_log_obj();
                  if (os_log_type_enabled(v132, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_19DDAF000, v132, OS_LOG_TYPE_INFO, "setting idle timeout", buf, 2u);
                  }

                  [(NEIKEv2SessionConfiguration *)v82 setIdleTimeoutEnabled:1];
                  uint64_t v131 = 120;
                }
                [(NEIKEv2SessionConfiguration *)v82 setIdleTimeoutSeconds:v131];
                goto LABEL_164;
              }
            }
            char v103 = 0;
            goto LABEL_136;
          }
        }
        uint64_t v93 = 0;
        goto LABEL_125;
      }
    }
    v181 = ne_log_obj();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v181, OS_LOG_TYPE_ERROR, "createIKEv2SessionConfigFromProtocol: null protocol", buf, 2u);
    }
    v84 = 0;
LABEL_209:

    if (v84)
    {
      v187 = ne_log_large_obj();
      if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v84;
        _os_log_debug_impl(&dword_19DDAF000, v187, OS_LOG_TYPE_DEBUG, "%@: sessionConfig %@", buf, 0x16u);
      }

      uint64_t Socket = NEIKEv2PacketTunnelProviderGetSocket((void *)a1, 0, 0, 0, 0);
      if ((Socket & 0x80000000) == 0)
      {
        v189 = [[NEIPSecSAKernelSession alloc] initWithName:@"IKEv2 Session Database" delegate:0 pfkeySocket:Socket];
        if (v189)
        {
          objc_initWeak(&location, (id)a1);
          v190 = [NEIKEv2Session alloc];
          uint64_t v191 = *(void *)(a1 + 264);
          uint64_t v192 = *(void *)(a1 + 120);
          v232[0] = MEMORY[0x1E4F143A8];
          v232[1] = 3221225472;
          v232[2] = __44__NEIKEv2PacketTunnelProvider_tunnelBringup__block_invoke;
          v232[3] = &unk_1E5990B28;
          objc_copyWeak(&v233, &location);
          v193 = [(NEIKEv2Session *)v190 initWithIKEConfig:oslog firstChildConfig:v73 sessionConfig:v84 queue:v191 ipsecInterface:v192 ikeSocketHandler:v232 saSession:v189 packetDelegate:0];
          objc_setProperty_atomic((id)a1, v194, v193, 240);

          if (!objc_getProperty((id)a1, v195, 240, 1))
          {
            v222 = ne_log_obj();
            if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = a1;
              _os_log_error_impl(&dword_19DDAF000, v222, OS_LOG_TYPE_ERROR, "%@: Could not create session", buf, 0xCu);
            }
            uint64_t v22 = 10;
            goto LABEL_250;
          }
          v196 = ne_log_obj();
          if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
          {
            id v198 = objc_getProperty((id)a1, v197, 240, 1);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v198;
            _os_log_impl(&dword_19DDAF000, v196, OS_LOG_TYPE_INFO, "%@: Created session (%@)", buf, 0x16u);
          }

          id v200 = objc_getProperty((id)a1, v199, 240, 1);
          [v200 setClientCallbackInfo:a1];

          uint64_t v201 = *(void *)(a1 + 264);
          id v203 = objc_getProperty((id)a1, v202, 240, 1);
          [v203 setClientQueue:v201];

          objc_initWeak(&from, (id)a1);
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke;
          v257 = &unk_1E5990B00;
          objc_copyWeak(v259, &from);
          uint64_t v258 = a1;
          [*(id *)(a1 + 240) setStateUpdateBlock:buf];
          *(void *)&long long v235 = MEMORY[0x1E4F143A8];
          *((void *)&v235 + 1) = 3221225472;
          *(void *)&long long v236 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_132;
          *((void *)&v236 + 1) = &unk_1E5991660;
          objc_copyWeak((id *)&v237, &from);
          [*(id *)(a1 + 240) setChildStateUpdateBlock:&v235];
          *(void *)v250 = MEMORY[0x1E4F143A8];
          uint64_t v251 = 3221225472;
          v252 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_135;
          v253 = &unk_1E5991688;
          objc_copyWeak(&v254, &from);
          [*(id *)(a1 + 240) setConfigurationUpdateBlock:v250];
          *(void *)v245 = MEMORY[0x1E4F143A8];
          uint64_t v246 = 3221225472;
          v247 = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_137;
          v248 = &unk_1E59916B0;
          objc_copyWeak(v249, &from);
          [*(id *)(a1 + 240) setTrafficSelectorUpdateBlock:v245];
          v243[0] = MEMORY[0x1E4F143A8];
          v243[1] = 3221225472;
          v243[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_139;
          v243[3] = &unk_1E5992DE0;
          objc_copyWeak(&v244, &from);
          [*(id *)(a1 + 240) setAdditionalAddressesUpdateBlock:v243];
          v241[0] = MEMORY[0x1E4F143A8];
          v241[1] = 3221225472;
          v241[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_141;
          v241[3] = &unk_1E5992C58;
          objc_copyWeak(&v242, &from);
          [*(id *)(a1 + 240) setShortDPDEventBlock:v241];
          v239[0] = MEMORY[0x1E4F143A8];
          v239[1] = 3221225472;
          v239[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_142;
          v239[3] = &unk_1E59916D8;
          objc_copyWeak(&v240, &from);
          [*(id *)(a1 + 240) setRedirectEventBlock:v239];
          objc_destroyWeak(&v240);
          objc_destroyWeak(&v242);
          objc_destroyWeak(&v244);
          objc_destroyWeak(v249);
          objc_destroyWeak(&v254);
          objc_destroyWeak((id *)&v237);
          objc_destroyWeak(v259);
          objc_destroyWeak(&from);
          id v205 = objc_getProperty((id)a1, v204, 240, 1);
          [v205 connect];

          id v207 = objc_getProperty((id)a1, v206, 240, 1);
          v209 = [(NEIKEv2Session *)v207 firstChildSA];
          if (v209)
          {
            BOOL v210 = v209[4] == 0;

            if (!v210)
            {
              v211 = ne_log_obj();
              if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
              {
                id v213 = objc_getProperty((id)a1, v212, 240, 1);
                uint64_t v215 = [(NEIKEv2Session *)v213 firstChildSA];
                v216 = (void *)v215;
                if (v215) {
                  int v217 = *(_DWORD *)(v215 + 16);
                }
                else {
                  int v217 = 0;
                }
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = a1;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v217;
                _os_log_impl(&dword_19DDAF000, v211, OS_LOG_TYPE_INFO, "%@: Started Child Connection %X", buf, 0x12u);
              }
              v218 = [(id)a1 protocolConfiguration];
              char v219 = [v218 disableRedirect];

              if ((v219 & 1) == 0)
              {
                v221 = objc_getProperty((id)a1, v220, 128, 1);
                -[NEIKEv2Server startRedirectTimer](v221);
              }
              v222 = ne_log_obj();
              if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)&uint8_t buf[4] = a1;
                _os_log_impl(&dword_19DDAF000, v222, OS_LOG_TYPE_DEFAULT, "%@ tunnel bringup requested", buf, 0xCu);
              }
              uint64_t v22 = 0;
LABEL_250:

              objc_destroyWeak(&v233);
              objc_destroyWeak(&location);
              goto LABEL_251;
            }
          }
          else
          {
          }
          v222 = ne_log_obj();
          if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = a1;
            _os_log_error_impl(&dword_19DDAF000, v222, OS_LOG_TYPE_ERROR, "%@: Could not start child", buf, 0xCu);
          }
          uint64_t v22 = 7;
          goto LABEL_250;
        }
        v224 = ne_log_obj();
        if (os_log_type_enabled(v224, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = Socket;
          _os_log_fault_impl(&dword_19DDAF000, v224, OS_LOG_TYPE_FAULT, "[NEIPSecSAKernelSession init pfkeySocket=%d] failed", buf, 8u);
        }

        v189 = 0;
LABEL_236:
        uint64_t v22 = 10;
LABEL_251:

LABEL_252:
LABEL_253:

LABEL_254:
        return v22;
      }
      ne_log_obj();
      v189 = (NEIPSecSAKernelSession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v189->super.super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_236;
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      v223 = "%@ failed to get pfkey socket";
    }
    else
    {
      ne_log_obj();
      v189 = (NEIPSecSAKernelSession *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v189->super.super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_236;
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = a1;
      v223 = "%@: failed to create sessionConfig";
    }
    _os_log_error_impl(&dword_19DDAF000, &v189->super.super, OS_LOG_TYPE_ERROR, v223, buf, 0xCu);
    goto LABEL_236;
  }
  return 0;
}

uint64_t __44__NEIKEv2PacketTunnelProvider_tunnelBringup__block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, void *a5)
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a3)
    {
      v87 = [MEMORY[0x1E4F38BC8] endpointWithAddress:a3];
      if (a4) {
        goto LABEL_4;
      }
    }
    else
    {
      v87 = 0;
      if (a4)
      {
LABEL_4:
        SEL v85 = [MEMORY[0x1E4F38BC8] endpointWithAddress:a4];
        if (a5)
        {
LABEL_5:
          v86 = [NSString stringWithUTF8String:a5];
          goto LABEL_10;
        }
LABEL_9:
        v86 = 0;
LABEL_10:
        id Property = objc_getProperty(WeakRetained, v8, 128, 1);
        if (Property) {
          id Property = objc_getProperty(Property, v11, 56, 1);
        }
        id v12 = Property;

        if (!v12)
        {
          unsigned int Socket = NEIKEv2PacketTunnelProviderGetSocket(WeakRetained, 1, a3, a4, a5);
          goto LABEL_76;
        }
        if (!v87)
        {
          id v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = WeakRetained;
            _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "%@: No local endpoint for proxy path", buf, 0xCu);
          }
          unsigned int Socket = -1;
          goto LABEL_78;
        }
        id v13 = [v87 port];
        id v15 = objc_getProperty(WeakRetained, v14, 128, 1);
        if (!v15 || (v15[8] & 1) == 0)
        {
          unsigned int Socket = -1;
LABEL_75:

LABEL_76:
          id v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138413314;
            *(void *)&uint8_t buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = Socket;
            *(_WORD *)&buf[18] = 2112;
            *(void *)&buf[20] = v87;
            __int16 v95 = 2112;
            v96 = v85;
            __int16 v97 = 2112;
            uint64_t v98 = v86;
            _os_log_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_DEFAULT, "%@: got socket (%d) for local %@ remote %@ interface %@", buf, 0x30u);
          }
LABEL_78:

          goto LABEL_79;
        }
        id v18 = objc_getProperty(WeakRetained, v16, 128, 1);
        if (v18) {
          id v18 = objc_getProperty(v18, v19, 16, 1);
        }
        id v81 = v13;
        id v82 = v18;
        SEL v20 = objc_msgSend(MEMORY[0x1E4F38BF0], "endpointWithHostname:port:");
        dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
        uint64_t v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v20;
          _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_DEFAULT, "%@: setting up companion proxy datapath to %@", buf, 0x16u);
        }

        [(NEIKEv2PacketTunnelProvider *)WeakRetained invalidateCompanionProxyDatapath];
        uint64_t v24 = [NEIKEv2CompanionDatapath alloc];
        id v83 = v20;
        dispatch_semaphore_t dsema = v21;
        objc_initWeak(location, WeakRetained);
        if (v24)
        {
          *(void *)long long buf = v24;
          *(void *)&buf[8] = NEIKEv2CompanionDatapath;
          uint64_t v25 = (id *)objc_msgSendSuper2((objc_super *)buf, sel_init);
          if (v25)
          {
            if (NEIKEv2CompanionDatapathCopyQueue_onceToken != -1) {
              dispatch_once(&NEIKEv2CompanionDatapathCopyQueue_onceToken, &__block_literal_global_323);
            }
            objc_storeStrong(v25 + 9, (id)NEIKEv2CompanionDatapathCopyQueue_queue);
            v25[2] = (id)atomic_fetch_add_explicit(&initWithRemoteEndpoint_completionSemaphore_provider__sNEIKEv2CmpnDatapathID, 1uLL, memory_order_relaxed);
            *((_DWORD *)v25 + 3) = 0;
            objc_storeStrong(v25 + 7, v20);
            SEL v26 = (void *)MEMORY[0x1E4F38BF0];
            id v27 = v25[7];
            SEL v28 = [v27 port];
            uint64_t v29 = [v26 endpointWithHostname:@"::" port:v28];
            id v30 = v25[8];
            v25[8] = (id)v29;

            objc_storeStrong(v25 + 10, v21);
            BOOL v31 = objc_loadWeakRetained(location);
            objc_storeWeak(v25 + 11, v31);
          }
          else
          {
            BOOL v31 = ne_log_obj();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)uint64_t v93 = 0;
              _os_log_fault_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_FAULT, "[super init] failed", v93, 2u);
            }
            uint64_t v25 = 0;
          }
        }
        else
        {
          uint64_t v25 = 0;
        }
        objc_destroyWeak(location);

        objc_setProperty_atomic(WeakRetained, v32, v25, 232);
        id v34 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v33, 232, 1);
        uint64_t v35 = (uint64_t)v34;
        if (v34)
        {
          BOOL v36 = v34 + 3;
          os_unfair_lock_lock(v34 + 3);
          if (*(void *)(v35 + 56))
          {
            if (!*(unsigned char *)(v35 + 9))
            {
              *(unsigned char *)(v35 + 9) = 1;
              -[NEIKEv2CompanionDatapath setupConnectionLocked](v35);
            }
          }
          else
          {
            id v37 = ne_log_obj();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_FAULT, "invalid remote endpoint", buf, 2u);
            }
          }
          os_unfair_lock_unlock(v36);
        }
        dispatch_time_t v38 = dispatch_time(0x8000000000000000, 10000000000);
        if (dispatch_semaphore_wait(dsema, v38))
        {
          long long v40 = ne_log_obj();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v79 = objc_getProperty(WeakRetained, v41, 232, 1);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v79;
            _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%@: timed out waiting for socket from %@", buf, 0x16u);
          }
          unsigned int Socket = -1;
LABEL_74:

          id v13 = v81;
          goto LABEL_75;
        }
        long long v42 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v39, 232, 1);
        SEL v44 = v42;
        if (v42)
        {
          os_unfair_lock_lock(v42 + 3);
          if (BYTE1(v44[2]._os_unfair_lock_opaque) == 2)
          {
            int connected_socket = nw_connection_get_connected_socket();
            unsigned int Socket = dup(connected_socket);
            os_unfair_lock_unlock(v44 + 3);
            if ((Socket & 0x80000000) == 0)
            {
LABEL_46:
              id v46 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v43, 232, 1);
              uint64_t v48 = v46;
              if (v46)
              {
                os_unfair_lock_lock(v46 + 3);
                id v49 = *(id *)&v48[10]._os_unfair_lock_opaque;
                id v50 = v49;
                if (BYTE1(v48[2]._os_unfair_lock_opaque) == 3)
                {

                  id v50 = 0;
                }
                os_unfair_lock_unlock(v48 + 3);
              }
              else
              {
                id v50 = 0;
              }
              id v51 = objc_getProperty(WeakRetained, v47, 128, 1);
              if (v51) {
                objc_setProperty_atomic(v51, v52, v50, 64);
              }

              id v54 = objc_getProperty(WeakRetained, v53, 128, 1);
              id v56 = objc_getProperty(WeakRetained, v55, 128, 1);
              if (v56) {
                id v56 = objc_getProperty(v56, v57, 64, 1);
              }
              id v58 = v56;
              id v60 = objc_getProperty(WeakRetained, v59, 208, 1);
              -[NEIKEv2Server setServerResolvedAddress:path:](v54, v58, v60);

              __int16 v62 = (os_unfair_lock_s *)objc_getProperty(WeakRetained, v61, 232, 1);
              uint64_t v63 = v62;
              if (v62)
              {
                os_unfair_lock_lock(v62 + 3);
                uint64_t v64 = *(id *)&v63[12]._os_unfair_lock_opaque;
                long long v40 = v64;
                if (BYTE1(v63[2]._os_unfair_lock_opaque) == 3)
                {

                  long long v40 = 0;
                }
                os_unfair_lock_unlock(v63 + 3);
              }
              else
              {
                long long v40 = 0;
              }
              if ([v40 count])
              {
                long long v91 = 0u;
                long long v92 = 0u;
                *(_OWORD *)id location = 0u;
                long long v90 = 0u;
                long long v40 = v40;
                uint64_t v66 = [v40 countByEnumeratingWithState:location objects:buf count:16];
                if (v66)
                {
                  uint64_t v67 = *(void *)v90;
                  do
                  {
                    for (uint64_t i = 0; i != v66; ++i)
                    {
                      if (*(void *)v90 != v67) {
                        objc_enumerationMutation(v40);
                      }
                      uint64_t v69 = (void *)*((void *)location[1] + i);
                      id v70 = objc_getProperty(WeakRetained, v65, 128, 1);
                      if (v70) {
                        id v70 = objc_getProperty(v70, v71, 64, 1);
                      }
                      id v72 = v70;
                      char v73 = [v69 isEqualToString:v72];

                      if ((v73 & 1) == 0)
                      {
                        id v74 = objc_getProperty(WeakRetained, v65, 128, 1);
                        id v76 = objc_getProperty(WeakRetained, v75, 208, 1);
                        -[NEIKEv2Server setServerResolvedAddress:path:](v74, v69, v76);
                      }
                    }
                    uint64_t v66 = [v40 countByEnumeratingWithState:location objects:buf count:16];
                  }
                  while (v66);
                }
              }
              goto LABEL_74;
            }
          }
          else
          {
            os_unfair_lock_unlock(v44 + 3);
            unsigned int Socket = -1;
          }
          long long v40 = ne_log_obj();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v80 = objc_getProperty(WeakRetained, v77, 232, 1);
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = WeakRetained;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v80;
            _os_log_error_impl(&dword_19DDAF000, v40, OS_LOG_TYPE_ERROR, "%@: invalid socket from %@", buf, 0x16u);
          }
          goto LABEL_74;
        }
        unsigned int Socket = 0;
        goto LABEL_46;
      }
    }
    SEL v85 = 0;
    if (a5) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
  unsigned int Socket = -1;
LABEL_79:

  return Socket;
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = ne_log_obj();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (WeakRetained)
  {
    if (v8)
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = WeakRetained;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = objc_getProperty(WeakRetained, v9, 240, 1);
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: session (%X)", buf, 0x12u);
    }

    if (a2 == 2)
    {
      -[NEIKEv2PacketTunnelProvider setInterfaceAvailability]((uint64_t)WeakRetained);
      [(NEIKEv2PacketTunnelProvider *)(uint64_t)WeakRetained watchIKESocketChange];
      if ((*((_DWORD *)WeakRetained + 21) & 1) == 0)
      {
        uint64_t v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = WeakRetained;
          _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: got IKE Connected", buf, 0xCu);
        }

        *((_DWORD *)WeakRetained + 21) |= 1u;
        -[NEIKEv2PacketTunnelProvider startRekeyTimer:](WeakRetained, 1);
        NEIKEv2PacketTunnelHandleConnected(WeakRetained);
      }
    }
    else
    {
      if (a2 != 3) {
        goto LABEL_46;
      }
      id v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_INFO, "%@: stateUpdateBlock callback: got IKE Disconnected (%@)", buf, 0x16u);
      }

      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = &OBJC_IVAR___NEIKEv2IKESA__error;
      if (v11 && (*(unsigned char *)(v11 + 78) & 1) != 0) {
        goto LABEL_43;
      }
      [v5 code];
      uint64_t v13 = [v5 code];
      SEL v14 = (__CFString *)objc_alloc_init(NSString);
      __int16 v16 = objc_msgSend(objc_getProperty(WeakRetained, v15, 208, 1), "scopedInterface");
      unint64_t v17 = [v16 type];

      if (v17 <= 4)
      {
        id v18 = off_1E5990CA0[v17];

        SEL v14 = v18;
      }
      id v19 = objc_alloc_init(NSString);
      id v12 = &OBJC_IVAR___NEIKEv2IKESA__error;
      SEL v20 = (unint64_t)(v13 - 3) > 0xA ? @"PluginFailed" : off_1E5990CC8[v13 - 3];

      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __64__NEIKEv2PacketTunnelProvider_sendAnalyticsWithDisconnectError___block_invoke;
      long long v42 = &unk_1E5990C38;
      long long v43 = WeakRetained;
      SEL v44 = v14;
      id v45 = v20;
      CFStringRef v23 = v14;
      AnalyticsSendEventLazy();

      uint64_t v25 = *(void *)(a1 + 32);
      if (v25)
      {
        if (*(unsigned char *)(v25 + 78)) {
          goto LABEL_43;
        }
      }
      if (WeakRetained[77]) {
        goto LABEL_43;
      }
      if ([(NEIKEv2PacketTunnelProvider *)WeakRetained tryAlternateServerAddresses]) {
        goto LABEL_46;
      }
      id v26 = v5;
      id v27 = v26;
      if (*((void *)WeakRetained + 28))
      {
        SEL v28 = ne_log_obj();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = WeakRetained;
          _os_log_impl(&dword_19DDAF000, v28, OS_LOG_TYPE_DEFAULT, "%@: Random Port Fallback counter exceeded max retry count", buf, 0xCu);
        }

        goto LABEL_42;
      }
      if ((WeakRetained[78] & 1) != 0 || [v26 code] != 3)
      {
LABEL_42:

LABEL_43:
        WeakRetained[v12[197]] = 1;
        id v37 = ne_log_obj();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = 14;
          _os_log_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_DEFAULT, "%@: stopping tunnel since IKE disconnected %ld", buf, 0x16u);
        }

        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_130;
        v38[3] = &unk_1E5992328;
        uint64_t v39 = WeakRetained;
        id v40 = v5;
        -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v39, 14, v38);

        goto LABEL_46;
      }
      uint64_t v29 = ne_log_obj();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = WeakRetained;
        _os_log_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_DEFAULT, "%@: Random Port Fallback is enabled, bringing up tunnel with random local port", buf, 0xCu);
      }

      ++*((void *)WeakRetained + 28);
      id Property = objc_getProperty(WeakRetained, v30, 128, 1);
      if (Property)
      {
        SEL v33 = objc_getProperty(Property, v32, 24, 1);
        if (v33)
        {
          v33[3] = 0;
          v33[4] = 0;
        }
      }
      else
      {
        SEL v33 = 0;
      }

      uint64_t v34 = -[NEIKEv2PacketTunnelProvider tunnelBringup](WeakRetained);
      if (v34)
      {
        uint64_t v35 = (const char *)v34;
        BOOL v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = WeakRetained;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v35;
          _os_log_error_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_ERROR, "%@: Random Port Fallback failed to bringup tunnel, error %d", buf, 0x12u);
        }

        -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, v35);
      }
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "stateUpdateBlock callback: provider is nil", buf, 2u);
    }
  }
LABEL_46:
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_132(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  *(void *)&v36[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ((id v11 = objc_getProperty(WeakRetained, v9, 240, 1),
           [(NEIKEv2Session *)v11 firstChildSA],
           (uint64_t v13 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0)
        ? (int v14 = 0)
        : (int v14 = v13[4]),
          v13,
          v14 != a2))
    {
      dispatch_semaphore_t v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id Property = objc_getProperty((id)v10, v22, 240, 1);
        uint64_t v25 = [(NEIKEv2Session *)Property firstChildSA];
        id v26 = (void *)v25;
        if (v25) {
          int v27 = *(_DWORD *)(v25 + 16);
        }
        else {
          int v27 = 0;
        }
        *(_DWORD *)long long buf = 138412802;
        uint64_t v34 = v10;
        __int16 v35 = 1024;
        *(_DWORD *)BOOL v36 = a2;
        v36[2] = 1024;
        *(_DWORD *)&v36[3] = v27;
        _os_log_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: childID (%X) mismatched provider childID (%X)", buf, 0x18u);
      }
    }
    else
    {
      SEL v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v34 = v10;
        __int16 v35 = 1024;
        *(_DWORD *)BOOL v36 = a2;
        _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: childID (%X)", buf, 0x12u);
      }

      if (a3 == 2)
      {
        -[NEIKEv2PacketTunnelProvider setInterfaceAvailability](v10);
        [(NEIKEv2PacketTunnelProvider *)v10 watchIKESocketChange];
        uint64_t v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v34 = v10;
          _os_log_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: got Child Connected", buf, 0xCu);
        }

        *(_DWORD *)(v10 + 84) |= 2u;
        -[NEIKEv2PacketTunnelProvider startRekeyTimer:]((void *)v10, 0);
        NEIKEv2PacketTunnelHandleConnected((void *)v10);
        *(unsigned char *)(v10 + 78) = 1;
      }
      else if (a3 == 3)
      {
        __int16 v16 = ne_log_obj();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v34 = v10;
          __int16 v35 = 2112;
          *(void *)BOOL v36 = v7;
          _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_INFO, "%@: childStateUpdateBlock callback: got Child Disconnected (%@)", buf, 0x16u);
        }

        if ((~*(_DWORD *)(v10 + 84) & 0xF) == 0
          || ![(NEIKEv2PacketTunnelProvider *)(unsigned char *)v10 tryAlternateServerAddresses])
        {
          *(unsigned char *)(v10 + 77) = 1;
          id v18 = ne_log_obj();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v34 = v10;
            __int16 v35 = 2112;
            *(void *)BOOL v36 = v7;
            _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEFAULT, "%@: stopping tunnel since Child disconnected %@", buf, 0x16u);
          }

          uint64_t v19 = [v7 code];
          if ((unint64_t)(v19 - 3) > 0xC) {
            signed int v20 = 3;
          }
          else {
            signed int v20 = dword_19DF9D190[v19 - 3];
          }
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_133;
          v30[3] = &unk_1E5990A58;
          BOOL v31 = (id)v10;
          signed int v32 = v20;
          -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v31, v20, v30);
        }
      }
    }
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = WeakRetained;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: configurationUpdateBlock callback: %@", (uint8_t *)&v10, 0x16u);
    }

    WeakRetained[21] |= 4u;
    if (v3) {
      id Property = objc_getProperty(v3, v6, 16, 1);
    }
    else {
      id Property = 0;
    }
    id v8 = Property;
    objc_setProperty_atomic(WeakRetained, v9, v8, 88);
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_137(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if (a2
      && ((id v12 = objc_getProperty(WeakRetained, v10, 240, 1),
           [(NEIKEv2Session *)v12 firstChildSA],
           (uint64_t v14 = (_DWORD *)objc_claimAutoreleasedReturnValue()) == 0)
        ? (int v15 = 0)
        : (int v15 = v14[4]),
          v14,
          v15 != a2))
    {
      uint64_t v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id Property = objc_getProperty(v11, v20, 240, 1);
        uint64_t v23 = [(NEIKEv2Session *)Property firstChildSA];
        uint64_t v24 = (void *)v23;
        if (v23) {
          int v25 = *(_DWORD *)(v23 + 16);
        }
        else {
          int v25 = 0;
        }
        int v26 = 138412802;
        int v27 = v11;
        __int16 v28 = 1024;
        int v29 = a2;
        __int16 v30 = 1024;
        LODWORD(v31) = v25;
        _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_INFO, "%@: trafficSelectorUpdateBlock callback: childID (%X) mismatched provider childID (%X)", (uint8_t *)&v26, 0x18u);
      }
    }
    else
    {
      __int16 v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v26 = 138413058;
        int v27 = v11;
        __int16 v28 = 1024;
        int v29 = a2;
        __int16 v30 = 2112;
        id v31 = v7;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_INFO, "%@: trafficSelectorUpdateBlock callback: childID (%X) - localTrafficSelectors %@ remoteTrafficSelectors %@", (uint8_t *)&v26, 0x26u);
      }

      v11[21] |= 8u;
      objc_setProperty_atomic(v11, v17, v7, 96);
      objc_setProperty_atomic(v11, v18, v8, 104);
    }
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2112;
      uint64_t v34 = v3;
      _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: additionalAddressesUpdateBlock callback: %@", buf, 0x16u);
    }

    uint64_t v6 = v3;
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      SEL v9 = v6;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:buf count:16];
      if (!v10) {
        goto LABEL_17;
      }
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      while (1)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v14, "addressFamily", (void)v27) == 2)
          {
            int v15 = [v14 hostname];
            __int16 v16 = v7;
          }
          else
          {
            if ([v14 addressFamily] != 30) {
              continue;
            }
            int v15 = [v14 hostname];
            __int16 v16 = v8;
          }
          [v16 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:buf count:16];
        if (!v11)
        {
LABEL_17:

          uint64_t v17 = [v7 count];
          id Property = objc_getProperty(WeakRetained, v18, 128, 1);
          if (Property)
          {
            if (v17) {
              dispatch_semaphore_t v21 = v7;
            }
            else {
              dispatch_semaphore_t v21 = 0;
            }
            objc_setProperty_atomic(Property, v20, v21, 40);
          }
          uint64_t v22 = [v8 count];
          id v24 = objc_getProperty(WeakRetained, v23, 128, 1);
          if (v24)
          {
            if (v22) {
              int v26 = v8;
            }
            else {
              int v26 = 0;
            }
            objc_setProperty_atomic(v24, v25, v26, 48);
          }

          goto LABEL_30;
        }
      }
    }
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v32 = WeakRetained;
      __int16 v33 = 2080;
      uint64_t v34 = "-[NEIKEv2PacketTunnelProvider handleAdditionalServerAddressesNotification:]";
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@: %s: Empty address array", buf, 0x16u);
    }
LABEL_30:
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_141(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "%@: shortDPDEventBlock callback:", (uint8_t *)&v3, 0xCu);
    }
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v54 = 138412546;
      *(void *)&v54[4] = WeakRetained;
      *(_WORD *)&v54[12] = 2112;
      *(void *)&v54[14] = v3;
      _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_INFO, "%@: redirectEventBlock callback: %@", v54, 0x16u);
    }

    uint64_t v6 = [WeakRetained protocolConfiguration];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [WeakRetained protocolConfiguration];
      int v9 = [v8 disableRedirect];

      if (v9)
      {
        uint64_t v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)id v54 = 138412290;
          *(void *)&v54[4] = WeakRetained;
          _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_INFO, "%@: redirectEventBlock callback: received redirect but redirect is disabled", v54, 0xCu);
        }
        goto LABEL_42;
      }
    }
    uint64_t v10 = v3;
    if (!v10)
    {
      int v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v58 = WeakRetained;
        __int16 v59 = 2080;
        id v60 = "-[NEIKEv2PacketTunnelProvider handleRedirectNotification:]";
        _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_INFO, "%@: %s: No redirectServer received", buf, 0x16u);
      }
      goto LABEL_41;
    }
    id Property = objc_getProperty(WeakRetained, v11, 128, 1);
    if (!Property)
    {
LABEL_42:

      -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, (const char *)7);
      goto LABEL_43;
    }
    unsigned int v14 = Property[3] + 1;
    Property[3] = v14;
    if (v14 >= 6)
    {
      int v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Exceeded max redirects in a specific time period", buf, 2u);
      }
LABEL_41:

      goto LABEL_42;
    }
    id v16 = objc_getProperty(WeakRetained, v13, 128, 1);
    if (v16) {
      id v16 = objc_getProperty(v16, v17, 64, 1);
    }
    int v15 = v16;
    SEL v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v58 = WeakRetained;
      _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel due to Server Redirect", buf, 0xCu);
    }

    -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](WeakRetained, 0, 0);
    id v20 = objc_getProperty(WeakRetained, v19, 128, 1);
    if (v20) {
      id v20 = objc_getProperty(v20, v21, 16, 1);
    }
    id v22 = v20;
    id v24 = objc_getProperty(WeakRetained, v23, 128, 1);
    if (v24) {
      objc_setProperty_atomic(v24, v25, v22, 32);
    }

    id v27 = objc_getProperty(WeakRetained, v26, 128, 1);
    if (v27) {
      id v27 = objc_getProperty(v27, v28, 56, 1);
    }
    id v29 = v27;

    if (v29)
    {
      id v31 = objc_getProperty(WeakRetained, v30, 128, 1);
      if (v31) {
        objc_setProperty_atomic(v31, v32, v15, 32);
      }
    }
    __int16 v33 = [v10 hostname];
    id v35 = objc_getProperty(WeakRetained, v34, 128, 1);
    if (v35) {
      objc_setProperty_atomic(v35, v36, v33, 16);
    }

    id v38 = objc_getProperty(WeakRetained, v37, 128, 1);
    if (v38) {
      id v38 = objc_getProperty(v38, v39, 16, 1);
    }
    id v40 = v38;

    if (!v40)
    {
      SEL v53 = ne_log_obj();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v58 = WeakRetained;
        _os_log_error_impl(&dword_19DDAF000, v53, OS_LOG_TYPE_ERROR, "%@: Missing redirect information in notification", buf, 0xCu);
      }

      goto LABEL_41;
    }
    SEL v41 = [NEIKEv2MOBIKE alloc];
    id v43 = objc_getProperty(WeakRetained, v42, 264, 1);
    SEL v44 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v41->super.isa, v43, WeakRetained);
    objc_setProperty_atomic(WeakRetained, v45, v44, 168);

    id v47 = objc_getProperty(WeakRetained, v46, 128, 1);
    if (v47) {
      objc_setProperty_atomic(v47, v48, 0, 24);
    }
    *(void *)id v54 = MEMORY[0x1E4F143A8];
    *(void *)&v54[8] = 3221225472;
    *(void *)&v54[16] = __58__NEIKEv2PacketTunnelProvider_handleRedirectNotification___block_invoke;
    SEL v55 = &unk_1E5990AD8;
    id v56 = WeakRetained;
    -[NEIKEv2PacketTunnelProvider resolveServerAddressIfNeeded:](WeakRetained, v54);
    int v49 = *((_DWORD *)WeakRetained + 21);
    if ((~v49 & 0xF) == 0)
    {
      [WeakRetained setReasserting:1];
      int v49 = *((_DWORD *)WeakRetained + 21);
    }
    *((_DWORD *)WeakRetained + 21) = v49 & 0xFFFFFFF0;
    id v50 = (void *)*((void *)WeakRetained + 11);
    *((void *)WeakRetained + 11) = 0;

    id v51 = (void *)*((void *)WeakRetained + 12);
    *((void *)WeakRetained + 12) = 0;

    SEL v52 = (void *)*((void *)WeakRetained + 13);
    *((void *)WeakRetained + 13) = 0;
  }
LABEL_43:
}

void __58__NEIKEv2PacketTunnelProvider_handleRedirectNotification___block_invoke(uint64_t a1, char a2)
{
  id v3 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = -[NEIKEv2PacketTunnelProvider tunnelBringup](v3);
    if (!v4) {
      return;
    }
    uint64_t v5 = v4;
    id v3 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 17;
  }

  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)v5);
}

- (void)resolveServerAddressIfNeeded:(void *)a1
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [(NEIKEv2PacketTunnelProvider *)a1 configureProxyPathIfNeeded];
  id Property = objc_getProperty(a1, v5, 128, 1);
  if (Property) {
    id Property = objc_getProperty(Property, v7, 56, 1);
  }
  id v8 = Property;

  if (v8)
  {
    uint64_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v12 = objc_getProperty(a1, v11, 128, 1);
      if (v12) {
        id v12 = objc_getProperty(v12, v13, 16, 1);
      }
      id v14 = v12;
      id v16 = objc_getProperty(a1, v15, 128, 1);
      if (v16) {
        id v16 = objc_getProperty(v16, v17, 56, 1);
      }
      id v18 = v16;
      int v67 = 138412802;
      v68 = a1;
      __int16 v69 = 2112;
      id v70 = v14;
      __int16 v71 = 2112;
      id v72 = v18;
      _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_INFO, "%@: skipping resolution as server %@ uses proxy %@", (uint8_t *)&v67, 0x20u);
    }
LABEL_19:
    v3[2](v3, 1);
    goto LABEL_20;
  }
  id v19 = objc_getProperty(a1, v9, 128, 1);
  if (v19) {
    id v19 = objc_getProperty(v19, v20, 16, 1);
  }
  id v21 = v19;
  char v22 = +[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, v21);

  if ((v22 & 3) == 1)
  {
    SEL v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v67 = 138412290;
      v68 = a1;
      _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_INFO, "%@: serverAddress IP address available", (uint8_t *)&v67, 0xCu);
    }

    id v25 = objc_getProperty(a1, v24, 128, 1);
    id v27 = objc_getProperty(a1, v26, 128, 1);
    if (v27) {
      id v27 = objc_getProperty(v27, v28, 16, 1);
    }
    id v29 = v27;
    id v31 = objc_getProperty(a1, v30, 208, 1);
    -[NEIKEv2Server setServerResolvedAddress:path:](v25, v29, v31);

    goto LABEL_19;
  }
  id v32 = _Block_copy(v3);
  __int16 v33 = (void *)a1[24];
  a1[24] = v32;

  SEL v34 = (void *)MEMORY[0x1E4F38BF0];
  id v36 = objc_getProperty(a1, v35, 128, 1);
  if (v36) {
    id v36 = objc_getProperty(v36, v37, 16, 1);
  }
  id v38 = v36;
  uint64_t v39 = [v34 endpointWithHostname:v38 port:@"500"];

  if (v39)
  {
    SEL v41 = objc_msgSend(objc_getProperty(a1, v40, 208, 1), "scopedInterface");
    id v43 = objc_getProperty(a1, v42, 208, 1);
    if (v41) {
      [v43 scopedInterface];
    }
    else {
    SEL v46 = [v43 interface];
    }
    id v47 = [v46 interfaceName];

    if (v47)
    {
      id v48 = objc_alloc_init(MEMORY[0x1E4F38C10]);
      id v49 = objc_alloc(MEMORY[0x1E4F38BF8]);
      id v51 = objc_msgSend(objc_getProperty(a1, v50, 208, 1), "scopedInterface");
      id v53 = objc_getProperty(a1, v52, 208, 1);
      id v54 = v53;
      if (v51) {
        [v53 scopedInterface];
      }
      else {
      SEL v55 = [v53 interface];
      }
      id v56 = [v55 interfaceName];
      id v57 = (void *)[v49 initWithInterfaceName:v56];
      [v48 setRequiredInterface:v57];
    }
    else
    {
      id v48 = 0;
    }
    [v48 setIgnoreResolverStats:1];
    id v58 = ne_log_obj();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      int v67 = 138412802;
      v68 = a1;
      __int16 v69 = 2112;
      id v70 = v39;
      __int16 v71 = 2112;
      id v72 = v48;
      _os_log_impl(&dword_19DDAF000, v58, OS_LOG_TYPE_DEFAULT, "%@: Resolving %@ (%@)", (uint8_t *)&v67, 0x20u);
    }

    uint64_t v59 = [objc_alloc(MEMORY[0x1E4F38C28]) initWithEndpoint:v39 parameters:v48];
    id v60 = (void *)a1[17];
    a1[17] = v59;

    uint64_t v61 = (void *)a1[17];
    if (v61)
    {
      __int16 v62 = [a1 context];
      [v61 addObserver:v62 forKeyPath:@"resolvedEndpoints" options:5 context:0];
    }
    else
    {
      uint64_t v63 = ne_log_obj();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        int v67 = 138412290;
        v68 = a1;
        _os_log_error_impl(&dword_19DDAF000, v63, OS_LOG_TYPE_ERROR, "%@: Failed to create NWResolver", (uint8_t *)&v67, 0xCu);
      }

      v3[2](v3, 0);
    }
  }
  else
  {
    SEL v44 = ne_log_obj();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v64 = objc_getProperty(a1, v45, 128, 1);
      if (v64) {
        id v64 = objc_getProperty(v64, v65, 16, 1);
      }
      id v66 = v64;
      int v67 = 138412546;
      v68 = a1;
      __int16 v69 = 2112;
      id v70 = v66;
      _os_log_error_impl(&dword_19DDAF000, v44, OS_LOG_TYPE_ERROR, "%@: Failed to create endpoint for resolution, serverAddress %@", (uint8_t *)&v67, 0x16u);
    }
    v3[2](v3, 0);
  }

LABEL_20:
}

- (BOOL)tryAlternateServerAddresses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_getProperty(a1, a2, 128, 1);
  id Property = objc_getProperty(a1, v4, 208, 1);
  uint64_t v6 = -[NEIKEv2Server getNextViableServerAddressForPath:](v3, Property);

  if (v6)
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v12 = a1;
      __int16 v13 = 2080;
      id v14 = "-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@: %s: Alternate server address available (%@), connect again", buf, 0x20u);
    }

    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = a1;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: Stopping tunnel before attempting alternate server address", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke;
    v10[3] = &unk_1E59932C0;
    v10[4] = a1;
    -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](a1, 0, v10);
  }

  return v6 != 0;
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_133(uint64_t a1)
{
}

- (void)setInterfaceAvailability
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 120))
  {
    int v2 = socket(30, 2, 0);
    if ((v2 & 0x80000000) == 0)
    {
      int v3 = v2;
      uint64_t v4 = *(void *)(a1 + 120);
      if (v4) {
        SEL v5 = (__CFString *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const char *)(v4 + 265), 0x600u);
      }
      else {
        SEL v5 = 0;
      }
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v6 = v5;
      [(__CFString *)v6 UTF8String];
      __strlcpy_chk();
      LOBYTE(v17) = 4;
      BYTE3(v17) = 0;
      int v7 = ioctl(v3, 0xC02069A9uLL, &v16);
      id v8 = ne_log_obj();
      int v9 = v8;
      if (v7 < 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v11 = a1;
          __int16 v12 = 2112;
          __int16 v13 = v6;
          _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to set interface availability for %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412802;
        uint64_t v11 = a1;
        __int16 v12 = 2112;
        __int16 v13 = v6;
        __int16 v14 = 1024;
        int v15 = 0;
        _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@: Set interface availability on interface %@ to %u (0 implies 'available')", buf, 0x1Cu);
      }

      close(v3);
    }
  }
}

- (void)watchIKESocketChange
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id Property = objc_getProperty((id)a1, a2, 240, 1);
  if (Property)
  {
    id v5 = objc_getProperty(Property, v4, 336, 1);
    int v7 = v5;
    if (v5) {
      id v5 = objc_getProperty(v5, v6, 64, 1);
    }
  }
  else
  {
    int v7 = 0;
    id v5 = 0;
  }
  id v8 = v5;

  id v10 = objc_getProperty((id)a1, v9, 240, 1);
  if (v10)
  {
    id v12 = objc_getProperty(v10, v11, 336, 1);
    __int16 v14 = v12;
    if (v12) {
      id v12 = objc_getProperty(v12, v13, 72, 1);
    }
  }
  else
  {
    __int16 v14 = 0;
    id v12 = 0;
  }
  id v15 = v12;

  if (objc_getProperty((id)a1, v16, 272, 1))
  {
    objc_msgSend(objc_getProperty((id)a1, v17, 272, 1), "removeObserver:forKeyPath:", a1, @"path");
    objc_setProperty_atomic((id)a1, v18, 0, 272);
  }
  if (*(void *)(a1 + 248))
  {
    if (v8)
    {
      if (v15)
      {
        if ((*(unsigned char *)(a1 + 74) & 1) == 0
          || (id v19 = (os_unfair_lock_s *)objc_getProperty((id)a1, v17, 232, 1),
              (-[NEIKEv2CompanionDatapath connected](v19) & 1) == 0))
        {
          id v20 = ne_log_obj();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            id v27 = objc_msgSend(objc_getProperty((id)a1, v21, 208, 1), "scopedInterface");
            id v29 = objc_getProperty((id)a1, v28, 208, 1);
            SEL v30 = v29;
            if (v27) {
              [v29 scopedInterface];
            }
            else {
            id v31 = [v29 interface];
            }
            int v32 = 136315906;
            __int16 v33 = "-[NEIKEv2PacketTunnelProvider watchIKESocketChange]";
            __int16 v34 = 2048;
            uint64_t v35 = [v31 interfaceIndex];
            __int16 v36 = 2112;
            id v37 = v8;
            __int16 v38 = 2112;
            id v39 = v15;
            _os_log_debug_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEBUG, "%s: IKE is scoped on ifIndex %ld (local address %@, remote address %@)\n", (uint8_t *)&v32, 0x2Au);
          }
          id v22 = objc_alloc_init(MEMORY[0x1E4F38C10]);
          SEL v23 = (void *)[objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceIndex:*(void *)(a1 + 248)];
          [v22 setRequiredInterface:v23];

          [v22 setLocalAddress:v8];
          SEL v24 = (void *)[objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:v15 parameters:v22];
          objc_setProperty_atomic((id)a1, v25, v24, 272);

          objc_msgSend(objc_getProperty((id)a1, v26, 272, 1), "addObserver:forKeyPath:options:context:", a1, @"path", 5, 0);
        }
      }
    }
  }
}

- (void)startRekeyTimer:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 protocolConfiguration];
  if (v4)
  {
    char v5 = v4[247];

    if (v5)
    {
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = "CHILD";
        if (a2) {
          int v7 = "IKE";
        }
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@: startRekeyTimer (%s)", buf, 0x16u);
      }

      id v8 = (_DWORD *)a1[19];
      if (!v8)
      {
        SEL v9 = [NEIKEv2Rekey alloc];
        id v10 = [a1 description];
        if (v9)
        {
          *(void *)long long buf = v9;
          *(void *)&buf[8] = NEIKEv2Rekey;
          id v11 = objc_msgSendSuper2((objc_super *)buf, sel_init);
          if (v11)
          {
            id v12 = v11;
            __int16 v13 = [v10 copy];
            objc_setProperty_atomic(v12, v14, v13, 32);
          }
          else
          {
            __int16 v13 = ne_log_obj();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)SEL v23 = 0;
              _os_log_fault_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_FAULT, "[super init] failed", v23, 2u);
            }
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }

        id v15 = (void *)a1[19];
        a1[19] = v12;

        id v8 = (_DWORD *)a1[19];
      }
      SEL v16 = [a1 protocolConfiguration];
      long long v17 = v16;
      if (a2)
      {
        SEL v18 = [v16 IKESecurityAssociationParameters];
        int v19 = [v18 lifetimeMinutes];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke;
        v22[3] = &unk_1E59932C0;
        v22[4] = a1;
        -[NEIKEv2Rekey startIKETimer:timeoutHandler:](v8, v19, v22);
      }
      else
      {
        SEL v18 = [v16 childSecurityAssociationParameters];
        int v20 = [v18 lifetimeMinutes];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_176;
        v21[3] = &unk_1E59932C0;
        v21[4] = a1;
        -[NEIKEv2Rekey startChildTimer:timeoutHandler:](v8, v20, v21);
      }
    }
  }
  else
  {
  }
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 264, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2;
  block[3] = &unk_1E59932C0;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_176(uint64_t a1, const char *a2)
{
  id Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 264, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2_177;
  block[3] = &unk_1E59932C0;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2_177(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || (*(unsigned char *)(v2 + 77) & 1) == 0)
  {
    int v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v20 = 138412290;
      uint64_t v21 = v4;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: REKEYING CHILD", (uint8_t *)&v20, 0xCu);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      id v7 = objc_getProperty(v6, v5, 240, 1);
      if (v7)
      {
        id v9 = v7;
        id Property = *(id *)(a1 + 32);
        if (Property) {
          id Property = objc_getProperty(Property, v8, 240, 1);
        }
        id v11 = [(NEIKEv2Session *)Property firstChildSA];
        if (v11)
        {
          int v12 = v11[4];

          if (!v12) {
            return;
          }
          id v14 = *(id *)(a1 + 32);
          if (v14) {
            id v14 = objc_getProperty(v14, v13, 240, 1);
          }
          id v9 = v14;
          id v16 = *(id *)(a1 + 32);
          if (v16) {
            id v16 = objc_getProperty(v16, v15, 240, 1);
          }
          uint64_t v17 = [(NEIKEv2Session *)v16 firstChildSA];
          SEL v18 = (void *)v17;
          if (v17) {
            uint64_t v19 = *(unsigned int *)(v17 + 16);
          }
          else {
            uint64_t v19 = 0;
          }
          [v9 forceRekeyChild:v19];
        }
        else
        {
          SEL v18 = 0;
        }
      }
    }
  }
}

void *__47__NEIKEv2PacketTunnelProvider_startRekeyTimer___block_invoke_2(void *result)
{
  uint64_t v1 = result;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = result[4];
  if (!v2 || (*(unsigned char *)(v2 + 77) & 1) == 0)
  {
    int v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v1[4];
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: REKEYING IKE", (uint8_t *)&v8, 0xCu);
    }

    uint64_t result = (void *)v1[4];
    if (result)
    {
      uint64_t result = objc_getProperty(result, v5, 240, 1);
      if (result)
      {
        id Property = (id)v1[4];
        if (Property) {
          id Property = objc_getProperty(Property, v6, 240, 1);
        }
        return (void *)[Property forceRekeyIKE];
      }
    }
  }
  return result;
}

void __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(NSObject **)(a1 + 32);
  if (Property)
  {
    id Property = objc_getProperty(Property, a2, 264, 1);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke_2;
  block[3] = &unk_1E59932C0;
  block[4] = v4;
  dispatch_async(Property, block);
}

void __58__NEIKEv2PacketTunnelProvider_tryAlternateServerAddresses__block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v16 = 138412290;
    uint64_t v17 = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: Bringing up tunnel with alternate server address", (uint8_t *)&v16, 0xCu);
  }

  char v5 = [NEIKEv2MOBIKE alloc];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id Property = objc_getProperty(v6, v4, 264, 1);
    int v8 = *(void **)(a1 + 32);
  }
  else
  {
    int v8 = 0;
    id Property = 0;
  }
  uint64_t v10 = -[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]((id *)&v5->super.isa, Property, v8);
  id v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_setProperty_atomic(v11, v9, v10, 168);
  }

  uint64_t v12 = -[NEIKEv2PacketTunnelProvider tunnelBringup](*(void *)(a1 + 32));
  if (v12)
  {
    __int16 v13 = (const char *)v12;
    id v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138412546;
      uint64_t v17 = v15;
      __int16 v18 = 2080;
      uint64_t v19 = "-[NEIKEv2PacketTunnelProvider tryAlternateServerAddresses]_block_invoke";
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@: %s: Failed tunnel Bringup with alternate server address", (uint8_t *)&v16, 0x16u);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(unsigned char **)(a1 + 32), v13);
  }
}

void __55__NEIKEv2PacketTunnelProvider_setupIKEv2CallbackBlocks__block_invoke_130(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  unint64_t v2 = [*(id *)(a1 + 40) code] - 3;
  if (v2 > 0xC) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = dword_19DF9D190[v2];
  }

  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v1, (const char *)v3);
}

id __64__NEIKEv2PacketTunnelProvider_sendAnalyticsWithDisconnectError___block_invoke(void *a1)
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = @"tunnelType";
  unint64_t v2 = (__CFString *)a1[4];
  if (v2)
  {
    uint64_t info = v2[6].info;
    uint64_t v4 = &stru_1EF054CB8;
    if (info == 2) {
      uint64_t v4 = @"Fallback Tunnel";
    }
    if (info == 1) {
      unint64_t v2 = @"Primary Tunnel";
    }
    else {
      unint64_t v2 = v4;
    }
  }
  uint64_t v6 = v2;
  v15[0] = v6;
  v14[1] = @"serverAddress";
  id Property = (id)a1[4];
  if (Property)
  {
    id Property = objc_getProperty(Property, v5, 128, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v8, 16, 1);
    }
  }
  id v9 = Property;
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  v15[1] = v9;
  v15[2] = v10;
  v14[2] = @"interface";
  v14[3] = @"failReason";
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

- (void)handleCompanionProxyDatapathFailure:(void *)a1
{
  id Property = objc_getProperty(a1, a2, 264, 1);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke;
  v5[3] = &unk_1E5990BA0;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_async(Property, v5);
}

void __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!v3 || !objc_getProperty(v3, a2, 232, 1))
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      __int16 v13 = "no companion proxy path present, ignoring";
      goto LABEL_14;
    }
LABEL_15:

    return;
  }
  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5 && (id v7 = objc_getProperty(v5, v4, 232, 1)) != 0)
  {
    uint64_t v8 = v7[2];
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v6 == v8)
  {
    id v9 = *(void **)(a1 + 32);
    if (!v9 || (id Property = objc_getProperty(v9, v4, 128, 1)) == 0 || (Property[8] & 1) == 0)
    {
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        __int16 v13 = "no companion proxy present, ignoring";
LABEL_14:
        _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_INFO, v13, buf, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    uint64_t v20 = *(unsigned char **)(a1 + 32);
    if (!v20 || (v20[75] & 1) == 0)
    {
      uint64_t v12 = ne_log_obj();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_15;
      }
      *(_WORD *)long long buf = 0;
      __int16 v13 = "no companion outbound datapath detected, ignoring";
      goto LABEL_14;
    }
    id v22 = objc_getProperty(v20, v11, 232, 1);
    SEL v23 = *(void **)(a1 + 32);
    if (v23)
    {
      id v24 = objc_getProperty(v23, v21, 232, 1);
      uint64_t v25 = v24;
      if (v24)
      {
        SEL v26 = (void *)*((void *)v24 + 12);
LABEL_30:
        int v27 = -[NEIKEv2CompanionDatapath getStopReasonFromConnectionError:]((uint64_t)v22, v26);

        id v29 = *(id *)(a1 + 32);
        if (v29) {
          id v29 = objc_getProperty(v29, v28, 240, 1);
        }
        uint64_t v31 = [v29 state];
        int v32 = *(unsigned char **)(a1 + 32);
        if (v31 == 2 && v32 && (v32[79] & 1) != 0)
        {
          __int16 v33 = objc_getProperty(v32, v30, 168, 1);
          if (!v33 || (v33[8] & 1) == 0)
          {
            id v35 = *(id *)(a1 + 32);
            if (v27 == 4)
            {
              if (v35 && (id v35 = objc_getProperty(v35, v34, 168, 1), (v36 = *(void *)(a1 + 32)) != 0)) {
                id v37 = *(void **)(v36 + 248);
              }
              else {
                id v37 = 0;
              }
              -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v35, v37, 2, 0, 0);
            }
            else
            {
              -[NEIKEv2PacketTunnelProvider handleInterfaceChange:]((uint64_t)v35, 0);
            }
          }
        }
        else
        {
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke_160;
          v38[3] = &unk_1E5990A58;
          void v38[4] = v32;
          int v39 = v27;
          [v32 stopTunnelWithReason:14 completionHandler:v38];
        }
        return;
      }
    }
    else
    {
      uint64_t v25 = 0;
    }
    SEL v26 = 0;
    goto LABEL_30;
  }
  id v14 = ne_log_obj();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    if (v16 && (__int16 v18 = objc_getProperty(v16, v15, 232, 1)) != 0)
    {
      uint64_t v19 = v18[2];
    }
    else
    {
      uint64_t v19 = 0;
    }
    *(_DWORD *)long long buf = 134218240;
    uint64_t v41 = v17;
    __int16 v42 = 2048;
    uint64_t v43 = v19;
    _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_INFO, "companion proxy datapath don't match %llu != %llu, ignoring", buf, 0x16u);
  }
}

void __67__NEIKEv2PacketTunnelProvider_handleCompanionProxyDatapathFailure___block_invoke_160(uint64_t a1)
{
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (a2)
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v5, 264, 1);
    }
    else {
      id Property = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_2;
    block[3] = &unk_1E5992C58;
    uint64_t v8 = Property;
    objc_copyWeak(&v11, v3);
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
  }
  else
  {
    [WeakRetained setReasserting:0];
    -[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:]((uint64_t)v6, 0);
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      __int16 v13 = v6;
      _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "%@: Tunnel Status: UP", buf, 0xCu);
    }
  }
}

- (BOOL)NEIKEv2ProviderAuthenticate:(unsigned char *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  BOOL v5 = 1;
  if ((a1[80] & 1) == 0)
  {
    a1[80] = 1;
    if (isa_nsdictionary(v3))
    {
      uint64_t v6 = NEResourcesCopyLocalizedNSString(@"VPN_HEADER", @"VPN_HEADER");
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = NEResourcesCopyLocalizedNSString(@"PROMPT_REQUEST_AUTH", @"PROMPT_REQUEST_AUTH");
      [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];

      id v9 = NEResourcesCopyLocalizedNSString(@"PASSWORD", @"PASSWORD");
      id v22 = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
      [v7 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F1DA20]];

      [v7 setObject:&unk_1EF08D390 forKeyedSubscript:*MEMORY[0x1E4F1DA28]];
      [v7 setObject:&unk_1EF08D3A8 forKeyedSubscript:@"SBUserNotificationTextAutocapitalizationType"];
      [v7 setObject:&unk_1EF08D3C0 forKeyedSubscript:@"SBUserNotificationTextAutocorrectionType"];
      objc_msgSend(objc_getProperty(a1, v11, 216, 1), "cancel");
      uint64_t v12 = [NEUserNotification alloc];
      id Property = objc_getProperty(a1, v13, 264, 1);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__NEIKEv2PacketTunnelProvider_NEIKEv2ProviderAuthenticate___block_invoke;
      v19[3] = &unk_1E5990C10;
      id v20 = v4;
      uint64_t v21 = a1;
      id v15 = [(NEUserNotification *)v12 initAndShowAuthenticationWithHeader:v6 options:v7 flags:0x10000 callbackQueue:Property callbackHandler:v19];
      objc_setProperty_atomic(a1, v16, v15, 216);

      BOOL v5 = objc_getProperty(a1, v17, 216, 1) != 0;
    }
    else
    {
      uint64_t v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v24 = a1;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@: Calling NEIKEv2ProviderAuthenticate with non-nsdictionary tunnelOptions", buf, 0xCu);
      }
      BOOL v5 = 0;
    }
  }
  return v5;
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_114(uint64_t a1, char a2)
{
  id v3 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = -[NEIKEv2PacketTunnelProvider tunnelBringup](v3);
    if (!v4) {
      return;
    }
    uint64_t v5 = v4;
    id v3 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 10;
  }

  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)v5);
}

void __59__NEIKEv2PacketTunnelProvider_NEIKEv2ProviderAuthenticate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [NSString alloc];
    uint64_t v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = (void *)[v5 initWithString:v6];

    [*(id *)(a1 + 32) setValue:v7 forKey:@"Password"];
    -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:](*(void *)(a1 + 40), *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@: Cancel IKEv2 tunnel, no password entered", (uint8_t *)&v11, 0xCu);
    }

    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(unsigned char **)(a1 + 40), (const char *)0x17);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    *(unsigned char *)(v9 + 80) = 0;
  }
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = WeakRetained;
    _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "%@: Stopping tunnel due to set tunnel network settings failed", buf, 0xCu);
  }

  if (WeakRetained) {
    WeakRetained[77] = 1;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_107;
  v4[3] = &unk_1E59932C0;
  id v5 = WeakRetained;
  id v3 = WeakRetained;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v3, 9, v4);
}

void __59__NEIKEv2PacketTunnelProvider_startIKEv2TunnelWithOptions___block_invoke_107(uint64_t a1)
{
}

void __54__NEIKEv2PacketTunnelProvider_handleDefaultPathChange__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    unint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "received keepalive response", v3, 2u);
    }
  }
}

void __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t v2 = WeakRetained;
    -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](WeakRetained, 0);
    id WeakRetained = v2;
  }
}

void __49__NEIKEv2PacketTunnelProvider_handleConfigChange__block_invoke_169(uint64_t a1, char a2)
{
  id v3 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = -[NEIKEv2PacketTunnelProvider tunnelBringup]((uint64_t)v3);
    if (!v4) {
      return;
    }
    uint64_t v5 = v4;
    id v3 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    uint64_t v5 = 17;
  }

  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](v3, (const char *)v5);
}

- (void)observerHelperHandler:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NEIKEv2PacketTunnelProvider;
  [(NEProvider *)&v15 observerHelperHandler:a3 ofObject:v10 change:a5 context:a6];
  if (self) {
    id Property = objc_getProperty(self, v11, 136, 1);
  }
  else {
    id Property = 0;
  }
  if (Property == v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__NEIKEv2PacketTunnelProvider_observerHelperHandler_ofObject_change_context___block_invoke;
    block[3] = &unk_1E59932C0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __77__NEIKEv2PacketTunnelProvider_observerHelperHandler_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && (*(unsigned char *)(v1 + 77) & 1) == 0 && *(void *)(v1 + 136))
  {
    unint64_t v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = [*(id *)(v1 + 136) resolvedEndpoints];
      uint64_t v4 = [v3 count];
      uint64_t v5 = [*(id *)(v1 + 136) status];
      uint64_t v6 = "In progress";
      *(_DWORD *)long long buf = 138412802;
      uint64_t v69 = v1;
      if (v5 == 2) {
        uint64_t v6 = "Complete";
      }
      __int16 v70 = 2048;
      uint64_t v71 = v4;
      __int16 v72 = 2080;
      uint64_t v73 = v6;
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "%@: handleDNSResolution (resolvedEndpoints count %lu) (query status %s)", buf, 0x20u);
    }
    id v7 = [*(id *)(v1 + 136) resolvedEndpoints];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v10 = &OBJC_IVAR___NEIKEv2IKESA__error;
      id Property = objc_getProperty((id)v1, v9, 128, 1);
      if (Property) {
        id Property = objc_getProperty(Property, v12, 16, 1);
      }
      id v55 = Property;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      obuint64_t j = [*(id *)(v1 + 136) resolvedEndpoints];
      uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
      if (v13)
      {
        uint64_t v15 = v13;
        char v16 = 0;
        uint64_t v17 = *(void *)v60;
        *(void *)&long long v14 = 138413314;
        long long v54 = v14;
        __int16 v18 = &OBJC_IVAR___NEIKEv2IKESA__error;
        do
        {
          uint64_t v19 = 0;
          uint64_t v57 = v15;
          do
          {
            if (*(void *)v60 != v17) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v59 + 1) + 8 * v19);
            uint64_t v21 = ne_log_obj();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = v17;
              SEL v23 = v10;
              if ([v20 addressFamily] == 2) {
                id v24 = "IPv4";
              }
              else {
                id v24 = "IPv6";
              }
              uint64_t v25 = objc_msgSend(v20, "hostname", v54);
              SEL v26 = [v20 port];
              *(_DWORD *)uint64_t v63 = v54;
              *(void *)&v63[4] = v1;
              *(_WORD *)&v63[12] = 2112;
              *(void *)&v63[14] = v55;
              *(_WORD *)&v63[22] = 2080;
              id v64 = v24;
              id v10 = v23;
              uint64_t v17 = v22;
              uint64_t v15 = v57;
              *(_WORD *)id v65 = 2112;
              *(void *)&v65[2] = v25;
              __int16 v66 = 2112;
              int v67 = v26;
              _os_log_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_INFO, "%@: Resolved %@: %s address %@:%@", v63, 0x34u);

              __int16 v18 = &OBJC_IVAR___NEIKEv2IKESA__error;
            }

            int v27 = *(void **)(v1 + v10[188]);
            SEL v28 = [v20 hostname];
            id v30 = objc_getProperty((id)v1, v29, v18[200], 1);
            -[NEIKEv2Server setServerResolvedAddress:path:](v27, v28, v30);

            v16 |= [v20 addressFamily] == 30;
            ++v19;
          }
          while (v15 != v19);
          uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
        }
        while (v15);
      }
      else
      {
        char v16 = 0;
      }

      if (objc_getProperty((id)v1, v37, 192, 1))
      {
        if ((v16 & 1) != 0 || [*(id *)(v1 + 136) status] == 2)
        {
          if (objc_getProperty((id)v1, v38, 144, 1))
          {
            uint64_t v40 = objc_getProperty((id)v1, v39, 144, 1);
            dispatch_source_cancel(v40);
            objc_setProperty_atomic((id)v1, v41, 0, 144);
          }
          __int16 v42 = (void (**)(id, uint64_t))objc_getProperty((id)v1, v39, 192, 1);
          v42[2](v42, 1);
          objc_setProperty_atomic_copy((id)v1, v43, 0, 192);
        }
        else if (!objc_getProperty((id)v1, v38, 144, 1))
        {
          id v48 = objc_getProperty((id)v1, v47, 264, 1);
          *(void *)uint64_t v63 = MEMORY[0x1E4F143A8];
          *(void *)&v63[8] = 3221225472;
          *(void *)&v63[16] = __50__NEIKEv2PacketTunnelProvider_handleDNSResolution__block_invoke;
          id v64 = (const char *)&unk_1E59932C0;
          *(void *)id v65 = v1;
          id v49 = NECreateTimerSource(v48, 1, v63);
          objc_setProperty_atomic((id)v1, v50, v49, 144);
        }
      }
      if (objc_msgSend(*(id *)(v1 + 136), "status", v54) == 2)
      {
        uint64_t v44 = *(void **)(v1 + 136);
        SEL v45 = [(id)v1 context];
        [v44 removeObserver:v45 forKeyPath:@"resolvedEndpoints"];

        SEL v46 = *(void **)(v1 + 136);
        *(void *)(v1 + 136) = 0;
      }
    }
    else if ([*(id *)(v1 + 136) status] == 2)
    {
      uint64_t v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        id v51 = objc_getProperty((id)v1, v32, 128, 1);
        if (v51) {
          id v51 = objc_getProperty(v51, v52, 16, 1);
        }
        id v53 = v51;
        *(_DWORD *)long long buf = 138412546;
        uint64_t v69 = v1;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v53;
        _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "%@: Failed to resolve %@", buf, 0x16u);
      }
      __int16 v33 = *(void **)(v1 + 136);
      __int16 v34 = [(id)v1 context];
      [v33 removeObserver:v34 forKeyPath:@"resolvedEndpoints"];

      id v35 = *(void **)(v1 + 136);
      *(void *)(v1 + 136) = 0;

      uint64_t v36 = *(void *)(v1 + 192);
      if (v36)
      {
        (*(void (**)(uint64_t, void))(v36 + 16))(v36, 0);
        id v56 = *(void **)(v1 + 192);
        *(void *)(v1 + 192) = 0;
      }
    }
  }
}

void __50__NEIKEv2PacketTunnelProvider_handleDNSResolution__block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    return;
  }
  if (!objc_getProperty(v3, a2, 144, 1)) {
    goto LABEL_7;
  }
  id Property = *(NSObject **)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, v4, 144, 1);
  }
  dispatch_source_cancel(Property);
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v6, 0, 144);
LABEL_7:
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8 && objc_getProperty(v8, v4, 192, 1))
    {
      id v10 = *(id *)(a1 + 32);
      if (v10) {
        id v10 = objc_getProperty(v10, v9, 192, 1);
      }
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
      uint64_t v12 = *(void **)(a1 + 32);
      if (v12)
      {
        objc_setProperty_atomic_copy(v12, v11, 0, 192);
      }
    }
  }
}

- (void)wake
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: wake Invoked", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NEIKEv2PacketTunnelProvider_wake__block_invoke;
  block[3] = &unk_1E59932C0;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __35__NEIKEv2PacketTunnelProvider_wake__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(unsigned char *)(v2 + 77) & 1) == 0)
  {
    if (!objc_getProperty(*(id *)(a1 + 32), a2, 240, 1))
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_INFO, "%@: Wake_up: Session down, ignore WakeUp", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_29;
    }
    id v4 = objc_getProperty((id)v2, v3, 128, 1);
    id Property = objc_getProperty((id)v2, v5, 208, 1);
    id v7 = -[NEIKEv2Server getViableServerAddressForPath:](v4, Property);

    if (*(unsigned char *)(v2 + 79))
    {
      uint64_t v15 = [(id)v2 protocolConfiguration];
      char v16 = [v15 disableMOBIKERetryOnWake] != 0;

      id v18 = objc_getProperty((id)v2, v17, 168, 1);
      uint64_t v19 = *(void **)(v2 + 248);
      id v20 = v18;
      uint64_t v22 = objc_msgSend(objc_getProperty((id)v2, v21, 208, 1), "status");
      -[NEIKEv2MOBIKE initiateMOBIKE:pathStatus:serverAddress:earlyDisconnect:]((uint64_t)v20, v19, v22, v7, v16);

      SEL v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        id v24 = "%@: Waking, kick off MOBIKE";
LABEL_18:
        _os_log_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v29, 0xCu);
      }
    }
    else
    {
      uint64_t v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_INFO, "%@: Waking, kick off DPD", (uint8_t *)&v29, 0xCu);
      }

      uint64_t v9 = [(id)v2 protocolConfiguration];
      unint64_t v10 = [v9 deadPeerDetectionRate];
      char v11 = *(unsigned char *)(v2 + 76);
      self;
      if (v10 < 2)
      {
        uint64_t v13 = 5;
        uint64_t v25 = 1000;
LABEL_28:

        id v27 = objc_getProperty((id)v2, v26, 240, 1);
        uint64_t v28 = *(void *)(v2 + 264);
        *(void *)&long long v29 = MEMORY[0x1E4F143A8];
        *((void *)&v29 + 1) = 3221225472;
        id v30 = __40__NEIKEv2PacketTunnelProvider_wakeIKEv2__block_invoke;
        uint64_t v31 = &unk_1E5990AD8;
        uint64_t v32 = v2;
        [v27 sendKeepaliveWithRetries:v13 retryIntervalInMilliseconds:v25 callbackQueue:v28 callback:&v29];
        goto LABEL_29;
      }
      if (v10 == 3)
      {
        BOOL v12 = (v11 & 1) == 0;
        if (v11) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 3;
        }
        uint64_t v14 = 3000;
        goto LABEL_25;
      }
      if (v10 == 2)
      {
        BOOL v12 = (v11 & 1) == 0;
        if (v11) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = 5;
        }
        uint64_t v14 = 5000;
LABEL_25:
        if (v12) {
          uint64_t v25 = 1000;
        }
        else {
          uint64_t v25 = v14;
        }
        goto LABEL_28;
      }

      SEL v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v29) = 138412290;
        *(void *)((char *)&v29 + 4) = v2;
        id v24 = "%@: Wake_up: failed to get DPD attributes";
        goto LABEL_18;
      }
    }

LABEL_29:
  }
}

void __40__NEIKEv2PacketTunnelProvider_wakeIKEv2__block_invoke(uint64_t a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = ne_log_obj();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v7 = *(void *)(v6 + 248);
      }
      else {
        uint64_t v7 = 0;
      }
      int v11 = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      uint64_t v8 = "%@: Wake_up: [%lu] WakeUP: DPD succeeded";
LABEL_10:
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0x16u);
    }
  }
  else if (v5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      uint64_t v10 = *(void *)(v9 + 248);
    }
    else {
      uint64_t v10 = 0;
    }
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    uint64_t v8 = "%@: Wake_up: [%lu] WakeUP: DPD failed";
    goto LABEL_10;
  }
}

- (void)stopTunnelWithReason:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "%@: stopTunnelWithReason Invoked", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke;
  block[3] = &unk_1E5992D90;
  id v11 = v6;
  int64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(queue, block);
}

void __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(unsigned char *)(v1 + 77) = 1;
    uint64_t v2 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    uint64_t v2 = 0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke_2;
  v4[3] = &unk_1E59936F8;
  void v4[4] = v2;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v2, v3, v4);
}

uint64_t __70__NEIKEv2PacketTunnelProvider_stopTunnelWithReason_completionHandler___block_invoke_2(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider stopObserving](*(unsigned char **)(a1 + 32));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)startTunnelWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    char v16 = self;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "%@: startTunnelWithOptions Invoked", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NEIKEv2PacketTunnelProvider_startTunnelWithOptions_completionHandler___block_invoke;
  block[3] = &unk_1E5992CA0;
  id v13 = v6;
  id v14 = v7;
  void block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __72__NEIKEv2PacketTunnelProvider_startTunnelWithOptions_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    *(unsigned char *)(v3 + 77) = 0;
    id v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_setProperty_atomic_copy(v4, a2, *(id *)(a1 + 48), 176);
      id v4 = *(void **)(a1 + 32);
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = *(void **)(a1 + 40);

  -[NEIKEv2PacketTunnelProvider startIKEv2TunnelWithOptions:]((uint64_t)v4, v5);
}

- (void)dealloc
{
  -[NEIKEv2PacketTunnelProvider reset:]((uint64_t)self, 1);
  server = self->_server;
  self->_server = 0;

  queue = self->_queue;
  self->_queue = 0;

  id startTunnelCompletionHandler = self->_startTunnelCompletionHandler;
  self->_id startTunnelCompletionHandler = 0;

  id stopTunnelCompletionHandler = self->_stopTunnelCompletionHandler;
  self->_id stopTunnelCompletionHandler = 0;

  id v7 = [(NEPacketTunnelProvider *)self packetFlow];
  -[NEPacketTunnelFlow closeVirtualInterface](v7);

  exit(0);
}

- (NEIKEv2PacketTunnelProvider)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(NEPacketTunnelProvider *)self initWithVirtualInterfaceType:2];
  uint64_t v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(v7.__sigaction_u.__sa_handler) = 138412290;
    *(void (__cdecl **)(int, __siginfo *, void *))((char *)&v7.__sigaction_u.__sa_sigaction + 4) = (void (__cdecl *)(int, __siginfo *, void *))v2;
    _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@: Init with IPSec virtual interface type", (uint8_t *)&v7, 0xCu);
  }

  if (NEIKEv2PacketTunnelProviderCopyQueue_onceToken != -1) {
    dispatch_once(&NEIKEv2PacketTunnelProviderCopyQueue_onceToken, &__block_literal_global_326);
  }
  objc_storeStrong((id *)&v2->_queue, (id)NEIKEv2PacketTunnelProviderCopyQueue_queue);
  [(NEIKEv2PacketTunnelProvider *)v2 addObserver:v2 forKeyPath:@"protocolConfiguration" options:5 context:0];
  [(NEIKEv2PacketTunnelProvider *)v2 addObserver:v2 forKeyPath:@"defaultPath" options:5 context:0];
  *(&v2->_isObserving + 1) = 1;
  id v4 = [(NEProvider *)v2 defaultPath];
  objc_setProperty_atomic(v2, v5, v4, 208);

  v2->_randomLocalPortFallbackRetryCount = 0;
  v7.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v7.sa_mask = 0;
  sigaction(13, &v7, 0);
  return v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self)
  {
    int64_t tunnelKind = self->_tunnelKind;
    SEL v5 = &stru_1EF054CB8;
    if (tunnelKind == 2) {
      SEL v5 = @"Fallback Tunnel";
    }
    if (tunnelKind == 1) {
      id v6 = @"Primary Tunnel";
    }
    else {
      id v6 = v5;
    }
    sigaction v7 = v6;
    unint64_t ifIndex = self->_ifIndex;
  }
  else
  {
    sigaction v7 = 0;
    unint64_t ifIndex = 0;
  }
  id v9 = (void *)[v3 initWithFormat:@"<NEIKEv2Provider: %@ (ifIndex %lu)>: ", v7, ifIndex];

  return v9;
}

@end