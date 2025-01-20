@interface HMDHAPAccessoryRemoteOperationWithLocalFallbackTask
- (BOOL)_shouldFallbackLocallyWithError:(id)a3 accessory:(id)a4;
- (HMDDevice)remoteTaskDelegateDevice;
- (HMDHAPAccessoryRemoteOperationWithLocalFallbackTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 completion:(id)a6;
- (HMDHAPAccessoryTask)fallbackLocalTask;
- (HMDHAPAccessoryTask)localTask;
- (HMDHAPAccessoryTask)remoteTask;
- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4;
- (id)_makeRemoteTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5;
- (id)_remoteTaskCompletionHandler;
- (id)completion;
- (void)_startScanningForSuspendedAccessoriesWithRequests:(id)a3;
- (void)execute;
- (void)setFallbackLocalTask:(id)a3;
- (void)setLocalTask:(id)a3;
- (void)setRemoteTask:(id)a3;
@end

@implementation HMDHAPAccessoryRemoteOperationWithLocalFallbackTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLocalTask, 0);
  objc_storeStrong((id *)&self->_localTask, 0);
  objc_storeStrong((id *)&self->_remoteTask, 0);
  objc_storeStrong((id *)&self->_remoteTaskDelegateDevice, 0);
}

- (void)setFallbackLocalTask:(id)a3
{
}

- (HMDHAPAccessoryTask)fallbackLocalTask
{
  return (HMDHAPAccessoryTask *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalTask:(id)a3
{
}

- (HMDHAPAccessoryTask)localTask
{
  return (HMDHAPAccessoryTask *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRemoteTask:(id)a3
{
}

- (HMDHAPAccessoryTask)remoteTask
{
  return (HMDHAPAccessoryTask *)objc_getProperty(self, a2, 56, 1);
}

- (HMDDevice)remoteTaskDelegateDevice
{
  return (HMDDevice *)objc_getProperty(self, a2, 48, 1);
}

- (id)_makeLocalTaskWithRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

- (id)_makeRemoteTaskWithRequests:(id)a3 delegateDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v12 = *MEMORY[0x1E4F1C3B8];
  id v13 = NSString;
  v14 = NSStringFromSelector(a2);
  v15 = [v13 stringWithFormat:@"%@ is unavailable", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (id)_remoteTaskCompletionHandler
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke;
  v4[3] = &unk_1E6A19160;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained remoteTask];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    v39 = v9;
    id v10 = [v9 logEvents];
    v11 = (void *)[v10 mutableCopy];

    [MEMORY[0x1E4F6A278] currentTime];
    uint64_t v13 = v12;
    v14 = [v6 remoteTask];
    v15 = [v14 requests];
    id v16 = (void *)[v15 mutableCopy];

    v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_373;
    v44[3] = &unk_1E6A19138;
    id v18 = v16;
    id v45 = v18;
    v46 = v6;
    id v19 = v17;
    id v47 = v19;
    id v20 = v11;
    id v48 = v20;
    uint64_t v49 = v13;
    v21 = objc_msgSend(v3, "na_map:", v44);
    v22 = (void *)[v21 mutableCopy];

    [v6 addCharacteristicResponses:v19 isRemote:1];
    if ([v19 count])
    {
      v23 = objc_opt_class();
      v24 = [v6 requestIdentifier];
      v25 = [v24 UUIDString];
      [v23 updateLogEvents:v20 withResponses:v19 forTaskID:v25 shouldSubmit:1];

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_375;
      v42[3] = &unk_1E6A18F00;
      id v43 = v20;
      objc_msgSend(v19, "na_each:", v42);
    }
    if ([v18 count] && (objc_msgSend(v6, "supportsMultiPartResponse") & 1) == 0)
    {
      context = (void *)MEMORY[0x1D9452090]();
      id v26 = v6;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138544130;
        v51 = v28;
        __int16 v52 = 2112;
        id v53 = v26;
        __int16 v54 = 2112;
        id v55 = v18;
        __int16 v56 = 2112;
        id v57 = v3;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@[%@] Missing remote responses. Falling back to locally processing requests: %@ -> %@", buf, 0x2Au);
      }
      [v22 addObjectsFromArray:v18];
    }
    if ([v22 count])
    {
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_376;
      v40[3] = &unk_1E6A19160;
      objc_copyWeak(&v41, v4);
      v29 = [v6 _makeLocalTaskWithRequests:v22 completion:v40];
      [v6 setFallbackLocalTask:v29];

      v30 = [v6 fallbackLocalTask];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v31 = v30;
      }
      else {
        v31 = 0;
      }
      id v32 = v31;

      if (v32) {
        [v32 setLogEvents:v20];
      }
      v33 = [v6 fallbackLocalTask];
      [v33 execute];

      objc_destroyWeak(&v41);
    }
    else
    {
      v37 = [v6 completion];
      ((void (**)(void, id))v37)[2](v37, v19);
    }
  }
  else
  {
    v34 = (void *)MEMORY[0x1D9452090]();
    v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v51 = v36;
      _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for HMDHAPAccessoryRemoteOperationWithLocalFallbackTask remote task completion handler", buf, 0xCu);
    }
  }
}

