@interface HAPNameResolver
+ (id)sharedWorkQueue;
- (HAPNameResolver)initWithDeviceName:(id)a3 serviceType:(id)a4 domain:(id)a5;
- (HMFTimer)timer;
- (NSString)domain;
- (NSString)name;
- (NSString)serviceType;
- (OS_dispatch_queue)workQueue;
- (OS_nw_connection)connection;
- (id)_nwCreateConnection;
- (id)completion;
- (id)shortDescription;
- (int64_t)resolutionState;
- (void)_cancelTimer;
- (void)_doCompletionWithErrorCode:(int64_t)a3 socketInfo:(id)a4 state:(int64_t)a5;
- (void)_doCompletionWithErrorCode:(int64_t)a3 state:(int64_t)a4;
- (void)_nwConnectionStart;
- (void)_setStateChangedHandler;
- (void)_startTimerWithTimeout:(double)a3;
- (void)_updateSocketInfo:(id)a3;
- (void)invalidate;
- (void)resolveWithTimeout:(double)a3 completion:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDomain:(id)a3;
- (void)setName:(id)a3;
- (void)setResolutionState:(int64_t)a3;
- (void)setServiceType:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HAPNameResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setTimer:(id)a3
{
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setConnection:(id)a3
{
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)shortDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(HAPNameResolver *)self name];
  v6 = [(HAPNameResolver *)self serviceType];
  v7 = [(HAPNameResolver *)self domain];
  v8 = [v3 stringWithFormat:@"%@ %@/%@/%@", v4, v5, v6, v7];

  return v8;
}

- (void)invalidate
{
  v3 = [(HAPNameResolver *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__HAPNameResolver_invalidate__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __29__HAPNameResolver_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    v6 = [*(id *)(a1 + 32) name];
    int v10 = 138543618;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Name resolution time out for %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) connection];
  if (v7)
  {
    v8 = (void *)v7;
    if ([*(id *)(a1 + 32) resolutionState] == 1)
    {
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 32) resolutionState];

      if (v9) {
        return;
      }
    }
    [*(id *)(a1 + 32) _cancelTimer];
    [*(id *)(a1 + 32) _doCompletionWithErrorCode:2 state:4];
  }
}

- (void)resolveWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HAPNameResolver *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HAPNameResolver_resolveWithTimeout_completion___block_invoke;
  block[3] = &unk_1E69F1AF8;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __49__HAPNameResolver_resolveWithTimeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) name];
    uint64_t v7 = *(void *)(a1 + 48);
    int v20 = 138543874;
    v21 = v5;
    __int16 v22 = 2112;
    v23 = v6;
    __int16 v24 = 2048;
    uint64_t v25 = v7;
    _os_log_impl(&dword_1D4758000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting name resolution for %@ with timeout of %f", (uint8_t *)&v20, 0x20u);
  }
  if ([*(id *)(a1 + 32) resolutionState])
  {
    id v8 = (void *)MEMORY[0x1D944E080]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      double v11 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v11;
      _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@Attempt to initiate name resolution on stale object", (uint8_t *)&v20, 0xCu);
    }
    __int16 v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:4 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [*(id *)(a1 + 32) setCompletion:*(void *)(a1 + 40)];
    v13 = [*(id *)(a1 + 32) _nwCreateConnection];
    [*(id *)(a1 + 32) setConnection:v13];

    uint64_t v14 = [*(id *)(a1 + 32) connection];

    if (v14)
    {
      [*(id *)(a1 + 32) setResolutionState:1];
      [*(id *)(a1 + 32) _setStateChangedHandler];
      [*(id *)(a1 + 32) _startTimerWithTimeout:*(double *)(a1 + 48)];
      [*(id *)(a1 + 32) _nwConnectionStart];
    }
    else
    {
      v15 = (void *)MEMORY[0x1D944E080]();
      id v16 = *(id *)(a1 + 32);
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        v19 = [*(id *)(a1 + 32) shortDescription];
        int v20 = 138543618;
        v21 = v18;
        __int16 v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@nw_connection_create failed for %@", (uint8_t *)&v20, 0x16u);
      }
      [*(id *)(a1 + 32) _doCompletionWithErrorCode:9 state:3];
    }
  }
}

- (void)_nwConnectionStart
{
  id v3 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(HAPNameResolver *)self connection];
  nw_connection_start(v4);
}

