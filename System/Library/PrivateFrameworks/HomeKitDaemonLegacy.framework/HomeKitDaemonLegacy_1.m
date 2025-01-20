id Siri_log()
{
  void *v0;
  uint64_t vars8;

  if (Siri_log__hmf_once_t0 != -1) {
    dispatch_once(&Siri_log__hmf_once_t0, &__block_literal_global_76862);
  }
  v0 = (void *)Siri_log__hmf_once_v1;
  return v0;
}

void sub_1D4EFA790(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4EFA86C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4EFA98C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4EFC4B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4EFD498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__77828(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__77829(uint64_t a1)
{
}

void sub_1D4EFF688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4EFFFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F032DC(_Unwind_Exception *a1)
{
}

id parseMediaSourceDisplayOrder(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  if ([v3 length])
  {
    id v4 = v3;
    [v4 bytes];
    [v4 length];
    v5 = [MEMORY[0x1E4F1CA48] array];
    *(void *)&long long v6 = 138543618;
    long long v13 = v6;
    do
      uint64_t Next = TLV8GetNext();
    while (!Next);
    if (Next != -6727)
    {
      v8 = (void *)MEMORY[0x1D9452090](Next);
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = v13;
        v16 = v10;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@TLV parsing failed - %@ - dropping", buf, 0x16u);
      }

      v5 = 0;
    }
    v11 = objc_msgSend(v5, "copy", v13, v14);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

void sub_1D4F03CC8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D4F044D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_1D4F048D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t __Block_byref_object_copy__78423(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__78424(uint64_t a1)
{
}

id _statisticsArrayFromDictionary(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CA48];
  id v2 = a1;
  id v3 = [v1 array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___statisticsArrayFromDictionary_block_invoke;
  v7[3] = &unk_1E6A0D4F0;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];

  v5 = (void *)[v4 copy];
  return v5;
}

void ___statisticsArrayFromDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v16[5] = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  v16[0] = a2;
  v15[0] = @"name";
  v15[1] = @"min";
  v5 = NSNumber;
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "minValue"));
  v16[1] = v8;
  v15[2] = @"max";
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "maxValue"));
  v16[2] = v9;
  v15[3] = @"average";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "averageValue"));
  v16[3] = v10;
  v15[4] = @"count";
  v11 = NSNumber;
  uint64_t v12 = [v6 valueCount];

  long long v13 = [v11 numberWithInteger:v12];
  v16[4] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  [v4 addObject:v14];
}

id _counterArrayFromDictionary(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CA48];
  id v2 = a1;
  id v3 = [v1 array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___counterArrayFromDictionary_block_invoke;
  v7[3] = &unk_1E6A0D988;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];

  v5 = (void *)[v4 copy];
  return v5;
}

void ___counterArrayFromDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  v9[0] = @"name";
  v9[1] = @"value";
  v10[0] = a2;
  v10[1] = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v4 addObject:v8];
}

void sub_1D4F0B348(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0B3E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F0C434(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMDRemoteEventRouterProtoDisconnectMessageReadFrom(uint64_t a1)
{
  id v2 = (int *)MEMORY[0x1E4F940E8];
  id v3 = (int *)MEMORY[0x1E4F940E0];
  id v4 = (int *)MEMORY[0x1E4F940C8];
  v5 = (int *)MEMORY[0x1E4F940B8];
  while (1)
  {
    int v6 = *(unsigned __int8 *)(a1 + *v4);
    if (*(void *)(a1 + *v2) >= *(void *)(a1 + *v3)) {
      return v6 == 0;
    }
    if (*(unsigned char *)(a1 + *v4))
    {
      int v6 = 1;
      return v6 == 0;
    }
    char v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v10 = *v2;
      unint64_t v11 = *(void *)(a1 + v10);
      if (v11 == -1 || v11 >= *(void *)(a1 + *v3)) {
        break;
      }
      char v12 = *(unsigned char *)(*(void *)(a1 + *v5) + v11);
      *(void *)(a1 + v10) = v11 + 1;
      v9 |= (unint64_t)(v12 & 0x7F) << v7;
      if ((v12 & 0x80) == 0) {
        goto LABEL_12;
      }
      v7 += 7;
      if (v8++ >= 9)
      {
        LOBYTE(v9) = 0;
        int v6 = *(unsigned __int8 *)(a1 + *v4);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a1 + *v4) = 1;
LABEL_12:
    int v6 = *(unsigned __int8 *)(a1 + *v4);
    if (*(unsigned char *)(a1 + *v4)) {
      LOBYTE(v9) = 0;
    }
LABEL_14:
    if (v6) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = (v9 & 7) == 4;
    }
    if (v14) {
      return v6 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

void ____transactionSettingUpdated_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  int v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    char v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Sent updated setting notification. Error : %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_1D4F1C5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F1D404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id location)
{
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F1F478(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F28E60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F28FC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2926C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2938C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2940C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F29590(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F29788(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F29908(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F29994(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F29A14(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F29B50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2A8B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2ACCC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2B004(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t getAccessoryFirmwareUpdateActiveTransport(void *a1)
{
  id v1 = a1;
  if ([v1 isReachable])
  {
    if ([v1 isThreadTheCurrentlyActiveTransport])
    {
      uint64_t v2 = 4;
    }
    else if ([v1 hasBTLELink])
    {
      uint64_t v2 = 3;
    }
    else if ([v1 hasIPLink])
    {
      uint64_t v2 = 2;
    }
    else
    {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

void sub_1D4F2B66C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4F2BC6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4F2BFCC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2C8E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __disconnectFromEndpoint(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    ExternalDevice = (const void *)MRAVEndpointGetExternalDevice();
    if (ExternalDevice)
    {
      id v3 = ExternalDevice;
      CFRetain(ExternalDevice);
      if (MRExternalDeviceGetConnectionState() == 3)
      {
        CFRelease(v3);
      }
      else
      {
        id v4 = (void *)MEMORY[0x1D9452090]();
        id v5 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v6 = HMFGetLogIdentifier();
          int v8 = 138543618;
          uint64_t v9 = v6;
          __int16 v10 = 2112;
          uint64_t v11 = a1;
          _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the connection state callback for endpoint %@", (uint8_t *)&v8, 0x16u);
        }
        char v7 = dispatch_get_global_queue(0, 0);
        MRExternalDeviceSetConnectionStateCallback();

        MRExternalDeviceDisconnect();
        CFRelease(v3);
      }
    }
  }
}

void sub_1D4F2D688(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4F2D9BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F2DA30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F32C4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F32CCC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F35428(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F354A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __shouldAcceptMessage(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 accessory];
  if ([v5 isCurrentAccessory] & 1) != 0 || (objc_msgSend(v5, "supportsFirmwareUpdate"))
  {
    uint64_t v6 = 1;
  }
  else
  {
    int v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v3;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cannot update state for other accessory", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v6 = [v4 responseHandler];

    if (v6)
    {
      uint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
      long long v13 = [v4 responseHandler];
      ((void (**)(void, void *, void))v13)[2](v13, v12, 0);

      uint64_t v6 = 0;
    }
  }

  return v6;
}

void sub_1D4F3698C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __registerDocumentationMetadata(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = [v3 dataSource];
    uint64_t v6 = [v5 notificationCenterForSoftwareUpdate:v3];
    uint64_t v7 = [v6 removeObserver:v3 name:@"HMDSoftwareUpdateDocumentationAssetStateUpdatedNotification" object:0];
    if (v4)
    {
      int v8 = (void *)MEMORY[0x1D9452090](v7);
      id v9 = v3;
      __int16 v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v15 = 138543618;
        uint64_t v16 = v11;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering documentation metadata: %@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v12 = +[HMDSoftwareUpdateDocumentationManager sharedManager];
      [v12 registerDocumentationMetadata:v4];

      long long v13 = +[HMDSoftwareUpdateDocumentationManager sharedManager];
      int v14 = [v13 assetForDocumentationMetadata:v4];

      [v6 addObserver:v9 selector:sel__handleDocumentationStateNotification_ name:@"HMDSoftwareUpdateDocumentationAssetStateUpdatedNotification" object:v14];
    }
  }
}

void __unregisterDocumentationMetadata(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4)
  {
    uint64_t v6 = [v3 dataSource];
    uint64_t v7 = [v6 notificationCenterForSoftwareUpdate:v3];
    int v8 = (void *)MEMORY[0x1D9452090]([v7 removeObserver:v3 name:@"HMDSoftwareUpdateDocumentationAssetStateUpdatedNotification" object:0]);
    id v9 = v3;
    __int16 v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      int v13 = 138543618;
      int v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Unregistering documentation metadata: %@", (uint8_t *)&v13, 0x16u);
    }
    uint64_t v12 = +[HMDSoftwareUpdateDocumentationManager sharedManager];
    [v12 unregisterDocumentationMetadata:v5];
  }
}

void sub_1D4F39C60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F3B198(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void notifyObservers(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) updatedCounter:v8 fromOldValue:a3 toNewValue:a4];
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

void sub_1D4F3B684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  os_unfair_lock_unlock(v19);
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__84506(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__84507(uint64_t a1)
{
}

void sub_1D4F3B894(_Unwind_Exception *exception_object)
{
}

void sub_1D4F3B9C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3BCB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3BE54(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3BEEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3C080(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3C154(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3C268(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3C3C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3DE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
}

id __findAssociatedCharacteristicWithService(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 characteristicsOfType:a2];
  id v3 = [v2 firstObject];

  return v3;
}

void sub_1D4F3F128(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3F2D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3F35C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F3F8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F3FE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F40104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F40210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F414F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F41938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F437BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F43AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *HMDStringFromDataStreamMessageStatus(unsigned int a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown status: %d>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6A0DA90[a1];
  }
  return v1;
}

void sub_1D4F4F428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F4F7F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1D4F51920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F52108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id location)
{
  objc_destroyWeak(v41);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F52AE8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1D4F52CC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F52E6C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F536E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F53CB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F55080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F552B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4F5572C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F5C55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F5E460(_Unwind_Exception *a1)
{
}

void sub_1D4F61658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id failedActionResultFor(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x1E4F96670];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  id v4 = [v2 actions];
  id v5 = [v4 firstObject];
  uint64_t v6 = [v5 aceId];
  [v3 setRequestActionId:v6];

  [v3 setOutcome:*MEMORY[0x1E4F96CF0]];
  id v7 = [v2 actions];
  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 value];
  [v3 setResultValue:v9];

  uint64_t v10 = [v2 actions];

  uint64_t v11 = [v10 firstObject];
  uint64_t v12 = [v11 attribute];
  [v3 setResultAttribute:v12];

  return v3;
}

void __mapToFailureActionOutcome_block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F96CF8];
  uint64_t v1 = *MEMORY[0x1E4F96ED8];
  v5[0] = *MEMORY[0x1E4F96EC8];
  v5[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F96D20];
  v6[0] = v0;
  v6[1] = v2;
  v5[2] = *MEMORY[0x1E4F96F00];
  v6[2] = *MEMORY[0x1E4F96D30];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  id v4 = (void *)mapToFailureActionOutcome_outcomeMap;
  mapToFailureActionOutcome_outcomeMap = v3;
}

void sub_1D4F636AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __configurationFromAdvertisement(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    uint64_t v6 = [v4 name];
    id v7 = [v3 name];
    char v8 = HMFEqualObjects();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v3;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        long long v13 = [v4 name];
        *(_DWORD *)buf = 138543618;
        v35 = v12;
        __int16 v36 = 2112;
        v37 = v13;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Detected that the accessory name, %@, is out of sync", buf, 0x16u);
      }
      long long v14 = [v10 name];
      [v5 setObject:v14 forKeyedSubscript:@"name"];
    }
    long long v15 = [v3 home];
    long long v16 = [v15 mediaPassword];
    uint64_t v17 = [v3 password];
    char v18 = HMFEqualObjects();

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v3;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v35 = v22;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Detected that the accessory password is out of sync", buf, 0xCu);
      }
      if (v16) {
        v23 = v16;
      }
      else {
        v23 = &stru_1F2C9F1A8;
      }
      [v5 setObject:v23 forKeyedSubscript:@"password"];
    }
    uint64_t v24 = [v15 minimumMediaUserPrivilege];
    if ([v3 minimumUserPriviledge] != v24)
    {
      v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = v3;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = HMFGetLogIdentifier();
        [v26 minimumUserPriviledge];
        HMUserPrivilegeToString();
        v29 = v33 = v25;
        *(_DWORD *)buf = 138543618;
        v35 = v28;
        __int16 v36 = 2112;
        v37 = v29;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Detected that the accessory minimum user privilege, %@, is out of sync", buf, 0x16u);

        v25 = v33;
      }

      v30 = [NSNumber numberWithInteger:v24];
      [v5 setObject:v30 forKeyedSubscript:@"privilege"];
    }
    v31 = (void *)[v5 copy];
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

void __updateConfiguration(void *a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  char v8 = (void *)MEMORY[0x1D9452090]();
  if (v5)
  {
    id v9 = v5;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v39 = v11;
      __int16 v40 = 2112;
      id v41 = v6;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating configuration to: %@", buf, 0x16u);
    }
    uint64_t v12 = [v9 home];
    char v13 = [v12 isOwnerUser];

    if (v13)
    {
      long long v14 = [v9 advertisement];
      long long v15 = [v14 outputDevice];
      long long v16 = objc_msgSend(v15, "av_OutputDevice");

      if (v16)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = ____updateConfiguration_block_invoke;
        aBlock[3] = &unk_1E6A0E040;
        id v36 = v6;
        id v17 = v9;
        id v37 = v17;
        char v18 = _Block_copy(aBlock);
        objc_initWeak((id *)buf, v17);
        uint64_t v19 = __outputDeviceConfigurationOptions();
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = ____updateConfiguration_block_invoke_228;
        v31[3] = &unk_1E6A0DFD0;
        id v32 = v14;
        objc_copyWeak(&v34, (id *)buf);
        id v33 = v7;
        [v16 configureUsingBlock:v18 options:v19 completionHandler:v31];

        objc_destroyWeak(&v34);
        objc_destroyWeak((id *)buf);

        id v20 = v36;
      }
      else
      {
        v27 = (void *)MEMORY[0x1D9452090]();
        id v28 = v9;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v39 = v30;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Missing output device", buf, 0xCu);
        }
        __startConfigurationRetryTimer(v28);
        id v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:4];
        (*((void (**)(id, void *))v7 + 2))(v7, v20);
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      id v24 = v9;
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v39 = v26;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Only owner can update configuration", buf, 0xCu);
      }
      long long v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:17];
      (*((void (**)(id, void *))v7 + 2))(v7, v14);
    }
  }
  else
  {
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing required paramter", buf, 0xCu);
    }
    long long v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
    (*((void (**)(id, void *))v7 + 2))(v7, v14);
  }
}

void sub_1D4F640A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __stopConfigurationRetryTimer(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ____stopConfigurationRetryTimer_block_invoke;
    block[3] = &unk_1E6A19B30;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void ____stopConfigurationRetryTimer_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) configurationRetryTimer];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v10 = 138543362;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping configuration retry timer", (uint8_t *)&v10, 0xCu);
    }
    id v7 = [*(id *)(a1 + 32) configurationRetryTimer];
    [v7 suspend];

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 504);
    *(void *)(v8 + 504) = 0;
  }
}

void __startConfigurationRetryTimer(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ____startConfigurationRetryTimer_block_invoke;
    block[3] = &unk_1E6A19B30;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

void ____updateConfiguration_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "hmf_stringForKey:", @"name");
  if (v4) {
    [v3 setDeviceName:v4];
  }

  id v5 = objc_msgSend(*(id *)(a1 + 32), "hmf_stringForKey:", @"password");
  if (v5) {
    [v3 setDevicePassword:v5];
  }

  id v6 = objc_msgSend(*(id *)(a1 + 32), "hmf_numberForKey:", @"privilege");
  id v7 = v6;
  if (v6) {
    objc_msgSend(v3, "startAutomaticallyAllowingConnectionsFromPeersInHomeGroupAndRejectOtherConnections:", objc_msgSend(v6, "integerValue") != 0);
  }

  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 40);
  int v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    char v13 = v11;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with configuration: %@", (uint8_t *)&v12, 0x16u);
  }
}

id __outputDeviceConfigurationOptions()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F15F58];
  v3[0] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

void ____updateConfiguration_block_invoke_228(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = WeakRetained;
  __int16 v14 = HMFGetOSLogHandle();
  id v15 = v14;
  if (v8)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully updated configuration", buf, 0xCu);
    }
    __stopConfigurationRetryTimer(v13);
    id v17 = 0;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2112;
      v30 = v9;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to update configuration with error: %@, cancellationReason: %@", buf, 0x20u);
    }
    id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:54 description:@"Communication failure" reason:@"Failed to set configuration." suggestion:0 underlyingError:v10];
    __startConfigurationRetryTimer(v13);
  }
  uint64_t v19 = *(void *)(a1 + 40);
  if (!v19)
  {
LABEL_11:
    if (v8)
    {
      id v21 = v13;
      id v22 = v8;
      if (v21)
      {
        v23 = v22;
        id v24 = [v21 workQueue];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = ____updateWithCurrentConfiguration_block_invoke;
        v30 = &unk_1E6A197C8;
        id v31 = v21;
        id v32 = v23;
        dispatch_async(v24, buf);
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v13)
  {
    id v20 = [v13 workQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = ____updateConfiguration_block_invoke_229;
    v26[3] = &unk_1E6A19530;
    id v28 = *(id *)(a1 + 40);
    id v27 = v17;
    dispatch_async(v20, v26);

    goto LABEL_11;
  }
  (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v17);
  if (v8)
  {
    id v25 = v8;
LABEL_16:
  }
LABEL_17:
}

uint64_t ____updateConfiguration_block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void ____updateWithCurrentConfiguration_block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    int v42 = 138543618;
    v43 = v5;
    __int16 v44 = 2112;
    uint64_t v45 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Updating with configuration: %@", (uint8_t *)&v42, 0x16u);
  }
  id v7 = [*(id *)(a1 + 40) devicePassword];
  if (![v7 length])
  {

    id v7 = 0;
  }
  id v8 = [*(id *)(a1 + 32) password];
  char v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = *(id *)(a1 + 32);
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = HMFGetLogIdentifier();
      int v42 = 138543362;
      v43 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Caching updated password", (uint8_t *)&v42, 0xCu);
    }
    __int16 v14 = *(void **)(a1 + 32);
    if (v14)
    {
      id v15 = v14;
      id v16 = v7;
      id v17 = [v15 transactionWithObjectChangeType:2];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v18 = v17;
      }
      else {
        char v18 = 0;
      }
      id v19 = v18;

      [v19 setPassword:v16];
      id v20 = [v15 home];

      id v21 = [v20 backingStore];
      id v22 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      v23 = [v21 transaction:@"Update Password" options:v22];

      [v23 add:v19 withMessage:0];
      [v23 run];
    }
  }

  unsigned int v24 = [*(id *)(a1 + 40) onlyAllowsConnectionsFromPeersInHomeGroup];
  uint64_t v25 = [*(id *)(a1 + 32) minimumUserPriviledge];
  if (v25 >= 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v25;
  }
  if (v26 != v24)
  {
    id v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = *(id *)(a1 + 32);
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      int v42 = 138543362;
      v43 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Caching updated user minimum privilege", (uint8_t *)&v42, 0xCu);
    }
    id v31 = *(void **)(a1 + 32);
    if (v31)
    {
      uint64_t v32 = v24;
      id v33 = v31;
      id v34 = [v33 transactionWithObjectChangeType:2];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v35 = v34;
      }
      else {
        v35 = 0;
      }
      id v36 = v35;

      id v37 = [NSNumber numberWithInteger:v32];
      [v36 setMinimumUserPriviledge:v37];

      uint64_t v38 = [v33 home];

      v39 = [v38 backingStore];
      __int16 v40 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
      id v41 = [v39 transaction:@"Update Minimum User Privilege" options:v40];

      [v41 add:v36 withMessage:0];
      [v41 run];
    }
  }
}

void ____startConfigurationRetryTimer_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) configurationRetryTimer];
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v4 = [v3 preferenceForKey:@"airPlayConfigurationRetryMinimum"];

    id v5 = [MEMORY[0x1E4F65530] sharedPreferences];
    uint64_t v6 = [v5 preferenceForKey:@"airPlayConfigurationRetryMaximum"];

    id v7 = [MEMORY[0x1E4F65530] sharedPreferences];
    id v8 = [v7 preferenceForKey:@"airPlayConfigurationRetryFactor"];

    id v9 = objc_alloc(MEMORY[0x1E4F65428]);
    id v10 = [v4 numberValue];
    [v10 doubleValue];
    double v12 = v11;
    id v13 = [v6 numberValue];
    [v13 doubleValue];
    double v15 = v14;
    id v16 = [v8 numberValue];
    id obja = (id)objc_msgSend(v9, "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", objc_msgSend(v16, "integerValue"), 0, v12, v15);

    [obja setDelegate:*(void *)(a1 + 32)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 504), obja);

    uint64_t v2 = obja;
  }
  id obj = v2;
  [v2 resume];
}

void sub_1D4F65330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__88852(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__88853(uint64_t a1)
{
}

void sub_1D4F65740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F65DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F66884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F67174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F679D0(_Unwind_Exception *a1)
{
}

void sub_1D4F67ACC(_Unwind_Exception *a1)
{
}

void sub_1D4F67E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____updatePassword_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      double v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      id v10 = "%{public}@Failed to update password with error: %@";
      double v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    double v15 = v9;
    id v10 = "%{public}@Successfully updated password";
    double v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_6;
  }
}

void sub_1D4F68298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____updateMinimumUserPrivilege_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      double v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      id v10 = "%{public}@Failed to minimum user privilege with error: %@";
      double v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    double v15 = v9;
    id v10 = "%{public}@Successfully updated minimum user privilege";
    double v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_6;
  }
}

void sub_1D4F687E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____updateName_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v14 = 138543618;
      double v15 = v9;
      __int16 v16 = 2112;
      id v17 = v3;
      id v10 = "%{public}@Failed to update name with error: %@";
      double v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      uint32_t v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    double v15 = v9;
    id v10 = "%{public}@Successfully updated name";
    double v11 = v8;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 12;
    goto LABEL_6;
  }
}

void sub_1D4F69174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMDCameraRecordingMediaContainerTypeAsString(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingMediaContainerType %ld", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"HMDCameraRecordingMediaContainerTypeFragmentedMP4";
  }
  return v2;
}

id HMDCameraRecordingEventTriggerOptionsAsString(char a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1) {
    [v2 addObject:@"HMDCameraRecordingEventTriggerOptionsMotion"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"HMDCameraRecordingEventTriggerOptionsDoorbell"];
  }
  id v4 = NSString;
  id v5 = [v3 componentsJoinedByString:@", "];
  id v6 = [v4 stringWithFormat:@"[%@]", v5];

  return v6;
}

void sub_1D4F6D71C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__89452(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__89453(uint64_t a1)
{
}

id mapButtonConfigurationForTVReceiver(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v8, "type", (void)v13) - 1;
        if (v9 <= 0xB && ((0xCFFu >> v9) & 1) != 0)
        {
          id v10 = -[THAButton initWithType:identifier:]([THAButton alloc], "initWithType:identifier:", qword_1D54D3E20[v9], [v8 identifier]);
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  double v11 = (void *)[v2 copy];
  return v11;
}

void sub_1D4F76034(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F760C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7613C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F761C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7626C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F762E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F763E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F76514(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F76590(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __findUserWithUUID(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = a1;
  uint64_t v6 = (void *)[[v3 alloc] initWithUUIDString:v5];

  id v7 = [v4 userWithUUID:v6];

  return v7;
}

void sub_1D4F7C2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__90794(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__90795(uint64_t a1)
{
}

void sub_1D4F7D408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4F7EE78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL isNameValidWithVoiceShortcut(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v3 = [v2 productClass];

  if (v3 == 6)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@siriactiond does not run on HomePod", (uint8_t *)&buf, 0xCu);
    }
    BOOL v7 = 1;
  }
  else
  {
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v17 = 0x2020000000;
    char v18 = 1;
    unint64_t v9 = [MEMORY[0x1E4FB4540] standardClient];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __isNameValidWithVoiceShortcut_block_invoke;
    v13[3] = &unk_1E6A0E128;
    p_long long buf = &buf;
    id v10 = v8;
    long long v14 = v10;
    [v9 getVoiceShortcutWithPhrase:v1 completion:v13];

    dispatch_time_t v11 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v10, v11);
    BOOL v7 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }

  return v7;
}

void sub_1D4F7F098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __isNameValidWithVoiceShortcut_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1D4F7F26C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7F494(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7F558(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7F5E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7F744(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F7F8A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

HMDCUWiFiDeviceWrapper *__wrapCUWiFiDevice(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [HMDCUWiFiDeviceWrapper alloc];
  uint64_t v6 = v4[1];

  BOOL v7 = [(HMDCUWiFiDeviceWrapper *)v5 initWithCUWiFiDevice:v3 dispatchQueue:v6];
  return v7;
}

void sub_1D4F816EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__91159(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__91160(uint64_t a1)
{
}

void sub_1D4F82C0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 152));
  _Unwind_Resume(a1);
}

void ____start_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Found device %@", buf, 0x16u);
    }
    unint64_t v9 = [v6 delegate];
    if (v9)
    {
      id v10 = __wrapCUWiFiDevice(v6, v3);
      dispatch_time_t v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = v6;
      long long v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        id v22 = v14;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Device %@", buf, 0x16u);
      }
      long long v15 = [v12 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ____start_block_invoke_145;
      block[3] = &unk_1E6A19668;
      id v18 = v9;
      id v19 = v12;
      id v20 = v10;
      id v16 = v10;
      dispatch_async(v15, block);
    }
  }
}

void ____start_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      unint64_t v9 = [v3 ssid];
      id v10 = [v3 identifier];
      *(_DWORD *)long long buf = 138543874;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Lost device %@: (%@)", buf, 0x20u);
    }
    dispatch_time_t v11 = [v6 delegate];
    if (v11)
    {
      id v12 = __wrapCUWiFiDevice(v6, v3);
      long long v13 = [v6 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ____start_block_invoke_147;
      block[3] = &unk_1E6A19668;
      id v16 = v11;
      id v17 = v6;
      id v18 = v12;
      id v14 = v12;
      dispatch_async(v13, block);
    }
  }
}

void ____start_block_invoke_2_148(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained delegate];
    if (v6)
    {
      BOOL v7 = __wrapCUWiFiDevice(v5, v3);
      id v8 = [v5 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ____start_block_invoke_3;
      block[3] = &unk_1E6A19668;
      id v11 = v6;
      id v12 = v5;
      id v13 = v7;
      id v9 = v7;
      dispatch_async(v8, block);
    }
  }
}

void ____start_block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = (id *)WeakRetained;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Error %@", buf, 0x16u);
    }
    id v9 = [v6 delegate];
    if (v9)
    {
      id v10 = [v6 delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ____start_block_invoke_150;
      block[3] = &unk_1E6A19668;
      id v12 = v9;
      id v13 = v6;
      id v14 = v3;
      dispatch_async(v10, block);
    }
    [v6[2] invalidate];
  }
}

void ____start_block_invoke_2_152(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = WeakRetained;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@CUWiFiScanner invalidated", buf, 0xCu);
    }
    id v6 = (void *)v3[2];
    void v3[2] = 0;
  }
  BOOL v7 = [WeakRetained delegate];
  if (v7)
  {
    id v8 = [WeakRetained delegateQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = ____start_block_invoke_153;
    v9[3] = &unk_1E6A197C8;
    id v10 = v7;
    id v11 = WeakRetained;
    dispatch_async(v8, v9);
  }
}

uint64_t ____start_block_invoke_153(uint64_t a1)
{
  return [*(id *)(a1 + 32) scannerDidStop:*(void *)(a1 + 40)];
}

uint64_t ____start_block_invoke_150(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didError:*(void *)(a1 + 48)];
}

uint64_t ____start_block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didUpdateDevice:*(void *)(a1 + 48)];
}

uint64_t ____start_block_invoke_147(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didRemoveDevice:*(void *)(a1 + 48)];
}

uint64_t ____start_block_invoke_145(uint64_t a1)
{
  return [*(id *)(a1 + 32) scanner:*(void *)(a1 + 40) didAddDevice:*(void *)(a1 + 48)];
}

void sub_1D4F84CBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F84DB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F84EBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F8506C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F86E10(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F86F80(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F87014(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4F87828(_Unwind_Exception *a1)
{
}

void sub_1D4F87B30(_Unwind_Exception *a1)
{
}

void sub_1D4F8CCBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F8EB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F8F504(_Unwind_Exception *a1)
{
}

void sub_1D4F8F810(_Unwind_Exception *a1)
{
}

void sub_1D4F9003C(_Unwind_Exception *a1)
{
}

void sub_1D4F90A68(_Unwind_Exception *a1)
{
}

void sub_1D4F90B5C(_Unwind_Exception *a1)
{
}

void sub_1D4F90BF0(_Unwind_Exception *a1)
{
}

void __bootstrapSupportedStereoPairVersions(void *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [v1 identifier];
  id v3 = (id)_mediaRouteIdentifier;
  if (([v2 isEqual:v3] & 1) == 0)
  {
    uint64_t v4 = [v1 supportedStereoPairVersions];

    if (v4) {
      goto LABEL_5;
    }
    id v5 = [v1 softwareVersion];
    id v6 = v5;
    if (v5)
    {
      id v2 = v5;
    }
    else
    {
      BOOL v7 = [v1 device];
      id v8 = [v7 productInfo];
      id v2 = [v8 softwareVersion];
    }
    if ([v1 isHomePod])
    {
      BOOL v9 = 0;
      if (!v2)
      {
LABEL_13:
        *(_OWORD *)long long buf = *MEMORY[0x1E4F64F68];
        uint64_t v25 = *(void *)(MEMORY[0x1E4F64F68] + 16);
        uint64_t v12 = HMFOperatingSystemVersionCompare();
        if (v2) {
          [v2 operatingSystemVersion];
        }
        *(_OWORD *)long long buf = *MEMORY[0x1E4F65070];
        uint64_t v25 = *(void *)(MEMORY[0x1E4F65070] + 16);
        uint64_t v13 = HMFOperatingSystemVersionCompare();
        char v19 = v12 != 1 || v9;
        if ((v19 & 1) == 0 && v13 != 1)
        {
          id v20 = (void *)MEMORY[0x1D9452090](v13, v14, v15, v16, v17, v18);
          id v21 = v1;
          id v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            __int16 v23 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            *(void *)&uint8_t buf[4] = v23;
            _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Bootstrapping stereo pair version to V1", buf, 0xCu);
          }
          [v21 setSupportedStereoPairVersions:1];
        }
        goto LABEL_3;
      }
    }
    else
    {
      id v10 = [v1 device];
      id v11 = [v10 productInfo];
      BOOL v9 = [v11 productClass] != 6;

      if (!v2) {
        goto LABEL_13;
      }
    }
    [v2 operatingSystemVersion];
    goto LABEL_13;
  }

LABEL_3:
LABEL_5:
}

void __HMDAppleMediaAccessoryHandleUpdatedDevice(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = v3;
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    uint64_t v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Device updated to: %@", (uint8_t *)&v17, 0x16u);
  }
  BOOL v9 = [v6 notificationCenter];
  [v9 removeObserver:v6 name:@"HMDDeviceUpdatedNotification" object:0];

  if (v4)
  {
    [v6 startMonitoringReachability];
    id v10 = [v6 symptomsHandler];
    [v10 handleAccessoryDeviceUpdated];

    id v11 = [v6 identifier];
    uint64_t v12 = [v6 deviceMediaRouteIdentifierFactory];
    uint64_t v13 = v12[2]();
    int v14 = [v11 isEqual:v13];

    if (v14)
    {
      uint64_t v15 = [v6 notificationCenter];
      [v15 addObserver:v6 selector:sel_handleCurrentDeviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:v4];

      if ([v6 shouldUpdateWithDevice:v4 initialConfiguration:0]) {
        [v6 updateWithDevice:v4];
      }
    }
    __bootstrapSupportedStereoPairVersions(v6);
    uint64_t v16 = [v6 notificationCenter];
    [v16 postNotificationName:@"HMDAppleMediaAccessoryDeviceUpdatedNotification" object:v6];
  }
  [v6 registerForPublishingNotifications];
}

void sub_1D4F96A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__93068(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__93069(uint64_t a1)
{
}

id __HMDAppleMediaAccessoryGetDeviceController(void *a1)
{
  id v1 = a1;
  os_unfair_recursive_lock_lock_with_options();
  id v2 = v1[61];
  os_unfair_recursive_lock_unlock();

  return v2;
}

uint64_t ____transactionAccessoryUpdated_block_invoke_93083(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) markChanged];
  }
  return result;
}

void sub_1D4F97E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, id *location, id *a14)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak((id *)(v14 - 184));
  _Unwind_Resume(a1);
}

void sub_1D4F98560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F98E48(_Unwind_Exception *a1)
{
}

void sub_1D4F9948C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F99C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F9A93C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D4F9B2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F9B988(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D4F9C43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F9CA74(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D4F9D4AC(_Unwind_Exception *a1)
{
}

void sub_1D4F9E9A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4F9EBD4(_Unwind_Exception *a1)
{
}

id getMCProfileConnectionClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v7 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    void v3[2] = __getMCProfileConnectionClass_block_invoke;
    v3[3] = &unk_1E6A159D0;
    v3[4] = &v4;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4FA1824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x1E4F143A8];
    v4[2] = 3221225472;
    v4[3] = __ManagedConfigurationLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E6A0E528;
    uint64_t v6 = 0;
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("MCProfileConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  getMCProfileConnectionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ManagedConfigurationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ManagedConfigurationLibraryCore_frameworkLibrary = result;
  return result;
}

id addressesFromWANRule(void *a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v1 = [a1 subject];
  uint64_t v2 = [v1 hostnames];

  if (v2)
  {
    id v3 = [v1 hostnames];
    goto LABEL_8;
  }
  uint64_t v4 = [v1 addresses];

  if (v4)
  {
    long long v5 = [v1 addresses];
    uint64_t v6 = objc_msgSend(v5, "na_map:", &__block_literal_global_70_93643);
LABEL_7:
    id v3 = (void *)v6;

    goto LABEL_8;
  }
  uint64_t v7 = [v1 addressRange];

  if (v7)
  {
    id v8 = NSString;
    BOOL v9 = [v1 addressRange];
    id v10 = [v9 addressStart];
    id v11 = [v10 addressString];
    uint64_t v12 = [v1 addressRange];
    uint64_t v13 = [v12 addressEnd];
    uint64_t v14 = [v13 addressString];
    long long v5 = [v8 stringWithFormat:@"%@ - %@", v11, v14];

    v16[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    goto LABEL_7;
  }
  id v3 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:

  return v3;
}

uint64_t __addressesFromWANRule_block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressString];
}

id wanRuleFromJSONRule(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [v1 dataUsingEncoding:4];
  id v15 = 0;
  uint64_t v4 = [v2 JSONObjectWithData:v3 options:0 error:&v15];
  id v5 = v15;

  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    BOOL v9 = +[HMDNetworkRouterFirewallRuleWAN createWithJSONDictionary:v8 error:0];
    if (v9) {
      goto LABEL_12;
    }
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v8;
      uint64_t v13 = "%{public}@Failed to convert dictionary %@ to HMDNetworkRouterFirewallRuleWAN";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      int v17 = v12;
      __int16 v18 = 2112;
      id v19 = v1;
      uint64_t v13 = "%{public}@Failed to convert JSON string %@ to dictionary";
      goto LABEL_10;
    }
  }

  BOOL v9 = 0;
LABEL_12:

  return v9;
}

__CFString *HMDCameraRemoteStreamSessionStateAsString(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1))
  {
    uint64_t v2 = off_1E6A0E540[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRemoteStreamSessionState %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_1D4FAE4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__94059(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__94060(uint64_t a1)
{
}

void sub_1D4FAFC48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FB1D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4FB2AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 184), 8);
  _Unwind_Resume(a1);
}

void addFallbackLANRules(unsigned char *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 hasFullAccessToLAN])
  {
    *a1 = 1;
  }
  else
  {
    id v6 = [v5 lanRules];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      id v8 = [v5 lanRules];
      [v9 addObjectsFromArray:v8];
    }
  }
}

void sub_1D4FB68E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FB72EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FB785C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_unfair_lock_t lock)
{
}

