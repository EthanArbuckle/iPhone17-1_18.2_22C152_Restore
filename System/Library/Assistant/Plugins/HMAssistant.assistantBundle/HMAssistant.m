void sub_223273410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_223273484(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_223273494(uint64_t a1)
{
}

void sub_22327349C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v8 = [MEMORY[0x263F42608] sharedPreferences];
    v9 = [v8 preferenceForKey:@"dropHomeNamesFromSyncData"];
    char v10 = [v9 BOOLValue];

    v11 = (void *)MEMORY[0x223CB1AD0]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      mach_absolute_time();
      uint64_t v14 = UpTicksToMilliseconds();
      uint64_t v15 = v14 - [WeakRetained fetchHomeConfigurationStartTime];
      v16 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      v29 = v13;
      __int16 v30 = 2048;
      uint64_t v31 = v15;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_223271000, v12, OS_LOG_TYPE_INFO, "%{public}@Finished sync data retrieval refresh in %llu milliseconds - dropping home names from sync data %@", buf, 0x20u);
    }
    v17 = [WeakRetained queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2232737E8;
    block[3] = &unk_2646A4BA8;
    id v22 = v5;
    id v18 = v6;
    char v27 = v10;
    uint64_t v26 = *(void *)(a1 + 48);
    id v23 = v18;
    id v24 = WeakRetained;
    long long v20 = *(_OWORD *)(a1 + 32);
    id v19 = (id)v20;
    long long v25 = v20;
    dispatch_async(v17, block);
  }
}

uint64_t sub_2232736E4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) done];
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x223CB1AD0]();
    v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = HMFGetLogIdentifier();
      int v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_223271000, v4, OS_LOG_TYPE_INFO, "%{public}@homed did not respond", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [*(id *)(a1 + 32) waitGroup];
    dispatch_group_leave(v6);

    return [*(id *)(a1 + 32) setDone:1];
  }
  return result;
}

uint64_t sub_2232737E8(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v61 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x223CB1AD0]();
    v3 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = HMFGetLogIdentifier();
      id v5 = *(void **)(v1 + 32);
      *(_DWORD *)buf = 138543618;
      v57 = v4;
      __int16 v58 = 2112;
      v59 = v5;
      _os_log_impl(&dword_223271000, v3, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve Siri sync data - error %@", buf, 0x16u);
    }
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "hmf_arrayForKey:", @"kSiriSyncDataEntitiesKey");
    if ([v6 count])
    {
      int v7 = getAssistantConfigurationVersion();
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v47 = v6;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
      unint64_t v9 = 0x263F08000uLL;
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v11 = *(void *)v53;
        uint64_t v49 = *MEMORY[0x263F655D0];
        uint64_t v12 = 1;
        uint64_t v48 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v53 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F64938]) initWithDictionary:*(void *)(*((void *)&v52 + 1) + 8 * i)];
            uint64_t v15 = v14;
            if (v14)
            {
              if (*(unsigned char *)(v1 + 80))
              {
                [v14 setHome:0];
                v16 = [v15 entityType];
                int v17 = [v16 isEqual:v49];

                if (v17) {
                  uint64_t v14 = (void *)[v15 setName:0];
                }
              }
              id v18 = (void *)MEMORY[0x223CB1AD0](v14);
              id v19 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                uint64_t v51 = v12;
                unint64_t v20 = v9;
                uint64_t v21 = v1;
                v23 = id v22 = v7;
                objc_msgSend(v15, "hm_shortDescription");
                v25 = uint64_t v24 = v10;
                *(_DWORD *)buf = 138543618;
                v57 = v23;
                __int16 v58 = 2112;
                v59 = v25;
                _os_log_impl(&dword_223271000, v19, OS_LOG_TYPE_INFO, "%{public}@Siri: entity: %@", buf, 0x16u);

                uint64_t v10 = v24;
                int v7 = v22;
                uint64_t v1 = v21;
                unint64_t v9 = v20;
                uint64_t v11 = v48;
                uint64_t v12 = v51;
              }

              uint64_t v26 = [*(id *)(v9 + 2880) stringWithFormat:@"%@:%tu", v7, v12];
              ++v12;
              [*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) addObject:v15];
              [*(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40) addObject:v26];
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
        }
        while (v10);
      }
      else
      {
        uint64_t v12 = 1;
      }

      __int16 v30 = [*(id *)(v9 + 2880) stringWithFormat:@"%@:%tu", v7, v12];
      [*(id *)(v1 + 48) setFinalAnchor:v30];

      uint64_t v31 = (void *)MEMORY[0x223CB1AD0]();
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        uint64_t v34 = [*(id *)(v1 + 48) finalAnchor];
        *(_DWORD *)buf = 138543618;
        v57 = v33;
        __int16 v58 = 2112;
        v59 = v34;
        _os_log_impl(&dword_223271000, v32, OS_LOG_TYPE_INFO, "%{public}@finalAnchor is %@", buf, 0x16u);
      }
      v35 = *(void **)(*(void *)(*(void *)(v1 + 72) + 8) + 40);
      v36 = [*(id *)(v1 + 48) finalAnchor];
      [v35 addObject:v36];

      v37 = *(void **)(v1 + 56);
      v38 = [*(id *)(v1 + 48) finalAnchor];
      [v37 resetWithValidity:v38];

      id v6 = v47;
    }
    else
    {
      char v27 = (void *)MEMORY[0x223CB1AD0]();
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v57 = v29;
        _os_log_impl(&dword_223271000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@No sync entities from homed", buf, 0xCu);
      }
    }
  }
  v39 = (void *)[*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) copy];
  [*(id *)(v1 + 48) setEntities:v39];

  v40 = (void *)[*(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40) copy];
  [*(id *)(v1 + 48) setAnchors:v40];

  uint64_t result = [*(id *)(v1 + 48) done];
  if ((result & 1) == 0)
  {
    v42 = (void *)MEMORY[0x223CB1AD0]();
    id v43 = *(id *)(v1 + 48);
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v57 = v45;
      _os_log_impl(&dword_223271000, v44, OS_LOG_TYPE_INFO, "%{public}@Leaving the dispatch group as it did not time out.", buf, 0xCu);
    }
    v46 = [*(id *)(v1 + 48) waitGroup];
    dispatch_group_leave(v46);

    return [*(id *)(v1 + 48) setDone:1];
  }
  return result;
}

uint64_t sub_2232741D4()
{
  qword_26ABFD980 = HMFCreateOSLogHandle();

  return MEMORY[0x270F9A758]();
}

uint64_t HMDispatchQueueNameString()
{
  return MEMORY[0x270EF3BC8]();
}

uint64_t HMFBooleanToString()
{
  return MEMORY[0x270F30818]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x270F30820]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x270F30858]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x270F30860]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x270F24808]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t getAssistantConfigurationSnapshot()
{
  return MEMORY[0x270EF3E18]();
}

uint64_t getAssistantConfigurationVersion()
{
  return MEMORY[0x270EF3E20]();
}

uint64_t getLastSyncedAssistantConfigurationVersion()
{
  return MEMORY[0x270EF3E28]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}