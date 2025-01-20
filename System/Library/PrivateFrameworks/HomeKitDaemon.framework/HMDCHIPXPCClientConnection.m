@interface HMDCHIPXPCClientConnection
+ (id)logCategory;
- (BOOL)allowsOperation;
- (BOOL)backgroundModeEntitled;
- (HMDCHIPXPCClientConnection)initWithRemoteObjectProxy:(id)a3 homeManager:(id)a4 pid:(int)a5 processInfo:(id)a6 backgroundModeEntitled:(BOOL)a7 workQueue:(id)a8;
- (HMDHomeManager)homeManager;
- (HMDProcessInfo)processInfo;
- (MTRDeviceControllerClientProtocol)remoteObjectProxy;
- (NSMutableSet)subscribedHomeUUIDs;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (int)pid;
- (void)_getDeviceControllerWithFabricId:(unint64_t)a3 accessories:(id)a4 home:(id)a5 remainingHomes:(id)a6 completion:(id)a7;
- (void)_registerReportHandlerWithHomeWithUUID:(id)a3;
- (void)deregisterReportHandlers;
- (void)downloadLogWithController:(id)a3 nodeId:(id)a4 type:(int64_t)a5 timeout:(double)a6 completion:(id)a7;
- (void)getAnyDeviceControllerWithCompletion:(id)a3;
- (void)invokeCommandWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 commandId:(id)a7 fields:(id)a8 timedInvokeTimeout:(id)a9 completion:(id)a10;
- (void)readAttributeCacheWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 completion:(id)a8;
- (void)readAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 params:(id)a8 completion:(id)a9;
- (void)stopReportsWithController:(id)a3 nodeId:(unint64_t)a4 completion:(id)a5;
- (void)subscribeAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 minInterval:(id)a8 maxInterval:(id)a9 params:(id)a10 establishedHandler:(id)a11;
- (void)subscribeWithController:(id)a3 nodeId:(unint64_t)a4 minInterval:(id)a5 maxInterval:(id)a6 params:(id)a7 shouldCache:(BOOL)a8 completion:(id)a9;
- (void)writeAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 value:(id)a8 timedWriteTimeout:(id)a9 completion:(id)a10;
@end

@implementation HMDCHIPXPCClientConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedHomeUUIDs, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSMutableSet)subscribedHomeUUIDs
{
  return self->_subscribedHomeUUIDs;
}

- (BOOL)backgroundModeEntitled
{
  return self->_backgroundModeEntitled;
}

- (int)pid
{
  return self->_pid;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (MTRDeviceControllerClientProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (HMDProcessInfo)processInfo
{
  return self->_processInfo;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", -[HMDCHIPXPCClientConnection pid](self, "pid"));
}

- (void)downloadLogWithController:(id)a3 nodeId:(id)a4 type:(int64_t)a5 timeout:(double)a6 completion:(id)a7
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v15 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v15);

  v16 = (void *)MEMORY[0x230FBD990]();
  v17 = self;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    v20 = [NSNumber numberWithInteger:a5];
    v21 = [NSNumber numberWithDouble:a6];
    int v39 = 138544386;
    v40 = v19;
    __int16 v41 = 2112;
    id v42 = v12;
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 2112;
    v46 = v20;
    __int16 v47 = 2112;
    v48 = v21;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Download log via controller %@, nodeId %@, logType %@, timeout %@", (uint8_t *)&v39, 0x34u);
  }
  id v22 = v12;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v23 = v22;
  }
  else {
    v23 = 0;
  }
  id v24 = v23;

  if (v24)
  {
    v25 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v24];
    if (v25
      && ([(HMDCHIPXPCClientConnection *)v17 homeManager],
          v26 = objc_claimAutoreleasedReturnValue(),
          [v26 _homeWithUUID:v25],
          v27 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
          v26,
          v27))
    {
      [v27 downloadLogWithController:v22 nodeId:v13 type:a5 timeout:v14 completion:a6];
    }
    else
    {
      v28 = (void *)MEMORY[0x230FBD990]();
      v29 = v17;
      v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = HMFGetLogIdentifier();
        int v39 = 138543618;
        v40 = v31;
        __int16 v41 = 2112;
        id v42 = v25;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using invalid home UUID: %@", (uint8_t *)&v39, 0x16u);
      }
      v27 = (void (**)(void, void, void))_Block_copy(v14);
      if (v27)
      {
        v32 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        ((void (**)(void, void, void *))v27)[2](v27, 0, v32);
      }
    }
    goto LABEL_18;
  }
  v33 = (void *)MEMORY[0x230FBD990]();
  v34 = v17;
  v35 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = HMFGetLogIdentifier();
    v37 = objc_opt_class();
    int v39 = 138543874;
    v40 = v36;
    __int16 v41 = 2112;
    id v42 = v22;
    __int16 v43 = 2112;
    id v44 = v37;
    id v38 = v37;
    _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Download log called with controller of unexpected class: %@ (%@)", (uint8_t *)&v39, 0x20u);
  }
  v25 = _Block_copy(v14);
  if (v25)
  {
    v27 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    (*((void (**)(void *, void, void))v25 + 2))(v25, 0, v27);
LABEL_18:
  }
}

