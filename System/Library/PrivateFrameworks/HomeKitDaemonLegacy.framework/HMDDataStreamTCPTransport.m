@interface HMDDataStreamTCPTransport
- (HMDDataStreamFrameReader)byteReader;
- (HMDDataStreamTCPTransport)initWithAddress:(id)a3 port:(int64_t)a4 targetQueue:(id)a5 logIdentifier:(id)a6;
- (HMDDataStreamTCPTransport)initWithAddress:(id)a3 port:(int64_t)a4 workQueue:(id)a5 logIdentifier:(id)a6;
- (HMDDataStreamTransportDelegate)delegate;
- (HMDNetworkConnection)tcpConnection;
- (HMFNetAddress)remoteAddress;
- (NSString)logIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_createTcpConnection;
- (id)connectionFactory;
- (void)_closeWithError:(id)a3;
- (void)_consumeReceivedData:(id)a3;
- (void)_doReceive;
- (void)_handleReadClose;
- (void)_registerForConnectionEvents;
- (void)_start;
- (void)_stopWithError:(id)a3;
- (void)close;
- (void)connect;
- (void)dealloc;
- (void)sendRawFrame:(id)a3 completion:(id)a4;
- (void)setConnectionFactory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTcpConnection:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
@end

@implementation HMDDataStreamTCPTransport

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_byteReader, 0);
  objc_storeStrong((id *)&self->_tcpConnection, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)setConnectionFactory:(id)a3
{
}

- (id)connectionFactory
{
  return self->_connectionFactory;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (HMDDataStreamFrameReader)byteReader
{
  return self->_byteReader;
}

- (void)setTcpConnection:(id)a3
{
}

- (HMDNetworkConnection)tcpConnection
{
  return self->_tcpConnection;
}

- (HMFNetAddress)remoteAddress
{
  return self->_remoteAddress;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HMDDataStreamTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMDDataStreamTransportDelegate *)WeakRetained;
}

- (void)setTrafficClass:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = [(HMDDataStreamTCPTransport *)self tcpConnection];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Setting traffic class to %lu", (uint8_t *)&v11, 0x16u);
    }
    v10 = [(HMDDataStreamTCPTransport *)v7 tcpConnection];
    [v10 resetTrafficClass:a3];
  }
}

- (void)sendRawFrame:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (const void *)[v7 bytes];
  size_t v9 = [v7 length];

  dispatch_data_t v10 = dispatch_data_create(v8, v9, 0, 0);
  int v11 = [(HMDDataStreamTCPTransport *)self tcpConnection];
  uint64_t v12 = *MEMORY[0x1E4F38C58];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HMDDataStreamTCPTransport_sendRawFrame_completion___block_invoke;
  v14[3] = &unk_1E6A17D78;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [v11 sendData:v10 context:v12 isComplete:1 completion:v14];
}

void __53__HMDDataStreamTCPTransport_sendRawFrame_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@DataStream Socket write error (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    size_t v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Socket wrote bytes.", (uint8_t *)&v10, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)close
{
}

- (void)_closeWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDDataStreamTCPTransport *)self tcpConnection];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      int v10 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket closing socket.", (uint8_t *)&v15, 0xCu);
    }
    int v11 = [(HMDDataStreamTCPTransport *)v7 tcpConnection];
    [v11 cancel];

    [(HMDDataStreamTCPTransport *)v7 setTcpConnection:0];
    v7->_connected = 0;
    __int16 v12 = [(HMDDataStreamTCPTransport *)v7 delegate];
    id v13 = v12;
    if (v4) {
      [v12 transport:v7 didFailWithError:v4];
    }
    else {
      [v12 transportDidClose:v7];
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket invoked closed but nothing to clean up.", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_doReceive
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDDataStreamTCPTransport *)self byteReader];
  int v4 = [v3 hasFailed];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream has encountered irrecoverable framing issue. Closing socket.", buf, 0xCu);
    }
    BOOL v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:19];
    [(HMDDataStreamTCPTransport *)v6 _stopWithError:v9];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    int v10 = [(HMDDataStreamTCPTransport *)self byteReader];
    uint64_t v11 = [v10 bytesNeededForCurrentFrame];

    __int16 v12 = [(HMDDataStreamTCPTransport *)self tcpConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__HMDDataStreamTCPTransport__doReceive__block_invoke;
    v13[3] = &unk_1E6A0F240;
    objc_copyWeak(&v14, (id *)buf);
    [v12 receiveWithMinLength:v11 maxLength:(v11 + 256) completion:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __39__HMDDataStreamTCPTransport__doReceive__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v8 = a2;
  id v9 = a3;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      id v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v12;
      int v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v16;
        __int16 v23 = 2048;
        size_t size = dispatch_data_get_size(v8);
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Socket read %zd bytes", (uint8_t *)&v21, 0x16u);
      }
      id WeakRetained = (id)[v14 _consumeReceivedData:v8];
    }
    if (v10)
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090](WeakRetained);
      id v18 = v12;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v20;
        __int16 v23 = 2112;
        size_t size = (size_t)v10;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket read error (%@)", (uint8_t *)&v21, 0x16u);
      }
      [v18 _stopWithError:v10];
    }
    else
    {
      [v12 _doReceive];
    }
  }
}

