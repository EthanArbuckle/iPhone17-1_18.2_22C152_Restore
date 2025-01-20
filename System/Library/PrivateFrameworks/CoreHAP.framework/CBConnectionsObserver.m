@interface CBConnectionsObserver
+ (void)initialize;
- (ATVModel)model;
- (BOOL)attachSessionWithError:(id *)a3;
- (BOOL)cleanupWithError:(id *)a3;
- (BOOL)hasStarted;
- (CBCentralManager)central;
- (CBConnectionsObserver)initWithCentralManager:(id)a3 Queue:(id)a4 Error:(id *)a5;
- (OS_dispatch_queue)dispatchQueue;
- (id)getStatus;
- (int)getAvailableHAPConnections;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)setCentral:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setModel:(id)a3;
- (void)updateBleStatus:(BTRemoteContext *)a3;
@end

@implementation CBConnectionsObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_dispatchQueue);

  objc_storeStrong((id *)&self->_central, 0);
}

- (void)setModel:(id)a3
{
}

- (ATVModel)model
{
  return (ATVModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setCentral:(id)a3
{
}

- (CBCentralManager)central
{
  return (CBCentralManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D944E080]();
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = HMFGetLogIdentifier();
    v8 = (void *)cbManagerState2String;
    v9 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v4, "state"));
    v10 = [v8 objectForKeyedSubscript:v9];
    *(_DWORD *)buf = 138543874;
    v20 = v7;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = [v4 state];
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] centralManagerDidUpdateState state %@ (%ld)", buf, 0x20u);
  }
  if ([v4 state] == 5)
  {
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] centralManagerDidUpdateState trying to (re)attach MobileBluetooth session", buf, 0xCu);
    }
    id v18 = 0;
    [(CBConnectionsObserver *)self attachSessionWithError:&v18];
    id v14 = v18;
    if (v14)
    {
      v15 = (void *)MEMORY[0x1D944E080]();
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        __int16 v21 = 2112;
        id v22 = v14;
        _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] centralManagerDidUpdateState failed to (re)attach MobileBluetooth session, error :%@", buf, 0x16u);
      }
    }
  }
}

- (void)updateBleStatus:(BTRemoteContext *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  a3->var6.unint64_t lowEnergyConnections = 0;
  uint64_t v5 = [(CBConnectionsObserver *)self central];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(CBConnectionsObserver *)self central];
    uint64_t v8 = [v7 state];

    if (v8 == 5)
    {
      v9 = [(CBConnectionsObserver *)self central];
      v10 = [v9 retrieveConnectedPeripheralsWithServices:MEMORY[0x1E4F1CBF0] allowAll:1];

      a3->var6.unint64_t lowEnergyConnections = (int)[v10 count];
      if (a3->var5.var0)
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v27 = v10;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              v17 = (void *)MEMORY[0x1D944E080]();
              id v18 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v33 = v19;
                __int16 v34 = 2112;
                unint64_t v35 = (unint64_t)v16;
                _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBleStatus device %@", buf, 0x16u);
              }
              if ([v16 hasTag:@"FastConnection"])
              {
                ++a3->var6.leRemote;
                v20 = (void *)MEMORY[0x1D944E080]();
                __int16 v21 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  id v22 = HMFGetLogIdentifier();
                  *(_DWORD *)buf = 138543362;
                  v33 = v22;
                  _os_log_impl(&dword_1D4758000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBleStatus found a LE Remote", buf, 0xCu);
                }
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v13);
        }

        v10 = v27;
      }
      __int16 v23 = (void *)MEMORY[0x1D944E080]();
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        unint64_t lowEnergyConnections = a3->var6.lowEnergyConnections;
        *(_DWORD *)buf = 138543618;
        v33 = v25;
        __int16 v34 = 2048;
        unint64_t v35 = lowEnergyConnections;
        _os_log_impl(&dword_1D4758000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBleStatus found connected BLE devices: %ld", buf, 0x16u);
      }
    }
  }
}

- (id)getStatus
{
  return 0;
}

