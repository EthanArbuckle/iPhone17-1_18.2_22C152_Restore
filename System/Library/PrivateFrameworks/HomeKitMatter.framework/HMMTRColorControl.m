@interface HMMTRColorControl
+ (id)logCategory;
- (HMMTRColorControl)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
- (id)logIdentifier;
- (void)moveToCustomColorTemperatureValue:(id)a3 transitionTime:(id)a4 completionHandler:(id)a5;
- (void)moveToCustomColorTemperatureWithParams:(id)a3 completionHandler:(id)a4;
- (void)moveToPluginColorTemperatureWithParams:(id)a3 completionHandler:(id)a4;
- (void)readAttributePluginColorTemperatureMiredsWithCompletionHandler:(id)a3;
- (void)readColorModeAndColorTemperatureWithCompletion:(id)a3;
- (void)readColorTemperatureAttributesWithCompletion:(id)a3 queue:(id)a4;
- (void)readStartUpColorTemperatureWithCompletion:(id)a3;
- (void)stopMoveToColorTemperatureCommandWithCompletion:(id)a3;
- (void)subscribeAttributeReportForColorModeWithCompletion:(id)a3;
- (void)supportsColorTemperatureRangeWithMinColorTemperature:(id)a3 maxColorTemperature:(id)a4 completion:(id)a5 queue:(id)a6;
- (void)writeStartUpColorTemperature:(id)a3 completion:(id)a4;
@end

@implementation HMMTRColorControl

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMMTRColorControl *)self endpointID];
  v4 = [v2 stringWithFormat:@"enddePoint/%@", v3];

  return v4;
}

- (void)readAttributePluginColorTemperatureMiredsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke;
  v6[3] = &unk_2653789A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MTRBaseClusterColorControl *)self readAttributeColorModeWithCompletionHandler:v6];
}

void __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [*(id *)(a1 + 32) endpointID];
      *(_DWORD *)buf = 138543874;
      v23 = v10;
      __int16 v24 = 2112;
      v25 = v11;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to read colorMode for endPoint: %@ with error: %@", buf, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F41FD8] code:15 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  else if ([v5 integerValue] == 2)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke_14;
    v20[3] = &unk_265377990;
    v14 = *(void **)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    [v14 readAttributeColorTemperatureMiredsWithCompletion:v20];
  }
  else
  {
    v15 = (void *)MEMORY[0x2533B64D0]();
    id v16 = *(id *)(a1 + 32);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      v19 = [*(id *)(a1 + 32) endpointID];
      *(_DWORD *)buf = 138544130;
      v23 = v18;
      __int16 v24 = 2112;
      v25 = &unk_2702B5640;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_INFO, "%{public}@Returning color temp: %@ because colorMode: %@ on accessory endPoint: %@ is not color temp", buf, 0x2Au);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __84__HMMTRColorControl_readAttributePluginColorTemperatureMiredsWithCompletionHandler___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)moveToPluginColorTemperatureWithParams:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263F10D68];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v10 = [v8 colorTemperature];
  [v9 setColorTemperature:v10];

  v11 = [v8 transitionTime];

  [v9 setTransitionTime:v11];
  [v9 setOptionsMask:&unk_2702B5628];
  [v9 setOptionsOverride:&unk_2702B5628];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HMMTRColorControl_moveToPluginColorTemperatureWithParams_completionHandler___block_invoke;
  v14[3] = &unk_265377368;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [(MTRBaseClusterColorControl *)self moveToColorTemperatureWithParams:v13 completionHandler:v14];
}

void __78__HMMTRColorControl_moveToPluginColorTemperatureWithParams_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) colorTemperature];
    id v9 = [*(id *)(a1 + 40) optionsMask];
    int v10 = 138544130;
    v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@moveToColorTemperatureWithParams colorTemperature %@, optionsMask %@, error %@", (uint8_t *)&v10, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)readColorTemperatureAttributesWithCompletion:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(HMMTRColorControlColorTemperatureAttributes);
  id v9 = dispatch_group_create();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__5975;
  v34[4] = __Block_byref_object_dispose__5976;
  id v35 = 0;
  dispatch_group_enter(v9);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke;
  v30[3] = &unk_265375F20;
  int v10 = v8;
  v31 = v10;
  v33 = v34;
  v11 = v9;
  v32 = v11;
  [(MTRBaseClusterColorControl *)self readAttributeColorModeWithCompletion:v30];
  dispatch_group_enter(v11);
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_2;
  v26[3] = &unk_265375F20;
  __int16 v12 = v10;
  id v27 = v12;
  v29 = v34;
  id v13 = v11;
  __int16 v28 = v13;
  [(MTRBaseClusterColorControl *)self readAttributeRemainingTimeWithCompletion:v26];
  dispatch_group_enter(v13);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_3;
  v22[3] = &unk_265375F20;
  __int16 v14 = v12;
  v23 = v14;
  v25 = v34;
  id v15 = v13;
  __int16 v24 = v15;
  [(MTRBaseClusterColorControl *)self readAttributeColorTemperatureMiredsWithCompletion:v22];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_4;
  v18[3] = &unk_265377918;
  v19 = v14;
  id v20 = v6;
  id v21 = v34;
  __int16 v16 = v14;
  id v17 = v6;
  dispatch_group_notify(v15, v7, v18);

  _Block_object_dispose(v34, 8);
}