- (void)_consumeReceivedData:(id)a3
{
  id v13 = a3;
  int v4 = [(HMDDataStreamTCPTransport *)self byteReader];
  [v4 pushFrameData:v13];

  id v5 = [(HMDDataStreamTCPTransport *)self byteReader];
  int v6 = [v5 hasCompleteFrame];

  if (v6)
  {
    do
    {
      id v7 = (void *)MEMORY[0x1D9452090]();
      v8 = [(HMDDataStreamTCPTransport *)self byteReader];
      id v9 = [v8 popRawFrame];

      if (v9)
      {
        id v10 = [(HMDDataStreamTCPTransport *)self delegate];
        [v10 transport:self didReceiveRawFrame:v9];
      }
      uint64_t v11 = [(HMDDataStreamTCPTransport *)self byteReader];
      char v12 = [v11 hasCompleteFrame];
    }
    while ((v12 & 1) != 0);
  }
}

- (void)_stopWithError:(id)a3
{
  self->_connected = 0;
  [(HMDDataStreamTCPTransport *)self _closeWithError:a3];
}

- (void)_start
{
  self->_connected = 1;
  [(HMDDataStreamTCPTransport *)self _registerForConnectionEvents];
  [(HMDDataStreamFrameReader *)self->_byteReader reset];
  [(HMDDataStreamTCPTransport *)self _doReceive];
  id v3 = [(HMDDataStreamTCPTransport *)self delegate];
  [v3 transportDidOpen:self];
}

- (void)_registerForConnectionEvents
{
  id v3 = [(HMDDataStreamTCPTransport *)self tcpConnection];
  if (v3)
  {
    BOOL connected = self->_connected;

    if (connected)
    {
      objc_initWeak(&location, self);
      id v5 = [(HMDDataStreamTCPTransport *)self tcpConnection];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__HMDDataStreamTCPTransport__registerForConnectionEvents__block_invoke;
      v6[3] = &unk_1E6A16E40;
      objc_copyWeak(&v7, &location);
      [v5 setReadCloseHandler:v6];

      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

void __57__HMDDataStreamTCPTransport__registerForConnectionEvents__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleReadClose];
    id WeakRetained = v2;
  }
}

- (void)_handleReadClose
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  int v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket read-end closed (half-close scenario)", (uint8_t *)&v7, 0xCu);
  }
}

- (void)connect
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDDataStreamTCPTransport *)self tcpConnection];

  if (v3)
  {
    BOOL v4 = !self->_connected;
    id v5 = (void *)MEMORY[0x1D9452090]();
    int v6 = self;
    int v7 = HMFGetOSLogHandle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v8)
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v35 = v22;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-connecting transport", buf, 0xCu);
      }
    }
    else if (v8)
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Connect called on an already-running transport", buf, 0xCu);
    }
  }
  else
  {
    self->_BOOL connected = 0;
    id v10 = [(HMDDataStreamTCPTransport *)self _createTcpConnection];
    [(HMDDataStreamTCPTransport *)self setTcpConnection:v10];

    uint64_t v11 = [(HMDDataStreamTCPTransport *)self tcpConnection];

    if (v11)
    {
      objc_initWeak(&location, self);
      char v12 = [(HMDDataStreamTCPTransport *)self tcpConnection];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __36__HMDDataStreamTCPTransport_connect__block_invoke;
      v31 = &unk_1E6A0F218;
      objc_copyWeak(&v32, &location);
      [v12 setStateChangedHandler:&v28];

      uint64_t v17 = (void *)MEMORY[0x1D9452090](v13, v14, v15, v16);
      id v18 = self;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v35 = v20;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket starting", buf, 0xCu);
      }
      int v21 = [(HMDDataStreamTCPTransport *)v18 tcpConnection];
      [v21 start];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    else
    {
      __int16 v23 = (void *)MEMORY[0x1D9452090]();
      v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v35 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to create TCP connection (out of memory?)", buf, 0xCu);
      }
      v27 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
      [(HMDDataStreamTCPTransport *)v24 _stopWithError:v27];
    }
  }
}