- (void)readAttributeCacheWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 completion:(id)a8
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void, void *))a8;
  v19 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v19);

  v20 = (void *)MEMORY[0x230FBD990]();
  v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    int v25 = 138543874;
    v26 = v23;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not reading attribute cache with controller: %@, nodeID: 0x%llx: Unsupported", (uint8_t *)&v25, 0x20u);
  }
  id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  v18[2](v18, 0, v24);
}

- (void)subscribeWithController:(id)a3 nodeId:(unint64_t)a4 minInterval:(id)a5 maxInterval:(id)a6 params:(id)a7 shouldCache:(BOOL)a8 completion:(id)a9
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = (void (**)(id, void *))a9;
  v19 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v19);

  v20 = (void *)MEMORY[0x230FBD990]();
  v21 = self;
  id v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = HMFGetLogIdentifier();
    int v25 = 138543874;
    v26 = v23;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not subscribing with controller: %@, nodeID: 0x%llx: Unsupported", (uint8_t *)&v25, 0x20u);
  }
  id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  v18[2](v18, v24);
}

- (void)stopReportsWithController:(id)a3 nodeId:(unint64_t)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(void))a5;
  v10 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x230FBD990]();
  id v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v14;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Stop reports with controller %@, nodeId 0x%llx", (uint8_t *)&v15, 0x20u);
  }
  v9[2](v9);
}

- (void)subscribeAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 minInterval:(id)a8 maxInterval:(id)a9 params:(id)a10 establishedHandler:(id)a11
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v35 = a5;
  id v34 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v33 = a11;
  id v22 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v22);

  v23 = (void *)MEMORY[0x230FBD990]();
  id v24 = self;
  int v25 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138545410;
    v37 = v26;
    __int16 v38 = 2112;
    id v39 = v17;
    __int16 v40 = 2048;
    unint64_t v41 = a4;
    __int16 v42 = 2112;
    id v43 = v35;
    __int16 v44 = 2112;
    id v45 = v34;
    __int16 v46 = 2112;
    id v47 = v18;
    __int16 v48 = 2112;
    id v49 = v19;
    __int16 v50 = 2112;
    id v51 = v20;
    __int16 v52 = 2112;
    id v53 = v21;
    _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Subscribing attribute via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, attributeId %@ minInterval %@, maxInterval %@, params %@", buf, 0x5Cu);
  }
  __int16 v27 = (void *)MEMORY[0x230FBD990]();
  id v28 = v24;
  __int16 v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    unint64_t v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v37 = v30;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Subscribing attribute is not supported yet", buf, 0xCu);
  }
  uint64_t v31 = [(HMDCHIPXPCClientConnection *)v28 remoteObjectProxy];
  v32 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  [v31 handleReportWithController:v17 nodeId:a4 values:0 error:v32];
}

