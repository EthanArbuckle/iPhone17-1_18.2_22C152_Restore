@interface HMDAccessoryServerDemo
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_hasPairings;
- (BOOL)_paired;
- (BOOL)hasPairings;
- (BOOL)isPaired;
- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4;
- (BOOL)stopPairingWithError:(id *)a3;
- (BOOL)testMode;
- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5;
- (HMDAccessoryServerBrowserDemo)browser;
- (HMDAccessoryServerDemo)initWithName:(id)a3 identifier:(id)a4 deviceInfo:(id)a5 paired:(BOOL)a6 keyStore:(id)a7 testMode:(BOOL)a8 browser:(id)a9;
- (NSDictionary)accessoryInfo;
- (id)category;
- (id)initCommon:(id)a3 browser:(id)a4;
- (int64_t)linkType;
- (void)_parseAttributeDatabase:(id)a3;
- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)discoverAccessories;
- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6;
- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4;
- (void)identifyWithCompletion:(id)a3;
- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4;
- (void)processCharacteristicWrite:(id)a3 value:(id)a4;
- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5;
- (void)sendDelayedResponse:(unint64_t)a3 responses:(id)a4 readOperation:(BOOL)a5 completionQueue:(id)a6 completionHandler:(id)a7;
- (void)setAccessoryInfo:(id)a3;
- (void)setBrowser:(id)a3;
- (void)setCategory:(id)a3;
- (void)set_hasPairings:(BOOL)a3;
- (void)set_paired:(BOOL)a3;
- (void)startPairingWithRequest:(id)a3;
- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation HMDAccessoryServerDemo

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_accessoryInfo, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

- (void)set_hasPairings:(BOOL)a3
{
  self->__hasPairings = a3;
}

- (BOOL)_hasPairings
{
  return self->__hasPairings;
}

- (void)set_paired:(BOOL)a3
{
  self->__paired = a3;
}

- (BOOL)_paired
{
  return self->__paired;
}

- (void)setBrowser:(id)a3
{
}

- (HMDAccessoryServerBrowserDemo)browser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  return (HMDAccessoryServerBrowserDemo *)WeakRetained;
}

- (void)setAccessoryInfo:(id)a3
{
}

- (NSDictionary)accessoryInfo
{
  return self->_accessoryInfo;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setCategory:(id)a3
{
}

- (id)category
{
  return self->_category;
}

- (void)handleUpdatesForCharacteristics:(id)a3 stateNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HAPAccessoryServer *)self clientQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HMDAccessoryServerDemo_handleUpdatesForCharacteristics_stateNumber___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __70__HMDAccessoryServerDemo_handleUpdatesForCharacteristics_stateNumber___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 accessoryServer:*(void *)(a1 + 32) didUpdateValuesForCharacteristics:*(void *)(a1 + 40) stateNumber:*(void *)(a1 + 48) broadcast:0];
  }
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  v4 = [(HAPAccessoryServer *)self delegate];
  if (v4)
  {
    v5 = [(HAPAccessoryServer *)self delegateQueue];
    if (v5) {
      char v6 = objc_opt_respondsToSelector();
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

- (void)identifyWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)listPairingsWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  char v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    if ([(HMDAccessoryServerDemo *)self testMode])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F355F0] code:-6702 userInfo:0];
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__HMDAccessoryServerDemo_listPairingsWithCompletionQueue_completionHandler___block_invoke;
    v12[3] = &unk_264A2F870;
    id v13 = v9;
    id v14 = v8;
    id v10 = v9;
    dispatch_async(v6, v12);
  }
  else
  {
    id v10 = (void (**)(id, void, void *))_Block_copy(v7);
    if (v10)
    {
      v11 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      v10[2](v10, 0, v11);
    }
  }
}

void __76__HMDAccessoryServerDemo_listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void, void))v2 + 2))(v2, 0, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

- (BOOL)removePairingForCurrentControllerOnQueue:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v6 = a3;
  id v7 = a4;
  self->__paired = 0;
  self->__hasPairings = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  [WeakRetained resetDemoAccessory:self];

  id v9 = [(HAPAccessoryServer *)self keyStore];
  id v10 = [(HAPAccessoryServer *)self identifier];
  id v24 = 0;
  [v9 removeAccessoryKeyForName:v10 error:&v24];
  id v11 = v24;

  if (v11)
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      v15 = [(HAPAccessoryServer *)self identifier];
      v16 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138544130;
      v26 = v14;
      __int16 v27 = 2112;
      v28 = v15;
      __int16 v29 = 2112;
      v30 = v16;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Failed to remove public key for accessory %@/%@- error %@", buf, 0x2Au);
    }
    if (v6)
    {
      if (![(HMDAccessoryServerDemo *)self testMode])
      {
        v17 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F355F0] code:-6702 userInfo:0];