void sub_1D4FB88E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FB8954(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FB8E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FB9678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FB9E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FBA670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FBC6AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D4FBF21C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FBF758(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FBFB44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FBFE9C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FBFF30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC0094(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC1784(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC1838(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC1904(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC1C40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC1DB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC1EB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC30A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC3184(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC3210(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC329C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC3328(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC33B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC3430(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC34AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC5F5C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC6090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FC6288(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC6314(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC6390(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8918(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8A7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8B28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8C98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8D40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8DEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8E8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8F38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC8FC4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D4FC9274(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9384(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9560(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9638(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC976C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9818(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC98A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9920(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC999C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9A18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9A94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9B10(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FC9BF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FCE708(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FCE984(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FCEA00(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FCEE1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FCF014(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMDDeviceControllerUpdateDevice(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v3;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier();
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Updating device: %@", (uint8_t *)&v14, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    if (*((id *)v6 + 3) == v4)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
    }
    else
    {
      objc_storeStrong((id *)v6 + 3, a2);
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      id v9 = (void *)MEMORY[0x1D9452090]();
      id v10 = v6;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        int v14 = 138543618;
        id v15 = v12;
        __int16 v16 = 2112;
        id v17 = v4;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Updated device: %@", (uint8_t *)&v14, 0x16u);
      }
      uint64_t v13 = [v10 delegate];
      if (objc_opt_respondsToSelector()) {
        [v13 deviceController:v10 didUpdateDevice:v4];
      }
    }
  }
}

__CFString *HMDNetworkRouterControlOperationStatusTypeAsString(unint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDNetworkRouterControlOperationStatusType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EA58[a1];
  }
  return v1;
}

void sub_1D4FD73A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FD7948(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FDC588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FDD238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__98230(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__98231(uint64_t a1)
{
}

void sub_1D4FDD818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FDE1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FDF9FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FDFB98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FDFEE8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FE0250(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FE0410(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDVideoCodecTypeAsString(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDVideoCodecType %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"HMDVideoCodecTypeH264";
  }
  return v2;
}

__CFString *HMDH264ProfileTypeAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDH264ProfileType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EC70[a1];
  }
  return v1;
}

__CFString *HMDH264LevelTypeAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDH264LevelType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EC88[a1];
  }
  return v1;
}

__CFString *HMDPacketizationModeTypeAsString(uint64_t a1)
{
  if (a1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDPacketizationModeType %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"HMDPacketizationModeTypeSingleNonInterleaved";
  }
  return v2;
}

__CFString *HMDAudioCodecGroupTypeAsString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDAudioCodecGroupType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0ED90[a1];
  }
  return v1;
}

__CFString *HMDBitRateSettingTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HMDBitRateSettingTypeConstant";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDBitRateSettingType %tu", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HMDBitRateSettingTypeVariable";
  }
  return v2;
}

__CFString *HMDAudioSampleRateTypeAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDAudioSampleRateType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EDC8[a1];
  }
  return v1;
}

__CFString *HMDSRTPCryptoSuiteTypeAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDSRTPCryptoSuiteType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EDE0[a1];
  }
  return v1;
}

__CFString *HMDStreamControlPointResponseStatusAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDSessionControlCommand %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EE20[a1];
  }
  return v1;
}

__CFString *HMDStreamingStatusTypeAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDStreamingStatusType %tu", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A0EE38[a1];
  }
  return v1;
}

void sub_1D4FE9DD8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D4FEAE98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FEB488(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEB534(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEB6E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEB7B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEB870(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEB930(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEBD08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEBE0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEC104(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEC294(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEC30C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FEC3A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FED014(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void notifyMatterMetricPairingStep(void *a1, unint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = v3;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    id v8 = HMDMatterAccessoryPairingStepAsString(a2);
    int v13 = 138543618;
    int v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying matter metric pairing step %@", (uint8_t *)&v13, 0x16u);
  }
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  id v10 = [NSNumber numberWithUnsignedInteger:a2];
  [v9 setObject:v10 forKeyedSubscript:@"HMDMatterAccessoryPairingStepKey"];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v12 = (void *)[v9 copy];
  [v11 postNotificationName:@"HMDMatterAccessoryUpdatePairingMetricNotification" object:0 userInfo:v12];
}

void notifyMatterMetricPairingEnded(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28EB8];
  id v4 = a2;
  id v5 = a1;
  id v17 = [v3 defaultCenter];
  id v6 = v5;
  id v7 = v4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = v6;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying matter metric pairing ended %@", buf, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"HMDMatterAccessoryPairingSubmitKey"];
  int v13 = [v7 step];
  [v12 setObject:v13 forKeyedSubscript:@"HMDMatterAccessoryPairingStepKey"];

  int v14 = [v7 error];
  [v12 setObject:v14 forKeyedSubscript:@"HMDMatterAccessoryPairingFailureErrorKey"];

  __int16 v15 = [v7 sourceErrorDomain];
  [v12 setObject:v15 forKeyedSubscript:@"HMDMatterAccessoryPairingSourceErrorDomain"];

  __int16 v16 = (void *)[v12 copy];
  [v17 postNotificationName:@"HMDMatterAccessoryUpdatePairingMetricNotification" object:0 userInfo:v16];
}

void sub_1D4FEE304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FEE920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D4FF0908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FF2AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
}

void sub_1D4FF6204(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDDefaultRoomName()
{
  HMDLocalizedStringForKey(@"DEFAULT_ROOM");
  uint64_t v0 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = v0;
  if (!v0) {
    uint64_t v0 = @"Default Room";
  }
  uint64_t v2 = v0;

  return v2;
}

void sub_1D4FF9638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FFA818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FFB690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,uint64_t a28,char a29)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v30);
  _Block_object_dispose(&a29, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__102232(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__102233(uint64_t a1)
{
}

void sub_1D4FFB8C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 104));
  _Unwind_Resume(a1);
}

void sub_1D4FFBF30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1D4FFC774(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FFC840(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FFCD40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FFD9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FFDC88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FFE198(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t _validateClientRequest(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 headerFields];
  uint64_t v5 = objc_msgSend(v4, "hmf_stringForKey:", @"Protocol-Version");

  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v5];
    if (v6)
    {
      id v7 = +[HMDHTTPServerMessageTransport maximumSupportedProtocolVersion];
      int v8 = [v6 isAtLeastVersion:v7];

      if (v8)
      {
        if (a2)
        {
          [NSString stringWithFormat:@"The client's protocol version, %@, is not supported", v6];
LABEL_22:
          *a2 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
  }
  id v9 = [v3 headerFields];
  id v10 = objc_msgSend(v9, "hmf_UUIDForKey:", @"Client-Identifier");

  if (v10)
  {
    id v11 = [v3 body];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      int v13 = (void *)MEMORY[0x1E4F28F98];
      int v14 = [v3 body];
      id v22 = 0;
      __int16 v15 = [v13 propertyListWithData:v14 options:0 format:0 error:&v22];
      id v6 = v22;

      if (!v15)
      {
        if (a2)
        {
          [NSString stringWithFormat:@"Failed to deserialize message payload with error: %@", v6];
          goto LABEL_22;
        }
LABEL_23:

        goto LABEL_24;
      }
      id v16 = v15;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        uint64_t v18 = v16;
      }
      else {
        uint64_t v18 = 0;
      }
      id v19 = v18;

      if (a2 && (isKindOfClass & 1) == 0)
      {
        *a2 = [NSString stringWithFormat:@"Invalid message class type: %@", objc_opt_class()];
      }

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_24;
      }
    }
    uint64_t v20 = 1;
  }
  else
  {
    if (!a2)
    {
LABEL_24:
      uint64_t v20 = 0;
      goto LABEL_25;
    }
    uint64_t v20 = 0;
    *a2 = @"Missing the client identifier from the request";
  }
LABEL_25:

  return v20;
}

void sub_1D4FFE8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D4FFF0A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D4FFF39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5000140(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50001E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5000294(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5000310(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __handleUpdatedDevice(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = v3;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Device updated to: %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4)
  {
    __registerForDeviceNotifications(v6, v4);
    id v9 = [v6 residentDeviceManager];
    [v9 notifyClientsOfUpdatedResidentDevice:v6];
  }
  else
  {
    __deregisterForDeviceNotifications(v6);
  }
}

void __registerForDeviceNotifications(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 && v4)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v3;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      int v10 = [v5 shortDescription];
      int v12 = 138543618;
      id v13 = v9;
      __int16 v14 = 2112;
      __int16 v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Registering for device notifications for: %@", (uint8_t *)&v12, 0x16u);
    }
    __deregisterForDeviceNotifications(v7);
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel___deviceUpdated_ name:@"HMDDeviceUpdatedNotification" object:v5];
  }
}

void __deregisterForDeviceNotifications(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = v1;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      int v8 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Deregistering for device notifications", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:v3 name:@"HMDDeviceUpdatedNotification" object:0];
  }
}

void sub_1D5002138(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5002444(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t residentCapabilitiesForDevice(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 version];
  id v6 = [[HMDHomeKitVersion alloc] initWithVersionString:@"3.0"];
  int v7 = [v5 isAtLeastVersion:v6];

  if (v7) {
    uint64_t v8 = 7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [v3 version];
  int v10 = [[HMDHomeKitVersion alloc] initWithVersionString:@"4.0"];
  int v11 = [v9 isAtLeastVersion:v10];

  if (v11) {
    uint64_t v12 = v8 | 8;
  }
  else {
    uint64_t v12 = v8;
  }
  id v13 = [v3 version];

  __int16 v14 = [[HMDHomeKitVersion alloc] initWithVersionString:@"4.3"];
  int v15 = [v13 isAtLeastVersion:v14];

  if (v15) {
    uint64_t v16 = v12 | 0x10;
  }
  else {
    uint64_t v16 = v12;
  }
  if ([v4 supportsMediaActions]) {
    v16 |= 0x220uLL;
  }
  if ([v4 supportsShortcutActions]) {
    v16 |= 0x100uLL;
  }
  if ([v4 supportsCameraRecording]) {
    v16 |= 0x40uLL;
  }
  if ([v4 supportsRouterManagement]) {
    v16 |= 0x80uLL;
  }
  if ([v4 supportsFirmwareUpdate]) {
    v16 |= 0x800uLL;
  }
  if ([v4 supportsResidentFirmwareUpdate]) {
    v16 |= 0x800000uLL;
  }
  if ([v4 supportsCameraActivityZones]) {
    v16 |= 0x1000uLL;
  }
  if ([v4 supportsFaceClassification]) {
    v16 |= 0x2000uLL;
  }
  if ([v4 supportsNaturalLighting]) {
    v16 |= 0x4000uLL;
  }
  if ([v4 supportsAnnounce]) {
    v16 |= 0x8000uLL;
  }
  if ([v4 supportsThreadBorderRouter]) {
    v16 |= 0x10000uLL;
  }
  if ([v4 supportsCameraRecordingReachabilityNotifications]) {
    v16 |= 0x20000uLL;
  }
  if ([v4 supportsWalletKey]) {
    v16 |= 0x40000uLL;
  }
  if ([v4 supportsAccessCodes]) {
    v16 |= 0x200000uLL;
  }
  if ([v4 supportsLockNotificationContext]) {
    v16 |= 0x80000uLL;
  }
  if ([v4 supportsCameraPackageDetection]) {
    v16 |= 0x100000uLL;
  }
  if ([v4 supportsCHIP]) {
    v16 |= 0x400000uLL;
  }
  if ([v4 supportsCustomMediaApplicationDestination]) {
    v16 |= 0x1000000uLL;
  }
  if ([v4 supportsThreadNetworkCredentialSharing]) {
    v16 |= 0x2000000uLL;
  }
  if ([v4 supportsMatterSharedAdminPairing]) {
    v16 |= 0x4000000uLL;
  }
  if ([v4 supportsEventLog]) {
    v16 |= 0x8000000uLL;
  }
  if ([v4 supportsUWB]) {
    v16 |= 0x20000000uLL;
  }
  if ([v4 supportsMatterTTU]) {
    uint64_t v17 = v16 | 0x10000000;
  }
  else {
    uint64_t v17 = v16;
  }
  int v18 = [v4 supportsMatterOwnerCertFetch];

  if (v18) {
    return v17 | 0x80000000;
  }
  else {
    return v17;
  }
}

void sub_1D5005054(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50076EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, id location)
{
  objc_destroyWeak(v16);
  __HMFActivityScopeLeave();
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5007F44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5007FB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D500804C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D500BC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 160));
  _Unwind_Resume(a1);
}

void sub_1D500C7D8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D500CC04(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D500CDAC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D500D848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id a41)
{
}

void sub_1D5014CB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id uuidSetFromArrayOfStrings(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x1E4F29128]);
        int v10 = objc_msgSend(v9, "initWithUUIDString:", v8, (void)v12);
        [v2 addObject:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

void sub_1D5018330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__105206(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__105207(uint64_t a1)
{
}

void sub_1D5019668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D501A674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D5022784(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5022B30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5024758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5024BC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D502508C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D502CA4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D502D268(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D502D5CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D502D778(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D502D800(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D502DA04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D502DBB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5030E40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__107092(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__107093(uint64_t a1)
{
}

void sub_1D5031048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __updateAccount(void *a1, int a2)
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 accountChangeBackoffTimer];
    [v5 suspend];

    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v4;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v115 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating account", buf, 0xCu);
    }
    v97 = [v7 account];
    if (!v97)
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = v7;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v115 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Failed to update account, there is no account", buf, 0xCu);
      }
      goto LABEL_67;
    }
    int v10 = [MEMORY[0x1E4F65570] systemInfo];
    int v11 = [v10 isMigrating];

    v96 = v7;
    uint64_t v12 = [v7 service];
    int v13 = objc_msgSend(v12, "hmd_isActive");

    if ((v11 & 1) == 0 && v13)
    {
      uint64_t v14 = __createAccountHandles(v7);
      if (objc_msgSend(v14, "hmf_isEmpty"))
      {
        uint64_t v15 = (void *)MEMORY[0x1D9452090]();
        id v16 = v96;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          v115 = v18;
          _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Failed to create handles", buf, 0xCu);
        }
        uint64_t updated = __updateCurrentDevice(v16, v97);
      }
      else
      {
        int v91 = a2;
        v92 = v4;
        uint64_t v31 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:0 mustPush:0];
        uint64_t v32 = [v7 backingStore];
        v90 = (void *)v31;
        v89 = [v32 transaction:@"Update Handles" options:v31];

        v98 = [MEMORY[0x1E4F1CA48] array];
        id v33 = (void *)MEMORY[0x1E4F1CAD0];
        id v34 = [v7 account];
        v35 = [v34 handles];
        id v36 = [v33 setWithArray:v35];

        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        v95 = v14;
        id v37 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
        v93 = v36;
        uint64_t v38 = objc_msgSend(v36, "hmf_addedObjectsFromSet:", v37);

        uint64_t v39 = [v38 countByEnumeratingWithState:&v108 objects:v118 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          id v41 = v96;
          uint64_t v42 = *(void *)v109;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v109 != v42) {
                objc_enumerationMutation(v38);
              }
              __int16 v44 = *(void **)(*((void *)&v108 + 1) + 8 * i);
              uint64_t v45 = (void *)MEMORY[0x1D9452090]();
              id v46 = v41;
              v47 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                v48 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543618;
                v115 = v48;
                __int16 v116 = 2112;
                v117 = v44;
                _os_log_impl(&dword_1D49D5000, v47, OS_LOG_TYPE_INFO, "%{public}@Adding handle: %@", buf, 0x16u);

                id v41 = v96;
              }

              v49 = [v97 modelIdentifier];
              [v44 setModelParentIdentifier:v49];

              v50 = [v44 modelObjectWithChangeType:1 version:4];
              if (v50) {
                [v98 addObject:v50];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v108 objects:v118 count:16];
          }
          while (v40);
        }

        long long v106 = 0u;
        long long v107 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        v51 = v95;
        v52 = [MEMORY[0x1E4F1CAD0] setWithArray:v95];
        v53 = objc_msgSend(v93, "hmf_commonObjectsFromSet:", v52);

        uint64_t v54 = [v53 countByEnumeratingWithState:&v104 objects:v113 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v105;
          v94 = v53;
          do
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v105 != v56) {
                objc_enumerationMutation(v53);
              }
              v58 = *(void **)(*((void *)&v104 + 1) + 8 * j);
              v103[0] = MEMORY[0x1E4F143A8];
              v103[1] = 3221225472;
              v103[2] = ____updateAccount_block_invoke;
              v103[3] = &unk_1E6A0F420;
              v103[4] = v58;
              v59 = objc_msgSend(v51, "hmf_objectPassingTest:", v103);
              if (v59
                && (objc_opt_respondsToSelector() & 1) != 0
                && ([v58 isBackingStorageEqual:v59] & 1) == 0)
              {
                v60 = [HMDAccountHandleModel alloc];
                v61 = [v58 modelIdentifier];
                v62 = [v58 modelParentIdentifier];
                v63 = [(HMDBackingStoreModelObject *)v60 initWithObjectChangeType:2 uuid:v61 parentUUID:v62];

                v64 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v59, "isLocal"));
                [(HMDAccountHandleModel *)v63 setLocal:v64];

                if (v63) {
                  [v98 addObject:v63];
                }

                v53 = v94;
              }

              v51 = v95;
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v104 objects:v113 count:16];
          }
          while (v55);
        }

        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        v65 = [MEMORY[0x1E4F1CAD0] setWithArray:v51];
        v66 = objc_msgSend(v93, "hmf_removedObjectsFromSet:", v65);

        uint64_t v67 = [v66 countByEnumeratingWithState:&v99 objects:v112 count:16];
        v68 = v96;
        if (v67)
        {
          uint64_t v69 = v67;
          uint64_t v70 = *(void *)v100;
          do
          {
            for (uint64_t k = 0; k != v69; ++k)
            {
              if (*(void *)v100 != v70) {
                objc_enumerationMutation(v66);
              }
              v72 = *(void **)(*((void *)&v99 + 1) + 8 * k);
              v73 = (void *)MEMORY[0x1D9452090]();
              id v74 = v68;
              v75 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                v76 = HMFGetLogIdentifier();
                *(_DWORD *)long long buf = 138543618;
                v115 = v76;
                __int16 v116 = 2112;
                v117 = v72;
                _os_log_impl(&dword_1D49D5000, v75, OS_LOG_TYPE_INFO, "%{public}@Removing handle: %@", buf, 0x16u);

                v68 = v96;
              }

              v77 = [v72 modelObjectWithChangeType:3 version:4];
              if (v77) {
                [v98 addObject:v77];
              }
            }
            uint64_t v69 = [v66 countByEnumeratingWithState:&v99 objects:v112 count:16];
          }
          while (v69);
        }

        if ((objc_msgSend(v98, "hmf_isEmpty") & 1) == 0)
        {
          [v89 addObjects:v98];
          [v89 run];
        }

        uint64_t updated = __updateCurrentDevice(v68, v97);
        uint64_t v4 = v92;
        uint64_t v14 = v95;
        a2 = v91;
        if (updated)
        {
          v78 = (void *)MEMORY[0x1D9452090]();
          id v79 = v96;
          v80 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            v81 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            v115 = v81;
            _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully updated account", buf, 0xCu);
          }
          v82 = [v79 accountChangeBackoffTimer];
          [v82 reset];

          v83 = [v79 devicesChangeBackoffTimer];
          [v83 suspend];

          objc_msgSend(v79, "__updateMergeIDOnAccount");
          goto LABEL_66;
        }
      }
      if (a2)
      {
        v84 = (void *)MEMORY[0x1D9452090](updated);
        id v85 = v96;
        v86 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
        {
          v87 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          v115 = v87;
          _os_log_impl(&dword_1D49D5000, v86, OS_LOG_TYPE_INFO, "%{public}@Failed to update the account, will try again later", buf, 0xCu);
        }
        v88 = [v85 accountChangeBackoffTimer];
        [v88 resume];
      }
LABEL_66:

      goto LABEL_67;
    }
    id v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = v7;
    uint64_t v26 = HMFGetOSLogHandle();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v27)
      {
        id v28 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v115 = v28;
        v29 = "%{public}@Skipping updating of account during migration, will try again later";
LABEL_19:
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, v29, buf, 0xCu);
      }
    }
    else if (v27)
    {
      id v28 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v115 = v28;
      v29 = "%{public}@Skipping updating of account while the service is inactive, will try again later";
      goto LABEL_19;
    }

    uint64_t v30 = [v25 accountChangeBackoffTimer];
    [v30 resume];

LABEL_67:
  }
}

void __updateDevices(void *a1, char a2)
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 devicesChangeBackoffTimer];
    [v5 suspend];

    long long v102 = [v4 account];
    if (!v102)
    {
      v83 = (void *)MEMORY[0x1D9452090]();
      id v84 = v4;
      id v85 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        v86 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v127 = v86;
        _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_INFO, "%{public}@Failed to determine devices on our account, there is no account", buf, 0xCu);
      }
      goto LABEL_73;
    }
    uint64_t v6 = [MEMORY[0x1E4F65570] systemInfo];
    int v7 = [v6 isMigrating];

    uint64_t v8 = [v4 service];
    int v9 = objc_msgSend(v8, "hmd_isActive");

    if ((v7 & 1) == 0 && v9)
    {
      char v94 = a2;
      int v10 = (void *)MEMORY[0x1E4F1CA80];
      int v11 = __createDevices(v4);
      uint64_t v12 = [v10 setWithArray:v11];

      int v13 = (void *)MEMORY[0x1D9452090]();
      v95 = v4;
      uint64_t v14 = v4;
      uint64_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        v127 = v16;
        __int16 v128 = 2112;
        uint64_t v129 = v12;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Updating account with peer devices: %@", buf, 0x16u);
      }
      uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
      long long v101 = [MEMORY[0x1E4F1CA48] array];
      int v18 = (void *)MEMORY[0x1E4F1CAD0];
      id v19 = [v14 account];
      uint64_t v20 = [v19 devices];
      id v21 = objc_msgSend(v20, "hmf_objectsPassingTest:", &__block_literal_global_550);
      id v22 = [v18 setWithArray:v21];

      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      v96 = v22;
      v97 = (void *)v12;
      __int16 v23 = objc_msgSend(v22, "hmf_addedObjectsFromSet:", v12);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v119 objects:v125 count:16];
      v103 = v17;
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v120;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v120 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(void **)(*((void *)&v119 + 1) + 8 * i);
            v29 = (void *)MEMORY[0x1D9452090]();
            uint64_t v30 = v14;
            uint64_t v31 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              uint64_t v32 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              v127 = v32;
              __int16 v128 = 2112;
              uint64_t v129 = (uint64_t)v28;
              _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Adding device: %@", buf, 0x16u);

              uint64_t v17 = v103;
            }

            [v28 setAccount:v102];
            id v33 = [v28 backingStoreObjectsWithChangeType:1 version:4];
            [v17 addObjectsFromArray:v33];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v119 objects:v125 count:16];
        }
        while (v25);
      }

      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      id v34 = v97;
      objc_msgSend(v96, "hmf_commonObjectsFromSet:", v97);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v100 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
      if (v100)
      {
        uint64_t v99 = *(void *)v116;
        do
        {
          for (uint64_t j = 0; j != v100; ++j)
          {
            if (*(void *)v116 != v99) {
              objc_enumerationMutation(obj);
            }
            id v36 = *(void **)(*((void *)&v115 + 1) + 8 * j);
            id v37 = [v34 member:v36];
            uint64_t v38 = v37;
            if (v37)
            {
              uint64_t v39 = [v37 version];
              [v36 setLocalOnlyVersionFromIDS:v39];
            }
            if (([v36 isLocallyTracked] & 1) == 0)
            {
              uint64_t v40 = (void *)MEMORY[0x1D9452090]();
              id v41 = v14;
              uint64_t v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v43 = HMFGetLogIdentifier();
                __int16 v44 = [v36 shortDescription];
                *(_DWORD *)long long buf = 138543618;
                v127 = v43;
                __int16 v128 = 2112;
                uint64_t v129 = (uint64_t)v44;
                _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Tracking device locally: %@", buf, 0x16u);

                id v34 = v97;
              }

              [v36 setLocallyTracked:1];
            }
            int v45 = [v14 isDeviceLocallyPairedWatch:v36];
            if (![v36 isCloudTracked]) {
              goto LABEL_30;
            }
            if (isWatch())
            {
              [v36 setCloudTracked:0];
LABEL_30:
              if (!v38) {
                goto LABEL_44;
              }
LABEL_31:
              id v46 = [v36 version];
              v47 = [v38 version];
              int v48 = [v46 isGreaterThanVersion:v47];

              if (v48)
              {
                [v38 setAccount:v102];
                v49 = [v36 version];
                [v38 updateVersion:v49];
              }
              if (([v36 isBackingStorageEqual:v38] & 1) == 0)
              {
                v50 = (void *)MEMORY[0x1D9452090]();
                v51 = v14;
                v52 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  v53 = HMFGetLogIdentifier();
                  *(_DWORD *)long long buf = 138543618;
                  v127 = v53;
                  __int16 v128 = 2112;
                  uint64_t v129 = (uint64_t)v38;
                  _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_INFO, "%{public}@Updating device: %@", buf, 0x16u);
                }
                [v38 setAccount:v102];
                uint64_t v54 = [v38 backingStoreObjectsWithChangeType:2 version:4];
                if (!v45 || (char v55 = [v36 isCloudTracked], v56 = v101, (v55 & 1) == 0)) {
                  uint64_t v56 = v103;
                }
                [v56 addObjectsFromArray:v54];
              }
              goto LABEL_44;
            }
            if (v45)
            {
              v57 = (void *)MEMORY[0x1D9452090]();
              v58 = v14;
              v59 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                v60 = HMFGetLogIdentifier();
                v61 = [v36 identifier];
                *(_DWORD *)long long buf = 138543618;
                v127 = v60;
                __int16 v128 = 2112;
                uint64_t v129 = (uint64_t)v61;
                _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@Processing update for connected watch: %@", buf, 0x16u);

                id v34 = v97;
              }

              if (v38) {
                goto LABEL_31;
              }
            }
LABEL_44:
          }
          uint64_t v100 = [obj countByEnumeratingWithState:&v115 objects:v124 count:16];
        }
        while (v100);
      }

      long long v113 = 0u;
      long long v114 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      v62 = objc_msgSend(v96, "hmf_removedObjectsFromSet:", v34);
      uint64_t v63 = [v62 countByEnumeratingWithState:&v111 objects:v123 count:16];
      if (v63)
      {
        uint64_t v64 = v63;
        uint64_t v65 = *(void *)v112;
        do
        {
          for (uint64_t k = 0; k != v64; ++k)
          {
            if (*(void *)v112 != v65) {
              objc_enumerationMutation(v62);
            }
            uint64_t v67 = *(void **)(*((void *)&v111 + 1) + 8 * k);
            v68 = (void *)MEMORY[0x1D9452090]();
            uint64_t v69 = v14;
            uint64_t v70 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
            {
              v71 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              v127 = v71;
              __int16 v128 = 2112;
              uint64_t v129 = (uint64_t)v67;
              _os_log_impl(&dword_1D49D5000, v70, OS_LOG_TYPE_INFO, "%{public}@Removing device: %@", buf, 0x16u);
            }
            int v72 = [v67 isCloudTracked];
            v73 = [v67 backingStoreObjectsWithChangeType:3 version:4];
            if (v72) {
              id v74 = v101;
            }
            else {
              id v74 = v103;
            }
            [v74 addObjectsFromArray:v73];
          }
          uint64_t v64 = [v62 countByEnumeratingWithState:&v111 objects:v123 count:16];
        }
        while (v64);
      }

      v75 = dispatch_group_create();
      if ((objc_msgSend(v101, "hmf_isEmpty") & 1) == 0)
      {
        dispatch_group_enter(v75);
        v76 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:0 mustPush:0];
        v77 = [v14 backingStore];
        v78 = [v77 transaction:@"Update Devices" options:v76];

        [v78 addObjects:v101];
        v109[0] = MEMORY[0x1E4F143A8];
        v109[1] = 3221225472;
        v109[2] = ____updateDevices_block_invoke_551;
        v109[3] = &unk_1E6A197F0;
        long long v110 = v75;
        [v78 run:v109];
      }
      if ((objc_msgSend(v103, "hmf_isEmpty") & 1) == 0)
      {
        dispatch_group_enter(v75);
        id v79 = [v14 backingStore];
        v80 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
        v81 = [v79 transaction:@"Update Devices" options:v80];

        [v81 addObjects:v103];
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = ____updateDevices_block_invoke_2;
        v107[3] = &unk_1E6A197F0;
        long long v108 = v75;
        [v81 run:v107];
      }
      objc_initWeak((id *)buf, v14);
      v82 = v14[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ____updateDevices_block_invoke_3;
      block[3] = &unk_1E6A158D8;
      objc_copyWeak(&v105, (id *)buf);
      char v106 = v94;
      dispatch_group_notify(v75, v82, block);
      objc_destroyWeak(&v105);
      objc_destroyWeak((id *)buf);

      uint64_t v4 = v95;
      goto LABEL_73;
    }
    v87 = (void *)MEMORY[0x1D9452090]();
    id v88 = v4;
    v89 = HMFGetOSLogHandle();
    BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v90)
      {
        int v91 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v127 = v91;
        v92 = "%{public}@Skipping updating of devices during migration, will try again later";
LABEL_71:
        _os_log_impl(&dword_1D49D5000, v89, OS_LOG_TYPE_INFO, v92, buf, 0xCu);
      }
    }
    else if (v90)
    {
      int v91 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v127 = v91;
      v92 = "%{public}@Skipping updating of devices while the service is inactive, will try again later";
      goto LABEL_71;
    }

    v93 = [v88 devicesChangeBackoffTimer];
    [v93 resume];

LABEL_73:
  }
}

id __createDevices(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA80];
  id v3 = [v1 service];
  uint64_t v4 = [v3 devices];
  id v19 = objc_msgSend(v2, "setWithCapacity:", objc_msgSend(v4, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v1 service];
  uint64_t v6 = [v5 devices];

  int v7 = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        int v13 = [v1 service];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v14 = v13;
        }
        else {
          uint64_t v14 = 0;
        }
        id v15 = v14;

        id v16 = [[HMDDevice alloc] initWithService:v15 device:v12];
        if (v16) {
          [v19 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [v19 allObjects];

  return v17;
}

void ____updateDevices_block_invoke_551(uint64_t a1)
{
}

void ____updateDevices_block_invoke_2(uint64_t a1)
{
}

void ____updateDevices_block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = WeakRetained;
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resolved", (uint8_t *)&v8, 0xCu);
    }
    if (*(unsigned char *)(a1 + 40))
    {
      int v7 = [v4 notificationCenter];
      [v7 postNotificationName:@"HMDAppleAccountManagerResolved" object:v4];
    }
  }
}

uint64_t ____updateDevices_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCurrentDevice] ^ 1;
}

id __createAccountHandles(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 service];
  int v3 = objc_msgSend(v2, "hmd_isActive");

  if (v3)
  {
    id v4 = [v1 service];
    uint64_t v5 = objc_msgSend(v4, "hmd_handles");
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

uint64_t __updateCurrentDevice(void *a1, void *a2)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v3;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v68 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating device", buf, 0xCu);
    }
    uint64_t v9 = __createCurrentDevice(v6);
    uint64_t v10 = v9;
    uint64_t v11 = v9 != 0;
    if (v9)
    {
      id v51 = v6;
      id v49 = v3;
      uint64_t v12 = [v9 identifier];
      uint64_t v13 = [v4 deviceForIdentifier:v12];

      unsigned int v48 = v11;
      v47 = (void *)v13;
      if (v13)
      {
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = ____updateCurrentDevice_block_invoke;
        v61[3] = &unk_1E6A143D0;
        uint64_t v14 = (void *)v13;
        id v15 = &v62;
        id v16 = v6;
        id v17 = v6;
        id v62 = v17;
        int v18 = &v63;
        id v19 = v10;
        id v63 = v19;
        long long v20 = &v64;
        id v64 = v14;
        id v65 = v4;
        __HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice(v17, v19, v61);

        long long v21 = v10;
      }
      else
      {
        uint64_t v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v6;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v68 = v29;
          __int16 v69 = 2112;
          uint64_t v70 = v10;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Adding current device: %@", buf, 0x16u);
        }
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = ____updateCurrentDevice_block_invoke_545;
        v57[3] = &unk_1E6A18BA0;
        id v15 = &v58;
        id v30 = v27;
        id v58 = v30;
        int v18 = &v59;
        long long v21 = v10;
        id v31 = v10;
        id v59 = v31;
        long long v20 = &v60;
        id v60 = v4;
        __HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice(v30, v31, v57);
        id v16 = v51;
      }

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      uint64_t v32 = [v16 account];
      id v33 = [v32 devices];

      uint64_t v34 = [v33 countByEnumeratingWithState:&v53 objects:v66 count:16];
      v35 = v16;
      if (v34)
      {
        uint64_t v36 = v34;
        uint64_t v37 = *(void *)v54;
        v50 = v21;
        v52 = v33;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v54 != v37) {
              objc_enumerationMutation(v33);
            }
            uint64_t v39 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (([v39 isEqual:v21] & 1) == 0
              && [v39 isRelatedToDevice:v21])
            {
              uint64_t v40 = (void *)MEMORY[0x1D9452090]();
              id v41 = v35;
              uint64_t v42 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                HMFGetLogIdentifier();
                __int16 v44 = v43 = v4;
                int v45 = [v39 shortDescription];
                *(_DWORD *)long long buf = 138543618;
                v68 = v44;
                __int16 v69 = 2112;
                uint64_t v70 = v45;
                _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Removing stale device: %@", buf, 0x16u);

                v35 = v51;
                id v4 = v43;
                long long v21 = v50;
              }

              [v4 removeDevice:v39];
              id v33 = v52;
            }
          }
          uint64_t v36 = [v33 countByEnumeratingWithState:&v53 objects:v66 count:16];
        }
        while (v36);
      }

      __handleUpdatedDevice_107942(v35, v21);
      id v3 = v49;
      uint64_t v10 = v21;
      uint64_t v11 = v48;
    }
    else
    {
      long long v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = v6;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        v68 = v25;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to create current device", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t ____updateAccount_block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

HMDDevice *__createCurrentDevice(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 service];
  char v3 = objc_msgSend(v2, "hmd_isActive");

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    uint64_t v5 = +[HMDDeviceAddress localDeviceIDSIdentifier];
    if (v5)
    {
      id v6 = [[_HMDLocalDeviceHandle alloc] initWithDeviceIdentifier:v5];
      int v7 = [[HMDDeviceHandle alloc] initWithInternal:v6];
      [v4 addObject:v7];
    }
    int v8 = [v1 pushConnection];
    uint64_t v9 = [v8 publicToken];

    if (!v9)
    {
      long long v20 = [v1 service];
      long long v21 = [v20 iCloudAccount];

      long long v22 = [v21 pushToken];
      uint64_t v9 = v22;
      if (!v22 || objc_msgSend(v22, "hmf_isZeroed"))
      {

        goto LABEL_16;
      }
    }
    uint64_t v10 = [v1 service];
    uint64_t v11 = objc_msgSend(v10, "hmd_preferredHandle");

    uint64_t v12 = [[_HMDGlobalDeviceHandle alloc] initWithPushToken:v9 accountHandle:v11];
    uint64_t v13 = [[HMDDeviceHandle alloc] initWithInternal:v12];
    if (v13)
    {
      [v4 addObject:v13];
      uint64_t v14 = [(HMDDeviceHandle *)v13 identifier];
    }
    else
    {
      uint64_t v14 = 0;
    }

    if (v14)
    {
      id v23 = [HMDDevice alloc];
      uint64_t v24 = [MEMORY[0x1E4F65570] systemInfo];
      uint64_t v25 = [v24 name];
      uint64_t v26 = [MEMORY[0x1E4F65548] productInfo];
      id v27 = +[HMDHomeKitVersion currentVersion];
      id v28 = +[HMDDeviceCapabilities deviceCapabilities];
      id v19 = [(HMDDevice *)v23 initWithIdentifier:v14 handles:v4 name:v25 productInfo:v26 version:v27 capabilities:v28];

LABEL_19:
      goto LABEL_20;
    }
LABEL_16:
    v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = v1;
    id v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v32 = HMFGetLogIdentifier();
      int v34 = 138543362;
      v35 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device identifier", (uint8_t *)&v34, 0xCu);
    }
    id v19 = 0;
    goto LABEL_19;
  }
  id v15 = (void *)MEMORY[0x1D9452090]();
  id v16 = v1;
  id v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v18 = HMFGetLogIdentifier();
    int v34 = 138543362;
    v35 = v18;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Cannot create current device; Service is not active",
      (uint8_t *)&v34,
      0xCu);
  }
  id v19 = 0;
LABEL_20:

  return v19;
}

void ____updateCurrentDevice_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v18 = 138543618;
      id v19 = v7;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine rapport identity for current device: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  if (([*(id *)(a1 + 48) isBackingStorageEqual:*(void *)(a1 + 40)] & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 40);
      int v18 = 138543618;
      id v19 = v12;
      __int16 v20 = 2112;
      uint64_t v21 = v13;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Updating current device: %@", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v14 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:1 mustPush:0];
    id v15 = [*(id *)(a1 + 32) backingStore];
    id v16 = [v15 transaction:@"Update Device" options:v14];

    [*(id *)(a1 + 40) setAccount:*(void *)(a1 + 56)];
    id v17 = [*(id *)(a1 + 40) backingStoreObjectsWithChangeType:1 version:4];
    [v16 addObjects:v17];

    [v16 run];
  }
}

void __HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x1D9452090]();
  uint64_t v9 = v5;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v23 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating device rapport identity on current device", buf, 0xCu);
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F946C8]);
  [v12 setDispatchQueue:v9[2]];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ____HMDAppleAccountManagerUpdateRPIndentityForCurrentDevice_block_invoke;
  v17[3] = &unk_1E6A17FC0;
  id v18 = v12;
  id v19 = v9;
  id v20 = v6;
  id v21 = v7;
  id v13 = v12;
  uint64_t v14 = v9;
  id v15 = v7;
  id v16 = v6;
  [v13 getIdentitiesWithFlags:1 completion:v17];
}

void ____updateCurrentDevice_block_invoke_545(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      id v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine rapport identity for current device: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 48) addDevice:*(void *)(a1 + 40)];
}

void __handleUpdatedDevice_107942(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = v3[2];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ____handleUpdatedDevice_block_invoke;
    v6[3] = &unk_1E6A197C8;
    id v7 = v3;
    id v8 = v4;
    dispatch_async(v5, v6);
  }
}