- (int)getAvailableHAPConnections
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (![(CBConnectionsObserver *)self hasStarted]) {
    return 0;
  }
  *(_DWORD *)((char *)&qword_1EA706418 + 7) = 0;
  xmmword_1EA706400 = 0u;
  *(_OWORD *)&qword_1EA706410 = 0u;
  xmmword_1EA7063E0 = 0u;
  *(_OWORD *)&qword_1EA7063F0 = 0u;
  xmmword_1EA7063C0 = 0u;
  unk_1EA7063D0 = 0u;
  xmmword_1EA7063A0 = 0u;
  *(_OWORD *)&qword_1EA7063B0 = 0u;
  [(CBConnectionsObserver *)self updateBleStatus:&g_ctx];
  if (qword_1EA706360)
  {
    int ModulePower = BTLocalDeviceGetModulePower();
    if (ModulePower)
    {
      int v4 = ModulePower;
      uint64_t v5 = (void *)MEMORY[0x1D944E080]();
      v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v7;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v4;
        _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateClassicStatus: BTLocalDeviceGetModulePower failed with error %d", buf, 0x12u);
      }
      goto LABEL_12;
    }
    uint64_t v5 = (void *)MEMORY[0x1D944E080]();
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 0;
      v10 = "%{public}@[CBConnectionsObserver] updateClassicStatus: not powered on, power status %d";
      id v11 = v6;
      uint32_t v12 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D944E080]();
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v9;
      v10 = "%{public}@[CBConnectionsObserver] updateClassicStatus: no local device found, has initialization failed?";
      id v11 = v6;
      uint32_t v12 = 12;
LABEL_11:
      _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
LABEL_12:

  long long v71 = xmmword_1EA706400;
  long long v72 = *(_OWORD *)&qword_1EA706410;
  uint64_t v73 = qword_1EA706420;
  long long v67 = xmmword_1EA7063C0;
  long long v68 = unk_1EA7063D0;
  long long v69 = xmmword_1EA7063E0;
  long long v70 = *(_OWORD *)&qword_1EA7063F0;
  *(_OWORD *)buf = xmmword_1EA7063A0;
  *(_OWORD *)&buf[16] = *(_OWORD *)&qword_1EA7063B0;
  if (byte_1EA706368)
  {
    unint64_t v13 = +[ATVModel atvStateFromState:buf];
    uint64_t v14 = [(CBConnectionsObserver *)self model];
    v15 = [v14 findTupleForATVState:v13];
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)MEMORY[0x1D944E080]();
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = HMFGetLogIdentifier();
    *(_DWORD *)v60 = 138543618;
    v61 = v18;
    __int16 v62 = 2112;
    double v63 = *(double *)&v15;
    _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] tuple is %@", v60, 0x16u);
  }
  if (!v15)
  {
    v19 = (void *)MEMORY[0x1D944E080]();
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)v60 = 138543362;
      v61 = v21;
      _os_log_impl(&dword_1D4758000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: work-in-progress", v60, 0xCu);
    }
    id v22 = (void *)MEMORY[0x1D944E080]();
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      *(_DWORD *)v60 = 138543362;
      v61 = v24;
      _os_log_impl(&dword_1D4758000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: TODO this is work-in-progress", v60, 0xCu);
    }
    float v25 = (float)(*(float *)&dword_1EA706394 * (float)(unint64_t)v71) / (float)(unint64_t)qword_1EA706370;
    v26 = (void *)MEMORY[0x1D944E080]();
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = HMFGetLogIdentifier();
      *(_DWORD *)v60 = 138543618;
      v61 = v28;
      __int16 v62 = 2048;
      double v63 = *(double *)&buf[24];
      _os_log_impl(&dword_1D4758000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: A2DPActive: %ld\n", v60, 0x16u);
    }
    float v29 = v25 + 0.0;

    if (*(void *)&buf[24])
    {
      long long v30 = (void *)MEMORY[0x1D944E080]();
      long long v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = HMFGetLogIdentifier();
        *(_DWORD *)v60 = 138543362;
        v61 = v32;
        _os_log_impl(&dword_1D4758000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: TODO add formula for A2DP bandwidth", v60, 0xCu);
      }
    }
    float v33 = (float)(v29
                + (float)((float)((float)((float)(unint64_t)v70 + (float)(unint64_t)v70)
                                + (float)((float)*((unint64_t *)&v70 + 1) * 4.0))
                        / (float)(unint64_t)qword_1EA706370))
        + (float)((float)(unint64_t)v69 * *(float *)&dword_1EA706390);
    if ((_BYTE)v73)
    {
      float v34 = *(float *)&dword_1EA706380;
      if (*(float *)&dword_1EA706380 < unk_1EA706384) {
        float v34 = unk_1EA706384;
      }
      float v33 = (float)((float)(v33 + *(float *)&qword_1EA706378) + *((float *)&qword_1EA706378 + 1)) + v34;
    }
    float v35 = *(float *)&dword_1EA70638C;
    unint64_t v36 = *((void *)&v68 + 1);
    uint64_t v37 = (void *)MEMORY[0x1D944E080]();
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = HMFGetLogIdentifier();
      *(_DWORD *)v60 = 138543362;
      v61 = v39;
      _os_log_impl(&dword_1D4758000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] updateBandwidth: TODO add formula for shared antenna\n", v60, 0xCu);
    }
    *(float *)&double v40 = fminf((float)(v33 + (float)(v35 * (float)v36)) * 100.0, 100.0);
    LODWORD(v41) = LODWORD(v40);
    v15 = +[HAPBTLETuple makeTupleWithState:buf MaxHAPConnections:(dword_1EA706388 + v68 - DWORD2(v68)) MinBandwidth:v40 MaxBandwidth:v41];
  }
  v42 = (void *)MEMORY[0x1D944E080]();
  v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = HMFGetLogIdentifier();
    v45 = +[HAPBTLETuple state2String:buf];
    *(_DWORD *)v60 = 138543618;
    v61 = v44;
    __int16 v62 = 2112;
    double v63 = *(double *)&v45;
    _os_log_impl(&dword_1D4758000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] status\n%@", v60, 0x16u);
  }
  v46 = (void *)MEMORY[0x1D944E080]();
  v47 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = HMFGetLogIdentifier();
    [v15 maxBandwidth];
    double v50 = v49;
    int v51 = [v15 maxHAPConnections];
    *(_DWORD *)v60 = 138543874;
    v61 = v48;
    __int16 v62 = 2048;
    double v63 = v50;
    __int16 v64 = 1024;
    int v65 = v51;
    _os_log_impl(&dword_1D4758000, v47, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] max bandwidth: %f%% maxHAPConnections %d \n", v60, 0x1Cu);
  }
  int v52 = [v15 maxHAPConnections];
  unsigned int v8 = v52 & ~(v52 >> 31);
  if (byte_1EA706368)
  {
    if (v8 <= 1) {
      unsigned int v8 = 1;
    }
    v53 = (void *)MEMORY[0x1D944E080]();
    v54 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      v55 = HMFGetLogIdentifier();
      *(_DWORD *)v60 = 138543618;
      v61 = v55;
      __int16 v62 = 1024;
      LODWORD(v63) = v8;
      _os_log_impl(&dword_1D4758000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] adjusted for ATV maxHAPConnections: %d \n", v60, 0x12u);
    }
  }
  v56 = (void *)MEMORY[0x1D944E080]();
  v57 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = HMFGetLogIdentifier();
    *(_DWORD *)v60 = 138543618;
    v61 = v58;
    __int16 v62 = 1024;
    LODWORD(v63) = v8;
    _os_log_impl(&dword_1D4758000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] returning maxHAPConnections: %d \n", v60, 0x12u);
  }

  return v8;
}

