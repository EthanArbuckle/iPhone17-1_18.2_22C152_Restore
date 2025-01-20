@interface HMMTRIdentifyDevice
+ (id)logCategory;
- (HMMTRDeviceTopology)topology;
- (HMMTRIdentifyDevice)initWithDevice:(id)a3 topology:(id)a4 queue:(id)a5;
- (MTRDevice)device;
- (OS_dispatch_queue)queue;
- (id)mtrClusterDescriptorWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5;
- (id)mtrClusterIdentifyWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5;
- (void)_childNodesWithIdentifyForEndpoint:(unsigned __int16)a3 completionHandler:(id)a4;
- (void)_identifyClusterPresentAtEndpoint:(unsigned __int16)a3 completionHandler:(id)a4;
- (void)_issueIdentifyCommand:(unsigned __int16)a3 completionHandler:(id)a4;
- (void)_processChildNodesForEndpoint:(unsigned __int16)a3 completionHandler:(id)a4;
- (void)_validIdentifyNodeForParentAtEndpoint:(unsigned __int16)a3 completionHandler:(id)a4;
- (void)identifyWithEndpoint:(unsigned __int16)a3 completionHandler:(id)a4;
- (void)setDevice:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation HMMTRIdentifyDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topology, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (HMMTRDeviceTopology)topology
{
  return (HMMTRDeviceTopology *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDevice:(id)a3
{
}

- (MTRDevice)device
{
  return (MTRDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)mtrClusterIdentifyWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  uint64_t v5 = a4;
  v7 = (objc_class *)MEMORY[0x263F10D00];
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initWithDevice:v9 endpoint:v5 queue:v8];

  return v10;
}

- (id)mtrClusterDescriptorWithDevice:(id)a3 endpoint:(unsigned __int16)a4 queue:(id)a5
{
  uint64_t v5 = a4;
  v7 = (objc_class *)MEMORY[0x263F10CE8];
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)[[v7 alloc] initWithDevice:v9 endpoint:v5 queue:v8];

  return v10;
}

- (void)identifyWithEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    __int16 v17 = 1024;
    int v18 = v4;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Request for identify received at endpoint %u", buf, 0x12u);
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke;
  v12[3] = &unk_2653785A0;
  v12[4] = v8;
  id v13 = v6;
  __int16 v14 = v4;
  id v11 = v6;
  [(HMMTRIdentifyDevice *)v8 _identifyClusterPresentAtEndpoint:v4 completionHandler:v12];
}

