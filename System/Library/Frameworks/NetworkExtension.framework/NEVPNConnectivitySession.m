@interface NEVPNConnectivitySession
- (id)initWithConfiguration:(void *)a3 delegate:(void *)a4 queue:;
@end

@implementation NEVPNConnectivitySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_pendingCancelCompletionHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __56__NEVPNConnectivitySession_cancelWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3) {
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 32);
  }

  return ne_session_cancel();
}

- (id)initWithConfiguration:(void *)a3 delegate:(void *)a4 queue:
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1
    && (v38.receiver = a1,
        v38.super_class = (Class)NEVPNConnectivitySession,
        v11 = (id *)objc_msgSendSuper2(&v38, sel_init),
        (v12 = v11) != 0))
  {
    objc_storeStrong(v11 + 1, a2);
    objc_storeWeak(v12 + 3, v9);
    objc_storeStrong(v12 + 5, a4);
    v44[0] = 0;
    v44[1] = 0;
    v13 = [v8 identifier];
    [v13 getUUIDBytes:v44];

    v14 = [v8 VPN];
    LODWORD(v13) = v14 == 0;

    if (v13)
    {
      v16 = [v8 appVPN];
      BOOL v17 = v16 == 0;

      if (v17)
      {
        v18 = [v8 alwaysOnVPN];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          v20 = [v8 pathController];
          BOOL v21 = v20 == 0;

          if (v21)
          {
            v22 = [v8 contentFilter];
            BOOL v23 = v22 == 0;

            if (v23)
            {
              v24 = [v8 dnsProxy];
              BOOL v25 = v24 == 0;

              if (v25)
              {
                v26 = [v8 dnsSettings];
                BOOL v27 = v26 == 0;

                if (v27)
                {
                  v28 = [v8 appPush];
                  BOOL v29 = v28 == 0;

                  if (v29)
                  {
                    [v8 relay];
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v30 = ne_session_create();
    if (v30)
    {
      objc_initWeak((id *)location, v12);
      objc_copyWeak(&v37, (id *)location);
      v36 = v12;
      ne_session_set_event_handler();
      v36[2] = (id)v30;
      v15 = v36;

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v33 = [v8 name];
        v34 = [v8 identifier];
        uint64_t v35 = ne_session_type_to_string();
        *(_DWORD *)location = 138412802;
        *(void *)&location[4] = v33;
        __int16 v40 = 2112;
        v41 = v34;
        __int16 v42 = 2080;
        uint64_t v43 = v35;
        _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "Failed to create a ne_session for %@ (%@), session type %s", location, 0x20u);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __65__NEVPNConnectivitySession_initWithConfiguration_delegate_queue___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      if (!v7[2]
        || (ne_session_release(), (uint64_t v8 = *(void *)(a1 + 32)) != 0)
        && (*(void *)(v8 + 16) = 0, (v7 = *(void **)(a1 + 32)) != 0))
      {
        if (objc_getProperty(v7, a2, 32, 1))
        {
          id Property = *(id *)(a1 + 32);
          if (Property) {
            id Property = objc_getProperty(Property, v9, 32, 1);
          }
          v13 = (void (**)(void))Property;
          v12 = *(void **)(a1 + 32);
          if (v12) {
            objc_setProperty_atomic_copy(v12, v11, 0, 32);
          }
          v13[2]();
        }
      }
    }
  }
  else if (a2 == 1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained && (v5 = objc_loadWeakRetained(WeakRetained + 3)) != 0)
    {
      v6 = v5;
      [v5 sessionStatusDidChange:v4];
    }
    else
    {
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v15 = v4;
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to notify of a session status change because self (%p) or the delegate (%p) is nil", buf, 0x16u);
      }
    }
  }
}

@end