uint64_t isFeatureMatteriPhoneOnlyPairingControlEnabled()
{
  void *v0;
  uint64_t result;
  void *v2;
  uint64_t v3;
  CFStringRef v4;
  void *v5;
  uint64_t v6;
  uint64_t vars8;

  v0 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  if (!isFeatureMatteriPhoneOnlyPairingControlEnabledForTests)
  {
    v2 = [MEMORY[0x263F42620] productInfo];
    v3 = [v2 productClass];

    if (v3 == 3)
    {
      v4 = @"MatteriPhoneOnlyPairingForIPadEnabled";
    }
    else
    {
      v5 = [MEMORY[0x263F42620] productInfo];
      v6 = [v5 productPlatform];

      if (v6 == 1)
      {
        if (_os_feature_enabled_impl()) {
          return CFPreferencesGetAppBooleanValue(@"isHH2Enabled", @"com.apple.homed", 0) != 0;
        }
        v4 = @"MatteriPhoneOnlyPairingForMacEnabled";
      }
      else
      {
        if (_os_feature_enabled_impl()) {
          return CFPreferencesGetAppBooleanValue(@"isHH2Enabled", @"com.apple.homed", 0) != 0;
        }
        v4 = @"MatteriPhoneOnlyPairingEnabled";
      }
    }
    result = CFPreferencesGetAppBooleanValue(v4, @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0);
    if (!result) {
      return result;
    }
    return CFPreferencesGetAppBooleanValue(@"isHH2Enabled", @"com.apple.homed", 0) != 0;
  }
  return [v0 BOOLValue];
}

__CFString *HMMTRAccessoryPairingStepAsString(unint64_t a1)
{
  if (a1 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Undefined HMMTRAccessoryPairingStep %tu", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_265374998[a1];
  }
  return v1;
}

void sub_2524AEE38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524B7730(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524B8220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock)
{
}

void sub_2524BA3F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524BA4A0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524BA50C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524BD2A4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_2524C5000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2524C548C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524C5820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524C5B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524C5D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524C631C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524C6C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_2524C73C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524C9B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_2524CA36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524CA4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524D15E8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 168));
  _Unwind_Resume(a1);
}

void sub_2524D78A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524DCE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2675(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2676(uint64_t a1)
{
}

void sub_2524DD15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524E0ABC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2810(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2811(uint64_t a1)
{
}

void sub_2524E32B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2964(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2965(uint64_t a1)
{
}

void sub_2524E36C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524E50D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524E6F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2524EE3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__3962(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3963(uint64_t a1)
{
}

void sub_2524F1BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
}

id encodeValues(void *a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v1;
    id v3 = v1;
    v4 = (void *)v2;
    id v5 = v3;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v27 = *(void *)v29;
      uint64_t v8 = *MEMORY[0x263F10BB8];
      id v24 = v5;
      uint64_t v26 = *MEMORY[0x263F10BB8];
      do
      {
        uint64_t v9 = 0;
        uint64_t v25 = v7;
        do
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v28 + 1) + 8 * v9);
          v11 = [v10 objectForKeyedSubscript:v8];

          if (v11)
          {
            id v12 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
            id v13 = [v12 objectForKeyedSubscript:v8];
            id v32 = 0;
            uint64_t v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v32];
            id v15 = v32;
            if (v15)
            {
              uint64_t v16 = (void *)MEMORY[0x2533B64D0]();
              v17 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v19 = v18 = v4;
                *(_DWORD *)buf = 138543618;
                v35 = v19;
                __int16 v36 = 2112;
                id v37 = v15;
                _os_log_impl(&dword_252495000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot encode NSError for HMFMessage: %@", buf, 0x16u);

                v4 = v18;
                id v5 = v24;
              }

              id v20 = [MEMORY[0x263EFF8F8] data];
              uint64_t v7 = v25;
            }
            else
            {
              id v20 = v14;
            }

            uint64_t v8 = v26;
            [v12 setObject:v20 forKeyedSubscript:v26];
          }
          else
          {
            id v12 = v10;
          }

          [v4 addObject:v12];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }

    id v21 = [MEMORY[0x263F10DB0] encodeXPCResponseValues:v4];

    id v1 = v23;
  }
  else
  {
    id v21 = v1;
  }

  return v21;
}

id decodeValues(void *a1)
{
  id v1 = decodeValuesKeepingXPCEncoding(a1);
  uint64_t v2 = [MEMORY[0x263F10DB0] decodeXPCResponseValues:v1];

  return v2;
}

