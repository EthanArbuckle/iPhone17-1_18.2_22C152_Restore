@interface HMDDataStreamTCPSetupOperation
- (BOOL)_isComplete;
- (HAPSecuritySessionEncryption)sessionEncryption;
- (HMDDataStreamTCPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6;
- (HMFNetAddress)remoteNetAddress;
- (NSData)accessoryKeySalt;
- (NSData)controllerKeySalt;
- (id)_createTCPTransport;
- (id)_fullKeySalt;
- (int64_t)remoteTcpPort;
- (void)_finishStreamTransport;
- (void)_generateStreamKeys;
- (void)processTransportSetupResponse:(id)a3;
- (void)setAccessoryKeySalt:(id)a3;
- (void)setRemoteNetAddress:(id)a3;
- (void)setRemoteTcpPort:(int64_t)a3;
- (void)setSessionEncryption:(id)a3;
- (void)startSetup;
@end

@implementation HMDDataStreamTCPSetupOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionEncryption, 0);
  objc_storeStrong((id *)&self->_accessoryKeySalt, 0);
  objc_storeStrong((id *)&self->_controllerKeySalt, 0);
  objc_storeStrong((id *)&self->_remoteNetAddress, 0);
}

- (void)setSessionEncryption:(id)a3
{
}

- (HAPSecuritySessionEncryption)sessionEncryption
{
  return self->_sessionEncryption;
}

- (void)setRemoteTcpPort:(int64_t)a3
{
  self->_remoteTcpPort = a3;
}

- (int64_t)remoteTcpPort
{
  return self->_remoteTcpPort;
}

- (void)setAccessoryKeySalt:(id)a3
{
}

- (NSData)accessoryKeySalt
{
  return self->_accessoryKeySalt;
}

- (NSData)controllerKeySalt
{
  return self->_controllerKeySalt;
}

- (void)setRemoteNetAddress:(id)a3
{
}

- (HMFNetAddress)remoteNetAddress
{
  return self->_remoteNetAddress;
}

- (void)_finishStreamTransport
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDDataStreamTCPSetupOperation *)self _isComplete];
  v4 = (void *)MEMORY[0x1D9452090]();
  v5 = self;
  v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      v8 = HMFGetLogIdentifier();
      int v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] DataStream configuration valid; starting stream",
        (uint8_t *)&v15,
        0xCu);
    }
    v9 = [(HMDDataStreamTCPSetupOperation *)v5 _createTCPTransport];
    v10 = [(HMDDataStreamTCPSetupOperation *)v5 sessionEncryption];
    [(HMDDataStreamSetupOperation *)v5 postDidSucceedWithTransport:v9 sessionEncryption:v10];
  }
  else
  {
    if (v7)
    {
      v11 = HMFGetLogIdentifier();
      BOOL v12 = [(HMDDataStreamTCPSetupOperation *)v5 remoteTcpPort] != 0;
      v13 = [(HMDDataStreamTCPSetupOperation *)v5 remoteNetAddress];
      v14 = [(HMDDataStreamTCPSetupOperation *)v5 sessionEncryption];
      int v15 = 138544130;
      v16 = v11;
      __int16 v17 = 1024;
      BOOL v18 = v12;
      __int16 v19 = 1024;
      BOOL v20 = v13 != 0;
      __int16 v21 = 1024;
      BOOL v22 = v14 != 0;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] Setup still in progress (hasPort=%d, hasHostname=%d, hasEnc=%d)", (uint8_t *)&v15, 0x1Eu);
    }
  }
}

