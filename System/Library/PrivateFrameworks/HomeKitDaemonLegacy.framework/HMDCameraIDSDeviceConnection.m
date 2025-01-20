@interface HMDCameraIDSDeviceConnection
+ (id)logCategory;
- (HMDCameraIDSDeviceConnection)initWithSessionID:(id)a3 workQueue:(id)a4 idsProxyStreamService:(id)a5;
- (HMDCameraStreamSessionID)sessionID;
- (HMDIDSService)idsProxyStreamService;
- (IDSDeviceConnection)keepAliveConnection;
- (IDSDeviceConnection)watchAudioConnection;
- (IDSDeviceConnection)watchVideoConnection;
- (OS_dispatch_queue)workQueue;
- (id)idsDeviceConnectionFactory;
- (id)logIdentifier;
- (uint64_t)_startKeepAliveTimeoutTimer;
- (void)_callSessionEndedWithError:(id)a3;
- (void)_createStreamSocketWithDevice:(id)a3;
- (void)_socketOpenedWithError:(id)a3;
- (void)callSessionEnded:(void *)a1;
- (void)dealloc;
- (void)setIdsDeviceConnectionFactory:(id)a3;
- (void)setKeepAliveConnection:(id)a3;
- (void)setWatchAudioConnection:(id)a3;
- (void)setWatchVideoConnection:(id)a3;
- (void)startKeepAlive;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraIDSDeviceConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idsDeviceConnectionFactory, 0);
  objc_storeStrong((id *)&self->_keepAliveByteReceiveTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveByteSendTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveSocketReceiveSource, 0);
  objc_storeStrong((id *)&self->_highPriorityQueue, 0);
  objc_storeStrong((id *)&self->_keepAliveConnection, 0);
  objc_storeStrong((id *)&self->_watchAudioConnection, 0);
  objc_storeStrong((id *)&self->_watchVideoConnection, 0);
  objc_storeStrong((id *)&self->_idsProxyStreamService, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setIdsDeviceConnectionFactory:(id)a3
{
}

- (id)idsDeviceConnectionFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setKeepAliveConnection:(id)a3
{
}

- (IDSDeviceConnection)keepAliveConnection
{
  return (IDSDeviceConnection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWatchAudioConnection:(id)a3
{
}

- (IDSDeviceConnection)watchAudioConnection
{
  return (IDSDeviceConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWatchVideoConnection:(id)a3
{
}

- (IDSDeviceConnection)watchVideoConnection
{
  return (IDSDeviceConnection *)objc_getProperty(self, a2, 40, 1);
}

- (HMDIDSService)idsProxyStreamService
{
  return self->_idsProxyStreamService;
}

- (HMDCameraStreamSessionID)sessionID
{
  return self->_sessionID;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraIDSDeviceConnection *)self sessionID];
  v3 = [v2 description];

  return v3;
}

- (void)_callSessionEndedWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)_socketOpenedWithError:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  SEL _cmd = (SEL)a3;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
    goto LABEL_13;
  }
  Property = objc_getProperty(self, v4, 64, 1);
  dispatch_assert_queue_V2(Property);
  if (objc_getProperty(self, v6, 80, 1) == _cmd)
  {
    unsigned __int8 v22 = ++self->_keepAliveCounter;
    id v10 = [(HMDCameraIDSDeviceConnection *)self keepAliveConnection];
    ssize_t v11 = send([v10 socket], &v22, 1uLL, 0);

    if (v11 == -1)
    {
      v12 = (void *)MEMORY[0x1D9452090]();
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v15;
        __int16 v25 = 1024;
        int v26 = v22;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to send the sample data %d", buf, 0x12u);
      }
      v16 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1025];
      -[HMDCameraIDSDeviceConnection callSessionEnded:](v13, v16);
    }
    v17 = (void *)MEMORY[0x1D9452090]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v24 = v20;
      __int16 v25 = 1024;
      int v26 = v22;
      __int16 v27 = 2048;
      ssize_t v28 = v11;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Data %u transfer is complete with total transferred bytes: %lu", buf, 0x1Cu);
    }
    goto LABEL_13;
  }
  BOOL v7 = objc_getProperty(self, _cmd, 88, 1) == _cmd;
  v8 = (char *)_cmd;
  if (v7)
  {
    v9 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1026];
    -[HMDCameraIDSDeviceConnection callSessionEnded:](self, v9);