- (BOOL)attachSessionWithError:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = qword_1EA706360 != 0;
  if (qword_1EA706360)
  {
    int v4 = (void *)MEMORY[0x1D944E080](self, a2, a3);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = HMFGetLogIdentifier();
      int v12 = 138543362;
      unint64_t v13 = v6;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] BTSessionAttachWithQueue already attached\n", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    objc_msgSend((id)sessionName, "UTF8String", a3);
    unsigned int v8 = [(CBConnectionsObserver *)self dispatchQueue];
    int v9 = BTSessionAttachWithQueue();

    if (!v9) {
      return 1;
    }
    int v4 = (void *)MEMORY[0x1D944E080]();
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      unint64_t v13 = v10;
      __int16 v14 = 1024;
      int v15 = v9;
      _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] BTSessionAttachWithQueue with error %d \n", (uint8_t *)&v12, 0x12u);
    }
  }

  return v3;
}

- (BOOL)cleanupWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 0;
  }
  if (![(CBConnectionsObserver *)self hasStarted]) {
    return 1;
  }
  [(CBConnectionsObserver *)self setHasStarted:0];
  [(CBConnectionsObserver *)self setCentral:0];
  if (qword_1EA706360) {
    qword_1EA706360 = 0;
  }
  if (!qword_1EA706358) {
    return 1;
  }
  uint64_t v5 = BTSessionDetachWithQueue();
  BOOL v6 = v5 == 0;
  if (v5)
  {
    uint64_t v7 = v5;
    unsigned int v8 = (void *)MEMORY[0x1D944E080]();
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v18 = v10;
      __int16 v19 = 1024;
      int v20 = v7;
      _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] BTSessionDetachWithQueue failed with error %d", buf, 0x12u);
    }
    if (a3)
    {
      id v11 = [NSString stringWithFormat:@"Failed to detach session, code %d", v7];
      int v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v16 = v11;
      unint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      *a3 = [v12 errorWithDomain:@"CBConnectionsObserver" code:1 userInfo:v13];
    }
  }
  qword_1EA706358 = 0;
  return v6;
}