void ____handleUpdatedDevice_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138543618;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Updated device: %@", buf, 0x16u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    id v10 = @"HMDDeviceNotificationKey";
    uint64_t v11 = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    id v8 = 0;
  }
  int v9 = [*(id *)(a1 + 32) notificationCenter];
  [v9 postNotificationName:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:*(void *)(a1 + 32) userInfo:v8];
}

void __setAccount(void *a1, void *a2, int a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (HMFEqualObjects())
    {
      os_unfair_recursive_lock_unlock();
      id v7 = 0;
    }
    else
    {
      id v8 = v5[7];
      objc_storeStrong(v5 + 7, a2);
      [v6 setManager:v5];
      int v9 = v5;
      id v7 = v8;
      id v10 = v6;
      if (v7)
      {
        uint64_t v11 = [v9 notificationCenter];
        [v11 removeObserver:v9 name:@"HMDAccountAddedDeviceNotification" object:v7];

        uint64_t v12 = [v9 notificationCenter];
        [v12 removeObserver:v9 name:@"HMDAccountRemovedDeviceNotification" object:v7];
      }
      if (v10)
      {
        uint64_t v13 = [v9 notificationCenter];
        [v13 addObserver:v9 selector:sel___deviceAddedToCurrentAccount_ name:@"HMDAccountAddedDeviceNotification" object:v10];

        __int16 v14 = [v9 notificationCenter];
        [v14 addObserver:v9 selector:sel___deviceRemovedFromCurrentAccount_ name:@"HMDAccountRemovedDeviceNotification" object:v10];
      }
      uint64_t v15 = [v7 manager];

      if (v15 == v9) {
        [v7 setManager:0];
      }
      uint64_t v16 = os_unfair_recursive_lock_unlock();
      id v17 = (void *)MEMORY[0x1D9452090](v16);
      id v18 = v9;
      id v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        id v21 = [v10 shortDescription];
        int v29 = 138543618;
        id v30 = v20;
        __int16 v31 = 2112;
        uint64_t v32 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Updated account: %@", (uint8_t *)&v29, 0x16u);
      }
      if (a3)
      {
        uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
        id v23 = v22;
        if (v10) {
          [v22 setObject:v10 forKeyedSubscript:@"HMDAccountNotificationKey"];
        }
        if (v7) {
          [v23 setObject:v7 forKeyedSubscript:@"HMDPreviousAccountNotificationKey"];
        }
        BOOL v24 = v10 == 0;
        uint64_t v25 = [v18 notificationCenter];
        uint64_t v26 = (void *)[v23 copy];
        [v25 postNotificationName:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v18 userInfo:v26];

        id v27 = [v18 device];
        if (v27) {
          int v28 = 1;
        }
        else {
          int v28 = v24;
        }
        if (v28 == 1) {
          __handleUpdatedDevice_107942(v18, v27);
        }
      }
    }
  }
}

void sub_1D5037FA8(_Unwind_Exception *a1)
{
}

void sub_1D503A8A8(_Unwind_Exception *a1)
{
}

void __removeAccount(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v3;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v13 = 138543618;
      __int16 v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing account: %@", (uint8_t *)&v13, 0x16u);
    }
    int v9 = [v6 backingStore];
    id v10 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
    uint64_t v11 = [v9 transaction:@"Remove Account" options:v10];

    uint64_t v12 = [v4 modelObjectWithChangeType:3 version:4];
    [v11 add:v12];

    [v11 run];
  }
}

void __updateAccountContext(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = (void *)MEMORY[0x1E4F653F0];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = ____updateAccountContext_block_invoke;
    v4[3] = &unk_1E6A19B30;
    id v5 = v1;
    [v3 activityWithName:@"Accounts.Context" parent:0 options:1 block:v4];
  }
}

HMDAccount *__createAccount(void *a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = [v1 accountContext];
    if (v3)
    {
      id v4 = +[HMDAccountIdentifier accountIdentifierForAppleAccountContext:v3];
      id v5 = [v2 service];
      int v6 = objc_msgSend(v5, "hmd_isActive");

      if (v6)
      {
        id v7 = __createAccountHandles(v2);
        if (objc_msgSend(v7, "hmf_isEmpty"))
        {
          id v8 = (void *)MEMORY[0x1D9452090]();
          id v9 = v2;
          id v10 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543362;
            uint64_t v42 = v11;
            _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to create handles", buf, 0xCu);
          }
        }
        else
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v18 = v7;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v18);
                }
                [*(id *)(*((void *)&v36 + 1) + 8 * i) setLocallyTracked:1];
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
            }
            while (v20);
          }
        }
        id v23 = [v2 service];
        BOOL v24 = [v23 iCloudAccount];

        uint64_t v25 = (void *)MEMORY[0x1E4F1CA80];
        uint64_t v26 = [v24 devices];
        id v27 = objc_msgSend(v25, "setWithCapacity:", objc_msgSend(v26, "count") + 1);

        int v28 = __createCurrentDevice(v2);
        if (v28)
        {
          [v27 addObject:v28];
        }
        else
        {
          int v29 = (void *)MEMORY[0x1D9452090]();
          id v30 = v2;
          __int16 v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            uint64_t v32 = v35 = v29;
            *(_DWORD *)long long buf = 138543362;
            uint64_t v42 = v32;
            _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to create current device", buf, 0xCu);

            int v29 = v35;
          }
        }
        uint64_t v33 = __createDevices(v2);
        [v27 addObjectsFromArray:v33];

        uint64_t v17 = [v27 allObjects];
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
        id v7 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v12 = [[HMDAccount alloc] initWithIdentifier:v4 handles:v7 devices:v17];
    }
    else
    {
      int v13 = (void *)MEMORY[0x1D9452090]();
      id v14 = v2;
      __int16 v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        uint64_t v42 = v16;
        _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Context is required to create account", buf, 0xCu);
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __addAccount(void *a1, void *a2, int a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v5)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v43 = v5;
    id v8 = v5;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v62 = v10;
      __int16 v63 = 2112;
      id v64 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding account: %@", buf, 0x16u);
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v12 = [v6 modelObjectWithChangeType:1 version:4];
    [v11 addObject:v12];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    int v13 = [v6 handles];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v56 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          if (!a3 || [*(id *)(*((void *)&v55 + 1) + 8 * i) isLocallyTracked])
          {
            uint64_t v19 = objc_msgSend(v18, "modelObjectWithChangeType:version:", 1, 4, v43);
            [v11 addObject:v19];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v15);
    }

    if ([v11 count])
    {
      uint64_t v20 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:0 mustPush:0];
      uint64_t v21 = [v8 backingStore];
      uint64_t v22 = [v21 transaction:@"Add Account" options:v20];

      [v22 addObjects:v11];
      [v22 run];
    }
    id v23 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    BOOL v24 = [v6 devices];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v52 != v27) {
            objc_enumerationMutation(v24);
          }
          int v29 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          if ((objc_msgSend(v29, "isCurrentDevice", v43) & 1) == 0
            && (!a3 || [v29 isLocallyTracked]))
          {
            id v30 = [v29 backingStoreObjectsWithChangeType:1 version:4];
            [v23 addObjectsFromArray:v30];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v26);
    }

    if ([v23 count])
    {
      __int16 v31 = +[HMDBackingStoreTransactionOptions defaultLocalOptions];
      uint64_t v32 = [v8 backingStore];
      uint64_t v33 = [v32 transaction:@"Add Account" options:v31];

      [v33 addObjects:v23];
      [v33 run];
    }
    int v34 = dispatch_group_create();
    dispatch_group_enter(v34);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = ____addAccount_block_invoke;
    aBlock[3] = &unk_1E6A197C8;
    id v35 = v6;
    id v49 = v35;
    id v36 = v8;
    id v50 = v36;
    long long v37 = (void (**)(void))_Block_copy(aBlock);
    long long v38 = [v36 cloudCache];
    long long v39 = [v38 homeManagerZone];

    uint64_t v40 = [v35 modelIdentifier];
    id v41 = (void *)v40;
    if (v39 && v40)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = ____addAccount_block_invoke_2;
      v44[3] = &unk_1E6A13370;
      id v45 = v36;
      v47 = v37;
      id v46 = v34;
      [v39 allDescendentsCloudRecordsForParentID:v41 completionHandler:v44];
    }
    else
    {
      v37[2](v37);
      dispatch_group_leave(v34);
    }
    id v5 = v43;
    dispatch_time_t v42 = dispatch_time(0, 60000000000);
    if (dispatch_group_wait(v34, v42)) {
      v37[2](v37);
    }
  }
}

void ____addAccount_block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) currentDeviceModelsWithChangeType:1 version:4];
  if ([v5 count])
  {
    uint64_t v2 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:2 mustReplay:1 mustPush:0];
    id v3 = [*(id *)(a1 + 40) backingStore];
    id v4 = [v3 transaction:@"Add Account" options:v2];

    [v4 addObjects:v5];
    [v4 run];
  }
}

void ____addAccount_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!a3)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "extractObjectChange", (void)v18);
          uint64_t v14 = v13;
          if (v13)
          {
            [v13 setObjectChangeType:1];
            [v7 addObject:v14];
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      uint64_t v15 = +[HMDBackingStoreTransactionOptions optionsWithSource:2 destination:2 mustReplay:0 mustPush:0];
      uint64_t v16 = [*(id *)(a1 + 32) backingStore];
      uint64_t v17 = [v16 transaction:@"Add Account Reprocess Cloud Cache" options:v15];

      [v17 addObjects:v7];
      [v17 run];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void ____updateAccountContext_block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "aa_primaryAppleAccount");
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    *(unsigned char *)(v3 + 48) = 1;
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier();
      int v20 = 138543362;
      long long v21 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Primary apple account is logged in", (uint8_t *)&v20, 0xCu);
    }
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    if (os_signpost_enabled(v8))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D49D5000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PrimaryAppleAccountLoggedIn", "", (uint8_t *)&v20, 2u);
    }
    uint64_t v9 = [[HMDAppleAccountContext alloc] initWithAccount:v2];
    if ((HMFEqualObjects() & 1) == 0)
    {
      uint64_t v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      uint64_t v12 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = HMFGetLogIdentifier();
        int v20 = 138543618;
        long long v21 = v13;
        __int16 v22 = 2112;
        uint64_t v23 = v9;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated account context: %@", (uint8_t *)&v20, 0x16u);
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v9);
    }
  }
  else
  {
    *(unsigned char *)(v3 + 48) = 0;
  }

  uint64_t v14 = os_unfair_recursive_lock_unlock();
  uint64_t v15 = (void *)MEMORY[0x1D9452090](v14);
  id v16 = *(id *)(a1 + 32);
  uint64_t v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = HMFGetLogIdentifier();
    HMFBooleanToString();
    long long v19 = (HMDAppleAccountContext *)objc_claimAutoreleasedReturnValue();
    int v20 = 138543618;
    long long v21 = v18;
    __int16 v22 = 2112;
    uint64_t v23 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Primary iCloud (Apple) account login status: Logged In : %@", (uint8_t *)&v20, 0x16u);
  }
}

void sub_1D503BE24(_Unwind_Exception *a1)
{
}

void sub_1D503CB24(_Unwind_Exception *a1)
{
}

void sub_1D503CBC8(_Unwind_Exception *a1)
{
}

void sub_1D503CE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5048E88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50492A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50496E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50499F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5049E94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D504A854(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D504AF20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D504C9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__109402(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__109403(uint64_t a1)
{
}

void sub_1D504FEF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50501A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D505365C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5053D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5056F98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5057144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D505734C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5057B04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50598A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 144));
  _Unwind_Resume(a1);
}

void sub_1D5059CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D5059F40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__110902(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__110903(uint64_t a1)
{
}

void sub_1D505C73C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D505C7B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D505CF38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D505D614(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __removeAllAccessories(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v2 = objc_msgSend(v1[3], "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        __removeUnassociatedAccessory(v1, *(void **)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  [v1[3] removeAllObjects];
}

void __removeUnassociatedAccessory(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3[3] objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    long long v7 = v3;
    long long v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      long long v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing unassociated accessory %@", buf, 0x16u);
    }
    [v3[3] removeObjectForKey:v4];
    long long v10 = [v7 delegate];
    if (v10)
    {
      id v11 = [v7 delegateQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = ____removeUnassociatedAccessory_block_invoke;
      v12[3] = &unk_1E6A197C8;
      id v13 = v10;
      id v14 = v5;
      dispatch_async(v11, v12);
    }
  }
}

uint64_t ____removeUnassociatedAccessory_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeUnassociatedWACAccessory:*(void *)(a1 + 40)];
}

uint64_t ____updateDevice_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateUnassociatedWACAccessory:*(void *)(a1 + 40)];
}

void __addDevice(void *a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = a2;
  if ([v4 isConfigured])
  {
    uint64_t v5 = [v4 identifier];
    __removeUnassociatedAccessory(v3, v5);
LABEL_3:

    goto LABEL_11;
  }
  id v6 = v3[3];
  long long v7 = [v4 identifier];
  long long v8 = [v6 objectForKey:v7];

  if (!v8 && [v4 supportsAirPlay2])
  {
    long long v9 = (void *)MEMORY[0x1E4F2E520];
    id v10 = objc_alloc(MEMORY[0x1E4F29128]);
    id v11 = (void *)[v10 initWithUUIDString:*MEMORY[0x1E4F2C218]];
    uint64_t v5 = [v9 categoryWithIdentifier:v11];

    uint64_t v12 = [HMDUnassociatedWACAccessory alloc];
    id v13 = [v4 identifier];
    id v14 = [v13 UUIDString];
    uint64_t v15 = [v4 name];
    id v16 = [(HMDUnassociatedWACAccessory *)v12 initWithIdentifier:v14 name:v15 category:v5 messageDispatcher:v3[4] wacDevice:v4];

    __int16 v17 = (void *)MEMORY[0x1D9452090]();
    id v18 = v3;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = HMFGetLogIdentifier();
      *(_DWORD *)uint64_t v26 = 138543874;
      *(void *)&void v26[4] = v20;
      *(_WORD *)&v26[12] = 2048;
      *(void *)&v26[14] = v16;
      *(_WORD *)&v26[22] = 2112;
      uint64_t v27 = v16;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@New WAC Accessory discovered: %p %@", v26, 0x20u);
    }
    long long v21 = [v4 identifier];
    __int16 v22 = v18;
    uint64_t v23 = v16;
    [v3[3] setObject:v23 forKey:v21];
    uint64_t v24 = [v22 delegate];
    if (v24)
    {
      uint64_t v25 = [v22 delegateQueue];
      *(void *)uint64_t v26 = MEMORY[0x1E4F143A8];
      *(void *)&v26[8] = 3221225472;
      *(void *)&v26[16] = ____addUnassociatedAccessory_block_invoke;
      uint64_t v27 = (HMDUnassociatedWACAccessory *)&unk_1E6A197C8;
      id v28 = v24;
      int v29 = v23;
      dispatch_async(v25, v26);
    }
    goto LABEL_3;
  }
LABEL_11:
}

uint64_t ____addUnassociatedAccessory_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addUnassociatedWACAccessory:*(void *)(a1 + 40)];
}

void sub_1D5064CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5065734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,char a30)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1D94513B0](v23, a1);
  if (v23[0])
  {
    id v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      id v10 = std::locale::use_facet(&__b, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      int v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1D94513C0](v23);
  return a1;
}

void sub_1D5065B44(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1D94513C0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1D5065B18);
}

void sub_1D5065BB0(_Unwind_Exception *a1)
{
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1D9451450](a1 + 112);
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E6A046D8, MEMORY[0x1E4FBA1C8]);
}

void sub_1D5065D18(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    id v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    id v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void sub_1D5065F74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5065FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D50660C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D5066360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1D5066524(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D50665A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D5066660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D5066894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_1D5066A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5067018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5067414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1D5067688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1D50678AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5067AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1D5067D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_1D50682F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1D506858C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5068710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5068894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5068A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5068B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5068F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1D506910C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5069228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5069378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5069460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D5069684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5069A6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5069B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D5069CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D5069EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506A19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506A408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506A76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506A848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506A900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D506AA38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506AD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506AE84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506AF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1D506B0E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506B428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506B504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506B5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D506B6F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506BA58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506BB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506BC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D506BD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506C0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_1D506C1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506C40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506C584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506C878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506C958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506CB08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506CD1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506D26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D506D398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506D418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D506D7D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *HMDUserPresenceRegionStatusAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDUserPresenceRegionStatus %tu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6A0F9B0[a1];
  }
  return v1;
}

void sub_1D506F48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5072B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
}

void sub_1D50756F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HMDApplicationInfo *__HMDApplicationRegistryApplicationInfoForApplicationProxy(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = a2;
  size_t v5 = [v4 bundleIdentifier];
  if (v5)
  {
    id v6 = [v4 bundleURL];
    if (v6) {
      __HMDApplicationRegistryApplicationForBundleURL(v3, v6);
    }
    else {
      __HMDApplicationRegistryApplicationWithBundleIdentifier(v3, v5);
    }
    uint64_t v7 = (HMDApplicationInfo *)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      uint64_t v7 = [[HMDApplicationInfo alloc] initWithBundleIdentifier:v5 bundleURL:v6];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

id *__HMDApplicationRegistryApplicationWithBundleIdentifier(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1[2] allObjects];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ____HMDApplicationRegistryApplicationWithBundleIdentifier_block_invoke;
    v6[3] = &unk_1E6A0FB90;
    id v7 = v3;
    objc_msgSend(v4, "hmf_objectPassingTest:", v6);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void sub_1D5076304(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5076420(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMDApplicationRegistryHandleAddedApplicationInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v8 = v3;
    uint64_t v4 = [v3 isEntitledForSPIAccess];
    size_t v5 = [v8 vendorIdentifier];
    if (v5)
    {
      id v6 = +[HMDApplicationVendorIDStore sharedStore];
      id v7 = [v8 bundleIdentifier];
      [v6 addVendorID:v5 applicationBundleId:v7 spiClient:v4];
    }
    id v3 = v8;
  }
}

void sub_1D5076554(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D507E944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D507EC74(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D507FBEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5080438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5083968(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D50873BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508763C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __transactionDeviceUpdated(void *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v7 transactionResult];
  int v9 = [v5 modelObjectWithChangeType:0 version:4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  id v38 = v6;
  if (v11)
  {
    id v44 = 0;
    int v12 = [v11 diff:v6 differingFields:&v44];
    id v13 = v44;
    BOOL v14 = v13;
    if (!v12) {
      goto LABEL_38;
    }
    id v36 = v11;
    id v37 = v7;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v13;
    uint64_t v15 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (!v15) {
      goto LABEL_32;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * v18);
        int v20 = (void *)MEMORY[0x1D9452090]();
        id v21 = v5;
        __int16 v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          id v46 = v23;
          __int16 v47 = 2112;
          unsigned int v48 = v19;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating device information for %@", buf, 0x16u);

          id v6 = v38;
        }

        if ([v19 isEqualToString:@"handles"])
        {
          uint64_t v24 = [v6 deviceHandles];
          if (v24) {
            [v21 setHandles:v24];
          }
          goto LABEL_25;
        }
        if ([v19 isEqualToString:@"name"])
        {
          uint64_t v24 = [v6 name];
          size_t v25 = (void *)[v24 copy];
          [v21 setName:v25];
LABEL_24:

LABEL_25:
          [v8 markChanged];
          goto LABEL_26;
        }
        if ([v19 isEqualToString:@"version"])
        {
          uint64_t v24 = [v6 version];
          size_t v25 = (void *)[v24 copy];
          [v21 setVersion:v25];
          goto LABEL_24;
        }
        if ([v19 isEqualToString:@"productInfo"])
        {
          uint64_t v24 = [v6 productInfo];
          size_t v25 = (void *)[v24 copy];
          [v21 setProductInfo:v25];
          goto LABEL_24;
        }
        if ([v19 isEqualToString:@"rpIdentity"])
        {
          uint64_t v24 = [v6 rpIdentity];
          size_t v25 = (void *)[v24 copy];
          [v21 setRpIdentity:v25];
          goto LABEL_24;
        }
        int64_t v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v21;
        id v28 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          int v29 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          id v46 = v29;
          __int16 v47 = 2112;
          unsigned int v48 = v19;
          _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unexpected field! -- changedField: %@", buf, 0x16u);

          id v6 = v38;
        }

LABEL_26:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      uint64_t v16 = v30;
      if (!v30)
      {
LABEL_32:
        BOOL v14 = obj;

        if ([v8 changed])
        {
          [v5 setDirty:1];
          __int16 v31 = [v8 backingStore];
          __HMDDeviceMarkDirty(v5, v31);
        }
        id v11 = v36;
        id v7 = v37;
        goto LABEL_38;
      }
    }
  }
  uint64_t v32 = (void *)MEMORY[0x1D9452090]();
  id v33 = v5;
  int v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    id v35 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    id v46 = v35;
    _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve device model for updated device", buf, 0xCu);
  }
  BOOL v14 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
  [v7 respondWithError:v14];
  id v6 = v38;
LABEL_38:
}

void __HMDDeviceMarkDirty(void *a1, void *a2)
{
  id v3 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ____HMDDeviceMarkDirty_block_invoke;
  void v5[3] = &unk_1E6A197F0;
  id v6 = v3;
  id v4 = v3;
  [a2 submitBlock:v5];
}

void sub_1D508B2C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t ____idsIdentifierHashFromIDSIdentifier_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"A08F6CA5-EC1E-4DD6-A068-377BA45247B6"];
  uint64_t v1 = __idsIdentifierHashFromIDSIdentifier_namespace;
  __idsIdentifierHashFromIDSIdentifier_namespace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1D508B5EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508B864(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508BEF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508BFF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508C37C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __deregisterForAccountHandleUpdates(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F28EB8];
    id v2 = a1;
    id v3 = [v1 defaultCenter];
    [v3 removeObserver:v2 name:@"HMDAccountHandlesUpdatedNotification" object:0];
  }
}

id __deviceHandlesForAccount(void *a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v27 = a3;
  id v7 = 0;
  if (v5 && v6)
  {
    int v8 = objc_msgSend(v6, "hmf_isEmpty");
    if (!v27 || v8)
    {
      id v7 = v5;
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = ____deviceHandlesForAccount_block_invoke;
      v32[3] = &unk_1E6A0FE98;
      id v33 = v6;
      int v9 = objc_msgSend(v5, "hmf_objectsPassingTest:", v32);
      if (objc_msgSend(v9, "hmf_isEmpty"))
      {
        id v7 = v5;
      }
      else
      {
        id v24 = v6;
        id v25 = v5;
        id v10 = (void *)[v5 mutableCopy];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id obj = v9;
        uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(obj);
              }
              uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              uint64_t v16 = [v15 internal];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v17 = v16;
              }
              else {
                uint64_t v17 = 0;
              }
              id v18 = v17;

              if (v18)
              {
                uint64_t v19 = [_HMDGlobalDeviceHandle alloc];
                int v20 = [v18 pushToken];
                id v21 = [(_HMDGlobalDeviceHandle *)v19 initWithPushToken:v20 accountHandle:v27];

                __int16 v22 = [[HMDDeviceHandle alloc] initWithInternal:v21];
                if (v22)
                {
                  [v10 removeObject:v15];
                  [v10 addObject:v22];
                }
              }
            }
            uint64_t v12 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
          }
          while (v12);
        }

        id v7 = (id)[v10 copy];
        id v6 = v24;
        id v5 = v25;
      }
    }
  }

  return v7;
}

uint64_t ____deviceHandlesForAccount_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isGlobal])
  {
    id v4 = [v3 accountHandle];
    if (v4) {
      uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4] ^ 1;
    }
    else {
      uint64_t v5 = 1;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1D508C838(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508CBCC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508CCF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508D194(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D508FAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id *location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,id a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__116490(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__116491(uint64_t a1)
{
}

void sub_1D50912A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5092870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5095B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t bindStringSQLite3(sqlite3_stmt *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = v7;
  if (!*a4)
  {
    id v10 = v7;
    id v7 = v7
       ? (id) sqlite3_bind_text(a1, a2, (const char *)[v7 UTF8String], -1, 0)
       : (id)sqlite3_bind_null(a1, a2);
    id v8 = v10;
    if (v7)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:a1];
      id v8 = v10;
      *a4 = v7;
    }
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

id execSQLite3(sqlite3_stmt *a1)
{
  if (sqlite3_step(a1) == 101)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:a1];
  }
  if (sqlite3_reset(a1) && !v2)
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:a1];
  }
  return v2;
}

uint64_t bindDataSQLite3(sqlite3_stmt *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = v7;
  if (!*a4)
  {
    id v11 = v7;
    if (v7)
    {
      if ([v7 length])
      {
        id v9 = v11;
        id v7 = (id)sqlite3_bind_blob64(a1, a2, (const void *)[v9 bytes], objc_msgSend(v9, "length"), 0);
      }
      else
      {
        id v7 = (id)sqlite3_bind_zeroblob(a1, a2, 0);
      }
    }
    else
    {
      id v7 = (id)sqlite3_bind_null(a1, a2);
    }
    id v8 = v11;
    if (v7)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:a1];
      id v8 = v11;
      *a4 = v7;
    }
  }
  return MEMORY[0x1F41817F8](v7, v8);
}

sqlite3_int64 steplastrowresetSQLite3(sqlite3_stmt *a1, void *a2)
{
  if (sqlite3_step(a1) != 101)
  {
    if (a2)
    {
      *a2 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:a1];
      if (sqlite3_reset(a1))
      {
        id v6 = (void *)MEMORY[0x1E4F28C58];
        goto LABEL_8;
      }
    }
    else
    {
      sqlite3_reset(a1);
    }
    return 0;
  }
  id v4 = sqlite3_db_handle(a1);
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(v4);
  if (sqlite3_reset(a1))
  {
    if (a2)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
LABEL_8:
      [v6 errorWithSQLite3Statement:a1];
      sqlite3_int64 insert_rowid = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      return insert_rowid;
    }
    return 0;
  }
  return insert_rowid;
}

sqlite3_stmt *bindIntSQLite3(sqlite3_stmt *result, int a2, sqlite3_int64 a3, void *a4)
{
  if (!*a4)
  {
    uint64_t v5 = result;
    uint64_t result = (sqlite3_stmt *)sqlite3_bind_int64(result, a2, a3);
    if (result)
    {
      uint64_t result = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:v5];
      *a4 = result;
    }
  }
  return result;
}

id _handleFetchWithRawCallback(sqlite3_stmt *a1, void *a2)
{
  id v3 = a2;
  sqlite3_reset(a1);
  while (1)
  {
    int v4 = sqlite3_step(a1);
    if (v4 != 100) {
      break;
    }
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:a1 column:0];
    sqlite3_int64 v6 = sqlite3_column_int64(a1, 2);
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:a1 column:1];
    id v8 = [NSString stringWithSQLite3Column:a1 column:3];
    LOBYTE(v6) = v3[2](v3, v5, v6, v7, v8, 0);

    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
  }
  if (v4 == 101)
  {
LABEL_6:
    id v9 = 0;
    goto LABEL_8;
  }
  id v9 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:a1];
  ((uint64_t (**)(id, void *, sqlite3_int64, void *, void *, void *))v3)[2](v3, 0, 0, 0, 0, v9);
LABEL_8:
  sqlite3_reset(a1);

  return v9;
}

id selectSQLite3(sqlite3 *a1, const char *a2, void *a3, void *a4)
{
  v64[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = 0;
  id v10 = 0;
  ppStmt = 0;
  if (!*a4)
  {
    if (sqlite3_prepare_v2(a1, a2, -1, &ppStmt, 0))
    {
      [MEMORY[0x1E4F28C58] errorWithSQLite3Context:a1 statement:a2];
      id v9 = 0;
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
    int v11 = sqlite3_bind_parameter_count(ppStmt);
    if (v11 >= 2)
    {
      int v12 = v11;
      uint64_t v13 = 1;
      unint64_t v14 = 0x1E4F29000uLL;
      uint64_t v54 = *MEMORY[0x1E4F64ED0];
      long long v55 = a2;
      while (1)
      {
        if (*a4) {
          goto LABEL_46;
        }
        uint64_t v15 = sqlite3_bind_parameter_name(ppStmt, v13);
        if (!v15)
        {
          long long v42 = (void *)MEMORY[0x1E4F28C58];
          v64[0] = &unk_1F2DC8950;
          v63[0] = @"extcode";
          v63[1] = @"text";
          long long v43 = objc_msgSend(*(id *)(v14 + 24), "stringWithFormat:", @"statement cannot contain nameless parameters (%d is nameless)", v13);
          v64[1] = v43;
          v63[2] = @"statement";
          id v44 = [*(id *)(v14 + 24) stringWithUTF8String:a2];
          v64[2] = v44;
          id v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
          *a4 = [v42 errorWithDomain:v54 code:3 userInfo:v45];

          goto LABEL_46;
        }
        uint64_t v16 = v15;
        uint64_t v17 = [*(id *)(v14 + 24) stringWithUTF8String:v15];
        id v18 = [v7 objectForKey:v17];

        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
        }
        sqlite3_bind_null(ppStmt, v13);
LABEL_29:

        uint64_t v13 = (v13 + 1);
        if (v12 == v13) {
          goto LABEL_32;
        }
      }
      id v19 = v18;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        id v21 = v19;
      }
      else {
        id v21 = 0;
      }
      id v57 = v21;

      if (isKindOfClass)
      {
        bindDataSQLite3(ppStmt, v13, v19, a4);
LABEL_16:
        id v22 = 0;
        id v23 = 0;
LABEL_28:

        unint64_t v14 = 0x1E4F29000;
        goto LABEL_29;
      }
      id v22 = v19;
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();
      if (v24) {
        id v25 = v22;
      }
      else {
        id v25 = 0;
      }
      id v26 = v25;

      if (v24)
      {
        bindStringSQLite3(ppStmt, v13, v22, a4);
        id v23 = 0;
      }
      else
      {
        id v23 = v22;
        objc_opt_class();
        char v27 = objc_opt_isKindOfClass();
        if (v27) {
          long long v28 = v23;
        }
        else {
          long long v28 = 0;
        }
        id v29 = v28;

        if ((v27 & 1) == 0)
        {
          long long v52 = (void *)MEMORY[0x1E4F28C58];
          v62[0] = &unk_1F2DC8950;
          v61[0] = @"extcode";
          v61[1] = @"text";
          long long v30 = NSString;
          long long v31 = (objc_class *)objc_opt_class();
          long long v53 = NSStringFromClass(v31);
          uint64_t v32 = [v30 stringWithFormat:@"bind parameter %s is not of a recognized type %@ is not a (NSNull, NSData, NSString, or NSNumber)", v16, v53];
          v62[1] = v32;
          v61[2] = @"statement";
          id v33 = [NSString stringWithUTF8String:v55];
          v62[2] = v33;
          int v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];
          *a4 = [v52 errorWithDomain:v54 code:3 userInfo:v34];

          a2 = v55;
          goto LABEL_16;
        }
        bindIntSQLite3(ppStmt, v13, [v23 longLongValue], a4);
        id v22 = 0;
      }
      a2 = v55;
      goto LABEL_28;
    }
LABEL_32:
    if (*a4)
    {
LABEL_46:
      id v9 = 0;
LABEL_47:
      id v10 = 0;
    }
    else
    {
      long long v56 = a2;
      uint64_t v35 = 0;
      uint64_t v36 = sqlite3_column_count(ppStmt);
      while (1)
      {
        int v37 = sqlite3_step(ppStmt);
        if (v37 != 100) {
          break;
        }
        id v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v36];

        if ((int)v36 >= 1)
        {
          uint64_t v38 = 0;
          do
          {
            uint64_t v39 = sqlite3_column_type(ppStmt, v38);
            switch((int)v39)
            {
              case 1:
                uint64_t v40 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(ppStmt, v38));
                break;
              case 2:
                uint64_t v40 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(ppStmt, v38));
                break;
              case 3:
                uint64_t v40 = [NSString stringWithSQLite3Column:ppStmt column:v38];
                break;
              case 4:
                uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithSQLite3Column:ppStmt column:v38];
                break;
              case 5:
                uint64_t v40 = [MEMORY[0x1E4F1CA98] null];
                break;
              default:
                __int16 v47 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v48 = *MEMORY[0x1E4F64ED0];
                v60[0] = &unk_1F2DC8950;
                v59[0] = @"extcode";
                v59[1] = @"text";
                id v49 = objc_msgSend(NSString, "stringWithFormat:", @"column %d is of SQLite3 type %d (not recognized)", v38, v39);
                v60[1] = v49;
                v59[2] = @"statement";
                uint64_t v50 = [NSString stringWithUTF8String:v56];
                v60[2] = v50;
                long long v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:3];
                *a4 = [v47 errorWithDomain:v48 code:3 userInfo:v51];

                goto LABEL_47;
            }
            long long v41 = (void *)v40;
            [v9 addObject:v40];

            uint64_t v38 = (v38 + 1);
          }
          while (v36 != v38);
        }
        [v8 addObject:v9];
        uint64_t v35 = v9;
      }
      if (v37 != 101)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithSQLite3Statement:ppStmt];
      }
      sqlite3_finalize(ppStmt);
      if (*a4) {
        id v10 = 0;
      }
      else {
        id v10 = v8;
      }
      id v9 = v35;
    }
  }
LABEL_48:

  return v10;
}

id runSQLite3(sqlite3 *a1, const char *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (sqlite3_exec(a1, a2, 0, 0, 0))
  {
    int v4 = (void *)MEMORY[0x1D9452090]();
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      sqlite3_int64 v6 = HMFGetLogIdentifier();
      id v7 = [MEMORY[0x1E4F28C58] errorWithSQLite3Context:a1];
      int v10 = 138543874;
      int v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      uint64_t v15 = a2;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_ERROR, "%{public}@Got Error %@ on %s", (uint8_t *)&v10, 0x20u);
    }
    id v8 = [MEMORY[0x1E4F28C58] errorWithSQLite3Context:a1 statement:a2];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

sqlite3_stmt *prepareSQLite3(sqlite3 *a1, const char *a2, void *a3)
{
  ppStmt = 0;
  if (!sqlite3_prepare_v2(a1, a2, -1, &ppStmt, 0)) {
    return ppStmt;
  }
  if (!a3) {
    return 0;
  }
  id v6 = [MEMORY[0x1E4F28C58] errorWithSQLite3Context:a1 statement:a2];
  uint64_t result = 0;
  *a3 = v6;
  return result;
}

void sub_1D509D8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__117424(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__117425(uint64_t a1)
{
}

void sub_1D50A0FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void fmfDevicesChangedNotificationCallback()
{
  id v0 = +[HMDFMFHandler sharedHandler];
  [v0 fmfDevicesChanged];
}

void meDeviceChangedNotificationCallback()
{
  id v0 = +[HMDFMFHandler sharedHandler];
  [v0 meDeviceChanged];
}

void sub_1D50A24D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_1D50A3D00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D50A4FAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50A5C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50A601C(_Unwind_Exception *a1)
{
}

void sub_1D50A61FC(_Unwind_Exception *a1)
{
}

void sub_1D50A7674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D50A7A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__118488(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__118489(uint64_t a1)
{
}

void sub_1D50A88C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1D50AD584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1D50B1FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____handleFinishedUnarchive_block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2 == 3)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138543618;
      v66 = v7;
      __int16 v67 = 2112;
      id v68 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Finished unarchive with error: %@", buf, 0x16u);
    }
    id v9 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      [v9 setState:2];