- (id)_nwCreateConnection
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], &__block_literal_global_10);
  v5 = nw_interface_create_with_name();
  nw_parameters_prohibit_interface(secure_tcp, v5);

  id v6 = (void *)MEMORY[0x1D944E080]();
  uint64_t v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = HMFGetLogIdentifier();
    id v10 = [(HAPNameResolver *)v7 shortDescription];
    int v20 = 138543618;
    v21 = v9;
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@nw_connection_create with %@", (uint8_t *)&v20, 0x16u);
  }
  id v11 = [(HAPNameResolver *)v7 name];
  __int16 v12 = (const char *)[v11 UTF8String];
  id v13 = [(HAPNameResolver *)v7 serviceType];
  uint64_t v14 = (const char *)[v13 UTF8String];
  id v15 = [(HAPNameResolver *)v7 domain];
  bonjour_service = nw_endpoint_create_bonjour_service(v12, v14, (const char *)[v15 UTF8String]);
  v17 = nw_connection_create(bonjour_service, secure_tcp);

  if (v17)
  {
    v18 = [(HAPNameResolver *)v7 workQueue];
    nw_connection_set_queue(v17, v18);
  }

  return v17;
}

- (void)_setStateChangedHandler
{
  id v3 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  uint64_t v4 = [(HAPNameResolver *)self connection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__HAPNameResolver__setStateChangedHandler__block_invoke;
  v5[3] = &unk_1E69F0BE8;
  objc_copyWeak(&v6, &location);
  nw_connection_set_state_changed_handler(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__HAPNameResolver__setStateChangedHandler__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_8;
  }
  uint64_t v7 = (void *)MEMORY[0x1D944E080]();
  id v8 = WeakRetained;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = [v8 name];
    *(_DWORD *)buf = 138544130;
    v81 = v10;
    __int16 v82 = 2112;
    v83 = v11;
    __int16 v84 = 1024;
    int v85 = a2;
    __int16 v86 = 2112;
    id v87 = v5;
    _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@nw_connection state changed %@ %d error %@", buf, 0x26u);
  }
  if (v5)
  {
    __int16 v12 = [v8 connection];
    nw_connection_cancel_current_endpoint(v12);

    id v13 = v8;
    uint64_t v14 = 1;
LABEL_6:
    uint64_t v15 = 3;
LABEL_7:
    [v13 _doCompletionWithErrorCode:v14 state:v15];
    goto LABEL_8;
  }
  switch(a2)
  {
    case 0:
      id v16 = (void *)MEMORY[0x1D944E080]();
      id v17 = v8;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = HMFGetLogIdentifier();
        int v20 = [v17 name];
        *(_DWORD *)buf = 138543618;
        v81 = v19;
        __int16 v82 = 2112;
        v83 = v20;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEBUG, "%{public}@nw_connection_state invalid %@", buf, 0x16u);
      }
      goto LABEL_8;
    case 1:
      v21 = (void *)MEMORY[0x1D944E080]();
      id v22 = v8;
      v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
      uint64_t v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v22 name];
      *(_DWORD *)buf = 138543618;
      v81 = v24;
      __int16 v82 = 2112;
      v83 = v25;
      uint64_t v26 = "%{public}@nw_connection_state waiting %@";
      v27 = v23;
      os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
      goto LABEL_17;
    case 2:
      v21 = (void *)MEMORY[0x1D944E080]();
      id v22 = v8;
      v23 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      uint64_t v24 = HMFGetLogIdentifier();
      uint64_t v25 = [v22 name];
      *(_DWORD *)buf = 138543618;
      v81 = v24;
      __int16 v82 = 2112;
      v83 = v25;
      uint64_t v26 = "%{public}@nw_connection_state preparing %@";
      v27 = v23;
      os_log_type_t v28 = OS_LOG_TYPE_INFO;
LABEL_17:
      _os_log_impl(&dword_1D4758000, v27, v28, v26, buf, 0x16u);