LABEL_13:
    v8 = (char *)_cmd;
  }
}

- (void)callSessionEnded:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 workQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__HMDCameraIDSDeviceConnection_callSessionEnded___block_invoke;
    v5[3] = &unk_1E6A197C8;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __49__HMDCameraIDSDeviceConnection_callSessionEnded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callSessionEndedWithError:*(void *)(a1 + 40)];
}

- (void)startKeepAlive
{
  v2 = self;
  if (self) {
    self = (HMDCameraIDSDeviceConnection *)objc_getProperty(self, a2, 64, 1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMDCameraIDSDeviceConnection_startKeepAlive__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v2;
  dispatch_async(&self->super.super, block);
}

void __46__HMDCameraIDSDeviceConnection_startKeepAlive__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F65580]);
    id v4 = (void *)[v3 initWithTimeInterval:20 options:(double)(unint64_t)deviceConnectionKeepAliveTimerPeriod];
    objc_setProperty_atomic(v2, v5, v4, 80);

    objc_msgSend(objc_getProperty(v2, v6, 80, 1), "setDelegate:", v2);
    id v8 = objc_getProperty(v2, v7, 64, 1);
    objc_msgSend(objc_getProperty(v2, v9, 80, 1), "setDelegateQueue:", v8);

    objc_msgSend(objc_getProperty(v2, v10, 80, 1), "resume");
    uint64_t v11 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v11 = 0;
  }
  -[HMDCameraIDSDeviceConnection _startKeepAliveTimeoutTimer](v11);
  v12 = *(void **)(a1 + 32);
  if (v12)
  {
    v13 = [v12 keepAliveConnection];
    uintptr_t v14 = (int)[v13 socket];
    Property = objc_getProperty(v12, v15, 64, 1);
    dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14478], v14, 0, Property);
    objc_setProperty_atomic(v12, v18, v17, 72);

    objc_initWeak(&location, v12);
    id v20 = objc_getProperty(v12, v19, 72, 1);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __54__HMDCameraIDSDeviceConnection__setReceiveByteHandler__block_invoke;
    v24[3] = &unk_1E6A16E40;
    v21 = v20;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v21, v24);

    v23 = objc_getProperty(v12, v22, 72, 1);
    dispatch_resume(v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

- (uint64_t)_startKeepAliveTimeoutTimer
{
  if (result)
  {
    v1 = (void *)result;
    id v2 = objc_alloc(MEMORY[0x1E4F65580]);
    id v3 = (void *)[v2 initWithTimeInterval:16 options:(double)(unint64_t)deviceConnectionKeepAliveResponseTimeoutPeriod];
    objc_setProperty_atomic(v1, v4, v3, 88);

    objc_msgSend(objc_getProperty(v1, v5, 88, 1), "setDelegate:", v1);
    id v7 = objc_getProperty(v1, v6, 64, 1);
    objc_msgSend(objc_getProperty(v1, v8, 88, 1), "setDelegateQueue:", v7);

    id Property = objc_getProperty(v1, v9, 88, 1);
    return [Property resume];
  }
  return result;
}

void __54__HMDCameraIDSDeviceConnection__setReceiveByteHandler__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v16 = 0;
  id v2 = [WeakRetained keepAliveConnection];
  ssize_t v3 = recvfrom([v2 socket], &v16, 1uLL, 0, 0, 0);

  SEL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = WeakRetained;
  SEL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    SEL v18 = v7;
    __int16 v19 = 1024;
    int v20 = v16;
    __int16 v21 = 2048;
    ssize_t v22 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Received keep-alive byte number %u with length %zd", buf, 0x1Cu);
  }
  if (v3 < 0)
  {
    SEL v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v5;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      SEL v18 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Recv from socket returned error, marking the stream as failure", buf, 0xCu);
    }
    v13 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1027];
    -[HMDCameraIDSDeviceConnection callSessionEnded:](v10, v13);
  }
  else if (v3)
  {
    -[HMDCameraIDSDeviceConnection _startKeepAliveTimeoutTimer]((uint64_t)v5);
  }
  else if (v5)
  {
    id Property = objc_getProperty(v5, v8, 72, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(v5, v15, 0, 72);
  }
  else
  {
    dispatch_source_cancel(0);
  }
}