id decodeValuesKeepingXPCEncoding(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 count])
  {
    uint64_t v2 = [v1 count];
    uint64_t v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v2];
    id v5 = (void *)v3;
    if (v2)
    {
      uint64_t v6 = 0;
      uint64_t v7 = *MEMORY[0x263F10BB8];
      *(void *)&long long v4 = 138543618;
      long long v25 = v4;
      uint64_t v27 = (void *)v3;
      id v28 = v1;
      uint64_t v26 = v2;
      do
      {
        objc_msgSend(v1, "objectAtIndexedSubscript:", v6, v25);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v9 = [v8 objectForKeyedSubscript:v7];
        if (v9
          && (id v10 = (void *)v9,
              [v8 objectForKeyedSubscript:v7],
              v11 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v11,
              v10,
              (isKindOfClass & 1) != 0))
        {
          id v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
          id v14 = [v13 objectForKeyedSubscript:v7];
          id v15 = (void *)MEMORY[0x263F08928];
          uint64_t v16 = objc_opt_class();
          id v29 = 0;
          v17 = [v15 unarchivedObjectOfClass:v16 fromData:v14 error:&v29];
          id v18 = v29;
          v19 = v17;
          if (v18)
          {
            id v20 = (void *)MEMORY[0x2533B64D0]();
            id v21 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              v22 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v25;
              long long v31 = v22;
              __int16 v32 = 2112;
              v33 = v17;
              _os_log_impl(&dword_252495000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot decode NSError for HMFMessage: %@", buf, 0x16u);
            }
            v19 = v18;
          }
          id v23 = v19;

          [v13 setObject:v23 forKeyedSubscript:v7];
          id v5 = v27;
          id v1 = v28;
          uint64_t v2 = v26;
        }
        else
        {
          id v13 = v8;
        }

        [v5 addObject:v13];
        ++v6;
      }
      while (v2 != v6);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263EFF980] arrayWithArray:v1];
  }

  return v5;
}

void sub_2524F63E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F6738(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F6A20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F8F84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F90EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F919C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F9354(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F95E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F9B8C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524F9F08(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FA08C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FA294(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FA344(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FA4C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FA6B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FA768(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2524FC080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5078(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5079(uint64_t a1)
{
}

void sub_2524FC828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_252501D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

__CFString *HMMTRUserPrivilegeAsString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_265375EB0[a1 - 1];
  }
}

void sub_25250A1E8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5975(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5976(uint64_t a1)
{
}

void sub_25250AE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v46 - 232), 8);
  _Block_object_dispose((const void *)(v46 - 184), 8);
  _Block_object_dispose((const void *)(v46 - 152), 8);
  _Unwind_Resume(a1);
}

id dictionaryFromMatterMetrics(void *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v31 = [MEMORY[0x263EFF9A0] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v33 = v1;
  id obj = [v1 allKeys];
  uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v34)
  {
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v4 = [v33 metricDataForKey:v3];
        id v5 = v4;
        if (v4)
        {
          id v6 = v4;
          id v7 = v3;
          id v35 = v31;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          uint64_t v8 = [&unk_2702B6210 countByEnumeratingWithState:&v40 objects:v45 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v41;
            do
            {
              uint64_t v11 = 0;
              id v12 = v7;
              do
              {
                if (*(void *)v41 != v10) {
                  objc_enumerationMutation(&unk_2702B6210);
                }
                id v7 = [v12 stringByReplacingOccurrencesOfString:*(void *)(*((void *)&v40 + 1) + 8 * v11) withString:@"_"];

                ++v11;
                id v12 = v7;
              }
              while (v9 != v11);
              uint64_t v9 = [&unk_2702B6210 countByEnumeratingWithState:&v40 objects:v45 count:16];
            }
            while (v9);
          }
          id v13 = [v6 value];

          if (v13)
          {
            id v14 = [v7 stringByAppendingString:@"_value"];
            id v15 = [v6 value];
            uint64_t v16 = v35;
            [v35 setObject:v15 forKeyedSubscript:v14];

            v17 = [v6 value];
          }
          else
          {
            v17 = &unk_2702B5688;
            uint64_t v16 = v35;
          }
          id v18 = [v6 errorCode];

          if (v18)
          {
            v19 = [v7 stringByAppendingString:@"_error"];
            id v20 = [v6 errorCode];
            [v16 setObject:v20 forKeyedSubscript:v19];

            uint64_t v21 = [v6 errorCode];

            v17 = (void *)v21;
          }
          v22 = [v6 duration];

          if (v22)
          {
            id v23 = [v7 stringByAppendingString:@"_duration"];
            id v24 = NSNumber;
            long long v25 = [v6 duration];
            [v25 doubleValue];
            uint64_t v27 = [v24 numberWithUnsignedLongLong:(unint64_t)(v26 * 1000.0)];
            [v35 setObject:v27 forKeyedSubscript:v23];

            uint64_t v16 = v35;
          }
          [v16 setObject:v17 forKeyedSubscript:v7];
        }
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v34);
  }

  id v28 = (void *)[v31 copy];
  return v28;
}

void __submitMatterMetrics_block_invoke_2(uint64_t a1)
{
  v28[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v3 = dictionaryFromMatterMetrics(*(void **)(a1 + 32));
  long long v4 = (void *)MEMORY[0x2533B64D0]();
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v27 = (__CFString *)[v3 count];
    LOWORD(v28[0]) = 2112;
    *(void *)((char *)v28 + 2) = v3;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting Matter metric event '%@' to CA with %lu entries: %@ ", buf, 0x2Au);
  }
  uint64_t v8 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __submitMatterMetrics_block_invoke_2;
  v20[3] = &unk_265375F48;
  id v9 = v3;
  id v21 = v9;
  id v10 = v8;
  uint64_t v11 = v20;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  id v12 = (uint64_t (*)(id, void *))getAnalyticsSendEventLazySymbolLoc_ptr;
  long long v25 = getAnalyticsSendEventLazySymbolLoc_ptr;
  if (!getAnalyticsSendEventLazySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
    uint64_t v27 = (__CFString *)&unk_265375F70;
    v28[0] = &v22;
    __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)buf);
    id v12 = (uint64_t (*)(id, void *))v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v12)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  int v13 = v12(v10, v11);

  id v14 = (void *)MEMORY[0x2533B64D0]();
  id v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = HMFGetLogIdentifier();
    v17 = (void *)v16;
    uint64_t v18 = *(void *)(a1 + 40);
    v19 = @"no";
    *(_DWORD *)buf = 138543874;
    if (v13) {
      v19 = @"yes";
    }
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v27 = v19;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Submission of Matter metric event '%@' was: %@", buf, 0x20u);
  }
}