LABEL_9:
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __78__HMDAccessoryServerDemo_removePairingForCurrentControllerOnQueue_completion___block_invoke;
        block[3] = &unk_264A2F870;
        id v22 = v17;
        id v23 = v7;
        v18 = v17;
        dispatch_async(v6, block);

        v19 = v23;
LABEL_12:

        goto LABEL_13;
      }
LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    goto LABEL_8;
  }
  v18 = (void (**)(id, void *))_Block_copy(v7);
  if (v18)
  {
    v19 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
    v18[2](v18, v19);
    goto LABEL_12;
  }
LABEL_13:

  return 0;
}

void __78__HMDAccessoryServerDemo_removePairingForCurrentControllerOnQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void))v2 + 2))(v2, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

- (void)removePairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    if ([(HMDAccessoryServerDemo *)self testMode])
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F355F0] code:-6702 userInfo:0];
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __74__HMDAccessoryServerDemo_removePairing_completionQueue_completionHandler___block_invoke;
    v13[3] = &unk_264A2F870;
    id v14 = v10;
    id v15 = v9;
    id v11 = v10;
    dispatch_async(v7, v13);
  }
  else
  {
    id v11 = (void (**)(id, void *))_Block_copy(v8);
    if (v11)
    {
      id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      v11[2](v11, v12);
    }
  }
}

void __74__HMDAccessoryServerDemo_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void))v2 + 2))(v2, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

- (void)addPairing:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    if ([(HMDAccessoryServerDemo *)self testMode])
    {
      id v10 = 0;
    }
    else
    {
      id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F355F0] code:-6702 userInfo:0];
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__HMDAccessoryServerDemo_addPairing_completionQueue_completionHandler___block_invoke;
    v13[3] = &unk_264A2F870;
    id v14 = v10;
    id v15 = v9;
    id v11 = v10;
    dispatch_async(v7, v13);
  }
  else
  {
    id v11 = (void (**)(id, void *))_Block_copy(v8);
    if (v11)
    {
      id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      v11[2](v11, v12);
    }
  }
}

void __71__HMDAccessoryServerDemo_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void))v2 + 2))(v2, *(void *)(a1 + 32));
    id v2 = v3;
  }
}

- (BOOL)tryPairingPassword:(id)a3 onboardingSetupPayloadString:(id)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)stopPairingWithError:(id *)a3
{
  return 0;
}

- (void)startPairingWithRequest:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->__paired = 1;
  self->__hasPairings = 1;
  v5 = [MEMORY[0x263F08C38] UUID];
  char v6 = [v5 UUIDString];
  id v7 = [v6 dataUsingEncoding:4];

  id v8 = [(HAPAccessoryServer *)self keyStore];
  id v9 = [(HAPAccessoryServer *)self identifier];
  id v21 = 0;
  int v10 = [v8 savePublicKey:v7 forAccessoryName:v9 error:&v21];
  id v11 = v21;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      v16 = [(HAPAccessoryServer *)self identifier];
      v17 = [(HAPAccessoryServer *)self name];
      *(_DWORD *)buf = 138544130;
      id v23 = v15;
      __int16 v24 = 2112;
      v25 = v16;
      __int16 v26 = 2112;
      __int16 v27 = v17;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to save public for accessory %@/%@ - error %@", buf, 0x2Au);
    }
  }
  if ([(HMDAccessoryServerDemo *)self _delegateRespondsToSelector:sel_accessoryServer_didStopPairingWithError_])
  {
    v18 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HMDAccessoryServerDemo_startPairingWithRequest___block_invoke;
    block[3] = &unk_264A2F820;
    void block[4] = self;
    id v20 = v11;
    dispatch_async(v18, block);
  }
}

void __50__HMDAccessoryServerDemo_startPairingWithRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accessoryServer:*(void *)(a1 + 32) didStopPairingWithError:*(void *)(a1 + 40)];
}

- (void)processCharacteristicWrite:(id)a3 value:(id)a4
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v91 = a4;
  char v6 = (void *)[v91 copy];
  [v5 setValue:v6];

  id v7 = [MEMORY[0x263EFF910] date];
  [v5 setValueUpdatedTime:v7];

  v94 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  v93 = [v5 service];
  id v8 = [v5 type];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F355B0]];

  if (v9)
  {
    int v10 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F35488]);
    v95 = v10;
    id v11 = (double *)&unk_2303E3000;
    if (v10) {
      goto LABEL_6;
    }