- (void)invokeCommandWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 commandId:(id)a7 fields:(id)a8 timedInvokeTimeout:(id)a9 completion:(id)a10
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = v17;
  id v65 = v18;
  id v20 = a7;
  id v21 = a8;
  id v64 = a9;
  id v22 = (void (**)(id, void, void *))a10;
  v23 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v23);

  id v24 = (void *)MEMORY[0x230FBD990]();
  int v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    __int16 v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138545154;
    v67 = v27;
    __int16 v68 = 2112;
    id v69 = v16;
    __int16 v70 = 2048;
    unint64_t v71 = a4;
    __int16 v72 = 2112;
    v73 = v19;
    __int16 v74 = 2112;
    id v75 = v65;
    __int16 v76 = 2112;
    id v77 = v20;
    __int16 v78 = 2112;
    id v79 = v21;
    __int16 v80 = 2112;
    id v81 = v64;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Invoking command via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, commandId %@, fields %@, timedInvokeTimeout %@", buf, 0x52u);
  }
  if ([(HMDCHIPXPCClientConnection *)v25 allowsOperation])
  {
    id v28 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v29 = v28;
    }
    else {
      __int16 v29 = 0;
    }
    id v30 = v29;

    if (!v30)
    {
      __int16 v40 = (void *)MEMORY[0x230FBD990]();
      unint64_t v41 = v25;
      __int16 v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v43 = v62 = v19;
        __int16 v44 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v67 = v43;
        __int16 v68 = 2112;
        id v69 = v28;
        __int16 v70 = 2112;
        unint64_t v71 = (unint64_t)v44;
        id v45 = v44;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@CHIP invoke command called with controller of unexpected class: %@ (%@)", buf, 0x20u);

        id v19 = v62;
      }

      uint64_t v31 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v22[2](v22, 0, v31);
      goto LABEL_36;
    }
    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v30];
    if (v31)
    {
      if (v19 && v65 && v20 && v21)
      {
        v61 = v19;
        v32 = [(HMDCHIPXPCClientConnection *)v25 homeManager];
        id v33 = [v32 _homeWithUUID:v31];

        if (v33)
        {
          v60 = [(HMDCHIPXPCClientConnection *)v25 processInfo];
          v59 = [v60 mainBundle];
          id v34 = [v59 bundlePath];
          if (HMDIsSiriClientIdentifier(v34))
          {
            uint64_t v35 = 1;
          }
          else if (HMDIsFirstPartyClientIdentifier(v34))
          {
            uint64_t v35 = 5;
          }
          else
          {
            uint64_t v35 = 6;
          }

          uint64_t v58 = v35;
          id v19 = v61;
          [v33 invokeCommandWithNodeId:a4 endpointId:v61 clusterId:v65 commandId:v20 fields:v21 timedInvokeTimeout:v64 source:v58 completion:v22];
        }
        else
        {
          id v53 = (void *)MEMORY[0x230FBD990]();
          uint64_t v54 = v25;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v67 = v56;
            __int16 v68 = 2112;
            id v69 = v31;
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using unknown home UUID: %@", buf, 0x16u);
          }
          v57 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          v22[2](v22, 0, v57);

          id v33 = 0;
          id v19 = v61;
        }
        goto LABEL_35;
      }
      __int16 v46 = (void *)MEMORY[0x230FBD990]();
      id v47 = v25;
      __int16 v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v49 = v63 = v19;
        *(_DWORD *)buf = 138543362;
        v67 = v49;
        __int16 v50 = "%{public}@CHIP invoke command called with invalid nil parameter";
        id v51 = v48;
        uint32_t v52 = 12;
        goto LABEL_26;
      }
    }
    else
    {
      __int16 v46 = (void *)MEMORY[0x230FBD990]();
      id v47 = v25;
      __int16 v48 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v49 = v63 = v19;
        *(_DWORD *)buf = 138543618;
        v67 = v49;
        __int16 v68 = 2112;
        id v69 = v30;
        __int16 v50 = "%{public}@CHIP invoke command called with invalid home UUID string: %@";
        id v51 = v48;
        uint32_t v52 = 22;
LABEL_26:
        _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);

        id v19 = v63;
      }
    }

    id v33 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v22[2](v22, 0, v33);
LABEL_35:

LABEL_36:
    goto LABEL_37;
  }
  v36 = (void *)MEMORY[0x230FBD990]();
  v37 = v25;
  __int16 v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    id v39 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v67 = v39;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Invoke-command operation by backgrounded client not allowed", buf, 0xCu);
  }
  id v30 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
  v22[2](v22, 0, v30);
LABEL_37:
}

- (void)writeAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 value:(id)a8 timedWriteTimeout:(id)a9 completion:(id)a10
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = v17;
  id v60 = v18;
  id v20 = a7;
  id v21 = a8;
  id v59 = a9;
  id v22 = (void (**)(id, void, void *))a10;
  v23 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v23);

  id v24 = (void *)MEMORY[0x230FBD990]();
  int v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    __int16 v27 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138545154;
    v62 = v27;
    __int16 v63 = 2112;
    id v64 = v16;
    __int16 v65 = 2048;
    unint64_t v66 = a4;
    __int16 v67 = 2112;
    __int16 v68 = v19;
    __int16 v69 = 2112;
    id v70 = v60;
    __int16 v71 = 2112;
    id v72 = v20;
    __int16 v73 = 2112;
    id v74 = v21;
    __int16 v75 = 2112;
    id v76 = v59;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Writing attribute via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, attributeId %@, value %@, timedWriteTimeout %@", buf, 0x52u);
  }
  if ([(HMDCHIPXPCClientConnection *)v25 allowsOperation])
  {
    id v28 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v29 = v28;
    }
    else {
      __int16 v29 = 0;
    }
    id v30 = v29;

    if (!v30)
    {
      __int16 v38 = (void *)MEMORY[0x230FBD990]();
      id v39 = v25;
      __int16 v40 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        unint64_t v41 = v57 = v38;
        __int16 v42 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v62 = v41;
        __int16 v63 = 2112;
        id v64 = v28;
        __int16 v65 = 2112;
        unint64_t v66 = (unint64_t)v42;
        id v43 = v42;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@CHIP write attribute called with controller of unexpected class: %@ (%@)", buf, 0x20u);

        __int16 v38 = v57;
      }

      uint64_t v31 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v22[2](v22, 0, v31);
      goto LABEL_28;
    }
    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v30];
    if (v31)
    {
      if (v19 && v60 && v20 && v21)
      {
        v56 = v19;
        v32 = [(HMDCHIPXPCClientConnection *)v25 homeManager];
        id v33 = [v32 _homeWithUUID:v31];

        if (v33)
        {
          id v19 = v56;
          [v33 writeAttributeWithNodeId:a4 endpointId:v56 clusterId:v60 attributeId:v20 value:v21 timedWriteTimeout:v59 completion:v22];
        }
        else
        {
          id v51 = (void *)MEMORY[0x230FBD990]();
          uint32_t v52 = v25;
          id v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            uint64_t v54 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v62 = v54;
            __int16 v63 = 2112;
            id v64 = v31;
            _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using unknown home UUID: %@", buf, 0x16u);
          }
          v55 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          v22[2](v22, 0, v55);

          id v33 = 0;
          id v19 = v56;
        }
        goto LABEL_27;
      }
      __int16 v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = v25;
      __int16 v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v47 = v58 = v44;
        *(_DWORD *)buf = 138543362;
        v62 = v47;
        __int16 v48 = "%{public}@CHIP write attribute called with null values for nonnull parameter";
        id v49 = v46;
        uint32_t v50 = 12;
        goto LABEL_25;
      }
    }
    else
    {
      __int16 v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = v25;
      __int16 v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        id v47 = v58 = v44;
        *(_DWORD *)buf = 138543618;
        v62 = v47;
        __int16 v63 = 2112;
        id v64 = v30;
        __int16 v48 = "%{public}@CHIP write attribute called with invalid home UUID string: %@";
        id v49 = v46;
        uint32_t v50 = 22;
LABEL_25:
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);

        __int16 v44 = v58;
      }
    }

    id v33 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    v22[2](v22, 0, v33);
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  id v34 = (void *)MEMORY[0x230FBD990]();
  uint64_t v35 = v25;
  v36 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    v37 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v62 = v37;
    _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Write operation by backgrounded client not allowed", buf, 0xCu);
  }
  id v30 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
  v22[2](v22, 0, v30);