void __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5)
  {
    id v6 = *(void **)(a1 + 32);
    if (a2)
    {
      uint64_t v7 = *(unsigned __int16 *)(a1 + 48);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_2;
      v16[3] = &unk_2653787C8;
      id v17 = *(id *)(a1 + 40);
      [v6 _issueIdentifyCommand:v7 completionHandler:v16];

      goto LABEL_10;
    }
    id v8 = [*(id *)(a1 + 32) topology];
    id v9 = [v8 getBridgeAggregateNodeEndpoint];

    v10 = [*(id *)(a1 + 32) topology];
    if (v10 && !*(_WORD *)(a1 + 48))
    {

      if (v9)
      {
        id v11 = *(void **)(a1 + 32);
        unsigned __int16 v12 = [v9 unsignedIntValue];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_3;
        v14[3] = &unk_265378578;
        id v13 = *(void **)(a1 + 40);
        v14[4] = *(void *)(a1 + 32);
        id v15 = v13;
        [v11 _issueIdentifyCommand:v12 completionHandler:v14];

        goto LABEL_9;
      }
    }
    else
    {
    }
    [*(id *)(a1 + 32) _processChildNodesForEndpoint:*(unsigned __int16 *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
LABEL_9:

    goto LABEL_10;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_10:
}

uint64_t __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__HMMTRIdentifyDevice_identifyWithEndpoint_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  uint64_t v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v8;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_ERROR, "%{public}@Identify on aggregator failed.", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_INFO, "%{public}@Identify on aggregator successful", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_processChildNodesForEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke;
  v8[3] = &unk_265378550;
  v8[4] = self;
  id v9 = v6;
  __int16 v10 = v4;
  id v7 = v6;
  [(HMMTRIdentifyDevice *)self _childNodesWithIdentifyForEndpoint:v4 completionHandler:v8];
}

void __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = v5;
    if ([v7 count])
    {
      id v8 = dispatch_group_create();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v37 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = v7;
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v32 != v10) {
              objc_enumerationMutation(obj);
            }
            int v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            dispatch_group_enter(v8);
            id v13 = *(void **)(a1 + 32);
            LOWORD(v12) = [v12 unsignedIntValue];
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_70;
            v28[3] = &unk_2653786B0;
            v30 = buf;
            v29 = v8;
            [v13 _issueIdentifyCommand:(unsigned __int16)v12 completionHandler:v28];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v9);
      }

      uint64_t v14 = [*(id *)(a1 + 32) queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_2;
      block[3] = &unk_265378528;
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(a1 + 40);
      v26 = buf;
      block[4] = v15;
      __int16 v27 = *(_WORD *)(a1 + 48);
      id v25 = v16;
      dispatch_group_notify(v8, v14, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v17 = (void *)MEMORY[0x2533B64D0]();
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        int v21 = *(unsigned __int16 *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v21;
        _os_log_impl(&dword_252495000, v19, OS_LOG_TYPE_ERROR, "%{public}@No endpoints found with identify cluster for parent endpoint: %u", buf, 0x12u);
      }
      uint64_t v22 = *(void *)(a1 + 40);
      id v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
      (*(void (**)(uint64_t, NSObject *))(v22 + 16))(v22, v8);
    }

    id v6 = 0;
  }
}

void __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_70(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__HMMTRIdentifyDevice__processChildNodesForEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = (void *)MEMORY[0x2533B64D0]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = HMFGetLogIdentifier();
      int v7 = *(unsigned __int16 *)(a1 + 56);
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 1024;
      int v13 = v7;
      _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_ERROR, "%{public}@No successful identify command issued for endpoint: %u", (uint8_t *)&v10, 0x12u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:5];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

- (void)_childNodesWithIdentifyForEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  dispatch_group_t v7 = dispatch_group_create();
  dispatch_group_t v8 = dispatch_group_create();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__9838;
  v35[4] = __Block_byref_object_dispose__9839;
  id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__9838;
  v33[4] = __Block_byref_object_dispose__9839;
  id v34 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke;
  v26[3] = &unk_265378500;
  v26[4] = self;
  __int16 v32 = v4;
  id v9 = v6;
  id v29 = v9;
  int v10 = v8;
  __int16 v27 = v10;
  v30 = v33;
  id v11 = v7;
  v28 = v11;
  long long v31 = v35;
  __int16 v12 = (void (**)(void, void, void))MEMORY[0x2533B66E0](v26);
  int v13 = [(HMMTRIdentifyDevice *)self topology];

  if (v13)
  {
    uint64_t v14 = [(HMMTRIdentifyDevice *)self topology];
    uint64_t v15 = [NSNumber numberWithUnsignedShort:v4];
    v16 = [v14 getPartsListAtEndpoint:v15];

    if (!v4 && !v16)
    {
      id v17 = [(HMMTRIdentifyDevice *)self topology];
      v16 = [v17 getEndpoints];
    }
    ((void (**)(void, void *, void))v12)[2](v12, v16, 0);
  }
  else
  {
    id v18 = [(HMMTRIdentifyDevice *)self device];
    uint64_t v19 = [(HMMTRIdentifyDevice *)self queue];
    v16 = [(HMMTRIdentifyDevice *)self mtrClusterDescriptorWithDevice:v18 endpoint:v4 queue:v19];

    id v20 = objc_alloc_init(MEMORY[0x263F10FA0]);
    int v21 = [v16 readAttributePartsListWithParams:v20];

    uint64_t v22 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v21 forIdentify:@"partsList"];
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
      id v25 = 0;
    }
    else
    {
      id v25 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
    }
    ((void (**)(void, id, void *))v12)[2](v12, v24, v25);
    if (!v24) {
  }
    }
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    dispatch_group_t v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = *(unsigned __int16 *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      v79 = v10;
      __int16 v80 = 1024;
      int v81 = v11;
      __int16 v82 = 2112;
      id v83 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get parts list for endpoint: %u, error: %@", buf, 0x1Cu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v47 = v5;
    id v12 = v5;
    int v13 = (void *)MEMORY[0x2533B64D0]();
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = *(unsigned __int16 *)(a1 + 80);
      *(_DWORD *)buf = 138543874;
      v79 = v16;
      __int16 v80 = 1024;
      int v81 = v17;
      __int16 v82 = 2112;
      id v83 = v12;
      _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Endpoint %u, child nodes: %@", buf, 0x1Cu);
    }
    if (*(_WORD *)(a1 + 80))
    {
      long long v59 = 0uLL;
      long long v60 = 0uLL;
      long long v57 = 0uLL;
      long long v58 = 0uLL;
      id obj = v12;
      uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v23 = *(void **)(a1 + 32);
            unsigned __int16 v24 = [v22 unsignedIntValue];
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 3221225472;
            v53[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_3;
            v53[3] = &unk_265378488;
            id v25 = *(id *)(a1 + 48);
            uint64_t v26 = *(void *)(a1 + 72);
            v55 = v22;
            uint64_t v56 = v26;
            id v54 = v25;
            [v23 _identifyClusterPresentAtEndpoint:v24 completionHandler:v53];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v76 count:16];
        }
        while (v19);
      }

      __int16 v27 = *(NSObject **)(a1 + 48);
      v28 = [*(id *)(a1 + 32) queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_4;
      block[3] = &unk_2653784B0;
      id v29 = *(id *)(a1 + 56);
      uint64_t v30 = *(void *)(a1 + 72);
      id v51 = v29;
      uint64_t v52 = v30;
      dispatch_group_notify(v27, v28, block);

      long long v31 = v51;
    }
    else
    {
      long long v74 = 0uLL;
      long long v75 = 0uLL;
      long long v72 = 0uLL;
      long long v73 = 0uLL;
      id obja = v12;
      uint64_t v32 = [obja countByEnumeratingWithState:&v72 objects:v77 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v73 != v34) {
              objc_enumerationMutation(obja);
            }
            id v36 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
            char v37 = *(void **)(a1 + 32);
            unsigned __int16 v38 = [v36 unsignedIntValue];
            v67[0] = MEMORY[0x263EF8330];
            v67[1] = 3221225472;
            v67[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_63;
            v67[3] = &unk_265378460;
            id v39 = *(id *)(a1 + 40);
            uint64_t v40 = *(void *)(a1 + 32);
            id v68 = v39;
            uint64_t v69 = v40;
            uint64_t v41 = *(void *)(a1 + 64);
            v70 = v36;
            uint64_t v71 = v41;
            [v37 _validIdentifyNodeForParentAtEndpoint:v38 completionHandler:v67];
          }
          uint64_t v33 = [obja countByEnumeratingWithState:&v72 objects:v77 count:16];
        }
        while (v33);
      }

      v42 = *(NSObject **)(a1 + 40);
      v43 = [*(id *)(a1 + 32) queue];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_65;
      v61[3] = &unk_2653784D8;
      uint64_t v44 = *(void *)(a1 + 64);
      v61[4] = *(void *)(a1 + 32);
      uint64_t v65 = v44;
      id v62 = obja;
      id v45 = *(id *)(a1 + 48);
      uint64_t v46 = *(void *)(a1 + 72);
      id v63 = v45;
      uint64_t v66 = v46;
      id v64 = *(id *)(a1 + 56);
      dispatch_group_notify(v42, v43, v61);

      long long v31 = v62;
    }

    id v5 = v47;
  }
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_63(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8 && (a2 & 1) == 0)
  {
    id v9 = (void *)MEMORY[0x2533B64D0]();
    id v10 = *(id *)(a1 + 40);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = [*(id *)(a1 + 48) unsignedIntValue];
      *(_DWORD *)buf = 138543874;
      id v25 = v12;
      __int16 v26 = 1024;
      int v27 = v13;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_252495000, v11, OS_LOG_TYPE_INFO, "%{public}@Node %u is not a valid node for identify. Invalidating child nodes: %@", buf, 0x1Cu);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 48)];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_65(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v34 = v5;
    __int16 v35 = 2112;
    uint64_t v36 = v6;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@All invalid endpoints for identify: %@", buf, 0x16u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) containsObject:v12] & 1) == 0)
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          int v13 = *(void **)(a1 + 32);
          unsigned __int16 v14 = [v12 unsignedIntValue];
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_66;
          v24[3] = &unk_265378488;
          id v15 = *(id *)(a1 + 48);
          uint64_t v16 = *(void *)(a1 + 72);
          __int16 v26 = v12;
          uint64_t v27 = v16;
          id v25 = v15;
          [v13 _identifyClusterPresentAtEndpoint:v14 completionHandler:v24];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  uint64_t v17 = *(NSObject **)(a1 + 48);
  uint64_t v18 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_2;
  block[3] = &unk_2653784B0;
  id v19 = *(id *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 72);
  id v22 = v19;
  uint64_t v23 = v20;
  dispatch_group_notify(v17, v18, block);
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

void __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_66(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (!v5 && a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __76__HMMTRIdentifyDevice__childNodesWithIdentifyForEndpoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), 0);
}

