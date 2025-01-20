@interface HAPBTLEControlOutputStream
+ (id)shortDescription;
- (BOOL)isComplete;
- (BOOL)isOpen;
- (HAPBTLEControlOutputStream)init;
- (HAPBTLEControlOutputStream)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 controlPayload:(id)a5 mtuLength:(unint64_t)a6 timeoutInterval:(double)a7;
- (HAPBTLEControlOutputStreamDelegate)delegate;
- (HAPBTLETransactionIdentifier)transactionIdentifier;
- (NSData)payload;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)clientQueue;
- (double)timeoutInterval;
- (id)_nextPacketWithMaximumLength:(unint64_t)a3 error:(id *)a4;
- (id)completionHandler;
- (id)debugDescription;
- (id)description;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (unint64_t)controlPayloadWrittenLength;
- (unint64_t)mtuLength;
- (unint64_t)remainingControlPayloadLength;
- (unsigned)type;
- (void)_closeWithError:(id)a3;
- (void)_complete;
- (void)_sendNextPayloadFragmentWithCompletionHandler:(id)a3;
- (void)close;
- (void)open;
- (void)sendNextPayloadFragment;
- (void)setComplete:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setControlPayloadWrittenLength:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setOpen:(BOOL)a3;
@end

@implementation HAPBTLEControlOutputStream

- (void)setCompletionHandler:(id)a3
{
  id v4 = (id)MEMORY[0x1D944E2D0](a3, a2);
  objc_setAssociatedObject(self, "completionHandler", v4, (void *)3);
}

- (id)completionHandler
{
  return objc_getAssociatedObject(self, "completionHandler");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setControlPayloadWrittenLength:(unint64_t)a3
{
  self->_controlPayloadWrittenLength = a3;
}

- (unint64_t)controlPayloadWrittenLength
{
  return self->_controlPayloadWrittenLength;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (unint64_t)mtuLength
{
  return self->_mtuLength;
}

- (NSData)payload
{
  return self->_payload;
}

- (HAPBTLETransactionIdentifier)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setDelegate:(id)a3
{
}

- (HAPBTLEControlOutputStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPBTLEControlOutputStreamDelegate *)WeakRetained;
}

- (id)_nextPacketWithMaximumLength:(unint64_t)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([(HAPBTLEControlOutputStream *)self isComplete])
  {
    v7 = (void *)MEMORY[0x1D944E080]();
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      v10 = [(HAPBTLEControlOutputStream *)self shortDescription];
      int v28 = 138543618;
      v29 = v9;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_ERROR, "%{public}@[%@] The control output stream is complete", (uint8_t *)&v28, 0x16u);
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Invalid operation." reason:@"The control output stream is complete" suggestion:0 underlyingError:0];
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    BOOL v12 = [(HAPBTLEControlOutputStream *)self controlPayloadWrittenLength] != 0;
    v13 = [(HAPBTLEControlOutputStream *)self payload];
    unint64_t v14 = [(HAPBTLEControlOutputStream *)self controlPayloadWrittenLength];
    v15 = [(HAPBTLEControlOutputStream *)self payload];
    v16 = objc_msgSend(v13, "subdataWithRange:", v14, objc_msgSend(v15, "length")- -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength"));

    v17 = [HAPBTLEControlPacket alloc];
    uint64_t v18 = [(HAPBTLEControlOutputStream *)self type];
    v19 = [(HAPBTLEControlOutputStream *)self transactionIdentifier];
    v11 = [(HAPBTLEControlPacket *)v17 initWithControlType:v18 transactionIdentifier:v19 continuationPacket:v12 packetPayload:v16 maximumLength:a3];

    if (v11)
    {
      unint64_t v20 = [(HAPBTLEControlOutputStream *)self controlPayloadWrittenLength];
      v21 = [(HAPBTLEControlPacket *)v11 payload];
      -[HAPBTLEControlOutputStream setControlPayloadWrittenLength:](self, "setControlPayloadWrittenLength:", [v21 length] + v20);

      v22 = v11;
    }
    else
    {
      v23 = (void *)MEMORY[0x1D944E080]();
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        v26 = [(HAPBTLEControlOutputStream *)self shortDescription];
        int v28 = 138543618;
        v29 = v25;
        __int16 v30 = 2112;
        v31 = v26;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control packet", (uint8_t *)&v28, 0x16u);
      }
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] hapErrorWithCode:1 description:@"Failed to create control packet." reason:0 suggestion:0 underlyingError:0];
      }
    }
  }

  return v11;
}