void __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setColorMode:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setRemainingTime:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setColorTemperatureMireds:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __72__HMMTRColorControl_readColorTemperatureAttributesWithCompletion_queue___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)readColorModeAndColorTemperatureWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke;
  v6[3] = &unk_2653789A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MTRBaseClusterColorControl *)self readAttributeColorModeWithCompletion:v6];
}

void __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke_2;
    v7[3] = &unk_2653789A0;
    uint64_t v6 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v8 = v5;
    [v6 readAttributeColorTemperatureMiredsWithCompletion:v7];
  }
}

uint64_t __68__HMMTRColorControl_readColorModeAndColorTemperatureWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (a3) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(v4 + 16))(v4, 0, 0, a3);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, *(void *)(a1 + 32), a2);
  }
}

- (void)subscribeAttributeReportForColorModeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F10FE8]) initWithMinInterval:&unk_2702B5628 maxInterval:&unk_2702B5628];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__HMMTRColorControl_subscribeAttributeReportForColorModeWithCompletion___block_invoke;
  v7[3] = &unk_2653789A0;
  void v7[4] = self;
  id v8 = v4;
  uint64_t v6 = (void (**)(id, void))v4;
  [(MTRBaseClusterColorControl *)self subscribeAttributeColorModeWithParams:v5 subscriptionEstablished:0 reportHandler:v7];
  v6[2](v6, 0);
}

void __72__HMMTRColorControl_subscribeAttributeReportForColorModeWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x2533B64D0]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    int v11 = 138543874;
    __int16 v12 = v10;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Received attribute report for colorMode value: %@ error: %@", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)stopMoveToColorTemperatureCommandWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F10D88]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMMTRColorControl_stopMoveToColorTemperatureCommandWithCompletion___block_invoke;
  v7[3] = &unk_2653787C8;
  id v8 = v4;
  id v6 = v4;
  [(MTRBaseClusterColorControl *)self stopMoveStepWithParams:v5 completion:v7];
}

uint64_t __69__HMMTRColorControl_stopMoveToColorTemperatureCommandWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)readStartUpColorTemperatureWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__HMMTRColorControl_readStartUpColorTemperatureWithCompletion___block_invoke;
  v6[3] = &unk_265377990;
  id v7 = v4;
  id v5 = v4;
  [(MTRBaseClusterColorControl *)self readAttributeStartUpColorTemperatureMiredsWithCompletion:v6];
}

uint64_t __63__HMMTRColorControl_readStartUpColorTemperatureWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)writeStartUpColorTemperature:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__HMMTRColorControl_writeStartUpColorTemperature_completion___block_invoke;
  v8[3] = &unk_2653787C8;
  id v9 = v6;
  id v7 = v6;
  [(MTRBaseClusterColorControl *)self writeAttributeStartUpColorTemperatureMiredsWithValue:a3 completion:v8];
}

uint64_t __61__HMMTRColorControl_writeStartUpColorTemperature_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)supportsColorTemperatureRangeWithMinColorTemperature:(id)a3 maxColorTemperature:(id)a4 completion:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = a6;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__5975;
  v47[4] = __Block_byref_object_dispose__5976;
  id v48 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy__5975;
  v43[4] = __Block_byref_object_dispose__5976;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__5975;
  v41[4] = __Block_byref_object_dispose__5976;
  id v42 = 0;
  id v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke;
  v37[3] = &unk_265375ED0;
  v39 = v45;
  v40 = v47;
  v37[4] = self;
  __int16 v15 = v14;
  v38 = v15;
  [(MTRBaseClusterColorControl *)self readAttributeColorCapabilitiesWithCompletion:v37];
  dispatch_group_enter(v15);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_4;
  v33[3] = &unk_265375ED0;
  id v35 = v43;
  v36 = v47;
  v33[4] = self;
  id v16 = v15;
  v34 = v16;
  [(MTRBaseClusterColorControl *)self readAttributeColorTempPhysicalMinMiredsWithCompletion:v33];
  dispatch_group_enter(v16);
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_5;
  v29[3] = &unk_265375ED0;
  v29[4] = self;
  v31 = v41;
  v32 = v47;
  uint64_t v17 = v16;
  uint64_t v30 = v17;
  [(MTRBaseClusterColorControl *)self readAttributeColorTempPhysicalMaxMiredsWithCompletion:v29];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_6;
  block[3] = &unk_265375EF8;
  v25 = v45;
  __int16 v26 = v43;
  block[4] = self;
  id v22 = v10;
  id v27 = v41;
  __int16 v28 = v47;
  id v23 = v11;
  id v24 = v12;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_group_notify(v17, v13, block);

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);
}