- (void)_issueIdentifyCommand:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v10;
    __int16 v21 = 1024;
    int v22 = v4;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Issuing identify command at endpoint: %u", buf, 0x12u);
  }
  int v11 = [(HMMTRIdentifyDevice *)v8 device];
  id v12 = [(HMMTRIdentifyDevice *)v8 queue];
  int v13 = [(HMMTRIdentifyDevice *)v8 mtrClusterIdentifyWithDevice:v11 endpoint:v4 queue:v12];

  id v14 = objc_alloc_init(MEMORY[0x263F10EB8]);
  [v14 setIdentifyTime:&unk_2702B5FA0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__HMMTRIdentifyDevice__issueIdentifyCommand_completionHandler___block_invoke;
  v16[3] = &unk_265378438;
  __int16 v18 = v4;
  void v16[4] = v8;
  id v17 = v6;
  id v15 = v6;
  [v13 identifyWithParams:v14 expectedValues:0 expectedValueInterval:0 completion:v16];
}

void __63__HMMTRIdentifyDevice__issueIdentifyCommand_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    int v8 = *(unsigned __int16 *)(a1 + 48);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@Identify command status for endpoint: %u, error: %@", (uint8_t *)&v9, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_validIdentifyNodeForParentAtEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v62 = a4;
  id v6 = (void *)MEMORY[0x2533B64D0]();
  id v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v86 = v9;
    __int16 v87 = 1024;
    int v88 = v4;
    _os_log_impl(&dword_252495000, v8, OS_LOG_TYPE_INFO, "%{public}@Checking validity of endpoint: %u for identify", buf, 0x12u);
  }
  uint64_t v10 = [(HMMTRIdentifyDevice *)v7 device];
  __int16 v11 = [(HMMTRIdentifyDevice *)v7 queue];
  int v12 = [(HMMTRIdentifyDevice *)v7 mtrClusterDescriptorWithDevice:v10 endpoint:v4 queue:v11];

  id v13 = objc_alloc_init(MEMORY[0x263F10FA0]);
  id v63 = v12;
  id v14 = [v12 readAttributeDeviceTypeListWithParams:v13];

  if (v14)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
  }
  uint64_t v72 = *MEMORY[0x263F10C18];
  uint64_t v16 = objc_msgSend(v14, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;

  v61 = v14;
  if ([v18 isEqual:*MEMORY[0x263F10B68]])
  {
    uint64_t v67 = *MEMORY[0x263F10C30];
    id v19 = objc_msgSend(v14, "objectForKeyedSubscript:");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    id v21 = v20;

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v79 objects:v84 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v80;
      uint64_t v74 = *MEMORY[0x263F10B90];
      uint64_t v71 = *MEMORY[0x263F10C10];
      char v64 = 1;
      uint64_t v26 = *MEMORY[0x263F10B88];
      uint64_t v65 = *(void *)v80;
      id v66 = v22;
      do
      {
        uint64_t v27 = 0;
        uint64_t v68 = v24;
        do
        {
          if (*(void *)v80 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v28 = *(void **)(*((void *)&v79 + 1) + 8 * v27);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v73 = v27;
            long long v29 = [v28 objectForKeyedSubscript:v74];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              long long v30 = v29;
            }
            else {
              long long v30 = 0;
            }
            id v31 = v30;

            uint64_t v32 = [v31 objectForKeyedSubscript:v72];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v33 = v32;
            }
            else {
              uint64_t v33 = 0;
            }
            id v34 = v33;

            if ([v34 isEqual:v71])
            {
              id v70 = v34;
              __int16 v35 = [v31 objectForKeyedSubscript:v67];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v36 = v35;
              }
              else {
                uint64_t v36 = 0;
              }
              id v37 = v36;

              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              id v38 = v37;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v83 count:16];
              if (v39)
              {
                uint64_t v40 = v39;
                id v69 = v31;
                uint64_t v41 = *(void *)v76;
                while (2)
                {
                  for (uint64_t i = 0; i != v40; ++i)
                  {
                    if (*(void *)v76 != v41) {
                      objc_enumerationMutation(v38);
                    }
                    v43 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      uint64_t v44 = [v43 objectForKeyedSubscript:v26];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        id v45 = v44;
                      }
                      else {
                        id v45 = 0;
                      }
                      id v46 = v45;

                      if ([v46 isEqual:&unk_2702B5F70])
                      {
                        id v47 = [v43 objectForKeyedSubscript:v74];
                        objc_opt_class();
                        v48 = (objc_opt_isKindOfClass() & 1) != 0 ? v47 : 0;
                        id v49 = v48;

                        v50 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v49 forIdentify:@"deviceType"];

                        id v51 = v50;
                        objc_opt_class();
                        id v52 = (objc_opt_isKindOfClass() & 1) != 0 ? v51 : 0;
                        id v53 = v52;

                        char v54 = [v53 isEqual:&unk_2702B5F88];
                        if (v54)
                        {

                          char v64 = 0;
                          goto LABEL_52;
                        }
                      }
                    }
                  }
                  uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v83 count:16];
                  if (v40) {
                    continue;
                  }
                  break;
                }