LABEL_56:
    v95 = 0;
    v90 = 0;
    double v16 = v11[376];
    goto LABEL_57;
  }
  BOOL v12 = [v5 type];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F35590]];

  if (v13)
  {
    int v10 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F35468]);
    v95 = v10;
    id v11 = (double *)&unk_2303E3000;
    if (v10) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
  __int16 v26 = [v5 type];
  int v27 = [v26 isEqualToString:*MEMORY[0x263F355A0]];

  if (v27)
  {
    v95 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F35478]);
    __int16 v28 = [v93 characteristicsOfType:*MEMORY[0x263F354A8]];
    id v29 = [v28 firstObject];

    uint64_t v30 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F355D0]);
    if (!v95)
    {

      v95 = 0;
      v90 = 0;
      double v16 = 1.1;
      goto LABEL_57;
    }
    __int16 v31 = [v95 responseDelay];
    uint64_t v32 = [v31 unsignedLongValue];
    BOOL v33 = v32 == 0;

    if (v32)
    {
      id v34 = 0;
      double v16 = 1.1;
LABEL_15:

      goto LABEL_18;
    }
    if ([v91 integerValue] == 3)
    {
      v54 = [v29 value];
      [v54 doubleValue];
      double v56 = v55;
      v57 = [v30 value];
      [v57 doubleValue];
      double v59 = v58;

      double v16 = 0.3;
      if (v56 <= v59)
      {
        v73 = [v29 value];
        [v73 doubleValue];
        double v75 = v74;
        v76 = [v30 value];
        [v76 doubleValue];
        double v78 = v77;

        if (v75 >= v78) {
          id v34 = &unk_26E471B60;
        }
        else {
          id v34 = &unk_26E471B30;
        }
      }
      else
      {
        id v34 = &unk_26E471B48;
      }
      goto LABEL_15;
    }
    id v34 = v91;
    if ([v34 integerValue] == 1)
    {
      id v62 = v34;
      v63 = NSNumber;
      v64 = [v30 value];
      [v64 doubleValue];
      v66 = [v63 numberWithDouble:v65 + -1.0];
      [v94 setObject:v66 forKey:v29];

      double v16 = 0.3;
    }
    else
    {
      double v16 = 0.3;
      if ([v34 integerValue] != 2) {
        goto LABEL_15;
      }
      id v62 = v34;
      v79 = NSNumber;
      v80 = [v30 value];
      [v80 doubleValue];
      v82 = [v79 numberWithDouble:v81 + 1.0];
      [v94 setObject:v82 forKey:v29];
    }
    id v34 = v62;
    goto LABEL_15;
  }
  v35 = [v5 type];
  int v36 = [v35 isEqualToString:*MEMORY[0x263F355D0]];

  if (v36)
  {
    v37 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F354A8]);
    v95 = v37;
    id v11 = (double *)&unk_2303E3000;
    if (v37)
    {
      v38 = [v37 responseDelay];
      uint64_t v39 = [v38 unsignedLongValue];

      if (v39) {
        goto LABEL_7;
      }
      v40 = [v93 characteristicsOfType:*MEMORY[0x263F35478]];
      v41 = [v40 firstObject];

      v42 = [v41 value];
      uint64_t v43 = [v42 integerValue];

      if (v43 == 1)
      {
        v44 = NSNumber;
        [v91 doubleValue];
        id v46 = [v44 numberWithDouble:v45 + -1.0];
      }
      else
      {
        v69 = [v41 value];
        uint64_t v70 = [v69 integerValue];

        if (v70 == 2)
        {
          v71 = NSNumber;
          [v91 doubleValue];
          id v46 = [v71 numberWithDouble:v72 + 1.0];
        }
        else
        {
          id v46 = v91;
        }
      }
      id v34 = v46;

      goto LABEL_17;
    }
    goto LABEL_56;
  }
  v47 = [v5 type];
  int v48 = [v47 isEqualToString:*MEMORY[0x263F355C0]];

  if (v48)
  {
    int v10 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F35498]);
    v95 = v10;
    id v11 = (double *)&unk_2303E3000;
    if (!v10) {
      goto LABEL_56;
    }
  }
  else
  {
    v49 = [v5 type];
    int v50 = [v49 isEqualToString:*MEMORY[0x263F355C8]];

    if (v50)
    {
      v51 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F354A0]);
      v95 = v51;
      if (!v51)
      {
        v95 = 0;
        v90 = 0;
        double v16 = 1.1;
        goto LABEL_57;
      }
      v52 = [v51 responseDelay];
      uint64_t v53 = [v52 unsignedLongValue];

      if (v53)
      {
        v90 = 0;
        double v16 = 1.1;
        goto LABEL_8;
      }
      if ([v91 integerValue] >= 3) {
        id v34 = &unk_26E471B30;
      }
      else {
        id v34 = &unk_26E471B60;
      }
      BOOL v33 = 1;
      double v16 = 0.3;
