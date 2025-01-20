@interface HMDDataStreamStreamProtocol
+ (id)protocolName;
- (BOOL)isActive;
- (HMDDataStreamProtocolDelegate)dataStream;
- (HMDDataStreamStreamProtocol)initWithDataStream:(id)a3;
- (NSMapTable)sockets;
- (void)_closeAllSocketsWithError:(id)a3;
- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3;
- (void)_reevaluateTrafficClassForDataStream;
- (void)dataStream:(id)a3 didFailWithError:(id)a4;
- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6;
- (void)dataStreamDidClose:(id)a3;
- (void)dataStreamInitiatedClose:(id)a3;
- (void)registerSocket:(id)a3;
- (void)sendData:(id)a3 socket:(id)a4 completion:(id)a5;
- (void)unregisterSocket:(id)a3;
@end

@implementation HMDDataStreamStreamProtocol

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStream);
  objc_storeStrong((id *)&self->_sockets, 0);
}

- (HMDDataStreamProtocolDelegate)dataStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataStream);
  return (HMDDataStreamProtocolDelegate *)WeakRetained;
}

- (NSMapTable)sockets
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)_closeAllSocketsWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDDataStreamStreamProtocol *)self sockets];
  v6 = [v5 objectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        if (v11) {
          [v11 closeWithError:v4];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12 = [(HMDDataStreamStreamProtocol *)self sockets];
  [v12 removeAllObjects];
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = (void *)MEMORY[0x230FBD990]();
  long long v15 = self;
  long long v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    int v18 = 138544130;
    v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support response message with topic=%@, header=%@, payload=%@", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = (void *)MEMORY[0x230FBD990]();
  long long v15 = self;
  long long v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = HMFGetLogIdentifier();
    int v18 = 138544130;
    v19 = v17;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v13;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Stream protocol does not support request message with topic=%@, header=%@, payload=%@", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)dataStream:(id)a3 didReceiveEvent:(id)a4 header:(id)a5 payload:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(HMDDataStreamStreamProtocol *)self sockets];
  long long v15 = [v14 objectForKey:v11];

  if (!v15)
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v21 = HMFGetLogIdentifier();
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v22 = "%{public}@No active socket, dropping packet with topic=%@ payload=%@";
      id v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl(&dword_22F52A000, v23, v24, v22, (uint8_t *)&v25, 0x20u);
    }
LABEL_9:

    goto LABEL_10;
  }
  long long v16 = [v13 objectForKeyedSubscript:@"data"];

  if (!v16)
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = HMFGetLogIdentifier();
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      id v30 = v13;
      __int16 v22 = "%{public}@No data field in payload, dropping packet with topic=%@ payload=%@";
      id v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v17 = [v13 objectForKeyedSubscript:@"data"];
  [v15 handleIncomingData:v17];

LABEL_10:
}

- (void)dataStream:(id)a3 didFailWithError:(id)a4
{
}

- (void)dataStreamDidClose:(id)a3
{
}

- (void)dataStreamInitiatedClose:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(HMDDataStreamStreamProtocol *)self sockets];
  id v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) closeInitiated];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)isActive
{
  v2 = [(HMDDataStreamStreamProtocol *)self sockets];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)sendData:(id)a3 socket:(id)a4 completion:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = [(HMDDataStreamStreamProtocol *)self dataStream];
  long long v12 = [v9 applicationProtocolName];

  v17 = @"data";
  v18[0] = v10;
  id v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__HMDDataStreamStreamProtocol_sendData_socket_completion___block_invoke;
  v15[3] = &unk_264A2E288;
  id v16 = v8;
  id v14 = v8;
  [v11 sendEventForProtocol:@"stream" topic:v12 payload:v13 completion:v15];
}

uint64_t __58__HMDDataStreamStreamProtocol_sendData_socket_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_notifyActiveStatusChangedFromPreviousValue:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(HMDDataStreamStreamProtocol *)self isActive] != a3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    uint64_t v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      [(HMDDataStreamStreamProtocol *)v5 isActive];
      id v8 = HMFBooleanToString();
      int v10 = 138543618;
      long long v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Stream protocol changes active to %@", (uint8_t *)&v10, 0x16u);
    }
    id v9 = [(HMDDataStreamStreamProtocol *)v5 dataStream];
    [v9 protocolDidUpdateActiveStatus:v5];
  }
}

- (void)_reevaluateTrafficClassForDataStream
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v3 = [(NSMapTable *)self->_sockets objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        int v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        unint64_t v11 = [v10 trafficClass];
        if (v11 > v7)
        {
          unint64_t v12 = v11;
          uint64_t v13 = [v10 applicationProtocolName];

          uint64_t v6 = (void *)v13;
          unint64_t v7 = v12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v5);

    if (v6)
    {
      uint64_t v14 = (void *)MEMORY[0x230FBD990]();
      long long v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v17;
        __int16 v27 = 2048;
        unint64_t v28 = v7;
        __int16 v29 = 2112;
        id v30 = v6;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (requested by: '%@')", buf, 0x20u);
      }
      goto LABEL_17;
    }
  }
  else
  {

    unint64_t v7 = 0;
  }
  uint64_t v14 = (void *)MEMORY[0x230FBD990]();
  int v18 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = v19;
    __int16 v27 = 2048;
    unint64_t v28 = v7;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Setting data stream's traffic class to %lu (reset)", buf, 0x16u);
  }
  uint64_t v6 = 0;
LABEL_17:

  __int16 v20 = [(HMDDataStreamStreamProtocol *)self dataStream];
  [v20 setTrafficClass:v7];
}

- (void)unregisterSocket:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(HMDDataStreamStreamProtocol *)self isActive];
  uint64_t v5 = [(HMDDataStreamStreamProtocol *)self sockets];
  uint64_t v6 = [v10 applicationProtocolName];
  id v7 = [v5 objectForKey:v6];

  if (v7 == v10)
  {
    uint64_t v8 = [(HMDDataStreamStreamProtocol *)self sockets];
    id v9 = [v10 applicationProtocolName];
    [v8 removeObjectForKey:v9];

    [(HMDDataStreamStreamProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v4];
    [(HMDDataStreamStreamProtocol *)self _reevaluateTrafficClassForDataStream];
  }
}

- (void)registerSocket:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDDataStreamStreamProtocol *)self isActive];
  uint64_t v6 = [(HMDDataStreamStreamProtocol *)self sockets];
  id v7 = [v4 applicationProtocolName];
  id v11 = [v6 objectForKey:v7];

  uint64_t v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:12];
  [v11 closeWithError:v8];

  id v9 = [(HMDDataStreamStreamProtocol *)self sockets];
  id v10 = [v4 applicationProtocolName];
  [v9 setObject:v4 forKey:v10];

  [(HMDDataStreamStreamProtocol *)self _notifyActiveStatusChangedFromPreviousValue:v5];
}

- (HMDDataStreamStreamProtocol)initWithDataStream:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDDataStreamStreamProtocol;
  BOOL v5 = [(HMDDataStreamStreamProtocol *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    sockets = v5->_sockets;
    v5->_sockets = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_dataStream, v4);
  }

  return v5;
}

+ (id)protocolName
{
  v2 = @"stream";
  return @"stream";
}

@end