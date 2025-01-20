@interface NEIKEv2Rekey
- (id)invokeChildRekeyHandler;
- (id)invokeIKERekeyHandler;
- (void)dealloc;
- (void)invalidateTimers;
- (void)startChildTimer:(void *)a3 timeoutHandler:;
- (void)startIKETimer:(void *)a3 timeoutHandler:;
@end

@implementation NEIKEv2Rekey

- (void).cxx_destruct
{
  objc_storeStrong(&self->_childRekeyHandler, 0);
  objc_storeStrong(&self->_ikeRekeyHandler, 0);
  objc_storeStrong((id *)&self->_childLifetimeDispatchTimer, 0);
  objc_storeStrong((id *)&self->_ikeLifetimeDispatchTimer, 0);
  objc_storeStrong((id *)&self->_sessionDescription, 0);
  objc_storeStrong((id *)&self->_childLifetime, 0);

  objc_storeStrong((id *)&self->_ikeLifetime, 0);
}

- (void)dealloc
{
  [(NEIKEv2Rekey *)self invalidateTimers];
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2Rekey;
  [(NEIKEv2Rekey *)&v3 dealloc];
}

- (void)invalidateTimers
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 16, 1))
    {
      objc_msgSend(objc_getProperty(a1, v3, 16, 1), "invalidate");
      objc_setProperty_atomic(a1, v4, 0, 16);
    }
    if (objc_getProperty(a1, v3, 24, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 24, 1), "invalidate");
      objc_setProperty_atomic(a1, v6, 0, 24);
    }
    if (objc_getProperty(a1, v5, 40, 1))
    {
      Property = objc_getProperty(a1, v7, 40, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v9, 0, 40);
    }
    if (objc_getProperty(a1, v7, 48, 1))
    {
      v11 = objc_getProperty(a1, v10, 48, 1);
      dispatch_source_cancel(v11);
      objc_setProperty_atomic(a1, v12, 0, 48);
    }
  }
}

- (void)startIKETimer:(void *)a3 timeoutHandler:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v7 = v5;
  if (a1)
  {
    if (a2) {
      a1[2] = a2;
    }
    if (v5) {
      objc_setProperty_atomic_copy(a1, v6, v5, 56);
    }
    int v8 = a1[2];
    uint64_t v9 = 45 * v8;
    if (v8 <= 2) {
      double v10 = (double)v8 * 5.0;
    }
    else {
      double v10 = 15.0;
    }
    if (objc_opt_class())
    {
      if (objc_getProperty(a1, v11, 16, 1))
      {
        objc_msgSend(objc_getProperty(a1, v12, 16, 1), "cancel");
      }
      else
      {
        if (objc_getProperty(a1, v12, 32, 1))
        {
          id v13 = [NSString alloc];
          v15 = (__CFString *)[v13 initWithFormat:@"com.apple.networkextension[%@ IKE Lifetime]", objc_getProperty(a1, v14, 32, 1)];
        }
        else
        {
          v15 = @"com.apple.networkextension[NEIKEv2PacketTunnelProvider IKE Lifetime]";
        }
        v16 = (void *)[objc_alloc(MEMORY[0x1E4FA99A8]) initWithIdentifier:v15];
        objc_setProperty_atomic(a1, v17, v16, 16);
      }
      v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)NEGetSystemWakeTime();
        *(_DWORD *)buf = 138413058;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        __int16 v49 = 2112;
        v50 = v19;
        _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_INFO, "%@: Setting Rekey IKE timer for %llu seconds, leeway %f seconds, last wake date %@", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, a1);
      id v21 = objc_getProperty(a1, v20, 16, 1);
      id v22 = MEMORY[0x1E4F14428];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke;
      v41[3] = &unk_1E5990DE8;
      objc_copyWeak(&v42, (id *)buf);
      [v21 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v41 queue:(double)(unint64_t)v9 handler:v10];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (objc_getProperty(a1, v11, 40, 1))
      {
        Property = objc_getProperty(a1, v23, 40, 1);
        dispatch_source_cancel(Property);
        objc_setProperty_atomic(a1, v25, 0, 40);
      }
      v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_INFO, "%@: Setting Rekey IKE timer for %llu seconds, leeway %f seconds", buf, 0x20u);
      }

      dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      objc_setProperty_atomic(a1, v28, v27, 40);

      if (objc_getProperty(a1, v29, 40, 1))
      {
        v31 = objc_getProperty(a1, v30, 40, 1);
        dispatch_time_t v32 = dispatch_time(0x8000000000000000, 1000000000 * v9);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));

        objc_initWeak((id *)buf, a1);
        id v34 = objc_getProperty(a1, v33, 40, 1);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke_6;
        handler[3] = &unk_1E5992C58;
        v35 = v34;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_source_set_event_handler(v35, handler);

        v37 = objc_getProperty(a1, v36, 40, 1);
        dispatch_activate(v37);
        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v38 = ne_log_obj();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
        }
      }
    }
  }
}

