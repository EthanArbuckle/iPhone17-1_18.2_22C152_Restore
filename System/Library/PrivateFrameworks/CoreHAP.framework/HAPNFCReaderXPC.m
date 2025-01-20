@interface HAPNFCReaderXPC
- (BOOL)supportsBackgroundReading;
- (HAPNFCReaderStream)readerStream;
- (NSString)stream;
- (OS_dispatch_queue)workQueue;
- (OS_xpc_object)event;
- (id)initReaderWithStream:(id)a3 fromSource:(unint64_t)a4 workQueue:(id)a5 readerStream:(id)a6;
- (unint64_t)source;
- (void)beginSession;
- (void)setEvent:(id)a3;
- (void)setReaderStream:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStream:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HAPNFCReaderXPC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerStream, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)setReaderStream:(id)a3
{
}

- (HAPNFCReaderStream)readerStream
{
  return (HAPNFCReaderStream *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEvent:(id)a3
{
}

- (OS_xpc_object)event
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setStream:(id)a3
{
}

- (NSString)stream
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)supportsBackgroundReading
{
  return self->_supportsBackgroundReading;
}

- (void)beginSession
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D944E080](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    id v7 = [(HAPNFCReaderXPC *)v4 stream];
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    __int16 v12 = 2080;
    uint64_t v13 = [v7 UTF8String];
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@Initializing xpc nfc event handler %s", buf, 0x16u);
  }
  v8 = [(HAPNFCReaderXPC *)v4 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HAPNFCReaderXPC_beginSession__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = v4;
  dispatch_async(v8, block);
}

void __31__HAPNFCReaderXPC_beginSession__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D944E080]();
  id v3 = [*(id *)(a1 + 32) stream];
  v4 = (const char *)[v3 UTF8String];
  v5 = [*(id *)(a1 + 32) workQueue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __31__HAPNFCReaderXPC_beginSession__block_invoke_2;
  handler[3] = &unk_1E69F2488;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v4, v5, handler);

  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  [*(id *)(a1 + 32) setEvent:v6];

  id v7 = [*(id *)(a1 + 32) event];
  xpc_dictionary_set_string(v7, "version", "v1");

  id v8 = [*(id *)(a1 + 32) stream];
  [v8 UTF8String];
  [@"NFC" UTF8String];
  v9 = [*(id *)(a1 + 32) event];
  xpc_set_event();
}

void __31__HAPNFCReaderXPC_beginSession__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = MEMORY[0x1D944E660]();
  if (v6 != MEMORY[0x1E4F14590])
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x1E4F145A8];
    uint64_t v9 = MEMORY[0x1D944E080]();
    id v10 = v4;
    v11 = HMFGetOSLogHandle();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v7 == v8)
    {
      if (v12)
      {
        uint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v33 = v13;
        __int16 v34 = 2048;
        uint64_t v35 = [v10 source];
        __int16 v36 = 2112;
        id v37 = v5;
        uint64_t v14 = "%{public}@[NFC %lu] XPC Error event: %@";
        v15 = v11;
        uint32_t v16 = 32;
        goto LABEL_11;
      }
    }
    else if (v12)
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      __int16 v34 = 2048;
      uint64_t v35 = [v10 source];
      uint64_t v14 = "%{public}@[NFC %lu] unhandled xpc event type";
      v15 = v11;
      uint32_t v16 = 22;
LABEL_11:
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    }
    v26 = (void *)v9;
LABEL_13:
    goto LABEL_14;
  }
  v17 = (void *)MEMORY[0x1D944E080]();
  id v18 = v4;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v33 = v20;
    __int16 v34 = 2048;
    uint64_t v35 = [v18 source];
    _os_log_impl(&dword_1D4758000, v19, OS_LOG_TYPE_INFO, "%{public}@[NFC %lu] XPC Dictionary event", buf, 0x16u);
  }
  string = xpc_dictionary_get_string(v5, (const char *)[@"Payload" UTF8String]);
  if (!string)
  {
    uint64_t v27 = MEMORY[0x1D944E080]();
    id v28 = v18;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      uint64_t v31 = [v28 source];
      *(_DWORD *)buf = 138543618;
      v33 = v30;
      __int16 v34 = 2048;
      uint64_t v35 = v31;
      _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_ERROR, "%{public}@[NFC %lu] XPC Error event - no payload dictionary entry", buf, 0x16u);
    }
    v26 = (void *)v27;
    goto LABEL_13;
  }
  v22 = string;
  v23 = [v18 readerStream];
  uint64_t v24 = [v18 source];
  v25 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v22);
  [v23 nfcStreamIndicationFromSource:v24 withPayload:v25];

LABEL_14:
}

- (id)initReaderWithStream:(id)a3 fromSource:(unint64_t)a4 workQueue:(id)a5 readerStream:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HAPNFCReaderXPC;
  uint64_t v13 = [(HAPNFCReaderXPC *)&v16 init];
  uint64_t v14 = v13;
  if (v13)
  {
    [(HAPNFCReaderXPC *)v13 setStream:v10];
    [(HAPNFCReaderXPC *)v14 setSource:a4];
    [(HAPNFCReaderXPC *)v14 setWorkQueue:v11];
    [(HAPNFCReaderXPC *)v14 setReaderStream:v12];
  }

  return v14;
}

@end