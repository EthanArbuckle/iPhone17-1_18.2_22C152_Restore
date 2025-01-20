@interface HMDDataStreamBulkSendSession
- (BOOL)isActive;
- (HMDDataStreamBulkSendProtocol)bulkSendProtocol;
- (HMDDataStreamBulkSendSession)initWithProtocol:(id)a3 sessionIdentifier:(id)a4 queue:(id)a5 logIdentifier:(id)a6;
- (NSError)pendingError;
- (NSMutableArray)pendingReads;
- (NSNumber)sessionIdentifier;
- (NSString)logIdentifier;
- (OS_dispatch_queue)queue;
- (id)activeReadHandler;
- (void)_closeSession;
- (void)_pumpReadDataIfPossible;
- (void)asyncHandleIncomingPackets:(id)a3 isEof:(BOOL)a4;
- (void)asyncHandleRemoteCloseWithError:(id)a3;
- (void)cancelWithReason:(unsigned __int16)a3;
- (void)dealloc;
- (void)read:(id)a3;
- (void)setActiveReadHandler:(id)a3;
- (void)setPendingError:(id)a3;
- (void)setPendingReads:(id)a3;
@end

@implementation HMDDataStreamBulkSendSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingError, 0);
  objc_storeStrong((id *)&self->_pendingReads, 0);
  objc_storeStrong(&self->_activeReadHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_bulkSendProtocol);
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void)setPendingError:(id)a3
{
}

- (NSError)pendingError
{
  return self->_pendingError;
}

- (void)setPendingReads:(id)a3
{
}

- (NSMutableArray)pendingReads
{
  return self->_pendingReads;
}

- (void)setActiveReadHandler:(id)a3
{
}

- (id)activeReadHandler
{
  return self->_activeReadHandler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSNumber)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HMDDataStreamBulkSendProtocol)bulkSendProtocol
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bulkSendProtocol);
  return (HMDDataStreamBulkSendProtocol *)WeakRetained;
}

