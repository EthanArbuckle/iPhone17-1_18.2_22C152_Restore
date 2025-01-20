@interface NEIKEv2MOBIKE
- (id)initWithQueue:(void *)a3 tunnelProvider:;
- (void)dealloc;
- (void)initiateMOBIKE:(uint64_t)a3 pathStatus:(void *)a4 serverAddress:(char)a5 earlyDisconnect:;
- (void)mobikeDisconnect;
- (void)mobikeStartWaitTimer;
- (void)mobikeStopWaitTimer;
- (void)startMOBIKE:(uint64_t)a1;
@end

@implementation NEIKEv2MOBIKE

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobikeServer, 0);
  objc_storeStrong((id *)&self->_mobikeTransportInterface, 0);
  objc_storeStrong((id *)&self->_mobikeInterface, 0);
  objc_storeStrong((id *)&self->_mobikeQueue, 0);
  objc_storeStrong((id *)&self->_mobikeWaitTimer, 0);
  objc_destroyWeak((id *)&self->_tunnelProvider);

  objc_storeStrong((id *)&self->_overrideServerPortString, 0);
}

- (void)dealloc
{
  if (self && objc_getProperty(self, a2, 32, 1)) {
    [(NEIKEv2MOBIKE *)self mobikeStopWaitTimer];
  }
  v4.receiver = self;
  v4.super_class = (Class)NEIKEv2MOBIKE;
  [(NEIKEv2MOBIKE *)&v4 dealloc];
}

- (void)mobikeStopWaitTimer
{
  if (a1 && objc_getProperty(a1, a2, 32, 1))
  {
    Property = objc_getProperty(a1, v3, 32, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(a1, v5, 0, 32);
  }
}

- (id)initWithQueue:(void *)a3 tunnelProvider:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      a1 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "-[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]";
    v12 = "%s called with null queue";
LABEL_12:
    _os_log_fault_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v7)
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "-[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]";
    v12 = "%s called with null tunnelProvider";
    goto LABEL_12;
  }
  v13.receiver = a1;
  v13.super_class = (Class)NEIKEv2MOBIKE;
  v9 = (id *)objc_msgSendSuper2(&v13, sel_init);
  a1 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a2);
    objc_storeWeak(a1 + 3, v8);
  }
LABEL_6:

  return a1;
}

- (void)mobikeStartWaitTimer
{
  if (a1 && !objc_getProperty(a1, a2, 32, 1))
  {
    char v4 = a1[10];
    Property = objc_getProperty(a1, v3, 40, 1);
    if (v4)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke_2;
      v10[3] = &unk_1E59932C0;
      v10[4] = a1;
      id v6 = v10;
      uint64_t v7 = 10;
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke;
      v11[3] = &unk_1E59932C0;
      v11[4] = a1;
      id v6 = v11;
      uint64_t v7 = 2;
    }
    v8 = NECreateTimerSource(Property, v7, v6);
    objc_setProperty_atomic(a1, v9, v8, 32);
  }
}

uint64_t __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && (*(unsigned char *)(v3 + 10) & 1) == 0)
  {
    *(unsigned char *)(v3 + 10) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      WeakRetained[21] &= ~1u;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __31__NEIKEv2MOBIKE_mobikeReassert__block_invoke;
      v8[3] = &unk_1E5993618;
      v8[4] = v3;
      [WeakRetained setTunnelNetworkSettings:0 completionHandler:v8];
    }

    uint64_t v3 = *(void *)(a1 + 32);
  }
  [(NEIKEv2MOBIKE *)(void *)v3 mobikeStopWaitTimer];
  uint64_t v6 = *(void *)(a1 + 32);

  return -[NEIKEv2MOBIKE mobikeStartWaitTimer](v6);
}

void __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke_2(uint64_t a1, const char *a2)
{
  [(NEIKEv2MOBIKE *)*(void **)(a1 + 32) mobikeStopWaitTimer];
  uint64_t v3 = *(void *)(a1 + 32);

  -[NEIKEv2MOBIKE mobikeDisconnect](v3);
}

- (void)mobikeDisconnect
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      id v2 = WeakRetained;
      -[NEIKEv2PacketTunnelProvider handleInterfaceDown](WeakRetained);
      id WeakRetained = v2;
    }
  }
}

void __31__NEIKEv2MOBIKE_mobikeReassert__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    if (WeakRetained)
    {
      v5 = WeakRetained;
      [WeakRetained setReasserting:1];
    }
  }
}