LABEL_40:
      [*(id *)(a1 + 32) setExtractor:0];
      return;
    }
    id v11 = v9;
    __int16 v12 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"HMDSoftwareUpdateDocumentationAsset.validation"];
    uint64_t v13 = (void *)MEMORY[0x1D9452090]();
    __int16 v14 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v15 = [v11 bundleURL];
    uint64_t v16 = [v14 bundleWithURL:v15];

    if (v16)
    {
      __int16 v63 = v13;
      id v64 = v12;
      uint64_t v17 = [MEMORY[0x1E4F2EB38] localizationsForBundle:v16];
      uint64_t v18 = [v17 count];
      id v19 = (void *)MEMORY[0x1D9452090]();
      id v20 = v11;
      id v21 = HMFGetOSLogHandle();
      id v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v23 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v66 = v23;
          __int16 v67 = 2112;
          id v68 = v17;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Available localizations: %@", buf, 0x16u);
        }
        char v24 = (void *)[objc_alloc(MEMORY[0x1E4F2EB38]) initWithBundle:v16];
        BOOL v25 = v24 != 0;
        id v26 = (void *)MEMORY[0x1D9452090]();
        id v27 = v20;
        long long v28 = HMFGetOSLogHandle();
        id v29 = v28;
        if (v24)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            long long v30 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            v66 = v30;
            __int16 v67 = 2112;
            id v68 = v24;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@Cached documentation: %@", buf, 0x16u);
          }
          long long v31 = 0;
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v40 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            v66 = v40;
            __int16 v67 = 2112;
            id v68 = v16;
            _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse documentation for asset bundle: %@", buf, 0x16u);
          }
          long long v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        }
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v39 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v66 = v39;
          __int16 v67 = 2112;
          id v68 = v16;
          _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@No available localization for asset bundle: %@", buf, 0x16u);
        }
        long long v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
        BOOL v25 = 0;
      }
      uint64_t v13 = v63;
      __int16 v12 = v64;
    }
    else
    {
      uint64_t v32 = (void *)MEMORY[0x1D9452090]();
      id v33 = v11;
      int v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        uint64_t v36 = v35 = v12;
        [v33 bundleURL];
        uint64_t v38 = v37 = v13;
        *(_DWORD *)long long buf = 138543618;
        v66 = v36;
        __int16 v67 = 2112;
        id v68 = v38;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to create bundle from: %@", buf, 0x16u);

        uint64_t v13 = v37;
        __int16 v12 = v35;
      }

      long long v31 = [MEMORY[0x1E4F28C58] hmErrorWithCode:52];
      BOOL v25 = 0;
    }

    id v41 = v31;

    id v42 = v41;
    long long v43 = v42;
    if (v25)
    {
      id v44 = v42;
    }
    else
    {
      id v45 = *(id *)(a1 + 32);
      id v46 = (void *)[objc_alloc(MEMORY[0x1E4F2EB38]) initWithAsset:v45];
      __int16 v47 = (void *)MEMORY[0x1D9452090]();
      id v48 = v45;
      id v49 = HMFGetOSLogHandle();
      uint64_t v50 = v49;
      if (v46)
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          long long v51 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v66 = v51;
          __int16 v67 = 2112;
          id v68 = v46;
          _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@Cached documentation: %@", buf, 0x16u);
        }
        id v52 = v43;
      }
      else
      {
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          long long v53 = HMFGetLogIdentifier();
          uint64_t v54 = [v48 URL];
          *(_DWORD *)long long buf = 138543618;
          v66 = v53;
          __int16 v67 = 2112;
          id v68 = v54;
          _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to parse documentation from asset url: %@", buf, 0x16u);
        }
        id v52 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
      }

      id v44 = v52;
      if (!v46)
      {
        id v57 = (void *)MEMORY[0x1D9452090]();
        id v58 = *(id *)(a1 + 32);
        id v59 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          id v60 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          v66 = v60;
          __int16 v67 = 2112;
          id v68 = v44;
          _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to validate asset with error: %@", buf, 0x16u);
        }
        [*(id *)(a1 + 32) setState:0];
        [*(id *)(a1 + 32) increaseDownloadRetryCount];
        v61 = [*(id *)(a1 + 32) fileManager];
        id v62 = [*(id *)(a1 + 32) bundleURL];
        [v61 removeItemAtURL:v62 error:0];

        goto LABEL_39;
      }
    }
    [*(id *)(a1 + 32) setState:4];
    [*(id *)(a1 + 32) resetDownloadRetryCount];
LABEL_39:
    long long v55 = [*(id *)(a1 + 32) fileManager];
    long long v56 = [*(id *)(a1 + 32) archiveURL];
    [v55 removeItemAtURL:v56 error:0];

    goto LABEL_40;
  }
  if (v6)
  {
    int v10 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    v66 = v10;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to finish unarchive, not currently unarchiving", buf, 0xCu);
  }
}

void sub_1D50B3114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____handleStartedUnarchive_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = HMFGetOSLogHandle();
  BOOL v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138543618;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start unarchive with error: %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 40) cancelUnarchive];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Started unarchive", (uint8_t *)&v12, 0xCu);
    }
    int v10 = [*(id *)(a1 + 40) extractor];
    [v10 setExtractorDelegate:*(void *)(a1 + 40)];

    id v11 = [*(id *)(a1 + 40) archivedFileStream];
    [v11 open];

    __processNextArchivedData(*(void **)(a1 + 40));
  }
}

void __processNextArchivedData(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ____processNextArchivedData_block_invoke;
    block[3] = &unk_1E6A19B30;
    uint64_t v5 = v1;
    dispatch_async(v3, block);
  }
}

void ____processNextArchivedData_block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) archivedFileStream];
  int v4 = [v3 hasBytesAvailable];

  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *v2;
  id v7 = HMFGetOSLogHandle();
  uint64_t v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v21 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Reading next chunk from the archive", buf, 0xCu);
    }
    id v11 = *(void **)(a1 + 32);
    int v10 = (id *)(a1 + 32);
    int v12 = [v11 archivedFileStream];
    uint64_t v13 = [v12 read:buf maxLength:4096];

    __int16 v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:v13];
    objc_initWeak(&location, *v10);
    uint64_t v15 = [*v10 extractor];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = ____processNextArchivedData_block_invoke_413;
    v17[3] = &unk_1E6A10340;
    objc_copyWeak(&v18, &location);
    [v15 supplyBytes:v14 withCompletionBlock:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v21 = v16;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Reached end of input stream", buf, 0xCu);
    }
    [*(id *)(a1 + 32) finishUnarchive];
  }
}

void sub_1D50B36C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____processNextArchivedData_block_invoke_413(uint64_t a1, void *a2, int a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = v7;
    int v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to append data with error: %@", (uint8_t *)&v12, 0x16u);
    }
    [v9 cancelUnarchive];
  }
  else if (a3)
  {
    [WeakRetained finishUnarchive];
  }
  else
  {
    __processNextArchivedData();
  }
}

void sub_1D50B4630(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50B4838(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50B4904(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __resourceBundleForBundle(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 URLForResource:@"AssetData" withExtension:0];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28B50] bundleWithURL:v2];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = HMFGetLogIdentifier();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find resource bundle", (uint8_t *)&v8, 0xCu);
    }
    id v3 = 0;
  }

  return v3;
}

id __htmlDocumentForResource(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v5 URLForResource:v7 withExtension:@"html" subdirectory:0 localization:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (v13)
        {
          id v15 = (void *)v13;
          id v22 = 0;
          __int16 v14 = (void *)[objc_alloc(MEMORY[0x1E4F2E7F0]) initWithURL:v13 error:&v22];
          id v16 = v22;
          if (!v14)
          {
            uint64_t v17 = (void *)MEMORY[0x1D9452090]();
            id v18 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = HMFGetLogIdentifier();
              id v20 = [v15 path];
              *(_DWORD *)long long buf = 138543874;
              long long v28 = v19;
              __int16 v29 = 2112;
              long long v30 = v20;
              __int16 v31 = 2112;
              id v32 = v16;
              _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Unable to load document, %@, with error: %@", buf, 0x20u);
            }
          }

          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  __int16 v14 = 0;
LABEL_15:

  return v14;
}

void sub_1D50BE988(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50BEB00(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50BED64(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50BEDF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50BEFD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50BF334(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50BF6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  os_unfair_lock_unlock(v18);
  _Unwind_Resume(a1);
}

void sub_1D50CAD80(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__122372(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__122373(uint64_t a1)
{
}

void sub_1D50CC9F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(v34);
  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v35 - 176));
  objc_destroyWeak((id *)(v35 - 160));
  _Unwind_Resume(a1);
}

void sub_1D50CD808(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

uint64_t hasAssistantHashingKeyChanged()
{
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F65578]) initWithKey:@"HMDAssistantLastHashingKey" options:0 domain:@"com.apple.homed" defaultValue:0];

  uint64_t v1 = [v0 stringValue];
  uint64_t v2 = +[HMDHelper sharedHelper];
  id v3 = [v2 hashedRouteIDForIdentifier:@"A77C551E-C3FA-414E-ACD8-A7DF3D64E9D6"];

  uint64_t v4 = HMFEqualObjects() ^ 1;
  return v4;
}

void sub_1D50CD9C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D50CE3B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void __HMDLostModeManagerExitLostModeWithAuthCompleteNotification(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [MEMORY[0x1E4F61A48] sharedInstance];
  int v4 = [v3 needsLostModeExitAuth];

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = v2;
  id v7 = HMFGetOSLogHandle();
  id v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received lost mode exit auth notification, but findmy indicates device hasn't exited lost mode with auth", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Sending lost mode exit with auth complete notification", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"HMDLostModeManagerDidExitLostModeWithAuthCompleteNotification" object:v6];
  }
}

void __HMDLostModeManagerLostModeChangeNotification(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090]();
  int v4 = a2;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    id v5 = [MEMORY[0x1E4F61A48] sharedInstance];
    int v6 = [v5 lostModeIsActive];

    if (LOBYTE(v4[3]._os_unfair_lock_opaque) == v6)
    {
      os_unfair_lock_unlock(v4 + 2);
    }
    else
    {
      LOBYTE(v4[3]._os_unfair_lock_opaque) = v6;
      os_unfair_lock_unlock(v4 + 2);
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = v4;
      uint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        uint64_t v11 = HMFBooleanToString();
        int v13 = 138543618;
        uint64_t v14 = v10;
        __int16 v15 = 2112;
        id v16 = v11;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Received notification lost mode is active: %@", (uint8_t *)&v13, 0x16u);
      }
      int v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 postNotificationName:@"HMDLostModeManagerUpdatedNotification" object:v8];
    }
  }
}

void sub_1D50CEDB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50D3A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v22 - 112));
  _Unwind_Resume(a1);
}

void sub_1D50D3CD8(_Unwind_Exception *a1)
{
}

void __deleteAccountModel(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3[1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ____deleteAccountModel_block_invoke;
  v8[3] = &unk_1E6A197C8;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void __notifyDelegateAccountRemoved_123172(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 && v4)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v3;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      __int16 v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Account removed: %@", buf, 0x16u);
    }
    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v12 = @"HMDAccountNotificationKey";
    int v13 = v5;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v10 postNotificationName:@"HMDRemoteAccountManagerRemovedAccountNotification" object:v7 userInfo:v11];
  }
}

void ____deleteAccountModel_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldSyncAccount:*(void *)(a1 + 40)])
  {
    id v3 = [*(id *)(a1 + 32) backingStore];
    id v2 = [*(id *)(a1 + 40) modelBackedObjects];
    [v3 deleteModelObjects:v2 destination:2];
  }
}

void sub_1D50D45E8(_Unwind_Exception *a1)
{
}

void ____addAccountModel_block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldSyncAccount:*(void *)(a1 + 40)])
  {
    id v3 = [*(id *)(a1 + 32) backingStore];
    id v2 = [*(id *)(a1 + 40) modelBackedObjects];
    [v3 updateModelObjects:v2 destination:2];
  }
}

void sub_1D50D4824(_Unwind_Exception *a1)
{
}

void sub_1D50D4A64(_Unwind_Exception *a1)
{
}

void sub_1D50D4C08(_Unwind_Exception *a1)
{
}

void sub_1D50D4DA0(_Unwind_Exception *a1)
{
}

void sub_1D50D4F38(_Unwind_Exception *a1)
{
}

void sub_1D50D4FC8(_Unwind_Exception *a1)
{
}

void sub_1D50D6EDC(_Unwind_Exception *a1)
{
}

void sub_1D50D76B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ____handleUnregisteredDestination_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = WeakRetained;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v12 = [*(id *)(a1 + 40) shortDescription];
        int v13 = [*(id *)(a1 + 32) shortDescription];
        int v21 = 138543874;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        long long v24 = v12;
        __int16 v25 = 2112;
        long long v26 = v13;
        uint64_t v14 = "%{public}@Account handle, %@, failed to resolve, removing from account: %@";
LABEL_12:
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v21, 0x20u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if (([*(id *)(a1 + 32) isEqual:v5] & 1) == 0)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      id v20 = WeakRetained;
      id v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v12 = [*(id *)(a1 + 40) shortDescription];
        int v13 = [*(id *)(a1 + 32) shortDescription];
        int v21 = 138543874;
        uint64_t v22 = v11;
        __int16 v23 = 2112;
        long long v24 = v12;
        __int16 v25 = 2112;
        long long v26 = v13;
        uint64_t v14 = "%{public}@Account handle, %@, now registered to account: %@";
        goto LABEL_12;
      }
LABEL_13:

      [*(id *)(a1 + 32) removeHandle:*(void *)(a1 + 40)];
      goto LABEL_14;
    }
    if (*(void *)(a1 + 48))
    {
      __int16 v15 = (void *)MEMORY[0x1D9452090]();
      id v16 = WeakRetained;
      uint64_t v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = HMFGetLogIdentifier();
        id v19 = *(void **)(a1 + 48);
        int v21 = 138543618;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        long long v24 = v19;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Removing unregistered device: %@", (uint8_t *)&v21, 0x16u);
      }
      [*(id *)(a1 + 32) removeDevice:*(void *)(a1 + 48)];
    }
  }
LABEL_14:
}

void sub_1D50D7AB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50D7B6C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50D7C1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50D7CE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50D8658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__123512(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__123513(uint64_t a1)
{
}

void sub_1D50D8E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  objc_destroyWeak((id *)(v22 - 72));
  _Unwind_Resume(a1);
}

void sub_1D50D9C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50D9EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50DA0CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D50DAED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50DC7BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location,id a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  objc_destroyWeak(v69);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_1D50E01DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50E10B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_1D50E1314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D50E414C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __documentationMaxSize_block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F65530];
  id v1 = [NSNumber numberWithUnsignedInteger:0x200000];
  [v0 setDefaultValue:v1 forPreferenceKey:@"firmwareUpdateDocumentationMaxSize"];
}

void sub_1D50E5804(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D50E5A50(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D50E63DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1D50E6510(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D50E692C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D50E6F18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D50E8A48(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t minimumApplyDurationAllowance()
{
  id v0 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v1 = [v0 preferenceForKey:@"firmwareUpdateMinimumApplyDurationAllowance"];
  id v2 = [v1 numberValue];
  uint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

void sub_1D50E8E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D50E8F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D50EB6D4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void __maxSocketIdleDuration_block_invoke()
{
  id v0 = (void *)MEMORY[0x1E4F65530];
  id v1 = [NSNumber numberWithUnsignedInteger:60];
  [v0 setDefaultValue:v1 forPreferenceKey:@"firmwareUpdateMaxSocketIdleDuration"];
}

void sub_1D50ED508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1D50F1228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50F14E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50F4A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50F54EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__125136(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__125137(uint64_t a1)
{
}

void sub_1D50F5ED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D50F6EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D50F749C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HMDHomeKitVersion *HMDMinimumHomeKitVersionSupportingHH2()
{
  int v0 = isInternalBuild();
  id v1 = [HMDHomeKitVersion alloc];
  if (v0) {
    id v2 = @"10.3";
  }
  else {
    id v2 = @"10.4";
  }
  uint64_t v3 = [(HMDHomeKitVersion *)v1 initWithVersionString:v2];
  return v3;
}

void sub_1D50FA560(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D50FB160(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50FB528(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50FB73C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D50FBF84(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D50FEC50(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D50FF5BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5101800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5102468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D510256C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D51028E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_1D5102BA4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D510362C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51037EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D5103E90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D510430C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5104EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5105820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5105C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5105D2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51061F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1D51064E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5108310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak((id *)&a9);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5108664(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5109BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__126343(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__126344(uint64_t a1)
{
}

void sub_1D510BABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D510D20C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D510D2CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D510EB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D510F3DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D510F8EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

__CFString *HMDNetworkRouterSupportAsString(unint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v3 = v2;
  unint64_t v4 = a1;
  if (a1)
  {
    [v2 addObject:@"Home Protection Mode Update"];
    unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFFELL;
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"Accessory Protection Mode Update"];
  v4 &= ~2uLL;
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  [v3 addObject:@"Add Network Router"];
  v4 &= ~4uLL;
  if ((a1 & 8) != 0)
  {
LABEL_5:
    [v3 addObject:@"WiFi Unique PreShared Key"];
    v4 &= ~8uLL;
  }
LABEL_6:
  if ([v3 count])
  {
    id v5 = [v3 componentsJoinedByString:@","];
  }
  else
  {
    id v6 = @"Unknown";
    if (!v4) {
      id v6 = @"Disabled";
    }
    id v5 = v6;
  }
  id v7 = v5;

  return v7;
}

void sub_1D5114644(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51146C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5114970(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5115ED0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1D5116E3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

HMDNetworkRouterAccessViolationControl *accessViolationControlWithType(uint64_t a1)
{
  uint64_t v1 = [[HMDNetworkRouterAccessViolationControlOperation alloc] initWithOperation:a1];
  uint64_t v2 = [[HMDNetworkRouterAccessViolationControl alloc] initWithOperation:v1 clientIdentifierList:0];

  return v2;
}

HMDNetworkRouterClientControl *clientControlWithOperationType(uint64_t a1)
{
  uint64_t v1 = [[HMDNetworkRouterControlOperation alloc] initWithOperation:a1];
  uint64_t v2 = objc_alloc_init(HMDNetworkRouterClientConfiguration);
  uint64_t v3 = [[HMDNetworkRouterClientControlOperation alloc] initWithOperation:v1 configuration:v2];

  unint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:v3];
  id v5 = [[HMDNetworkRouterClientControl alloc] initWithOperations:v4];

  return v5;
}

void sub_1D5128EE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__128651(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__128652(uint64_t a1)
{
}

uint64_t HMDRemoteEventRouterProtoFetchEventsMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  unint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 3)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            goto LABEL_33;
          }
          v18 += 7;
          BOOL v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_35:
        *(_DWORD *)(a1 + 8) = v20;
      }
      else if ((v10 >> 3) == 2)
      {
        uint64_t v17 = objc_alloc_init(HMDRemoteEventRouterProtoTopic);
        [(id)a1 addTopics:v17];
        if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoTopicReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D5133594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__129513(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__129514(uint64_t a1)
{
}

uint64_t isRecordingAllowedForSettings(void *a1)
{
  id v1 = a1;
  [v1 accessModeAtHome];
  if (HMIsRecordingAllowedForCameraAccessMode())
  {
    uint64_t v2 = 1;
  }
  else
  {
    [v1 accessModeNotAtHome];
    uint64_t v2 = HMIsRecordingAllowedForCameraAccessMode();
  }

  return v2;
}

void sub_1D51396F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5139780(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D513BD88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D513C938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __destinationForAccountHandle(uint64_t a1, void *a2)
{
  unint64_t v4 = 0;
  if (a1 && a2)
  {
    unint64_t v4 = [a2 remoteDestinationString];
    uint64_t v2 = vars8;
  }
  return v4;
}

__CFString *HMDUserConfirmationResponseAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDUserConfirmationResponse %tu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6A113F0[a1 - 1];
  }
  return v1;
}

void sub_1D514281C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5143258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id actionSetFromObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"objectReference"];
  uint64_t v3 = objc_msgSend(v1, "hmf_stringForKey:", @"objectType");

  if ([v3 isEqualToString:@"SCENE"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v2;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id valueWithAssistantUnits(void *a1, void *a2, void *a3, void *a4, unsigned int a5, int a6)
{
  id v49 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  long long v51 = +[HMDHAPMetadata getSharedInstance];
  id v13 = v12;
  id v14 = v10;
  id v15 = v11;
  id v16 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v17 = [v16 characteristicValueUnit:v15];

  if (v17) {
    char v18 = v17;
  }
  else {
    char v18 = v13;
  }
  id v19 = v18;
  char v20 = [v16 supportsLocalization:v14];

  if (v20)
  {
    int v21 = a6;
    id v22 = v17;
    char v23 = (void *)*MEMORY[0x1E4F2CE30];
    char v24 = [v22 isEqualToString:*MEMORY[0x1E4F2CE30]];
    __int16 v25 = (void *)*MEMORY[0x1E4F2CE38];
    if ((v24 & 1) != 0 || (int v26 = [v22 isEqualToString:*MEMORY[0x1E4F2CE38]], v27 = v22, v26))
    {
      if (v21) {
        uint64_t v27 = v23;
      }
      else {
        uint64_t v27 = v25;
      }
    }
    id v28 = v27;

    if (!v13 || (v29 = [v13 isEqualToString:v28], long long v30 = v13, v29)) {
      long long v30 = v28;
    }
    id v31 = v30;

    id v19 = v31;
  }
  else
  {
    char v23 = (void *)*MEMORY[0x1E4F2CE30];
    __int16 v25 = (void *)*MEMORY[0x1E4F2CE38];
  }

  id v32 = [v51 characteristicValueUnit:v15];

  id v33 = v49;
  id v34 = v32;
  id v35 = v19;
  id v36 = v33;
  if ([v34 isEqualToString:v23])
  {
    int v37 = v36;
    if (![v35 isEqualToString:v25]) {
      goto LABEL_22;
    }
    [v36 floatValue];
    uint64_t v38 = NSNumber;
    *(float *)&double v39 = (float)(*(float *)&v39 * 1.8) + 32.0;
    goto LABEL_21;
  }
  int v37 = v36;
  if ([v34 isEqualToString:v25])
  {
    int v37 = v36;
    if ([v35 isEqualToString:v23])
    {
      [v36 floatValue];
      uint64_t v38 = NSNumber;
      *(float *)&double v39 = (float)((float)(*(float *)&v39 + -32.0) * 5.0) / 9.0;
LABEL_21:
      int v37 = [v38 numberWithFloat:v39];
    }
  }
LABEL_22:

  uint64_t v40 = [v51 mapToAssistantCharacteristicValue:v37 name:v14 getActionType:a5];

  id v41 = [v51 mapToAssistantUnitName:v35];
  id v42 = [v51 mapCharacteristicValueType:v14];

  id v43 = v40;
  id v44 = v42;
  id v45 = v41;
  if ([v44 isEqualToString:*MEMORY[0x1E4F2CDF0]])
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F96678]);
    objc_msgSend(v46, "setValue:", objc_msgSend(v43, "BOOLValue"));
  }
  else if (([v44 isEqualToString:*MEMORY[0x1E4F2CE00]] & 1) != 0 {
         || ([v44 isEqualToString:*MEMORY[0x1E4F2CE28]] & 1) != 0
  }
         || ([v44 isEqualToString:*MEMORY[0x1E4F2CE10]] & 1) != 0
         || ([v44 isEqualToString:*MEMORY[0x1E4F2CE18]] & 1) != 0
         || [v44 isEqualToString:*MEMORY[0x1E4F2CE20]])
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F966A8]);
    objc_msgSend(v46, "setValue:", objc_msgSend(v43, "integerValue"));
  }
  else if ([v44 isEqualToString:*MEMORY[0x1E4F2CDF8]])
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F96698]);
    [v43 floatValue];
    objc_msgSend(v46, "setValue:");
  }
  else if ([v44 isEqualToString:*MEMORY[0x1E4F2CE08]])
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F966C0]);
    id v48 = (void *)[v43 copy];
    [v46 setValue:v48];
  }
  else
  {
    id v46 = 0;
  }
  [v46 setUnits:v45];

  return v46;
}

HMDAssistantCharacteristicTuple *getTupleForCharacteristic(void *a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = +[HMDHAPMetadata getSharedInstance];
  char v8 = [v6 characteristicType];

  unsigned int v9 = [v7 mapToAssistantCharacteristicName:v8];
  uint64_t v10 = [v7 mapCharacteristicValueType:v9];
  id v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    id v14 = 0;
  }
  else
  {
    id v13 = valueWithAssistantUnits(0, v8, v9, v5, 1u, a3);
    id v14 = [[HMDAssistantCharacteristicTuple alloc] initWithAttribute:v9 value:v13];
  }
  return v14;
}

void __isMetricLocale_block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  int v0 = [v1 objectForKey:*MEMORY[0x1E4F1C490]];
  isMetricLocale_isMetricLocale = [v0 BOOLValue];
}

uint64_t applyGuardTime()
{
  if (applyGuardTime_onceToken != -1) {
    dispatch_once(&applyGuardTime_onceToken, &__block_literal_global_77_131543);
  }
  int v0 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v1 = [v0 preferenceForKey:@"firmwareUpdateApplyGuardTime"];
  uint64_t v2 = [v1 numberValue];

  uint64_t v3 = [v2 unsignedIntValue];
  return v3;
}

uint64_t __applyGuardTime_block_invoke()
{
  return [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC8DB8 forPreferenceKey:@"firmwareUpdateApplyGuardTime"];
}

void sub_1D5147844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5147ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__131907(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__131908(uint64_t a1)
{
}

void sub_1D51484E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D5148EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5149990(_Unwind_Exception *a1)
{
}

void sub_1D5149AC4(_Unwind_Exception *a1)
{
}

void sub_1D5149B5C(_Unwind_Exception *a1)
{
}

void sub_1D514A1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18, id a19)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1D5153C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__133274(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__133275(uint64_t a1)
{
}

void sub_1D5153FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D515426C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

id __descriptionsForRecordIDArray(void *a1)
{
  id v1 = objc_msgSend(a1, "na_map:", &__block_literal_global_436_133289);
  uint64_t v2 = (void *)[v1 copy];

  return v2;
}

uint64_t ____descriptionsForRecordIDArray_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbDescription];
}

void sub_1D51546D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D5154AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id __descriptionsForRecordIDSet(void *a1)
{
  id v1 = objc_msgSend(a1, "na_map:", &__block_literal_global_434_133300);
  uint64_t v2 = (void *)[v1 copy];

  return v2;
}

uint64_t ____descriptionsForRecordIDSet_block_invoke(uint64_t a1, void *a2)
{
  return [a2 hmbDescription];
}

void sub_1D5154F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D5155434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D51558E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D5157194(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5157924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5157C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51584D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51589A0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5158AE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5158BD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D515F760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D515FB00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D516045C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5160A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5161CB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5162C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__134147(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__134148(uint64_t a1)
{
}

void sub_1D5163020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5163338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5163510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5163D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5164FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D516569C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5166680(_Unwind_Exception *a1)
{
}

void sub_1D5166888(_Unwind_Exception *a1)
{
}

void sub_1D516A528(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D516AC8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D516B5F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D516C8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D516CA90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D516D184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock)
{
}

uint64_t HMDRemoteEventRouterProtoConnectMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  id v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 2u:
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 48) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_40;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_42;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_40:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_42:
        *(_DWORD *)(a1 + 16) = v19;
        goto LABEL_43;
      case 3u:
        char v24 = (HMDRemoteEventRouterProtoTopic *)objc_alloc_init(MEMORY[0x1E4F69F80]);
        uint64_t v25 = 8;
        goto LABEL_30;
      case 4u:
        char v24 = (HMDRemoteEventRouterProtoTopic *)objc_alloc_init(MEMORY[0x1E4F69F80]);
        uint64_t v25 = 40;
LABEL_30:
        objc_storeStrong((id *)(a1 + v25), v24);
        if (!PBReaderPlaceMark() || (HMEProtoEventInfoReadFrom() & 1) == 0) {
          goto LABEL_45;
        }
        goto LABEL_37;
      case 5u:
        PBReaderReadString();
        char v24 = (HMDRemoteEventRouterProtoTopic *)objc_claimAutoreleasedReturnValue();
        if (v24) {
          [(id)a1 addTopicFilterAdditions:v24];
        }
        goto LABEL_38;
      case 6u:
        char v24 = objc_alloc_init(HMDRemoteEventRouterProtoTopic);
        [(id)a1 addTopicAdditions:v24];
        if (PBReaderPlaceMark() && HMDRemoteEventRouterProtoTopicReadFrom((uint64_t)v24, a2))
        {
LABEL_37:
          PBReaderRecallMark();
LABEL_38:

LABEL_43:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_45:

        return 0;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_43;
    }
  }
}

__CFString *HMDCameraRecordingVideoCodecTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HMDCameraRecordingVideoCodecTypeH265";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingVideoCodecType %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HMDCameraRecordingVideoCodecTypeH264";
  }
  return v2;
}

__CFString *HMDCameraRecordingH264ProfileTypeAsString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingH264ProfileType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A11B80[a1];
  }
  return v1;
}

__CFString *HMDCameraRecordingH264LevelTypeAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingH264LevelType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A11B98[a1];
  }
  return v1;
}

void translateResolutionWidthHeight(void *a1, void *a2, uint64_t *a3)
{
  id v7 = a1;
  id v5 = a2;
  if ([v7 isEqualToNumber:&unk_1F2DC8E48]
    && ([v5 isEqualToNumber:&unk_1F2DC8E60] & 1) != 0)
  {
    uint64_t v6 = 1;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8E78] {
         && ([v5 isEqualToNumber:&unk_1F2DC8E90] & 1) != 0)
  }
  {
    uint64_t v6 = 2;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8EA8] {
         && ([v5 isEqualToNumber:&unk_1F2DC8EC0] & 1) != 0)
  }
  {
    uint64_t v6 = 3;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8ED8] {
         && ([v5 isEqualToNumber:&unk_1F2DC8EF0] & 1) != 0)
  }
  {
    uint64_t v6 = 4;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8E48] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F08] & 1) != 0)
  }
  {
    uint64_t v6 = 5;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8EA8] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F20] & 1) != 0)
  }
  {
    uint64_t v6 = 6;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F38] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F50] & 1) != 0)
  }
  {
    uint64_t v6 = 7;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F68] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F80] & 1) != 0)
  }
  {
    uint64_t v6 = 8;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F20] {
         && ([v5 isEqualToNumber:&unk_1F2DC8EA8] & 1) != 0)
  }
  {
    uint64_t v6 = 9;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F50] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F38] & 1) != 0)
  }
  {
    uint64_t v6 = 10;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F98] {
         && ([v5 isEqualToNumber:&unk_1F2DC8FB0] & 1) != 0)
  }
  {
    uint64_t v6 = 11;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8FC8] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F50] & 1) != 0)
  }
  {
    uint64_t v6 = 12;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8FB0] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F98] & 1) != 0)
  }
  {
    uint64_t v6 = 13;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F50] {
         && ([v5 isEqualToNumber:&unk_1F2DC8FC8] & 1) != 0)
  }
  {
    uint64_t v6 = 14;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8EC0] {
         && ([v5 isEqualToNumber:&unk_1F2DC8EA8] & 1) != 0)
  }
  {
    uint64_t v6 = 15;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8E90] {
         && ([v5 isEqualToNumber:&unk_1F2DC8E78] & 1) != 0)
  }
  {
    uint64_t v6 = 16;
  }
  else if ([v7 isEqualToNumber:&unk_1F2DC8F80] {
         && ([v5 isEqualToNumber:&unk_1F2DC8F68] & 1) != 0)
  }
  {
    uint64_t v6 = 17;
  }
  else
  {
    uint64_t v6 = 0;
  }
  *a3 = v6;
}

void sub_1D517436C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5174E60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51750D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51751D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id logDescriptionForAccessory(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint64_t v3 = v1;
    }
    else {
      uint64_t v3 = 0;
    }
    id v4 = v3;
    if (isKindOfClass) {
      [v1 needsAirplayAccess];
    }
    uint64_t v6 = NSString;
    id v7 = [v1 name];
    char v8 = [v1 uuid];
    unsigned int v9 = [v1 identifier];
    unint64_t v10 = HMFBooleanToString();
    uint64_t v11 = HMFBooleanToString();
    id v5 = [v6 stringWithFormat:@"'%@' (%@ / %@, HAP=%@, Airplay=%@)", v7, v8, v9, v10, v11];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_1D5177464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 152));
  _Unwind_Resume(a1);
}

void sub_1D51777A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5177A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void ContinueRouterOperationOnWorkQueue(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    uint64_t v11 = [v7 workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __ContinueRouterOperationOnWorkQueue_block_invoke;
    v13[3] = &unk_1E6A12148;
    id v14 = v7;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, v13);
  }
  else
  {
    unint64_t v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
}

void __ContinueRouterOperationOnWorkQueue_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) networkRouterAccessory];
  uint64_t v3 = [v2 uuid];
  char v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4)
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v5();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] hmErrorWithCode:23];
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void sub_1D5178824(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

uint64_t credentialTypeForCredential(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 psk];

  if (v2)
  {
    uint64_t v3 = 3;
  }
  else
  {
    char v4 = [v1 macAddress];
    BOOL v5 = v4 != 0;

    uint64_t v3 = 2 * v5;
  }

  return v3;
}

uint64_t getProtectionModeForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 home];
  uint64_t v3 = [v2 protectionMode];

  if (v3 && [v1 supportsNetworkProtection]) {
    uint64_t v4 = [v1 targetNetworkProtectionMode];
  }
  else {
    uint64_t v4 = 3;
  }

  return v4;
}

BOOL shouldManageAccessory(void *a1)
{
  id v1 = a1;
  if ([v1 supportsNetworkProtection])
  {
    BOOL v2 = 1;
  }
  else
  {
    uint64_t v3 = [v1 wiFiUniquePreSharedKey];
    if (v3)
    {
      BOOL v2 = 1;
    }
    else
    {
      uint64_t v4 = [v1 networkClientIdentifier];
      BOOL v2 = v4 != 0;
    }
  }

  return v2;
}

void sub_1D5179590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D517978C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5179CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D517A0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HMDNetworkRouterCredential *networkRouterCredentialForAccessory(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = objc_alloc_init(HMDNetworkRouterCredential);
  uint64_t v6 = [v3 wiFiUniquePreSharedKey];

  if (v6)
  {
    id v7 = [v3 wiFiUniquePreSharedKey];
    [(HMDNetworkRouterCredential *)v5 setPsk:v7];
  }
  else
  {
    [(HMDNetworkRouterCredential *)v5 setMacAddress:v4];
  }

  return v5;
}

void sub_1D517ACB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D517CE18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D517DD38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HMDCreateUniquePSKClientConfiguration_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __HMDCreateUniquePSKClientConfiguration_block_invoke_2;
    v6[3] = &unk_1E6A11D88;
    id v9 = *(id *)(a1 + 64);
    id v7 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    [v4 addClientConfiguration:v5 completion:v6];
  }
}