- (void)_pumpReadDataIfPossible
{
  v3 = [(HMDDataStreamBulkSendSession *)self activeReadHandler];

  if (v3)
  {
    v4 = [(HMDDataStreamBulkSendSession *)self pendingReads];
    v5 = objc_msgSend(v4, "hmf_maybeDequeue");

    if (!v5)
    {
      v6 = [(HMDDataStreamBulkSendSession *)self pendingError];
      [(HMDDataStreamBulkSendSession *)self setPendingError:0];
      if (v6) {
        goto LABEL_5;
      }
      if (!self->_hasReceivedEof) {
        goto LABEL_6;
      }
    }
    v6 = 0;
LABEL_5:
    v7 = [(HMDDataStreamBulkSendSession *)self activeReadHandler];
    [(HMDDataStreamBulkSendSession *)self setActiveReadHandler:0];
    v8 = [(HMDDataStreamBulkSendSession *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HMDDataStreamBulkSendSession__pumpReadDataIfPossible__block_invoke;
    block[3] = &unk_1E6A193D0;
    id v14 = v7;
    id v12 = v5;
    id v13 = v6;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(v8, block);

LABEL_6:
  }
}

uint64_t __55__HMDDataStreamBulkSendSession__pumpReadDataIfPossible__block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_closeSession
{
  if (!self->_isClosed)
  {
    self->_isClosed = 1;
    v3 = [(HMDDataStreamBulkSendSession *)self activeReadHandler];
    [(HMDDataStreamBulkSendSession *)self setActiveReadHandler:0];
    if (v3)
    {
      v4 = [(HMDDataStreamBulkSendSession *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__HMDDataStreamBulkSendSession__closeSession__block_invoke;
      block[3] = &unk_1E6A186E0;
      id v6 = v3;
      dispatch_async(v4, block);
    }
  }
}

uint64_t __45__HMDDataStreamBulkSendSession__closeSession__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)asyncHandleRemoteCloseWithError:(id)a3
{
  id v4 = a3;
  v5 = [(HMDDataStreamBulkSendSession *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__HMDDataStreamBulkSendSession_asyncHandleRemoteCloseWithError___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__HMDDataStreamBulkSendSession_asyncHandleRemoteCloseWithError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received remote close with error: %@", (uint8_t *)&v8, 0x16u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  [*(id *)(a1 + 32) setPendingError:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _pumpReadDataIfPossible];
}

- (void)asyncHandleIncomingPackets:(id)a3 isEof:(BOOL)a4
{
  id v6 = a3;
  v7 = [(HMDDataStreamBulkSendSession *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HMDDataStreamBulkSendSession_asyncHandleIncomingPackets_isEof___block_invoke;
  block[3] = &unk_1E6A18708;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __65__HMDDataStreamBulkSendSession_asyncHandleIncomingPackets_isEof___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = *(id *)(a1 + 32);
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Received EOF from accessory.", (uint8_t *)&v8, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) pendingReads];
    objc_msgSend(v6, "hmf_enqueueMultiple:", *(void *)(a1 + 40));
  }
  return [*(id *)(a1 + 32) _pumpReadDataIfPossible];
}

- (void)read:(id)a3
{
  id v4 = a3;
  v5 = [(HMDDataStreamBulkSendSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_isClosed)
  {
    id v6 = [(HMDDataStreamBulkSendSession *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__HMDDataStreamBulkSendSession_read___block_invoke;
    block[3] = &unk_1E6A186E0;
    id v9 = v4;
    dispatch_async(v6, block);
  }
  else
  {
    v7 = [(HMDDataStreamBulkSendSession *)self activeReadHandler];

    if (v7)
    {
      [(HMDDataStreamBulkSendSession *)self cancelWithReason:5];
    }
    else
    {
      [(HMDDataStreamBulkSendSession *)self setActiveReadHandler:v4];
      [(HMDDataStreamBulkSendSession *)self _pumpReadDataIfPossible];
    }
  }
}

uint64_t __37__HMDDataStreamBulkSendSession_read___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelWithReason:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  [(HMDDataStreamBulkSendSession *)self _closeSession];
  id v6 = [(HMDDataStreamBulkSendSession *)self bulkSendProtocol];
  if (v6)
  {
    v5 = [(HMDDataStreamBulkSendSession *)self sessionIdentifier];
    [v6 asyncBulkSendSessionDidCancelSessionWithIdentifier:v5 reason:v3 hadReceivedEof:self->_hasReceivedEof];
  }
}

- (BOOL)isActive
{
  if (self->_isClosed) {
    return 0;
  }
  id v4 = [(HMDDataStreamBulkSendSession *)self pendingReads];
  if ([v4 count])
  {

    return 1;
  }
  v5 = [(HMDDataStreamBulkSendSession *)self pendingError];

  if (v5) {
    return 1;
  }
  return !self->_hasReceivedEof;
}

- (void)dealloc
{
  if (!self->_isClosed)
  {
    uint64_t v3 = [(HMDDataStreamBulkSendSession *)self bulkSendProtocol];
    if (v3)
    {
      id v4 = [(HMDDataStreamBulkSendSession *)self sessionIdentifier];
      [v3 asyncBulkSendSessionDidCancelSessionWithIdentifier:v4 reason:5 hadReceivedEof:self->_hasReceivedEof];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)HMDDataStreamBulkSendSession;
  [(HMDDataStreamBulkSendSession *)&v5 dealloc];
}

- (HMDDataStreamBulkSendSession)initWithProtocol:(id)a3 sessionIdentifier:(id)a4 queue:(id)a5 logIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDDataStreamBulkSendSession;
  id v14 = [(HMDDataStreamBulkSendSession *)&v21 init];
  v15 = v14;
  if (v14)
  {
    *(_WORD *)&v14->_isClosed = 0;
    objc_storeWeak((id *)&v14->_bulkSendProtocol, v10);
    objc_storeStrong((id *)&v15->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v15->_queue, a5);
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    pendingReads = v15->_pendingReads;
    v15->_pendingReads = (NSMutableArray *)v16;

    uint64_t v18 = [NSString stringWithFormat:@"%@/%@", v13, v11];
    logIdentifier = v15->_logIdentifier;
    v15->_logIdentifier = (NSString *)v18;
  }
  return v15;
}

@end