LABEL_18:
      v90 = v34;
      if (v33 && v34)
      {
        [v94 setObject:v34 forKey:v95];
        goto LABEL_57;
      }
      goto LABEL_8;
    }
    v60 = [v5 type];
    int v61 = [v60 isEqualToString:*MEMORY[0x263F355B8]];

    if (v61)
    {
      int v10 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F35490]);
      v95 = v10;
      id v11 = (double *)&unk_2303E3000;
      if (!v10) {
        goto LABEL_56;
      }
    }
    else
    {
      v67 = [v5 type];
      int v68 = [v67 isEqualToString:*MEMORY[0x263F355A8]];

      if (v68)
      {
        int v10 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F35480]);
        v95 = v10;
        id v11 = (double *)&unk_2303E3000;
        if (!v10) {
          goto LABEL_56;
        }
      }
      else
      {
        v83 = [v5 type];
        int v84 = [v83 isEqualToString:*MEMORY[0x263F355E0]];

        if (v84)
        {
          int v10 = __findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F354B8]);
          v95 = v10;
          id v11 = (double *)&unk_2303E3000;
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_56;
        }
        v88 = [v5 type];
        int v89 = [v88 isEqualToString:*MEMORY[0x263F35430]];

        id v11 = (double *)&unk_2303E3000;
        double v16 = 1.1;
        if (!v89
          || (__findAssociatedCharacteristicWithService(v93, *MEMORY[0x263F354D8]),
              int v10 = objc_claimAutoreleasedReturnValue(),
              (v95 = v10) == 0))
        {
          v95 = 0;
          v90 = 0;
          goto LABEL_57;
        }
      }
    }
  }
LABEL_6:
  id v14 = [v10 responseDelay];
  uint64_t v15 = [v14 unsignedLongValue];

  if (!v15)
  {
    id v34 = v91;
LABEL_17:
    BOOL v33 = 1;
    double v16 = v11[376];
    goto LABEL_18;
  }
LABEL_7:
  v90 = 0;
  double v16 = v11[376];
LABEL_8:
  v17 = (void *)MEMORY[0x230FBD990]();
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = HMFGetLogIdentifier();
    id v20 = [(HAPAccessoryServer *)self name];
    id v21 = [(HAPAccessoryServer *)self identifier];
    id v22 = [v95 responseDelay];
    uint64_t v23 = [v22 unsignedLongValue];
    __int16 v24 = [v95 type];
    v25 = [v95 instanceID];
    *(_DWORD *)buf = 138544642;
    v101 = v19;
    __int16 v102 = 2112;
    v103 = v20;
    __int16 v104 = 2112;
    v105 = v21;
    __int16 v106 = 2048;
    uint64_t v107 = v23;
    __int16 v108 = 2112;
    v109 = v24;
    __int16 v110 = 2112;
    v111 = v25;
    _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] responseDelay set to %lu for current state characteristic %@/%@ - bypassing processing effects...", buf, 0x3Eu);
  }
LABEL_57:
  if ([v94 count])
  {
    v85 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v94, "count"));
    objc_initWeak((id *)buf, self);
    if ([(HMDAccessoryServerDemo *)self _delegateRespondsToSelector:sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_])
    {
      dispatch_time_t v86 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      v87 = [(HAPAccessoryServer *)self delegateQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__HMDAccessoryServerDemo_processCharacteristicWrite_value___block_invoke;
      block[3] = &unk_264A2B5D8;
      id v97 = v94;
      id v98 = v85;
      objc_copyWeak(&v99, (id *)buf);
      dispatch_after(v86, v87, block);

      objc_destroyWeak(&v99);
    }
    objc_destroyWeak((id *)buf);
  }
}

void __59__HMDAccessoryServerDemo_processCharacteristicWrite_value___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_msgSend(MEMORY[0x263EFF910], "date", (void)v13);
        [v7 setValueUpdatedTime:v8];

        int v9 = [a1[4] objectForKey:v7];
        [v7 setValue:v9];

        [a1[5] addObject:v7];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v11 = [WeakRetained delegate];
  BOOL v12 = (void *)[a1[5] copy];
  [v11 accessoryServer:WeakRetained didUpdateValuesForCharacteristics:v12 stateNumber:0 broadcast:0];
}