LABEL_18:
      [v22 setResolutionState:1];
      goto LABEL_8;
    case 3:
      v29 = (void *)MEMORY[0x1D944E080]();
      id v30 = v8;
      v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier();
        v33 = [v30 name];
        *(_DWORD *)buf = 138543618;
        v81 = v32;
        __int16 v82 = 2112;
        v83 = v33;
        _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_INFO, "%{public}@nw_connection_state ready %@", buf, 0x16u);
      }
      v34 = [v30 connection];
      nw_path_t v35 = nw_connection_copy_current_path(v34);

      if (!v35)
      {
        v37 = 0;
LABEL_35:
        v58 = [v30 connection];
        nw_connection_cancel_current_endpoint(v58);

        v45 = v30;
        uint64_t v46 = 15;
LABEL_36:
        [v45 _doCompletionWithErrorCode:v46 state:3];
        goto LABEL_37;
      }
      v36 = nw_path_copy_endpoint();
      v37 = v36;
      if (!v36 || !nw_endpoint_get_address(v36)) {
        goto LABEL_35;
      }
      int v38 = SockAddrToString();
      if (v38)
      {
        int v39 = v38;
        v40 = (void *)MEMORY[0x1D944E080]();
        id v41 = v30;
        v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = HMFGetLogIdentifier();
          v44 = [v41 name];
          *(_DWORD *)v74 = 138543874;
          v75 = v43;
          __int16 v76 = 1024;
          *(_DWORD *)v77 = v39;
          *(_WORD *)&v77[4] = 2112;
          *(void *)&v77[6] = v44;
          _os_log_impl(&dword_1D4758000, v42, OS_LOG_TYPE_ERROR, "%{public}@nw_connection sock addr to string failed: %d %@", v74, 0x1Cu);
        }
        v45 = v41;
        uint64_t v46 = 8;
        goto LABEL_36;
      }
      uint64_t Port = SockAddrGetPort();
      v60 = [HAPSocketInfo alloc];
      v61 = [NSString stringWithUTF8String:buf];
      v62 = [NSNumber numberWithUnsignedInt:Port];
      v63 = [(HAPSocketInfo *)v60 initWithIPAddressString:v61 port:v62];

      v64 = (void *)MEMORY[0x1D944E080]();
      id v65 = v30;
      v66 = HMFGetOSLogHandle();
      v67 = v66;
      if (v63)
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          v68 = HMFGetLogIdentifier();
          [v65 name];
          v69 = v72 = v64;
          *(_DWORD *)v74 = 138544130;
          v75 = v68;
          __int16 v76 = 2080;
          *(void *)v77 = buf;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = Port;
          __int16 v78 = 2112;
          v79 = v69;
          _os_log_impl(&dword_1D4758000, v67, OS_LOG_TYPE_INFO, "%{public}@nw_connection Address resolved:  %s   port: %d for %@", v74, 0x26u);

          v64 = v72;
        }

        [v65 _updateSocketInfo:v63];
      }
      else
      {
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v70 = v73 = v64;
          v71 = [v65 name];
          *(_DWORD *)v74 = 138544130;
          v75 = v70;
          __int16 v76 = 2080;
          *(void *)v77 = buf;
          *(_WORD *)&v77[8] = 1024;
          *(_DWORD *)&v77[10] = Port;
          __int16 v78 = 2112;
          v79 = v71;
          _os_log_impl(&dword_1D4758000, v67, OS_LOG_TYPE_ERROR, "%{public}@nw_connection Address resolved:  %s   port: %d for %@, but address type could not be determined", v74, 0x26u);

          v64 = v73;
        }
      }

LABEL_37:
LABEL_8:

      return;
    case 4:
      v47 = (void *)MEMORY[0x1D944E080]();
      id v48 = v8;
      v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = HMFGetLogIdentifier();
        v51 = [v48 name];
        *(_DWORD *)buf = 138543618;
        v81 = v50;
        __int16 v82 = 2112;
        v83 = v51;
        _os_log_impl(&dword_1D4758000, v49, OS_LOG_TYPE_INFO, "%{public}@nw_connection_state failed %@", buf, 0x16u);
      }
      v52 = [v48 connection];
      nw_connection_cancel(v52);

      id v13 = v48;
      uint64_t v14 = 8;
      goto LABEL_6;
    case 5:
      v53 = (void *)MEMORY[0x1D944E080]();
      id v54 = v8;
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        v56 = HMFGetLogIdentifier();
        v57 = [v54 name];
        *(_DWORD *)buf = 138543618;
        v81 = v56;
        __int16 v82 = 2112;
        v83 = v57;
        _os_log_impl(&dword_1D4758000, v55, OS_LOG_TYPE_INFO, "%{public}@nw_connection_state cancelled %@", buf, 0x16u);
      }
      id v13 = v54;
      uint64_t v14 = 2;
      uint64_t v15 = 4;
      goto LABEL_7;
    default:
      goto LABEL_8;
  }
}

- (void)_updateSocketInfo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ((unint64_t)([v4 ipAddressType] - 1) <= 2)
  {
    id v6 = (void *)MEMORY[0x1D944E080]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [(HAPNameResolver *)v7 name];
      int v11 = 138543874;
      __int16 v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_INFO, "%{public}@IP received address %@ %@", (uint8_t *)&v11, 0x20u);
    }
    [(HAPNameResolver *)v7 _cancelTimer];
    [(HAPNameResolver *)v7 _doCompletionWithErrorCode:0 socketInfo:v4 state:2];
  }
}

