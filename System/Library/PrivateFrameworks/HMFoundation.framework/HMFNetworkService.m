@interface HMFNetworkService
+ (id)logCategory;
- (BOOL)_updateDeviceWithPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowPowerMode;
- (HMFNetworkService)initWithServiceInfo:(id)a3 port:(unsigned __int16)a4 queue:(id)a5;
- (HMFNetworkService)initWithTXTRecords:(id)a3 browseResult:(id)a4 queue:(id)a5;
- (HMFNetworkServiceInfo)serviceInfo;
- (NSArray)addresses;
- (NSMutableArray)ipAddresses;
- (NSString)host;
- (NSString)hostName;
- (OS_dispatch_queue)workQueue;
- (OS_nw_connection)nwConnection;
- (id)_connectionWithPromise:(id)a3 parameters:(id)a4 receivedDataHandler:(id)a5;
- (id)description;
- (id)resolveAddressWithAddressType:(unint64_t)a3 timeout:(double)a4 receivedDataHandler:(id)a5;
- (id)shortDescription;
- (unsigned)port;
- (void)dealloc;
- (void)invalidate;
- (void)setIpAddresses:(id)a3;
- (void)setNwConnection:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)updateWithService:(id)a3;
@end

@implementation HMFNetworkService

- (HMFNetworkService)initWithTXTRecords:(id)a3 browseResult:(id)a4 queue:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = nw_browse_result_copy_endpoint((nw_browse_result_t)a4);
  v11 = [[HMFNetworkServiceInfo alloc] initWithEndpoint:v10 txtRecord:v9];

  v12 = [(HMFNetworkService *)self initWithServiceInfo:v11 port:nw_endpoint_get_port(v10) queue:v8];
  return v12;
}