- (void)enableEvents:(BOOL)a3 forCharacteristics:(id)a4 withCompletionHandler:(id)a5 queue:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = a6;
  id v11 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v8;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [MEMORY[0x263F358E8] responseTupleForCharacteristic:*(void *)(*((void *)&v23 + 1) + 8 * v16) error:0];
        [v11 addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if (v10)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __86__HMDAccessoryServerDemo_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke;
    v20[3] = &unk_264A2F870;
    id v22 = (void (**)(void *, void, void *))v9;
    id v21 = v11;
    dispatch_async(v10, v20);

    uint64_t v18 = v22;
  }
  else
  {
    uint64_t v18 = (void (**)(void *, void, void *))_Block_copy(v9);
    if (v18)
    {
      v19 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      v18[2](v18, 0, v19);
    }
  }
}

void __86__HMDAccessoryServerDemo_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  id v2 = _Block_copy(*(const void **)(a1 + 40));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(void *, void, void))v2 + 2))(v2, *(void *)(a1 + 32), 0);
    id v2 = v3;
  }
}

- (void)writeCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v46 = [MEMORY[0x263EFF980] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v8;
  uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v76 count:16];
  if (!v47)
  {

LABEL_19:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_264A2F870;
    id v54 = v46;
    id v55 = v10;
    id v34 = v46;
    v35 = v10;
    dispatch_async(v9, block);

    id v33 = v55;
    goto LABEL_20;
  }
  int v36 = v10;
  v37 = v9;
  unint64_t v48 = 0;
  uint64_t v45 = *(void *)v57;
  id v11 = self;
  do
  {
    for (uint64_t i = 0; i != v47; ++i)
    {
      if (*(void *)v57 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void **)(*((void *)&v56 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v13, "characteristic", v36, v37);
      uint64_t v15 = [v14 responseDelay];
      unint64_t v16 = [v15 unsignedLongValue];

      if (v16)
      {
        v17 = (void *)MEMORY[0x230FBD990]();
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v44 = HMFGetLogIdentifier();
          uint64_t v43 = [(HAPAccessoryServer *)v11 name];
          v40 = [(HAPAccessoryServer *)v11 identifier];
          v41 = [v14 service];
          v19 = [v41 type];
          id v20 = [v14 type];
          id v21 = [v14 instanceID];
          [v14 value];
          id v22 = v42 = v17;
          *(_DWORD *)buf = 138545154;
          int v61 = v44;
          __int16 v62 = 2112;
          v63 = v43;
          __int16 v64 = 2112;
          double v65 = v40;
          __int16 v66 = 2112;
          unint64_t v67 = (unint64_t)v19;
          __int16 v68 = 2112;
          v69 = v20;
          __int16 v70 = 2112;
          v71 = v21;
          __int16 v72 = 2112;
          v73 = v22;
          __int16 v74 = 2048;
          unint64_t v75 = v16;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Service %@ Characteristic %@/%@: value %@, delay %lu", buf, 0x52u);

          v17 = v42;
          id v11 = self;
        }
        unint64_t v23 = v48;
        if (v48 <= v16) {
          unint64_t v23 = v16;
        }
        unint64_t v48 = v23;
      }
      long long v24 = [v13 value];
      [(HMDAccessoryServerDemo *)v11 processCharacteristicWrite:v14 value:v24];

      long long v25 = [MEMORY[0x263F358E8] responseTupleForCharacteristic:v14 error:0];
      [v46 addObject:v25];
    }
    uint64_t v47 = [obj countByEnumeratingWithState:&v56 objects:v76 count:16];
  }
  while (v47);

  id v10 = v36;
  id v9 = v37;
  if (!v48) {
    goto LABEL_19;
  }
  long long v26 = (void *)MEMORY[0x230FBD990]();
  int v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = HMFGetLogIdentifier();
    id v29 = [(HAPAccessoryServer *)self name];
    uint64_t v30 = [(HAPAccessoryServer *)self identifier];
    *(_DWORD *)buf = 138544130;
    int v61 = v28;
    __int16 v62 = 2112;
    v63 = v29;
    __int16 v64 = 2112;
    double v65 = v30;
    __int16 v66 = 2048;
    unint64_t v67 = v48;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Delaying write-response by %lu", buf, 0x2Au);
  }
  __int16 v31 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v37);
  dispatch_time_t v32 = dispatch_time(0, 1000000 * v48);
  dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_18;
  handler[3] = &unk_264A2EE80;
  int v50 = v31;
  id v51 = v46;
  id v52 = v36;
  id v33 = v46;
  id v34 = v36;
  v35 = v31;
  dispatch_source_set_event_handler(v35, handler);
  dispatch_resume(v35);

