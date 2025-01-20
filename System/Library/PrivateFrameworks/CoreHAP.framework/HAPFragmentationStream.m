@interface HAPFragmentationStream
+ (id)fragmentationPacketsForData:(id)a3 maxLength:(unint64_t)a4 transactionIdentifier:(unsigned __int16)a5;
- (BOOL)__isTransactionCompleteWithTransactionIdentifier:(unsigned __int16)a3;
- (HAPFragmentationStream)init;
- (HAPFragmentationStreamDelegate)delegate;
- (NSMutableOrderedSet)pendingPackets;
- (NSNumber)currentPacketTransactionIdentifier;
- (OS_dispatch_queue)clientQueue;
- (id)__filteredPacketsWithTransactionIdentifier:(unsigned __int16)a3;
- (id)__transactionDataWithTransactionIdentifier:(unsigned __int16)a3;
- (void)__addFragmentationPacket:(id)a3;
- (void)__removeAllPendingPacketsWithTransactionIdentifier:(unsigned __int16)a3;
- (void)close;
- (void)receivedFragmentedPacket:(id)a3;
- (void)setCurrentPacketTransactionIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HAPFragmentationStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPacketTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingPackets, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCurrentPacketTransactionIdentifier:(id)a3
{
}

- (NSNumber)currentPacketTransactionIdentifier
{
  return self->_currentPacketTransactionIdentifier;
}

- (NSMutableOrderedSet)pendingPackets
{
  return self->_pendingPackets;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setDelegate:(id)a3
{
}

- (HAPFragmentationStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPFragmentationStreamDelegate *)WeakRetained;
}

- (void)__removeAllPendingPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v7 = [(HAPFragmentationStream *)self pendingPackets];
  v5 = [(HAPFragmentationStream *)self __filteredPacketsWithTransactionIdentifier:v3];
  v6 = [v5 array];
  [v7 removeObjectsInArray:v6];
}

- (void)__addFragmentationPacket:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v5 = [(HAPFragmentationStream *)self pendingPackets];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __51__HAPFragmentationStream___addFragmentationPacket___block_invoke;
  v11 = &unk_1E69F22D0;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  [v5 enumerateObjectsUsingBlock:&v8];

  id v7 = [(HAPFragmentationStream *)self pendingPackets];
  [v7 insertObject:v6 atIndex:v15[3]];

  _Block_object_dispose(&v14, 8);
}

void __51__HAPFragmentationStream___addFragmentationPacket___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v7 = [*(id *)(a1 + 32) transactionIdentifier];
  if (v7 == [v9 transactionIdentifier]
    && (unsigned int v8 = [*(id *)(a1 + 32) offset], v8 < objc_msgSend(v9, "offset")))
  {
    *a4 = 1;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 + 1;
  }
}

- (id)__filteredPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  id v4 = [(HAPFragmentationStream *)self pendingPackets];
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"transactionIdentifier == %u", v3);
  id v6 = [v4 filteredOrderedSetUsingPredicate:v5];

  return v6;
}

- (BOOL)__isTransactionCompleteWithTransactionIdentifier:(unsigned __int16)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(HAPFragmentationStream *)self __filteredPacketsWithTransactionIdentifier:a3];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      int v7 = 0;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v10, "offset", (void)v16) != v7)
          {

            goto LABEL_12;
          }
          v11 = [v10 data];
          v7 += [v11 length];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    else
    {
      int v7 = 0;
    }

    v13 = [v4 firstObject];
    int v14 = [v13 length];

    BOOL v12 = v7 == v14;
  }
  else
  {
LABEL_12:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)__transactionDataWithTransactionIdentifier:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = -[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:");
  if ([v4 count])
  {
    uint64_t v5 = [v4 firstObject];
    unsigned int v6 = [v5 length];

    int v7 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v6];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          int v14 = objc_msgSend(v13, "offset", (void)v30);
          if ([v7 length] != v14)
          {
            long long v17 = (void *)MEMORY[0x1D944E080]();
            long long v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              long long v19 = HMFGetLogIdentifier();
              int v20 = [v13 offset];
              uint64_t v21 = [v7 length];
              *(_DWORD *)buf = 138543874;
              v35 = v19;
              __int16 v36 = 1024;
              *(_DWORD *)v37 = v20;
              *(_WORD *)&v37[4] = 2048;
              *(void *)&v37[6] = v21;
              _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Packet with offset %u does not match current offset %tu", buf, 0x1Cu);
            }

            goto LABEL_21;
          }
          v15 = [v13 data];
          [v7 appendData:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    if ([v7 length] == v6)
    {
      id v16 = v7;
    }
    else
    {
      v25 = (void *)MEMORY[0x1D944E080]();
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = HMFGetLogIdentifier();
        uint64_t v28 = [v7 length];
        *(_DWORD *)buf = 138543874;
        v35 = v27;
        __int16 v36 = 2048;
        *(void *)v37 = v28;
        *(_WORD *)&v37[8] = 1024;
        *(_DWORD *)&v37[10] = v6;
        _os_log_impl(&dword_1D4758000, v26, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Final payload length, %tu, doesn't match expected payload length, %u", buf, 0x1Cu);
      }
LABEL_21:
      id v16 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D944E080]();
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v3;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] No packets matching transaction %u", buf, 0x12u);
    }
    id v16 = 0;
  }

  return v16;
}