void __HMDCreateUniquePSKClientConfiguration_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v5 = [HMDAccessoryNetworkCredential alloc];
    uint64_t v6 = [*(id *)(a1 + 32) uuid];
    id v7 = [(HMDAccessoryNetworkCredential *)v5 initWithNetworkRouterUUID:v6 clientIdentifier:v8 wiFiPSK:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1D5180F94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D5181428(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__136449(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__136450(uint64_t a1)
{
}

void sub_1D518B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D518C1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5196B3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5196F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
}

void sub_1D5199868(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D519AE48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D519B524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__140367(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__140368(uint64_t a1)
{
}

void sub_1D519CDC8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D519CEA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D519D2FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 144));
  _Unwind_Resume(a1);
}

void sub_1D519D444(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D519D564(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D519D694(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D519D800(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D519D8F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D519E1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D519E654(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D519EAB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __rootSettingUUIDInSettingModels(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "hmbParentModelID", (void)v13);
        int v11 = [v10 isEqual:v4];

        if (v11)
        {
          uint64_t v6 = [v9 hmbModelID];
          goto LABEL_11;
        }
      }
      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

void sub_1D51B0BD0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDUserDataControllerStateAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    uint64_t v2 = NSString;
    id v3 = [NSNumber numberWithUnsignedInteger:a1];
    uint64_t v1 = [v2 stringWithFormat:@"Unknown state %@", v3];
  }
  else
  {
    uint64_t v1 = off_1E6A12848[a1];
  }
  return v1;
}

void sub_1D51C7784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51C88A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__143244(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__143245(uint64_t a1)
{
}

void sub_1D51CA824(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51CA90C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51CA994(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51CAA1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t isIrrecoverableError(void *a1)
{
  id v1 = a1;
  if ([v1 isHMError]
    && ([v1 code] == 90
     || [v1 code] == 79
     || [v1 code] == 52
     || [v1 code] == 96
     || [v1 code] == 13
     || [v1 code] == 11
     || [v1 code] == 55))
  {
    goto LABEL_30;
  }
  if (![v1 isHAPError]) {
    goto LABEL_40;
  }
  if ([v1 code] != 20
    && [v1 code] != 21
    && [v1 code] != 22
    && [v1 code] != 23
    && [v1 code] != 26
    && [v1 code] != 25
    && [v1 code] != 34
    && [v1 code] != 9
    && [v1 code] != 12
    && [v1 code] != 10
    && [v1 code] != 11
    && [v1 code] != 18
    && [v1 code] != 7
    && [v1 code] != 3
    && [v1 code] != 15
    && [v1 code] != 17
    && [v1 code] != 16
    && [v1 code] != 35
    && [v1 code] != 36
    && [v1 code] != 30)
  {
    if ([v1 code] == 13
      || [v1 code] == 14
      || [v1 code] == 2
      || [v1 code] == 1)
    {
      id v3 = [v1 userInfo];
      id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      objc_opt_class();
      id v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
      id v6 = v5;

      if (v6)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
        id v8 = [v6 domain];
        id v9 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, objc_msgSend(v6, "code"), 0);
        uint64_t v2 = isIrrecoverableError();

LABEL_41:
        goto LABEL_42;
      }
    }
LABEL_40:
    id v6 = [v1 domain];
    uint64_t v2 = [v6 isEqualToString:*MEMORY[0x1E4F31168]];
    goto LABEL_41;
  }
LABEL_30:
  uint64_t v2 = 1;
LABEL_42:

  return v2;
}

id _normalizeSetupCode(void *a1)
{
  id v1 = a1;
  if ([MEMORY[0x1E4F5BDF8] isValidSetupCode:v1] || objc_msgSend(v1, "length") != 8)
  {
    id v3 = v1;
  }
  else
  {
    uint64_t v2 = (void *)[v1 mutableCopy];
    [v2 insertString:@"-" atIndex:3];
    [v2 insertString:@"-" atIndex:6];
    id v3 = (id)[v2 copy];
  }
  return v3;
}

void sub_1D51D46B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id a43)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak(&a43);
  _Block_object_dispose((const void *)(v43 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D51D6C08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51D86D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D51DA030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D51DAC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
}

void sub_1D51DC0E0(_Unwind_Exception *a1)
{
}

void sub_1D51DE4DC(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__144943(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__144944(uint64_t a1)
{
}

void sub_1D51E0310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D51E2748(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E2CEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E3868(_Unwind_Exception *a1)
{
}

void sub_1D51E4174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D51E436C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E4F30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E4FAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E5EBC(_Unwind_Exception *a1)
{
}

void sub_1D51E667C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E67CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E6D48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E6EB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E7018(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E715C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51E7750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D51E7A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_unfair_lock_t lock)
{
}

void sub_1D51EA2EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51EB72C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51EB940(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51EBF20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D51EBFA4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51EC034(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id observerMatchingConnection(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a2;
  id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "observedObject", (void)v12);
        char v10 = HMFEqualObjects();

        if (v10)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void sub_1D51EC7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25,id a26)
{
}

void sub_1D51ECCF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51ECDE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51ECE5C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51ED810(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51ED890(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51EDD30(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51EFFF8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F0188(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D51F0348(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F03E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F4198(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F424C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F4508(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F4690(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F4720(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F47C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F487C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F4A04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D51F4A94(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5201A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

uint64_t __Block_byref_object_copy__146360(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__146361(uint64_t a1)
{
}

void sub_1D5206D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52075F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1D520C2BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id createHMFNetAddressFromIPAddressString(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 UTF8String];
  if (v2) {
    id v3 = (const char *)v2;
  }
  else {
    id v3 = "";
  }
  *(_OWORD *)char v10 = xmmword_1D54D3760;
  if (inet_pton(2, v3, &v10[4]) == 1
    || (*(_OWORD *)char v10 = xmmword_1D54D40C8,
        *(_OWORD *)&v10[12] = *(long long *)((char *)&xmmword_1D54D40C8 + 12),
        inet_pton(30, v3, &v10[8]) == 1))
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F654B8]) initWithSocketAddress:v10];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      *(_DWORD *)char v10 = 138543618;
      *(void *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2112;
      *(void *)&v10[14] = v1;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@'%@' is not a valid IPv4 or IPv6 address string", v10, 0x16u);
    }
    id v4 = 0;
  }

  return v4;
}

uint64_t __validateHostNameForWANFirewallRule_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^(?=[^*]*(?:\\*(?:[^*]+|$)){0,2}$)[a-zA-Z0-9*](?:[a-zA-Z0-9*-]*[a-zA-Z0-9*])?$" options:0 error:0];
  uint64_t v1 = validateHostNameForWANFirewallRule_componentRegex;
  validateHostNameForWANFirewallRule_componentRegex = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t decodeStringFromJSONDictionary(void *a1, void *a2, int a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v22 = 0;
  int v9 = decodeValueFromJSONDictionary(v7, v8, a3, &v22);
  id v10 = v22;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10)
    {
      id v12 = v10;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        long long v14 = v12;
      }
      else {
        long long v14 = 0;
      }
      id v15 = v14;

      if ((isKindOfClass & 1) != 0 && [v12 length])
      {
        *a4 = v12;
        uint64_t v16 = 1;
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1D9452090]();
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543874;
          char v24 = v20;
          __int16 v25 = 2112;
          id v26 = v8;
          __int16 v27 = 2112;
          id v28 = v7;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", buf, 0x20u);
        }
        uint64_t v16 = 0;
      }
    }
    else
    {
      *a4 = 0;
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t decodeValueFromJSONDictionary(void *a1, void *a2, int a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  int v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = v9;
  if (v9)
  {
    *a4 = v9;
LABEL_8:
    uint64_t v15 = 1;
    goto LABEL_9;
  }
  if (!a3)
  {
    *a4 = 0;
    goto LABEL_8;
  }
  uint64_t v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = objc_opt_class();
  long long v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    long long v14 = HMFGetLogIdentifier();
    int v17 = 138543874;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v7;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@JSON contains no '%@' value: %@", (uint8_t *)&v17, 0x20u);
  }
  uint64_t v15 = 0;
LABEL_9:

  return v15;
}

uint64_t decodeUnsignedIntegerFromJSONDictionary(void *a1, void *a2, int a3, unint64_t a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v25 = 0;
  int v11 = decodeValueFromJSONDictionary(v9, v10, a3, &v25);
  id v12 = v25;
  long long v13 = v12;
  if (v11)
  {
    if (v12)
    {
      id v14 = v12;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        uint64_t v16 = v14;
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = v16;

      if ((isKindOfClass & 1) != 0
        && [v14 unsignedLongLongValue] <= a4
        && (CFTypeID v18 = CFGetTypeID(v14), v18 != CFBooleanGetTypeID()))
      {
        *a5 = v14;
        uint64_t v23 = 1;
      }
      else
      {
        __int16 v19 = (void *)MEMORY[0x1D9452090]();
        id v20 = objc_opt_class();
        __int16 v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          id v22 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543874;
          __int16 v27 = v22;
          __int16 v28 = 2112;
          id v29 = v10;
          __int16 v30 = 2112;
          id v31 = v9;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", buf, 0x20u);
        }
        uint64_t v23 = 0;
      }
    }
    else
    {
      *a5 = 0;
      uint64_t v23 = 1;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  return v23;
}

uint64_t decodeAddressFromJSONDictionary(void *a1, void *a2, int a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v19 = 0;
  int v9 = decodeStringFromJSONDictionary(v7, v8, a3, &v19);
  id v10 = v19;
  int v11 = v10;
  if (v9)
  {
    if (v10)
    {
      createHMFNetAddressFromIPAddressString(v10);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = v12;
      if (!v12)
      {
        long long v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = objc_opt_class();
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543874;
          __int16 v21 = v16;
          __int16 v22 = 2112;
          id v23 = v8;
          __int16 v24 = 2112;
          id v25 = v7;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' address: %@", buf, 0x20u);
        }
        goto LABEL_7;
      }
    }
    else
    {
      *a4 = 0;
    }
    uint64_t v17 = 1;
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v17 = 0;
LABEL_10:

  return v17;
}

uint64_t decodeTimeFromJSONDictionary(void *a1, void *a2, void *a3)
{
  id v8 = 0;
  uint64_t v4 = decodeUnsignedIntegerFromJSONDictionary(a1, a2, 1, 0xFFFFFFFFuLL, &v8);
  id v5 = v8;
  uint64_t v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v5, "unsignedLongValue"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t decodePortFromJSONDictionary(void *a1, void *a2, int a3, _WORD *a4, BOOL *a5)
{
  id v12 = 0;
  uint64_t v7 = decodeUnsignedIntegerFromJSONDictionary(a1, a2, a3, 0xFFFFuLL, &v12);
  id v8 = v12;
  int v9 = v8;
  if (v7)
  {
    if (a5) {
      *a5 = v8 != 0;
    }
    if (v8) {
      __int16 v10 = [v8 unsignedShortValue];
    }
    else {
      __int16 v10 = 0;
    }
    *a4 = v10;
  }

  return v7;
}

void sub_1D520E6D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_1D520E7B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D520F198(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D520F58C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D521099C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    long long v13 = (void *)MEMORY[0x1D9452090]();
    HMFGetOSLogHandle();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v15;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v12;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@### decode eventValue resulted in exception: %@", (uint8_t *)&buf, 0x16u);
    }
    uint64_t v16 = *(void **)(v11 + 128);
    *(void *)(v11 + 128) = 0;

    objc_end_catch();
    JUMPOUT(0x1D5210960);
  }
  _Unwind_Resume(a1);
}

id serviceTypeUUIDsForAccessory(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 services];
  if ([v1 count])
  {
    uint64_t v2 = +[HMDHAPMetadata getSharedInstance];
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v1, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          __int16 v10 = objc_msgSend(v9, "type", (void)v14);
          if (([v2 shouldFilterServiceOfType:v10] & 1) == 0)
          {
            uint64_t v11 = [v9 type];
            [v3 addObject:v11];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    id v12 = (void *)[v3 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void sub_1D521BA98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, id location)
{
  objc_destroyWeak(v16);
  __HMFActivityScopeLeave();
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52205D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x3A0]);
  _Unwind_Resume(a1);
}

__CFString *changeTypeAsNSString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<UNKNOWN %lu>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A13810[a1];
  }
  return v1;
}

void __sort(void *a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ((unint64_t)[v1 count] >= 2)
  {
    uint64_t v2 = (void *)[v1 mutableCopy];
    id v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v1, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v36 = v1;
    id v4 = v1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v53 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "change", v36);
          __int16 v10 = [v9 uuid];
          [v3 addObject:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v6);
    }

    uint64_t v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v12 = [v2 count];
    uint64_t v13 = 0;
    uint64_t v37 = v12 & ~(v12 >> 63);
    id v38 = v4;
    id v41 = v2;
    while (objc_msgSend(v2, "count", v36))
    {
      uint64_t v39 = v13;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = (id)[v2 copy];
      uint64_t v14 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v43 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v49 != v43) {
              objc_enumerationMutation(obj);
            }
            long long v17 = *(void **)(*((void *)&v48 + 1) + 8 * j);
            CFTypeID v18 = [MEMORY[0x1E4F1CA80] set];
            uint64_t v19 = [v17 change];
            id v20 = [v19 parentUUID];

            if (v20)
            {
              __int16 v21 = [v17 change];
              __int16 v22 = [v21 parentUUID];
              [v18 addObject:v22];
            }
            id v23 = [v17 dependentUUIDs];
            __int16 v24 = [v23 allObjects];
            [v18 addObjectsFromArray:v24];

            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v25 = v18;
            uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v60 count:16];
            if (v26)
            {
              uint64_t v27 = v26;
              uint64_t v28 = *(void *)v45;
              while (2)
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v45 != v28) {
                    objc_enumerationMutation(v25);
                  }
                  uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8 * k);
                  if ([v3 containsObject:v30]
                    && ![v11 containsObject:v30])
                  {

                    goto LABEL_29;
                  }
                }
                uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v60 count:16];
                if (v27) {
                  continue;
                }
                break;
              }
            }

            [v40 addObject:v17];
            id v31 = [v17 change];
            uint64_t v32 = [v31 uuid];
            [v11 addObject:v32];

            [v41 removeObject:v17];
LABEL_29:
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
        }
        while (v15);
      }

      id v4 = v38;
      uint64_t v13 = v39 + 1;
      uint64_t v2 = v41;
      if (v39 == v37)
      {
        id v33 = (void *)MEMORY[0x1D9452090]();
        id v34 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          id v35 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543618;
          id v57 = v35;
          __int16 v58 = 2112;
          id v59 = v41;
          _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Possible circular dependency in %@, trying to continue", buf, 0x16u);
        }
        [v40 addObjectsFromArray:v41];
        [v41 removeAllObjects];
        break;
      }
    }
    [v4 setArray:v40];

    id v1 = v36;
  }
}

void sub_1D5224B20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __identifierForParentUUID(void *a1)
{
  uint64_t v1 = __identifierForParentUUID_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&__identifierForParentUUID_onceToken, &__block_literal_global_1182);
  }
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v4 = __identifierForParentUUID_namespace;
  uint64_t v5 = [v2 UUIDString];

  uint64_t v6 = [v5 dataUsingEncoding:4];
  uint64_t v7 = (void *)[v3 initWithNamespace:v4 data:v6];

  return v7;
}

uint64_t ____identifierForParentUUID_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"497A934F-F7DC-4596-BA43-9B1BBA077D55"];
  uint64_t v1 = __identifierForParentUUID_namespace;
  __identifierForParentUUID_namespace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_1D5225E70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __HMDDeviceCapabilitiesModelCodingKeyMapping()
{
  v62[59] = *MEMORY[0x1E4F143B8];
  v61[0] = @"HM.keychainSync";
  id v60 = NSStringFromSelector(sel_supportsKeychainSync);
  v62[0] = v60;
  v61[1] = @"HM.deviceSetup";
  id v59 = NSStringFromSelector(sel_supportsDeviceSetup);
  v62[1] = v59;
  v61[2] = @"HM.keyTransferClient";
  __int16 v58 = NSStringFromSelector(sel_supportsKeyTransferClient);
  v62[2] = v58;
  void v61[3] = @"HM.keyTransferServer";
  id v57 = NSStringFromSelector(sel_supportsKeyTransferServer);
  void v62[3] = v57;
  void v61[4] = @"HM.standalone";
  long long v56 = NSStringFromSelector(sel_supportsStandaloneMode);
  v62[4] = v56;
  v61[5] = @"HM.cloudDataSync";
  long long v55 = NSStringFromSelector(sel_supportsCloudDataSync);
  v62[5] = v55;
  v61[6] = @"HM.WHA";
  long long v54 = NSStringFromSelector(sel_supportsWholeHouseAudio);
  v62[6] = v54;
  v61[7] = @"HM.assistantAC";
  long long v53 = NSStringFromSelector(sel_supportsAssistantAccessControl);
  v62[7] = v53;
  v61[8] = @"HM.resident";
  long long v52 = NSStringFromSelector(sel_residentCapable);
  v62[8] = v52;
  v61[9] = @"HM.remoteGateway";
  long long v51 = NSStringFromSelector(sel_remoteGatewayCapable);
  v62[9] = v51;
  v61[10] = @"HM.homeInvitation";
  long long v50 = NSStringFromSelector(sel_supportsHomeInvitation);
  v62[10] = v50;
  v61[11] = @"HM.targetControl";
  long long v49 = NSStringFromSelector(sel_supportsTargetControl);
  v62[11] = v49;
  v61[12] = @"HM.multiUser";
  long long v48 = NSStringFromSelector(sel_supportsMultiUser);
  v62[12] = v48;
  v61[13] = @"HM.homeLevelLocationServiceSetting";
  long long v47 = NSStringFromSelector(sel_supportsHomeLevelLocationServiceSetting);
  v62[13] = v47;
  v61[14] = @"HM.restart";
  long long v46 = NSStringFromSelector(sel_supportsCompanionInitiatedRestart);
  v62[14] = v46;
  v61[15] = @"HM.obliterate";
  long long v45 = NSStringFromSelector(sel_supportsCompanionInitiatedObliterate);
  v62[15] = v45;
  v61[16] = @"HM.camRec";
  long long v44 = NSStringFromSelector(sel_supportsCameraRecording);
  v62[16] = v44;
  v61[17] = @"HM.routerManagement";
  uint64_t v43 = NSStringFromSelector(sel_supportsRouterManagement);
  v62[17] = v43;
  v61[18] = @"HM.shortcutAction";
  id v42 = NSStringFromSelector(sel_supportsShortcutActions);
  v62[18] = v42;
  v61[19] = @"HM.mediaActions";
  id v41 = NSStringFromSelector(sel_supportsMediaActions);
  v62[19] = v41;
  v61[20] = @"HM.firmwareUpdate";
  uint64_t v40 = NSStringFromSelector(sel_supportsFirmwareUpdate);
  v62[20] = v40;
  v61[21] = @"HM.residentFirmwareUpdate";
  uint64_t v39 = NSStringFromSelector(sel_supportsResidentFirmwareUpdate);
  v62[21] = v39;
  v61[22] = @"HM.cameraActivityZones";
  id v38 = NSStringFromSelector(sel_supportsCameraActivityZones);
  v62[22] = v38;
  v61[23] = @"HM.createMusicAlarm";
  uint64_t v37 = NSStringFromSelector(sel_supportsMusicAlarm);
  v62[23] = v37;
  v61[24] = @"HM.faceClassification";
  id v36 = NSStringFromSelector(sel_supportsFaceClassification);
  v62[24] = v36;
  v61[25] = @"HM.naturalLighting";
  id v35 = NSStringFromSelector(sel_supportsNaturalLighting);
  v62[25] = v35;
  v61[26] = @"HM.IDSActivityMonitorPresence";
  id v34 = NSStringFromSelector(sel_supportsIDSActivityMonitorPresence);
  v62[26] = v34;
  v61[27] = @"HM.cameraRecordingReachabilityNotifications";
  id v33 = NSStringFromSelector(sel_supportsCameraRecordingReachabilityNotifications);
  v62[27] = v33;
  v61[28] = @"HM.announce";
  uint64_t v32 = NSStringFromSelector(sel_supportsAnnounce);
  v62[28] = v32;
  v61[29] = @"HM.ThirdPartyMusic";
  id v31 = NSStringFromSelector(sel_supportsThirdPartyMusic);
  v62[29] = v31;
  v61[30] = @"HM.preferredMediaUser";
  uint64_t v30 = NSStringFromSelector(sel_supportsPreferredMediaUser);
  v62[30] = v30;
  v61[31] = @"HM.ThreadBorderRouter";
  id v29 = NSStringFromSelector(sel_supportsThreadBorderRouter);
  v62[31] = v29;
  v61[32] = @"HM.siriEndpointSetup";
  uint64_t v28 = NSStringFromSelector(sel_supportsSiriEndpointSetup);
  v62[32] = v28;
  v61[33] = @"HM.homeHub";
  uint64_t v27 = NSStringFromSelector(sel_supportsHomeHub);
  v62[33] = v27;
  v61[34] = @"HM.lockNotificationContext";
  uint64_t v26 = NSStringFromSelector(sel_supportsLockNotificationContext);
  v62[34] = v26;
  v61[35] = @"HM.wakeOnLAN";
  id v25 = NSStringFromSelector(sel_supportsWakeOnLAN);
  v62[35] = v25;
  v61[36] = @"HM.audioReturnChannel";
  __int16 v24 = NSStringFromSelector(sel_supportsAudioReturnChannel);
  v62[36] = v24;
  v61[37] = @"HM.walletKey";
  id v23 = NSStringFromSelector(sel_supportsWalletKey);
  v62[37] = v23;
  v61[38] = @"HM.cameraPackageDetection";
  __int16 v22 = NSStringFromSelector(sel_supportsCameraPackageDetection);
  v62[38] = v22;
  v61[39] = @"HM.coordinationDoorbellChime";
  __int16 v21 = NSStringFromSelector(sel_supportsCoordinationDoorbellChime);
  v62[39] = v21;
  v61[40] = @"HM.coordinationFreeDoorbellChime";
  id v20 = NSStringFromSelector(sel_supportsCoordinationFreeDoorbellChime);
  v62[40] = v20;
  v61[41] = @"HM.TVOSUpdateManualUpdateAvailableNotification";
  uint64_t v19 = NSStringFromSelector(sel_supportsTVOSUpdateManualUpdateAvailableNotification);
  v62[41] = v19;
  v61[42] = @"HM.accessCodes";
  CFTypeID v18 = NSStringFromSelector(sel_supportsAccessCodes);
  v62[42] = v18;
  v61[43] = @"HM.CHIP";
  long long v17 = NSStringFromSelector(sel_supportsCHIP);
  v62[43] = v17;
  v61[44] = @"HM.doorbellChime";
  long long v16 = NSStringFromSelector(sel_supportsDoorbellChime);
  v62[44] = v16;
  v61[45] = @"HM.userMediaSettings";
  uint64_t v15 = NSStringFromSelector(sel_supportsUserMediaSettings);
  v62[45] = v15;
  v61[46] = @"HM.unifiedMediaNotifications";
  uint64_t v14 = NSStringFromSelector(sel_supportsUnifiedMediaNotifications);
  v62[46] = v14;
  v61[47] = @"HM.managedConfigProfile";
  uint64_t v13 = NSStringFromSelector(sel_supportsManagedConfigurationProfile);
  v62[47] = v13;
  v61[48] = @"HM.captiveNetworks";
  uint64_t v12 = NSStringFromSelector(sel_supportsCaptiveNetworks);
  v62[48] = v12;
  v61[49] = @"HM.modernTransport";
  uint64_t v0 = NSStringFromSelector(sel_supportsModernTransport);
  v62[49] = v0;
  v61[50] = @"HM.residentFirstAccessoryCommunication";
  uint64_t v1 = NSStringFromSelector(sel_supportsResidentFirstAccessoryCommunication);
  v62[50] = v1;
  v61[51] = @"HM.messagedHomePodSettings";
  id v2 = NSStringFromSelector(sel_supportsMessagedHomePodSettings);
  v62[51] = v2;
  v61[52] = @"HM.customDestinationMediaAction";
  id v3 = NSStringFromSelector(sel_supportsCustomMediaApplicationDestination);
  v62[52] = v3;
  v61[53] = @"HM.threadNetworkCredentialSharing";
  uint64_t v4 = NSStringFromSelector(sel_supportsThreadNetworkCredentialSharing);
  v62[53] = v4;
  v61[54] = @"HM.matterSharedAdminPairing";
  uint64_t v5 = NSStringFromSelector(sel_supportsMatterSharedAdminPairing);
  v62[54] = v5;
  v61[55] = @"HM.appleTVRMV";
  uint64_t v6 = NSStringFromSelector(sel_supportsRMVonAppleTV);
  v62[55] = v6;
  v61[56] = @"HM.justSiri";
  uint64_t v7 = NSStringFromSelector(sel_supportsJustSiri);
  v62[56] = v7;
  v61[57] = @"HM.threadService";
  id v8 = NSStringFromSelector(sel_supportsThreadService);
  v62[57] = v8;
  v61[58] = @"HM.matterOwnerCertFetch";
  int v9 = NSStringFromSelector(sel_supportsMatterOwnerCertFetch);
  v62[58] = v9;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:59];

  return v11;
}

BOOL productSupportsKeychainSync(void *a1)
{
  id v1 = a1;
  BOOL v2 = 1;
  switch([v1 productPlatform])
  {
    case 1:
    case 5:
      break;
    case 2:
      if ([v1 productClass] == 6) {
        goto LABEL_2;
      }
      BOOL v2 = [v1 productClass] != 4;
      break;
    default:
LABEL_2:
      BOOL v2 = 0;
      break;
  }

  return v2;
}

BOOL productSupportsDeviceSetup(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  if (v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  else {
    return v4 == 6;
  }
}

BOOL productSupportsKeyTransferClient(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if ([v5 productPlatform] == 1) {
    goto LABEL_7;
  }
  id v8 = [v5 softwareVersion];
  int v9 = v8;
  if (v8)
  {
    [v8 operatingSystemVersion];
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
  }
  long long v13 = *MEMORY[0x1E4F65388];
  uint64_t v14 = *(void *)(MEMORY[0x1E4F65388] + 16);
  uint64_t v10 = HMFOperatingSystemVersionCompare();

  if (v10 == -1) {
LABEL_7:
  }
    BOOL v11 = objc_msgSend(v5, "productPlatform", v13, v14, v15, v16, v17) == 5;
  else {
    BOOL v11 = productSupportsKeychainSync(v5);
  }

  return v11;
}

BOOL productSupportsKeyTransferServer(void *a1)
{
  id v1 = a1;
  if ([v1 productClass] == 4 && objc_msgSend(v1, "productPlatform") == 4)
  {
    BOOL v2 = [v1 softwareVersion];
    id v3 = v2;
    if (v2) {
      [v2 operatingSystemVersion];
    }
    if (HMFOperatingSystemVersionCompare() == -1)
    {
      BOOL v4 = 0;
    }
    else
    {
      id v5 = [v1 softwareVersion];
      id v6 = v5;
      if (v5) {
        [v5 operatingSystemVersion];
      }
      BOOL v4 = HMFOperatingSystemVersionCompare() == -1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL productSupportsStandaloneMode(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 productPlatform];
  if (v2 > 5)
  {
LABEL_6:
    BOOL v3 = 0;
    goto LABEL_7;
  }
  if (((1 << v2) & 0x2A) == 0)
  {
    if (((1 << v2) & 0x11) == 0 && [v1 productClass] != 6)
    {
      BOOL v3 = [v1 productClass] != 4;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v3 = 1;
LABEL_7:

  return v3;
}

uint64_t productSupportsCloudDataSync(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 softwareVersion];
  BOOL v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = 1;
  switch([v1 productPlatform])
  {
    case 1:
    case 5:
      break;
    case 2:
      BOOL v5 = [v1 productClass] == 4;
      goto LABEL_7;
    case 4:
      BOOL v5 = HMFOperatingSystemVersionCompare() == 1;
LABEL_7:
      uint64_t v4 = !v5;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }

  return v4;
}

BOOL productSupportsWholeHouseAudio(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 softwareVersion];
  BOOL v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  return (v4 == 6 || v4 == 4) && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsAssistantAccessControl(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 softwareVersion];
  BOOL v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productIsResidentCapable(void *a1)
{
  id v1 = a1;
  unint64_t v2 = [v1 softwareVersion];
  BOOL v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  if (v4 == 6) {
    return 1;
  }
  if (v4 == 4 || v4 == 3) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return 0;
}

BOOL productSupportsHomeInvitation(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 productPlatform];
  if (v2 == 1 || v2 == 5) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v2 == 2 && [v1 productClass] != 6 && objc_msgSend(v1, "productClass") != 4;
  }

  return v4;
}

BOOL productSupportsTargetControl(void *a1)
{
  id v1 = a1;
  if ([v1 productClass] == 4)
  {
    uint64_t v2 = [v1 softwareVersion];
    BOOL v3 = v2;
    if (v2) {
      [v2 operatingSystemVersion];
    }

    BOOL v4 = HMFOperatingSystemVersionCompare() != 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

BOOL productSupportsMultiUser(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  BOOL v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  return (v4 == 6 || v4 == 4) && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsHomeLevelLocationServiceSetting(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 productPlatform];
  uint64_t v3 = [v1 productClass];
  uint64_t v4 = [v1 softwareVersion];

  if (v4) {
    [v4 operatingSystemVersion];
  }

  BOOL result = 0;
  if (v2 == 4 && v3 == 6) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsCompanionInitiatedRestart(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCompanionInitiatedObliterate(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCameraRecording(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 productPlatform];
  unint64_t v3 = [v1 productClass];
  uint64_t v4 = [v1 softwareVersion];

  if (v4) {
    [v4 operatingSystemVersion];
  }

  BOOL result = 0;
  if (v3 <= 6 && ((1 << v3) & 0x58) != 0) {
    return (v2 == 2 || v2 == 4) && HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsRouterManagement(void *a1)
{
  id v1 = a1;
  if (!productIsResidentCapable(v1))
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  uint64_t v2 = [v1 productPlatform];
  unint64_t v3 = [v1 productClass];
  uint64_t v4 = [v1 softwareVersion];
  BOOL v5 = v4;
  if (v4) {
    [v4 operatingSystemVersion];
  }

  BOOL v6 = 0;
  if (v3 <= 6 && ((1 << v3) & 0x58) != 0)
  {
    if (v2 == 4 || v2 == 2)
    {
      BOOL v6 = HMFOperatingSystemVersionCompare() != 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_10:

  return v6;
}

BOOL productSupportsShortcutActions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  unint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  BOOL result = 1;
  switch(v4)
  {
    case 1:
    case 2:
    case 4:
      BOOL result = HMFOperatingSystemVersionCompare() != 1;
      break;
    case 5:
      return result;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

BOOL productSupportsMediaActions(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  unint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  BOOL result = 1;
  switch(v4)
  {
    case 1:
    case 2:
    case 3:
    case 4:
      BOOL result = HMFOperatingSystemVersionCompare() != 1;
      break;
    case 5:
      return result;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

BOOL productSupportsFirmwareUpdate(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 productPlatform];
  uint64_t v3 = [v1 productClass];
  uint64_t v4 = [v1 softwareVersion];
  BOOL v5 = v4;
  if (v4) {
    [v4 operatingSystemVersion];
  }

  if ([v1 productPlatform] == 1)
  {
LABEL_4:
    BOOL v6 = HMFOperatingSystemVersionCompare() != 1;
  }
  else
  {
    BOOL v6 = 0;
    switch(v3)
    {
      case 1:
      case 3:
        if (v2 == 2) {
          goto LABEL_4;
        }
        goto LABEL_9;
      case 4:
      case 6:
        if (v2 == 4) {
          goto LABEL_4;
        }
LABEL_9:
        BOOL v6 = 0;
        break;
      case 11:
        BOOL v6 = 1;
        break;
      default:
        break;
    }
  }

  return v6;
}

BOOL productSupportsResidentFirmwareUpdate(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 productPlatform];
  uint64_t v3 = [v1 productClass];
  uint64_t v4 = [v1 softwareVersion];

  if (v4) {
    [v4 operatingSystemVersion];
  }

  return (v3 | 2) == 6 && v2 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCameraActivityZones(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  if (v5 == 6 || v5 == 4)
  {
    if (v4 == 4) {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  else if (v5 == 3 && v4 == 2)
  {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return 0;
}

BOOL productSupportsMusicAlarm(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productClass];
  return v4 == 6 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsAnnounce(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  switch(v5)
  {
    case 1:
    case 2:
    case 3:
      if (v4 != 2) {
        goto LABEL_10;
      }
      goto LABEL_9;
    case 5:
      if (v4 == 3) {
        goto LABEL_9;
      }
      goto LABEL_10;
    case 6:
      if (v4 == 4) {
LABEL_9:
      }
        BOOL result = HMFOperatingSystemVersionCompare() != 1;
      else {
LABEL_10:
      }
        BOOL result = 0;
      break;
    case 11:
      BOOL result = 1;
      break;
    default:
      return result;
  }
  return result;
}

BOOL productSupportsThirdPartyMusic(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsPreferredMediaUser(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsUserMediaSettings(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsCoordinationDoorbellChime(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsCoordinationFreeDoorbellChime(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsSiriEndpointSetup(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  uint64_t v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  return (v5 | 2) == 6 && v4 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsHomeHub(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 softwareVersion];
  BOOL v6 = v5;
  if (v5) {
    [v5 operatingSystemVersion];
  }

  uint64_t v7 = [v4 productPlatform];
  uint64_t v8 = [v4 productClass];

  if (v8 == 6)
  {
    int v9 = [v3 supportsSiriHub];
    BOOL v10 = 0;
    if (v7 == 4 && v9) {
      BOOL v10 = HMFOperatingSystemVersionCompare() != 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

BOOL productSupportsWakeOnLAN(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  switch(v5)
  {
    case 1:
    case 3:
      if (v4 != 2) {
        goto LABEL_8;
      }
      goto LABEL_7;
    case 4:
    case 6:
      if (v4 == 4) {
LABEL_7:
      }
        BOOL result = HMFOperatingSystemVersionCompare() != 1;
      else {
LABEL_8:
      }
        BOOL result = 0;
      break;
    default:
      return result;
  }
  return result;
}

BOOL productSupportsLockNotificationContext(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  if (v5 == 6 || v5 == 4)
  {
    if (v4 == 4) {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  else if (v5 == 3 && v4 == 2)
  {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return 0;
}

uint64_t productSupportsAudioReturnChannel(void *a1, void *a2)
{
  id v3 = a2;
  if ([a1 productClass] == 6) {
    uint64_t v4 = [v3 supportsReceivingARCStreamOverAirPlay];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

BOOL productSupportsUnifiedMediaNotifications(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  return (v5 | 2) == 6 && v4 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsCaptiveNetworks(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsResidentFirstAccessoryCommunication(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  unint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 <= 6 && ((1 << v5) & 0x58) != 0) {
    return (v4 == 2 || v4 == 4) && HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsMessagedHomePodSettings(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (_os_feature_enabled_impl())
  {
    unint64_t v5 = [v3 softwareVersion];
    BOOL v6 = v5;
    if (v5) {
      [v5 operatingSystemVersion];
    }

    uint64_t v8 = [v3 productPlatform];
    BOOL v7 = 0;
    if ([v3 productClass] == 6 && v8 == 4)
    {
      int v9 = [[HMDHomeKitVersion alloc] initWithVersionString:@"8.0"];
      BOOL v7 = [(HMDHomeKitVersion *)v9 compare:v4] != 1 && HMFOperatingSystemVersionCompare() != 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

BOOL productSupportsCustomMediaApplicationDestination(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  return (v5 | 2) == 6 && v4 == 4 && HMFOperatingSystemVersionCompare() != 1;
}

BOOL productSupportsThreadNetworkCredentialSharing(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v7 softwareVersion];
  int v9 = v8;
  if (v8) {
    [v8 operatingSystemVersion];
  }

  uint64_t v10 = [v7 productPlatform];
  uint64_t v11 = [v7 productClass];
  BOOL IsResidentCapable = productIsResidentCapable(v7);

  if (IsResidentCapable)
  {
    if (v11 == 6 || v11 == 4)
    {
      if (v10 == 4) {
        return HMFOperatingSystemVersionCompare() != 1;
      }
    }
    else if (v11 == 3 && v10 == 2)
    {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  return 0;
}

BOOL productSupportsMatterSharedAdminPairing(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v7 softwareVersion];
  int v9 = v8;
  if (v8) {
    [v8 operatingSystemVersion];
  }

  uint64_t v10 = [v7 productPlatform];
  uint64_t v11 = [v7 productClass];
  BOOL IsResidentCapable = productIsResidentCapable(v7);

  if (IsResidentCapable)
  {
    if (v11 == 6 || v11 == 4)
    {
      if (v10 == 4) {
        return HMFOperatingSystemVersionCompare() != 1;
      }
    }
    else if (v11 == 3 && v10 == 2)
    {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  return 0;
}

uint64_t productSupportsRMVonAppleTV(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  uint64_t result = 0;
  if (v5 == 4 && v4 == 4)
  {
    if (HMFOperatingSystemVersionCompare() == 1) {
      return 0;
    }
    else {
      return _os_feature_enabled_impl();
    }
  }
  return result;
}

BOOL productSupportsJustSiri(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 softwareVersion];
  id v3 = v2;
  if (v2) {
    [v2 operatingSystemVersion];
  }

  uint64_t v4 = [v1 productPlatform];
  uint64_t v5 = [v1 productClass];

  BOOL result = 0;
  if (v5 == 6 && v4 == 4) {
    return HMFOperatingSystemVersionCompare() != 1;
  }
  return result;
}

BOOL productSupportsMatterOwnerCertFetch(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = [v7 softwareVersion];
  int v9 = v8;
  if (v8) {
    [v8 operatingSystemVersion];
  }

  uint64_t v10 = [v7 productPlatform];
  uint64_t v11 = [v7 productClass];
  BOOL IsResidentCapable = productIsResidentCapable(v7);

  if (IsResidentCapable)
  {
    if (v11 == 6 || v11 == 4)
    {
      if (v10 == 4) {
        return HMFOperatingSystemVersionCompare() != 1;
      }
    }
    else if (v11 == 3 && v10 == 2)
    {
      return HMFOperatingSystemVersionCompare() != 1;
    }
  }
  return 0;
}

void sub_1D52305FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HMDWatchManagerUpdateWithConnectedDevices(void *a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v38 = a1;
  id v39 = a2;
  if (v38)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    uint64_t v4 = (os_unfair_lock_s *)v38;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v63 = v6;
      __int16 v64 = 2112;
      id v65 = v39;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Processing connected devices: %@", buf, 0x16u);
    }
    uint64_t v40 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v39, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v7 = v39;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          if (+[HMDWatchManager isCompatibleWatchDevice:v11])
          {
            uint64_t v12 = [[HMDDevice alloc] initWithService:*(void *)&v4[10]._os_unfair_lock_opaque device:v11];
            if (v12) {
              [v40 addObject:v12];
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v8);
    }

    os_unfair_lock_lock_with_options();
    uint64_t v37 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)&v4[8]._os_unfair_lock_opaque];
    uint64_t v13 = [v40 allObjects];
    uint64_t v14 = *(void **)&v4[8]._os_unfair_lock_opaque;
    *(void *)&v4[8]._os_unfair_lock_opaque = v13;

    LOBYTE(v4[6]._os_unfair_lock_opaque) = [v40 count] != 0;
    os_unfair_lock_unlock(v4 + 2);
    objc_msgSend(v37, "hmf_removedObjectsFromSet:", v40);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v48 != v16) {
            objc_enumerationMutation(obj);
          }
          CFTypeID v18 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          uint64_t v19 = (void *)MEMORY[0x1D9452090]();
          id v20 = v4;
          __int16 v21 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            uint64_t v63 = v22;
            __int16 v64 = 2112;
            id v65 = v18;
            _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Removed connected device: %@", buf, 0x16u);
          }
          id v23 = +[HMDWatchConnectivityLogEventManager sharedInstance];
          [v23 incrementWatchRemovedNotificationCount];

          __int16 v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
          __int16 v58 = @"HMDDeviceNotificationKey";
          id v59 = v18;
          id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          [v24 postNotificationName:@"HMDWatcherManagerWatchDisconnectedNotification" object:v20 userInfo:v25];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v15);
    }

    objc_msgSend(v37, "hmf_addedObjectsFromSet:", v40);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obja = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [obja countByEnumeratingWithState:&v43 objects:v57 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v44 != v27) {
            objc_enumerationMutation(obja);
          }
          id v29 = *(void **)(*((void *)&v43 + 1) + 8 * k);
          uint64_t v30 = (void *)MEMORY[0x1D9452090]();
          id v31 = v4;
          uint64_t v32 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = 138543618;
            uint64_t v63 = v33;
            __int16 v64 = 2112;
            id v65 = v29;
            _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Added connected device: %@", buf, 0x16u);
          }
          id v34 = +[HMDWatchConnectivityLogEventManager sharedInstance];
          [v34 incrementWatchAddedNotificationCount];

          id v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
          long long v55 = @"HMDDeviceNotificationKey";
          long long v56 = v29;
          id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          [v35 postNotificationName:@"HMDWatcherManagerWatchConnectedNotification" object:v31 userInfo:v36];
        }
        uint64_t v26 = [obja countByEnumeratingWithState:&v43 objects:v57 count:16];
      }
      while (v26);
    }
  }
}

void sub_1D52312BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5231658(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5238744(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5238930(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5238A00(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D523BDA4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D523E9BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52416C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__152179(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__152180(uint64_t a1)
{
}

void sub_1D5242014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D52466F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

void __updateClipManagerWriteAccess(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = [v4 workQueue];
  dispatch_assert_queue_V2(v5);

  [v3 accessModeAtHome];
  LODWORD(v5) = HMIsRecordingAllowedForCameraAccessMode();
  [v3 accessModeNotAtHome];

  uint64_t v6 = v5 | HMIsRecordingAllowedForCameraAccessMode();
  id v7 = [v4 clipManager];

  [v7 setHasWriteAccess:v6];
}

void sub_1D525C7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D525C9F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL __HMDDeviceSetupManagerIsProxSetupRunning(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 darwinNotificationProvider];
  int v3 = [v2 notifyIsValidToken:v1[3]];

  if (v3)
  {
    uint64_t v12 = 0;
    id v4 = [v1 darwinNotificationProvider];
    int v5 = [v4 notifyGetState:v1[3] state:&v12];

    if (!v5)
    {
      BOOL v10 = v12 == 1;
      goto LABEL_7;
    }
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v1;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get ProxSetup state with status: %u", buf, 0x12u);
    }
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

void sub_1D525D0F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D525D448(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

void sub_1D525D974(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D525DD78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D525E5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

void sub_1D525E66C()
{
}

void sub_1D525E674()
{
}

void sub_1D525E67C()
{
}

void sub_1D525FB6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D52624D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D5262964(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__155262(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__155263(uint64_t a1)
{
}

void sub_1D5264938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D5264E20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5265268(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D526549C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52656C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5266DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5269B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D526B300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D526D434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  objc_destroyWeak(v29);
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v31 - 176));
  _Unwind_Resume(a1);
}

void sub_1D526EBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_1D526FE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v32 - 160));
  _Unwind_Resume(a1);
}

void sub_1D5270E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5280090(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52809C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D528106C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5281BC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5282CFC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id ipAccessoryStageSystemCriteria()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E4F141C0], "com.apple.homed.firmwareUpdate.ipAccessory.stage.group");
  uint64_t v1 = (const char *)*MEMORY[0x1E4F141B8];
  unsigned int v2 = uint32ForPreference(@"firmwareUpdateIPAccessoryStageConcurrentLimit");
  xpc_dictionary_set_uint64(v0, v1, v2);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F14330], 1);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E4F14270], (const char *)*MEMORY[0x1E4F14280]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F14138], 1);
  return v0;
}

id bleAccessoryStageSystemCriteria()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E4F141C0], "com.apple.homed.firmwareUpdate.bleAccessory.stage.group");
  uint64_t v1 = (const char *)*MEMORY[0x1E4F141B8];
  unsigned int v2 = uint32ForPreference(@"firmwareUpdateBLEAccessoryStageConcurrentLimit");
  xpc_dictionary_set_uint64(v0, v1, v2);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E4F14170], 5);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F14200]);
  return v0;
}

id threadAccessoryStageSystemCriteria()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E4F141C0], "com.apple.homed.firmwareUpdate.threadAccessory.stage.group");
  uint64_t v1 = (const char *)*MEMORY[0x1E4F141B8];
  unsigned int v2 = uint32ForPreference(@"firmwareUpdateThreadAccessoryStageConcurrentLimit");
  xpc_dictionary_set_uint64(v0, v1, v2);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F14330], 1);
  xpc_dictionary_set_string(v0, (const char *)*MEMORY[0x1E4F14270], (const char *)*MEMORY[0x1E4F14280]);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v0, (const char *)*MEMORY[0x1E4F142F8], 0);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E4F14170], 5);
  xpc_dictionary_set_int64(v0, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F14200]);
  return v0;
}

uint64_t uint32ForPreference(void *a1)
{
  uint64_t v1 = uint32ForPreference_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&uint32ForPreference_onceToken, &__block_literal_global_163_157659);
  }
  int v3 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v4 = [v3 preferenceForKey:v2];

  int v5 = [v4 numberValue];
  uint64_t v6 = [v5 unsignedIntValue];

  return v6;
}

uint64_t __uint32ForPreference_block_invoke()
{
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9A30 forPreferenceKey:@"firmwareUpdateStageMinDelay"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9A48 forPreferenceKey:@"firmwareUpdateStageMaxDelay"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9A60 forPreferenceKey:@"firmwareUpdateApplyMinDelay"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9A78 forPreferenceKey:@"firmwareUpdateApplyMaxDelay"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9A90 forPreferenceKey:@"firmwareUpdateIPAccessoryStageConcurrentLimit"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9A60 forPreferenceKey:@"firmwareUpdateIPAccessoryApplyConcurrentLimit"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9AA8 forPreferenceKey:@"firmwareUpdateBLEAccessoryStageConcurrentLimit"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9AC0 forPreferenceKey:@"firmwareUpdateBLEAccessoryApplyConcurrentLimit"];
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9AA8 forPreferenceKey:@"firmwareUpdateThreadAccessoryStageConcurrentLimit"];
  xpc_object_t v0 = (void *)MEMORY[0x1E4F65530];
  return [v0 setDefaultValue:&unk_1F2DC9AA8 forPreferenceKey:@"firmwareUpdateThreadAccessoryApplyConcurrentLimit"];
}