- (void)_doCompletionWithErrorCode:(int64_t)a3 state:(int64_t)a4
{
  uint64_t v7 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v7);

  [(HAPNameResolver *)self _doCompletionWithErrorCode:a3 socketInfo:0 state:a4];
}

- (void)_doCompletionWithErrorCode:(int64_t)a3 socketInfo:(id)a4 state:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v9);

  int64_t v10 = [(HAPNameResolver *)self _cancelTimer];
  if (a3)
  {
    int64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:a3 userInfo:0];
    a3 = v10;
  }
  int v11 = (void *)MEMORY[0x1D944E080](v10);
  __int16 v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    __int16 v15 = [(HAPNameResolver *)v12 name];
    int v24 = 138543874;
    uint64_t v25 = v14;
    __int16 v26 = 2112;
    v27 = v15;
    __int16 v28 = 2112;
    int64_t v29 = a3;
    _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_INFO, "%{public}@Name resolution completed for %@ error %@", (uint8_t *)&v24, 0x20u);
  }
  [(HAPNameResolver *)v12 setResolutionState:a5];
  id v16 = [(HAPNameResolver *)v12 connection];

  if (v16)
  {
    uint64_t v17 = [(HAPNameResolver *)v12 connection];
    nw_connection_cancel(v17);

    [(HAPNameResolver *)v12 setConnection:0];
  }
  v18 = [(HAPNameResolver *)v12 completion];

  if (v18)
  {
    v19 = [(HAPNameResolver *)v12 completion];
    ((void (**)(void, int64_t, id))v19)[2](v19, a3, v8);
  }
  else
  {
    int v20 = (void *)MEMORY[0x1D944E080]();
    v21 = v12;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      int v24 = 138543362;
      uint64_t v25 = v23;
      _os_log_impl(&dword_1D4758000, v22, OS_LOG_TYPE_INFO, "%{public}@No completion routine for name resolution", (uint8_t *)&v24, 0xCu);
    }
  }
  [(HAPNameResolver *)v12 setCompletion:0];
}

- (int64_t)resolutionState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  int64_t resolutionState = self->_resolutionState;
  os_unfair_lock_unlock(p_lock);
  return resolutionState;
}

- (void)setResolutionState:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_int64_t resolutionState = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)_startTimerWithTimeout:(double)a3
{
  id v5 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:1 options:a3];
  [(HAPNameResolver *)self setTimer:v6];

  uint64_t v7 = [(HAPNameResolver *)self timer];
  [v7 setDelegate:self];

  id v8 = [(HAPNameResolver *)self workQueue];
  id v9 = [(HAPNameResolver *)self timer];
  [v9 setDelegateQueue:v8];

  id v10 = [(HAPNameResolver *)self timer];
  [v10 resume];
}

- (void)_cancelTimer
{
  id v3 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HAPNameResolver *)self timer];
  [v4 suspend];

  [(HAPNameResolver *)self setTimer:0];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPNameResolver *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HAPNameResolver *)self timer];

  if (v6 == v4)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944E080]();
    id v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = [(HAPNameResolver *)v8 name];
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, "%{public}@Name resolution timed out for %@", (uint8_t *)&v12, 0x16u);
    }
    [(HAPNameResolver *)v8 _doCompletionWithErrorCode:24 state:3];
  }
}

- (HAPNameResolver)initWithDeviceName:(id)a3 serviceType:(id)a4 domain:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HAPNameResolver;
  int v12 = [(HAPNameResolver *)&v17 init];
  __int16 v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_serviceType, a4);
    objc_storeStrong((id *)&v13->_domain, a5);
    uint64_t v14 = +[HAPNameResolver sharedWorkQueue];
    workQueue = v13->_workQueue;
    v13->_workQueue = (OS_dispatch_queue *)v14;

    v13->_int64_t resolutionState = 0;
  }

  return v13;
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken != -1) {
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_3690);
  }
  v2 = (void *)sharedWorkQueue_workQueue;

  return v2;
}

uint64_t __34__HAPNameResolver_sharedWorkQueue__block_invoke()
{
  sharedWorkQueue_workQueue = (uint64_t)dispatch_queue_create("com.apple.HAPNameResolution", 0);

  return MEMORY[0x1F41817F8]();
}

@end