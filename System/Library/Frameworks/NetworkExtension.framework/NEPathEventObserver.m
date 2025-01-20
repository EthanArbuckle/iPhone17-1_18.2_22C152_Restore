@interface NEPathEventObserver
- (NEPathEventObserver)init;
- (NEPathEventObserver)initWithQueue:(id)a3 eventHandler:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)handleEvent:(void *)a3 forPID:(void *)a4 UUID:;
@end

@implementation NEPathEventObserver

- (void).cxx_destruct
{
}

- (void)dealloc
{
  [(NEPathEventObserver *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)NEPathEventObserver;
  [(NEPathEventObserver *)&v3 dealloc];
}

- (void)cancel
{
  if (self)
  {
    cellBlockedObserver = self->_cellBlockedObserver;
    if (cellBlockedObserver)
    {
      MEMORY[0x19F3B7B30](cellBlockedObserver, a2);
      self->_cellBlockedObserver = 0;
    }
    cellFailedObserver = self->_cellFailedObserver;
    if (cellFailedObserver)
    {
      MEMORY[0x19F3B7B30](cellFailedObserver, a2);
      self->_cellFailedObserver = 0;
    }
    wifiBlockedObserver = self->_wifiBlockedObserver;
    if (wifiBlockedObserver)
    {
      MEMORY[0x19F3B7B30](wifiBlockedObserver, a2);
      self->_wifiBlockedObserver = 0;
    }
  }
}

- (NEPathEventObserver)initWithQueue:(id)a3 eventHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NEPathEventObserver;
  v8 = [(NEPathEventObserver *)&v16 init];
  v10 = v8;
  if (v8)
  {
    objc_setProperty_atomic_copy(v8, v9, v7, 32);
    objc_initWeak(&location, v10);
    v13[1] = (id)MEMORY[0x1E4F143A8];
    v13[2] = (id)3221225472;
    v13[3] = __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke;
    v13[4] = &unk_1E5991B38;
    objc_copyWeak(&v14, &location);
    v10->_cellBlockedObserver = (network_config_cellular_blocked_observer_s *)network_config_cellular_blocked_observer_create();
    v12[1] = (id)MEMORY[0x1E4F143A8];
    v12[2] = (id)3221225472;
    v12[3] = __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_2;
    v12[4] = &unk_1E5991B38;
    objc_copyWeak(v13, &location);
    v10->_cellFailedObserver = (network_config_cellular_blocked_observer_s *)network_config_cellular_failed_observer_create();
    objc_copyWeak(v12, &location);
    v10->_wifiBlockedObserver = (network_config_cellular_blocked_observer_s *)network_config_wifi_blocked_observer_create();
    objc_destroyWeak(v12);
    objc_destroyWeak(v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)1, v6, v5);
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)2, v6, v5);
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)3, v6, v5);
}

- (void)handleEvent:(void *)a3 forPID:(void *)a4 UUID:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!a1) {
    goto LABEL_27;
  }
  if (v7 && MEMORY[0x19F3B92C0](v7) == MEMORY[0x1E4F145F8])
  {
    int value = xpc_uint64_get_value(v7);
    if (v8)
    {
      if (MEMORY[0x19F3B92C0](v8) == MEMORY[0x1E4F14600])
      {
        bytes = xpc_uuid_get_bytes(v8);
        uint64_t v36 = 0;
        memset(out, 0, sizeof(out));
        if (proc_pidinfo(value, 17, 1uLL, out, 56) == 56)
        {
          if (uuid_compare(bytes, (const unsigned __int8 *)out))
          {
            memset(buf, 0, sizeof(buf));
            uuid_unparse(bytes, (char *)buf);
            v15 = ne_log_obj();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              objc_super v16 = off_1E5991B58[(void)a2 - 1];
              int v28 = 138412802;
              v29 = v16;
              __int16 v30 = 1024;
              int v31 = value;
              __int16 v32 = 2080;
              v33 = buf;
              _os_log_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_INFO, "NEPathEvent %@ PID %u does not match UUID %s, is delegating traffic", (uint8_t *)&v28, 0x1Cu);
            }

            goto LABEL_5;
          }
        }
      }
    }
    uint64_t v17 = NECopySigningIdentifierForPIDwithAuditToken();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = ne_log_obj();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = off_1E5991B58[(void)a2 - 1];
        out[0] = 138412546;
        *(void *)&out[1] = v20;
        LOWORD(out[3]) = 2112;
        *(void *)((char *)&out[3] + 2) = v18;
        _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEFAULT, "NEPathEvent %@ for %@ by PID", (uint8_t *)out, 0x16u);
      }

      v21 = -[NEPathEvent initWithType:bundleID:]((id *)[NEPathEvent alloc], a2, v18);
      if (v21) {
        goto LABEL_26;
      }
    }
  }
  if (!v8) {
    goto LABEL_27;
  }
LABEL_5:
  if (MEMORY[0x19F3B92C0](v8) != MEMORY[0x1E4F14600]) {
    goto LABEL_27;
  }
  v9 = xpc_uuid_get_bytes(v8);
  memset(out, 0, 37);
  uuid_unparse(v9, (char *)out);
  uint64_t v10 = NEHelperCacheCopySigningIdentifierMapping();
  v11 = (void *)v10;
  if (!v10 || MEMORY[0x19F3B92C0](v10) != MEMORY[0x1E4F145F0])
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v27 = off_1E5991B58[(void)a2 - 1];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = out;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "NEPathEvent %@ failed to find bundle ID for UUID %s", buf, 0x16u);
    }

    goto LABEL_27;
  }
  v23 = [NSString stringWithUTF8String:xpc_string_get_string_ptr(v11)];
  v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = off_1E5991B58[(void)a2 - 1];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = out;
    _os_log_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_DEFAULT, "NEPathEvent %@ for %@ by UUID %s", buf, 0x20u);
  }

  v21 = -[NEPathEvent initWithType:bundleID:]((id *)[NEPathEvent alloc], a2, v23);
  if (v21)
  {
LABEL_26:
    Property = (void (**)(id, id *))objc_getProperty(a1, v22, 32, 1);
    Property[2](Property, v21);
  }
LABEL_27:
}

- (NEPathEventObserver)init
{
  return 0;
}

@end