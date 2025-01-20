@interface HMDDataStreamSocket
- (BOOL)isClosed;
- (BOOL)isClosing;
- (BOOL)writeData:(id)a3 error:(id *)a4;
- (HMDDataStreamSocket)initWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 workQueue:(id)a5;
- (HMDDataStreamSocketDelegate)delegate;
- (HMDDataStreamStreamProtocol)streamProtocol;
- (NSMutableArray)pendingReads;
- (NSString)applicationProtocolName;
- (OS_dispatch_queue)workQueue;
- (id)readData;
- (unint64_t)trafficClass;
- (void)_writeData:(id)a3 completion:(id)a4;
- (void)close;
- (void)closeInitiated;
- (void)closeWithError:(id)a3;
- (void)handleIncomingData:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setClosing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)writeData:(id)a3 completion:(id)a4;
@end

@implementation HMDDataStreamSocket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_streamProtocol);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationProtocolName, 0);
}

- (NSMutableArray)pendingReads
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (void)setClosing:(BOOL)a3
{
  self->_closing = a3;
}

- (BOOL)isClosing
{
  return self->_closing;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMDDataStreamStreamProtocol)streamProtocol
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_streamProtocol);
  return (HMDDataStreamStreamProtocol *)WeakRetained;
}

- (NSString)applicationProtocolName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)closeInitiated
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_closing = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)handleIncomingData:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableArray *)self->_pendingReads hmf_enqueue:v4];
  os_unfair_lock_unlock(&self->_lock);
  v5 = [(HMDDataStreamSocket *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDDataStreamSocket_handleIncomingData___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v5, block);
}

void __42__HMDDataStreamSocket_handleIncomingData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 socketDidReceiveData:*(void *)(a1 + 32)];
}

- (void)closeWithError:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_closed)
  {
    self->_closing = 0;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    *(_WORD *)&self->_closing = 256;
    os_unfair_lock_unlock(&self->_lock);
    v5 = [(HMDDataStreamSocket *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__HMDDataStreamSocket_closeWithError___block_invoke;
    v6[3] = &unk_264A2F820;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

void __38__HMDDataStreamSocket_closeWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) streamProtocol];
  [v2 unregisterSocket:*(void *)(a1 + 32)];

  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "socket:didFailWithError:", v4);
  }
  else {
    [v3 socketDidClose:v4];
  }
}

- (id)readData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSMutableArray *)self->_pendingReads hmf_maybeDequeue];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_writeData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDDataStreamSocket *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HMDDataStreamSocket__writeData_completion___block_invoke;
  block[3] = &unk_264A2EE80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__HMDDataStreamSocket__writeData_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) streamProtocol];
  [v2 sendData:*(void *)(a1 + 40) socket:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
}

- (void)writeData:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ([(HMDDataStreamSocket *)self isClosed])
  {
    id v7 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1061];
    v6[2](v6, v7);
  }
  else
  {
    [(HMDDataStreamSocket *)self _writeData:v8 completion:v6];
  }
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(HMDDataStreamSocket *)self isClosed];
  if (v7)
  {
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] hmInternalErrorWithCode:1061];
    }
  }
  else
  {
    [(HMDDataStreamSocket *)self _writeData:v6 completion:0];
  }

  return !v7;
}

- (void)close
{
}

- (void)setTrafficClass:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t trafficClass = self->_trafficClass;
  self->_unint64_t trafficClass = a3;
  os_unfair_lock_unlock(p_lock);
  if (trafficClass != a3)
  {
    BOOL v7 = [(HMDDataStreamSocket *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__HMDDataStreamSocket_setTrafficClass___block_invoke;
    block[3] = &unk_264A1E1C0;
    block[4] = self;
    void block[5] = trafficClass;
    block[6] = a3;
    dispatch_async(v7, block);
  }
}

void __39__HMDDataStreamSocket_setTrafficClass___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Traffic class changed from %lu -> %lu, notifying protocol", (uint8_t *)&v9, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) streamProtocol];
  [v8 evaluateOptionsForSocket:*(void *)(a1 + 32)];
}

- (unint64_t)trafficClass
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t trafficClass = self->_trafficClass;
  os_unfair_lock_unlock(p_lock);
  return trafficClass;
}

- (BOOL)isClosed
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_closed;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMDDataStreamSocketDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMDDataStreamSocketDelegate *)WeakRetained;
}

- (HMDDataStreamSocket)initWithStreamProtocol:(id)a3 applicationProtocolName:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDDataStreamSocket;
  __int16 v11 = [(HMDDataStreamSocket *)&v16 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_streamProtocol, v8);
    objc_storeStrong((id *)&v12->_applicationProtocolName, a4);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    *(_WORD *)&v12->_closing = 0;
    v12->_unint64_t trafficClass = 0;
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    pendingReads = v12->_pendingReads;
    v12->_pendingReads = (NSMutableArray *)v13;
  }
  return v12;
}

@end