LABEL_20:
}

uint64_t __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __94__HMDAccessoryServerDemo_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), 0);
}

- (void)readCharacteristicValues:(id)a3 timeout:(double)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  uint64_t v47 = [MEMORY[0x263EFF980] array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v55 objects:v75 count:16];
  if (!v11)
  {

LABEL_18:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_264A2F870;
    id v53 = v47;
    id v54 = v10;
    id v35 = v47;
    int v36 = v10;
    dispatch_async(v9, block);

    id v34 = v54;
    goto LABEL_19;
  }
  v37 = v10;
  v38 = v9;
  unint64_t v12 = 0;
  uint64_t v46 = *(void *)v56;
  uint64_t v13 = v11;
  do
  {
    uint64_t v14 = 0;
    uint64_t v40 = v13;
    do
    {
      if (*(void *)v56 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v55 + 1) + 8 * v14);
      unint64_t v16 = objc_msgSend(v15, "responseDelay", v37, v38);
      unint64_t v17 = [v16 unsignedLongValue];

      if (v17)
      {
        uint64_t v18 = (void *)MEMORY[0x230FBD990]();
        v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v45 = HMFGetLogIdentifier();
          uint64_t v43 = v18;
          id v20 = [(HAPAccessoryServer *)self name];
          id v21 = [(HAPAccessoryServer *)self identifier];
          [v15 service];
          v42 = unint64_t v44 = v12;
          id v22 = [v42 type];
          unint64_t v23 = [v15 type];
          long long v24 = [v15 instanceID];
          long long v25 = [v15 value];
          *(_DWORD *)buf = 138545154;
          v60 = v45;
          __int16 v61 = 2112;
          __int16 v62 = v20;
          __int16 v63 = 2112;
          __int16 v64 = v21;
          __int16 v65 = 2112;
          unint64_t v66 = (unint64_t)v22;
          __int16 v67 = 2112;
          __int16 v68 = v23;
          __int16 v69 = 2112;
          __int16 v70 = v24;
          __int16 v71 = 2112;
          __int16 v72 = v25;
          __int16 v73 = 2048;
          unint64_t v74 = v17;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Service %@ Characteristic %@/%@: value %@, delay %lu", buf, 0x52u);

          uint64_t v18 = v43;
          uint64_t v13 = v40;

          unint64_t v12 = v44;
        }

        if (v12 <= v17) {
          unint64_t v12 = v17;
        }
      }
      long long v26 = [MEMORY[0x263F358E8] responseTupleForCharacteristic:v15 error:0];
      [v47 addObject:v26];

      ++v14;
    }
    while (v13 != v14);
    uint64_t v13 = [obj countByEnumeratingWithState:&v55 objects:v75 count:16];
  }
  while (v13);

  id v10 = v37;
  id v9 = v38;
  if (!v12) {
    goto LABEL_18;
  }
  int v27 = (void *)MEMORY[0x230FBD990]();
  uint64_t v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    id v29 = HMFGetLogIdentifier();
    uint64_t v30 = [(HAPAccessoryServer *)self name];
    __int16 v31 = [(HAPAccessoryServer *)self identifier];
    *(_DWORD *)buf = 138544130;
    v60 = v29;
    __int16 v61 = 2112;
    __int16 v62 = v30;
    __int16 v63 = 2112;
    __int16 v64 = v31;
    __int16 v65 = 2048;
    unint64_t v66 = v12;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Delaying read-response by %lu", buf, 0x2Au);
  }
  dispatch_time_t v32 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v38);
  dispatch_time_t v33 = dispatch_time(0, 1000000 * v12);
  dispatch_source_set_timer(v32, v33, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_17;
  handler[3] = &unk_264A2EE80;
  v49 = v32;
  id v50 = v47;
  id v51 = v37;
  id v34 = v47;
  id v35 = v37;
  int v36 = v32;
  dispatch_source_set_event_handler(v36, handler);
  dispatch_resume(v36);

LABEL_19:
}

uint64_t __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __93__HMDAccessoryServerDemo_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), 0);
}