LABEL_29:
}

- (void)readAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 params:(id)a8 completion:(id)a9
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = v16;
  id v19 = v17;
  id v20 = a7;
  id v21 = v19;
  id v60 = v20;
  id v22 = a8;
  v23 = (void (**)(id, void, void *))a9;
  id v24 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v24);

  int v25 = (void *)MEMORY[0x230FBD990]();
  v26 = self;
  __int16 v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    id v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544898;
    v62 = v28;
    __int16 v63 = 2112;
    id v64 = v15;
    __int16 v65 = 2048;
    unint64_t v66 = a4;
    __int16 v67 = 2112;
    __int16 v68 = v18;
    __int16 v69 = 2112;
    id v70 = v21;
    __int16 v71 = 2112;
    id v72 = v60;
    __int16 v73 = 2112;
    id v74 = v22;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Reading attribute via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, attributeId %@, params %@", buf, 0x48u);
  }
  if ([(HMDCHIPXPCClientConnection *)v26 allowsOperation])
  {
    id v29 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }
    id v31 = v30;

    if (v31)
    {
      v32 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v31];
      if (v32)
      {
        v57 = v21;
        id v33 = v18;
        id v34 = [(HMDCHIPXPCClientConnection *)v26 homeManager];
        uint64_t v35 = [v34 _homeWithUUID:v32];

        if (v35)
        {
          id v18 = v33;
          v36 = v33;
          id v21 = v57;
          [v35 readAttributeWithNodeId:a4 endpointId:v36 clusterId:v57 attributeId:v60 params:v22 completion:v23];
        }
        else
        {
          id v51 = (void *)MEMORY[0x230FBD990]();
          uint32_t v52 = v26;
          id v53 = HMFGetOSLogHandle();
          id v18 = v33;
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v55 = uint64_t v54 = v51;
            *(_DWORD *)buf = 138543618;
            v62 = v55;
            __int16 v63 = 2112;
            id v64 = v32;
            _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using unknown home UUID: %@", buf, 0x16u);

            id v51 = v54;
          }

          v56 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
          v23[2](v23, 0, v56);

          uint64_t v35 = 0;
          id v21 = v57;
        }
      }
      else
      {
        id v47 = (void *)MEMORY[0x230FBD990]();
        __int16 v48 = v26;
        id v49 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          uint32_t v50 = v59 = v47;
          *(_DWORD *)buf = 138543618;
          v62 = v50;
          __int16 v63 = 2112;
          id v64 = v31;
          _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@CHIP Read attribute called with invalid home UUID string: %@", buf, 0x16u);

          id v47 = v59;
        }

        uint64_t v35 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
        v23[2](v23, 0, v35);
      }
    }
    else
    {
      unint64_t v41 = (void *)MEMORY[0x230FBD990]();
      __int16 v42 = v26;
      id v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        __int16 v44 = v58 = v41;
        id v45 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v62 = v44;
        __int16 v63 = 2112;
        id v64 = v29;
        __int16 v65 = 2112;
        unint64_t v66 = (unint64_t)v45;
        id v46 = v45;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@CHIP Read attribute called with controller of unexpected class: %@ (%@)", buf, 0x20u);

        unint64_t v41 = v58;
      }

      v32 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      v23[2](v23, 0, v32);
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x230FBD990]();
    __int16 v38 = v26;
    id v39 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      __int16 v40 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v62 = v40;
      _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_ERROR, "%{public}@Read operation by backgrounded client not allowed", buf, 0xCu);
    }
    id v31 = [MEMORY[0x263F087E8] hmErrorWithCode:17];
    v23[2](v23, 0, v31);
  }
}