id __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_373(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 error];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v3 request];
  [v5 removeObject:v6];

  id v7 = [v3 request];
  id v8 = [v7 accessory];

  if (!v8)
  {
    v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 40);
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v37 = v18;
      __int16 v38 = 2112;
      uint64_t v39 = v19;
      __int16 v40 = 2112;
      id v41 = v3;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Lost reference to accessory for response: %@", buf, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v3];
    goto LABEL_9;
  }
  if (![*(id *)(a1 + 40) _shouldFallbackLocallyWithError:v4 accessory:v8])
  {
    id v20 = *(void **)(a1 + 48);
    v21 = [v8 _updatedResponseForRemoteResponse:v3];
    [v20 addObject:v21];

LABEL_9:
    v22 = 0;
    goto LABEL_21;
  }
  id v9 = [v3 request];
  id v10 = [v9 accessory];
  v11 = [v10 uuid];
  uint64_t v12 = [v11 UUIDString];

  if (v12)
  {
    uint64_t v13 = [*(id *)(a1 + 56) objectForKeyedSubscript:v12];
    v14 = [v3 error];
    [v13 setResidentFirstError:v14];

    [v13 setResidentFirstEndTime:*(double *)(a1 + 64)];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v23 = [*(id *)(a1 + 40) requestToResponseMap];
  v24 = [v3 request];
  v25 = [v23 objectForKey:v24];

  id v26 = (void *)MEMORY[0x1D9452090]();
  id v27 = *(id *)(a1 + 40);
  v28 = HMFGetOSLogHandle();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (v25)
  {
    if (v29)
    {
      v30 = HMFGetLogIdentifier();
      uint64_t v31 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v37 = v30;
      __int16 v38 = 2112;
      uint64_t v39 = v31;
      __int16 v40 = 2112;
      id v41 = v3;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Skip falling back to locally processing accessory for response: %@", buf, 0x20u);
    }
    v22 = 0;
  }
  else
  {
    if (v29)
    {
      id v32 = HMFGetLogIdentifier();
      uint64_t v35 = *(void *)(a1 + 40);
      v33 = [v3 request];
      *(_DWORD *)buf = 138544130;
      v37 = v32;
      __int16 v38 = 2112;
      uint64_t v39 = v35;
      __int16 v40 = 2112;
      id v41 = v33;
      __int16 v42 = 2112;
      id v43 = v3;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Falling back to locally processing request: %@ -> %@", buf, 0x2Au);
    }
    if (v13) {
      [v13 setIsLocalFallback:1];
    }
    v22 = [v3 request];
  }

LABEL_21:
  return v22;
}

void __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_375(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  v4 = [v3 accessory];
  id v5 = [v4 uuid];
  id v7 = [v5 UUIDString];

  id v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v7];
    id v6 = v7;
  }
}