- (id)_createTCPTransport
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDDataStreamSetupOperation *)self accessory];
  v4 = [v3 siriEndpointProfile];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    v6 = self;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      int v19 = 138543362;
      BOOL v20 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[Start Stream] Accessory is a Siri endpoint, creating transport with elevated scheduling mode", (uint8_t *)&v19, 0xCu);
    }
    v9 = [HMDDataStreamTCPTransport alloc];
    v10 = [(HMDDataStreamTCPSetupOperation *)v6 remoteNetAddress];
    uint64_t v11 = [(HMDDataStreamTCPSetupOperation *)v6 remoteTcpPort];
    BOOL v12 = [(HMDDataStreamSetupOperation *)v6 queue];
    v13 = [(HMDDataStreamSetupOperation *)v6 logIdentifier];
    uint64_t v14 = [(HMDDataStreamTCPTransport *)v9 initWithAddress:v10 port:v11 targetQueue:v12 logIdentifier:v13];
  }
  else
  {
    int v15 = [HMDDataStreamTCPTransport alloc];
    v10 = [(HMDDataStreamTCPSetupOperation *)self remoteNetAddress];
    int64_t v16 = [(HMDDataStreamTCPSetupOperation *)self remoteTcpPort];
    BOOL v12 = [(HMDDataStreamSetupOperation *)self queue];
    v13 = [(HMDDataStreamSetupOperation *)self logIdentifier];
    uint64_t v14 = [(HMDDataStreamTCPTransport *)v15 initWithAddress:v10 port:v16 workQueue:v12 logIdentifier:v13];
  }
  __int16 v17 = (void *)v14;

  return v17;
}

- (void)_generateStreamKeys
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDDataStreamSetupOperation *)self accessory];
  v4 = [v3 anyIPServer];

  if (v4)
  {
    objc_initWeak(location, self);
    v5 = [(HMDDataStreamTCPSetupOperation *)self _fullKeySalt];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__HMDDataStreamTCPSetupOperation__generateStreamKeys__block_invoke;
    v11[3] = &unk_1E6A08108;
    objc_copyWeak(&v12, location);
    [v4 createKeysForDataStreamWithKeySalt:v5 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(location);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    BOOL v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; device appears to have lost IP-connectivity",
        (uint8_t *)location,
        0xCu);
    }
    v10 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [(HMDDataStreamSetupOperation *)v7 postDidFailWithError:v10];
  }
}

void __53__HMDDataStreamTCPSetupOperation__generateStreamKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = WeakRetained;
    v10 = HMFGetOSLogHandle();
    uint64_t v11 = v10;
    if (!v5 || v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        int v14 = 138543618;
        int v15 = v13;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create secure session for the accessory (%@)", (uint8_t *)&v14, 0x16u);
      }
      if (!v6)
      {
        id v6 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
      }
      [v9 postDidFailWithError:v6];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v12 = HMFGetLogIdentifier();
        int v14 = 138543618;
        int v15 = v12;
        __int16 v16 = 2112;
        id v17 = v5;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] Key creation succeeded; will use session encryption %@",
          (uint8_t *)&v14,
          0x16u);
      }
      [v9 setSessionEncryption:v5];
      [v9 _finishStreamTransport];
      id v6 = 0;
    }
  }
}

- (void)processTransportSetupResponse:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 accessoryKeySalt];

  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v19 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v19;
      BOOL v20 = "%{public}@[Start Stream] The setup transfer write reply did not contain key information";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v22, 0xCu);
    }
LABEL_11:

    uint64_t v21 = [MEMORY[0x1E4F28C58] hmErrorWithCode:50];
    [(HMDDataStreamSetupOperation *)v9 postDidFailWithError:v21];

    goto LABEL_12;
  }
  id v6 = [v4 parameters];
  BOOL v7 = [v6 tcpListeningPort];

  v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  v10 = HMFGetOSLogHandle();
  uint64_t v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v19 = HMFGetLogIdentifier();
      int v22 = 138543362;
      uint64_t v23 = v19;
      BOOL v20 = "%{public}@[Start Stream] The setup transfer write reply did not contain a TCP port";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v12 = HMFGetLogIdentifier();
    v13 = [v4 parameters];
    int v14 = [v13 tcpListeningPort];
    int v22 = 138543618;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[Start Stream] The setup transfer succeeded; will use port %@",
      (uint8_t *)&v22,
      0x16u);
  }
  int v15 = [v4 parameters];
  __int16 v16 = [v15 tcpListeningPort];
  id v17 = [v16 value];
  -[HMDDataStreamTCPSetupOperation setRemoteTcpPort:](v9, "setRemoteTcpPort:", [v17 integerValue]);

  uint64_t v18 = [v4 accessoryKeySalt];
  [(HMDDataStreamTCPSetupOperation *)v9 setAccessoryKeySalt:v18];

  [(HMDDataStreamTCPSetupOperation *)v9 _generateStreamKeys];