void sub_25250DB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __submitMatterMetrics_block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __CoreAnalyticsLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_265375F90;
    uint64_t v7 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
    if (CoreAnalyticsLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "AnalyticsSendEventLazy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreAnalyticsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreAnalyticsLibraryCore_frameworkLibrary = result;
  return result;
}

void __submitMatterMetrics_block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.matter.metrics", v2);
  id v1 = (void *)submitMatterMetrics_metricsQueue;
  submitMatterMetrics_metricsQueue = (uint64_t)v0;
}

void sub_25250E048(_Unwind_Exception *a1)
{
}

void sub_25250E510(_Unwind_Exception *a1)
{
}

void sub_25251426C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6332(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6333(uint64_t a1)
{
}

void sub_25251C2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_252522428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__6733(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6734(uint64_t a1)
{
}

uint64_t isFeatureMatterLocalFabricConfigEnabled()
{
  dispatch_queue_t v0 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  if (isFeatureMatteriPhoneOnlyPairingControlEnabledForTests
    || (dispatch_queue_t v0 = (void *)isFeatureMatterLocalFabricConfigEnabledForTests) != 0)
  {
    return [v0 BOOLValue];
  }
  else if ((_os_feature_enabled_impl() & 1) != 0 || HM_FEATURE_RVC_DEFAULTS_ENABLED())
  {
    return 1;
  }
  else
  {
    return isFeatureMatteriPhoneOnlyPairingControlEnabled();
  }
}

uint64_t isFeatureMatteriPhoneOnlyPairingControlForIPEnabled()
{
  dispatch_queue_t v0 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  if (isFeatureMatteriPhoneOnlyPairingControlEnabledForTests)
  {
    return [v0 BOOLValue];
  }
  else
  {
    uint64_t result = isFeatureMatteriPhoneOnlyPairingControlEnabled();
    if (result) {
      return (_os_feature_enabled_impl() & 1) != 0
    }
          || CFPreferencesGetAppBooleanValue(@"MatteriPhoneOnlyPairingForIPEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) != 0;
  }
  return result;
}

uint64_t isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
{
  dispatch_queue_t v0 = (void *)isFeatureMatteriPhoneOnlyPairingControlEnabledForTests;
  if (isFeatureMatteriPhoneOnlyPairingControlEnabledForTests)
  {
    return [v0 BOOLValue];
  }
  else
  {
    uint64_t result = isFeatureMatteriPhoneOnlyPairingControlEnabled();
    if (result) {
      return (_os_feature_enabled_impl() & 1) != 0
    }
          || CFPreferencesGetAppBooleanValue(@"ThreadServiceEnabled", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) != 0;
  }
  return result;
}

void sub_2525285B8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_2525289A8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_25252D838(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 144));
  _Unwind_Resume(a1);
}

void sub_252538628(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_25253D744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25253D8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252540CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_25254124C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2525414AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252543284(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252543404(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2525434B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252543748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_2525438E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252543A6C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252543B20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252544904(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_252544A74(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_252545268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7596(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7597(uint64_t a1)
{
}

void sub_25254655C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_25254894C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_252549210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25254A5D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_25254AA94(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_25254B528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_25254C7B8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_25254E294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 192), 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_25254F514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25254FEEC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_25255118C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ReadIntegerWithContextSpecificTag(void *a1, unint64_t *a2, void *a3)
{
  *a3 = 0;
  unint64_t v3 = *a2;
  if (*a2 < 2) {
    return 0;
  }
  id v5 = (unsigned char *)*a1;
  if ((*(unsigned char *)*a1 & 0xE0) != 0x20 || v5[1]) {
    return 0;
  }
  unint64_t v8 = 1;
  int v9 = 1;
  switch(*(unsigned char *)*a1 & 0x1F)
  {
    case 0:
      break;
    case 1:
      goto LABEL_7;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_11;
    case 4:
      int v9 = 0;
      unint64_t v8 = 1;
      break;
    case 5:
      int v9 = 0;
LABEL_7:
      unint64_t v8 = 2;
      break;
    case 6:
      int v9 = 0;
LABEL_9:
      unint64_t v8 = 4;
      break;
    case 7:
      int v9 = 0;
LABEL_11:
      unint64_t v8 = 8;
      break;
    default:
      return 0;
  }
  unint64_t v10 = v8 + 2;
  if (v3 < v8 + 2) {
    return 0;
  }
  LittleEndianNumberFromBytes((uint64_t)(v5 + 2), v8, v9);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  *a1 += v10;
  *a2 -= v10;
  return 1;
}

uint64_t ReadOctetStringWithContextSpecificTag(char **a1, unint64_t *a2, void *a3, unint64_t *a4)
{
  unint64_t v4 = *a2;
  if (*a2 < 2) {
    return 0;
  }
  id v5 = *a1;
  char v6 = **a1;
  if ((v6 & 0xE0) != 0x20) {
    return 0;
  }
  if (v5[1] != 1) {
    return 0;
  }
  unsigned int v7 = (v6 & 0x1F) - 16;
  if (v7 > 3) {
    return 0;
  }
  uint64_t v8 = qword_2525C4150[v7];
  uint64_t v9 = v8 + 2;
  if (v4 < v8 + 2) {
    return 0;
  }
  unint64_t v11 = 0;
  do
    unint64_t v11 = v5[v8-- + 1] | (v11 << 8);
  while (v8);
  unint64_t v12 = v11 + v9;
  if (!__CFADD__(v11, v9) && v4 >= v12)
  {
    *a3 = &v5[v9];
    *a4 = v11;
    *a1 += v12;
    *a2 -= v12;
    return 1;
  }
  return v8;
}

id LittleEndianNumberFromBytes(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v4 = 0;
  int8x8_t v5 = 0;
  int v6 = 0;
  do
  {
    if (v4) {
      BOOL v7 = 0;
    }
    else {
      BOOL v7 = *(char *)(a1 + a2 - 1) < 0;
    }
    int8x8_t v5 = (int8x8_t)(*(unsigned __int8 *)(a1 + a2 - 1 + v4) | (*(void *)&v5 << 8));
    int v8 = v7;
    v6 |= v8;
    --v4;
  }
  while (a2 + v4);
  if ((a3 & v6) == 1)
  {
    if (a2 <= 7)
    {
      unint64_t v9 = (9 - a2) & 0xFFFFFFFFFFFFFFFELL;
      int8x16_t v10 = (int8x16_t)(unint64_t)v5;
      int64x2_t v11 = vaddq_s64(vdupq_n_s64(a2), (int64x2_t)xmmword_2525C4110);
      v12.i64[0] = 255;
      v12.i64[1] = 255;
      int64x2_t v13 = vdupq_n_s64(2uLL);
      do
      {
        int8x16_t v14 = v10;
        int8x16_t v10 = vorrq_s8((int8x16_t)vshlq_u64(v12, (uint64x2_t)vshlq_n_s64(v11, 3uLL)), v10);
        int64x2_t v11 = vaddq_s64(v11, v13);
        v9 -= 2;
      }
      while (v9);
      int8x16_t v15 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64((7 - a2) & 0xFFFFFFFFFFFFFFFELL), (int8x16_t)xmmword_2525C4110), (uint64x2_t)vdupq_lane_s64(7 - a2, 0)), v14, v10);
      int8x8_t v5 = vorr_s8(*(int8x8_t *)v15.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL));
    }
    uint64_t v16 = [NSNumber numberWithLongLong:*(void *)&v5];
  }
  else
  {
    uint64_t v16 = [NSNumber numberWithUnsignedLongLong:*(void *)&v5];
  }
  return v16;
}

void sub_25255CADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t __Block_byref_object_copy__8456(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8457(uint64_t a1)
{
}

void sub_25255D1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_25255DC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_25255ECF8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2525602FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252566AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_252569204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_252569614(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_25256A2EC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25256A3E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25256E568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25256E84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252572630(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_25257303C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252574D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_2525753E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_25257AA8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_25257B24C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_25257CC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose((const void *)(v45 - 240), 8);
  _Block_object_dispose((const void *)(v45 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_25257D320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

void sub_25257EF94(_Unwind_Exception *a1)
{
}

void sub_252584360(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252589DDC(_Unwind_Exception *a1)
{
}

void sub_25258B990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_25258DB20(_Unwind_Exception *a1)
{
}

void sub_25258E2A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_25258F138(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_25258F3B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_25258FA24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25258FF20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_252597A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_252598D74(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_25259D36C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__9208(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9209(uint64_t a1)
{
}

void sub_25259DA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

void sub_25259E584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

void sub_2525A7ECC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2525A8428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__9838(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9839(uint64_t a1)
{
}

void sub_2525B4354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_2525B4A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_2525B5168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_2525B58C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10566(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10567(uint64_t a1)
{
}

void sub_2525B7DB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2525B97F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10758(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10759(uint64_t a1)
{
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t HAPIsInternalBuild()
{
  return MEMORY[0x270F18D20]();
}

uint64_t HAPLinkLayerTypeDescription()
{
  return MEMORY[0x270F18D28]();
}

uint64_t HAPOTAProviderStateAsString()
{
  return MEMORY[0x270F18D38]();
}

uint64_t HMDTaggedLoggingCreateDictionary()
{
  return MEMORY[0x270F3C368]();
}

uint64_t HMErrorFromOSStatus()
{
  return MEMORY[0x270F18DB0]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x270F30818]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x270F30820]();
}

uint64_t HMFDispatchQueueName()
{
  return MEMORY[0x270F30838]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x270F30850]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x270F30858]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x270F30860]();
}

uint64_t HMMLogTagActivityWithErrorAndField()
{
  return MEMORY[0x270F3C378]();
}

uint64_t HM_FEATURE_RVC_DEFAULTS_ENABLED()
{
  return MEMORY[0x270F3C300]();
}

uint64_t MTRDeviceControllerStorageClasses()
{
  return MEMORY[0x270EF5A98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x270EFD9D8](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA40](parameters, error);
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFDA50](key, algorithm, dataToSign, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x270F24838]();
}

uint64_t WiFiCopyNetworkInfo()
{
  return MEMORY[0x270F24840]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x270F30900]();
}

uint64_t _HMFThreadLocalAsyncContextPop()
{
  return MEMORY[0x270F30910]();
}

uint64_t _HMFThreadLocalAsyncContextPush()
{
  return MEMORY[0x270F30918]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x270F24860]();
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
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
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t getLowestError()
{
  return MEMORY[0x270F3C388]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x270EF7AA8](type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return (nw_txt_record_t)MEMORY[0x270EF7AD0](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x270EF7AE0](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x270EF7AF8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

BOOL nw_txt_record_access_key(nw_txt_record_t txt_record, const char *key, nw_txt_record_access_key_t access_value)
{
  return MEMORY[0x270EF95E8](txt_record, key, access_value);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}