LABEL_52:
                id v31 = v69;
              }

              uint64_t v25 = v65;
              id v22 = v66;
              uint64_t v24 = v68;
              uint64_t v27 = v73;
              id v34 = v70;
            }
            else
            {
              uint64_t v27 = v73;
            }

            id v18 = v34;
          }
          ++v27;
        }
        while (v27 != v24);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v79 objects:v84 count:16];
      }
      while (v24);
    }
    else
    {
      char v64 = 1;
    }

    uint64_t v55 = v64 & 1;
    uint64_t v56 = v15;
    if (v15) {
      goto LABEL_62;
    }
  }
  else
  {
    uint64_t v55 = 1;
    uint64_t v56 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];

    if (v56) {
LABEL_62:
    }
      (*((void (**)(id, void, void, void *))v62 + 2))(v62, 0, 0, v56);
  }
  id v57 = objc_alloc_init(MEMORY[0x263F10FA0]);
  long long v58 = [v63 readAttributePartsListWithParams:v57];

  long long v59 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v58 forIdentify:@"partsList"];
  if (!v59)
  {
    uint64_t v60 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];

    uint64_t v56 = (void *)v60;
  }
  (*((void (**)(id, uint64_t, void *, void *))v62 + 2))(v62, v55, v59, v56);
}