- (void)_createStreamSocketWithDevice:(id)a3
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D9452090]();
  SEL v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    SEL v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating stream sockets with device: %@", buf, 0x16u);
  }
  SEL v9 = [(HMDCameraIDSDeviceConnection *)v6 idsProxyStreamService];
  id v10 = [v9 devices];
  v129[0] = MEMORY[0x1E4F143A8];
  v129[1] = 3221225472;
  v129[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke;
  v129[3] = &unk_1E6A0A798;
  id v99 = v4;
  id v130 = v99;
  v100 = objc_msgSend(v10, "hmf_objectPassingTest:", v129);

  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  v12 = v6;
  v13 = HMFGetOSLogHandle();
  uintptr_t v14 = v13;
  if (v100)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      SEL v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v100;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Mapped HMDDevice to IDSDevice: %@", buf, 0x16u);
    }
    unsigned __int8 v16 = [v99 version];
    dispatch_source_t v17 = [[HMDHomeKitVersion alloc] initWithVersionString:@"8.0"];
    int v18 = [v16 isAtLeastVersion:v17];

    __int16 v19 = NSString;
    int v20 = [(HMDCameraIDSDeviceConnection *)v12 sessionID];
    __int16 v21 = v20;
    if (v18)
    {
      ssize_t v22 = [v20 sessionID];
      uint64_t v23 = [v19 stringWithFormat:@"%@-%@", @"kIDSStreamVideoSocketName", v22];

      v24 = NSString;
      id v25 = [(HMDCameraIDSDeviceConnection *)v12 sessionID];
      int v26 = [v25 sessionID];
      v97 = [v24 stringWithFormat:@"%@-%@", @"kIDSStreamAudioSocketName", v26];

      __int16 v27 = NSString;
      ssize_t v28 = [(HMDCameraIDSDeviceConnection *)v12 sessionID];
      uint64_t v29 = [v28 sessionID];
      v95 = [v27 stringWithFormat:@"%@-%@", @"kIDSStreamKeepAliveSocketName", v29];
    }
    else
    {
      uint64_t v23 = [v19 stringWithFormat:@"%@-%@", @"kIDSStreamVideoSocketName", v20];

      v35 = NSString;
      v36 = [(HMDCameraIDSDeviceConnection *)v12 sessionID];
      v97 = [v35 stringWithFormat:@"%@-%@", @"kIDSStreamAudioSocketName", v36];

      v37 = NSString;
      ssize_t v28 = [(HMDCameraIDSDeviceConnection *)v12 sessionID];
      v95 = [v37 stringWithFormat:@"%@-%@", @"kIDSStreamKeepAliveSocketName", v28];
    }

    objc_initWeak(&location, v12);
    v38 = dispatch_group_create();
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v145) = 0;
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x2020000000;
    char v127 = 0;
    v124[0] = 0;
    v124[1] = v124;
    v124[2] = 0x2020000000;
    char v125 = 0;
    v91 = (void *)*MEMORY[0x1E4F6A8E8];
    uint64_t v39 = *MEMORY[0x1E4F6A8E8];
    uint64_t v93 = *MEMORY[0x1E4F6A8F8];
    v142[0] = *MEMORY[0x1E4F6A8F8];
    v142[1] = v39;
    v143[0] = &unk_1F2DC7BA0;
    v143[1] = &unk_1F2DC7BB8;
    uint64_t v90 = *MEMORY[0x1E4F6A8F0];
    v142[2] = *MEMORY[0x1E4F6A8F0];
    v143[2] = v23;
    v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v143 forKeys:v142 count:3];
    dispatch_group_enter(v38);
    v41 = [(HMDCameraIDSDeviceConnection *)v12 sessionID];
    v141[0] = @"IDSSetupVideoConnection";
    v141[1] = @"IDSSetupConnectionRequested";
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:2];
    [v41 markMilestoneForPath:v42];

    v43 = (void *)MEMORY[0x1D9452090]();
    v44 = v12;
    HMFGetOSLogHandle();
    v45 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = HMFGetLogIdentifier();
      *(_DWORD *)v137 = 138543618;
      v138 = v46;
      __int16 v139 = 2112;
      v140 = v23;
      _os_log_impl(&dword_1D49D5000, v45, OS_LOG_TYPE_INFO, "%{public}@Creating watch video connection with name: %@", v137, 0x16u);
    }
    v47 = [(HMDCameraIDSDeviceConnection *)v44 idsDeviceConnectionFactory];
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_35;
    v119[3] = &unk_1E6A0A7C0;
    objc_copyWeak(&v123, &location);
    id v89 = v23;
    id v120 = v89;
    v122 = buf;
    dispatch_group_t group = v38;
    dispatch_group_t v121 = group;
    v48 = [(HMDCameraIDSDeviceConnection *)v44 workQueue];
    v98 = ((void (**)(void, void *, void *, void *, void *))v47)[2](v47, v100, v40, v119, v48);

    if (v98)
    {
      v34 = 0;
    }
    else
    {
      v49 = (void *)MEMORY[0x1D9452090]();
      v50 = v44;
      HMFGetOSLogHandle();
      v51 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = HMFGetLogIdentifier();
        *(_DWORD *)v137 = 138543362;
        v138 = v52;
        _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video IDSDeviceConnection", v137, 0xCu);
      }
      v34 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1021];
    }

    objc_destroyWeak(&v123);
    if (!v98) {
      goto LABEL_35;
    }
    v135[0] = v93;
    v135[1] = v91;
    v136[0] = &unk_1F2DC7BA0;
    v136[1] = &unk_1F2DC7BD0;
    v135[2] = v90;
    v136[2] = v97;
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:3];
    dispatch_group_enter(group);
    v54 = [(HMDCameraIDSDeviceConnection *)v44 sessionID];
    v134[0] = @"IDSSetupAudioConnection";
    v134[1] = @"IDSSetupConnectionRequested";
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:2];
    [v54 markMilestoneForPath:v55];

    v56 = (void *)MEMORY[0x1D9452090]();
    v57 = v44;
    HMFGetOSLogHandle();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = HMFGetLogIdentifier();
      *(_DWORD *)v137 = 138543618;
      v138 = v59;
      __int16 v139 = 2112;
      v140 = v97;
      _os_log_impl(&dword_1D49D5000, v58, OS_LOG_TYPE_INFO, "%{public}@Creating watch audio connection with name: %@", v137, 0x16u);
    }
    v60 = [(HMDCameraIDSDeviceConnection *)v57 idsDeviceConnectionFactory];
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_39;
    v114[3] = &unk_1E6A0A7C0;
    objc_copyWeak(&v118, &location);
    id v115 = v97;
    v117 = v126;
    v61 = group;
    v116 = v61;
    v62 = [(HMDCameraIDSDeviceConnection *)v57 workQueue];
    ((void (**)(void, void *, void *, void *, void *))v60)[2](v60, v100, v53, v114, v62);
    id v63 = (id)objc_claimAutoreleasedReturnValue();

    if (!v63)
    {
      context = (void *)MEMORY[0x1D9452090]();
      v64 = v57;
      HMFGetOSLogHandle();
      v65 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = HMFGetLogIdentifier();
        *(_DWORD *)v137 = 138543362;
        v138 = v66;
        _os_log_impl(&dword_1D49D5000, v65, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio IDSDeviceConnection", v137, 0xCu);
      }
      uint64_t v67 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1022];

      v34 = (void *)v67;
    }

    objc_destroyWeak(&v118);
    if (v63)
    {
      v132[0] = v93;
      v132[1] = v91;
      v133[0] = &unk_1F2DC7BE8;
      v133[1] = &unk_1F2DC7BD0;
      v132[2] = v90;
      v133[2] = v95;
      v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v133 forKeys:v132 count:3];
      dispatch_group_enter(v61);
      v68 = [(HMDCameraIDSDeviceConnection *)v57 sessionID];
      v131[0] = @"IDSSetupKeepAlive";
      v131[1] = @"IDSSetupConnectionRequested";
      v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
      [v68 markMilestoneForPath:v69];

      v70 = (void *)MEMORY[0x1D9452090]();
      v71 = v57;
      HMFGetOSLogHandle();
      v72 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        v73 = HMFGetLogIdentifier();
        *(_DWORD *)v137 = 138543618;
        v138 = v73;
        __int16 v139 = 2112;
        v140 = v95;
        _os_log_impl(&dword_1D49D5000, v72, OS_LOG_TYPE_INFO, "%{public}@Creating keep alive connection with name: %@", v137, 0x16u);
      }
      v74 = [(HMDCameraIDSDeviceConnection *)v71 idsDeviceConnectionFactory];
      v109[0] = MEMORY[0x1E4F143A8];
      v109[1] = 3221225472;
      v109[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_42;
      v109[3] = &unk_1E6A0A7C0;
      objc_copyWeak(&v113, &location);
      id v110 = v95;
      v112 = v124;
      v75 = v61;
      v111 = v75;
      v76 = [(HMDCameraIDSDeviceConnection *)v71 workQueue];
      v77 = ((void (**)(void, void *, void *, void *, void *))v74)[2](v74, v100, v94, v109, v76);

      if (!v77)
      {
        v92 = (void *)MEMORY[0x1D9452090]();
        v78 = v71;
        HMFGetOSLogHandle();
        v79 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        {
          v80 = HMFGetLogIdentifier();
          *(_DWORD *)v137 = 138543362;
          v138 = v80;
          _os_log_impl(&dword_1D49D5000, v79, OS_LOG_TYPE_ERROR, "%{public}@Failed to create keep alive IDSDeviceConnection", v137, 0xCu);
        }
        uint64_t v81 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1023];

        v34 = (void *)v81;
      }

      objc_destroyWeak(&v113);
      if (v77)
      {
        v82 = [(HMDCameraIDSDeviceConnection *)v71 workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_43;
        block[3] = &unk_1E6A0A7E8;
        objc_copyWeak(&v108, &location);
        v105 = v126;
        v106 = buf;
        v107 = v124;
        id v102 = v98;
        id v63 = v63;
        id v103 = v63;
        id v104 = v77;
        id v83 = v77;
        dispatch_group_notify(v75, v82, block);

        objc_destroyWeak(&v108);
      }
    }
    else
    {
LABEL_35:
      id v63 = 0;
    }

    _Block_object_dispose(v124, 8);
    _Block_object_dispose(v126, 8);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
    if (v34)
    {
      v84 = (void *)MEMORY[0x1D9452090]();
      v85 = v44;
      v86 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        v87 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v87;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v34;
        _os_log_impl(&dword_1D49D5000, v86, OS_LOG_TYPE_ERROR, "%{public}@Failed to create IDS connections: %@", buf, 0x16u);
      }
      [(HMDCameraIDSDeviceConnection *)v85 _socketOpenedWithError:v34];
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [v99 idsIdentifier];
      v32 = [(HMDCameraIDSDeviceConnection *)v12 idsProxyStreamService];
      v33 = [v32 devices];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2112;
      v145 = v33;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not find IDSDevice matching IDS identifier %@. All devices: %@", buf, 0x20u);
    }
    v34 = [MEMORY[0x1E4F28C58] hmInternalErrorWithCode:1020];
    [(HMDCameraIDSDeviceConnection *)v12 _socketOpenedWithError:v34];
  }
}