- (void)startMOBIKE:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (v3)
    {
      *(unsigned char *)(a1 + 8) = 1;
      *(unsigned char *)(a1 + 9) = 0;
      if (*(void *)(a1 + 72)
        || (uint64_t v6 = objc_msgSend(objc_getProperty((id)a1, v4, 48, 1), "interfaceIndex"),
            v6 != objc_msgSend(objc_getProperty((id)a1, v7, 56, 1), "interfaceIndex"))
        || objc_getProperty((id)a1, v4, 16, 1))
      {
        uint64_t v8 = 1;
        Property = (__CFString *)objc_getProperty((id)a1, v4, 16, 1);
        v10 = @"0";
        if (Property) {
          v10 = Property;
        }
        v11 = v10;
        v12 = [MEMORY[0x1E4F38BF0] endpointWithHostname:v5 port:v11];
      }
      else
      {
        uint64_t v8 = 0;
        v12 = 0;
      }
      ++*(void *)(a1 + 72);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      if (WeakRetained)
      {
        id v15 = objc_getProperty((id)a1, v13, 48, 1);
        objc_setProperty_atomic((id)a1, v16, v15, 56);
        v18 = objc_getProperty(WeakRetained, v17, 240, 1);
        v20 = objc_msgSend(objc_getProperty((id)a1, v19, 48, 1), "interfaceName");
        id v22 = objc_getProperty((id)a1, v21, 40, 1);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __29__NEIKEv2MOBIKE_startMOBIKE___block_invoke;
        v23[3] = &unk_1E5990D28;
        v23[4] = a1;
        [v18 sendMOBIKEWithRetries:1 retryInterval:0 interfaceName:v20 invalidateTransport:v8 resetEndpoint:v12 callbackQueue:v22 callback:v23];
      }
    }
    else
    {
      v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[NEIKEv2MOBIKE startMOBIKE:]";
        _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null serverAddress", buf, 0xCu);
      }
    }
  }
}

void __29__NEIKEv2MOBIKE_startMOBIKE___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  if (!v10) {
    goto LABEL_18;
  }
  char v11 = *(unsigned char *)(v10 + 11);
  *(unsigned char *)(v10 + 8) = 0;
  uint64_t v12 = *(void *)(a1 + 32);
  if (!v12) {
    goto LABEL_18;
  }
  *(unsigned char *)(v12 + 11) = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13) {
    goto LABEL_18;
  }
  if (*(unsigned char *)(v13 + 9))
  {
    *(void *)(v13 + 72) = 0;
  }
  else
  {
    if (*(void *)(v13 + 64) != 1)
    {
      *(void *)(v13 + 72) = 0;
      goto LABEL_18;
    }
    if (a3)
    {
      *(void *)(v13 + 72) = 0;
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14) {
        *(unsigned char *)(v14 + 10) = 0;
      }
      goto LABEL_18;
    }
    if ((v11 & 1) != 0 || *(void *)(v13 + 72) >= 4uLL)
    {
      SEL v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "mobike failed after max retries", (uint8_t *)&v19, 2u);
      }

      -[NEIKEv2MOBIKE mobikeDisconnect](*(void *)(a1 + 32));
      goto LABEL_18;
    }
    v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_INFO, "mobike failed with error %@", (uint8_t *)&v19, 0xCu);
    }
  }
  id v15 = *(void **)(a1 + 32);
  if (v15)
  {
    id Property = objc_getProperty(v15, v8, 80, 1);
    -[NEIKEv2MOBIKE startMOBIKE:](v15, Property);
  }
LABEL_18:
}

- (void)initiateMOBIKE:(uint64_t)a3 pathStatus:(void *)a4 serverAddress:(char)a5 earlyDisconnect:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218498;
      uint64_t v20 = a3;
      __int16 v21 = 2048;
      id v22 = a2;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEFAULT, "initiate mobike - path status %ld ifIndex %lu server address %@", (uint8_t *)&v19, 0x20u);
    }

    id v12 = v9;
    if (a2
      && (uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F38BF8]) initWithInterfaceIndex:a2], a2 = v13, v12)
      && a3 == 1
      && v13)
    {
      objc_setProperty_atomic((id)a1, v11, v13, 48);
      objc_setProperty_atomic((id)a1, v14, v12, 80);
      *(unsigned char *)(a1 + 9) = 1;
      *(void *)(a1 + 64) = 1;
      [(NEIKEv2MOBIKE *)(void *)a1 mobikeStopWaitTimer];

      if ((*(unsigned char *)(a1 + 11) & 1) == 0) {
        *(unsigned char *)(a1 + 11) = a5;
      }
      if (*(unsigned char *)(a1 + 8))
      {
        v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_INFO, "mobike in progress", (uint8_t *)&v19, 2u);
        }
      }
      else
      {
        -[NEIKEv2MOBIKE startMOBIKE:](a1, v12);
      }
    }
    else
    {
      objc_setProperty_atomic((id)a1, v11, 0, 48);
      objc_setProperty_atomic((id)a1, v16, 0, 80);
      *(unsigned char *)(a1 + 9) = 0;
      *(void *)(a1 + 64) = 2;
      [(NEIKEv2MOBIKE *)(unsigned char *)a1 mobikeStartWaitTimer];
    }
  }
}

@end