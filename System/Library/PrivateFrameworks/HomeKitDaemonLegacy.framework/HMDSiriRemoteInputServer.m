@interface HMDSiriRemoteInputServer
- (BOOL)registerSiriSession:(id)a3;
- (HMDSiriRemoteInputServer)initWithQueue:(id)a3;
- (NSHashTable)siriSessions;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcConnection;
- (OS_xpc_object)xpcServer;
- (id)sessionForIdentifier:(id)a3;
- (void)dealloc;
- (void)deregisterSiriSession:(id)a3;
- (void)handleCheckInMsg:(id)a3;
- (void)handleConnection:(id)a3;
- (void)handleConnectionEvent:(id)a3;
- (void)handleDisconnection;
- (void)handleMsg:(id)a3;
- (void)handleServerEvent:(id)a3;
- (void)handleStartStreamMsg:(id)a3 args:(id)a4;
- (void)handleStopStreamMsg:(id)a3;
- (void)invalidate;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4;
- (void)setQueue:(id)a3;
- (void)setSiriSessions:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcServer:(id)a3;
@end

@implementation HMDSiriRemoteInputServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriSessions, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpcServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSiriSessions:(id)a3
{
}

- (NSHashTable)siriSessions
{
  return self->_siriSessions;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcServer:(id)a3
{
}

- (OS_xpc_object)xpcServer
{
  return self->_xpcServer;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)sessionForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(HMDSiriRemoteInputServer *)self siriSessions];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identifier];
        char v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)handleStopStreamMsg:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"kMsgArgIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v8 = [(HMDSiriRemoteInputServer *)self sessionForIdentifier:v6];

  uint64_t v7 = v8;
  if (v8)
  {
    [v8 handleStopStream];
    uint64_t v7 = v8;
  }
}

- (void)handleStartStreamMsg:(id)a3 args:(id)a4
{
  id v10 = a3;
  id v6 = [a4 objectForKeyedSubscript:@"kMsgArgIdentifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  v9 = [(HMDSiriRemoteInputServer *)self sessionForIdentifier:v8];

  if (v9)
  {
    [v9 handleStartStream];
    [v9 setBoostMessage:v10];
  }
}

- (void)handleCheckInMsg:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Siri checked in", (uint8_t *)&v9, 0xCu);
  }
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = v6;
  xpc_dictionary_set_string(v8, "kMsgId", (const char *)[v9 UTF8String]);
  if (v7)
  {
    id v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v8, "kMsgArgs", v10);
  }
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  long long v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    long long v14 = HMFGetLogIdentifier();
    long long v15 = [(HMDSiriRemoteInputServer *)v12 xpcConnection];
    int v17 = 138543874;
    uint64_t v18 = v14;
    __int16 v19 = 2048;
    v20 = v15;
    __int16 v21 = 2112;
    xpc_object_t v22 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending Siri XPC message to %p: %@", (uint8_t *)&v17, 0x20u);
  }
  long long v16 = [(HMDSiriRemoteInputServer *)v12 xpcConnection];
  xpc_connection_send_message(v16, v8);
}

- (void)sendMsgIfCheckedIn:(id)a3 args:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = [(HMDSiriRemoteInputServer *)self xpcConnection];

  if (v8)
  {
    [(HMDSiriRemoteInputServer *)self sendMsg:v6 args:v7];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = HMFGetLogIdentifier();
      int v13 = 138543362;
      long long v14 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Cannot send; no XPC client is checked in yet",
        (uint8_t *)&v13,
        0xCu);
    }
  }
}