void __36__HMDDataStreamTCPTransport_connect__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      BOOL v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = v7;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v20 = 138543874;
        int v21 = v11;
        __int16 v22 = 2080;
        uint64_t v23 = nw_connection_state_to_string();
        __int16 v24 = 2112;
        id v25 = v5;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@DataStream Socket disconnected with failure in state %s: %@", (uint8_t *)&v20, 0x20u);
      }
      id WeakRetained = (id)[v9 _stopWithError:v5];
    }
    if ((a2 - 4) >= 2)
    {
      if (a2 == 3)
      {
        uint64_t v16 = (void *)MEMORY[0x1D9452090](WeakRetained);
        id v17 = v7;
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = HMFGetLogIdentifier();
          int v20 = 138543362;
          int v21 = v19;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket connected", (uint8_t *)&v20, 0xCu);
        }
        [v17 _start];
      }
    }
    else
    {
      char v12 = (void *)MEMORY[0x1D9452090](WeakRetained);
      id v13 = v7;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v20 = 138543362;
        int v21 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@DataStream Socket disconnected", (uint8_t *)&v20, 0xCu);
      }
      [v13 _stopWithError:0];
    }
  }
}

- (id)_createTcpConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  BOOL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    uint64_t schedulingMode = v4->_schedulingMode;
    int v18 = 138543618;
    v19 = v6;
    __int16 v20 = 2048;
    uint64_t v21 = schedulingMode;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Creating TCP connection with scheduling mode %ld", (uint8_t *)&v18, 0x16u);
  }
  nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
  nw_parameters_set_data_mode();
  if (v4->_schedulingMode)
  {
    id v9 = (void *)nw_context_create();
    nw_context_set_isolate_protocol_stack();
    nw_context_set_scheduling_mode();
    nw_parameters_set_context();
  }
  id v10 = [(HMDDataStreamTCPTransport *)v4 remoteAddress];
  id v11 = [v10 addressString];
  [v11 UTF8String];
  host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port();

  id v13 = [(HMDDataStreamTCPTransport *)v4 connectionFactory];

  if (v13)
  {
    uint64_t v14 = [(HMDDataStreamTCPTransport *)v4 connectionFactory];
    ((void (**)(void, void *, nw_parameters_t))v14)[2](v14, host_with_numeric_port, secure_tcp);
    uint64_t v15 = (HMDNetworkConnection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = [[HMDNetworkConnection alloc] initWithEndpoint:host_with_numeric_port parameters:secure_tcp];
  }
  uint64_t v16 = [(HMDDataStreamTCPTransport *)v4 workQueue];
  [(HMDNetworkConnection *)v15 setQueue:v16];

  return v15;
}

- (void)dealloc
{
  if (self->_tcpConnection) {
    [(HMDDataStreamTCPTransport *)self close];
  }
  v3.receiver = self;
  v3.super_class = (Class)HMDDataStreamTCPTransport;
  [(HMDDataStreamTCPTransport *)&v3 dealloc];
}

- (HMDDataStreamTCPTransport)initWithAddress:(id)a3 port:(int64_t)a4 targetQueue:(id)a5 logIdentifier:(id)a6
{
  id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  char v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
  id v13 = a6;
  uint64_t v14 = a5;
  id v15 = a3;

  dispatch_queue_t v16 = dispatch_queue_create_with_target_V2("HMDDataStreamTCPTransport", v12, v14);
  id v17 = [(HMDDataStreamTCPTransport *)self initWithAddress:v15 port:a4 workQueue:v16 logIdentifier:v13];

  if (v17) {
    v17->_uint64_t schedulingMode = 2;
  }

  return v17;
}

- (HMDDataStreamTCPTransport)initWithAddress:(id)a3 port:(int64_t)a4 workQueue:(id)a5 logIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDDataStreamTCPTransport;
  uint64_t v14 = [(HMDDataStreamTCPTransport *)&v21 init];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteAddress, a3);
    v15->_remotePort = a4;
    objc_storeStrong((id *)&v15->_workQueue, a5);
    uint64_t v16 = objc_opt_new();
    byteReader = v15->_byteReader;
    v15->_byteReader = (HMDDataStreamFrameReader *)v16;

    uint64_t v18 = [v13 copy];
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v18;

    v15->_uint64_t schedulingMode = 0;
  }

  return v15;
}

@end