- (void)getAnyDeviceControllerWithCompletion:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void, void *))a3;
  v5 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint32_t v52 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Retrieving any shared remote controller", buf, 0xCu);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v10 = [(HMDCHIPXPCClientConnection *)v7 homeManager];
  v11 = [v10 homes];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v41 = v4;
    obuint64_t j = v11;
    __int16 v40 = v7;
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        id v18 = v14;
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        id v14 = [v19 uuid];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v20 = [v19 hapAccessories];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v44;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v44 != v23) {
                objc_enumerationMutation(v20);
              }
              if ([*(id *)(*((void *)&v43 + 1) + 8 * j) supportsCHIP])
              {
                uint64_t v25 = [v19 uuid];

                id v15 = (void *)v25;
                goto LABEL_18;
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v55 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_18:
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v13);

    if (v15)
    {
      v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = v40;
      id v28 = HMFGetOSLogHandle();
      v4 = v41;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint32_t v52 = v29;
        __int16 v53 = 2112;
        uint64_t v54 = v15;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Retrieved shared remote controller: %@", buf, 0x16u);
      }
      id v30 = [v15 UUIDString];
      ((void (**)(id, void *, void *))v41)[2](v41, v30, 0);

      goto LABEL_32;
    }
    v7 = v40;
    v4 = v41;
    if (v14)
    {
      uint64_t v35 = (void *)MEMORY[0x230FBD990]();
      v36 = v40;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        __int16 v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint32_t v52 = v38;
        __int16 v53 = 2112;
        uint64_t v54 = v14;
        _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Retrieved shared remote controller with no paired CHIP accessory: %@", buf, 0x16u);
      }
      id v39 = [v14 UUIDString];
      ((void (**)(id, void *, void *))v41)[2](v41, v39, 0);

      id v15 = v14;
      goto LABEL_32;
    }
  }
  else
  {
  }
  id v31 = (void *)MEMORY[0x230FBD990]();
  v32 = v7;
  id v33 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    id v34 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    uint32_t v52 = v34;
    _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve any remote controller", buf, 0xCu);
  }
  id v15 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  v4[2](v4, 0, v15);
LABEL_32:
}

- (BOOL)allowsOperation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [(HMDCHIPXPCClientConnection *)self processInfo];
  int v4 = [v3 isForegrounded];

  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8)
    {
      v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      id v14 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Client foregrounded", (uint8_t *)&v13, 0xCu);
    }
    return 1;
  }
  else
  {
    if (v8)
    {
      v11 = HMFGetLogIdentifier();
      [(HMDCHIPXPCClientConnection *)v6 backgroundModeEntitled];
      uint64_t v12 = HMFBooleanToString();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Client is not foregrounded: entitlement %@", (uint8_t *)&v13, 0x16u);
    }
    return [(HMDCHIPXPCClientConnection *)v6 backgroundModeEntitled];
  }
}

- (void)_getDeviceControllerWithFabricId:(unint64_t)a3 accessories:(id)a4 home:(id)a5 remainingHomes:(id)a6 completion:(id)a7
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  while (1)
  {
    while ([v12 count])
    {
      uint64_t v16 = [v12 lastObject];
      [v12 removeLastObject];
      if ([v16 supportsCHIP])
      {
        id v22 = objc_alloc(MEMORY[0x263F42570]);
        uint64_t v23 = [v16 uuid];
        id v24 = (void *)[v22 initWithTarget:v23];

        uint64_t v25 = [MEMORY[0x263F42590] messageWithName:*MEMORY[0x263F0B338] destination:v24 payload:0];
        uint64_t v31 = MEMORY[0x263EF8330];
        uint64_t v32 = 3221225472;
        id v33 = __106__HMDCHIPXPCClientConnection__getDeviceControllerWithFabricId_accessories_home_remainingHomes_completion___block_invoke;
        id v34 = &unk_264A27430;
        unint64_t v40 = a3;
        uint64_t v35 = self;
        id v36 = v13;
        id v39 = v15;
        id v20 = v12;
        id v37 = v20;
        id v38 = v14;
        id v26 = v13;
        [v25 setResponseHandler:&v31];
        objc_msgSend(v16, "handleFetchCHIPPairingsMessage:", v25, v31, v32, v33, v34, v35);

        goto LABEL_9;
      }
    }
    if (![v14 count]) {
      break;
    }
    uint64_t v17 = [v14 lastObject];

    id v18 = (void *)MEMORY[0x263EFF980];
    id v19 = [v17 hapAccessories];
    id v20 = [v18 arrayWithArray:v19];

    uint64_t v21 = [v14 removeLastObject];
    id v13 = v17;
    id v12 = v20;
    if (!v17) {
      goto LABEL_11;
    }
  }

  id v20 = v12;