- (void)_identifyClusterPresentAtEndpoint:(unsigned __int16)a3 completionHandler:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(HMMTRIdentifyDevice *)self topology];

  if (v7)
  {
    int v8 = [(HMMTRIdentifyDevice *)self topology];
    int v9 = [NSNumber numberWithUnsignedShort:v4];
    uint64_t v10 = [v8 getClustersInUseAtEndpoint:v9];

    uint64_t v11 = [v10 containsObject:&unk_2702B5F58];
    int v12 = (void *)MEMORY[0x2533B64D0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v47 = v15;
      __int16 v48 = 1024;
      int v49 = v4;
      __int16 v50 = 2112;
      id v51 = v16;
      _os_log_impl(&dword_252495000, v14, OS_LOG_TYPE_INFO, "%{public}@Identify cluster found at endpoint %u: %@", buf, 0x1Cu);
    }
    v6[2](v6, v11, 0);
  }
  else
  {
    id v17 = [(HMMTRIdentifyDevice *)self device];
    id v18 = [(HMMTRIdentifyDevice *)self queue];
    uint64_t v10 = [(HMMTRIdentifyDevice *)self mtrClusterDescriptorWithDevice:v17 endpoint:v4 queue:v18];

    id v19 = objc_alloc_init(MEMORY[0x263F10FA0]);
    uint64_t v20 = [v10 readAttributeServerListWithParams:v19];

    id v21 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v20 forIdentify:@"serverList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;

    uint64_t v24 = (void *)MEMORY[0x2533B64D0]();
    uint64_t v25 = self;
    uint64_t v26 = HMFGetOSLogHandle();
    uint64_t v27 = v26;
    if (v23)
    {
      uint64_t v40 = v20;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        long long v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v47 = v28;
        __int16 v48 = 1024;
        int v49 = v4;
        __int16 v50 = 2112;
        id v51 = v23;
        _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_INFO, "%{public}@Found endpoint %u clusters: %@", buf, 0x1Cu);
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v29 = v23;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v42 != v32) {
              objc_enumerationMutation(v29);
            }
            if ([*(id *)(*((void *)&v41 + 1) + 8 * i) isEqualToNumber:&unk_2702B5F58])
            {
              id v34 = (void *)MEMORY[0x2533B64D0]();
              __int16 v35 = v25;
              uint64_t v36 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                id v37 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                id v47 = v37;
                __int16 v48 = 1024;
                int v49 = v4;
                _os_log_impl(&dword_252495000, v36, OS_LOG_TYPE_INFO, "%{public}@Found identify cluster at endpoint: %u", buf, 0x12u);
              }
              v6[2](v6, 1, 0);

              goto LABEL_23;
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v31) {
            continue;
          }
          break;
        }
      }

      v6[2](v6, 0, 0);
LABEL_23:
      uint64_t v20 = v40;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v38 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v47 = v38;
        __int16 v48 = 1024;
        int v49 = v4;
        _os_log_impl(&dword_252495000, v27, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the server list at endpoint: %u", buf, 0x12u);
      }
      uint64_t v39 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F10BB0] code:1 userInfo:0];
      ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v39);
    }
  }
}

- (HMMTRIdentifyDevice)initWithDevice:(id)a3 topology:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMTRIdentifyDevice;
  int v12 = [(HMMTRIdentifyDevice *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    objc_storeStrong((id *)&v13->_topology, a4);
    objc_storeStrong((id *)&v13->_queue, a5);
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26_9881 != -1) {
    dispatch_once(&logCategory__hmf_once_t26_9881, &__block_literal_global_9882);
  }
  v2 = (void *)logCategory__hmf_once_v27_9883;
  return v2;
}

uint64_t __34__HMMTRIdentifyDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v27_9883;
  logCategory__hmf_once_v27_9883 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end