void sub_1D5289440(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D528A3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18, id a19, id a20)
{
}

void sub_1D528BFD0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D528D248(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D528DCE4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __HMDRemoteDeviceMonitorReachable(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  id v2 = v1;
  if (!v1) {
    goto LABEL_14;
  }
  if (([v1[13] isReachable] & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = v2;
    uint64_t v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    __int16 v15 = v9;
    BOOL v10 = "%{public}@Considering ourselves unreachable because net monitor is unreachable";
LABEL_12:
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, 0xCu);

    goto LABEL_13;
  }
  id WeakRetained = objc_loadWeakRetained(v2 + 11);
  uint64_t v4 = [WeakRetained device];

  if (!v4)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = v2;
    uint64_t v8 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    uint64_t v9 = HMFGetLogIdentifier();
    int v14 = 138543362;
    __int16 v15 = v9;
    BOOL v10 = "%{public}@Considering ourselves unreachable because there is no current device";
    goto LABEL_12;
  }
  if ((objc_msgSend(v2[7], "hmd_isActive") & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = v2;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v14 = 138543362;
      __int16 v15 = v9;
      BOOL v10 = "%{public}@Considering ourselves unreachable because the IDSService is not active";
      goto LABEL_12;
    }
LABEL_13:

LABEL_14:
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = 1;
LABEL_15:

  return v5;
}

void sub_1D528ED60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5293C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D529428C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D529482C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5295448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52957D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_1D5295A58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5295C04(_Unwind_Exception *a1)
{
}

uint64_t __hmiActivityZonesFromActivityZones_block_invoke(uint64_t a1, void *a2)
{
  return [a2 createHMIActivityZoneWithIsInclusion:*(unsigned __int8 *)(a1 + 32)];
}

void sub_1D529CAC0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

id getCurrentPairingIdentityWithPrivilege(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v15 = 0;
  id v16 = 0;
  id v14 = 0;
  char v4 = [v3 getControllerPublicKey:&v16 secretKey:0 username:&v15 allowCreation:0 error:&v14];
  id v5 = v16;
  id v6 = v15;
  id v7 = v14;
  uint64_t v8 = v7;
  if (v4)
  {

    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F65510]) initWithPairingKeyData:v5];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F5BE00]) initWithIdentifier:v6 publicKey:v8 privateKey:0 permissions:(a1 & 0xFFFFFFFFFFFFFFFDLL) == 1];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1D9452090]();
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      CFTypeID v18 = v12;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDUser] Failed to get current user from keychain with error: %@", buf, 0x16u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_1D52A31F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_1D52A3470(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D52A4034(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D52A50C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id __accessoriesFromAccessoryUUIDs(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(v4, "accessoryWithUUID:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v12 = (void *)[v5 copy];
  return v12;
}

id __displayNameForUser(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__160450;
  uint64_t v13 = __Block_byref_object_dispose__160451;
  id v14 = 0;
  uint64_t v2 = (void *)MEMORY[0x1E4F653F0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ____displayNameForUser_block_invoke;
  v6[3] = &unk_1E6A18690;
  id v3 = v1;
  id v7 = v3;
  uint64_t v8 = &v9;
  [v2 activityWithName:@"User.Name" block:v6];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_1D52A88A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__160450(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__160451(uint64_t a1)
{
}

void ____displayNameForUser_block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountHandle];
  id v12 = [v2 contact];

  id v3 = v12;
  if (v12
    || ([*(id *)(a1 + 32) account],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 contact],
        id v13 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        (id v3 = v13) != 0))
  {
    id v14 = v3;
    uint64_t v5 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      id v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
      goto LABEL_7;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v7 = +[HMDAccountHandleFormatter defaultFormatter];
  uint64_t v8 = [*(id *)(a1 + 32) accountHandle];
  uint64_t v9 = [v7 stringForObjectValue:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

LABEL_7:
}

void sub_1D52AE6B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __registerForAccountNotifications(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:v1 name:@"HMDAccountRegistryAddedAccountNotification" object:0];

    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:v1 name:@"HMDAccountRegistryRemovedAccountNotification" object:0];

    id v4 = [v1 accountHandle];
    if (v4)
    {
      unsigned __int8 v19 = 0;
      uint64_t v5 = +[HMDAccountRegistry sharedRegistry];
      uint64_t v6 = [v5 accountForHandle:v4 exists:&v19];

      int v7 = v19;
      uint64_t v8 = (void *)MEMORY[0x1D9452090]();
      id v9 = v1;
      uint64_t v10 = HMFGetOSLogHandle();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
      if (v7)
      {
        if (v11)
        {
          id v12 = HMFGetLogIdentifier();
          id v13 = [v6 shortDescription];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v21 = v12;
          __int16 v22 = 2112;
          id v23 = v13;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Registering for notifications for account: %@", buf, 0x16u);
        }
        id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        long long v15 = sel___handleRemovedAccount_;
        long long v16 = +[HMDAccountRegistry sharedRegistry];
        long long v17 = @"HMDAccountRegistryRemovedAccountNotification";
      }
      else
      {
        if (v11)
        {
          CFTypeID v18 = HMFGetLogIdentifier();
          *(_DWORD *)long long buf = 138543362;
          uint64_t v21 = v18;
          _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Registering for account notifications", buf, 0xCu);
        }
        id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
        long long v15 = sel___handleAddedAccount_;
        long long v16 = +[HMDAccountRegistry sharedRegistry];
        long long v17 = @"HMDAccountRegistryAddedAccountNotification";
      }
      [v14 addObserver:v9 selector:v15 name:v17 object:v16];
    }
  }
}

void __handleUpdatedAccount(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    [v1 deregisterIdentity];
    [v1 registerIdentity];
  }
}

void __updateWithAccount(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = v3;
    int v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      id v9 = [v6 userID];
      *(_DWORD *)long long buf = 138543874;
      id v35 = v8;
      __int16 v36 = 2112;
      uint64_t v37 = v9;
      __int16 v38 = 2112;
      id v39 = v4;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating with account: %@ / %@", buf, 0x20u);
    }
    if (v4)
    {
      uint64_t v10 = [v6 accountHandle];
      if (v10)
      {
        BOOL v11 = [v4 handles];
        char v12 = [v11 containsObject:v10];

        if (v12)
        {
          if ([v4 isAuthenticated])
          {
            id v13 = [v4 identifier];
            id v14 = [v6 accountIdentifier];
            char v15 = HMFEqualObjects();

            if ((v15 & 1) == 0)
            {
              long long v16 = (void *)MEMORY[0x1D9452090]();
              id v17 = v6;
              CFTypeID v18 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                unsigned __int8 v19 = HMFGetLogIdentifier();
                id v20 = [v17 userID];
                *(_DWORD *)long long buf = 138543874;
                id v35 = v19;
                __int16 v36 = 2112;
                uint64_t v37 = v20;
                __int16 v38 = 2112;
                id v39 = v13;
                _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Updating account identifier to: %@ / %@", buf, 0x20u);
              }
              uint64_t v21 = (void *)[v17 newModelWithChangeType:2];
              [v21 setAccountIdentifier:v13];
              __int16 v22 = [v17 home];
              id v23 = [v22 backingStore];
              uint64_t v24 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
              id v25 = [v23 transaction:@"userUpdateAccountIdentifier" options:v24];

              [v25 add:v21];
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = ____updateWithAccount_block_invoke;
              v31[3] = &unk_1E6A196E0;
              id v32 = v17;
              id v33 = v13;
              [v25 run:v31];
            }
          }
        }
        else
        {
          uint64_t v26 = (void *)MEMORY[0x1D9452090]();
          id v27 = v6;
          uint64_t v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = HMFGetLogIdentifier();
            uint64_t v30 = [v27 userID];
            *(_DWORD *)long long buf = 138543874;
            id v35 = v29;
            __int16 v36 = 2112;
            uint64_t v37 = v30;
            __int16 v38 = 2112;
            id v39 = v4;
            _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Unable to update with account: %@ / %@", buf, 0x20u);
          }
        }
      }
    }
  }
}

void ____updateWithAccount_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) userID];
    int v10 = 138544130;
    BOOL v11 = v7;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    char v15 = v9;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finished updating the accountIdentifier [%@] for user [%@] finished with error: %@", (uint8_t *)&v10, 0x2Au);
  }
}

void sub_1D52B00C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D52B0808(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52B2768(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id _userPairingIdentity(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F5BE00];
    id v4 = a1;
    id v5 = [v3 alloc];
    id v6 = [v4 identifier];
    int v7 = [v4 publicKey];

    uint64_t v8 = (void *)[v5 initWithIdentifier:v6 publicKey:v7 privateKey:0 permissions:(a2 & 0xFFFFFFFFFFFFFFFDLL) == 1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

void sub_1D52B29B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52B2B84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void ____auditAccount_block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) accountHandle];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      int v7 = HMFGetLogIdentifier();
      uint64_t v8 = [*(id *)(a1 + 32) home];
      id v9 = [v8 name];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v21 = v7;
      __int16 v22 = 2112;
      id v23 = v2;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Auditing user account with handle : %@ for home: %@", buf, 0x20u);
    }
    char v19 = 0;
    int v10 = +[HMDAccountRegistry sharedRegistry];
    BOOL v11 = [v10 accountForHandle:v2 exists:&v19];

    if (v19)
    {
      __updateWithAccount(*(void **)(a1 + 32), v11);
    }
    else
    {
      __int16 v14 = (void *)MEMORY[0x1D9452090]();
      id v15 = *(id *)(a1 + 32);
      __int16 v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        uint64_t v18 = [*(id *)(a1 + 32) userID];
        *(_DWORD *)long long buf = 138543618;
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        id v23 = v18;
        _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Account does not currently exist for user: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (v6)
    {
      __int16 v12 = HMFGetLogIdentifier();
      uint64_t v13 = [*(id *)(a1 + 32) userID];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Not auditing the account for the user: %@", buf, 0x16u);
    }
  }
}

void sub_1D52B7370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52B7F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 104));
  _Unwind_Resume(a1);
}

void sub_1D52B9EA0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52BA38C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52BB38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_1D52BBDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__161793(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__161794(uint64_t a1)
{
}

void __updateRegistration(void *a1, char *a2, void *a3, uint64_t a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  id v27 = +[HMDBackingStoreTransactionOptions optionsWithSource:0 destination:a4 mustReplay:0 mustPush:1];
  id v9 = [v7 transaction:@"Object registration" options:v27];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = [*(id *)(*((void *)&v33 + 1) + 8 * v13) modelObjectWithChangeType:a2 version:4];
        [v9 add:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v11);
  }

  id v15 = [[HMDBackingStoreLogAddTransactionOperation alloc] initWithTransaction:v9];
  __int16 v16 = [v9 objects];
  +[HMDBackingStoreTransactionBlock sort:v16];

  id v17 = (void *)MEMORY[0x1D9452090]();
  id v18 = v7;
  char v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = HMFGetLogIdentifier();
    if ((unint64_t)(a2 - 1) > 2) {
      uint64_t v21 = @"unknown";
    }
    else {
      uint64_t v21 = off_1E6A121D0[(void)(a2 - 1)];
    }
    __int16 v22 = v21;
    id v23 = [v9 options];
    *(_DWORD *)long long buf = 138544130;
    __int16 v38 = v20;
    __int16 v39 = 2112;
    uint64_t v40 = v22;
    __int16 v41 = 2112;
    id v42 = v23;
    __int16 v43 = 2112;
    long long v44 = v15;
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Registration operation -- changeType: %@, options: %@ (%@)", buf, 0x2Au);
  }
  objc_initWeak((id *)buf, v18);
  objc_initWeak(&location, v15);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = ____updateRegistration_block_invoke;
  v28[3] = &unk_1E6A14E68;
  objc_copyWeak(&v30, (id *)buf);
  objc_copyWeak(v31, &location);
  id v24 = v9;
  id v29 = v24;
  v31[1] = a2;
  [(HMDBackingStoreOperation *)v15 setResultBlock:v28];
  [(HMDBackingStoreOperation *)v15 setStore:v18];
  id v25 = -[HMDBackingStore dataSource]((id *)v18);
  uint64_t v26 = [v25 backingStoreOperationQueue];
  [v26 addOperation:v15];

  objc_destroyWeak(v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void sub_1D52BC738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void ____updateRegistration_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = (HMDHomeSaveRequest *)objc_loadWeakRetained((id *)(a1 + 48));
    BOOL v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = WeakRetained;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier();
      id v10 = [*(id *)(a1 + 32) options];
      *(_DWORD *)long long buf = 138543874;
      v76 = v9;
      __int16 v77 = 2112;
      v78 = v10;
      __int16 v79 = 2112;
      v80 = v5;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting operation -- options: %@ (%@)", buf, 0x20u);
    }
    id v63 = WeakRetained;

    id v65 = [v7 homeManager];
    uint64_t v11 = [v65 isDataSyncInProgress] ^ 1;
    uint64_t v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = v7;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      __int16 v16 = v15 = a1;
      *(_DWORD *)long long buf = 138543362;
      v76 = v16;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Model objects:", buf, 0xCu);

      a1 = v15;
    }

    id v17 = (void *)MEMORY[0x1D9452090]([*(id *)(a1 + 32) dumpWithVerbosity:v11 prefix:&stru_1F2C9F1A8 logType:1]);
    id v18 = v13;
    char v19 = HMFGetOSLogHandle();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v20)
      {
        uint64_t v21 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        v76 = v21;
        __int16 v77 = 2112;
        v78 = v5;
        __int16 v79 = 2112;
        v80 = v3;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@error occurred during save of %@: %@", buf, 0x20u);
      }
      __int16 v22 = [v18 local];
      [v22 _rollback];
    }
    else
    {
      if (v20)
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        v76 = v26;
        __int16 v77 = 2112;
        v78 = v5;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@save complete for operation: %@", buf, 0x16u);
      }
      __int16 v22 = [v18 local];
      id v27 = (id)[v22 _commit];
    }
    __int16 v64 = v3;

    uint64_t v28 = (void *)MEMORY[0x1D9452090]();
    id v29 = v18;
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      v76 = v31;
      __int16 v77 = 2112;
      v78 = v5;
      _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@running operation: %@", buf, 0x16u);
    }
    id v62 = v5;

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = [*(id *)(a1 + 32) objects];
    id v32 = v65;
    uint64_t v69 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v69)
    {
      uint64_t v68 = *(void *)v71;
      id v67 = v29;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v71 != v68) {
            objc_enumerationMutation(obj);
          }
          long long v34 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          long long v35 = (void *)MEMORY[0x1D9452090]();
          id v36 = v29;
          uint64_t v37 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            __int16 v38 = HMFGetLogIdentifier();
            uint64_t v39 = a1;
            unint64_t v40 = *(void *)(a1 + 56) - 1;
            __int16 v41 = @"unknown";
            if (v40 <= 2) {
              __int16 v41 = off_1E6A121D0[v40];
            }
            id v42 = v41;
            __int16 v43 = [v34 change];
            long long v44 = [v43 uuid];
            *(_DWORD *)long long buf = 138543874;
            v76 = v38;
            __int16 v77 = 2112;
            v78 = (HMDHomeSaveRequest *)v42;
            __int16 v79 = 2112;
            v80 = v44;
            _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_INFO, "%{public}@Updating registration for object -- changeType: %@, object: %@", buf, 0x20u);

            a1 = v39;
            id v32 = v65;
            id v29 = v67;
          }

          long long v45 = [v36 home];
          uint64_t v46 = v45;
          if (v45)
          {
            long long v47 = [v45 zoneID];
            long long v48 = [v47 UUIDString];

            long long v49 = [v32 syncManager];
            [v49 resetCloudPushTimer:v48];

            long long v50 = [*(id *)(a1 + 32) options];
            long long v51 = [v50 label];
            long long v52 = [v34 change];
            [v46 saveWithReason:v51 postSyncNotification:0 objectChange:v52 != 0];
          }
          else
          {
            long long v53 = [v32 syncManager];
            [v53 resetCloudPushTimer:0];

            long long v54 = [HMDHomeSaveRequest alloc];
            long long v55 = [*(id *)(a1 + 32) options];
            long long v56 = [v55 label];
            long long v48 = [(HMDHomeSaveRequest *)v54 initWithReason:v56 information:0 postSyncNotification:0];

            id v57 = (void *)MEMORY[0x1D9452090]();
            id v58 = v36;
            id v59 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              id v60 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = 138543618;
              v76 = v60;
              __int16 v77 = 2112;
              v78 = v48;
              _os_log_impl(&dword_1D49D5000, v59, OS_LOG_TYPE_INFO, "%{public}@submitting save request: %@", buf, 0x16u);
            }
            [v32 saveWithRequest:v48];
            id v29 = v67;
          }
        }
        uint64_t v69 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v69);
    }

    v61 = [(HMDHomeSaveRequest *)v62 operationFinishBlock];
    v61[2](v61, 0);

    id WeakRetained = v63;
    id v3 = v64;
  }
  else
  {
    id v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      v76 = v25;
      _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@[HMDBackingStore] Lost store when running transaction", buf, 0xCu);
    }
  }
}

void sub_1D52C07B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__162185(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__162186(uint64_t a1)
{
}

void sub_1D52C1D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D52C37F8(_Unwind_Exception *a1)
{
}

void sub_1D52C39A4(_Unwind_Exception *a1)
{
}

void sub_1D52C3A34(_Unwind_Exception *a1)
{
}

void sub_1D52C3C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52C7438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_1D52C778C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D52C78C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52CA388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMDCameraLocalStreamSessionStateAsString(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  if (unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1))
  {
    uint64_t v2 = off_1E6A14FC8[v1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraLocalStreamSessionState %tu", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_1D52CC994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id location)
{
  objc_destroyWeak(v35);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52CD52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__163958(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__163959(uint64_t a1)
{
}

void sub_1D52CD7C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52CD84C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52CD950(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52CDD00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
}

void sub_1D52D1FBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL HMDRemoteEventRouterProtoEventsMessageReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 3)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F69F80]);
        [a1 addCachedEvents:v17];
      }
      else
      {
        if ((v10 >> 3) != 2)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
          continue;
        }
        id v17 = objc_alloc_init(MEMORY[0x1E4F69F80]);
        [a1 addEvents:v17];
      }
      if (!PBReaderPlaceMark() || (HMEProtoEventInfoReadFrom() & 1) == 0)
      {

        return 0;
      }
      PBReaderRecallMark();
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D52D7B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52D88D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __percentageForCharacteristicValue(void *a1, void *a2)
{
  if (a2)
  {
    id v3 = a1;
    [a2 floatValue];
    float v5 = v4;
    BOOL v6 = [v3 metadata];

    id v7 = [v6 minimumValue];
    if (v7)
    {
      char v8 = [v6 minimumValue];
      [v8 floatValue];
      float v10 = v9;
    }
    else
    {
      float v10 = 0.0;
    }

    unint64_t v12 = [v6 maximumValue];
    if (v12)
    {
      char v13 = [v6 maximumValue];
      [v13 floatValue];
      float v15 = v14;
    }
    else
    {
      float v15 = 100.0;
    }

    *(float *)&double v16 = (float)(v5 - v10) / (float)(v15 - v10);
    uint64_t v11 = [NSNumber numberWithFloat:v16];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

void sub_1D52DB3E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_1D52DBDB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52DD08C(_Unwind_Exception *exception_object)
{
}

void sub_1D52DD2E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DD478(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DD5C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DD664(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DD700(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DD790(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DD968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52DE4E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DF564(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DF660(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52DF75C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E01D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E0250(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E0534(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E0618(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E09D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E0A68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E0D48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52E3648(_Unwind_Exception *a1)
{
}

void sub_1D52E3708(_Unwind_Exception *a1)
{
}

void sub_1D52E4AC8(_Unwind_Exception *a1)
{
}

void sub_1D52E5034(_Unwind_Exception *a1)
{
}

double __homeRegionNearbyRadius()
{
  xpc_object_t v0 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v1 = [v0 preferenceForKey:@"homeNearbyRegionRadius"];
  uint64_t v2 = [v1 numberValue];

  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

__CFString *HMDHomeLocationSourceToString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A15358[a1];
  }
  return v1;
}

void sub_1D52E8738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v7);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__166722(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__166723(uint64_t a1)
{
}

void sub_1D52E8CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double getLocationUpdateTimeInterval()
{
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v16[0] = 0;
  v16[1] = v16;
  void v16[2] = 0x2020000000;
  int v17 = 0;
  xpc_object_t v0 = [MEMORY[0x1E4F65530] sharedPreferences];
  uint64_t v1 = [v0 preferenceForKey:@"kLocationUpdateIntervalMinutes"];
  uint64_t v2 = [v1 numberValue];

  double v3 = [MEMORY[0x1E4F65530] sharedPreferences];
  double v4 = [v3 preferenceForKey:@"kLocationUpdateIntervalVarianceMinutes"];
  float v5 = [v4 numberValue];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __getLocationUpdateTimeInterval_block_invoke;
  v11[3] = &unk_1E6A15338;
  float v14 = v18;
  float v15 = v16;
  id v12 = v2;
  id v13 = v5;
  uint64_t v6 = getLocationUpdateTimeInterval_onceToken;
  id v7 = v5;
  id v8 = v2;
  if (v6 != -1) {
    dispatch_once(&getLocationUpdateTimeInterval_onceToken, v11);
  }
  double v9 = *(double *)&getLocationUpdateTimeInterval_locationUpdateIntervalWithVariance;

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  return v9;
}

void sub_1D52E94C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

double __getLocationUpdateTimeInterval_block_invoke(uint64_t a1)
{
  if (_os_feature_enabled_impl())
  {
    [*(id *)(a1 + 32) doubleValue];
    double v3 = v2 * 60.0;
  }
  else
  {
    double v3 = 86400.0;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = arc4random_uniform([*(id *)(a1 + 40) unsignedIntValue]);
  double result = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
         + (double)(60 * (unint64_t)*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  *(double *)&getLocationUpdateTimeInterval_locationUpdateIntervalWithVariance = result;
  return result;
}

void sub_1D52EBA78(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __HMDHomeAdministratorHandlerGetOrCreateReceiver(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  float v5 = v4;
  uint64_t v6 = 0;
  if (v3 && v4)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v6 = [*((id *)v3 + 11) objectForKey:v5];
    if (!v6)
    {
      id v7 = [v3 home];
      [v7 isOwnerUser];
      id v8 = objc_opt_class();

      uint64_t v6 = (void *)[objc_alloc((Class)v8) initWithReceiver:v5 handler:v3];
      [*((id *)v3 + 11) setObject:v6 forKey:v5];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v3 + 18);
  }

  return v6;
}

void sub_1D52EBDC4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D52EC0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52EDD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D52F51C8(_Unwind_Exception *a1)
{
}

void sub_1D52FF1F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__168481(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__168482(uint64_t a1)
{
}

void sub_1D52FF448(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5301230(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1D5302C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D530607C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5306128(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D530621C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5306D6C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53086C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53087AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53088B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53089DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5308AE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53097A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D530A120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D530A680(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D530C940(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D530FB20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D530FF54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5310B1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5311E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5313E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)(v23 - 160));
  _Unwind_Resume(a1);
}

void sub_1D5316760(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53168E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5319E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D531F1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53200E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D532093C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
}

void sub_1D5320E40(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5321E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id *location,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v71 - 176), 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__170059(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__170060(uint64_t a1)
{
}

void sub_1D5322198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_1D53235A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
}

void sub_1D5325F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5326E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id location)
{
  objc_destroyWeak(v62);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v63 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D532838C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void sub_1D53289E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5329E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void sub_1D532C370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D532C570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D532F3B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v11 - 152));
  _Unwind_Resume(a1);
}

void sub_1D532FD90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
}

void sub_1D533010C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D53304C4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

id __isUserInMessagePartOfHome(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v7 matchingRemoteIdentityUserForHome:v6];
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = v5;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      int v15 = 138543874;
      double v16 = v12;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Found matching user: %@, for message: %@", (uint8_t *)&v15, 0x20u);
    }
    id v13 = v8;
  }

  return v8;
}

void sub_1D53347CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
}

void sub_1D5334F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 112));
  _Unwind_Resume(a1);
}

void sub_1D533533C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

void sub_1D5336CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,id a36)
{
}

void sub_1D5339BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1D533A1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_1D533C800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D533CDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_1D533E528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D533EABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D534036C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53404F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id __pairingIdentityForAccessory(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1F2E2B960]) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;
  id v4 = [v3 pairingIdentity];

  return v4;
}

void sub_1D5346F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53470A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D534751C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  __HMFActivityScopeLeave();
  _Unwind_Resume(a1);
}

void sub_1D534B1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D534B338(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D534B4A4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D534B9E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void sub_1D534C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D534C83C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D534C990(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D534CD8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 152));
  _Unwind_Resume(a1);
}

void sub_1D5351304(_Unwind_Exception *a1)
{
}

void sub_1D5351798(_Unwind_Exception *a1)
{
}