- (CBConnectionsObserver)initWithCentralManager:(id)a3 Queue:(id)a4 Error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CBConnectionsObserver;
  v10 = [(CBConnectionsObserver *)&v33 init];
  id v11 = v10;
  if (a5) {
    *a5 = 0;
  }
  if (v10)
  {
    v10->_hasStarted = 1;
    objc_storeWeak((id *)&v10->_dispatchQueue, v9);
    int v12 = NSString;
    unint64_t v13 = getprogname();
    uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", @"%s-%u", v13, getpid());
    uint64_t v15 = (void *)sessionName;
    sessionName = v14;

    g_ctx = (uint64_t)sessionEventCallback;
    qword_1EA706338 = (uint64_t)serviceEventCallback;
    qword_1EA706340 = (uint64_t)localDeviceCallback;
    xmmword_1EA7063A0 = 0u;
    *(_OWORD *)&qword_1EA7063B0 = 0u;
    xmmword_1EA7063C0 = 0u;
    unk_1EA7063D0 = 0u;
    xmmword_1EA7063E0 = 0u;
    *(_OWORD *)&qword_1EA7063F0 = 0u;
    xmmword_1EA706400 = 0u;
    *(_OWORD *)&qword_1EA706410 = 0u;
    *(_DWORD *)((char *)&qword_1EA706418 + 7) = 0;
    int v16 = IsAppleTV();
    v17 = (void *)MEMORY[0x1D944E080]();
    id v18 = HMFGetOSLogHandle();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v19)
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        float v35 = v20;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] running on Apple TV \n", buf, 0xCu);
      }
      uint64_t v21 = objc_alloc_init(ATVModel);
      model = v11->_model;
      v11->_model = v21;

      char v23 = 1;
    }
    else
    {
      if (v19)
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        float v35 = v24;
        _os_log_impl(&dword_1D4758000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] running on iOS device \n", buf, 0xCu);
      }
      char v23 = 0;
    }
    byte_1EA706368 = v23;
    qword_1EA706378 = 0;
    *(void *)&dword_1EA706380 = 0;
    qword_1EA706370 = 18;
    *(void *)&dword_1EA70638C = 0x3E4CCCCD3D4CCCCDLL;
    dword_1EA706394 = 1086324736;
    dword_1EA706388 = 5;
    uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1BD18]) initWithDelegate:v11 queue:v9];
    central = v11->_central;
    v11->_central = (CBCentralManager *)v25;

    if ([(CBCentralManager *)v11->_central state] == 5)
    {
      id v32 = 0;
      [(CBConnectionsObserver *)v11 attachSessionWithError:&v32];
      id v27 = v32;
      if (v27)
      {
        long long v28 = (void *)MEMORY[0x1D944E080]();
        float v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          long long v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          float v35 = v30;
          __int16 v36 = 2112;
          id v37 = v27;
          _os_log_impl(&dword_1D4758000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@[CBConnectionsObserver] initWithCentralManager failed to attache MobileBluetooth session, error :%@", buf, 0x16u);
        }
        if (a5) {
          *a5 = v27;
        }
      }
    }
  }

  return v11;
}

+ (void)initialize
{
  v13[6] = *MEMORY[0x1E4F143B8];
  v12[0] = &unk_1F2C80BC8;
  v12[1] = &unk_1F2C80BE0;
  v13[0] = @"Unknown";
  v13[1] = @"Resetting";
  v12[2] = &unk_1F2C80BF8;
  v12[3] = &unk_1F2C80C10;
  v13[2] = @"Unsupported";
  v13[3] = @"Unauthorized";
  v12[4] = &unk_1F2C80C28;
  v12[5] = &unk_1F2C80C40;
  v13[4] = @"Powered Off";
  v13[5] = @"Powered On";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];
  BOOL v3 = (void *)cbManagerState2String;
  cbManagerState2String = v2;

  v10[0] = &unk_1F2C80C58;
  v10[1] = &unk_1F2C80C70;
  v11[0] = @"Power State Changed";
  v11[1] = @"Discoverability Changed";
  v10[2] = &unk_1F2C80C88;
  v10[3] = &unk_1F2C80CA0;
  v11[2] = @"Connectability Changed";
  v11[3] = @"Pairing status Changed";
  v10[4] = &unk_1F2C80CB8;
  v10[5] = &unk_1F2C80CD0;
  v11[4] = @"Connection status Changed";
  v11[5] = @"Discovery Started";
  v10[6] = &unk_1F2C80CE8;
  v10[7] = &unk_1F2C80D00;
  v11[6] = @"Discovery Stopped";
  v11[7] = @"Advertising Status Changed";
  v10[8] = &unk_1F2C80D18;
  v11[8] = @"Name Changed";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:9];
  uint64_t v5 = (void *)btLocalDeviceState2String;
  btLocalDeviceState2String = v4;

  v8[0] = &unk_1F2C80C58;
  v8[1] = &unk_1F2C80D18;
  v9[0] = @"Service Connect";
  v9[1] = @"Service Disconnect";
  v8[2] = &unk_1F2C80C70;
  v9[2] = @"Service Dependent Event";
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  uint64_t v7 = (void *)btServiceEvent2String;
  btServiceEvent2String = v6;
}

@end