LABEL_12:
}

- (void)startSetup
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDDataStreamSetupOperation *)self accessory];
  id v4 = [v3 anyIPServer];

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  BOOL v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating new DataStream using TCP", buf, 0xCu);
    }
    v10 = [(HMDDataStreamTCPSetupOperation *)v6 controllerKeySalt];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F5BCF8]) initWithValue:0];
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F5BD08]) initWithValue:0];
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F5BD10]) initWithCommand:v11 transportType:v12 controllerKeySalt:v10];

    id v30 = 0;
    v13 = [v26 serializeWithError:&v30];
    id v14 = v30;
    if (v13)
    {
      int v15 = [(HMDDataStreamSetupOperation *)v6 transferManagementService];
      __int16 v16 = [v15 findCharacteristicWithType:@"00000131-0000-1000-8000-0026BB765291"];

      id v17 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v16 value:v13 authorizationData:0 type:0];
      objc_initWeak((id *)buf, v6);
      uint64_t v18 = [(HMDDataStreamSetupOperation *)v6 accessory];
      v31 = v17;
      int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      BOOL v20 = [(HMDDataStreamSetupOperation *)v6 queue];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __44__HMDDataStreamTCPSetupOperation_startSetup__block_invoke;
      v27[3] = &unk_1E6A191F8;
      objc_copyWeak(&v29, (id *)buf);
      id v28 = v4;
      [v18 writeCharacteristicValues:v19 source:7 queue:v20 completionHandler:v27];

      [(HMDDataStreamTCPSetupOperation *)v6 _finishStreamTransport];
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      int v22 = (void *)MEMORY[0x1D9452090]();
      uint64_t v23 = v6;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        __int16 v34 = 2112;
        id v35 = v14;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; cannot serialize request (%@)",
          buf,
          0x16u);
      }
      [(HMDDataStreamSetupOperation *)v23 postDidFailWithError:v14];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; does not appear to be IP-connected",
        buf,
        0xCu);
    }
    id v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
    [(HMDDataStreamSetupOperation *)v6 postDidFailWithError:v14];
  }
}

void __44__HMDDataStreamTCPSetupOperation_startSetup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) peerAddressEx];
    [WeakRetained setRemoteNetAddress:v5];

    id v6 = [WeakRetained remoteNetAddress];

    if (v6)
    {
      [WeakRetained continueStreamSetupWithResponse:v3];
    }
    else
    {
      BOOL v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = WeakRetained;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        int v13 = 138543362;
        id v14 = v10;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new DataStream; invalid IP address",
          (uint8_t *)&v13,
          0xCu);
      }
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v12 = (void *)[v11 initWithDomain:*MEMORY[0x1E4F2D140] code:54 userInfo:0];
      [v8 postDidFailWithError:v12];
    }
  }
}

- (id)_fullKeySalt
{
  id v3 = [(HMDDataStreamTCPSetupOperation *)self controllerKeySalt];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(HMDDataStreamTCPSetupOperation *)self accessoryKeySalt];
  [v4 appendData:v5];

  id v6 = (void *)[v4 copy];
  return v6;
}

- (BOOL)_isComplete
{
  id v3 = [(HMDDataStreamTCPSetupOperation *)self remoteNetAddress];
  if (v3 && [(HMDDataStreamTCPSetupOperation *)self remoteTcpPort])
  {
    id v4 = [(HMDDataStreamTCPSetupOperation *)self sessionEncryption];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (HMDDataStreamTCPSetupOperation)initWithAccessory:(id)a3 queue:(id)a4 logIdentifier:(id)a5 transferManagementService:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HMDDataStreamTCPSetupOperation;
  id v6 = [(HMDDataStreamSetupOperation *)&v10 initWithAccessory:a3 queue:a4 logIdentifier:a5 transferManagementService:a6];
  if (v6)
  {
    uint64_t v7 = HMFRandomDataWithLength();
    controllerKeySalt = v6->_controllerKeySalt;
    v6->_controllerKeySalt = (NSData *)v7;
  }
  return v6;
}

@end