uint64_t __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke(uint64_t a1, void *a2)
{
  ssize_t v3 = [a2 uniqueIDOverride];
  id v4 = [*(id *)(a1 + 32) idsIdentifier];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_35(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  SEL v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (a2 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v18 = v15;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create video connection: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      int v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 1024;
      int v22 = a2;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Created watch video connection with name: %@ socket: %d", buf, 0x1Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v13 = [v8 sessionID];
    v16[0] = @"IDSSetupVideoConnection";
    v16[1] = @"IDSSetupConnectionComplete";
    uintptr_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v13 markMilestoneForPath:v14];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_39(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  SEL v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (a2 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v18 = v15;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create audio connection: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      int v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 1024;
      int v22 = a2;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Created watch audio connection with name: %@ socket: %d", buf, 0x1Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v13 = [v8 sessionID];
    v16[0] = @"IDSSetupAudioConnection";
    v16[1] = @"IDSSetupConnectionComplete";
    uintptr_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v13 markMilestoneForPath:v14];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_42(uint64_t a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = WeakRetained;
  SEL v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (a2 == -1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      SEL v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v18 = v15;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create keep alive connection: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      int v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 1024;
      int v22 = a2;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Created watch keep alive connection with name: %@ socket: %d", buf, 0x1Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v13 = [v8 sessionID];
    v16[0] = @"IDSSetupKeepAlive";
    v16[1] = @"IDSSetupConnectionComplete";
    uintptr_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [v13 markMilestoneForPath:v14];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __62__HMDCameraIDSDeviceConnection__createStreamSocketWithDevice___block_invoke_43(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  ssize_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          [WeakRetained setWatchVideoConnection:*(void *)(a1 + 32)];
          [v3 setWatchAudioConnection:*(void *)(a1 + 40)];
          id v4 = (void *)MEMORY[0x1D9452090]([v3 setKeepAliveConnection:*(void *)(a1 + 48)]);
          id v5 = v3;
          uint64_t v6 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            id v7 = HMFGetLogIdentifier();
            int v24 = 138543362;
            id v25 = v7;
            _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully created stream sockets", (uint8_t *)&v24, 0xCu);
          }
          [v5 _socketOpenedWithError:0];
          goto LABEL_21;
        }
        id v20 = (void *)MEMORY[0x1D9452090]();
        id v12 = v3;
        __int16 v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          int v22 = HMFGetLogIdentifier();
          int v24 = 138543362;
          id v25 = v22;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to open keep alive socket", (uint8_t *)&v24, 0xCu);
        }
        SEL v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 1023;
      }
      else
      {
        dispatch_source_t v17 = (void *)MEMORY[0x1D9452090]();
        id v12 = v3;
        int v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __int16 v19 = HMFGetLogIdentifier();
          int v24 = 138543362;
          id v25 = v19;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to open video socket", (uint8_t *)&v24, 0xCu);
        }
        SEL v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = 1021;
      }
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = v3;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uintptr_t v14 = HMFGetLogIdentifier();
        int v24 = 138543362;
        id v25 = v14;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to open audio socket", (uint8_t *)&v24, 0xCu);
      }
      SEL v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = 1022;
    }
    uint64_t v23 = [v15 hmInternalErrorWithCode:v16];
    [v12 _socketOpenedWithError:v23];

    goto LABEL_21;
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  SEL v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    int v24 = 138543362;
    id v25 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Lost self while creating sockets", (uint8_t *)&v24, 0xCu);
  }