- (void)sendDelayedResponse:(unint64_t)a3 responses:(id)a4 readOperation:(BOOL)a5 completionQueue:(id)a6 completionHandler:(id)a7
{
  LODWORD(v9) = a5;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v12 = a4;
  uint64_t v13 = a6;
  id v14 = a7;
  uint64_t v15 = v14;
  if (a3)
  {
    unint64_t v16 = (void *)MEMORY[0x230FBD990]();
    unint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v26 = v12;
      id v9 = v18 = (int)v9;
      v19 = [(HAPAccessoryServer *)self name];
      uint64_t v20 = [(HAPAccessoryServer *)self identifier];
      id v21 = (void *)v20;
      *(_DWORD *)buf = 138544386;
      id v22 = @"write";
      int v36 = v9;
      if (v18) {
        id v22 = @"read";
      }
      __int16 v37 = 2112;
      v38 = v19;
      __int16 v39 = 2112;
      uint64_t v40 = v20;
      __int16 v41 = 2112;
      v42 = v22;
      __int16 v43 = 2048;
      unint64_t v44 = a3;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Delaying %@-response by %lu", buf, 0x34u);

      LOBYTE(v9) = v18;
      id v12 = v26;
    }

    unint64_t v23 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v13);
    dispatch_time_t v24 = dispatch_time(0, 1000000 * a3);
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke_15;
    handler[3] = &unk_264A2D340;
    char v31 = (char)v9;
    void handler[4] = self;
    uint64_t v28 = v23;
    id v30 = v15;
    id v29 = v12;
    long long v25 = v23;
    dispatch_source_set_event_handler(v25, handler);
    dispatch_resume(v25);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_264A2F870;
    id v34 = v14;
    id v33 = v12;
    dispatch_async(v13, block);

    long long v25 = v34;
  }
}

uint64_t __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __104__HMDAccessoryServerDemo_sendDelayedResponse_responses_readOperation_completionQueue_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = HMFGetLogIdentifier();
    uint64_t v5 = [*(id *)(a1 + 32) name];
    uint64_t v6 = [*(id *)(a1 + 32) identifier];
    id v7 = (void *)v6;
    int v8 = *(unsigned __int8 *)(a1 + 64);
    int v11 = 138544130;
    id v12 = v4;
    if (v8) {
      id v9 = @"read";
    }
    else {
      id v9 = @"write";
    }
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    int v18 = v9;
    _os_log_impl(&dword_22F52A000, v3, OS_LOG_TYPE_INFO, "%{public}@[HMDAccessoryServerDemo %@/%@] Sending %@-response", (uint8_t *)&v11, 0x2Au);
  }
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48));
}

- (void)_parseAttributeDatabase:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F35410];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F35410]];
  if (v6) {
    goto LABEL_36;
  }
  id v29 = (void *)MEMORY[0x230FBD990]();
  id v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    char v31 = HMFGetLogIdentifier();
    dispatch_time_t v32 = [(HAPAccessoryServer *)self name];
    *(_DWORD *)buf = 138543618;
    long long v58 = v31;
    __int16 v59 = 2112;
    v60 = v32;
    _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] No accessory objects found in the attribute database", buf, 0x16u);
  }
  id v33 = objc_alloc(MEMORY[0x263F087E8]);
  id v14 = (void *)[v33 initWithDomain:*MEMORY[0x263F355F0] code:-6727 userInfo:0];
  if (!v14)
  {
LABEL_36:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    id v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [(HAPAccessoryServer *)self name];
      int v11 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      long long v58 = v9;
      __int16 v59 = 2112;
      v60 = v10;
      __int16 v61 = 2112;
      uint64_t v62 = v5;
      __int16 v63 = 2112;
      __int16 v64 = v11;
      id v12 = v11;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] Expected the value of '%@' to be an array in the attribute database, instead it is a %@", buf, 0x2Au);
    }
    id v13 = objc_alloc(MEMORY[0x263F087E8]);
    id v14 = (void *)[v13 initWithDomain:*MEMORY[0x263F355F0] code:-6727 userInfo:0];
    if (!v14)
    {
LABEL_6:
      id v47 = v4;
      __int16 v15 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v6, "count"));
      v49 = [MEMORY[0x263EFF980] array];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v46 = v6;
      id obj = v6;
      uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v18 = 0;
        uint64_t v19 = *(void *)v53;
        uint64_t v20 = *MEMORY[0x263F35B60];
        while (2)
        {
          uint64_t v21 = 0;
          id v22 = v18;
          do
          {
            if (*(void *)v53 != v19) {
              objc_enumerationMutation(obj);
            }
            int v18 = objc_msgSend(MEMORY[0x263F358A8], "_parseSerializedAccessoryDictionary:server:", *(void *)(*((void *)&v52 + 1) + 8 * v21), self, v46);

            if (!v18)
            {
              id v34 = (void *)MEMORY[0x230FBD990]();
              id v35 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                int v36 = HMFGetLogIdentifier();
                __int16 v37 = [(HAPAccessoryServer *)self name];
                *(_DWORD *)buf = 138543618;
                long long v58 = v36;
                __int16 v59 = 2112;
                v60 = v37;
                _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] Unable to parse serialized accessory", buf, 0x16u);
              }
              id v38 = objc_alloc(MEMORY[0x263F087E8]);
              id v14 = (void *)[v38 initWithDomain:*MEMORY[0x263F355F0] code:-6742 userInfo:0];
              goto LABEL_30;
            }
            unint64_t v23 = [v18 instanceID];
            dispatch_time_t v24 = [NSNumber numberWithUnsignedInteger:v20];
            int v25 = [v23 isEqualToNumber:v24];

            if (v25)
            {
              [v18 setPrimary:1];
              [(HAPAccessoryServer *)self setPrimaryAccessory:v18];
            }
            else
            {
              [v18 setPrimary:0];
            }
            id v26 = [v18 instanceID];
            int v27 = [v15 containsObject:v26];

            if (v27)
            {
              __int16 v39 = (void *)MEMORY[0x230FBD990]();
              uint64_t v40 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                __int16 v41 = HMFGetLogIdentifier();
                v42 = [(HAPAccessoryServer *)self name];
                *(_DWORD *)buf = 138543618;
                long long v58 = v41;
                __int16 v59 = 2112;
                v60 = v42;
                _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@[HMDAccessoryServerDemo %@] Accessory Server has accessory with duplicate instance ID", buf, 0x16u);
              }
              id v43 = objc_alloc(MEMORY[0x263F087E8]);
              id v14 = (void *)[v43 initWithDomain:*MEMORY[0x263F355F0] code:-6742 userInfo:0];

              goto LABEL_30;
            }
            uint64_t v28 = [v18 instanceID];
            [v15 addObject:v28];

            [v18 setServer:self];
            [v49 addObject:v18];
            ++v21;
            id v22 = v18;
          }
          while (v17 != v21);
          uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      id v14 = 0;