- (void)handleMsg:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    xpc_object_t v8 = HMFGetLogIdentifier();
    id v9 = [(HMDSiriRemoteInputServer *)v6 xpcConnection];
    int v19 = 138543874;
    v20 = v8;
    __int16 v21 = 2048;
    xpc_object_t v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received Siri XPC message to %p: %@", (uint8_t *)&v19, 0x20u);
  }
  string = xpc_dictionary_get_string(v4, "kMsgId");
  uint64_t v11 = xpc_dictionary_get_value(v4, "kMsgArgs");
  v12 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  id v14 = v13;

  if (!strcmp(string, "CheckIn"))
  {
    [(HMDSiriRemoteInputServer *)v6 handleCheckInMsg:v14];
  }
  else if (!strcmp(string, "StartStream"))
  {
    [(HMDSiriRemoteInputServer *)v6 handleStartStreamMsg:v4 args:v14];
  }
  else if (!strcmp(string, "StopStream"))
  {
    [(HMDSiriRemoteInputServer *)v6 handleStopStreamMsg:v14];
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1D9452090]();
    long long v16 = v6;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2080;
      xpc_object_t v22 = string;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected message: '%s'", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (void)handleConnectionEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1D9452F20]();
  if (v5 != MEMORY[0x1E4F14590])
  {
    if (v5 == MEMORY[0x1E4F145A8])
    {
      if (v4 == (id)MEMORY[0x1E4F14528])
      {
        [(HMDSiriRemoteInputServer *)self handleDisconnection];
        goto LABEL_11;
      }
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      xpc_object_t v8 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      id v10 = "%{public}@Siri XPC connection error: %@";
    }
    else
    {
      id v6 = (void *)MEMORY[0x1D9452090]();
      id v7 = self;
      xpc_object_t v8 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      id v9 = HMFGetLogIdentifier();
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      id v14 = v4;
      id v10 = "%{public}@Unexpected Siri XPC connection event: %@";
    }
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v11, 0x16u);

    goto LABEL_10;
  }
  [(HMDSiriRemoteInputServer *)self handleMsg:v4];
LABEL_11:
}

- (void)handleDisconnection
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    id v7 = [(HMDSiriRemoteInputServer *)v4 xpcConnection];
    *(_DWORD *)buf = 138543618;
    v20 = v6;
    __int16 v21 = 2112;
    xpc_object_t v22 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Siri received disconnect on XPC connection: %@", buf, 0x16u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  xpc_object_t v8 = [(HMDSiriRemoteInputServer *)v4 siriSessions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v12++) handleResetStream];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(HMDSiriRemoteInputServer *)v4 setXpcConnection:0];
  __int16 v13 = [(HMDSiriRemoteInputServer *)v4 xpcServer];
  xpc_connection_resume(v13);
}

- (void)handleConnection:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (_xpc_connection_s *)a3;
  uint64_t v5 = (void *)xpc_connection_copy_entitlement_value();
  id v6 = v5;
  if (v5 && xpc_BOOL_get_value(v5))
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    xpc_object_t v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v32 = v10;
      __int16 v33 = 2048;
      v34 = v4;
      __int16 v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Siri received incoming XPC connection: %p %@", buf, 0x20u);
    }
    uint64_t v11 = [(HMDSiriRemoteInputServer *)v8 xpcServer];
    xpc_connection_suspend(v11);

    [(HMDSiriRemoteInputServer *)v8 setXpcConnection:v4];
    uint64_t v12 = [(HMDSiriRemoteInputServer *)v8 xpcConnection];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__HMDSiriRemoteInputServer_handleConnection___block_invoke;
    handler[3] = &unk_1E6A0BC70;
    handler[4] = v8;
    xpc_connection_set_event_handler(v12, handler);

    __int16 v13 = [(HMDSiriRemoteInputServer *)v8 xpcConnection];
    long long v14 = [(HMDSiriRemoteInputServer *)v8 queue];
    xpc_connection_set_target_queue(v13, v14);

    long long v15 = [(HMDSiriRemoteInputServer *)v8 xpcConnection];
    xpc_connection_resume(v15);

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v16 = [(HMDSiriRemoteInputServer *)v8 siriSessions];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * v20++) publish];
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v18);
    }
  }
  else
  {
    __int16 v21 = (void *)MEMORY[0x1D9452090]();
    xpc_object_t v22 = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v32 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Siri received incoming XPC connection but was not entitled; closing.",
        buf,
        0xCu);
    }
    xpc_connection_cancel(v4);
  }
}

uint64_t __45__HMDSiriRemoteInputServer_handleConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleConnectionEvent:a2];
}