LABEL_11:
  __int16 v27 = (void *)MEMORY[0x230FBD990](v21);
  id v28 = self;
  id v29 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    id v30 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    __int16 v42 = v30;
    __int16 v43 = 2048;
    unint64_t v44 = a3;
    _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve remote controller with fabric Id %llu", buf, 0x16u);
  }
  id v26 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  (*((void (**)(id, void, id))v15 + 2))(v15, 0, v26);
LABEL_9:
}

void __106__HMDCHIPXPCClientConnection__getDeviceControllerWithFabricId_accessories_home_remainingHomes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v54[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F0AFB8];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  v9 = objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v7, v8);

  if (v9)
  {
    id v39 = v6;
    id v40 = v5;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v38 = v9;
    obuint64_t j = v9;
    uint64_t v10 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v44;
      unint64_t v13 = 0x263F08000;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v16 = (void *)MEMORY[0x230FBD990]();
          id v17 = *(id *)(a1 + 32);
          id v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v19 = __int16 v42 = v16;
            id v20 = [v15 home];
            [v20 identifier];
            uint64_t v21 = a1;
            uint64_t v22 = v11;
            id v24 = v23 = v12;
            *(_DWORD *)buf = 138543618;
            long long v48 = v19;
            __int16 v49 = 2112;
            long long v50 = v24;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Fetched CHIP pairing with fabric Id: %@", buf, 0x16u);

            uint64_t v12 = v23;
            uint64_t v11 = v22;
            a1 = v21;
            unint64_t v13 = 0x263F08000uLL;

            uint64_t v16 = v42;
          }

          uint64_t v25 = [v15 home];
          id v26 = [v25 identifier];
          __int16 v27 = [*(id *)(v13 + 2584) numberWithUnsignedLongLong:*(void *)(a1 + 72)];
          int v28 = [v26 isEqualToNumber:v27];

          if (v28)
          {
            id v29 = (void *)MEMORY[0x230FBD990]();
            id v30 = *(id *)(a1 + 32);
            uint64_t v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              uint64_t v32 = HMFGetLogIdentifier();
              id v33 = *(void **)(a1 + 72);
              id v34 = [*(id *)(a1 + 40) uuid];
              *(_DWORD *)buf = 138543874;
              long long v48 = v32;
              __int16 v49 = 2048;
              long long v50 = v33;
              __int16 v51 = 2112;
              uint32_t v52 = v34;
              _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Retrieved shared remote controller with fabric Id %llu: %@", buf, 0x20u);
            }
            uint64_t v35 = *(void *)(a1 + 64);
            id v36 = [*(id *)(a1 + 40) uuid];
            id v37 = [v36 UUIDString];
            (*(void (**)(uint64_t, void *, void))(v35 + 16))(v35, v37, 0);

            id v6 = v39;
            id v5 = v40;
            v9 = v38;
            goto LABEL_17;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v6 = v39;
    id v5 = v40;
    v9 = v38;
  }
  [*(id *)(a1 + 32) _getDeviceControllerWithFabricId:*(void *)(a1 + 72) accessories:*(void *)(a1 + 48) home:*(void *)(a1 + 40) remainingHomes:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
LABEL_17:
}