void sub_1D5352890(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5352A00(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5352A9C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5352B28(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5352BBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5352C84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53531BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53538C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53551A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
}

void sub_1D5356008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id location)
{
  objc_destroyWeak(v39);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D535637C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5356644(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5356CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53570E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5357704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1D53585A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5358804(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D5358958(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5358DCC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1D5358F0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53590EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5359EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D535A05C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535A314(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1D535AC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D535AD88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535B2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D535B5A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535BC78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535C214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1D535C894(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535CC94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D535CE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D535D834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58)
{
}

void sub_1D535DE64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535E4F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_1D535EA44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D535EF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17)
{
}

void sub_1D535F124(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D535F4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D535FAD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v34 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D536051C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5360984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5360C70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5360D90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5361640(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5361A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5361C00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5362380(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_1D5362518(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1D5363514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5364744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
}

void sub_1D5364F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5365364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5365540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D5366620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id location)
{
}

void sub_1D5367340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
}

void sub_1D5368098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location,char a49)
{
}

void sub_1D5368A94(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_1D5369D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D536A99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1D536B0B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1D536C164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 144));
  _Unwind_Resume(a1);
}

void sub_1D536F778(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1D536FE94(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5371A78(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)&STACK[0x2A8]);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D5372098(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D53724E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D53725E4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5372A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5373268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location,char a41)
{
}

void sub_1D53737C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5373B00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5373F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5374810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5374B64(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D5375074(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1D5375B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose((const void *)(v39 - 160), 8);
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1D53766E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMDRemoteEventRouterProtoMultiHopFetchEventsResponseReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F69F80]);
        [a1 addChangedEvents:v17];
        if (!PBReaderPlaceMark() || (HMEProtoEventInfoReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_1D5381108(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53813D8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5381638(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D538182C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53828F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__171976(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__171977(uint64_t a1)
{
}

void sub_1D5382BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D5383780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5383FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5384834(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5385028(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5386428(_Unwind_Exception *a1)
{
}

void sub_1D5386814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__172304(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__172305(uint64_t a1)
{
}

void sub_1D5388818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5390E94(_Unwind_Exception *exception_object)
{
}

void sub_1D5391024(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5391288(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53913CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53928F8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5392A60(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5392BF4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5392D9C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5392F04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53930AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5393214(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __mapProfilesToProfileUUIDs(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "uniqueIdentifier", (void)v12);
        unsigned int v9 = [v8 UUIDString];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  unint64_t v10 = (void *)[v2 copy];
  return v10;
}

id mapProfilesToAccessoryUUIDs(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v31 = v30 = v3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v3 accessories];
  uint64_t v5 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v10 = v9;
        }
        else {
          unint64_t v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          long long v12 = [v11 mediaProfile];
          long long v13 = v12;
          if (v12)
          {
            long long v14 = [v12 uniqueIdentifier];
            long long v15 = [v14 UUIDString];
            int v16 = [v4 containsObject:v15];

            if (v16)
            {
              uint64_t v17 = [v11 uuid];
              id v18 = [v17 UUIDString];
              [v31 addObject:v18];
            }
          }
        }
        id v19 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v20 = v19;
        }
        else {
          id v20 = 0;
        }
        id v21 = v20;

        if (v21)
        {
          __int16 v22 = [v21 findServiceWithServiceType:@"00000228-0000-1000-8000-0026BB765291"];
          if (v22)
          {
            uint64_t v23 = +[HMDMediaProfile uniqueIdentifierFromAccessory:v21];
            id v24 = [v23 UUIDString];
            int v25 = [v4 containsObject:v24];

            if (v25)
            {
              uint64_t v26 = [v21 uuid];
              id v27 = [v26 UUIDString];
              [v31 addObject:v27];
            }
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }

  uint64_t v28 = (void *)[v31 copy];
  return v28;
}

id mapProfilesToServiceUUIDs(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v22 = a2;
  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v22, "count"));
  v21 = id v20 = v3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [v3 accessories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v10 = v9;
        }
        else {
          unint64_t v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          long long v12 = [v11 findServiceWithServiceType:@"00000228-0000-1000-8000-0026BB765291"];
          if (v12)
          {
            long long v13 = +[HMDMediaProfile uniqueIdentifierFromAccessory:v11];
            long long v14 = [v13 UUIDString];
            int v15 = [v22 containsObject:v14];

            if (v15)
            {
              int v16 = [v12 uuid];
              uint64_t v17 = [v16 UUIDString];
              [v21 addObject:v17];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  id v18 = (void *)[v21 copy];
  return v18;
}

id __mapUUIDsToProfiles(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x1E4F29128]);
        long long v13 = objc_msgSend(v12, "initWithUUIDString:", v11, (void)v17);
        long long v14 = [v3 mediaProfileWithUUID:v13];
        if (v14) {
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  int v15 = (void *)[v5 copy];
  return v15;
}

void sub_1D539881C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D539AB44(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539ACA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539BA68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539BAD8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539CD70(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539CE6C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539CF7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539D388(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539D5BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539D884(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539D994(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539DB80(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539DE08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539E130(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539E1D4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D539E24C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

HMDAccessoryFirmwareUpdateAggregatePolicy *HMDFirmwareUpdatePolicyForAccessory(void *a1, uint64_t a2, void *a3)
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v7 addObject:v5];
  long long v113 = v5;
  long long v117 = v6;
  uint64_t v8 = getBridgedAccessoriesForBridge(v5, v6);
  [v7 addObjectsFromArray:v8];

  long long v118 = [MEMORY[0x1E4F1CA80] set];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id obj = v7;
  uint64_t v116 = [obj countByEnumeratingWithState:&v137 objects:v149 count:16];
  if (v116)
  {
    uint64_t v115 = *(void *)v138;
    uint64_t v120 = a2;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v138 != v115)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v119 = v9;
        id v11 = *(id *)(*((void *)&v137 + 1) + 8 * v9);
        id v12 = v117;
        long long v13 = [MEMORY[0x1E4F1CA80] set];
        v123 = +[HMDHAPMetadata getSharedInstance];
        long long v141 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v144 = 0u;
        id v121 = [v11 services];
        uint64_t v126 = [v121 countByEnumeratingWithState:&v141 objects:v150 count:16];
        if (v126)
        {
          uint64_t v124 = *(void *)v142;
          v125 = v13;
          id v122 = v11;
          v127 = v12;
LABEL_8:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v142 != v124)
            {
              uint64_t v15 = v14;
              objc_enumerationMutation(v121);
              uint64_t v14 = v15;
            }
            uint64_t v128 = v14;
            int v16 = *(void **)(*((void *)&v141 + 1) + 8 * v14);
            if (a2 == 1) {
              break;
            }
            if (a2) {
              goto LABEL_60;
            }
            long long v17 = [*(id *)(*((void *)&v141 + 1) + 8 * v14) serviceType];
            long long v18 = [v11 category];
            long long v19 = [v18 categoryType];
            long long v20 = [v123 stagingPolicyConfigurationForService:v17 category:v19];

            if (!v20)
            {
              id v21 = [v16 serviceType];
              uint64_t v22 = [v123 stagingPolicyConfigurationForService:v21 category:0];
LABEL_17:
              long long v20 = (void *)v22;

              if (!v20)
              {
LABEL_60:
                if ([v16 isCustom])
                {
                  uint64_t v80 = MEMORY[0x1D9452090]();
                  uint64_t v81 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                  {
                    v82 = HMFGetLogIdentifier();
                    v83 = [v16 serviceType];
                    *(_DWORD *)long long buf = 138543618;
                    v152 = v82;
                    __int16 v153 = 2112;
                    v154 = v83;
                    _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_INFO, "%{public}@Skipping policy creation for the custom service: %@", buf, 0x16u);
                  }
                  id v84 = (void *)v80;
                }
                else
                {
                  id v85 = v16;
                  if (isIgnoredServiceForAutoApply_token != -1) {
                    dispatch_once(&isIgnoredServiceForAutoApply_token, &__block_literal_global_175108);
                  }
                  v86 = [v85 accessory];
                  v87 = [v86 cameraProfiles];
                  if (![v87 count])
                  {

LABEL_76:
                    v96 = (void *)MEMORY[0x1D9452090]();
                    v97 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                    {
                      v98 = HMFGetLogIdentifier();
                      uint64_t v99 = [v85 serviceType];
                      *(_DWORD *)long long buf = 138543618;
                      v152 = v98;
                      __int16 v153 = 2112;
                      v154 = v99;
                      _os_log_impl(&dword_1D49D5000, v97, OS_LOG_TYPE_DEBUG, "%{public}@Policy configuration not available for service type: %@", buf, 0x16u);
                    }
                    uint64_t v100 = (void *)MEMORY[0x1E4F1C978];
                    id v101 = v127;
                    id v102 = v11;
                    v103 = [(HMDAccessoryFirmwareUpdatePolicy *)[HMDAccessoryFirmwareUpdateAllowPolicy alloc] initWithAccessory:v102 workQueue:v101];

                    v95 = [v100 arrayWithObject:v103];

                    id v12 = v127;
                    char v94 = v125;
                    goto LABEL_79;
                  }
                  id v88 = (void *)isIgnoredServiceForAutoApply_ignoredServices;
                  v89 = [v85 serviceType];
                  LODWORD(v88) = [v88 containsObject:v89];

                  if (!v88) {
                    goto LABEL_76;
                  }
                  uint64_t v90 = MEMORY[0x1D9452090]();
                  int v91 = HMFGetOSLogHandle();
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
                  {
                    v92 = HMFGetLogIdentifier();
                    v93 = [v85 serviceType];
                    *(_DWORD *)long long buf = 138543618;
                    v152 = v92;
                    __int16 v153 = 2112;
                    v154 = v93;
                    _os_log_impl(&dword_1D49D5000, v91, OS_LOG_TYPE_INFO, "%{public}@Skipping policy creation for the accessory firmware update ignored service: %@", buf, 0x16u);
                  }
                  id v84 = (void *)v90;
                }
                long long v13 = v125;
                goto LABEL_72;
              }
            }
LABEL_18:
            id v26 = v20;
            id v27 = v11;
            id v133 = v127;
            uint64_t v129 = [MEMORY[0x1E4F1CA48] array];
            v134 = v26;
            uint64_t v28 = [v26 criteria];
            uint64_t v29 = [v28 anyUserAtHome];

            if ((v29 & 1) != 0
              || ([v134 criteria],
                  id v30 = objc_claimAutoreleasedReturnValue(),
                  int v31 = [v30 noUserAtHome],
                  v30,
                  v31))
            {
              id v32 = v133;
              id v33 = v27;
              long long v34 = [[HMDAccessoryFirmwareUpdatePresencePolicy alloc] initWithAccessory:v33 presenceNeeded:v29 workQueue:v32];

              if (v34)
              {
                [v129 addObject:v34];
              }
            }
            long long v35 = [v134 criteria];
            int v36 = [v35 checkForScheduledAutomation];

            if (v36)
            {
              id v37 = v133;
              id v38 = v27;
              uint64_t v39 = [(HMDAccessoryFirmwareUpdatePolicy *)[HMDAccessoryFirmwareUpdateTimedAutomationPolicy alloc] initWithAccessory:v38 workQueue:v37];

              if (v39) {
                [v129 addObject:v39];
              }
            }
            long long v147 = 0u;
            long long v148 = 0u;
            long long v145 = 0u;
            long long v146 = 0u;
            unint64_t v40 = [v134 criteria];
            __int16 v41 = [v40 characteristicConfigurations];

            id v131 = v41;
            uint64_t v136 = [v41 countByEnumeratingWithState:&v145 objects:buf count:16];
            if (v136)
            {
              uint64_t v135 = *(void *)v146;
              id v132 = v27;
              do
              {
                uint64_t v42 = 0;
                do
                {
                  if (*(void *)v146 != v135) {
                    objc_enumerationMutation(v131);
                  }
                  __int16 v43 = *(void **)(*((void *)&v145 + 1) + 8 * v42);
                  long long v44 = [v43 format];
                  long long v45 = [v43 values];
                  id v46 = v44;
                  id v47 = v45;
                  if (([v46 isEqualToString:@"BOOL"] & 1) != 0
                    || ([v46 isEqualToString:@"int"] & 1) != 0
                    || [v46 isEqualToString:@"uint8"])
                  {
                    *(void *)&aBlocuint64_t k = MEMORY[0x1E4F143A8];
                    *((void *)&aBlock + 1) = 3221225472;
                    v156 = __characteristicPolicyHandlerForFormat_block_invoke;
                    v157 = &unk_1E6A17BB8;
                    id v158 = v47;
                    long long v48 = _Block_copy(&aBlock);
                  }
                  else
                  {
                    long long v48 = 0;
                  }

                  if (v48)
                  {
                    long long v49 = [v134 type];
                    long long v50 = [v43 type];
                    long long v51 = [v43 settlingTime];
                    id v52 = v27;
                    id v53 = v49;
                    id v54 = v50;
                    id v55 = v51;
                    id v56 = v48;
                    id v57 = v133;
                    if (v55)
                    {
                      uint64_t v58 = [v55 unsignedIntegerValue];
                    }
                    else
                    {
                      id v130 = v52;
                      if (valueDebounceDuration_onceToken != -1) {
                        dispatch_once(&valueDebounceDuration_onceToken, &__block_literal_global_30_175112);
                      }
                      id v62 = [MEMORY[0x1E4F65530] sharedPreferences];
                      uint64_t v63 = [v62 preferenceForKey:@"firmwareUpdateCharacteristicValueDebounceDuration"];
                      __int16 v64 = [v63 numberValue];

                      uint64_t v58 = [v64 unsignedIntValue];
                      id v52 = v130;
                    }
                    id v65 = [[HMDAccessoryFirmwareUpdateCharacteristicBasedPolicy alloc] initWithAccessory:v52 serviceType:v53 characteristicType:v54 debounceDuration:v58 policyHandler:v56 workQueue:v57];

                    if (v65) {
                      [v129 addObject:v65];
                    }

                    id v27 = v132;
                  }
                  else
                  {
                    id v59 = (void *)MEMORY[0x1D9452090]();
                    id v60 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      v61 = HMFGetLogIdentifier();
                      LODWORD(aBlock) = 138543362;
                      *(void *)((char *)&aBlock + 4) = v61;
                      _os_log_impl(&dword_1D49D5000, v60, OS_LOG_TYPE_ERROR, "%{public}@Invalid characteristic policy handler", (uint8_t *)&aBlock, 0xCu);
                    }
                  }

                  ++v42;
                }
                while (v136 != v42);
                uint64_t v66 = [v131 countByEnumeratingWithState:&v145 objects:buf count:16];
                uint64_t v136 = v66;
              }
              while (v66);
            }

            id v67 = [v134 criteria];
            uint64_t v68 = [v67 updateTimeWindow];

            if (v68)
            {
              uint64_t v69 = [v134 criteria];
              long long v70 = [v69 updateTimeWindow];
              id v71 = v133;
              id v72 = v70;
              id v73 = v27;
              id v74 = [[HMDAccessoryFirmwareUpdateTimeWindowPolicy alloc] initWithAccessory:v73 timeWindow:v72 workQueue:v71];

              if (v74) {
                [v129 addObject:v74];
              }
            }
            v75 = [v27 cameraProfiles];
            uint64_t v76 = [v75 count];

            a2 = v120;
            id v11 = v122;
            if (v76)
            {
              id v77 = v133;
              id v78 = v27;
              __int16 v79 = [(HMDAccessoryFirmwareUpdatePolicy *)[HMDAccessoryFirmwareUpdateCameraPolicy alloc] initWithAccessory:v78 workQueue:v77];

              if (v79) {
                [v129 addObject:v79];
              }
            }
            long long v13 = v125;
            [v125 addObjectsFromArray:v129];

LABEL_72:
            id v12 = v127;
            uint64_t v14 = v128 + 1;
            if (v128 + 1 == v126)
            {
              uint64_t v126 = [v121 countByEnumeratingWithState:&v141 objects:v150 count:16];
              if (v126) {
                goto LABEL_8;
              }
              goto LABEL_74;
            }
          }
          long long v23 = [*(id *)(*((void *)&v141 + 1) + 8 * v14) serviceType];
          long long v24 = [v11 category];
          long long v25 = [v24 categoryType];
          long long v20 = [v123 autoApplyPolicyConfigurationForService:v23 category:v25];

          if (v20) {
            goto LABEL_18;
          }
          id v21 = [v16 serviceType];
          uint64_t v22 = [v123 autoApplyPolicyConfigurationForService:v21 category:0];
          goto LABEL_17;
        }
LABEL_74:

        [v13 allObjects];
        v95 = char v94 = v13;
LABEL_79:

        if ([v95 count] == 1)
        {
          long long v104 = [v95 firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            [v118 removeAllObjects];
            char v106 = [v95 firstObject];
            [v118 addObject:v106];

            goto LABEL_85;
          }
        }
        [v118 addObjectsFromArray:v95];

        uint64_t v9 = v119 + 1;
      }
      while (v119 + 1 != v116);
      uint64_t v116 = [obj countByEnumeratingWithState:&v137 objects:v149 count:16];
    }
    while (v116);
  }
LABEL_85:

  id v107 = [v118 allObjects];
  id v108 = v113;
  id v109 = v117;
  if ([v107 count])
  {
    if ([v107 count] == 1)
    {
      long long v110 = [v107 firstObject];
    }
    else
    {
      long long v110 = [[HMDAccessoryFirmwareUpdateAggregatePolicy alloc] initWithPolicies:v107 accessory:v108 workQueue:v109];
    }
    long long v111 = v110;
  }
  else
  {
    long long v111 = 0;
  }

  [(HMDAccessoryFirmwareUpdateAggregatePolicy *)v111 configure];
  return v111;
}

id getBridgedAccessoriesForBridge(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v22 = a2;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 isPrimary])
  {
    id v4 = [v3 identifiersForBridgedAccessories];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      id v6 = [v3 identifiersForBridgedAccessories];
      id v7 = (void *)[v6 copy];

      uint64_t v8 = [v3 home];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = [v8 accessoryWithUUID:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v15 = v14;
            }
            else {
              uint64_t v15 = 0;
            }
            id v16 = v15;
            long long v17 = v16;
            if (v16)
            {
              long long v18 = [v16 bridge];
              int v19 = [v18 isEqual:v3];

              if (v19)
              {
                [v23 addObject:v17];
                long long v20 = getBridgedAccessoriesForBridge(v17, v22);
                [v23 addObjectsFromArray:v20];
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v11);
      }
    }
  }

  return v23;
}

uint64_t __valueDebounceDuration_block_invoke()
{
  return [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2DC9D78 forPreferenceKey:@"firmwareUpdateCharacteristicValueDebounceDuration"];
}

uint64_t __characteristicPolicyHandlerForFormat_block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5) {
    uint64_t v6 = [*(id *)(a1 + 32) containsObject:v5];
  }
  else {
    uint64_t v6 = 1;
  }

  return v6;
}

void __isIgnoredServiceForAutoApply_block_invoke()
{
  id v3 = [MEMORY[0x1E4F65530] sharedPreferences];
  xpc_object_t v0 = [v3 preferenceForKey:@"accessoryFirmwareUpdateAutoApplyIgnoredServices"];
  uint64_t v1 = [v0 value];
  uint64_t v2 = (void *)isIgnoredServiceForAutoApply_ignoredServices;
  isIgnoredServiceForAutoApply_ignoredServices = v1;
}

void sub_1D53A08AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D53A0F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1D53A1394(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D53A4470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D53A5E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__176122(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__176123(uint64_t a1)
{
}

void sub_1D53A7870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__176297(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__176298(uint64_t a1)
{
}

void sub_1D53A8100(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53A8900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__176365(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__176366(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__176719(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__176720(uint64_t a1)
{
}

void sub_1D53AAF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,id a21)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1D53AB374(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1D53AB8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1D53B0E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D53B30D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53B4D8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __modelIDsFromModelIDStrings(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = objc_msgSend(v1, "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v8) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = (void *)[v2 copy];
  return v9;
}

id __accessoriesWithModelIDs(void *a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v28 = a1;
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = [v28 user];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 home];
      if (v6)
      {
        long long v25 = v5;
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v26 = v3;
        id obj = (id)[v3 copy];
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v31;
          uint64_t v27 = v7;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v31 != v10) {
                objc_enumerationMutation(obj);
              }
              long long v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
              long long v13 = [v6 accessoryWithUUID:v12];
              if (v13)
              {
                [v7 addObject:v13];
              }
              else
              {
                long long v14 = (void *)MEMORY[0x1D9452090]();
                id v15 = v28;
                uint64_t v16 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v17 = HMFGetLogIdentifier();
                  long long v18 = [v12 UUIDString];
                  *(_DWORD *)long long buf = 138543874;
                  long long v35 = v17;
                  __int16 v36 = 2112;
                  id v37 = v18;
                  __int16 v38 = 2112;
                  uint64_t v39 = v6;
                  _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with model ID, %@, in home: %@", buf, 0x20u);

                  uint64_t v7 = v27;
                }
              }
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v40 count:16];
          }
          while (v9);
        }

        int v19 = (void *)[v7 copy];
        uint64_t v5 = v25;
        id v3 = v26;
      }
      else
      {
        int v19 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      long long v20 = (void *)MEMORY[0x1D9452090]();
      id v21 = v28;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543362;
        long long v35 = v23;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing user", buf, 0xCu);
      }
      int v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    int v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void sub_1D53B6250(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id __modelIDStringsFromAccessories(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(v1, "copy", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) uuid];
        uint64_t v9 = v8;
        if (v8)
        {
          uint64_t v10 = [v8 UUIDString];
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  long long v11 = (void *)[v2 copy];
  return v11;
}

void sub_1D53B72B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53B7828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53B7C68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53B7E98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53B80D4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53B8398(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53B9E1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53B9F84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BA12C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BA294(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BA430(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BA620(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BA788(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BA930(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BAA98(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BAC40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BADA8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BAF50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BB0B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BB260(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BB3C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __getType(os_unfair_lock_s *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1 + 2;
  uint64_t v2 = a1;
  os_unfair_lock_lock_with_options();
  uint64_t v3 = *(void *)&v2[14]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v1);

  return v3;
}

void sub_1D53BBE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__177785(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__177786(uint64_t a1)
{
}

id __missingElementsFromLeftNotInRight(void *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    uint64_t v5 = (void *)[v3 mutableCopy];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    id v27 = v4;
    id v6 = v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v14 = __itemFromConstraint(v13);
          long long v15 = v14;
          if (v14)
          {
            long long v16 = [v14 identifier];
            [v7 setObject:v13 forKey:v16];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v28 = v3;
    id v17 = v3;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          id v23 = __itemFromConstraint(v22);
          long long v24 = [v23 identifier];
          long long v25 = [v7 objectForKey:v24];

          if (!v25) {
            [v5 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v19);
    }

    id v4 = v27;
    id v3 = v28;
  }

  return v5;
}

id __deepCopiedConstraints(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1C978];
  id v2 = a1;
  id v3 = (void *)[[v1 alloc] initWithArray:v2 copyItems:1];

  return v3;
}

id __itemFromConstraint(void *a1)
{
  id v1 = [a1 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

void sub_1D53BD15C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BDAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_1D53BDC34(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BDD4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BDE1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BE1E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BE36C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BE504(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53BE828(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

BOOL __isConstraintValid(void *a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v6 type];
  if ((unint64_t)(v7 - 1) < 2)
  {
    long long v15 = [v6 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v16 = v15;
    }
    else {
      long long v16 = 0;
    }
    id v17 = v16;

    BOOL v18 = v17 != 0;
    if (v17) {
      goto LABEL_43;
    }
    uint64_t v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = v5;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = HMFGetLogIdentifier();
      [v6 value];
      v23 = long long v45 = a3;
      *(_DWORD *)long long buf = 138543618;
      id v47 = v22;
      __int16 v48 = 2112;
      id v49 = (id)objc_opt_class();
      id v24 = v49;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint value class: %@", buf, 0x16u);

      a3 = v45;
    }

    if (!a3) {
      goto LABEL_43;
    }
    id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
    goto LABEL_41;
  }
  if (v7 == 3)
  {
    id v26 = [v6 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v26;
    }
    else {
      id v27 = 0;
    }
    id v17 = v27;

    if (v17)
    {
      if ([v17 compare:&unk_1F2DC9DC0] == 1)
      {
        BOOL v18 = 1;
LABEL_43:

        goto LABEL_44;
      }
      id v37 = (void *)MEMORY[0x1D9452090]();
      id v38 = v5;
      uint64_t v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        unint64_t v40 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        id v47 = v40;
        __int16 v48 = 2112;
        id v49 = v17;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Invalid step constraint value: %@", buf, 0x16u);
      }
      if (a3)
      {
        uint64_t v34 = 43;
        goto LABEL_40;
      }
    }
    else
    {
      id v28 = (void *)MEMORY[0x1D9452090]();
      id v29 = v5;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v31 = HMFGetLogIdentifier();
        long long v32 = [v6 value];
        *(_DWORD *)long long buf = 138543618;
        id v47 = v31;
        __int16 v48 = 2112;
        id v49 = (id)objc_opt_class();
        id v33 = v49;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint value class: %@", buf, 0x16u);
      }
      if (a3)
      {
        uint64_t v34 = 22;
LABEL_40:
        id v25 = [MEMORY[0x1E4F28C58] hmErrorWithCode:v34];
        BOOL v18 = 0;
LABEL_41:
        *a3 = v25;
        goto LABEL_43;
      }
    }
    BOOL v18 = 0;
    goto LABEL_43;
  }
  if (v7 != 4) {
    goto LABEL_35;
  }
  uint64_t v8 = [v5 type];
  if (v8 == 5)
  {
    long long v35 = [v6 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v36 = v35;
    }
    else {
      long long v36 = 0;
    }
    id v11 = v36;

    if (!v11)
    {
      long long v12 = (void *)MEMORY[0x1D9452090]();
      id v13 = v5;
      long long v14 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
    goto LABEL_34;
  }
  if (v8 != 4)
  {
LABEL_35:
    BOOL v18 = 1;
    goto LABEL_44;
  }
  uint64_t v9 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
LABEL_34:

    goto LABEL_35;
  }
  long long v12 = (void *)MEMORY[0x1D9452090]();
  id v13 = v5;
  long long v14 = HMFGetOSLogHandle();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v42 = HMFGetLogIdentifier();
  __int16 v43 = [v6 value];
  *(_DWORD *)long long buf = 138543618;
  id v47 = v42;
  __int16 v48 = 2112;
  id v49 = (id)objc_opt_class();
  id v44 = v49;
  _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid constraint value class: %@", buf, 0x16u);

LABEL_47:
  if (a3)
  {
    [MEMORY[0x1E4F28C58] hmErrorWithCode:22];
    BOOL v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_44:

  return v18;
}

void sub_1D53C1E24(_Unwind_Exception *a1)
{
}

void sub_1D53C1FE0(_Unwind_Exception *a1)
{
}

void sub_1D53C2050(_Unwind_Exception *a1)
{
}

void sub_1D53C2AC4(_Unwind_Exception *a1)
{
}

void sub_1D53C2F00(_Unwind_Exception *a1)
{
}

void sub_1D53C40D4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C43A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C51F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *a17, id *location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35,id a36)
{
}

void sub_1D53C5890(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C6B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53C6D0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C8590(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C8704(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C88C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C8A3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C8C00(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53C8D74(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D53CDBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__179438(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__179439(uint64_t a1)
{
}

void sub_1D53CEA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D53CF0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D53D10A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1D53D3258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMDEventTriggerExecutionStateAsString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDEventTriggerExecutionState %tu", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E6A17978[a1];
  }
  return v1;
}

void sub_1D53D5268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53D6584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53DA784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53DAD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53DC288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D53E098C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D53E8134(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1D53EF014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL HMDIsEmptyHome(void *a1)
{
  id v1 = a1;
  id v2 = [v1 rooms];
  if ([v2 count])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [v1 accessories];
    if ([v4 count])
    {
      BOOL v3 = 0;
    }
    else
    {
      id v5 = [v1 sharedUsers];
      if ([v5 count])
      {
        BOOL v3 = 0;
      }
      else
      {
        id v6 = [v1 outgoingInvitations];
        BOOL v3 = [v6 count] == 0;
      }
    }
  }
  return v3;
}

void sub_1D53F482C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t identifierForTargetWithUUID(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  do
  {
    id v5 = v4;
    id v6 = (void *)MEMORY[0x1E4F29128];
    uint64_t v7 = [a2 UUIDString];
    v11[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v4 = objc_msgSend(v6, "hm_deriveUUIDFromBaseUUID:withSalts:", v5, v8);

    uint64_t v9 = [v4 hash];
  }
  while (!v9);

  return v9;
}

uint64_t mapTargetCategory(void *a1)
{
  id v1 = a1;
  id v2 = +[HMDHAPMetadata getSharedInstance];
  id v3 = [v1 categoryType];

  id v4 = [v2 categoryForType:v3];

  id v5 = [v4 identifier];
  uint64_t v6 = [v5 unsignedShortValue];

  return v6;
}

id buttonConfigurationAsString(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) shortDescription];
        [v2 appendFormat:@"%@, ", v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = (void *)[v2 copy];
  return v9;
}

void sub_1D53F69FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void logRemoteMessageEvent(void *a1, void *a2, void *a3)
{
  id v22 = a1;
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "hmf_stringForKey:", @"kRemoteMessageAttributedMessageNameKey");
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    objc_msgSend(v22, "hmf_stringForKey:", @"kIDSMessageNameKey");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  long long v11 = objc_msgSend(v22, "hmf_UUIDForKey:", @"kIDSMessageIdentifierKey");
  uint64_t v12 = objc_msgSend(v6, "hmf_stringForKey:", @"kRemoteMessagePeerInformationKey");
  long long v13 = (void *)v12;
  long long v14 = @"Unknown";
  if (v12) {
    long long v14 = (__CFString *)v12;
  }
  long long v15 = v14;

  uint64_t v16 = objc_msgSend(v6, "hmf_numberForKey:", @"kRemoteMessageTransportAttributionKey");
  int v17 = [v16 unsignedIntegerValue];
  BOOL v18 = objc_msgSend(v6, "hmf_numberForKey:", @"kRemoteMessageQoSKey");

  uint64_t v19 = +[HMDMetricsManager sharedLogEventSubmitter];
  LODWORD(v21) = v17;
  id v20 = +[HMDRemoteMessageLogEvent receivedRemoteMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:messageQoS:](HMDRemoteMessageLogEvent, "receivedRemoteMessageName:identifier:transactionIdentifier:messageType:peerInformation:secure:transportType:messageQoS:", v10, v11, v5, 0, v15, 1, v21, [v18 integerValue]);

  [v19 submitLogEvent:v20];
}

id augmentResponseOptions(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    id v5 = a2;
    id v6 = (void *)[v4 mutableCopy];
    [v6 setObject:v5 forKey:@"kRemoteMessageAttributedMessageNameKey"];

    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

uint64_t _pairingCopyIdentity(uint64_t a1, char **a2, _OWORD *a3, _OWORD *a4, void *a5)
{
  uint64_t v8 = a5;
  id v9 = v8;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__182676;
  long long v32 = __Block_byref_object_dispose__182677;
  id v33 = 0;
  if (!v8[23])
  {
    uint64_t v24 = 4294960534;
    goto LABEL_17;
  }
  uint64_t v10 = v8[30];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = ___pairingCopyIdentity_block_invoke;
  v27[3] = &unk_1E6A18690;
  v27[4] = v9;
  v27[5] = &v28;
  dispatch_sync(v10, v27);
  long long v11 = (void *)v29[5];
  if (!v11)
  {
    uint64_t v24 = 4294960569;
    goto LABEL_17;
  }
  if (a2)
  {
    uint64_t v12 = [v11 identifier];
    uint64_t v13 = [v12 lengthOfBytesUsingEncoding:4];

    if (!v13)
    {
      uint64_t v24 = 4294960553;
      goto LABEL_17;
    }
    size_t v14 = v13 + 1;
    long long v15 = (char *)malloc_type_calloc(v13 + 1, 1uLL, 0x100004077774924uLL);
    if (!v15)
    {
      uint64_t v24 = 4294960568;
      goto LABEL_17;
    }
    id v16 = [(id)v29[5] identifier];
    strlcpy(v15, (const char *)[v16 UTF8String], v14);

    *a2 = v15;
  }
  if (a3)
  {
    int v17 = [(id)v29[5] publicKey];
    id v18 = [v17 data];

    if (!v18)
    {
LABEL_18:
      uint64_t v24 = 4294960569;
      goto LABEL_15;
    }
    if ([v18 length] != 32)
    {
LABEL_19:
      uint64_t v24 = 4294960553;
      goto LABEL_15;
    }
    id v19 = v18;
    id v20 = (_OWORD *)[v19 bytes];
    long long v21 = v20[1];
    *a3 = *v20;
    a3[1] = v21;
  }
  if (!a4)
  {
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  id v22 = [(id)v29[5] privateKey];
  id v18 = [v22 data];

  if (!v18) {
    goto LABEL_18;
  }
  if ([v18 length] != 32) {
    goto LABEL_19;
  }
  id v18 = v18;
  id v23 = (_OWORD *)[v18 bytes];
  uint64_t v24 = 0;
  long long v25 = v23[1];
  *a4 = *v23;
  a4[1] = v25;
LABEL_15:

LABEL_17:
  _Block_object_dispose(&v28, 8);

  return v24;
}

void sub_1D53F8D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__182676(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__182677(uint64_t a1)
{
}

void ___pairingCopyIdentity_block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 184);
  id v11 = 0;
  uint64_t v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v11;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to get local pairing identity with error: %@", buf, 0x16u);
    }
  }
}

uint64_t _pairingFindPeer(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  id v7 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__182676;
  id v23 = __Block_byref_object_dispose__182677;
  id v24 = 0;
  if (v7[24])
  {
    id v8 = (void *)[[NSString alloc] initWithBytes:a1 length:a2 encoding:4];
    if (v8)
    {
      id v9 = v7[30];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = ___pairingFindPeer_block_invoke;
      block[3] = &unk_1E6A19A00;
      id v18 = &v19;
      void block[4] = v7;
      id v10 = v8;
      id v17 = v10;
      dispatch_sync(v9, block);

      id v11 = (void *)v20[5];
      if (v11)
      {
        if ([v11 length] == 32)
        {
          uint64_t v12 = (_OWORD *)[ (id) v20[5] bytes];
          uint64_t v13 = 0;
          long long v14 = v12[1];
          *a3 = *v12;
          a3[1] = v14;
        }
        else
        {
          uint64_t v13 = 4294960553;
        }
      }
      else
      {
        uint64_t v13 = 4294960569;
      }
    }
    else
    {
      id v10 = 0;
      uint64_t v13 = 4294960579;
    }
  }
  else
  {
    id v10 = 0;
    uint64_t v13 = 4294960534;
  }
  _Block_object_dispose(&v19, 8);

  return v13;
}

void sub_1D53F907C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___pairingFindPeer_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 192);
  id v12 = 0;
  uint64_t v3 = (*(void (**)(void))(v2 + 16))();
  id v4 = v12;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543874;
      long long v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Find peer %@ failed: %@", buf, 0x20u);
    }
  }
}

void sub_1D54000DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_destroyWeak(v17);
  __HMFActivityScopeLeave();
  objc_destroyWeak((id *)(v18 - 112));
  _Unwind_Resume(a1);
}

void sub_1D5400248(_Unwind_Exception *a1)
{
}

void sub_1D5400B00(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_1D5402E10(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D54041D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__183224(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__183225(uint64_t a1)
{
}

void sub_1D5405DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5406280(_Unwind_Exception *a1)
{
}

void sub_1D5407AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__183423(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__183424(uint64_t a1)
{
}

void sub_1D54082D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540839C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5409780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
}

void sub_1D540A4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D540A9AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540AC3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540ACF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540AE58(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540B01C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540B0E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540B418(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540B5BC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D540D1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D540F730(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D54155F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_1D5415820(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5415A7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5415C24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D54170B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5417230(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMDCameraRecordingAudioCodecTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HMDCameraRecordingAudioCodecTypeAACELD";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingAudioCodecType %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HMDCameraRecordingAudioCodecTypeAACLC";
  }
  return v2;
}

__CFString *HMDCameraRecordingAudioBitRateModeTypeAsString(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"HMDCameraRecordingAudioBitRateModeTypeConstant";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingAudioBitRateModeType %ld", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"HMDCameraRecordingAudioBitRateModeTypeVariable";
  }
  return v2;
}

__CFString *HMDCameraRecordingAudioSampleRateTypeAsString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown HMDCameraRecordingAudioSampleRateType %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E6A18DB8[a1];
  }
  return v1;
}

void sub_1D541D370(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D541D704(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D54207D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id accessoryRequestMapFromRequests(void *a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v48 = a2;
  id v46 = a3;
  id v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v51;
    *(void *)&long long v8 = 138543618;
    long long v45 = v8;
    do
    {
      uint64_t v11 = 0;
      uint64_t v47 = v9;
      do
      {
        if (*(void *)v51 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v50 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "accessory", v45);
        if (v13)
        {
          long long v14 = (void *)v13;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_12;
          }
          uint64_t v15 = v10;
          uint64_t v16 = v6;
          __int16 v17 = [v12 characteristic];
          uint64_t v18 = [v17 type];
          uint64_t v19 = [v12 service];
          id v20 = [v19 type];
          BOOL v21 = +[HMDHAPMetadata isOwnerPrivilegeRequiredForWritingCharacteristicType:v18 serviceType:v20];

          if (v21 && ([v46 isOwner] & 1) == 0)
          {
            id v33 = (void *)MEMORY[0x1D9452090]();
            uint64_t v34 = HMFGetOSLogHandle();
            id v6 = v16;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              long long v35 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = v45;
              id v55 = v35;
              __int16 v56 = 2112;
              id v57 = v12;
              _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, "%{public}@Aborting characteristic write request that requires owner privilege: %@", buf, 0x16u);
            }
            long long v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
            id v37 = +[HMDCharacteristicResponse responseWithRequest:v12 error:v36];

            [v48 addObject:v37];
            uint64_t v10 = v15;
            uint64_t v9 = v47;
          }
          else
          {
            id v22 = [v12 characteristic];
            id v23 = [v22 type];
            id v24 = [v12 service];
            long long v25 = [v24 type];
            BOOL v26 = +[HMDHAPMetadata isAdminPrivilegeRequiredForWritingCharacteristicType:v23 serviceType:v25];

            id v6 = v16;
            uint64_t v10 = v15;
            uint64_t v9 = v47;
            if (!v26 || ([v46 isAdministrator] & 1) != 0)
            {
LABEL_12:
              if (([v14 isPrimary] & 1) == 0)
              {
                uint64_t v27 = [v14 bridge];

                long long v14 = (void *)v27;
              }
              uint64_t v28 = [v6 objectForKey:v14];
              if (!v28)
              {
                uint64_t v28 = [MEMORY[0x1E4F1CA48] array];
                [v6 setObject:v28 forKey:v14];
              }
              [v28 addObject:v12];

              goto LABEL_20;
            }
            id v38 = (void *)MEMORY[0x1D9452090]();
            uint64_t v39 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              unint64_t v40 = HMFGetLogIdentifier();
              *(_DWORD *)long long buf = v45;
              id v55 = v40;
              __int16 v56 = 2112;
              id v57 = v12;
              _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@Aborting characteristic write request that requires admin privilege: %@", buf, 0x16u);
            }
            uint64_t v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:10];
            uint64_t v42 = +[HMDCharacteristicResponse responseWithRequest:v12 error:v41];

            [v48 addObject:v42];
          }
        }
        else
        {
          id v29 = (void *)MEMORY[0x1D9452090]();
          uint64_t v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            long long v31 = HMFGetLogIdentifier();
            *(_DWORD *)long long buf = v45;
            id v55 = v31;
            __int16 v56 = 2112;
            id v57 = v12;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Aborting characteristic request: %@, accessory is nil", buf, 0x16u);
          }
          long long v32 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
          long long v14 = +[HMDCharacteristicResponse responseWithRequest:v12 error:v32];

          [v48 addObject:v14];
        }
LABEL_20:

        ++v11;
      }
      while (v9 != v11);
      uint64_t v43 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      uint64_t v9 = v43;
    }
    while (v43);
  }

  return v6;
}

void sub_1D54249F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D5425EC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D54265BC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1D5426D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __writeRequestsFromRequests_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

void sub_1D5427F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void migrateRequestsPassingTest(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v5 == v6)
  {
    uint64_t v11 = _HMFPreconditionFailure();
    __87__HMDHAPAccessoryPrimaryResidentOperationTask__processLocalRequests_responseWaitGroup___block_invoke_428(v11);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __migrateRequestsPassingTest_block_invoke;
    v12[3] = &unk_1E6A19290;
    id v13 = v7;
    id v8 = v7;
    uint64_t v9 = [v5 indexesOfObjectsPassingTest:v12];
    uint64_t v10 = [v5 objectsAtIndexes:v9];
    [v6 addObjectsFromArray:v10];

    [v5 removeObjectsAtIndexes:v9];
  }
}

uint64_t __migrateRequestsPassingTest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1D54289EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
}

void sub_1D5429788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_1D5429884(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D542992C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D542AEF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMDHTTPClientMessageTransportReset(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 isRunning])
  {
    id v2 = (void *)MEMORY[0x1D9452090]();
    id v3 = v1;
    id v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting", (uint8_t *)&v8, 0xCu);
    }
    id v6 = [v3 client];
    [v6 cancelPendingRequests];

    [v3 _receiveMessage];
    id v7 = [v3 netService];
    [v7 confirmWithTimeout:&__block_literal_global_212_186900 completionHandler:0.0];
  }
}

void sub_1D542B5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D542DCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D542E160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HMDRemoteMessagePayloadKeysForTransportMetadata()
{
  if (HMDRemoteMessagePayloadKeysForTransportMetadata_onceToken != -1) {
    dispatch_once(&HMDRemoteMessagePayloadKeysForTransportMetadata_onceToken, &__block_literal_global_187749);
  }
  xpc_object_t v0 = (void *)HMDRemoteMessagePayloadKeysForTransportMetadata_keys;
  return v0;
}

void __HMDRemoteMessagePayloadKeysForTransportMetadata_block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"kIDSMessageSourceIDKey";
  v2[1] = @"kRemoteMessageIsFinalResponseKey";
  v2[2] = @"kRemoteMessageTransportAttributionKey";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  id v1 = (void *)HMDRemoteMessagePayloadKeysForTransportMetadata_keys;
  HMDRemoteMessagePayloadKeysForTransportMetadata_keys = v0;
}

void sub_1D543E078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D54478B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D5447C14(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1D544820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__190480(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__190481(uint64_t a1)
{
}

void __updateLoggedInAccount(void *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  int v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = v5;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    id v33 = v11;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Posting transaction to update logged in account to %@", buf, 0x16u);
  }
  id v12 = [v9 accessory];
  id v13 = [v12 transactionWithObjectChangeType:2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v14 = v13;
  }
  else {
    long long v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    uint64_t v16 = encodeRootObject();
    [v15 setLoggedInAccount:v16];

    long long v31 = [v12 home];
    __int16 v17 = [v31 backingStore];
    uint64_t v18 = [v7 name];
    +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v19 = v13;
    id v20 = v15;
    id v21 = v9;
    id v22 = v12;
    id v23 = v7;
    v25 = id v24 = v6;
    BOOL v26 = [v17 transaction:v18 options:v25];

    id v6 = v24;
    id v7 = v23;
    id v12 = v22;
    id v9 = v21;
    id v15 = v20;
    id v13 = v19;

    [v26 add:v15 withMessage:v7];
    [v26 run];
  }
  else
  {
    uint64_t v27 = (void *)MEMORY[0x1D9452090]();
    id v28 = v9;
    id v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      id v33 = v30;
      _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Did not obtain apple media accessory model type to update logged in account.", buf, 0xCu);
    }
  }
}

__CFString *HMDMediaDestinationManagerFailureCodeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
  {
    id v2 = NSString;
    id v3 = [NSNumber numberWithUnsignedInteger:a1];
    id v1 = [v2 stringWithFormat:@"failureCode(%@)", v3];
  }
  else
  {
    id v1 = off_1E6A19830[a1 - 1];
  }
  return v1;
}

uint64_t __Block_byref_object_copy__191226(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__191227(uint64_t a1)
{
}

void sub_1D5450510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(v70);
  objc_destroyWeak(&location);
  _Block_object_dispose(&STACK[0x350], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__191465(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__191466(uint64_t a1)
{
}

void sub_1D5451EEC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 256));
  _Unwind_Resume(a1);
}

void sub_1D54526B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, id a15)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a15);
  _Unwind_Resume(a1);
}

uint64_t sub_1D5459708()
{
  return MEMORY[0x1F40E34A0]();
}

uint64_t sub_1D5459718()
{
  return MEMORY[0x1F40E34E8]();
}

uint64_t sub_1D5459728()
{
  return MEMORY[0x1F40E3530]();
}

uint64_t sub_1D5459738()
{
  return MEMORY[0x1F40E3550]();
}

uint64_t sub_1D5459748()
{
  return MEMORY[0x1F40E3590]();
}

uint64_t sub_1D5459758()
{
  return MEMORY[0x1F40E35A8]();
}

uint64_t sub_1D54597C8()
{
  return MEMORY[0x1F40E44F8]();
}

uint64_t sub_1D54597D8()
{
  return MEMORY[0x1F40E4540]();
}

uint64_t sub_1D54597E8()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1D54597F8()
{
  return MEMORY[0x1F40E52E0]();
}

uint64_t sub_1D5459808()
{
  return MEMORY[0x1F40E52F0]();
}

uint64_t sub_1D5459818()
{
  return MEMORY[0x1F40E5388]();
}

uint64_t sub_1D5459828()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_1D5459838()
{
  return MEMORY[0x1F40E53C8]();
}

uint64_t sub_1D5459848()
{
  return MEMORY[0x1F40E53E8]();
}

uint64_t sub_1D5459858()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1D5459868()
{
  return MEMORY[0x1F40E5438]();
}

uint64_t sub_1D5459878()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D5459888()
{
  return MEMORY[0x1F411CA38]();
}

uint64_t sub_1D5459898()
{
  return MEMORY[0x1F411CA40]();
}

uint64_t sub_1D54598A8()
{
  return MEMORY[0x1F411CA48]();
}

uint64_t sub_1D54598B8()
{
  return MEMORY[0x1F411CA50]();
}

uint64_t sub_1D54598C8()
{
  return MEMORY[0x1F411CA58]();
}

uint64_t sub_1D54598D8()
{
  return MEMORY[0x1F411CA60]();
}

uint64_t sub_1D54598E8()
{
  return MEMORY[0x1F411CA68]();
}

uint64_t sub_1D54598F8()
{
  return MEMORY[0x1F411CA70]();
}

uint64_t sub_1D5459908()
{
  return MEMORY[0x1F411CA78]();
}

uint64_t sub_1D5459918()
{
  return MEMORY[0x1F411CA80]();
}

uint64_t sub_1D5459928()
{
  return MEMORY[0x1F411CA88]();
}

uint64_t sub_1D5459938()
{
  return MEMORY[0x1F411CA90]();
}

uint64_t sub_1D5459948()
{
  return MEMORY[0x1F411CA98]();
}

uint64_t sub_1D5459958()
{
  return MEMORY[0x1F411CAA0]();
}

uint64_t sub_1D5459968()
{
  return MEMORY[0x1F411CAA8]();
}

uint64_t sub_1D5459978()
{
  return MEMORY[0x1F411CAB0]();
}

uint64_t sub_1D5459988()
{
  return MEMORY[0x1F411CAB8]();
}

uint64_t sub_1D5459998()
{
  return MEMORY[0x1F411CAC0]();
}

uint64_t sub_1D54599A8()
{
  return MEMORY[0x1F411CAC8]();
}

uint64_t sub_1D54599B8()
{
  return MEMORY[0x1F411CAD0]();
}

uint64_t sub_1D54599C8()
{
  return MEMORY[0x1F411CAD8]();
}

uint64_t sub_1D54599D8()
{
  return MEMORY[0x1F411CAE0]();
}

uint64_t sub_1D54599E8()
{
  return MEMORY[0x1F411CAE8]();
}

uint64_t sub_1D54599F8()
{
  return MEMORY[0x1F411CAF0]();
}

uint64_t sub_1D5459A08()
{
  return MEMORY[0x1F411CAF8]();
}

uint64_t sub_1D5459A18()
{
  return MEMORY[0x1F411CB00]();
}

uint64_t sub_1D5459A28()
{
  return MEMORY[0x1F411CB08]();
}

uint64_t sub_1D5459A38()
{
  return MEMORY[0x1F411CB10]();
}

uint64_t sub_1D5459A48()
{
  return MEMORY[0x1F411CB18]();
}

uint64_t sub_1D5459A58()
{
  return MEMORY[0x1F4122718]();
}

uint64_t sub_1D5459A68()
{
  return MEMORY[0x1F4122720]();
}

uint64_t sub_1D5459A78()
{
  return MEMORY[0x1F4122728]();
}

uint64_t sub_1D5459A88()
{
  return MEMORY[0x1F4122730]();
}

uint64_t sub_1D5459A98()
{
  return MEMORY[0x1F4122738]();
}

uint64_t sub_1D5459AA8()
{
  return MEMORY[0x1F4122740]();
}

uint64_t sub_1D5459AB8()
{
  return MEMORY[0x1F4122748]();
}

uint64_t sub_1D5459AC8()
{
  return MEMORY[0x1F4122750]();
}

uint64_t sub_1D5459AD8()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1D5459AE8()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1D5459AF8()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1D5459B08()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D5459B18()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D5459B28()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D5459B38()
{
  return MEMORY[0x1F4186E28]();
}

uint64_t sub_1D5459B48()
{
  return MEMORY[0x1F4186E60]();
}

uint64_t sub_1D5459B58()
{
  return MEMORY[0x1F4186EF8]();
}

uint64_t sub_1D5459B68()
{
  return MEMORY[0x1F4186F18]();
}

uint64_t sub_1D5459B78()
{
  return MEMORY[0x1F4186F40]();
}

uint64_t sub_1D5459B88()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D5459B98()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D5459BA8()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1D5459BB8()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D5459BC8()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D5459BD8()
{
  return MEMORY[0x1F40E61C8]();
}

uint64_t sub_1D5459BE8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D5459BF8()
{
  return MEMORY[0x1F4183880]();
}

uint64_t sub_1D5459C08()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D5459C18()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D5459C28()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D5459C38()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D5459C48()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D5459C58()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1D5459C68()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D5459C78()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1D5459C88()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D5459C98()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D5459CA8()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D5459CC8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D5459CD8()
{
  return MEMORY[0x1F4187BF8]();
}

uint64_t sub_1D5459CE8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_1D5459CF8()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_1D5459D18()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D5459D28()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D5459D48()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1D5459D68()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1D5459D78()
{
  return MEMORY[0x1F41886D0]();
}

uint64_t sub_1D5459D88()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D5459D98()
{
  return MEMORY[0x1F41886E8]();
}

uint64_t sub_1D5459DA8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D5459DB8()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1D5459DC8()
{
  return MEMORY[0x1F4186FF0]();
}

uint64_t sub_1D5459DD8()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1D5459DE8()
{
  return MEMORY[0x1F41870E0]();
}

uint64_t sub_1D5459DF8()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1D5459E08()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1D5459E18()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D5459E28()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1D5459E38()
{
  return MEMORY[0x1F4184638]();
}

uint64_t sub_1D5459E48()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D5459E58()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D5459E68()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1D5459E78()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1D5459E88()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D5459EA8()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D5459EB8()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D5459EC8()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1D5459ED8()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1D5459EE8()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1D5459EF8()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1D5459F08()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1D5459F18()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1D5459F28()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D5459F38()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D5459F48()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D5459F58()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1D5459F68()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1D5459F78()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1D5459F88()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D5459F98()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D5459FA8()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D5459FB8()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D5459FD8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D5459FE8()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D5459FF8()
{
  return MEMORY[0x1F41852B0]();
}

uint64_t sub_1D545A008()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D545A018()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D545A028()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D545A038()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D545A048()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D545A058()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D545A078()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D545A088()
{
  return MEMORY[0x1F4185B90]();
}

uint64_t sub_1D545A098()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1D545A0A8()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D545A0D8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D545A0E8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D545A0F8()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D545A108()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t AFPreferencesMultiUserCompanionNotificationLanguageCodesForHomePodVersion()
{
  return MEMORY[0x1F410AE10]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1F410CFC8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1F410CFD8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1F410CFE0]();
}

uint64_t CARenderServerGetServerPort()
{
  return MEMORY[0x1F40F4C78]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

uint64_t CFArrayApplyBlock()
{
  return MEMORY[0x1F4115E78]();
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

uint64_t CFDictionaryApplyBlock()
{
  return MEMORY[0x1F4115EA8]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

uint64_t CFPrefs_CopyTypedValue()
{
  return MEMORY[0x1F4115FD8]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1F4115FE8]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1F4116000]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x1F40D8A60](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1F40DA8D0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99C8](url, options);
}

uint64_t CKContainerEnvironmentFromString()
{
  return MEMORY[0x1F40D6280]();
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1F40D6288]();
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1C8](retstr, range, otherRange);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1F40DC1F0](retstr, lhs, rhs);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

uint64_t DMGetUserDataDisposition()
{
  return MEMORY[0x1F41173C8]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x1F4116330]();
}