- (void)_sendNextPayloadFragmentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HAPBTLEControlOutputStream *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E69F3C68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v20 = 0;
  v3 = objc_msgSend(v2, "_nextPacketWithMaximumLength:error:", objc_msgSend(v2, "mtuLength"), &v20);
  id v4 = v20;
  if (v3)
  {
    v5 = [*(id *)(a1 + 32) delegate];
    if (v5)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_22;
      v18[3] = &unk_1E69F3E20;
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(id *)(a1 + 40);
      v18[4] = *(void *)(a1 + 32);
      id v19 = v7;
      [v5 controlOutputStream:v6 didReceiveRequestToSendControlPacket:v3 completionHandler:v18];
      id v8 = v19;
    }
    else
    {
      unint64_t v14 = (void *)MEMORY[0x1D944E080]();
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = HMFGetLogIdentifier();
        v17 = [*(id *)(a1 + 32) shortDescription];
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] The stream delegate is missing, closing session", buf, 0x16u);
      }
      if (!*(void *)(a1 + 40)) {
        goto LABEL_13;
      }
      id v8 = [MEMORY[0x1E4F28C58] hapErrorWithCode:3 description:@"Operation not supported." reason:@"The stream delegate is missing." suggestion:0 underlyingError:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

LABEL_13:
    goto LABEL_14;
  }
  v9 = (void *)MEMORY[0x1D944E080]();
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    BOOL v12 = [*(id *)(a1 + 32) shortDescription];
    *(_DWORD *)buf = 138543874;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1D4758000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to get the next control packet with error: %@", buf, 0x20u);
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v4);
  }
LABEL_14:
}

void __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) clientQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E69F3C68;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __76__HAPBTLEControlOutputStream__sendNextPayloadFragmentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sendNextPayloadFragment
{
  id v3 = objc_alloc(MEMORY[0x1E4F65400]);
  [(HAPBTLEControlOutputStream *)self timeoutInterval];
  id v4 = objc_msgSend(v3, "initWithTimeout:");
  objc_initWeak(&location, v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke;
  v8[3] = &unk_1E69F4540;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [v4 addExecutionBlock:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_3;
  v6[3] = &unk_1E69F4540;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v4 setCompletionBlock:v6];
  v5 = [(HAPBTLEControlOutputStream *)self operationQueue];
  [v5 addOperation:v4];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_2;
    v5[3] = &unk_1E69F4380;
    id v6 = v3;
    [v4 _sendNextPayloadFragmentWithCompletionHandler:v5];
  }
}

void __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) clientQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_4;
  v6[3] = &unk_1E69F46E0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = WeakRetained;
  uint64_t v8 = v4;
  id v5 = WeakRetained;
  dispatch_async(v3, v6);
}

void __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];

  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) error];
    [v3 _closeWithError:v6];
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) remainingControlPayloadLength];
    id v5 = *(void **)(a1 + 40);
    if (v4)
    {
      [v5 sendNextPayloadFragment];
    }
    else
    {
      [v5 _complete];
    }
  }
}

uint64_t __53__HAPBTLEControlOutputStream_sendNextPayloadFragment__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 cancelWithError:a2];
  }
  else {
    return [v2 finish];
  }
}

- (void)_complete
{
  if (![(HAPBTLEControlOutputStream *)self isComplete])
  {
    [(HAPBTLEControlOutputStream *)self setComplete:1];
    id v3 = [(HAPBTLEControlOutputStream *)self delegate];
    [v3 controlOutputStreamDidComplete:self];
  }
}

- (void)_closeWithError:(id)a3
{
  id v5 = a3;
  if ([(HAPBTLEControlOutputStream *)self isOpen])
  {
    [(HAPBTLEControlOutputStream *)self setOpen:0];
    uint64_t v4 = [(HAPBTLEControlOutputStream *)self delegate];
    [v4 controlOutputStream:self didCloseWithError:v5];
  }
}

- (void)close
{
  id v3 = [(HAPBTLEControlOutputStream *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HAPBTLEControlOutputStream_close__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__HAPBTLEControlOutputStream_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeWithError:0];
}

- (void)open
{
  id v3 = [(HAPBTLEControlOutputStream *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__HAPBTLEControlOutputStream_open__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__HAPBTLEControlOutputStream_open__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isOpen];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setOpen:1];
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 controlOutputStreamDidOpen:*(void *)(a1 + 32)];

    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 sendNextPayloadFragment];
  }
  return result;
}

- (unint64_t)remainingControlPayloadLength
{
  id v3 = [(HAPBTLEControlOutputStream *)self payload];
  uint64_t v4 = [v3 length];
  unint64_t v5 = v4 - [(HAPBTLEControlOutputStream *)self controlPayloadWrittenLength];

  return v5;
}