void __83__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__remoteTaskCompletionHandler__block_invoke_376(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained completion];
    ((void (**)(void, id))v6)[2](v6, v3);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for fallback local task completion", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)completion
{
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HMDHAPAccessoryRemoteOperationWithLocalFallbackTask;
  id v3 = [(HMDHAPAccessoryTask *)&v10 completion];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_completion__block_invoke;
  aBlock[3] = &unk_1E6A18FF8;
  objc_copyWeak(&v9, &location);
  id v8 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __65__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_completion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained addCharacteristicResponses:v3 isRemote:0];
    if ([v5 allResponsesReceived])
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = [v5 characteristicResponses];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
    else if ([v5 supportsMultiPartResponse])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Lost self reference for HMDHAPAccessoryRemoteOperationWithLocalFallbackTask completion", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)_shouldFallbackLocallyWithError:(id)a3 accessory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    goto LABEL_37;
  }
  if ([v5 isHMError])
  {
    uint64_t v7 = [v5 code];
  }
  else
  {
    if (![v5 isHAPError])
    {
      v14 = [v5 domain];
      char v15 = [v14 isEqual:*MEMORY[0x1E4F31168]];

      char v8 = v15 ^ 1;
      goto LABEL_38;
    }
    unint64_t v13 = [v5 code];
    if (v13 > 0x20)
    {
LABEL_34:
      if ([v6 canWakeViaCustomWoBLE])
      {
        id v20 = [v5 underlyingErrors];
        v21 = [v20 firstObject];

        if ([v21 isHMError]) {
          char v8 = [v21 code] != 2400;
        }
        else {
          char v8 = 1;
        }

        goto LABEL_38;
      }
LABEL_37:
      char v8 = 0;
      goto LABEL_38;
    }
    uint64_t v7 = qword_1D54D4320[v13];
  }
  char v8 = 1;
  switch(v7)
  {
    case 2:
    case 3:
    case 8:
      goto LABEL_38;
    case 4:
      if (isFeatureMatteriPhoneOnlyPairingControlEnabled())
      {
        id v9 = [v6 home];
        if ([v6 supportsCHIP])
        {
          objc_super v10 = [v9 primaryResident];
          int v11 = [v10 capabilities];
          int v12 = [v11 supportsThreadBorderRouter] ^ 1;
        }
        else
        {
          LOBYTE(v12) = 0;
        }
        id v18 = [v6 supportedLinkLayerTypes];
        char v19 = [v18 unsignedIntegerValue];

        if (![v6 hasBTLELink]
          || ([v6 isReachable] & 1) == 0 && !objc_msgSend(v6, "isBLELinkConnected"))
        {
          if ((v19 & 2) != 0) {
            char v17 = 0;
          }
          else {
            char v17 = v12;
          }
          goto LABEL_32;
        }
        goto LABEL_28;
      }
      if (![v6 hasBTLELink]
        || ([v6 isReachable] & 1) == 0 && (objc_msgSend(v6, "isBLELinkConnected") & 1) == 0)
      {
        goto LABEL_34;
      }
      goto LABEL_38;
    case 5:
    case 6:
    case 7:
    case 9:
      goto LABEL_34;
    case 10:
      if (!isWatch()) {
        goto LABEL_34;
      }
      goto LABEL_38;
    default:
      if (v7 == 54)
      {
        id v16 = [v5 underlyingErrors];
        id v9 = [v16 firstObject];

        if ([v9 isHMError] && objc_msgSend(v9, "code") == 3203)
        {
LABEL_28:

LABEL_33:
          char v8 = 1;
          goto LABEL_38;
        }
        char v17 = [v6 canWakeViaCustomWoBLE];
LABEL_32:

        if (v17) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      if (v7 != 3201) {
        goto LABEL_34;
      }
LABEL_38:

      return v8;
  }
}

- (void)_startScanningForSuspendedAccessoriesWithRequests:(id)a3
{
  id v4 = a3;
  if (!isWatch())
  {
    id v5 = [(HMDHAPAccessoryTask *)self context];
    id v6 = [v5 home];
    uint64_t v7 = [v6 homeLocation];

    if (v7 == 1)
    {
      char v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke;
      v15[3] = &unk_1E6A19098;
      id v9 = v8;
      id v16 = v9;
      objc_msgSend(v4, "na_each:", v15);
      objc_super v10 = [v9 keyEnumerator];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_2;
      v12[3] = &unk_1E6A19110;
      id v13 = v9;
      v14 = self;
      id v11 = v9;
      objc_msgSend(v10, "na_each:", v12);
    }
  }
}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 accessory];
  if ([v3 canWakeViaCustomWoBLE])
  {
    id v4 = [*(id *)(a1 + 32) objectForKey:v3];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v7 = v6;

    [v7 addObject:v9];
    char v8 = [*(id *)(a1 + 32) objectForKey:v3];

    if (!v8) {
      [*(id *)(a1 + 32) setObject:v7 forKey:v3];
    }
  }
}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:v3];
  objc_initWeak(&location, *(id *)(a1 + 40));
  id v5 = [*(id *)(a1 + 40) context];
  uint64_t v6 = [v5 sourceType];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_3;
  v9[3] = &unk_1E6A190E8;
  objc_copyWeak(&v12, &location);
  id v7 = v3;
  id v10 = v7;
  id v8 = v4;
  id v11 = v8;
  [v7 wakeOrScanForSuspendedAccessoryForRequests:v8 source:v6 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_4;
    block[3] = &unk_1E6A190C0;
    block[4] = v8;
    id v11 = a1[4];
    id v12 = a1[5];
    id v13 = v5;
    id v14 = v6;
    dispatch_async(v9, block);
  }
}