uint64_t GetPrimaryIPAddress()
{
  return MEMORY[0x1F41163E8]();
}

uint64_t HAPAccessCodeResponseStatusAsString()
{
  return MEMORY[0x1F4113CA0]();
}

uint64_t HAPAccessoryServerDiscoveryMethodToString()
{
  return MEMORY[0x1F4113CA8]();
}

uint64_t HAPAccessoryServerSessionTypesFromString()
{
  return MEMORY[0x1F4113CB0]();
}

uint64_t HAPAccessorySuspendedStateDescription()
{
  return MEMORY[0x1F4113CB8]();
}

uint64_t HAPAuthMethodToString()
{
  return MEMORY[0x1F4113CC0]();
}

uint64_t HAPCommunicationProtocolDescription()
{
  return MEMORY[0x1F4113CC8]();
}

uint64_t HAPCompareStateNumberWithRollover()
{
  return MEMORY[0x1F4113CD0]();
}

uint64_t HAPDataStreamTransportCommandStatusAsString()
{
  return MEMORY[0x1F4113CD8]();
}

uint64_t HAPDateWithTimeIntervalSince1970()
{
  return MEMORY[0x1F4113CE0]();
}

uint64_t HAPDispatchQueueName()
{
  return MEMORY[0x1F4113CE8]();
}

uint64_t HAPEqualInstanceIDs()
{
  return MEMORY[0x1F4113CF0]();
}

uint64_t HAPFirmwareUpdateStateAsString()
{
  return MEMORY[0x1F4113CF8]();
}

uint64_t HAPInstanceIDFromValue()
{
  return MEMORY[0x1F4113D00]();
}

uint64_t HAPIsHH2Enabled()
{
  return MEMORY[0x1F4113D08]();
}

uint64_t HAPLinkLayerTypeDescription()
{
  return MEMORY[0x1F4113D10]();
}

uint64_t HAPLinkTypeDescription()
{
  return MEMORY[0x1F4113D18]();
}

uint64_t HAPOTAProviderStateAsString()
{
  return MEMORY[0x1F4113D20]();
}

uint64_t HAPOperatingStateAbnormalReasonsAsString()
{
  return MEMORY[0x1F4113D28]();
}

uint64_t HAPOperatingStateAsString()
{
  return MEMORY[0x1F4113D30]();
}

uint64_t HAPShortUUIDType()
{
  return MEMORY[0x1F4113D38]();
}

uint64_t HAPStagingNotReadyReasonsAsString()
{
  return MEMORY[0x1F4113D40]();
}

uint64_t HAPStringFromAccessoryServerSession()
{
  return MEMORY[0x1F4113D48]();
}

uint64_t HAPTLVCreateParseArrayToString()
{
  return MEMORY[0x1F4113D50]();
}

uint64_t HAPTLVParseContiguousTlvs()
{
  return MEMORY[0x1F4113D58]();
}

uint64_t HAPTLVParseUInt64()
{
  return MEMORY[0x1F4113D60]();
}

uint64_t HAPUpdateNotReadyReasonsAsString()
{
  return MEMORY[0x1F4113D70]();
}

uint64_t HAPUserPermissionTypeDescription()
{
  return MEMORY[0x1F4113D78]();
}

uint64_t HAPValidateSetupHash()
{
  return MEMORY[0x1F4113D80]();
}

uint64_t HMAccessoryCertificationStatusToString()
{
  return MEMORY[0x1F40E8300]();
}

uint64_t HMAccessoryNetworkProtectionModeAsString()
{
  return MEMORY[0x1F40E8308]();
}

uint64_t HMAccessorySettingConstraintTypeFromString()
{
  return MEMORY[0x1F40E8310]();
}

uint64_t HMAccessorySettingPropertiesFromString()
{
  return MEMORY[0x1F40E8318]();
}

uint64_t HMAccessorySettingPropertiesToString()
{
  return MEMORY[0x1F40E8320]();
}

uint64_t HMAccessorySettingTypeFromString()
{
  return MEMORY[0x1F40E8328]();
}

uint64_t HMAccessorySettingTypeToString()
{
  return MEMORY[0x1F40E8330]();
}

uint64_t HMAccessoryTransportTypesToString()
{
  return MEMORY[0x1F40E8338]();
}

uint64_t HMAccessoryWiFiCredentialTypeAsString()
{
  return MEMORY[0x1F40E8340]();
}

uint64_t HMActionTypeAsString()
{
  return MEMORY[0x1F40E8348]();
}

uint64_t HMAreSnapshotsAllowedForCameraAccessMode()
{
  return MEMORY[0x1F40E8350]();
}

uint64_t HMAssistantAccessControlOptionsToString()
{
  return MEMORY[0x1F40E8358]();
}

uint64_t HMCLAuthorizationStatusAsString()
{
  return MEMORY[0x1F40E8360]();
}

uint64_t HMCLRegionStateAsString()
{
  return MEMORY[0x1F40E8368]();
}

uint64_t HMCacheSubdirectoryWithRelativePath()
{
  return MEMORY[0x1F40E8370]();
}

uint64_t HMCameraAccessModeAsString()
{
  return MEMORY[0x1F40E8378]();
}

uint64_t HMCameraAudioStreamSettingAsString()
{
  return MEMORY[0x1F40E8380]();
}

uint64_t HMCameraHomePresenceAsString()
{
  return MEMORY[0x1F40E8388]();
}

uint64_t HMCameraSignificantEventTypesAsString()
{
  return MEMORY[0x1F40E8390]();
}

uint64_t HMCameraSignificantEventTypesFromReasons()
{
  return MEMORY[0x1F40E8398]();
}

uint64_t HMCameraSupportedFeaturesAsString()
{
  return MEMORY[0x1F40E83A0]();
}

uint64_t HMCreateHomeKitCacheDirectory()
{
  return MEMORY[0x1F40E83A8]();
}

uint64_t HMDLocationAuthorizationAsString()
{
  return MEMORY[0x1F40E83B0]();
}

uint64_t HMDRegionStateString()
{
  return MEMORY[0x1F40E83B8]();
}

uint64_t HMDTaggedLoggingCreateDictionary()
{
  return MEMORY[0x1F4122758]();
}

uint64_t HMDailyRotatedUUID()
{
  return MEMORY[0x1F40E83C0]();
}

uint64_t HMDaysOfTheWeekToDateComponents()
{
  return MEMORY[0x1F40E83D0]();
}

uint64_t HMDispatchQueueNameString()
{
  return MEMORY[0x1F40E83E0]();
}

uint64_t HMDurationsApproximatelyEqual()
{
  return MEMORY[0x1F40E83E8]();
}

uint64_t HMEProtoEventInfoReadFrom()
{
  return MEMORY[0x1F41226E8]();
}

uint64_t HMErrorFromOSStatus()
{
  return MEMORY[0x1F4113D88]();
}

uint64_t HMEventTriggerActivationStateAsString()
{
  return MEMORY[0x1F40E83F0]();
}

uint64_t HMFAreStringsEqualIgnoringCase()
{
  return MEMORY[0x1F411CB20]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x1F411CB28]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x1F411CB30]();
}

uint64_t HMFDataIsReversed()
{
  return MEMORY[0x1F411CB38]();
}

uint64_t HMFDigestAlgorithmToString()
{
  return MEMORY[0x1F411CB48]();
}

uint64_t HMFDispatchQueueName()
{
  return MEMORY[0x1F411CB50]();
}

uint64_t HMFEnabledStatusToString()
{
  return MEMORY[0x1F411CB58]();
}

uint64_t HMFEncodedRootObject()
{
  return MEMORY[0x1F411CB60]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x1F411CB68]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x1F411CB70]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x1F411CB78]();
}

uint64_t HMFMethodDescription()
{
  return MEMORY[0x1F411CB88]();
}

uint64_t HMFOperatingSystemVersionCompare()
{
  return MEMORY[0x1F411CB98]();
}

uint64_t HMFProductClassFromString()
{
  return MEMORY[0x1F411CBA0]();
}

uint64_t HMFProductClassToString()
{
  return MEMORY[0x1F411CBA8]();
}

uint64_t HMFProductColorToString()
{
  return MEMORY[0x1F411CBB0]();
}

uint64_t HMFProductPlatformFromString()
{
  return MEMORY[0x1F411CBB8]();
}

uint64_t HMFProductPlatformToString()
{
  return MEMORY[0x1F411CBC0]();
}

uint64_t HMFQOSClassFromQualityOfService()
{
  return MEMORY[0x1F411CBC8]();
}

uint64_t HMFQualityOfServiceCompare()
{
  return MEMORY[0x1F411CBD0]();
}

uint64_t HMFQualityOfServiceToString()
{
  return MEMORY[0x1F411CBD8]();
}

uint64_t HMFRandomDataWithLength()
{
  return MEMORY[0x1F411CBE0]();
}

uint64_t HMFRandomUInt32()
{
  return MEMORY[0x1F411CBE8]();
}

uint64_t HMFTimeIntervalDescription()
{
  return MEMORY[0x1F411CBF0]();
}

uint64_t HMFUptime()
{
  return MEMORY[0x1F411CBF8]();
}

uint64_t HMF_MESSAGE_BINDING()
{
  return MEMORY[0x1F411CC00]();
}

uint64_t HMHomeAddWalletKeyOptionsDescription()
{
  return MEMORY[0x1F40E83F8]();
}

uint64_t HMHomeKitCacheDirectory()
{
  return MEMORY[0x1F40E8400]();
}

uint64_t HMHomeManagerAreAnyAccessoriesConfigured()
{
  return MEMORY[0x1F40E8408]();
}

uint64_t HMHomeManagerAreAnyAppleTVAccessoriesConfigured()
{
  return MEMORY[0x1F40E8410]();
}

uint64_t HMHomeManagerAreAnySpeakersConfigured()
{
  return MEMORY[0x1F40E8418]();
}

uint64_t HMHomeManagerAreAnyTelevisionAccessoriesConfigured()
{
  return MEMORY[0x1F40E8420]();
}

uint64_t HMHomeManagerConfiguredHomesCount()
{
  return MEMORY[0x1F40E8428]();
}

uint64_t HMHomeManagerCurrentHomeSPIClientIdentifier()
{
  return MEMORY[0x1F40E8430]();
}

uint64_t HMHomeManagerDataSyncStateToString()
{
  return MEMORY[0x1F40E8438]();
}

uint64_t HMHomeManagerNameValidationOptionsToString()
{
  return MEMORY[0x1F40E8440]();
}

uint64_t HMHomeManagerOptionsShortDescription()
{
  return MEMORY[0x1F40E8448]();
}

uint64_t HMHomeManagerOptionsToString()
{
  return MEMORY[0x1F40E8450]();
}

uint64_t HMHomeWalletKeyColorAsString()
{
  return MEMORY[0x1F40E8458]();
}

uint64_t HMINControlHomeIntentShortDescription()
{
  return MEMORY[0x1F40E8460]();
}

uint64_t HMImmutableSettingChangeEventComponentsFromTopic()
{
  return MEMORY[0x1F40E8468]();
}

uint64_t HMImmutableSettingChangeEventTopicFromComponents()
{
  return MEMORY[0x1F40E8470]();
}

uint64_t HMImmutableSettingChangeEventTopicFromComponentsLegacy()
{
  return MEMORY[0x1F40E8478]();
}

uint64_t HMImmutableSettingChangeEventTopicFromMediaSystem()
{
  return MEMORY[0x1F40E8480]();
}

uint64_t HMIsHAPMetadataNeededForHMHomeManagerOptions()
{
  return MEMORY[0x1F40E8488]();
}

uint64_t HMIsMotionDetectionAllowedForCameraAccessMode()
{
  return MEMORY[0x1F40E8490]();
}

uint64_t HMIsRecordingAllowedForCameraAccessMode()
{
  return MEMORY[0x1F40E8498]();
}

uint64_t HMIsStreamingAllowedForCameraAccessMode()
{
  return MEMORY[0x1F40E84A0]();
}

uint64_t HMIsValidRegion()
{
  return MEMORY[0x1F40E84A8]();
}

uint64_t HMIsValidSignificantEvent()
{
  return MEMORY[0x1F40E84B0]();
}

uint64_t HMMLogTagActivityWithError()
{
  return MEMORY[0x1F4122760]();
}

uint64_t HMMSafeHomeUUIDFromLogEvent()
{
  return MEMORY[0x1F4122768]();
}

uint64_t HMMTRUserPrivilegeAsString()
{
  return MEMORY[0x1F41226F8]();
}

uint64_t HMMaxLengthForNaming()
{
  return MEMORY[0x1F40E84B8]();
}

uint64_t HMMediaDestinationControllerSupportOptionsAsString()
{
  return MEMORY[0x1F40E84C0]();
}

uint64_t HMMediaDestinationControllerUpateOptionsAsString()
{
  return MEMORY[0x1F40E84C8]();
}

uint64_t HMMediaDestinationSupportOptionsAsString()
{
  return MEMORY[0x1F40E84D0]();
}

uint64_t HMMediaDestinationTypeAsString()
{
  return MEMORY[0x1F40E84D8]();
}

uint64_t HMMediaSystemRoleTypeAsString()
{
  return MEMORY[0x1F40E84E0]();
}

uint64_t HMNetworkProtectionModeAsString()
{
  return MEMORY[0x1F40E84E8]();
}

uint64_t HMNetworkRouterSupportDisableReasonAsString()
{
  return MEMORY[0x1F40E84F0]();
}

uint64_t HMSettingConstraintTypeToString()
{
  return MEMORY[0x1F40E84F8]();
}

uint64_t HMSettingVersionValueTypeAsString()
{
  return MEMORY[0x1F40E8500]();
}

uint64_t HMSetupAccessoryProgressAsString()
{
  return MEMORY[0x1F40E8508]();
}

uint64_t HMSiriEndpointOnboardingResultAsString()
{
  return MEMORY[0x1F40E8510]();
}

uint64_t HMSiriEndpointProfileSessionStateTypeToString()
{
  return MEMORY[0x1F40E8518]();
}

uint64_t HMSoftwareUpdateAssetSourceAsString()
{
  return MEMORY[0x1F40E8520]();
}

uint64_t HMSoftwareUpdateNeedsAttentionReasonsToString()
{
  return MEMORY[0x1F40E8528]();
}

uint64_t HMSoftwareUpdateStateToString()
{
  return MEMORY[0x1F40E8530]();
}

uint64_t HMSoftwareUpdateUpdateTypeToString()
{
  return MEMORY[0x1F40E8538]();
}

uint64_t HMStringFromCameraClipQuality()
{
  return MEMORY[0x1F40E8540]();
}

uint64_t HMStringFromCameraSignificantEventConfidenceLevel()
{
  return MEMORY[0x1F40E8548]();
}

uint64_t HMStringFromCameraSignificantEventReason()
{
  return MEMORY[0x1F40E8550]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x1F40E8558]();
}

uint64_t HMStringFromIntentRequestType()
{
  return MEMORY[0x1F40E8560]();
}

uint64_t HMUserCameraAccessLevelAsString()
{
  return MEMORY[0x1F40E8568]();
}

uint64_t HMUserDefaultCamerasAccessLevel()
{
  return MEMORY[0x1F40E8570]();
}

uint64_t HMUserIsStreamingAllowedWithCameraAccessLevel()
{
  return MEMORY[0x1F40E8580]();
}

uint64_t HMUserIsValidCameraAccessLevel()
{
  return MEMORY[0x1F40E8588]();
}

uint64_t HMUserPrivilegeToString()
{
  return MEMORY[0x1F40E8590]();
}

uint64_t HMXPCClientEntitlementsShortDescription()
{
  return MEMORY[0x1F40E8598]();
}

uint64_t HM_FEATURE_RVC_DEFAULTS_ENABLED()
{
  return MEMORY[0x1F41226F0]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1F4116578]();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return MEMORY[0x1F4122BA8]();
}

uint64_t IDSCopyIDForBusinessID()
{
  return MEMORY[0x1F4122BC0]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1F4122BD0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1F4122BD8]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1F4122BE0]();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return MEMORY[0x1F4122C00]();
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return MEMORY[0x1F4122C08]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x1F4122C10]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1F40E9100]();
}

uint64_t IXStringForAppRemovability()
{
  return MEMORY[0x1F4124E08]();
}

uint64_t IsAppleTV()
{
  return MEMORY[0x1F41165A8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1F4116630]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MPCAssistantErrorIsInformational()
{
  return MEMORY[0x1F412DAD0]();
}

uint64_t MRAVEndpointCopyLocalizedName()
{
  return MEMORY[0x1F412DAF8]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x1F412DB08]();
}

uint64_t MRAVEndpointCopyUniqueIdentifier()
{
  return MEMORY[0x1F412DB10]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x1F412DB30]();
}

uint64_t MRAVEndpointGetOutputDeviceUIDVolumeControlCapabilities()
{
  return MEMORY[0x1F412DB50]();
}

uint64_t MRAVEndpointSetOutputDeviceUIDVolume()
{
  return MEMORY[0x1F412DBC8]();
}

uint64_t MRAVOutputDeviceCopyModelID()
{
  return MEMORY[0x1F412DC60]();
}

uint64_t MRAVOutputDeviceCopyName()
{
  return MEMORY[0x1F412DC70]();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x1F412DC88]();
}

uint64_t MRAVOutputDeviceSupportsHAP()
{
  return MEMORY[0x1F412DD20]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x1F412DD40]();
}

uint64_t MRAVReconnaissanceSessionCancelSearch()
{
  return MEMORY[0x1F412DD48]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x1F412DD50]();
}

uint64_t MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback()
{
  return MEMORY[0x1F412DD68]();
}

uint64_t MRAVRoutingDiscoverySessionCopyAvailableOutputDevices()
{
  return MEMORY[0x1F412DD70]();
}

uint64_t MRAVRoutingDiscoverySessionCreate()
{
  return MEMORY[0x1F412DD78]();
}

uint64_t MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback()
{
  return MEMORY[0x1F412DD80]();
}

uint64_t MRAVRoutingDiscoverySessionSetDiscoveryMode()
{
  return MEMORY[0x1F412DD88]();
}

uint64_t MREExceptionTypeToString()
{
  return MEMORY[0x1F417CDC0]();
}

uint64_t MRExternalDeviceConnect()
{
  return MEMORY[0x1F412E328]();
}

uint64_t MRExternalDeviceCopyCustomOrigin()
{
  return MEMORY[0x1F412E330]();
}

uint64_t MRExternalDeviceDisconnect()
{
  return MEMORY[0x1F412E348]();
}

uint64_t MRExternalDeviceGetConnectionState()
{
  return MEMORY[0x1F412E350]();
}

uint64_t MRExternalDeviceSetConnectionStateCallback()
{
  return MEMORY[0x1F412E360]();
}

uint64_t MRExternalDeviceSetWantsNowPlayingUpdates()
{
  return MEMORY[0x1F412E368]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x1F412E558]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x1F412E598]();
}

uint64_t MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin()
{
  return MEMORY[0x1F412E5C0]();
}

uint64_t MRMediaRemoteSendCommandForOriginWithReply()
{
  return MEMORY[0x1F412E758]();
}

uint64_t MROriginIsLocalOrigin()
{
  return MEMORY[0x1F412E8B0]();
}

uint64_t MTRSetMessageReliabilityParameters()
{
  return MEMORY[0x1F40ECF28]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1F41307D0]();
}

uint64_t NEHelperCacheClearUUIDs()
{
  return MEMORY[0x1F40C98D0]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1F40C98D8]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x1F40C98F0]();
}

uint64_t NRWatchOSVersion()
{
  return MEMORY[0x1F41306F0]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1F40E6FE0](table);
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1F41166D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1F40E7168]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1F41167B0]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1F40E7278]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t OPACKDecodeBytes()
{
  return MEMORY[0x1F41168B8]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1F41168D0]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1F4147248]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x1F4116918]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x1F4116928]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x1F4116930]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x1F4116990]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1F4116A00]();
}

uint64_t ReportMemoryExceptionFromTask()
{
  return MEMORY[0x1F417CDC8]();
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return (CFArrayRef)MEMORY[0x1F4101D88](store, pattern);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x1F4101E20]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x1F4101E68]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E78](interface);
}

CFStringRef SCNetworkInterfaceGetHardwareAddressString(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101E90](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x1F4101EA0](interface);
}

uint64_t SZArchiverCreateStreamableZip()
{
  return MEMORY[0x1F415C9B0]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40F6E40](key, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6EE0](parameters, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x1F40F6FA8]();
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1F40F7028]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1F40F71D0](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x1F4116AB8]();
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1F415CB60]();
}

uint64_t TLV8BufferAppend()
{
  return MEMORY[0x1F4116B30]();
}

uint64_t TLV8BufferAppendUInt64()
{
  return MEMORY[0x1F4116B38]();
}

uint64_t TLV8BufferFree()
{
  return MEMORY[0x1F4116B48]();
}

uint64_t TLV8BufferInit()
{
  return MEMORY[0x1F4116B50]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x1F4116B58]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x1F4116B68]();
}

uint64_t TLV8GetOrCopyCoalesced()
{
  return MEMORY[0x1F4116B70]();
}

uint64_t TLV8GetUInt64()
{
  return MEMORY[0x1F4116B78]();
}

uint64_t UARPAssetDownloadStatusToString()
{
  return MEMORY[0x1F4115C88]();
}

uint64_t UARPFirmwareStagingCompletionStatusToString()
{
  return MEMORY[0x1F4115C90]();
}

uint64_t UARPFirmwareUpdateAvailabilityStatusToString()
{
  return MEMORY[0x1F4115C98]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1F4116BF8]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1F4116C10]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1F4116C30]();
}

uint64_t WiFiCopyNetworkInfo()
{
  return MEMORY[0x1F4116C38]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1F412FFB0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Exit(int a1)
{
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x1F411CC08]();
}

uint64_t _HMFPreconditionFailureWithFormat()
{
  return MEMORY[0x1F411CC10]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1F4116C88]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CtrXPC::Event::getDataValue(CtrXPC::Event *this)
{
  return MEMORY[0x1F4115C50](this);
}

uint64_t CtrXPC::Event::getName(CtrXPC::Event *this)
{
  return MEMORY[0x1F4115C58](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

uint64_t __HMFActivityScopeLeave()
{
  return MEMORY[0x1F411CC18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40C9F98]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint64_t allowedCharValueTypes()
{
  return MEMORY[0x1F40E85A0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

uint64_t areAnyHomePodMiniConfigured()
{
  return MEMORY[0x1F40E85A8]();
}

uint64_t areAnyHomePodsConfigured()
{
  return MEMORY[0x1F40E85B0]();
}

uint64_t areAnyLargeHomePodConfigured()
{
  return MEMORY[0x1F40E85B8]();
}

uint64_t areHomesConfigured()
{
  return MEMORY[0x1F40E85C0]();
}

uint64_t areIncomingInvitesPresent()
{
  return MEMORY[0x1F40E85C8]();
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1F40CA4C8](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CA530](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cced25519_sign_compat()
{
  return MEMORY[0x1F4116C98]();
}

uint64_t cced25519_verify_compat()
{
  return MEMORY[0x1F4116CA0]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1F40CAE28]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1F40CB158]();
}

uint64_t chacha20_poly1305_decrypt_all_64x64()
{
  return MEMORY[0x1F4116CD0]();
}

uint64_t chacha20_poly1305_decrypt_all_96x32()
{
  return MEMORY[0x1F4116CE0]();
}

uint64_t chacha20_poly1305_encrypt_all_64x64()
{
  return MEMORY[0x1F4116CF0]();
}

uint64_t chacha20_poly1305_encrypt_all_96x32()
{
  return MEMORY[0x1F4116CF8]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1F41814C8](cls, name, imp, types);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1F40CB8D0]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182BD0](strm, *(void *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x1F4182BD8](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182BE0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1F4182BE8](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA20](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA30](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA38](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1F40CBA48](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD58](label);
}

void dispatch_workloop_set_autorelease_frequency(dispatch_workloop_t workloop, dispatch_autorelease_frequency_t frequency)
{
}

uint64_t dispatch_workloop_set_cpupercent()
{
  return MEMORY[0x1F40CBD70]();
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1F40CBD88]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t encodeRootObject()
{
  return MEMORY[0x1F40E85D0]();
}

long double exp2(long double __x)
{
  MEMORY[0x1F40CBFE8](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

uint64_t generateURLForHomeKitObject()
{
  return MEMORY[0x1F40E85D8]();
}

uint64_t getAssistantConfigurationSnapshot()
{
  return MEMORY[0x1F40E85E0]();
}

uint64_t getAssistantConfigurationVersion()
{
  return MEMORY[0x1F40E85E8]();
}

uint64_t getLastSyncedAssistantConfigurationVersion()
{
  return MEMORY[0x1F40E85F0]();
}

uint64_t getLowestError()
{
  return MEMORY[0x1F4122770]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1F40CC410](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

uint64_t hap2LogInitialize()
{
  return MEMORY[0x1F4113D90]();
}

uint64_t hm_assistantIdentifier()
{
  return MEMORY[0x1F40E85F8]();
}

uint64_t hm_assistantIdentifierWithSalts()
{
  return MEMORY[0x1F40E8600]();
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1F40CC680](*(void *)&a1, a2, a3);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t initializeMappingsAndPaths()
{
  return MEMORY[0x1F40E8608]();
}

uint64_t isAllowedCharType()
{
  return MEMORY[0x1F40E8610]();
}

uint64_t isEqualAllowingNil()
{
  return MEMORY[0x1F40E8618]();
}

uint64_t isFeatureMatterLocalFabricConfigEnabled()
{
  return MEMORY[0x1F4122700]();
}

uint64_t isFeatureMatteriPhoneOnlyPairingControlEnabled()
{
  return MEMORY[0x1F4122708]();
}

uint64_t isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
{
  return MEMORY[0x1F4122710]();
}

uint64_t isInternalBuild()
{
  return MEMORY[0x1F40E8620]();
}

uint64_t isPresenceAuthorizationValid()
{
  return MEMORY[0x1F40E8628]();
}

uint64_t isRestoreSupportedForCharacteristic()
{
  return MEMORY[0x1F40E8630]();
}

uint64_t isValidHMSoftwareUpdateAssetSourceString()
{
  return MEMORY[0x1F40E8638]();
}

uint64_t localizationKeyForCharacteristicType()
{
  return MEMORY[0x1F40E8640]();
}

uint64_t localizedWiFiStringKey()
{
  return MEMORY[0x1F40E8648]();
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x1F40CC8A8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x1F40F2870]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_activity_get_label()
{
  return MEMORY[0x1F40F28B8]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1F40F28D0]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1F40F28E8]();
}

uint64_t nw_activity_submit_metrics()
{
  return MEMORY[0x1F40F2900]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

uint64_t nw_connection_reset_traffic_class()
{
  return MEMORY[0x1F40F2C28]();
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x1F40F2C88]();
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_connection_state_to_string()
{
  return MEMORY[0x1F40F2CB8]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x1F40F2D70]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x1F40F2DB0]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x1F40F2DC8]();
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x1F40F2EB0]();
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1F40F3268](interface);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x1F40F35E0]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1F40F35E8]();
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x1F40F3850]();
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1F40F3880]();
}

uint64_t nw_path_get_ipv4_network_signature()
{
  return MEMORY[0x1F40F38E8]();
}

uint64_t nw_path_get_ipv6_network_signature()
{
  return MEMORY[0x1F40F38F0]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1F40F3938](path);
}

BOOL nw_path_has_dns(nw_path_t path)
{
  return MEMORY[0x1F40F3948](path);
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x1F40F3950](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x1F40F3958](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x1F40F3A00](path, *(void *)&interface_type);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

void objc_removeAssociatedObjects(id object)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t playbackStateAsString()
{
  return MEMORY[0x1F40E8650]();
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1F40CD890](*(void *)&pid, *(void *)&flavor, buffer);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1F40CD8D0]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1F40CDCC0](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDF30](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1F40CDF60](__name, __value, *(void *)&__overwrite);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4181FC8](a1);
}

const char *__cdecl sqlite3_bind_parameter_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1F4181FD8](a1, *(void *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_zeroblob(sqlite3_stmt *a1, int a2, int n)
{
  return MEMORY[0x1F4182008](a1, *(void *)&a2, *(void *)&n);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

sqlite3 *__cdecl sqlite3_db_handle(sqlite3_stmt *a1)
{
  return (sqlite3 *)MEMORY[0x1F4182158](a1);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

int sqlite3_get_autocommit(sqlite3 *a1)
{
  return MEMORY[0x1F41821F0](a1);
}

int sqlite3_initialize(void)
{
  return MEMORY[0x1F4182208]();
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t stringToHMSoftwareUpdateAssetSource()
{
  return MEMORY[0x1F40E8658]();
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1F41864D0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1F4186518]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1F41865F0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1F4186710]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1F4186840]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1F4186858]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1F4186860]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1F4186868]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

uint64_t systemResourceUsageLevelAsString()
{
  return MEMORY[0x1F4121C78]();
}

kern_return_t task_generate_corpse(task_read_t task, mach_port_t *corpse_task_port)
{
  return MEMORY[0x1F40CE450](*(void *)&task, corpse_task_port);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t usersListApplicable()
{
  return MEMORY[0x1F40E8660]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1F40CE978](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEA70](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1F40CEB90]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

void xpc_connection_suspend(xpc_connection_t connection)
{
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1F40CEDD8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1F40CEDF0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEE30]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1F40CF2B8](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}