- (id)description
{
  return [(HAPBTLEControlOutputStream *)self descriptionWithPointer:0];
}

- (id)debugDescription
{
  return [(HAPBTLEControlOutputStream *)self descriptionWithPointer:1];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  v16 = NSString;
  unint64_t v5 = [(HAPBTLEControlOutputStream *)self shortDescription];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = &stru_1F2C4E778;
  }
  int v7 = [(HAPBTLEControlOutputStream *)self type];
  uint64_t v8 = @"unknown";
  if (v7 == 1) {
    uint64_t v8 = @"response";
  }
  if (!v7) {
    uint64_t v8 = @"request";
  }
  id v9 = v8;
  v10 = [(HAPBTLEControlOutputStream *)self transactionIdentifier];
  unsigned int v11 = [v10 unsignedCharValue];
  [(HAPBTLEControlOutputStream *)self isComplete];
  BOOL v12 = HMFBooleanToString();
  uint64_t v13 = [(HAPBTLEControlOutputStream *)self payload];
  unint64_t v14 = [v16 stringWithFormat:@"<%@%@, Type = %@, Transaction Identifier = 0x%02x, Completed = %@, Payload Length = %tu, Remaining Payload Length = %tu>", v5, v6, v9, v11, v12, objc_msgSend(v13, "length"), -[HAPBTLEControlOutputStream remainingControlPayloadLength](self, "remainingControlPayloadLength")];

  if (v3) {

  }
  return v14;
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (HAPBTLEControlOutputStream)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 controlPayload:(id)a5 mtuLength:(unint64_t)a6 timeoutInterval:(double)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  v15 = v14;
  if (!v13)
  {
    int v28 = (void *)MEMORY[0x1D944E080]();
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (![v14 length])
  {
    int v28 = (void *)MEMORY[0x1D944E080]();
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
LABEL_9:
    __int16 v30 = HMFGetLogIdentifier();
    v31 = +[HAPBTLEControlOutputStream shortDescription];
    *(_DWORD *)buf = 138543618;
    v36 = v30;
    __int16 v37 = 2112;
    v38 = v31;
    uint64_t v32 = "%{public}@[%@] Invalid control payload data.";
    goto LABEL_16;
  }
  if (!a6)
  {
    int v28 = (void *)MEMORY[0x1D944E080]();
    v29 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    __int16 v30 = HMFGetLogIdentifier();
    v31 = +[HAPBTLEControlOutputStream shortDescription];
    *(_DWORD *)buf = 138543618;
    v36 = v30;
    __int16 v37 = 2112;
    v38 = v31;
    uint64_t v32 = "%{public}@[%@] Invalid MTU length.";
LABEL_16:
    _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);

    goto LABEL_17;
  }
  if (a7 <= 0.0)
  {
    int v28 = (void *)MEMORY[0x1D944E080]();
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = HMFGetLogIdentifier();
      v31 = +[HAPBTLEControlOutputStream shortDescription];
      *(_DWORD *)buf = 138543618;
      v36 = v30;
      __int16 v37 = 2112;
      v38 = v31;
      uint64_t v32 = "%{public}@[%@] Invalid timeout for write.";
      goto LABEL_16;
    }
LABEL_17:

    uint64_t v27 = 0;
    goto LABEL_18;
  }
  v34.receiver = self;
  v34.super_class = (Class)HAPBTLEControlOutputStream;
  v16 = [(HAPBTLEControlOutputStream *)&v34 init];
  v17 = v16;
  if (v16)
  {
    uint64_t v18 = (const char *)HAPDispatchQueueName(v16, 0);
    id v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    clientQueue = v17->_clientQueue;
    v17->_clientQueue = (OS_dispatch_queue *)v20;

    v17->_type = a3;
    objc_storeStrong((id *)&v17->_transactionIdentifier, a4);
    uint64_t v22 = [v15 copy];
    payload = v17->_payload;
    v17->_payload = (NSData *)v22;

    v17->_mtuLength = a6;
    v17->_timeoutInterval = a7;
    v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    __int16 v25 = objc_msgSend(NSString, "stringWithFormat:", @"%s", HAPDispatchQueueName(v17, @"operationQueue"));
    [(NSOperationQueue *)v24 setName:v25];

    [(NSOperationQueue *)v24 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v24 setQualityOfService:25];
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = v24;
  }
  self = v17;
  uint64_t v27 = self;
LABEL_18:

  return v27;
}

- (HAPBTLEControlOutputStream)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  uint64_t v4 = NSString;
  unint64_t v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end