- (id)invokeIKERekeyHandler
{
  id result = objc_getProperty(a1, a2, 56, 1);
  if (result)
  {
    id v5 = (uint64_t (*)(void))*(objc_getProperty(a1, v4, 56, 1) + 2);
    return (id)v5();
  }
  return result;
}

void __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startIKETimer:timeoutHandler:](WeakRetained, 0, 0);
    [(NEIKEv2Rekey *)v3 invokeIKERekeyHandler];
    id WeakRetained = v3;
  }
}

void __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startIKETimer:timeoutHandler:](WeakRetained, 0, 0);
    [(NEIKEv2Rekey *)v3 invokeIKERekeyHandler];
    id WeakRetained = v3;
  }
}

- (void)startChildTimer:(void *)a3 timeoutHandler:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v7 = v5;
  if (a1)
  {
    if (a2) {
      a1[3] = a2;
    }
    if (v5) {
      objc_setProperty_atomic_copy(a1, v6, v5, 64);
    }
    int v8 = a1[3];
    uint64_t v9 = 45 * v8;
    if (v8 <= 2) {
      double v10 = (double)v8 * 5.0;
    }
    else {
      double v10 = 15.0;
    }
    if (objc_opt_class())
    {
      if (objc_getProperty(a1, v11, 24, 1))
      {
        objc_msgSend(objc_getProperty(a1, v12, 24, 1), "cancel");
      }
      else
      {
        if (objc_getProperty(a1, v12, 32, 1))
        {
          id v13 = [NSString alloc];
          v15 = (__CFString *)[v13 initWithFormat:@"com.apple.networkextension[%@ Child Lifetime]", objc_getProperty(a1, v14, 32, 1)];
        }
        else
        {
          v15 = @"com.apple.networkextension[NEIKEv2PacketTunnelProvider Child Lifetime]";
        }
        v16 = (void *)[objc_alloc(MEMORY[0x1E4FA99A8]) initWithIdentifier:v15];
        objc_setProperty_atomic(a1, v17, v16, 24);
      }
      v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)NEGetSystemWakeTime();
        *(_DWORD *)buf = 138413058;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        __int16 v49 = 2112;
        v50 = v19;
        _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_INFO, "%@: Setting Rekey Child timer for %llu seconds, leeway %f seconds, last wake date %@", buf, 0x2Au);
      }
      objc_initWeak((id *)buf, a1);
      id v21 = objc_getProperty(a1, v20, 24, 1);
      id v22 = MEMORY[0x1E4F14428];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke;
      v41[3] = &unk_1E5990DE8;
      objc_copyWeak(&v42, (id *)buf);
      [v21 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v41 queue:(double)(unint64_t)v9 handler:v10];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (objc_getProperty(a1, v11, 48, 1))
      {
        Property = objc_getProperty(a1, v23, 48, 1);
        dispatch_source_cancel(Property);
        objc_setProperty_atomic(a1, v25, 0, 48);
      }
      v26 = ne_log_obj();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        _os_log_impl(&dword_19DDAF000, v26, OS_LOG_TYPE_INFO, "%@: Setting Rekey Child timer for %llu seconds, leeway %f seconds", buf, 0x20u);
      }

      dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      objc_setProperty_atomic(a1, v28, v27, 48);

      if (objc_getProperty(a1, v29, 48, 1))
      {
        v31 = objc_getProperty(a1, v30, 48, 1);
        dispatch_time_t v32 = dispatch_time(0x8000000000000000, 1000000000 * v9);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));

        objc_initWeak((id *)buf, a1);
        id v34 = objc_getProperty(a1, v33, 48, 1);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke_14;
        handler[3] = &unk_1E5992C58;
        v35 = v34;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_source_set_event_handler(v35, handler);

        v37 = objc_getProperty(a1, v36, 48, 1);
        dispatch_activate(v37);
        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v38 = ne_log_obj();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19DDAF000, v38, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
        }
      }
    }
  }
}

- (id)invokeChildRekeyHandler
{
  id result = objc_getProperty(a1, a2, 64, 1);
  if (result)
  {
    id v5 = (uint64_t (*)(void))*(objc_getProperty(a1, v4, 64, 1) + 2);
    return (id)v5();
  }
  return result;
}

void __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startChildTimer:timeoutHandler:](WeakRetained, 0, 0);
    [(NEIKEv2Rekey *)v3 invokeChildRekeyHandler];
    id WeakRetained = v3;
  }
}

void __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke_14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startChildTimer:timeoutHandler:](WeakRetained, 0, 0);
    [(NEIKEv2Rekey *)v3 invokeChildRekeyHandler];
    id WeakRetained = v3;
  }
}

@end