- (void)_registerReportHandlerWithHomeWithUUID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCHIPXPCClientConnection *)self homeManager];
  uint64_t v7 = [v6 _homeWithUUID:v4];

  if (v7)
  {
    BOOL v8 = [(HMDCHIPXPCClientConnection *)self subscribedHomeUUIDs];
    char v9 = [v8 containsObject:v4];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x230FBD990]();
      uint64_t v11 = self;
      uint64_t v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unint64_t v13 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        uint64_t v23 = v13;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Registering report handler with home with UUID: %@", buf, 0x16u);
      }
      id v14 = [(HMDCHIPXPCClientConnection *)v11 subscribedHomeUUIDs];
      [v14 addObject:v4];

      id v15 = objc_msgSend(NSNumber, "numberWithInt:", -[HMDCHIPXPCClientConnection pid](v11, "pid"));
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __69__HMDCHIPXPCClientConnection__registerReportHandlerWithHomeWithUUID___block_invoke;
      v20[3] = &unk_264A27408;
      v20[4] = v11;
      id v21 = v4;
      [v7 setCHIPReportHandlerWithSubscriber:v15 handler:v20];
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = self;
    id v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not register report handler using unknown home UUID: %@", buf, 0x16u);
    }
  }
}

void __69__HMDCHIPXPCClientConnection__registerReportHandlerWithHomeWithUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = *(id *)(a1 + 32);
  BOOL v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    char v9 = HMFGetLogIdentifier();
    int v13 = 138543874;
    id v14 = v9;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Dispatching report to client using nodeId %tu, reports %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [v5 xpcEncodedCHIPReportsFromHMFEncodedMessage];
  uint64_t v11 = [*(id *)(a1 + 32) remoteObjectProxy];
  uint64_t v12 = [*(id *)(a1 + 40) UUIDString];
  [v11 handleReportWithController:v12 nodeId:a2 values:v10 error:0];
}

- (void)deregisterReportHandlers
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x263EF8340];
  v3 = [(HMDCHIPXPCClientConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(HMDCHIPXPCClientConnection *)v2 subscribedHomeUUIDs];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    unint64_t v7 = 0x263F08000uLL;
    uint64_t v22 = v2;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v10 = [(HMDCHIPXPCClientConnection *)v2 homeManager];
        uint64_t v11 = [v10 _homeWithUUID:v9];

        if (v11)
        {
          uint64_t v12 = (void *)MEMORY[0x230FBD990]();
          int v13 = v2;
          id v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            uint64_t v15 = v5;
            uint64_t v16 = v6;
            v18 = unint64_t v17 = v7;
            uint64_t v19 = [v11 shortDescription];
            *(_DWORD *)buf = 138543618;
            id v29 = v18;
            __int16 v30 = 2112;
            uint64_t v31 = v19;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Deregistering report handlers from home: %@", buf, 0x16u);

            unint64_t v7 = v17;
            uint64_t v6 = v16;
            uint64_t v5 = v15;
            v2 = v22;
          }

          id v20 = objc_msgSend(*(id *)(v7 + 2584), "numberWithInt:", -[HMDCHIPXPCClientConnection pid](v13, "pid"));
          [v11 setCHIPReportHandlerWithSubscriber:v20 handler:0];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }

  id v21 = [(HMDCHIPXPCClientConnection *)v2 subscribedHomeUUIDs];
  [v21 removeAllObjects];
}

- (HMDCHIPXPCClientConnection)initWithRemoteObjectProxy:(id)a3 homeManager:(id)a4 pid:(int)a5 processInfo:(id)a6 backgroundModeEntitled:(BOOL)a7 workQueue:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDCHIPXPCClientConnection;
  uint64_t v19 = [(HMDCHIPXPCClientConnection *)&v24 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_remoteObjectProxy, a3);
    objc_storeWeak((id *)&v20->_homeManager, v16);
    v20->_pid = a5;
    objc_storeStrong((id *)&v20->_processInfo, a6);
    objc_storeStrong((id *)&v20->_workQueue, a8);
    id v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    subscribedHomeUUIDs = v20->_subscribedHomeUUIDs;
    v20->_subscribedHomeUUIDs = v21;

    v20->_backgroundModeEntitled = a7;
  }

  return v20;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t44_212917 != -1) {
    dispatch_once(&logCategory__hmf_once_t44_212917, &__block_literal_global_212918);
  }
  v2 = (void *)logCategory__hmf_once_v45_212919;
  return v2;
}

void __41__HMDCHIPXPCClientConnection_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v45_212919;
  logCategory__hmf_once_v45_212919 = v0;
}

@end