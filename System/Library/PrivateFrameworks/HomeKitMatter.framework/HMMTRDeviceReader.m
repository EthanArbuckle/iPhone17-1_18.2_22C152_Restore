@interface HMMTRDeviceReader
- (HMMTRAttributeReportDistributor)distributor;
- (HMMTRDeviceReader)initWithClientQueue:(id)a3 distributor:(id)a4 device:(id)a5 endpointID:(id)a6 clusterID:(id)a7 attributeID:(id)a8;
- (MTRDevice)device;
- (NSNumber)attributeID;
- (NSNumber)clusterID;
- (NSNumber)endpointID;
- (OS_dispatch_queue)clientQueue;
- (int64_t)reportTimeoutNSecs;
- (void)_readAttributeAfterAttributeListConfirmationWithCompletionHandler:(id)a3;
- (void)readAttributeWithCompletion:(id)a3;
- (void)setReportTimeoutNSecs:(int64_t)a3;
@end

@implementation HMMTRDeviceReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeID, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_distributor, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

- (NSNumber)attributeID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)clusterID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)endpointID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (MTRDevice)device
{
  return (MTRDevice *)objc_getProperty(self, a2, 32, 1);
}

- (HMMTRAttributeReportDistributor)distributor
{
  return (HMMTRAttributeReportDistributor *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReportTimeoutNSecs:(int64_t)a3
{
  self->_reportTimeoutNSecs = a3;
}

- (int64_t)reportTimeoutNSecs
{
  return self->_reportTimeoutNSecs;
}

- (void)_readAttributeAfterAttributeListConfirmationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(HMMTRDeviceReader *)self device];
  v6 = [(HMMTRDeviceReader *)self endpointID];
  v7 = [(HMMTRDeviceReader *)self clusterID];
  v8 = [(HMMTRDeviceReader *)self attributeID];
  id v9 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v10 = [v5 readAttributeWithEndpointID:v6 clusterID:v7 attributeID:v8 params:v9];

  if (v10)
  {
    v11 = [(HMMTRDeviceReader *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke;
    block[3] = &unk_2653770F0;
    id v43 = v4;
    id v42 = v10;
    id v12 = v4;
    dispatch_async(v11, block);
  }
  else
  {
    v13 = (void *)MEMORY[0x263F10C50];
    v14 = [(HMMTRDeviceReader *)self endpointID];
    v15 = [(HMMTRDeviceReader *)self clusterID];
    v16 = [(HMMTRDeviceReader *)self attributeID];
    v17 = [v13 attributePathWithEndpointID:v14 clusterID:v15 attributeID:v16];

    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__5078;
    v39 = __Block_byref_object_dispose__5079;
    id v40 = 0;
    v18 = [(HMMTRDeviceReader *)self distributor];
    v19 = [(HMMTRDeviceReader *)self clientQueue];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_2;
    v31[3] = &unk_265375E40;
    v34 = &v35;
    v31[4] = self;
    id v20 = v17;
    id v32 = v20;
    id v21 = v4;
    id v33 = v21;
    uint64_t v22 = [v18 registerHandlerForAttributePath:v20 queue:v19 handler:v31];
    v23 = (void *)v36[5];
    v36[5] = v22;

    dispatch_time_t v24 = dispatch_time(0, [(HMMTRDeviceReader *)self reportTimeoutNSecs]);
    v25 = [(HMMTRDeviceReader *)self clientQueue];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_3;
    v27[3] = &unk_2653781A0;
    v27[4] = self;
    id v28 = v20;
    id v29 = v21;
    v30 = &v35;
    id v26 = v21;
    id v12 = v20;
    dispatch_after(v24, v25, v27);

    _Block_object_dispose(&v35, 8);
  }
}

uint64_t __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v14 = v3;
    id v4 = [*(id *)(a1 + 32) distributor];
    [v4 deregisterHandlerForAttributePath:*(void *)(a1 + 40) registry:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    uint64_t v7 = *(void *)(a1 + 48);
    if (v14)
    {
      v8 = [v14 objectForKeyedSubscript:*MEMORY[0x263F10B90]];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
    else
    {
      v8 = [*(id *)(a1 + 32) device];
      id v9 = [*(id *)(a1 + 32) endpointID];
      v10 = [*(id *)(a1 + 32) clusterID];
      v11 = [*(id *)(a1 + 32) attributeID];
      id v12 = objc_alloc_init(MEMORY[0x263F10FA0]);
      v13 = [v8 readAttributeWithEndpointID:v9 clusterID:v10 attributeID:v11 params:v12];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v13);
    }
    id v3 = v14;
  }
}

uint64_t __87__HMMTRDeviceReader__readAttributeAfterAttributeListConfirmationWithCompletionHandler___block_invoke_3(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    v1 = (void *)result;
    v2 = [*(id *)(result + 32) distributor];
    [v2 deregisterHandlerForAttributePath:v1[5] registry:*(void *)(*(void *)(v1[7] + 8) + 40)];

    uint64_t v3 = *(void *)(v1[7] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(uint64_t (**)(void))(v1[6] + 16);
    return v5();
  }
  return result;
}

- (void)readAttributeWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMMTRDeviceReader *)self device];
  v6 = [(HMMTRDeviceReader *)self endpointID];
  uint64_t v7 = [(HMMTRDeviceReader *)self clusterID];
  v8 = [(HMMTRDeviceReader *)self attributeID];
  id v9 = objc_alloc_init(MEMORY[0x263F10FA0]);
  v10 = [v5 readAttributeWithEndpointID:v6 clusterID:v7 attributeID:v8 params:v9];

  if (v10)
  {
    v11 = [(HMMTRDeviceReader *)self clientQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke;
    block[3] = &unk_2653770F0;
    id v57 = v4;
    id v56 = v10;
    dispatch_async(v11, block);

    id v12 = v57;
  }
  else
  {
    v13 = [(HMMTRDeviceReader *)self device];
    id v14 = [(HMMTRDeviceReader *)self endpointID];
    v15 = [(HMMTRDeviceReader *)self clusterID];
    id v16 = objc_alloc_init(MEMORY[0x263F10FA0]);
    id v12 = [v13 readAttributeWithEndpointID:v14 clusterID:v15 attributeID:&unk_2702B54D8 params:v16];

    if (v12)
    {
      v17 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReadResultValue:v12 forIdentify:@"AttributeList"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      id v19 = v18;
      id v20 = [(HMMTRDeviceReader *)self attributeID];
      char v21 = [v19 containsObject:v20];

      uint64_t v22 = [(HMMTRDeviceReader *)self clientQueue];
      if (v21)
      {
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2;
        v51[3] = &unk_2653770F0;
        v51[4] = self;
        id v52 = v4;
        dispatch_async(v22, v51);

        v23 = v52;
      }
      else
      {
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_5;
        v53[3] = &unk_265377430;
        id v54 = v4;
        dispatch_async(v22, v53);

        v23 = v54;
      }
    }
    else
    {
      dispatch_time_t v24 = (void *)MEMORY[0x263F10C50];
      v25 = [(HMMTRDeviceReader *)self endpointID];
      id v26 = [(HMMTRDeviceReader *)self clusterID];
      v27 = [v24 attributePathWithEndpointID:v25 clusterID:v26 attributeID:&unk_2702B54D8];

      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x3032000000;
      v48 = __Block_byref_object_copy__5078;
      v49 = __Block_byref_object_dispose__5079;
      id v50 = 0;
      id v28 = [(HMMTRDeviceReader *)self distributor];
      id v29 = [(HMMTRDeviceReader *)self clientQueue];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_7;
      v41[3] = &unk_265375E40;
      v44 = &v45;
      v41[4] = self;
      id v30 = v27;
      id v42 = v30;
      id v31 = v4;
      id v43 = v31;
      uint64_t v32 = [v28 registerHandlerForAttributePath:v30 queue:v29 handler:v41];
      id v33 = (void *)v46[5];
      v46[5] = v32;

      dispatch_time_t v34 = dispatch_time(0, [(HMMTRDeviceReader *)self reportTimeoutNSecs]);
      uint64_t v35 = [(HMMTRDeviceReader *)self clientQueue];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2_9;
      v37[3] = &unk_2653781A0;
      id v40 = &v45;
      v37[4] = self;
      id v38 = v30;
      id v39 = v31;
      id v36 = v30;
      dispatch_after(v34, v35, v37);

      _Block_object_dispose(&v45, 8);
      id v12 = 0;
    }
  }
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readAttributeAfterAttributeListConfirmationWithCompletionHandler:*(void *)(a1 + 40)];
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v21 = v3;
    uint64_t v5 = [*(id *)(a1 + 32) distributor];
    [v5 deregisterHandlerForAttributePath:*(void *)(a1 + 40) registry:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    if (v21)
    {
      v8 = +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:");
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      v11 = [*(id *)(a1 + 32) attributeID];
      char v12 = [v10 containsObject:v11];

      if (v12) {
        id v3 = (id)[*(id *)(a1 + 32) _readAttributeAfterAttributeListConfirmationWithCompletionHandler:*(void *)(a1 + 48)];
      }
      else {
        id v3 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      id v14 = [*(id *)(a1 + 32) device];
      v15 = [*(id *)(a1 + 32) endpointID];
      id v16 = [*(id *)(a1 + 32) clusterID];
      v17 = [*(id *)(a1 + 32) attributeID];
      id v18 = objc_alloc_init(MEMORY[0x263F10FA0]);
      id v19 = [v14 readAttributeWithEndpointID:v15 clusterID:v16 attributeID:v17 params:v18];
      (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v19);
    }
    id v4 = v21;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __49__HMMTRDeviceReader_readAttributeWithCompletion___block_invoke_2_9(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 40))
  {
    v1 = (void *)result;
    v2 = [*(id *)(result + 32) distributor];
    [v2 deregisterHandlerForAttributePath:v1[5] registry:*(void *)(*(void *)(v1[7] + 8) + 40)];

    uint64_t v3 = *(void *)(v1[7] + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;

    uint64_t v5 = *(uint64_t (**)(void))(v1[6] + 16);
    return v5();
  }
  return result;
}

- (HMMTRDeviceReader)initWithClientQueue:(id)a3 distributor:(id)a4 device:(id)a5 endpointID:(id)a6 clusterID:(id)a7 attributeID:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRDeviceReader;
  id v18 = [(HMMTRDeviceReader *)&v24 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientQueue, a3);
    objc_storeStrong((id *)&v19->_distributor, a4);
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeStrong((id *)&v19->_endpointID, a6);
    objc_storeStrong((id *)&v19->_clusterID, a7);
    objc_storeStrong((id *)&v19->_attributeID, a8);
    v19->_reportTimeoutNSecs = 60000000000;
  }

  return v19;
}

@end