void __105__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask__startScanningForSuspendedAccessoriesWithRequests___block_invoke_4(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) identifier];
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "count"));
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count"));
    uint64_t v10 = *(void *)(a1 + 64);
    int v22 = 138544642;
    v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    BOOL v29 = v8;
    __int16 v30 = 2112;
    uint64_t v31 = v9;
    __int16 v32 = 2112;
    uint64_t v33 = v10;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Scanning locally for suspended accessory (%@/%@/%@) completed with error: %@.", (uint8_t *)&v22, 0x3Eu);
  }
  if (!*(void *)(a1 + 64) && [*(id *)(a1 + 56) count])
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = *(id *)(a1 + 32);
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = [*(id *)(a1 + 40) name];
      char v17 = [*(id *)(a1 + 40) uuid];
      id v18 = [v17 UUIDString];
      char v19 = [*(id *)(a1 + 40) uniqueIdentifier];
      uint64_t v20 = [*(id *)(a1 + 48) count];
      int v22 = 138544642;
      v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      BOOL v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      __int16 v32 = 2048;
      uint64_t v33 = v20;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Adding responses for suspended accessory %@/%@/%@ with %ld requests", (uint8_t *)&v22, 0x3Eu);
    }
    [*(id *)(a1 + 32) addCharacteristicResponses:*(void *)(a1 + 56) isRemote:0];
    if ([*(id *)(a1 + 32) supportsMultiPartResponse])
    {
      v21 = [*(id *)(a1 + 32) completion];
      v21[2](v21, *(void *)(a1 + 56));
    }
  }
}

- (void)execute
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDHAPAccessoryTask *)self setExecutionTime:v3];

  id v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = [(HMDHAPAccessoryTask *)self requests];
  uint64_t v6 = [v4 setWithArray:v5];

  id v7 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self remoteTaskDelegateDevice];
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_execute__block_invoke;
    v19[3] = &unk_1E6A19070;
    v19[4] = self;
    id v8 = objc_msgSend(v6, "na_map:", v19);
  }

  if ([v8 count])
  {
    id v9 = [v8 allObjects];
    uint64_t v10 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self completion];
    id v11 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self _makeLocalTaskWithRequests:v9 completion:v10];
    [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self setLocalTask:v11];

    id v12 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self localTask];
    [v12 execute];

    [v6 minusSet:v8];
  }
  if ([v6 count])
  {
    id v13 = [v6 allObjects];
    [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self _startScanningForSuspendedAccessoriesWithRequests:v13];

    id v14 = [v6 allObjects];
    uint64_t v15 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self remoteTaskDelegateDevice];
    id v16 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self _remoteTaskCompletionHandler];
    char v17 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self _makeRemoteTaskWithRequests:v14 delegateDevice:v15 completion:v16];
    [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self setRemoteTask:v17];

    id v18 = [(HMDHAPAccessoryRemoteOperationWithLocalFallbackTask *)self remoteTask];
    [v18 execute];
  }
}

id __62__HMDHAPAccessoryRemoteOperationWithLocalFallbackTask_execute__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) context];
  if ([v4 isRemoteAccessDeviceReachable])
  {
    id v5 = [v3 accessory];
    if ([v5 isBLELinkConnected])
    {
      id v6 = v3;
    }
    else
    {
      id v7 = [v3 accessory];
      if ([v7 isMatterLocalLinkConnectedAndPreferred]) {
        id v6 = v3;
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (HMDHAPAccessoryRemoteOperationWithLocalFallbackTask)initWithContext:(id)a3 requests:(id)a4 delegateDevice:(id)a5 completion:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHAPAccessoryRemoteOperationWithLocalFallbackTask;
  id v12 = [(HMDHAPAccessoryTask *)&v15 initWithContext:a3 requests:a4 completion:a6];
  id v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_remoteTaskDelegateDevice, a5);
  }

  return v13;
}

@end