LABEL_30:

      [(HAPAccessoryServer *)self setAccessories:v49];
      uint64_t v6 = v46;
      id v4 = v47;
    }
  }
  unint64_t v44 = [(HAPAccessoryServer *)self delegateQueue];

  if (v44)
  {
    uint64_t v45 = [(HAPAccessoryServer *)self delegateQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__HMDAccessoryServerDemo__parseAttributeDatabase___block_invoke;
    block[3] = &unk_264A2F820;
    void block[4] = self;
    id v51 = v14;
    dispatch_async(v45, block);
  }
}

void __50__HMDAccessoryServerDemo__parseAttributeDatabase___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 accessories];
  id v4 = (void *)[v3 copy];
  [v5 accessoryServer:v2 didDiscoverAccessories:v4 transaction:0 error:*(void *)(a1 + 40)];
}

- (void)discoverAccessories
{
}

- (int64_t)linkType
{
  return 1;
}

- (HMDAccessoryServerDemo)initWithName:(id)a3 identifier:(id)a4 deviceInfo:(id)a5 paired:(BOOL)a6 keyStore:(id)a7 testMode:(BOOL)a8 browser:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  int v18 = [(HMDAccessoryServerDemo *)self initCommon:a7 browser:a9];
  uint64_t v19 = v18;
  if (v18)
  {
    v18->__paired = a6;
    v18->__hasPairings = a6;
    uint64_t v20 = [v17 copy];
    accessoryInfo = v19->_accessoryInfo;
    v19->_accessoryInfo = (NSDictionary *)v20;

    uint64_t v22 = [v16 copy];
    uint64_t v23 = (int)*MEMORY[0x263F35B28];
    dispatch_time_t v24 = *(Class *)((char *)&v19->super.super.super.isa + v23);
    *(Class *)((char *)&v19->super.super.super.isa + v23) = (Class)v22;

    uint64_t v25 = [v15 copy];
    uint64_t v26 = (int)*MEMORY[0x263F35B38];
    int v27 = *(Class *)((char *)&v19->super.super.super.isa + v26);
    *(Class *)((char *)&v19->super.super.super.isa + v26) = (Class)v25;

    v19->_testMode = a8;
    category = v19->_category;
    v19->_category = (NSNumber *)&unk_26E471B30;
  }
  return v19;
}

- (id)initCommon:(id)a3 browser:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryServerDemo;
  id v7 = [(HAPAccessoryServer *)&v10 initWithKeystore:a3];
  int v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_browser, v6);
  }

  return v8;
}

- (BOOL)hasPairings
{
  return self->__hasPairings;
}

- (BOOL)isPaired
{
  return self->__paired;
}

@end