void sub_2405ADBD4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_2405ADBF8(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2455EE040]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2405AC000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about addition of primary account: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 32) homeKitConnection];
}

void sub_2405ADD10(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2455EE040]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2405AC000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about primary account deletion : %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 32) homeKitConnection];
}

void sub_2405ADE28(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2455EE040]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2405AC000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about primary account modification : %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 32) homeKitConnection];
}

void sub_2405ADF40(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x2455EE040]();
    id v5 = *(id *)(a1 + 32);
    v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      _os_log_impl(&dword_2405AC000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while notifying homed about primary account change : %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [*(id *)(a1 + 32) homeKitConnection];
}

uint64_t sub_2405AE0EC()
{
  qword_26AFC6EA8 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x270F30820]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x270EDAAD0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

      v33 = ame];
      v34 = HMFEqualObjects();

      if (v34)
      {
        v35 = [MEMORY[0x263F42620] productInfo];
        v36 = [v35 productClass] == 6;

        if (v36)
        {
          v37 = (void *)MEMORY[0x2455EE040]();
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v39 = HMFGetLogIdentifier();
            v40 = [MEMORY[0x263F42610] defaultFormatter];
            v41 = [v40 privateStringForObjectValue:v15];
            v42 = [MEMORY[0x263F42610] defaultFormatter];
            v43 = [v42 privateStringForObjectValue:v49];
            *(_DWORD *)buf = 138543874;
            v60 = v39;
            v61 = 2112;
            v62 = v41;
            v63 = 2112;
            v64 = v43;
            _os_log_impl(&dword_2405AC000, v38, OS_LOG_TYPE_DEBUG, "%{public}@got account username modification newAccount: %@, oldAccount: %@", buf, 0x20u);
          }
          v44 = [(HomeKitAccountNotificationPlugin *)self homeKitConnection];
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = sub_2405ADF40;
          v51[3] = &unk_2650C4290;
          v51[4] = self;
          v52 = v16;
          [v44 notifyAccountStatusUpdate:3 accountIdentifier:0 withCompletionHandler:v51];
        }
      }
    }
  }
}

- (HomeKitAccountNotificationPlugin)init
{
  v3.receiver = self;
  v3.super_class = (Class)HomeKitAccountNotificationPlugin;
  result = [(HomeKitAccountNotificationPlugin *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (id)logCategory
{
  if (qword_26AFC6EA0 != -1) {
    dispatch_once(&qword_26AFC6EA0, &unk_26F4B0868);
  }
  v2 = (void *)qword_26AFC6EA8;
  return v2;
}

@end