void __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = ([v5 unsignedIntValue] & 0x10) != 0;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x2533B64D0]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543618;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_252495000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to read color control attribute colorCapabilities with error: %@", (uint8_t *)&v11, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      __int16 v13 = v11;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to read color control attribute physicalMinMireds with error: %@", (uint8_t *)&v12, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    id v8 = (void *)MEMORY[0x2533B64D0]();
    id v9 = *(id *)(a1 + 32);
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      __int16 v13 = v11;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_252495000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to read color control attribute physicalMaxMireds with error: %@", (uint8_t *)&v12, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __111__HMMTRColorControl_supportsColorTemperatureRangeWithMinColorTemperature_maxColorTemperature_completion_queue___block_invoke_6(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x2533B64D0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    int v16 = 138544898;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    uint64_t v27 = v10;
    __int16 v28 = 2112;
    uint64_t v29 = v11;
    _os_log_impl(&dword_252495000, v4, OS_LOG_TYPE_INFO, "%{public}@Read color control attribute colorCapabilities supportsColorTempFeature: %@ accessoryRange: [%@ : %@]  allowedRange: [%@ : %@] error: %@", (uint8_t *)&v16, 0x48u);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && (uint64_t v12 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) longValue],
        v12 <= [*(id *)(a1 + 40) longValue])
    && (uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) longValue],
        v13 >= [*(id *)(a1 + 48) longValue]))
  {
    __int16 v14 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    __int16 v14 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  return v14();
}

- (void)moveToCustomColorTemperatureWithParams:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (objc_class *)MEMORY[0x263F10D68];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  uint64_t v10 = [v8 colorTemperatureMireds];
  [v9 setColorTemperatureMireds:v10];

  uint64_t v11 = [v8 transitionTime];

  [v9 setTransitionTime:v11];
  [v9 setOptionsMask:&unk_2702B5628];
  [v9 setOptionsOverride:&unk_2702B5628];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__HMMTRColorControl_moveToCustomColorTemperatureWithParams_completionHandler___block_invoke;
  v14[3] = &unk_265377368;
  v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v12 = v6;
  id v13 = v9;
  [(MTRBaseClusterColorControl *)self moveToColorTemperatureWithParams:v13 completion:v14];
}

void __78__HMMTRColorControl_moveToCustomColorTemperatureWithParams_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) colorTemperature];
    id v9 = [*(id *)(a1 + 40) optionsMask];
    int v10 = 138544130;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_DEBUG, "%{public}@moveToColorTemperatureWithParams completed with colorTemperature %@, optionsMask %@, error %@", (uint8_t *)&v10, 0x2Au);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)moveToCustomColorTemperatureValue:(id)a3 transitionTime:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (objc_class *)MEMORY[0x263F10D68];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  [v12 setColorTemperatureMireds:v11];

  [v12 setTransitionTime:v10];
  [v12 setOptionsMask:&unk_2702B5628];
  [v12 setOptionsOverride:&unk_2702B5628];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __88__HMMTRColorControl_moveToCustomColorTemperatureValue_transitionTime_completionHandler___block_invoke;
  v15[3] = &unk_265377368;
  v15[4] = self;
  id v16 = v12;
  id v17 = v8;
  id v13 = v8;
  id v14 = v12;
  [(MTRBaseClusterColorControl *)self moveToColorTemperatureWithParams:v14 completion:v15];
}

void __88__HMMTRColorControl_moveToCustomColorTemperatureValue_transitionTime_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = [*(id *)(a1 + 40) colorTemperature];
    id v9 = [*(id *)(a1 + 40) transitionTime];
    id v10 = [*(id *)(a1 + 40) optionsMask];
    int v11 = 138544386;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_252495000, v6, OS_LOG_TYPE_INFO, "%{public}@moveToColorTemperatureWithParams completed with colorTemperature %@, transitionTime %@, optionsMask %@, error %@", (uint8_t *)&v11, 0x34u);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (HMMTRColorControl)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMMTRColorControl;
  return [(MTRGenericBaseCluster *)&v6 initWithDevice:a3 endpointID:a4 queue:a5];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10 != -1) {
    dispatch_once(&logCategory__hmf_once_t10, &__block_literal_global_6017);
  }
  v2 = (void *)logCategory__hmf_once_v11;
  return v2;
}

uint64_t __32__HMMTRColorControl_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11;
  logCategory__hmf_once_int v11 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end