- (HMFNetworkService)initWithServiceInfo:(id)a3 port:(unsigned __int16)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    v17.receiver = self;
    v17.super_class = (Class)HMFNetworkService;
    v11 = [(HMFNetworkService *)&v17 init];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_workQueue, a5);
      objc_storeStrong((id *)&v12->_serviceInfo, a3);
      v12->_port = a4;
      uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
      ipAddresses = v12->_ipAddresses;
      v12->_ipAddresses = (NSMutableArray *)v13;
    }
    self = v12;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6
    && ([v6 host],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(HMFNetworkService *)self host],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = HMFEqualObjects(v8, v9),
        v9,
        v8,
        v10))
  {
    v11 = [v7 serviceInfo];
    v12 = [(HMFNetworkService *)self serviceInfo];
    char v13 = HMFEqualObjects(v11, v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)invalidate
{
  v3 = [(HMFNetworkService *)self nwConnection];

  if (v3)
  {
    id v4 = [(HMFNetworkService *)self nwConnection];
    nw_connection_cancel(v4);

    [(HMFNetworkService *)self setNwConnection:0];
  }
}

- (void)dealloc
{
  [(HMFNetworkService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HMFNetworkService;
  [(HMFNetworkService *)&v3 dealloc];
}

- (id)resolveAddressWithAddressType:(unint64_t)a3 timeout:(double)a4 receivedDataHandler:(id)a5
{
  id v8 = a5;
  if ([(HMFNetworkService *)self lowPowerMode])
  {
    id v9 = (void (**)(void, void, void, void))MEMORY[0x19F3A8A20](v8);
    if (v9)
    {
      int v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
      ((void (**)(void, uint64_t, void, void *))v9)[2](v9, 1, 0, v10);
    }
    v11 = +[HMFFuture futureWithNoValue];
  }
  else
  {
    id v27 = 0;
    v12 = +[HMFFuture futureWithPromise:&v27];
    char v13 = [(HMFNetworkService *)self serviceInfo];
    int v14 = [v13 isUDP];
    v15 = (void *)*MEMORY[0x1E4F38C90];
    if (v14) {
      secure_udp = nw_parameters_create_secure_udp(v15, &__block_literal_global_88);
    }
    else {
      secure_udp = nw_parameters_create_secure_tcp(v15, (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
    }
    objc_super v17 = secure_udp;
    v18 = nw_parameters_copy_default_protocol_stack(secure_udp);
    v19 = nw_protocol_stack_copy_internet_protocol(v18);
    v20 = v19;
    if (a3 == 2) {
      int v21 = 6;
    }
    else {
      int v21 = 0;
    }
    if (a3 == 1) {
      nw_ip_version_t v22 = nw_ip_version_4;
    }
    else {
      nw_ip_version_t v22 = v21;
    }
    nw_ip_options_set_version(v19, v22);
    v23 = nw_interface_create_with_name();
    nw_parameters_prohibit_interface(v17, v23);

    v24 = [(HMFNetworkService *)self _connectionWithPromise:v27 parameters:v17 receivedDataHandler:v8];
    v25 = v24;
    if (v24)
    {
      nw_connection_start(v24);
      [(HMFNetworkService *)self setNwConnection:v25];
      [v12 timeout:a4];
    }
    else
    {
      +[HMFFuture futureWithNoValue];
    v11 = };
  }
  return v11;
}

- (void)updateWithService:(id)a3
{
  id v4 = a3;
  v5 = [(HMFNetworkService *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__HMFNetworkService_updateWithService___block_invoke;
  v7[3] = &unk_1E5957730;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __39__HMFNetworkService_updateWithService___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) serviceInfo];
  v2 = [*(id *)(a1 + 40) serviceInfo];
  [v3 updateWithServiceInfo:v2];
}

- (NSString)host
{
  id v3 = NSString;
  id v4 = [(HMFNetworkService *)self serviceInfo];
  v5 = [v4 serviceName];
  id v6 = [(HMFNetworkService *)self serviceInfo];
  v7 = [v6 serviceType];
  id v8 = [(HMFNetworkService *)self serviceInfo];
  id v9 = [v8 serviceDomain];
  int v10 = [v3 stringWithFormat:@"%@.%@.%@", v5, v7, v9];

  return (NSString *)v10;
}

- (NSString)hostName
{
  v2 = [(HMFNetworkService *)self serviceInfo];
  id v3 = [v2 serviceName];

  return (NSString *)v3;
}

- (NSArray)addresses
{
  v2 = [(HMFNetworkService *)self ipAddresses];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (BOOL)lowPowerMode
{
  v2 = [(HMFNetworkService *)self serviceInfo];
  id v3 = [v2 serviceName];
  char v4 = [v3 containsString:@"_lpm"];

  return v4;
}

- (id)_connectionWithPromise:(id)a3 parameters:(id)a4 receivedDataHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HMFNetworkService *)self invalidate];
  id v11 = [(HMFNetworkService *)self host];
  [v11 UTF8String];
  srv = nw_endpoint_create_srv();
  char v13 = nw_connection_create(srv, v9);

  int v14 = [(HMFNetworkService *)self workQueue];
  nw_connection_set_queue(v13, v14);

  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke;
  handler[3] = &unk_1E5958128;
  objc_copyWeak(&v25, &location);
  v15 = v13;
  nw_ip_version_t v22 = v15;
  id v16 = v10;
  id v24 = v16;
  id v17 = v8;
  id v23 = v17;
  nw_connection_set_state_changed_handler(v15, handler);
  v18 = v23;
  v19 = v15;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v19;
}

void __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2 == 5)
  {
    id v10 = (void *)MEMORY[0x19F3A87A0]();
    id v11 = WeakRetained;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      char v13 = HMFGetLogIdentifier(v11);
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      int v14 = "%{public}@Connection is cancelled";
LABEL_9:
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_DEBUG, v14, buf, 0xCu);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (a2 == 3)
  {
    nw_path_t v7 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    char v8 = [WeakRetained _updateDeviceWithPath:v7];

    if (v8)
    {
      id v9 = *(NSObject **)(a1 + 32);
      completion[0] = MEMORY[0x1E4F143A8];
      completion[1] = 3221225472;
      completion[2] = __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke_12;
      completion[3] = &unk_1E5958100;
      id v16 = *(id *)(a1 + 48);
      nw_connection_receive(v9, 0, 0xFFFFFFFF, completion);
      [*(id *)(a1 + 40) fulfillWithNoValue];

      goto LABEL_11;
    }
    id v10 = (void *)MEMORY[0x19F3A87A0]();
    id v11 = WeakRetained;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      char v13 = HMFGetLogIdentifier(v11);
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      int v14 = "%{public}@Reported a network path that cannot be resolved to an IP address - skipping";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_11:
}

void __75__HMFNetworkService__connectionWithPromise_parameters_receivedDataHandler___block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v11 = a2;
  char v8 = a5;
  id v9 = (void (**)(void, void, void, void))MEMORY[0x19F3A8A20](*(void *)(a1 + 32));
  if (v9)
  {
    if (v8) {
      CFErrorRef v10 = nw_error_copy_cf_error(v8);
    }
    else {
      CFErrorRef v10 = 0;
    }
    ((void (**)(void, uint64_t, id, CFErrorRef))v9)[2](v9, a4, v11, v10);
  }
}

- (BOOL)_updateDeviceWithPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMFNetworkService *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = nw_path_copy_endpoint();
    nw_path_t v7 = v6;
    if (v6 && (address = nw_endpoint_get_address(v6)) != 0)
    {
      id v9 = [[HMFNetAddress alloc] initWithSocketAddress:address];
      [(NSMutableArray *)self->_ipAddresses addObject:v9];
      self->_int port = nw_endpoint_get_port(v7);
      CFErrorRef v10 = (void *)MEMORY[0x19F3A87A0]();
      id v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        char v13 = HMFGetLogIdentifier(v11);
        int v14 = [(HMFNetAddress *)v9 addressString];
        int port = self->_port;
        int v18 = 138543874;
        uint64_t v19 = v13;
        __int16 v20 = 2114;
        int v21 = v14;
        __int16 v22 = 1024;
        int v23 = port;
        _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_INFO, "%{public}@Resolved: %{public}@ %hu", (uint8_t *)&v18, 0x1Cu);
      }

      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
    nw_path_t v7 = 0;
  }

  return v16;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMFNetworkService *)self host];
  id v6 = [(HMFNetworkService *)self addresses];
  nw_path_t v7 = [v6 lastObject];
  char v8 = [v3 stringWithFormat:@"%@ %@ %@ (%hu)", v4, v5, v7, -[HMFNetworkService port](self, "port")];

  return v8;
}

- (id)shortDescription
{
  v2 = NSString;
  id v3 = [(HMFNetworkService *)self host];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_9 != -1) {
    dispatch_once(&_MergedGlobals_3_9, &__block_literal_global_27);
  }
  v2 = (void *)qword_1EB4EEB00;
  return v2;
}

uint64_t __32__HMFNetworkService_logCategory__block_invoke()
{
  qword_1EB4EEB00 = HMFCreateOSLogHandle(@"HMFNetworkService", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (HMFNetworkServiceInfo)serviceInfo
{
  return self->_serviceInfo;
}

- (unsigned)port
{
  return self->_port;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableArray)ipAddresses
{
  return self->_ipAddresses;
}

- (void)setIpAddresses:(id)a3
{
}

- (OS_nw_connection)nwConnection
{
  return self->_nwConnection;
}

- (void)setNwConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwConnection, 0);
  objc_storeStrong((id *)&self->_ipAddresses, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
}

@end