LABEL_21:
}

- (void)dealloc
{
  [(HMDIDSService *)self->_idsProxyStreamService removeDelegate:self];
  [(IDSDeviceConnection *)self->_watchAudioConnection close];
  [(IDSDeviceConnection *)self->_watchVideoConnection close];
  [(IDSDeviceConnection *)self->_keepAliveConnection close];
  keepAliveSocketReceiveSource = self->_keepAliveSocketReceiveSource;
  if (keepAliveSocketReceiveSource) {
    dispatch_source_cancel(keepAliveSocketReceiveSource);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDCameraIDSDeviceConnection;
  [(HMDCameraIDSDeviceConnection *)&v4 dealloc];
}

- (HMDCameraIDSDeviceConnection)initWithSessionID:(id)a3 workQueue:(id)a4 idsProxyStreamService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v10)
  {
LABEL_7:
    uint64_t v24 = _HMFPreconditionFailure();
    return (HMDCameraIDSDeviceConnection *)__82__HMDCameraIDSDeviceConnection_initWithSessionID_workQueue_idsProxyStreamService___block_invoke(v24);
  }
  id v12 = v11;
  v25.receiver = self;
  v25.super_class = (Class)HMDCameraIDSDeviceConnection;
  v13 = [(HMDCameraIDSDeviceConnection *)&v25 init];
  uintptr_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_workQueue, a4);
    objc_storeStrong((id *)&v14->_sessionID, a3);
    HMDispatchQueueNameString();
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v16 = (const char *)[v15 UTF8String];
    dispatch_source_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v19 = dispatch_queue_create(v16, v18);
    highPriorityQueue = v14->_highPriorityQueue;
    v14->_highPriorityQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v14->_idsProxyStreamService, a5);
    [(HMDIDSService *)v14->_idsProxyStreamService addDelegate:v14 queue:v14->_workQueue];
    id idsDeviceConnectionFactory = v14->_idsDeviceConnectionFactory;
    v14->_id idsDeviceConnectionFactory = &__block_literal_global_43893;

    int v22 = +[HMDIDSServiceManager sharedManager];
    [v22 addProxyServiceLinkPreferencesAssertionHolder:v14];
  }
  return v14;
}

id __82__HMDCameraIDSDeviceConnection_initWithSessionID_workQueue_idsProxyStreamService___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8 = (objc_class *)MEMORY[0x1E4F6AAF0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  v13 = (void *)[[v8 alloc] initSocketWithDevice:v12 options:v11 completionHandler:v10 queue:v9];

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_43910 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_43910, &__block_literal_global_51_43911);
  }
  id v2 = (void *)logCategory__hmf_once_v26_43912;
  return v2;
}

uint64_t __43__HMDCameraIDSDeviceConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v26_43912;
  logCategory__hmf_once_v26_43912 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end