- (void)handleServerEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MEMORY[0x1D9452F20]() == MEMORY[0x1E4F14578])
  {
    [(HMDSiriRemoteInputServer *)self handleConnection:v4];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      xpc_object_t v8 = HMFGetLogIdentifier();
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unexpected Siri XPC server event: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDSiriRemoteInputServer *)self siriSessions];
  id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  [(HMDSiriRemoteInputServer *)self setSiriSessions:v4];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HMDSiriRemoteInputServer deregisterSiriSession:](self, "deregisterSiriSession:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)deregisterSiriSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = [(HMDSiriRemoteInputServer *)self sessionForIdentifier:v5];

  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      long long v11 = HMFGetLogIdentifier();
      int v15 = 138543618;
      long long v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Deregistering session %@", (uint8_t *)&v15, 0x16u);
    }
    [v4 invalidate];
    long long v12 = [(HMDSiriRemoteInputServer *)v8 siriSessions];
    [v12 removeObject:v4];

    [v4 setServer:0];
  }
  else
  {
    if (v10)
    {
      long long v13 = HMFGetLogIdentifier();
      long long v14 = [v4 identifier];
      int v15 = 138543618;
      long long v16 = v13;
      __int16 v17 = 2112;
      id v18 = v14;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Session deregistration with identifier %@ but was not registered!", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (BOOL)registerSiriSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 identifier];
  uint64_t v6 = [(HMDSiriRemoteInputServer *)self sessionForIdentifier:v5];

  uint64_t v7 = (void *)MEMORY[0x1D9452090]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v11 = HMFGetLogIdentifier();
      long long v12 = [v4 identifier];
      int v16 = 138543618;
      __int16 v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Session with identifier %@ already exists!", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v13 = HMFGetLogIdentifier();
      int v16 = 138543618;
      __int16 v17 = v13;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering session %@", (uint8_t *)&v16, 0x16u);
    }
    [v4 setServer:v8];
    long long v14 = [(HMDSiriRemoteInputServer *)v8 siriSessions];
    [v14 addObject:v4];

    [v4 publish];
  }

  return v6 == 0;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint32_t v3 = notify_set_state(xpcServerNotifyToken, 0);
  if (v3)
  {
    uint32_t v4 = v3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v9 = v4;
      _os_log_impl(&dword_1D49D5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to set state to stopped (%d)", buf, 8u);
    }
  }
  uint32_t v5 = notify_post("com.apple.homekit.audio.running");
  if (v5)
  {
    uint32_t v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      uint32_t v9 = v6;
      _os_log_impl(&dword_1D49D5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to post (%d)", buf, 8u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)HMDSiriRemoteInputServer;
  [(HMDSiriRemoteInputServer *)&v7 dealloc];
}

- (HMDSiriRemoteInputServer)initWithQueue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint32_t v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HMDSiriRemoteInputServer;
  uint32_t v6 = [(HMDSiriRemoteInputServer *)&v25 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.homekit.audio.xpc", v5, 1uLL);
    xpcServer = v7->_xpcServer;
    v7->_xpcServer = mach_service;

    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = 0;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    siriSessions = v7->_siriSessions;
    v7->_siriSessions = (NSHashTable *)v11;

    long long v13 = [(HMDSiriRemoteInputServer *)v7 xpcServer];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__HMDSiriRemoteInputServer_initWithQueue___block_invoke;
    handler[3] = &unk_1E6A0BC70;
    long long v14 = v7;
    id v24 = v14;
    xpc_connection_set_event_handler(v13, handler);

    int v15 = [(HMDSiriRemoteInputServer *)v14 xpcServer];
    xpc_connection_resume(v15);

    if (xpcServerNotifyToken == -1)
    {
      uint32_t v21 = notify_register_check("com.apple.homekit.audio.running", &xpcServerNotifyToken);
      if (v21)
      {
        uint32_t v22 = v21;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          uint32_t v27 = v22;
          _os_log_impl(&dword_1D49D5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to retrieve token (%d)", buf, 8u);
        }
      }
    }
    uint32_t v16 = notify_set_state(xpcServerNotifyToken, 1uLL);
    if (v16)
    {
      uint32_t v17 = v16;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v27 = v17;
        _os_log_impl(&dword_1D49D5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to set state to ready (%d)", buf, 8u);
      }
    }
    uint32_t v18 = notify_post("com.apple.homekit.audio.running");
    if (v18)
    {
      uint32_t v19 = v18;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v27 = v19;
        _os_log_impl(&dword_1D49D5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Siri Server] Notify: failed to post (%d)", buf, 8u);
      }
    }
  }
  return v7;
}

uint64_t __42__HMDSiriRemoteInputServer_initWithQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleServerEvent:a2];
}

@end