- (void)receivedFragmentedPacket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HAPFragmentationStream *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HAPFragmentationStream_receivedFragmentedPacket___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__HAPFragmentationStream_receivedFragmentedPacket___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentPacketTransactionIdentifier];
  if (v2)
  {
    int v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) currentPacketTransactionIdentifier];
    int v5 = [v4 unsignedCharValue];
    int v6 = [*(id *)(a1 + 40) transactionIdentifier];

    if (v6 != v5)
    {
      int v7 = *(void **)(a1 + 32);
      id v8 = [v7 currentPacketTransactionIdentifier];
      objc_msgSend(v7, "__removeAllPendingPacketsWithTransactionIdentifier:", objc_msgSend(v8, "unsignedCharValue"));

      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6723 userInfo:0];
      uint64_t v10 = [*(id *)(a1 + 32) delegate];
      uint64_t v11 = *(void **)(a1 + 32);
      BOOL v12 = [v11 currentPacketTransactionIdentifier];
      objc_msgSend(v10, "fragmentationStream:didReceiveData:transactionIdentifier:error:", v11, 0, objc_msgSend(v12, "unsignedCharValue"), v9);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "__addFragmentationPacket:", *(void *)(a1 + 40));
  int v13 = objc_msgSend(*(id *)(a1 + 32), "__isTransactionCompleteWithTransactionIdentifier:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
  int v14 = *(void **)(a1 + 32);
  if (v13)
  {
    v15 = objc_msgSend(v14, "__transactionDataWithTransactionIdentifier:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
    if (v15)
    {
      id v17 = 0;
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6732 userInfo:0];
    }
    id v16 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v16, "fragmentationStream:didReceiveData:transactionIdentifier:error:", *(void *)(a1 + 32), v15, objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"), v17);

    [*(id *)(a1 + 32) setCurrentPacketTransactionIdentifier:0];
    objc_msgSend(*(id *)(a1 + 32), "__removeAllPendingPacketsWithTransactionIdentifier:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(a1 + 40), "transactionIdentifier"));
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCurrentPacketTransactionIdentifier:");
  }
}

- (void)close
{
  int v3 = [(HAPFragmentationStream *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__HAPFragmentationStream_close__block_invoke;
  block[3] = &unk_1E69F4330;
  block[4] = self;
  dispatch_async(v3, block);
}

void __31__HAPFragmentationStream_close__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HAPErrorDomain" code:-6752 userInfo:0];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 fragmentationStream:*(void *)(a1 + 32) didCloseWithError:v3];
}

- (HAPFragmentationStream)init
{
  v11.receiver = self;
  v11.super_class = (Class)HAPFragmentationStream;
  uint64_t v2 = [(HAPFragmentationStream *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    id v4 = (const char *)HAPDispatchQueueName(v2, 0);
    int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v6;

    id v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    pendingPackets = v3->_pendingPackets;
    v3->_pendingPackets = v8;
  }
  return v3;
}

+ (id)fragmentationPacketsForData:(id)a3 maxLength:(unint64_t)a4 transactionIdentifier:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = [v7 length];
  if (!a4 || (unint64_t v9 = v8) == 0)
  {
    uint64_t v14 = MEMORY[0x1D944E080](v8);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v30 = 138543874;
      long long v31 = v16;
      __int16 v32 = 2048;
      *(void *)long long v33 = [v7 length];
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = a4;
      _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Cannot create fragmented packet with length '%tu', max length '%tu'", (uint8_t *)&v30, 0x20u);
    }
    int v13 = (void *)v14;
    goto LABEL_10;
  }
  if (HIDWORD(v8))
  {
    uint64_t v10 = MEMORY[0x1D944E080]();
    objc_super v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = HMFGetLogIdentifier();
      int v30 = 138543874;
      long long v31 = v12;
      __int16 v32 = 1024;
      *(_DWORD *)long long v33 = -1;
      *(_WORD *)&v33[4] = 2048;
      *(void *)&v33[6] = v9;
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Data cannot be larger than %u, is %tu", (uint8_t *)&v30, 0x1Cu);
    }
    int v13 = (void *)v10;
LABEL_10:
    id v17 = 0;
    goto LABEL_22;
  }
  unint64_t v18 = a4 - 12;
  long long v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(a4 + v8 - 13) / (a4 - 12)];
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  while (1)
  {
    unint64_t v22 = v9 - v20 >= v18 ? v18 : v9 - v20;
    v23 = [HAPFragmentationPacket alloc];
    v24 = objc_msgSend(v7, "subdataWithRange:", v20, v22);
    v25 = [(HAPFragmentationPacket *)v23 initWithData:v24 transactionIdentifier:v5 length:v9 offset:v21];

    if (!v25) {
      break;
    }
    [v19 addObject:v25];

    uint64_t v20 = (v21 + v18);
    uint64_t v21 = v20;
    if (v20 >= v9)
    {
      id v17 = v19;
      goto LABEL_21;
    }
  }
  v26 = (void *)MEMORY[0x1D944E080]();
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = HMFGetLogIdentifier();
    int v30 = 138543618;
    long long v31 = v28;
    __int16 v32 = 1024;
    *(_DWORD *)long long v33 = v21;
    _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Failed to create packet for remaining data at offset %u", (uint8_t *)&v30, 0x12u);
  }
  id v17 = 0;
LABEL_21:

LABEL_22:

  return v17;
}

@end