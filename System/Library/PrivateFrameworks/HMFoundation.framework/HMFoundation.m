__CFString *HMFBooleanToString(int a1)
{
  if (a1) {
    return @"YES";
  }
  else {
    return @"NO";
  }
}

void sub_19D57DB4C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long buf)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    v18 = (void *)MEMORY[0x19F3A87A0]();
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier(0);
      LODWORD(buf) = 138543618;
      *(void *)((char *)&buf + 4) = v20;
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v17;
      _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Exception while searching list (%@)", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x19D57DAD4);
  }
  _Unwind_Resume(a1);
}

uint64_t HMFEqualObjects(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3 == v4)
  {
    uint64_t v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v3;
      id v6 = v4;
      v7 = v6;
      uint64_t v8 = 0;
      if (v5 && v6)
      {
        if (CFNumberIsFloatType((CFNumberRef)v5) || CFNumberIsFloatType((CFNumberRef)v7))
        {
          [v5 floatValue];
          float v10 = v9;
          [v7 floatValue];
          uint64_t v8 = vabds_f32(v10, v11) < 0.00000011921;
        }
        else
        {
          uint64_t v8 = [v5 isEqualToNumber:v7];
        }
      }
    }
    else
    {
      uint64_t v8 = [v3 isEqual:v4];
    }
  }

  return v8;
}

id HMFObjectDescription(void *a1)
{
  uint64_t v1 = qword_1EB4EEE18;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1EB4EEE18, &__block_literal_global_98);
  }
  char v3 = _MergedGlobals_75;
  id v4 = +[HMFPreferences sharedPreferences];
  id v5 = [v4 preferenceForKey:@"shouldLogPrivateInformation"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    char v7 = v3;
  }
  else {
    char v7 = v3 | 2;
  }
  uint64_t v8 = HMFObjectDescriptionWithOptions(v2, v7);

  return v8;
}

void sub_19D57DFD4(_Unwind_Exception *a1)
{
}

void sub_19D57E3D4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMFGetLogIdentifier(void *a1)
{
  id v1 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v2 = NSString;
    char v3 = [v1 logIdentifier];
    id v4 = [v2 stringWithFormat:@"[%@] ", v3];
  }
  else
  {
    id v4 = &stru_1EEF0F5E0;
  }

  return v4;
}

id HMFAttributeDescriptionDescriptionWithOptions(void *a1, char a2)
{
  id v3 = a1;
  id v4 = v3;
  if (!v3)
  {
    v16 = 0;
    goto LABEL_27;
  }
  id v5 = NSString;
  int v6 = [v3 name];
  id v7 = v4;
  uint64_t v8 = [v7 value];
  if (!v8)
  {
    v14 = 0;
    goto LABEL_26;
  }
  if ((a2 & 2) != 0)
  {
    v22 = v5;
    id v9 = v7;
    float v10 = [v9 value];
    float v11 = [v9 formatter];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0
      || ([v9 formatter],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 privateStringForObjectValue:v10],
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v14))
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [v10 privateDescription];
LABEL_12:
        v14 = (__CFString *)v15;
        goto LABEL_16;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = [v10 redactedDescription];
        goto LABEL_12;
      }
      if (v12) {
        v14 = @"<private>";
      }
      else {
        v14 = 0;
      }
    }
LABEL_16:

    id v5 = v22;
    if (v14) {
      goto LABEL_26;
    }
  }
  if ((a2 & 1) == 0)
  {
LABEL_22:
    v18 = [v7 formatter];
    v19 = [v18 stringForObjectValue:v8];

    if (v19)
    {
      v20 = v19;
    }
    else
    {
      v20 = [v8 description];
    }
    v14 = v20;

    goto LABEL_26;
  }
  id v17 = [v7 value];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_22;
  }
  v14 = [v17 shortDescription];

  if (!v14) {
    goto LABEL_22;
  }
LABEL_26:

  v16 = [v5 stringWithFormat:@"%@: %@", v6, v14];

LABEL_27:
  return v16;
}

void sub_19D57E94C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMFLocationAuthorizationInitialize(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __HMFLocationAuthorizationCreateQueue(v1);
  Class isa = v1[8].isa;
  v1[8].Class isa = (Class)v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  Class v5 = v1[5].isa;
  v1[5].Class isa = (Class)v4;

  uint64_t v6 = +[HMFScheduler defaultScheduler];
  Class v7 = v1[2].isa;
  v1[2].Class isa = (Class)v6;
}

dispatch_queue_t __HMFLocationAuthorizationCreateQueue(NSObject *a1)
{
  dispatch_queue_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    id v3 = (const char *)HMFDispatchQueueName(v1, 0);
    dispatch_queue_t v1 = dispatch_queue_create(v3, v2);
  }
  return v1;
}

uint64_t HMFDispatchQueueName(void *a1, void *a2)
{
  id v3 = NSString;
  uint64_t v4 = a2;
  id v5 = a1;
  uint64_t v6 = (objc_class *)objc_opt_class();
  Class v7 = NSStringFromClass(v6);
  if (v4) {
    uint64_t v8 = @".";
  }
  else {
    uint64_t v8 = &stru_1EEF0F5E0;
  }
  if (v4) {
    id v9 = v4;
  }
  else {
    id v9 = &stru_1EEF0F5E0;
  }
  uint64_t v10 = [v5 hash];

  float v11 = [v3 stringWithFormat:@"com.apple.HMFoundation.%@%@%@.%tu", v7, v8, v9, v10];

  id v12 = v11;
  uint64_t v13 = [v12 UTF8String];

  return v13;
}

uint64_t SetupAssistantLibraryCore()
{
  if (!SetupAssistantLibraryCore_frameworkLibrary) {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return SetupAssistantLibraryCore_frameworkLibrary;
}

uint64_t getBYSetupAssistantFinishedDarwinNotification()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  uint64_t v7 = getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr;
  if (!getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr)
  {
    dispatch_queue_t v1 = (void *)SetupAssistantLibrary();
    v5[3] = (uint64_t)dlsym(v1, "BYSetupAssistantFinishedDarwinNotification");
    getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    id v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v0 = SetupAssistantLibraryCore();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_19D58099C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D580B4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D580E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D580FB0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5822E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D582874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_unfair_lock_t lock)
{
}

void __NSUUIDCreateUUIDVersion5(uint64_t a1, void *a2, void *a3, void *a4)
{
  data[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  memset(&c, 0, sizeof(c));
  data[0] = 0;
  data[1] = 0;
  [a2 getUUIDBytes:data];
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, data, 0x10u);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = v14;
          CC_SHA1_Update(&c, (const void *)objc_msgSend(v15, "UTF8String", (void)v17), objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  if (v7)
  {
    id v16 = v7;
    CC_SHA1_Update(&c, (const void *)[v16 bytes], objc_msgSend(v16, "length"));
  }
  CC_SHA1_Final(md, &c);
  *(_OWORD *)a1 = *(_OWORD *)md;
  *(unsigned char *)(a1 + 6) = *(unsigned char *)(a1 + 6) & 0xF | 0x50;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 8) & 0x3F | 0x80;
}

uint64_t __disabledDueToParent(void *a1)
{
  dispatch_queue_t v1 = [a1 parent];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __HMFActivityBegin(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v1 = a1;
  uint64_t v2 = v1;
  if (v1[48])
  {
    BOOL v20 = 0;
    uint64_t v3 = __HMFActivityGetCurrentThreadContext(v1, &v20);
    uint64_t v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = v2;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v7 = HMFGetLogIdentifier(v5);
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      __int16 v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Beginning activity in context: %@", buf, 0x16u);
    }
    if (!v20)
    {
      if (v5[2])
      {
        id v8 = (void *)MEMORY[0x19F3A87A0]();
        id v9 = v5;
        uint64_t v10 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = HMFGetLogIdentifier(v9);
          id v12 = v9[2];
          *(_DWORD *)buf = 138543618;
          v22 = v11;
          __int16 v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Adopting voucher: %@", buf, 0x16u);
        }
        id v13 = v9[2];
        v14 = (void *)voucher_adopt();
        [v3 setVoucher:v14];

        [v3 setShouldRestoreVoucher:1];
      }
      [v5[3] addObject:v3];
    }
    objc_msgSend(v3, "setCount:", objc_msgSend(v3, "count") + 1);
  }
  else
  {
    id v15 = (void *)MEMORY[0x19F3A87A0]();
    id v16 = v2;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = HMFGetLogIdentifier(v16);
      long long v19 = (void *)v16[9];
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      __int16 v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_ERROR, "%{public}@Beginning an invalidated activity is prohibited: %@", buf, 0x16u);
    }
  }
}

void sub_19D5833B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, os_unfair_lock_t lock)
{
}

id HMFGetOSLogHandle()
{
  uint64_t v0 = objc_opt_class();
  if (objc_opt_respondsToSelector()) {
    [v0 logCategory];
  }
  else {
  dispatch_queue_t v1 = HMFGetDefaultOSLogHandle();
  }
  return v1;
}

id HMFGetDefaultOSLogHandle()
{
  if (_MergedGlobals_65 != -1) {
    dispatch_once(&_MergedGlobals_65, &__block_literal_global_33);
  }
  uint64_t v0 = (void *)qword_1EB4EED60;
  return v0;
}

void __HMFActivityEnd(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  BOOL v12 = 0;
  uint64_t v2 = __HMFActivityGetCurrentThreadContext(v1, &v12);
  if (v12)
  {
    uint64_t v3 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v4 = (id *)v1;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      *(_DWORD *)buf = 138543618;
      v14 = v6;
      __int16 v15 = 2112;
      id v16 = v2;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Ending activity in context: %@", buf, 0x16u);
    }
    if ([v2 count]) {
      objc_msgSend(v2, "setCount:", objc_msgSend(v2, "count") - 1);
    }
    if (![v2 count])
    {
      if ([v2 shouldRestoreVoucher])
      {
        id v7 = (void *)MEMORY[0x19F3A87A0]();
        id v8 = v4;
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = HMFGetLogIdentifier(v8);
          uint64_t v11 = [v2 voucher];
          *(_DWORD *)buf = 138543618;
          v14 = v10;
          __int16 v15 = 2112;
          id v16 = v11;
          _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Restoring voucher: %@", buf, 0x16u);
        }
        [v2 voucher];
        objc_claimAutoreleasedReturnValue();
      }
      [v4[3] removeObject:v2];
    }
  }
}

id __HMFActivityGetCurrentThreadContext(void *a1, BOOL *a2)
{
  if (a1)
  {
    uint64_t v3 = a1;
    uint64_t v4 = +[__HMFThreadContext currentContext];
    id v5 = (void *)v3[3];

    uint64_t v6 = [v5 member:v4];
    id v7 = (void *)v6;
    if (v6) {
      id v8 = (void *)v6;
    }
    else {
      id v8 = v4;
    }
    if (a2) {
      *a2 = v6 != 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

void sub_19D583D14(_Unwind_Exception *a1)
{
}

void sub_19D584208(_Unwind_Exception *a1)
{
}

void sub_19D5844F8(_Unwind_Exception *a1)
{
}

id HMFObjectDescriptionWithOptions(void *a1, char a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x19F3A87A0]();
    if (objc_opt_respondsToSelector())
    {
      id v5 = [v3 attributeDescriptions];
      if (objc_msgSend(v5, "hmf_isEmpty"))
      {
        uint64_t v6 = &stru_1EEF0F5E0;
      }
      else if ((a2 & 2) != 0)
      {
        id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v14 = v5;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = [*(id *)(*((void *)&v29 + 1) + 8 * i) privateDescription];
              [v13 addObject:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v16);
        }

        BOOL v20 = [v13 componentsJoinedByString:@", "];
        objc_msgSend(@", ", "stringByAppendingString:", v20);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v12 = [v5 componentsJoinedByString:@", "];
        objc_msgSend(@", ", "stringByAppendingString:", v12);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      if ((a2 & 2) != 0)
      {
        id v8 = (void *)MEMORY[0x19F3A87A0]();
        id v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v10 = HMFGetLogIdentifier(0);
          uint64_t v11 = [v3 shortDescription];
          *(_DWORD *)buf = 138543618;
          v34 = v10;
          __int16 v35 = 2112;
          v36 = v11;
          _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Attempting to privately log legacy attribute description for object: %@", buf, 0x16u);
        }
      }
      uint64_t v6 = [v3 propertyDescription];
    }
    else
    {
      uint64_t v6 = &stru_1EEF0F5E0;
    }
    v21 = [(__CFString *)v6 stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

    v22 = [v21 stringByReplacingOccurrencesOfString:@"\\t" withString:@"\t"];

    __int16 v23 = [v22 stringByReplacingOccurrencesOfString:@"\\"" withString:&stru_1EEF0F5E0];

    v24 = NSString;
    uint64_t v25 = [(id)objc_opt_class() shortDescription];
    v26 = (void *)v25;
    if ((a2 & 4) != 0)
    {
      id v7 = [v24 stringWithFormat:@"<%@%@%@>", v25, &stru_1EEF0F5E0, v23];
    }
    else
    {
      v27 = objc_msgSend(NSString, "stringWithFormat:", @" %p", v3);
      id v7 = [v24 stringWithFormat:@"<%@%@%@>", v26, v27, v23];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __HMFActivityInvalidate(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = HMFGetOSLogHandle();
  BOOL v3 = os_signpost_enabled(v2);

  if (v3)
  {
    uint64_t v4 = HMFGetOSLogHandle();
    os_signpost_id_t v17 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    id v5 = (void *)v1[7];
    uint64_t v6 = v1;
    [v5 getUUIDBytes:buf];
    id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:buf length:16 freeWhenDone:0];

    objc_msgSend(v7, "getBytes:range:", &v17, objc_msgSend(v7, "length") - 8, 8);
    os_signpost_id_t v8 = v17;
    if (os_signpost_enabled(v4))
    {
      if (v8 + 1 >= 2) {
        os_signpost_id_t v9 = v8;
      }
      else {
        os_signpost_id_t v9 = 0xEEEEB0B5B2B2EEEELL;
      }
      uint64_t v10 = v6[7];
      uint64_t v11 = v6[9];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_signpost_emit_with_name_impl(&dword_19D57B000, v4, OS_SIGNPOST_INTERVAL_END, v9, "HMFActivity", "Identifier = %@, Name = %@", buf, 0x16u);
    }
  }
  BOOL v12 = (void *)MEMORY[0x19F3A87A0]();
  id v13 = v1[1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = ____HMFActivityInvalidate_block_invoke;
  v15[3] = &unk_1E5957698;
  id v14 = v1;
  id v16 = v14;
  os_activity_apply(v13, v15);

  __HMFActivityEnd(v14);
}

void __HMFObjectDefaultDescriptionOptions_block_invoke()
{
  id v0 = +[HMFProductInfo productInfo];
  _MergedGlobals_75 = 4 * ([v0 productVariant] != 3);
}

uint64_t HMFMethodDescription()
{
  return MEMORY[0x1F40E7358]();
}

void sub_19D588E3C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D588EE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5890EC(_Unwind_Exception *exception_object)
{
  if (v1) {
    [v1 end];
  }
  _Unwind_Resume(exception_object);
}

void sub_19D58956C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D589650(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5896C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void *__HMFActivityScopeLeave(void *result)
{
  if (result)
  {
    result = (void *)*result;
    if (result) {
      return (void *)[result end];
    }
  }
  return result;
}

double HMFUptime()
{
  return (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0;
}

__CFString *HMFQualityOfServiceToString(uint64_t a1)
{
  if (a1 <= 16)
  {
    if (a1 == -1) {
      return @"Default";
    }
    if (a1 == 9) {
      return @"Background";
    }
  }
  else
  {
    switch(a1)
    {
      case 17:
        return @"Utility";
      case 25:
        return @"User Initiated";
      case 33:
        return @"User Interactive";
    }
  }
  return @"Unknown";
}

uint64_t HMFQOSClassFromQualityOfService(uint64_t a1)
{
  if (a1 == -1) {
    int v1 = 21;
  }
  else {
    int v1 = 0;
  }
  if (a1 <= 8) {
    int v2 = v1;
  }
  else {
    int v2 = 9;
  }
  if (a1 <= 16) {
    int v3 = v2;
  }
  else {
    int v3 = 17;
  }
  if (a1 <= 24) {
    unsigned int v4 = v3;
  }
  else {
    unsigned int v4 = 25;
  }
  if (a1 <= 32) {
    return v4;
  }
  else {
    return 33;
  }
}

void sub_19D58AB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HMFProductPlatformFromString(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"Mac OS X"] & 1) != 0
    || ([v1 isEqualToString:@"macOS"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"iPhone OS"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"Watch OS"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"Apple TVOS"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"xrOS"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_19D58C278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  os_unfair_lock_unlock(v18);
  _Unwind_Resume(a1);
}

uint64_t CoreLocationLibraryCore()
{
  if (!CoreLocationLibraryCore_frameworkLibrary) {
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CoreLocationLibraryCore_frameworkLibrary;
}

uint64_t CoreLocationLibraryCore_0()
{
  if (!CoreLocationLibraryCore_frameworkLibrary_0) {
    CoreLocationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  return CoreLocationLibraryCore_frameworkLibrary_0;
}

void sub_19D58CE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D58D078(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D58D4A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCLLocationManagerClass_softClass;
  uint64_t v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_1E5957BB0;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_19D58D670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D58D8A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  if (!CoreLocationLibraryCore())
  {
    int v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = abort_report_np();
    return (Class)__getCLLocationManagerClass_block_invoke_0(v4);
  }
  return result;
}

Class __getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  if (!CoreLocationLibraryCore_0())
  {
    int v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("CLLocationManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = (void *)abort_report_np();
    return (Class)__HMFLocationAuthorizationHandleAuthorizationStatus(v4, v5);
  }
  return result;
}

uint64_t __HMFLocationAuthorizationHandleAuthorizationStatus(void *a1, int a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    if ((a2 - 3) < 2)
    {
      [v3 finish];
    }
    else
    {
      if ((a2 - 1) > 1)
      {
        uint64_t v6 = 1;
        goto LABEL_7;
      }
      int v5 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
      [v4 cancelWithError:v5];
    }
  }
  uint64_t v6 = 0;
LABEL_7:

  return v6;
}

void ____activateIfNecessary_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "__handleExpiration");
}

void sub_19D58E460(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D58ED48(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D58EDEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D58EE54(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D58EEBC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __suspend(void *a1)
{
  if (a1[6] == 2)
  {
    uint64_t v2 = a1;
    id v1 = [v2 timer];
    dispatch_suspend(v1);

    v2[6] = 1;
  }
}

void __resume(void *a1)
{
  id v3 = a1;
  __activateIfNecessary(v3);
  __kick(v3);
  id v1 = v3;
  if (v3[6] == 1)
  {
    uint64_t v2 = [v3 timer];
    dispatch_resume(v2);

    id v1 = v3;
    v3[6] = 2;
  }
}

void __kick(void *a1)
{
  os_signpost_id_t v8 = a1;
  char v1 = [(uint64_t *)v8 options];
  int64_t v2 = (uint64_t)(*((double *)v8 + 4) * 1000000000.0);
  if (v1) {
    dispatch_time_t v3 = dispatch_walltime(0, v2);
  }
  else {
    dispatch_time_t v3 = dispatch_time(0, v2);
  }
  dispatch_time_t v4 = v3;
  int v5 = [(uint64_t *)v8 timer];
  dispatch_source_set_timer(v5, v4, 0xFFFFFFFFFFFFFFFFLL, v8[5]);

  uint64_t v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:*((double *)v8 + 4)];
  uint64_t v7 = (void *)v8[7];
  v8[7] = v6;
}

void __activateIfNecessary(void *a1)
{
  int64_t v2 = a1;
  dispatch_time_t v3 = (id *)v2;
  if (!v2[9])
  {
    dispatch_time_t v4 = v2[2];
    dispatch_queue_t v5 = v4;
    if (!v4)
    {
      uint64_t v6 = (const char *)HMFDispatchQueueName(v2, 0);
      char v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v5 = dispatch_queue_create(v6, v1);
    }
    objc_storeStrong(v3 + 3, v5);
    if (!v4)
    {
    }
    objc_initWeak(&location, v3);
    if (((_BYTE)v3[10] & 0x10) != 0)
    {
      dispatch_qos_class_t v8 = QOS_CLASS_USER_INITIATED;
    }
    else
    {
      qos_class_t v7 = qos_class_self();
      if (v7 <= QOS_CLASS_UTILITY) {
        dispatch_qos_class_t v8 = QOS_CLASS_UTILITY;
      }
      else {
        dispatch_qos_class_t v8 = v7;
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = ____activateIfNecessary_block_invoke;
    v12[3] = &unk_1E59576C0;
    objc_copyWeak(&v13, &location);
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v12);
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v3[3]);
    id v11 = v3[9];
    v3[9] = v10;

    dispatch_source_set_event_handler((dispatch_source_t)v3[9], v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void sub_19D58F294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_19D58FA24(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __HMFGetDefaultOSLogHandle_block_invoke()
{
  qword_1EB4EED60 = HMFCreateOSLogHandle(@"default", @"com.apple.HomeKit");
  return MEMORY[0x1F41817F8]();
}

os_log_t HMFCreateOSLogHandle(void *a1, id a2)
{
  id v3 = a2;
  id v4 = a1;
  dispatch_queue_t v5 = (const char *)[v3 UTF8String];
  id v6 = v4;
  qos_class_t v7 = (const char *)[v6 UTF8String];

  os_log_t v8 = os_log_create(v5, v7);
  return v8;
}

void __HMFLocationAuthorizationStopMonitoring(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    os_unfair_lock_lock_with_options();
    if (objc_msgSend(*((id *)v1 + 5), "hmf_isEmpty"))
    {
      int64_t v2 = (void *)MEMORY[0x19F3A87A0]();
      id v3 = v1;
      HMFGetOSLogHandle();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        dispatch_queue_t v5 = HMFGetLogIdentifier(v3);
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v5;
        _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Stop monitoring", buf, 0xCu);
      }
      id v6 = (void *)v3[11];
      if (v6)
      {
        id v7 = v6;
        os_log_t v8 = (void *)v3[11];
        v3[11] = 0;

        dispatch_time_t v9 = dispatch_time(0, 1000000000);
        dispatch_source_t v10 = v3[8];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ____HMFLocationAuthorizationStopMonitoring_block_invoke;
        block[3] = &unk_1E5957698;
        id v13 = v7;
        id v11 = v7;
        dispatch_after(v9, v10, block);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v1 + 2);
      __HMFLocationAuthorizationUpdateState(v3, 0);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v1 + 2);
    }
  }
}

void sub_19D590818(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMFLocationAuthorizationUpdateState(void *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = (void *)MEMORY[0x19F3A87A0]();
  dispatch_queue_t v5 = (os_unfair_lock_s *)v3;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier(v5);
    int v8 = 138543618;
    dispatch_time_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Updating authorization state to %ld", (uint8_t *)&v8, 0x16u);
  }
  [(os_unfair_lock_s *)v5 willChangeValueForKey:@"isMonitoring"];
  os_unfair_lock_lock_with_options();
  *(void *)&v5[8]._os_unfair_lock_opaque = a2;
  os_unfair_lock_unlock(v5 + 2);
  [(os_unfair_lock_s *)v5 didChangeValueForKey:@"isMonitoring"];
}

void sub_19D591084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HMFLocationManagerOperationStartMonitoring(void *a1)
{
  id v1 = a1;
  int64_t v2 = [v1 underlyingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ____HMFLocationManagerOperationStartMonitoring_block_invoke;
  block[3] = &unk_1E5957698;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void sub_19D591534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_19D591B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D591E1C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t Sequence.asyncForEach(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5[7] = AssociatedTypeWitness;
  v5[8] = *(void *)(AssociatedTypeWitness - 8);
  v5[9] = swift_task_alloc();
  sub_19D603508();
  v5[10] = swift_task_alloc();
  v5[11] = *(void *)(a3 - 8);
  v5[12] = swift_task_alloc();
  uint64_t v8 = swift_getAssociatedTypeWitness();
  v5[13] = v8;
  v5[14] = *(void *)(v8 - 8);
  v5[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D592FC0, 0, 0);
}

uint64_t sub_19D592FC0()
{
  (*(void (**)(void, void, void))(v0[11] + 16))(v0[12], v0[6], v0[4]);
  sub_19D6032D8();
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  swift_getAssociatedConformanceWitness();
  sub_19D603518();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    id v6 = (int *)v0[2];
    (*(void (**)(void, void, void))(v0[8] + 32))(v0[9], v0[10], v0[7]);
    dispatch_time_t v9 = (uint64_t (*)(uint64_t))((char *)v6 + *v6);
    id v7 = (void *)swift_task_alloc();
    v0[16] = v7;
    void *v7 = v0;
    v7[1] = sub_19D5931D8;
    uint64_t v8 = v0[9];
    return v9(v8);
  }
}

uint64_t sub_19D5931D8()
{
  *(void *)(*(void *)v1 + 136) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_19D5934E0;
  }
  else {
    uint64_t v2 = sub_19D5932EC;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D5932EC()
{
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  swift_getAssociatedConformanceWitness();
  sub_19D603518();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    id v6 = (int *)v0[2];
    (*(void (**)(void, void, void))(v0[8] + 32))(v0[9], v0[10], v0[7]);
    dispatch_time_t v9 = (uint64_t (*)(uint64_t))((char *)v6 + *v6);
    id v7 = (void *)swift_task_alloc();
    v0[16] = v7;
    void *v7 = v0;
    v7[1] = sub_19D5931D8;
    uint64_t v8 = v0[9];
    return v9(v8);
  }
}

uint64_t sub_19D5934E0()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  (*(void (**)(void, void))(v0[8] + 8))(v0[9], v0[7]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[10] = AssociatedTypeWitness;
  v6[11] = *(void *)(AssociatedTypeWitness - 8);
  v6[12] = swift_task_alloc();
  sub_19D603508();
  v6[13] = swift_task_alloc();
  v6[14] = *(void *)(a3 - 8);
  v6[15] = swift_task_alloc();
  uint64_t v9 = swift_getAssociatedTypeWitness();
  v6[16] = v9;
  v6[17] = *(void *)(v9 - 8);
  v6[18] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5937BC, 0, 0);
}

uint64_t sub_19D5937BC()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  v0[2] = sub_19D603268();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_19D6032D8();
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[10];
  uint64_t v7 = v0[11];
  swift_getAssociatedConformanceWitness();
  sub_19D603518();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v8 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
    return v9(v8);
  }
  else
  {
    uint64_t v11 = (int *)v0[3];
    (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[13], v0[10]);
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t))((char *)v11 + *v11);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[19] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_19D593A0C;
    uint64_t v13 = v0[12];
    uint64_t v14 = v0[9];
    return v15(v14, v13);
  }
}

uint64_t sub_19D593A0C()
{
  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_19D593D64;
  }
  else
  {
    uint64_t v2 = sub_19D593B28;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D593B28()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  sub_19D6033B8();
  sub_19D603398();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[10];
  uint64_t v6 = v0[11];
  swift_getAssociatedConformanceWitness();
  sub_19D603518();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
    uint64_t v7 = v0[2];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
    return v8(v7);
  }
  else
  {
    uint64_t v10 = (int *)v0[3];
    (*(void (**)(void, void, void))(v0[11] + 32))(v0[12], v0[13], v0[10]);
    uint64_t v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)v10 + *v10);
    uint64_t v11 = (void *)swift_task_alloc();
    v0[19] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_19D593A0C;
    uint64_t v12 = v0[12];
    uint64_t v13 = v0[9];
    return v14(v13, v12);
  }
}

uint64_t sub_19D593D64()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t Sequence<>.parallelForEach(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return MEMORY[0x1F4188298](sub_19D593E68, 0, 0);
}

uint64_t sub_19D593E68()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  long long v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(void *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19D593F58;
  return MEMORY[0x1F4188080]();
}

uint64_t sub_19D593F58()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_19D59408C;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_19D594074;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D594074()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19D59408C()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5940F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[13] = a6;
  v7[14] = a7;
  v7[11] = a4;
  v7[12] = a5;
  v7[9] = a2;
  v7[10] = a3;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[15] = AssociatedTypeWitness;
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  v7[16] = v10;
  v7[17] = *(void *)(v10 + 64);
  v7[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  v7[19] = swift_task_alloc();
  v7[20] = swift_task_alloc();
  sub_19D603508();
  v7[21] = swift_task_alloc();
  v7[22] = *(void *)(a6 - 8);
  v7[23] = swift_task_alloc();
  uint64_t v11 = swift_getAssociatedTypeWitness();
  v7[24] = v11;
  v7[25] = *(void *)(v11 - 8);
  v7[26] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D59432C, 0, 0);
}

uint64_t sub_19D59432C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  (*(void (**)(void, void, void))(*(void *)(v0 + 176) + 16))(*(void *)(v0 + 184), *(void *)(v0 + 80), *(void *)(v0 + 104));
  sub_19D6032D8();
  v26 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  uint64_t v25 = v1;
  while (1)
  {
    uint64_t v3 = *(void *)(v0 + 168);
    uint64_t v4 = *(void *)(v0 + 120);
    swift_getAssociatedConformanceWitness();
    sub_19D603518();
    if ((*v26)(v3, 1, v4) == 1) {
      break;
    }
    uint64_t v5 = *(void *)(v0 + 160);
    uint64_t v6 = *(void *)(v0 + 168);
    uint64_t v29 = v5;
    unint64_t v7 = *(void *)(v0 + 144);
    uint64_t v32 = *(void *)(v0 + 152);
    unint64_t v27 = v7;
    uint64_t v8 = *(void *)(v0 + 120);
    uint64_t v31 = *(void *)(v0 + 96);
    uint64_t v30 = *(void *)(v0 + 88);
    uint64_t v9 = sub_19D603438();
    uint64_t v10 = *(void *)(v9 - 8);
    long long v28 = *(_OWORD *)(v0 + 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v5, 1, 1, v9);
    uint64_t v11 = *(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 32);
    unint64_t v12 = v7;
    uint64_t v13 = v8;
    v11(v12, v6, v8);
    unint64_t v14 = (*(unsigned __int8 *)(v25 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = 0;
    uint64_t v16 = (void *)(v15 + 16);
    *(void *)(v15 + 24) = 0;
    *(_OWORD *)(v15 + 32) = v28;
    *(void *)(v15 + 48) = v30;
    *(void *)(v15 + 56) = v31;
    v11(v15 + v14, v27, v13);
    sub_19D59880C(v29, v32);
    LODWORD(v13) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v32, 1, v9);
    swift_retain();
    uint64_t v17 = *(void *)(v0 + 152);
    if (v13 == 1)
    {
      sub_19D5987AC(*(void *)(v0 + 152));
      if (*v16) {
        goto LABEL_6;
      }
    }
    else
    {
      sub_19D603428();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v17, v9);
      if (*v16)
      {
LABEL_6:
        swift_getObjectType();
        swift_unknownObjectRetain();
        uint64_t v18 = sub_19D6033C8();
        uint64_t v20 = v19;
        swift_unknownObjectRelease();
        goto LABEL_9;
      }
    }
    uint64_t v18 = 0;
    uint64_t v20 = 0;
LABEL_9:
    uint64_t v21 = **(void **)(v0 + 72);
    uint64_t v22 = v20 | v18;
    if (v20 | v18)
    {
      uint64_t v22 = v0 + 16;
      *(void *)(v0 + 16) = 0;
      *(void *)(v0 + 24) = 0;
      *(void *)(v0 + 32) = v18;
      *(void *)(v0 + 40) = v20;
    }
    uint64_t v2 = *(void *)(v0 + 160);
    *(void *)(v0 + 48) = 1;
    *(void *)(v0 + 56) = v22;
    *(void *)(v0 + 64) = v21;
    swift_task_create();
    swift_release();
    sub_19D5987AC(v2);
  }
  (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
  v33 = (char *)&dword_1E9444408 + dword_1E9444408;
  __int16 v23 = (void *)swift_task_alloc();
  *(void *)(v0 + 216) = v23;
  *__int16 v23 = v0;
  v23[1] = sub_19D59472C;
  return ((uint64_t (*)(void, void))v33)(0, 0);
}

uint64_t sub_19D59472C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_19D5948E0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v10 = v2[6];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_19D5990F4;
  return sub_19D5940F0(a1, a2, v8, v9, v10, v6, v7);
}

uint64_t sub_19D5949B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v8;
  *uint64_t v8 = v6;
  v8[1] = sub_19D594A94;
  return v10(a6);
}

uint64_t sub_19D594A94()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_19D594B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  MEMORY[0x1F4188790](v7 - 8, v8, v9);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19D59880C(a1, (uint64_t)v11);
  uint64_t v12 = sub_19D603438();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_19D5987AC((uint64_t)v11);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_19D6033C8();
      uint64_t v16 = v15;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_19D603428();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = 0;
  uint64_t v16 = 0;
LABEL_6:
  uint64_t v17 = *v4;
  uint64_t v18 = (void *)(v16 | v14);
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    uint64_t v18 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v17;
  swift_task_create();
  return swift_release();
}

uint64_t sub_19D594D5C(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  if (a1)
  {
    swift_getObjectType();
    uint64_t v4 = sub_19D6033C8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  void v3[5] = v4;
  v3[6] = v6;
  return MEMORY[0x1F4188298](sub_19D594DFC, v4, v6);
}

uint64_t sub_19D594DFC()
{
  v0[7] = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443A0);
  if (sub_19D603468())
  {
    uint64_t v1 = (uint64_t (*)(void))v0[1];
    return v1();
  }
  else
  {
    v0[8] = 0;
    uint64_t v3 = (void *)swift_task_alloc();
    v0[9] = v3;
    uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9444420);
    *uint64_t v3 = v0;
    v3[1] = sub_19D594F30;
    uint64_t v5 = v0[3];
    uint64_t v6 = v0[2];
    return MEMORY[0x1F4187E30](v0 + 11, v6, v5, v4);
  }
}

uint64_t sub_19D594F30()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_19D59517C;
  }
  else
  {
    *(unsigned char *)(v2 + 89) = *(unsigned char *)(v2 + 88);
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v2 + 48);
    uint64_t v5 = sub_19D59504C;
  }
  return MEMORY[0x1F4188298](v5, v3, v4);
}

uint64_t sub_19D59504C()
{
  if (*(unsigned char *)(v0 + 89))
  {
    uint64_t v1 = *(void *)(v0 + 64);
    if (sub_19D603468())
    {
      if (v1) {
        swift_willThrow();
      }
      uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
      return v2();
    }
    *(void *)(v0 + 64) = v1;
  }
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9444420);
  *uint64_t v4 = v0;
  v4[1] = sub_19D594F30;
  uint64_t v6 = *(void *)(v0 + 24);
  uint64_t v7 = *(void *)(v0 + 16);
  return MEMORY[0x1F4187E30](v0 + 88, v7, v6, v5);
}

uint64_t sub_19D59517C()
{
  uint64_t v1 = (void *)v0[10];
  if (v0[8])
  {

    uint64_t v1 = (void *)v0[8];
  }
  if (sub_19D603468())
  {
    if (v1) {
      swift_willThrow();
    }
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  else
  {
    v0[8] = v1;
    uint64_t v4 = (void *)swift_task_alloc();
    v0[9] = v4;
    uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9444420);
    *uint64_t v4 = v0;
    v4[1] = sub_19D594F30;
    uint64_t v6 = v0[3];
    uint64_t v7 = v0[2];
    return MEMORY[0x1F4187E30](v0 + 11, v7, v6, v5);
  }
}

uint64_t Sequence<>.parallelMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return MEMORY[0x1F4188298](sub_19D5952E4, 0, 0);
}

uint64_t sub_19D5952E4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 40);
  long long v9 = *(_OWORD *)(v0 + 48);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  long long v5 = *(_OWORD *)(v0 + 24);
  *(void *)(v4 + 16) = v2;
  *(_OWORD *)(v4 + 24) = v9;
  *(void *)(v4 + 40) = v1;
  *(_OWORD *)(v4 + 48) = v5;
  uint64_t v6 = sub_19D6033B8();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v7;
  void *v7 = v0;
  v7[1] = sub_19D59543C;
  return MEMORY[0x1F4188080](v0 + 16, TupleTypeMetadata2, v6, 0, 0, &unk_1E9444390, v4, TupleTypeMetadata2);
}

uint64_t sub_19D59543C()
{
  *(void *)(*(void *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_19D595574;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_19D595558;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D595558()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_19D595574()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5955D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v8[12] = TupleTypeMetadata2;
  v8[13] = *(void *)(TupleTypeMetadata2 - 8);
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  v8[16] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E94443A0);
  uint64_t v10 = sub_19D603738();
  v8[17] = v10;
  uint64_t v11 = sub_19D603508();
  v8[18] = v11;
  v8[19] = *(void *)(v11 - 8);
  v8[20] = swift_task_alloc();
  v8[21] = *(void *)(v10 - 8);
  v8[22] = swift_task_alloc();
  v8[23] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[24] = AssociatedTypeWitness;
  uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
  v8[25] = v13;
  v8[26] = *(void *)(v13 + 64);
  v8[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  v8[28] = swift_task_alloc();
  uint64_t v14 = sub_19D603508();
  v8[29] = v14;
  v8[30] = *(void *)(v14 - 8);
  v8[31] = swift_task_alloc();
  v8[32] = swift_getTupleTypeMetadata2();
  uint64_t v15 = sub_19D603508();
  v8[33] = v15;
  v8[34] = *(void *)(v15 - 8);
  v8[35] = swift_task_alloc();
  v8[36] = swift_task_alloc();
  v8[37] = sub_19D603648();
  v8[38] = swift_task_alloc();
  uint64_t v16 = sub_19D603638();
  v8[39] = v16;
  v8[40] = *(void *)(v16 - 8);
  v8[41] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D595A20, 0, 0);
}

uint64_t sub_19D595A20()
{
  uint64_t v1 = v0[34];
  uint64_t v2 = v0[32];
  uint64_t v3 = v0[25];
  MEMORY[0x19F3A7490](v0[9], v0[11]);
  sub_19D603618();
  uint64_t v4 = 0;
  uint64_t v36 = v3;
  uint64_t v37 = v2;
  uint64_t v38 = v2 - 8;
  v39 = (void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32);
  while (1)
  {
    uint64_t v6 = v0[35];
    uint64_t v5 = v0[36];
    uint64_t v8 = v0[32];
    uint64_t v7 = v0[33];
    sub_19D603628();
    (*v39)(v5, v6, v7);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v38 + 48))(v5, 1, v8);
    if (result == 1) {
      break;
    }
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      return result;
    }
    uint64_t v10 = (uint64_t *)v0[36];
    uint64_t v12 = (char *)v0[27];
    uint64_t v11 = v0[28];
    uint64_t v13 = v0[24];
    uint64_t v42 = v11;
    uint64_t v43 = v4;
    uint64_t v15 = v0[10];
    uint64_t v14 = v0[11];
    uint64_t v17 = v0[8];
    uint64_t v16 = v0[9];
    uint64_t v41 = v0[7];
    uint64_t v18 = (char *)v10 + *(int *)(v37 + 48);
    uint64_t v40 = *v10;
    uint64_t v19 = sub_19D603438();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v11, 1, 1, v19);
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v36 + 32);
    v20(v12, v18, v13);
    unint64_t v21 = (*(unsigned __int8 *)(v36 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
    uint64_t v22 = (char *)swift_allocObject();
    *((void *)v22 + 2) = 0;
    *((void *)v22 + 3) = 0;
    *((void *)v22 + 4) = v16;
    *((void *)v22 + 5) = v15;
    *((void *)v22 + 6) = v14;
    *((void *)v22 + 7) = v40;
    *((void *)v22 + 8) = v41;
    *((void *)v22 + 9) = v17;
    v20(&v22[v21], v12, v13);
    uint64_t v23 = *((void *)v22 + 2);
    uint64_t v24 = *((void *)v22 + 3);
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = v23;
    v25[3] = v24;
    v25[4] = v16;
    v25[5] = v15;
    v25[6] = v14;
    v25[7] = &unk_1E94443F0;
    v25[8] = v22;
    sub_19D603478();
    swift_retain();
    swift_unknownObjectRetain();
    sub_19D594B88(v42, (uint64_t)&unk_1E9444400, (uint64_t)v25);
    sub_19D5987AC(v42);
    uint64_t v4 = v43 + 1;
  }
  uint64_t v27 = v0[30];
  uint64_t v26 = v0[31];
  uint64_t v28 = v0[29];
  uint64_t v29 = v0[10];
  (*(void (**)(void, void))(v0[40] + 8))(v0[41], v0[39]);
  uint64_t v30 = *(void *)(v29 - 8);
  v0[42] = v30;
  uint64_t v31 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56);
  v0[43] = v31;
  v0[44] = (v30 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v31(v26, 1, 1, v29);
  uint64_t v32 = sub_19D598554(v26, v4, v28);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  v0[2] = v32;
  v0[45] = 0;
  v44 = (char *)&dword_1E94443E0 + dword_1E94443E0;
  v33 = (void *)swift_task_alloc();
  v0[46] = v33;
  uint64_t v34 = sub_19D603478();
  void *v33 = v0;
  v33[1] = sub_19D595E54;
  uint64_t v35 = v0[20];
  return ((uint64_t (*)(uint64_t, void, void, uint64_t))v44)(v35, 0, 0, v34);
}

uint64_t sub_19D595E54()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D595F50, 0, 0);
}

uint64_t sub_19D595F50()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 136);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 360);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 152) + 8))(v1, *(void *)(v0 + 144));
    if (v4)
    {
      uint64_t v5 = *(void **)(v0 + 360);
      id v6 = v5;
      swift_bridgeObjectRelease();
      swift_willThrow();
    }
    else
    {
      uint64_t v30 = *(void *)(v0 + 72);
      uint64_t v31 = *(uint64_t **)(v0 + 32);
      *(void *)(v0 + 24) = *(void *)(v0 + 16);
      uint64_t v32 = swift_task_alloc();
      long long v33 = *(_OWORD *)(v0 + 80);
      *(void *)(v32 + 16) = v30;
      *(_OWORD *)(v32 + 24) = v33;
      sub_19D6033B8();
      swift_bridgeObjectRetain();
      swift_getWitnessTable();
      uint64_t v34 = sub_19D6032E8();
      swift_task_dealloc();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *uint64_t v31 = v34;
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  uint64_t v9 = *(void *)(v0 + 176);
  uint64_t v8 = *(void *)(v0 + 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v8, v1, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v9, v8, v3);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v13 = *(void *)(v0 + 336);
    uint64_t v14 = *(void *)(v0 + 240);
    uint64_t v35 = *(char **)(v0 + 248);
    uint64_t v36 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 344);
    uint64_t v37 = *(void *)(v0 + 232);
    uint64_t v43 = *(void *)(v0 + 184);
    uint64_t v15 = *(unint64_t **)(v0 + 176);
    uint64_t v41 = *(void *)(v0 + 168);
    uint64_t v42 = *(void *)(v0 + 136);
    uint64_t v16 = *(unint64_t **)(v0 + 112);
    v39 = *(unint64_t **)(v0 + 120);
    uint64_t v40 = *(void *)(v0 + 104);
    uint64_t v17 = *(void *)(v0 + 80);
    uint64_t v18 = *(int *)(*(void *)(v0 + 96) + 48);
    uint64_t v19 = *(void *)(v0 + 96);
    uint64_t v38 = v19;
    uint64_t v20 = (char *)v39 + v18;
    unint64_t v21 = *v15;
    unint64_t *v39 = *v15;
    uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v22((char *)v39 + v18, (char *)v15 + v18, v17);
    uint64_t v23 = (char *)v16 + *(int *)(v19 + 48);
    unint64_t *v16 = v21;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v23, v20, v17);
    v22(v35, v23, v17);
    v36((uint64_t)v35, 0, 1, v17);
    uint64_t v24 = sub_19D6033B8();
    sub_19D603358();
    uint64_t v25 = *(void *)(v0 + 16);
    sub_19D598500(v21, v25);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 40))(v25+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v21, v35, v37);
    nullsub_1(v24);
    (*(void (**)(unint64_t *, uint64_t))(v40 + 8))(v39, v38);
    (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v42);
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v0 + 360);
  uint64_t v11 = *(void ***)(v0 + 176);
  (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 136));
  uint64_t v12 = *v11;
  if (v10)
  {

LABEL_8:
    uint64_t v12 = *(void **)(v0 + 360);
  }
  *(void *)(v0 + 360) = v12;
  v44 = (char *)&dword_1E94443E0 + dword_1E94443E0;
  uint64_t v26 = (void *)swift_task_alloc();
  *(void *)(v0 + 368) = v26;
  uint64_t v27 = sub_19D603478();
  void *v26 = v0;
  v26[1] = sub_19D595E54;
  uint64_t v28 = *(void *)(v0 + 160);
  return ((uint64_t (*)(uint64_t, void, void, uint64_t))v44)(v28, 0, 0, v27);
}

uint64_t sub_19D5964F8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_19D594A94;
  return sub_19D5955D8(a1, a2, v9, v11, v10, v6, v7, v8);
}

uint64_t sub_19D5965D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  *(void *)(v7 + 16) = a4;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)a5 + *a5);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v7 + 24) = v10;
  *uint64_t v10 = v7;
  v10[1] = sub_19D5966C8;
  return v12(a1, a7);
}

uint64_t sub_19D5966C8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *v1;
  uint64_t v4 = swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  if (!v0) {
    uint64_t v4 = *(void *)(v2 + 16);
  }
  return v5(v4);
}

uint64_t sub_19D5967D0(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)(v4 + 16) = a1;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v8 = a4;
  uint64_t v9 = a1 + *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v4 + 24) = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_19D5968E0;
  return v12(v9);
}

uint64_t sub_19D5968E0(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (!v1) {
    **(void **)(v4 + 16) = a1;
  }
  uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
  return v6();
}

uint64_t sub_19D5969F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a2;
  v4[3] = a3;
  uint64_t v7 = (void *)swift_task_alloc();
  v4[4] = v7;
  void *v7 = v4;
  v7[1] = sub_19D596AA0;
  return MEMORY[0x1F4187E20](a1, a4);
}

uint64_t sub_19D596AA0()
{
  uint64_t v2 = (void *)*v1;
  v2[5] = v0;
  swift_task_dealloc();
  if (v0)
  {
    if (v2[2])
    {
      swift_getObjectType();
      uint64_t v3 = sub_19D6033C8();
      uint64_t v5 = v4;
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v5 = 0;
    }
    return MEMORY[0x1F4188298](sub_19D596C10, v3, v5);
  }
  else
  {
    uint64_t v6 = (uint64_t (*)(void))v2[1];
    return v6();
  }
}

uint64_t sub_19D596C10()
{
  return MEMORY[0x1F41867D8](*(void *)(v0 + 40), "_Concurrency/TaskGroup.swift", 28, 1, 1173);
}

uint64_t Sequence<>.parallelMapToResults<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return MEMORY[0x1F4188298](sub_19D596C54, 0, 0);
}

uint64_t sub_19D596C54()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E94443A0);
  long long v9 = *(_OWORD *)(v0 + 48);
  sub_19D603738();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v4 = swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  long long v5 = *(_OWORD *)(v0 + 24);
  *(void *)(v4 + 16) = v2;
  *(_OWORD *)(v4 + 24) = v9;
  *(void *)(v4 + 40) = v1;
  *(_OWORD *)(v4 + 48) = v5;
  uint64_t v6 = sub_19D6033B8();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v7;
  void *v7 = v0;
  v7[1] = sub_19D596DD0;
  return MEMORY[0x1F4187F28](v0 + 16, TupleTypeMetadata2, v6, 0, 0, &unk_1E94443B0, v4, TupleTypeMetadata2);
}

uint64_t sub_19D596DD0()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D596EE8, 0, 0);
}

uint64_t sub_19D596EE8()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_19D596F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E94443A0);
  v8[12] = sub_19D603738();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v8[13] = TupleTypeMetadata2;
  v8[14] = *(void *)(TupleTypeMetadata2 - 8);
  v8[15] = swift_task_alloc();
  v8[16] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8[17] = AssociatedTypeWitness;
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  v8[18] = v11;
  v8[19] = *(void *)(v11 + 64);
  v8[20] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  v8[21] = swift_task_alloc();
  sub_19D603508();
  v8[22] = swift_task_alloc();
  uint64_t v12 = sub_19D603408();
  v8[23] = v12;
  v8[24] = *(void *)(v12 - 8);
  v8[25] = swift_task_alloc();
  uint64_t v13 = sub_19D603508();
  v8[26] = v13;
  v8[27] = *(void *)(v13 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_getTupleTypeMetadata2();
  uint64_t v14 = sub_19D603508();
  v8[30] = v14;
  v8[31] = *(void *)(v14 - 8);
  v8[32] = swift_task_alloc();
  v8[33] = swift_task_alloc();
  v8[34] = sub_19D603648();
  v8[35] = swift_task_alloc();
  uint64_t v15 = sub_19D603638();
  v8[36] = v15;
  v8[37] = *(void *)(v15 - 8);
  v8[38] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D59735C, 0, 0);
}

uint64_t sub_19D59735C()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[29];
  uint64_t v3 = v0[18];
  MEMORY[0x19F3A7490](v0[9], v0[11]);
  sub_19D603618();
  uint64_t v4 = 0;
  uint64_t v34 = v3;
  uint64_t v35 = v2;
  uint64_t v36 = v2 - 8;
  while (1)
  {
    uint64_t v6 = v0[32];
    uint64_t v5 = v0[33];
    uint64_t v8 = v0[29];
    uint64_t v7 = v0[30];
    sub_19D603628();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v5, v6, v7);
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v36 + 48))(v5, 1, v8);
    if (v9 == 1) {
      break;
    }
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      return MEMORY[0x1F4187C58](v9, v10, v11, v12);
    }
    uint64_t v13 = (uint64_t *)v0[33];
    uint64_t v15 = (char *)v0[20];
    uint64_t v14 = v0[21];
    uint64_t v16 = v0[17];
    uint64_t v17 = v0[8];
    uint64_t v39 = v0[11];
    uint64_t v40 = v0[7];
    uint64_t v18 = (char *)v13 + *(int *)(v35 + 48);
    uint64_t v38 = *v13;
    uint64_t v19 = sub_19D603438();
    long long v37 = *(_OWORD *)(v0 + 9);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v14, 1, 1, v19);
    uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
    v20(v15, v18, v16);
    uint64_t v21 = v4;
    unint64_t v22 = (*(unsigned __int8 *)(v34 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = 0;
    *(void *)(v23 + 24) = 0;
    *(_OWORD *)(v23 + 32) = v37;
    *(void *)(v23 + 48) = v39;
    *(void *)(v23 + 56) = v38;
    *(void *)(v23 + 64) = v40;
    *(void *)(v23 + 72) = v17;
    v20((char *)(v23 + v22), v15, v16);
    uint64_t v24 = sub_19D603418();
    swift_retain();
    sub_19D59804C(v14, (uint64_t)&unk_1E94443C8, v23, v24);
    sub_19D5987AC(v14);
    uint64_t v4 = v21 + 1;
  }
  uint64_t v26 = v0[27];
  uint64_t v25 = v0[28];
  uint64_t v27 = v0[26];
  uint64_t v28 = v0[12];
  (*(void (**)(void, void))(v0[37] + 8))(v0[38], v0[36]);
  uint64_t v29 = *(void *)(v28 - 8);
  v0[39] = v29;
  uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
  v0[40] = v30;
  v0[41] = (v29 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v30(v25, 1, 1, v28);
  uint64_t v31 = sub_19D598554(v25, v4, v27);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  v0[2] = v31;
  sub_19D6033E8();
  uint64_t v32 = (void *)swift_task_alloc();
  v0[42] = v32;
  *uint64_t v32 = v0;
  v32[1] = sub_19D597720;
  uint64_t v9 = v0[22];
  uint64_t v12 = v0[23];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  return MEMORY[0x1F4187C58](v9, v10, v11, v12);
}

uint64_t sub_19D597720()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59781C, 0, 0);
}

uint64_t sub_19D59781C()
{
  uint64_t v1 = *(unint64_t **)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  if ((*(unsigned int (**)(unint64_t *, uint64_t, uint64_t))(v2 + 48))(v1, 1, v3) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v5 = *(uint64_t **)(v0 + 32);
    long long v26 = *(_OWORD *)(v0 + 72);
    (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 200), *(void *)(v0 + 184));
    *(void *)(v0 + 24) = *(void *)(v0 + 16);
    uint64_t v6 = swift_task_alloc();
    *(_OWORD *)(v6 + 16) = v26;
    *(void *)(v6 + 32) = v4;
    sub_19D6033B8();
    swift_bridgeObjectRetain();
    swift_getWitnessTable();
    uint64_t v7 = sub_19D6032E8();
    swift_task_dealloc();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *uint64_t v5 = v7;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 312);
    uint64_t v11 = *(void *)(v0 + 216);
    uint64_t v27 = *(char **)(v0 + 224);
    uint64_t v28 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v0 + 320);
    uint64_t v29 = *(void *)(v0 + 208);
    uint64_t v12 = *(unint64_t **)(v0 + 120);
    uint64_t v31 = *(unint64_t **)(v0 + 128);
    uint64_t v13 = *(void *)(v0 + 96);
    uint64_t v14 = *(int *)(v3 + 48);
    uint64_t v15 = (char *)v31 + v14;
    unint64_t v16 = *v1;
    uint64_t v17 = (char *)v1 + v14;
    *uint64_t v31 = *v1;
    uint64_t v18 = v3;
    uint64_t v30 = v3;
    uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v19((char *)v31 + v14, v17, v13);
    uint64_t v20 = (char *)v12 + *(int *)(v18 + 48);
    *uint64_t v12 = v16;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v20, v15, v13);
    v19(v27, v20, v13);
    v28((uint64_t)v27, 0, 1, v13);
    uint64_t v21 = sub_19D6033B8();
    sub_19D603358();
    uint64_t v22 = *(void *)(v0 + 16);
    sub_19D598500(v16, v22);
    (*(void (**)(unint64_t, char *, uint64_t))(v11 + 40))(v22+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(void *)(v11 + 72) * v16, v27, v29);
    nullsub_1(v21);
    (*(void (**)(unint64_t *, uint64_t))(v2 + 8))(v31, v30);
    uint64_t v23 = (void *)swift_task_alloc();
    *(void *)(v0 + 336) = v23;
    *uint64_t v23 = v0;
    v23[1] = sub_19D597720;
    uint64_t v24 = *(void *)(v0 + 176);
    uint64_t v25 = *(void *)(v0 + 184);
    return MEMORY[0x1F4187C58](v24, 0, 0, v25);
  }
}

uint64_t sub_19D597BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  uint64_t v9 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v10 = v2[7];
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v12;
  *uint64_t v12 = v3;
  v12[1] = sub_19D5990F4;
  return sub_19D596F48(a1, a2, v9, v11, v10, v6, v7, v8);
}

uint64_t sub_19D597CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[6] = a7;
  v7[7] = v9;
  v7[4] = a5;
  v7[5] = a6;
  v7[2] = a1;
  v7[3] = a4;
  return MEMORY[0x1F4188298](sub_19D597D00, 0, 0);
}

uint64_t sub_19D597D00()
{
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v1 = *(int **)(v0 + 32);
  uint64_t v3 = *(void **)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E94443A0);
  *(void *)(v0 + 64) = sub_19D603738();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v5 = v1;
  uint64_t v6 = *(int *)(TupleTypeMetadata2 + 48);
  *(_DWORD *)(v0 + 88) = v6;
  uint64_t v7 = (char *)v3 + v6;
  *uint64_t v3 = v2;
  uint64_t v11 = (uint64_t (*)(char *, uint64_t))((char *)v5 + *v5);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_19D597E44;
  uint64_t v9 = *(void *)(v0 + 48);
  return v11(v7, v9);
}

uint64_t sub_19D597E44()
{
  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_19D597FC8;
  }
  else {
    uint64_t v2 = sub_19D597F58;
  }
  return MEMORY[0x1F4188298](v2, 0, 0);
}

uint64_t sub_19D597F58()
{
  swift_storeEnumTagMultiPayload();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D597FC8()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(int *)(v0 + 88);
  uint64_t v3 = *(void **)(v0 + 16);
  *uint64_t v3 = *(void *)(v0 + 24);
  *(void *)((char *)v3 + v2) = v1;
  swift_storeEnumTagMultiPayload();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_19D59804C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  MEMORY[0x1F4188790](v10 - 8, v11, v12);
  uint64_t v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19D59880C(a1, (uint64_t)v14);
  uint64_t v15 = sub_19D603438();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_19D5987AC((uint64_t)v14);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v17 = sub_19D6033C8();
      uint64_t v19 = v18;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_19D603428();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v15);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = 0;
  uint64_t v19 = 0;
LABEL_6:
  uint64_t v20 = *v5;
  uint64_t v21 = (void *)swift_allocObject();
  v21[2] = *(void *)(a4 + 16);
  v21[3] = a2;
  void v21[4] = a3;
  uint64_t v22 = (void *)(v19 | v17);
  if (v19 | v17)
  {
    v25[0] = 0;
    v25[1] = 0;
    uint64_t v22 = v25;
    v25[2] = v17;
    v25[3] = v19;
  }
  v24[1] = 1;
  v24[2] = v22;
  v24[3] = v20;
  swift_task_create();
  return swift_release();
}

uint64_t sub_19D59824C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E94443A0);
  sub_19D603738();
  uint64_t v4 = sub_19D603508();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_19D59832C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_19D598408;
  return v6(a1);
}

uint64_t sub_19D598408()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_19D598500(unint64_t a1, uint64_t a2)
{
  uint64_t result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  uint64_t v5 = a2 & 0xFFFFFFFFFFFFFF8;
  if ((result & 1) == 0) {
    uint64_t v5 = a2;
  }
  if (*(void *)(v5 + 16) <= a1) {
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_19D598554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_19D603368();
  uint64_t v15 = result;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    if (a2)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)(a3 - 8);
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
      v10(v7, a1, a3);
      uint64_t v11 = a2 - 1;
      if (v11)
      {
        uint64_t v12 = *(void *)(v9 + 72);
        uint64_t v13 = v8 + v12;
        do
        {
          v10(v13, a1, a3);
          v13 += v12;
          --v11;
        }
        while (v11);
      }
    }
    uint64_t v14 = sub_19D6033B8();
    nullsub_1(v14);
    return v15;
  }
  return result;
}

uint64_t sub_19D598668@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_19D59824C(a1, a2);
}

uint64_t sub_19D59868C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 40);
  uint64_t v5 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v6 = *(void *)(v1 + 56);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v8 = swift_task_alloc();
  long long v9 = *(_OWORD *)(v1 + 64);
  *(void *)(v2 + 16) = v8;
  *(void *)uint64_t v8 = v2;
  *(void *)(v8 + 8) = sub_19D594A94;
  *(void *)(v8 + 48) = v7;
  *(void *)(v8 + 56) = v4;
  *(_OWORD *)(v8 + 32) = v9;
  *(void *)(v8 + 16) = a1;
  *(void *)(v8 + 24) = v6;
  return MEMORY[0x1F4188298](sub_19D597D00, 0, 0);
}

uint64_t sub_19D5987AC(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19D59880C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19D598874()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_19D5988AC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E94443D0 + dword_1E94443D0);
  return v6(a1, v4);
}

uint64_t sub_19D598974@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_19D603508();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 80) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_19D598AD8(uint64_t a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v7 = *(void *)(v1 + 56);
  uint64_t v6 = *(int **)(v1 + 64);
  uint64_t v8 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 80) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  long long v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *long long v9 = v3;
  v9[1] = sub_19D598C6C;
  v9[2] = v7;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v10 = (void *)swift_task_alloc();
  v9[3] = v10;
  *uint64_t v10 = v9;
  v10[1] = sub_19D5966C8;
  return v12(a1, v8);
}

uint64_t sub_19D598C6C(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_19D598D68()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 72, 7);
}

uint64_t sub_19D598DA8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[7];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_19D5990F4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1E94443F8 + dword_1E94443F8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_19D598E98()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, AssociatedTypeWitness);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_19D598F80()
{
  uint64_t v2 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v3 = *(int **)(v0 + 48);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_19D5990F4;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v3 + *v3);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D594A94;
  return v8(v4);
}

uint64_t sub_19D5990F8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v36 = *a1;
  uint64_t v43 = a1[1];
  uint64_t v44 = a1[3];
  uint64_t v41 = a1[2];
  uint64_t v42 = a1[4];
  uint64_t v34 = a1[6];
  uint64_t v35 = a1[5];
  uint64_t v39 = a1[7];
  uint64_t v40 = a1[8];
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t v54 = a5;
  uint64_t v55 = a6;
  uint64_t v56 = a7;
  uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState(0, (uint64_t)&v51);
  long long v37 = (uint64_t *)((char *)a8 + *(int *)(v15 + 68));
  *long long v37 = 0;
  v37[1] = 0;
  uint64_t v16 = (uint64_t *)((char *)a8 + *(int *)(v15 + 72));
  uint64_t *v16 = 0;
  v16[1] = 0;
  uint64_t v38 = v16;
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t v54 = a5;
  uint64_t v55 = a6;
  uint64_t v56 = a7;
  uint64_t v45 = _s4NodeO13NodeStateTypeOMa(255, (uint64_t)&v51);
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  uint64_t v47 = v46;
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t v54 = a5;
  uint64_t v55 = a6;
  uint64_t v56 = a7;
  _s4NodeOMa(255, (uint64_t)&v51);
  uint64_t v48 = sub_19D6033B8();
  TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v18 = swift_allocBox();
  uint64_t v20 = v19;
  uint64_t v21 = (void *)(v19 + TupleTypeMetadata[12]);
  uint64_t v31 = (void **)(v19 + TupleTypeMetadata[16]);
  uint64_t v32 = TupleTypeMetadata[20];
  uint64_t v33 = v18;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v20, 1, 1, AssociatedTypeWitness);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = a2;
  v23[3] = a3;
  v23[4] = a4;
  v23[5] = a5;
  v23[6] = a6;
  v23[7] = a7;
  void *v21 = &unk_1E9444578;
  v21[1] = v23;
  uint64_t v51 = v36;
  uint64_t v52 = v43;
  uint64_t v53 = v41;
  uint64_t v54 = v44;
  uint64_t v55 = v42;
  uint64_t v56 = v35;
  uint64_t v57 = v34;
  uint64_t v58 = v39;
  uint64_t v59 = v40;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  uint64_t v47 = a4;
  uint64_t v48 = a5;
  uint64_t v49 = a6;
  uint64_t v50 = a7;
  uint64_t v24 = (_OWORD *)type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components(0, (uint64_t)&v45);
  *uint64_t v31 = sub_19D5A31B8(v24);
  v31[1] = v25;
  *(void *)(v20 + v32) = v36;
  *a8 = v33;
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  uint64_t v53 = a4;
  uint64_t v54 = a5;
  uint64_t v55 = a6;
  uint64_t v56 = a7;
  _s4NodeOMa(0, (uint64_t)&v51);
  swift_storeEnumTagMultiPayload();
  if (v35) {
    uint64_t v26 = v34;
  }
  else {
    uint64_t v26 = 0;
  }
  uint64_t v27 = *v37;
  swift_bridgeObjectRetain();
  sub_19D59F590(v35);
  sub_19D59F5A0(v27);
  *long long v37 = v35;
  v37[1] = v26;
  if (v39)
  {
    swift_retain();
    uint64_t v28 = v39;
    uint64_t v29 = v40;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  swift_bridgeObjectRelease();
  sub_19D59F5A0(v43);
  sub_19D59F5A0(v44);
  sub_19D59F5A0(v35);
  sub_19D59F5A0(v28);
  uint64_t result = sub_19D59F5A0(*v38);
  *uint64_t v38 = v39;
  v38[1] = v29;
  return result;
}

uint64_t sub_19D5994AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x1F4188298](sub_19D5994D0, 0, 0);
}

uint64_t sub_19D5994D0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(v1, 1, 2, TupleTypeMetadata2);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t HierarchicalStateMachine.RootState.handleEvent(_:currentState:delegate:isolation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  *(void *)(v7 + 96) = a6;
  *(void *)(v7 + 104) = v6;
  *(void *)(v7 + 80) = a3;
  *(void *)(v7 + 88) = a5;
  *(void *)(v7 + 64) = a1;
  *(void *)(v7 + 72) = a2;
  uint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v7 + 112) = v14;
  long long v15 = a6[2];
  long long v16 = a6[3];
  *(_OWORD *)(v7 + 16) = a6[1];
  *(_OWORD *)(v7 + 32) = v15;
  *(_OWORD *)(v7 + 48) = v16;
  uint64_t v17 = (void *)_s4NodeOMa(0, v7 + 16);
  void *v14 = v7;
  v14[1] = sub_19D59968C;
  return sub_19D5999A8(a1, a2, a3, a4, a5, v17);
}

uint64_t sub_19D59968C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59979C, v1, 0);
}

uint64_t sub_19D59979C()
{
  uint64_t v1 = *(int **)(v0[13] + *(int *)(v0[12] + 72));
  if (v1)
  {
    uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v1 + *v1);
    uint64_t v2 = (void *)swift_task_alloc();
    v0[15] = v2;
    *uint64_t v2 = v0;
    v2[1] = sub_19D5998B4;
    uint64_t v3 = v0[9];
    uint64_t v4 = v0[10];
    uint64_t v5 = v0[8];
    return v8(v4, v3, v5);
  }
  else
  {
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_19D5998B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_19D5999A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  v7[19] = a6;
  v7[20] = v6;
  v7[17] = a4;
  v7[18] = a5;
  v7[15] = a2;
  v7[16] = a3;
  v7[14] = a1;
  uint64_t v10 = a6[2];
  v7[21] = v10;
  uint64_t v11 = a6[3];
  v7[22] = v11;
  uint64_t v12 = a6[4];
  v7[23] = v12;
  uint64_t v13 = a6[5];
  v7[24] = v13;
  uint64_t v14 = a6[6];
  v7[25] = v14;
  uint64_t v15 = a6[7];
  v7[2] = v10;
  v7[26] = v15;
  v7[3] = v11;
  v7[4] = v12;
  v7[5] = v13;
  v7[6] = v14;
  v7[7] = v15;
  uint64_t v16 = type metadata accessor for HierarchicalStateMachine.EventReaction(0, (uint64_t)(v7 + 2));
  v7[27] = v16;
  v7[28] = *(void *)(v16 - 8);
  v7[29] = swift_task_alloc();
  v7[30] = swift_task_alloc();
  uint64_t v17 = sub_19D603508();
  v7[31] = v17;
  v7[32] = *(void *)(v17 - 8);
  v7[33] = swift_task_alloc();
  v7[34] = *(a6 - 1);
  uint64_t v18 = swift_task_alloc();
  v7[8] = v10;
  v7[35] = v18;
  v7[9] = v11;
  v7[10] = v12;
  v7[11] = v13;
  v7[12] = v14;
  v7[13] = v15;
  uint64_t v19 = _s4NodeO13NodeStateTypeOMa(0, (uint64_t)(v7 + 8));
  v7[36] = v19;
  v7[37] = *(void *)(v19 - 8);
  v7[38] = swift_task_alloc();
  v7[39] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[40] = AssociatedTypeWitness;
  v7[41] = *(void *)(AssociatedTypeWitness - 8);
  v7[42] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D599C94, a5, 0);
}

uint64_t sub_19D599C94()
{
  uint64_t v1 = v0[41];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[39];
  uint64_t v5 = v0[37];
  uint64_t v4 = v0[38];
  uint64_t v42 = v0[26];
  uint64_t v43 = v0[36];
  uint64_t v6 = v0[24];
  uint64_t v40 = v0[23];
  uint64_t v41 = v0[25];
  uint64_t v38 = v0[40];
  uint64_t v39 = v0[22];
  uint64_t v37 = v0[21];
  uint64_t v7 = (void *)v0[19];
  (*(void (**)(void))(v6 + 24))();
  sub_19D59F680(v7, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v2, v38);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v4, 0, 1, v38);
  char v9 = sub_19D59C558(v3, v4, v37, v39, v40, v6, v41, v42);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(v4, v43);
  v10(v3, v43);
  if (v9)
  {
    uint64_t v13 = (int *)sub_19D59F8E8((_OWORD *)v0[19], v11, v12);
    v0[43] = v14;
    uint64_t v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v13 + *v13);
    uint64_t v15 = (void *)swift_task_alloc();
    v0[44] = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_19D59A0A0;
    uint64_t v16 = v0[17];
    uint64_t v17 = v0[14];
    uint64_t v18 = v0[15];
    return v44(v17, v18, v16);
  }
  else
  {
    uint64_t v20 = v0[33];
    uint64_t v21 = v0[34];
    uint64_t v22 = (void *)v0[19];
    sub_19D59FB58(v0[42], v22, v12, v20);
    int v23 = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v21 + 48))(v20, 1, v22);
    uint64_t v24 = v0[33];
    if (v23 == 1)
    {
      uint64_t v25 = v0[31];
      uint64_t v26 = v0[32];
      uint64_t v27 = v0[14];
      (*(void (**)(void, void))(v0[41] + 8))(v0[42], v0[40]);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
      __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(v27, 1, 2, TupleTypeMetadata2);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v29 = (uint64_t (*)(void))v0[1];
      return v29();
    }
    else
    {
      (*(void (**)(void, void, void))(v0[34] + 32))(v0[35], v0[33], v0[19]);
      uint64_t v30 = (void *)swift_task_alloc();
      v0[45] = v30;
      *uint64_t v30 = v0;
      v30[1] = sub_19D59A294;
      uint64_t v31 = v0[30];
      uint64_t v32 = v0[18];
      uint64_t v33 = v0[19];
      uint64_t v34 = v0[16];
      uint64_t v35 = v0[17];
      uint64_t v36 = v0[15];
      return sub_19D5999A8(v31, v36, v34, v35, v32, v33);
    }
  }
}

uint64_t sub_19D59A0A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_19D59A1CC, v1, 0);
}

uint64_t sub_19D59A1CC()
{
  (*(void (**)(void, void))(v0[41] + 8))(v0[42], v0[40]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D59A294()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59A3A4, v1, 0);
}

uint64_t sub_19D59A3A4()
{
  uint64_t v1 = v0[29];
  (*(void (**)(uint64_t, void, void))(v0[28] + 16))(v1, v0[30], v0[27]);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v1, 2, TupleTypeMetadata2) == 1)
  {
    uint64_t v4 = v0[28];
    uint64_t v3 = v0[29];
    uint64_t v5 = v0[27];
    uint64_t v6 = (_OWORD *)v0[19];
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v0[46] = v7;
    v0[47] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
    v7(v3, v5);
    uint64_t v10 = (int *)sub_19D59F8E8(v6, v8, v9);
    v0[48] = v11;
    uint64_t v26 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[49] = v12;
    *uint64_t v12 = v0;
    v12[1] = sub_19D59A654;
    uint64_t v13 = v0[17];
    uint64_t v14 = v0[14];
    uint64_t v15 = v0[15];
    return v26(v14, v15, v13);
  }
  else
  {
    uint64_t v18 = v0[41];
    uint64_t v17 = v0[42];
    uint64_t v19 = v0[40];
    uint64_t v21 = v0[29];
    uint64_t v20 = v0[30];
    uint64_t v22 = v0[27];
    uint64_t v23 = v0[28];
    uint64_t v24 = v0[14];
    (*(void (**)(void, void))(v0[34] + 8))(v0[35], v0[19]);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v24, v20, v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v25 = (uint64_t (*)(void))v0[1];
    return v25();
  }
}

uint64_t sub_19D59A654()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_19D59A780, v1, 0);
}

uint64_t sub_19D59A780()
{
  uint64_t v2 = *(void *)(v0 + 328);
  uint64_t v1 = *(void *)(v0 + 336);
  uint64_t v3 = *(void *)(v0 + 320);
  uint64_t v5 = *(void *)(v0 + 272);
  uint64_t v4 = *(void *)(v0 + 280);
  uint64_t v6 = *(void *)(v0 + 152);
  (*(void (**)(void, void))(v0 + 368))(*(void *)(v0 + 240), *(void *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t _s4NodeOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &_s4NodeOMn);
}

uint64_t HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:isolation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 64) = v11;
  long long v12 = a5[2];
  long long v13 = a5[3];
  *(_OWORD *)(v5 + 16) = a5[1];
  *(_OWORD *)(v5 + 32) = v12;
  *(_OWORD *)(v5 + 48) = v13;
  uint64_t v14 = (void *)_s4NodeOMa(0, v5 + 16);
  *uint64_t v11 = v5;
  v11[1] = sub_19D59A984;
  return sub_19D59AA78(a1, a2, a3, a4, v14);
}

uint64_t sub_19D59A984()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_19D59AA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v6[18] = a5;
  v6[19] = v5;
  v6[16] = a3;
  v6[17] = a4;
  v6[14] = a1;
  v6[15] = a2;
  uint64_t v9 = a5[2];
  v6[20] = v9;
  uint64_t v10 = a5[3];
  v6[21] = v10;
  uint64_t v11 = a5[4];
  v6[22] = v11;
  uint64_t v12 = a5[5];
  v6[23] = v12;
  uint64_t v13 = a5[6];
  v6[24] = v13;
  uint64_t v14 = a5[7];
  v6[2] = v9;
  v6[25] = v14;
  v6[3] = v10;
  v6[4] = v11;
  v6[5] = v12;
  v6[6] = v13;
  v6[7] = v14;
  uint64_t v15 = type metadata accessor for HierarchicalStateMachine.StateTransition(0, (uint64_t)(v6 + 2));
  v6[26] = v15;
  v6[27] = *(void *)(v15 - 8);
  v6[28] = swift_task_alloc();
  uint64_t v16 = sub_19D603508();
  v6[29] = v16;
  v6[30] = *(void *)(v16 - 8);
  v6[31] = swift_task_alloc();
  v6[32] = *(a5 - 1);
  uint64_t v17 = swift_task_alloc();
  v6[8] = v9;
  v6[33] = v17;
  v6[9] = v10;
  v6[10] = v11;
  v6[11] = v12;
  v6[12] = v13;
  v6[13] = v14;
  uint64_t v18 = _s4NodeO13NodeStateTypeOMa(0, (uint64_t)(v6 + 8));
  v6[34] = v18;
  v6[35] = *(void *)(v18 - 8);
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[38] = AssociatedTypeWitness;
  v6[39] = *(void *)(AssociatedTypeWitness - 8);
  v6[40] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D59AD48, a4, 0);
}

uint64_t sub_19D59AD48()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = v0[40];
  uint64_t v3 = v0[37];
  uint64_t v5 = v0[35];
  uint64_t v4 = v0[36];
  uint64_t v55 = v0[25];
  uint64_t v56 = v0[34];
  uint64_t v6 = v0[23];
  uint64_t v53 = v0[22];
  uint64_t v54 = v0[24];
  uint64_t v51 = v0[38];
  uint64_t v52 = v0[21];
  uint64_t v50 = v0[20];
  uint64_t v7 = (void *)v0[18];
  (*(void (**)(void))(v6 + 24))();
  sub_19D59F680(v7, v8, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v2, v51);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v4, 0, 1, v51);
  char v9 = sub_19D59C558(v3, v4, v50, v52, v53, v6, v54, v55);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(v4, v56);
  v10(v3, v56);
  if (v9)
  {
    uint64_t v13 = (int *)sub_19D59FEB8((_OWORD *)v0[18], v11, v12);
    v0[41] = v14;
    uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t))((char *)v13 + *v13);
    uint64_t v15 = (void *)swift_task_alloc();
    v0[42] = v15;
    *uint64_t v15 = v0;
    uint64_t v16 = sub_19D59B344;
LABEL_3:
    v15[1] = v16;
    uint64_t v17 = v0[16];
    uint64_t v18 = v0[14];
    return v57(v18, v17);
  }
  else
  {
    uint64_t v20 = v0[31];
    uint64_t v21 = v0[32];
    uint64_t v22 = (void *)v0[18];
    sub_19D59FB58(v0[40], v22, v12, v20);
    if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v21 + 48))(v20, 1, v22) != 1)
    {
      uint64_t v25 = v0[27];
      uint64_t v24 = v0[28];
      uint64_t v26 = v0[26];
      uint64_t v27 = v0[14];
      (*(void (**)(void, void, void))(v0[32] + 32))(v0[33], v0[31], v0[18]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v24, v27, v26);
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v42 = v0[28];
          uint64_t v44 = v0[20];
          uint64_t v43 = v0[21];
          TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
          uint64_t v46 = v42 + *(int *)(TupleTypeMetadata3 + 48);
          uint64_t v47 = *(void (**)(uint64_t, uint64_t))(*(void *)(v44 - 8) + 8);
          v47(v42 + *(int *)(TupleTypeMetadata3 + 64), v44);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v43 - 8) + 8))(v46, v43);
          v47(v42, v44);
          goto LABEL_18;
        case 2u:
          uint64_t v30 = v0[28];
          uint64_t v32 = v0[20];
          uint64_t v31 = v0[21];
          uint64_t v33 = swift_getTupleTypeMetadata3();
          uint64_t v34 = v30 + *(int *)(v33 + 48);
          uint64_t v35 = *(void (**)(uint64_t, uint64_t))(*(void *)(v32 - 8) + 8);
          v35(v30 + *(int *)(v33 + 64), v32);
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8))(v34, v31);
          v35(v30, v32);
          goto LABEL_14;
        case 3u:
          (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
LABEL_14:
          uint64_t v36 = (void *)swift_task_alloc();
          v0[46] = v36;
          void *v36 = v0;
          v36[1] = sub_19D59B8EC;
          uint64_t v37 = v0[17];
          uint64_t v38 = v0[18];
          uint64_t v39 = v0[15];
          uint64_t v40 = v0[16];
          uint64_t v41 = v0[14];
          return sub_19D59AA78(v41, v39, v40, v37, v38);
        default:
          (*(void (**)(void, void))(v0[27] + 8))(v0[28], v0[26]);
LABEL_18:
          uint64_t v48 = (int *)sub_19D59FEB8((_OWORD *)v0[18], v28, v29);
          v0[43] = v49;
          uint64_t v57 = (uint64_t (*)(uint64_t, uint64_t))((char *)v48 + *v48);
          uint64_t v15 = (void *)swift_task_alloc();
          v0[44] = v15;
          *uint64_t v15 = v0;
          uint64_t v16 = sub_19D59B534;
          goto LABEL_3;
      }
    }
    (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
    (*(void (**)(void, void))(v0[30] + 8))(v0[31], v0[29]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_19D59B344()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_19D59B470, v1, 0);
}

uint64_t sub_19D59B470()
{
  (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D59B534()
{
  uint64_t v1 = (void *)*v0;
  uint64_t v2 = (void *)*v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = (void *)swift_task_alloc();
  v1[45] = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_19D59B700;
  uint64_t v4 = v1[18];
  uint64_t v5 = v1[17];
  uint64_t v6 = v1[16];
  uint64_t v7 = v1[15];
  uint64_t v8 = v1[14];
  return sub_19D59AA78(v8, v7, v6, v5, v4);
}

uint64_t sub_19D59B700()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59B810, v1, 0);
}

uint64_t sub_19D59B810()
{
  (*(void (**)(void, void))(v0[32] + 8))(v0[33], v0[18]);
  (*(void (**)(void, void))(v0[39] + 8))(v0[40], v0[38]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D59B8EC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59B9FC, v1, 0);
}

uint64_t sub_19D59B9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (int *)sub_19D59FEB8(*(_OWORD **)(v3 + 144), a2, a3);
  *(void *)(v3 + 376) = v5;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 384) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_19D59BAE0;
  uint64_t v7 = *(void *)(v3 + 128);
  uint64_t v8 = *(void *)(v3 + 112);
  return v10(v8, v7);
}

uint64_t sub_19D59BAE0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_19D5A14E8, v1, 0);
}

uint64_t HierarchicalStateMachine.RootState.handleStateTransition(_:stateValue:otherStateLabel:delegate:isolation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 64) = v13;
  long long v14 = a6[2];
  long long v15 = a6[3];
  *(_OWORD *)(v6 + 16) = a6[1];
  *(_OWORD *)(v6 + 32) = v14;
  *(_OWORD *)(v6 + 48) = v15;
  uint64_t v16 = _s4NodeOMa(0, v6 + 16);
  void *v13 = v6;
  v13[1] = sub_19D5A14EC;
  return sub_19D59BD00(a1, a2, a3, a4, a5, v16);
}

uint64_t sub_19D59BD00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = a6;
  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  uint64_t v10 = sub_19D603508();
  v7[9] = v10;
  v7[10] = *(void *)(v10 - 8);
  v7[11] = swift_task_alloc();
  uint64_t v11 = *(void *)(v8 - 8);
  v8 -= 8;
  v7[12] = v11;
  v7[13] = swift_task_alloc();
  v7[14] = *(void *)(v8 + 48);
  v7[15] = *(void *)(v8 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7[16] = AssociatedTypeWitness;
  v7[17] = *(void *)(AssociatedTypeWitness - 8);
  v7[18] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D59BEAC, a5, 0);
}

uint64_t sub_19D59BEAC()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  uint64_t v4 = (void *)v0[7];
  (*(void (**)(void))(v0[14] + 24))(v0[15]);
  sub_19D59FB58(v1, v4, v5, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v3 + 48))(v2, 1, v4) == 1)
  {
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
    uint64_t v6 = (void *)swift_task_alloc();
    v0[21] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_19D59C3AC;
LABEL_8:
    uint64_t v18 = v0[6];
    uint64_t v19 = (void *)v0[7];
    uint64_t v20 = v0[5];
    uint64_t v22 = v0[2];
    uint64_t v21 = v0[3];
    return sub_19D59AA78(v22, v21, v20, v18, v19);
  }
  uint64_t v7 = (void *)v0[7];
  uint64_t v8 = v0[4];
  (*(void (**)(void, void, void *))(v0[12] + 32))(v0[13], v0[11], v7);
  if ((sub_19D5A012C(v8, v7) & 1) == 0)
  {
    uint64_t v17 = (void *)swift_task_alloc();
    v0[20] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_19D59C29C;
    goto LABEL_8;
  }
  char v9 = (void *)swift_task_alloc();
  v0[19] = v9;
  *char v9 = v0;
  v9[1] = sub_19D59C0D8;
  uint64_t v10 = v0[6];
  uint64_t v11 = v0[7];
  uint64_t v12 = v0[4];
  uint64_t v13 = v0[5];
  uint64_t v15 = v0[2];
  uint64_t v14 = v0[3];
  return sub_19D59BD00(v15, v14, v12, v13, v10, v11);
}

uint64_t sub_19D59C0D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59C1E8, v1, 0);
}

uint64_t sub_19D59C1E8()
{
  (*(void (**)(void, void))(v0[12] + 8))(v0[13], v0[7]);
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D59C29C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5A14F0, v1, 0);
}

uint64_t sub_19D59C3AC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D59C4BC, v1, 0);
}

uint64_t sub_19D59C4BC()
{
  (*(void (**)(void, void))(v0[17] + 8))(v0[18], v0[16]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D59C558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1F4188790](AssociatedTypeWitness, v16, v17);
  uint64_t v41 = (char *)&v40 - v18;
  uint64_t v42 = a3;
  v48[0] = a3;
  v48[1] = a4;
  v48[2] = a5;
  v48[3] = a6;
  uint64_t v43 = a6;
  v48[4] = a7;
  v48[5] = a8;
  uint64_t v19 = _s4NodeO13NodeStateTypeOMa(0, (uint64_t)v48);
  uint64_t v20 = *(void *)(v19 - 8);
  MEMORY[0x1F4188790](v19, v21, v22);
  uint64_t v47 = (char *)&v40 - v23;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v25 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v28 = MEMORY[0x1F4188790](TupleTypeMetadata2, v26, v27);
  uint64_t v30 = (char *)&v40 - v29;
  uint64_t v31 = (char *)&v40 + *(int *)(v28 + 48) - v29;
  uint64_t v44 = v20;
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v32((char *)&v40 - v29, v45, v19);
  v32(v31, v46, v19);
  uint64_t v46 = v15;
  uint64_t v33 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v33(v30, 1, AssociatedTypeWitness) == 1)
  {
    char v34 = 1;
    if (v33(v31, 1, AssociatedTypeWitness) == 1) {
      goto LABEL_8;
    }
  }
  else
  {
    v32(v47, (uint64_t)v30, v19);
    if (v33(v31, 1, AssociatedTypeWitness) != 1)
    {
      uint64_t v35 = v46;
      uint64_t v36 = v41;
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v41, v31, AssociatedTypeWitness);
      swift_getAssociatedConformanceWitness();
      uint64_t v37 = v47;
      char v34 = sub_19D603288();
      uint64_t v38 = *(void (**)(char *, uint64_t))(v35 + 8);
      v38(v36, AssociatedTypeWitness);
      v38(v37, AssociatedTypeWitness);
LABEL_8:
      uint64_t v25 = v44;
      goto LABEL_9;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v47, AssociatedTypeWitness);
  }
  char v34 = 0;
  uint64_t v19 = TupleTypeMetadata2;
LABEL_9:
  (*(void (**)(char *, uint64_t))(v25 + 8))(v30, v19);
  return v34 & 1;
}

uint64_t sub_19D59C8EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_19D5990F4;
  return HierarchicalStateMachine.RootState.handleEvent(_:currentState:delegate:isolation:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_19D59C9C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *uint64_t v11 = v5;
  v11[1] = sub_19D5990F4;
  return HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:isolation:)(a1, a2, a3, a4, a5);
}

uint64_t sub_19D59CA88(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_19D59C558(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7]);
}

uint64_t HierarchicalStateMachine.RootState<>.debugDescription.getter(_OWORD *a1, uint64_t a2)
{
  long long v3 = a1[2];
  v6[0] = a1[1];
  v6[1] = v3;
  v6[2] = a1[3];
  uint64_t v4 = (void *)_s4NodeOMa(0, (uint64_t)v6);
  return sub_19D59CAE8(v4, a2);
}

uint64_t sub_19D59CAE8(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v51 = a2;
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  uint64_t v10 = a1[7];
  uint64_t v52 = v6;
  uint64_t v53 = v5;
  uint64_t v47 = v9;
  uint64_t v48 = v7;
  uint64_t v54 = v7;
  uint64_t v55 = v8;
  uint64_t v56 = v9;
  uint64_t v57 = v10;
  uint64_t v46 = v10;
  uint64_t v11 = _s4NodeO13NodeStateTypeOMa(0, (uint64_t)&v52);
  uint64_t v50 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v12, v13);
  uint64_t v49 = (char *)&v45 - v14;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v16 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v19 = MEMORY[0x1F4188790](AssociatedTypeWitness, v17, v18);
  uint64_t v21 = (char *)&v45 - v20;
  MEMORY[0x1F4188790](v19, v22, v23);
  uint64_t v25 = (uint64_t *)((char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, void *))(v26 + 16))(v25, v3, a1);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v45 = *v25;
    MEMORY[0x1F4188790](EnumCaseMultiPayload, v28, v29);
    strcpy((char *)&v45 - 64, "nodeState eventHandler stateTransitionHandler substates ");
    uint64_t v52 = v11;
    uint64_t v53 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    uint64_t v54 = v53;
    uint64_t v55 = sub_19D6033B8();
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v31 = swift_projectBox();
    uint64_t v32 = *(void *)(v31 + *(int *)(TupleTypeMetadata + 80));
    uint64_t v33 = v49;
    uint64_t v34 = v50;
    uint64_t v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v31, v11);
    uint64_t v52 = v32;
    MEMORY[0x1F4188790](v35, v36, v37);
    *(&v45 - 8) = v6;
    *(&v45 - 7) = v5;
    *(&v45 - 6) = v48;
    *(&v45 - 5) = v8;
    uint64_t v38 = v46;
    *(&v45 - 4) = v47;
    *(&v45 - 3) = v38;
    *(&v45 - 2) = v51;
    uint64_t v39 = sub_19D6033B8();
    uint64_t WitnessTable = swift_getWitnessTable();
    uint64_t v52 = sub_19D59EEC0((void (*)(char *, char *))sub_19D59F5B0, (uint64_t)(&v45 - 10), v39, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBC248], WitnessTable, MEMORY[0x1E4FBC278], v41);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9444580);
    sub_19D59F624();
    sub_19D603278();
    swift_bridgeObjectRelease();
    uint64_t v52 = sub_19D59F2C0(v11);
    uint64_t v53 = v42;
    sub_19D6032B8();
    sub_19D6032B8();
    swift_bridgeObjectRelease();
    sub_19D6032B8();
    uint64_t v43 = v52;
    (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v11);
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    swift_getTupleTypeMetadata3();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t *, uint64_t))(v16 + 32))(v21, v25, AssociatedTypeWitness);
    uint64_t v43 = sub_19D603678();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v21, AssociatedTypeWitness);
  }
  return v43;
}

_UNKNOWN **sub_19D59D004()
{
  return &protocol witness table for HierarchicalStateMachine<A, B, C>.EventReaction;
}

uint64_t sub_19D59D010()
{
  return swift_getWitnessTable();
}

uint64_t sub_19D59D02C()
{
  return swift_getWitnessTable();
}

_UNKNOWN **sub_19D59D048()
{
  return &protocol witness table for HierarchicalStateMachine<A, B, C>.StateTransition;
}

uint64_t sub_19D59D054(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 40);
}

uint64_t sub_19D59D05C(_OWORD *a1, uint64_t a2)
{
  return HierarchicalStateMachine.RootState<>.debugDescription.getter(a1, *(void *)(a2 - 8));
}

uint64_t sub_19D59D064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 64);
}

uint64_t sub_19D59D06C(_OWORD *a1)
{
  long long v1 = a1[2];
  long long v4 = a1[1];
  long long v5 = v1;
  long long v6 = a1[3];
  uint64_t result = _s4NodeOMa(319, (uint64_t)&v4);
  if (v3 <= 0x3F)
  {
    *(void *)&long long v4 = *(void *)(result - 8) + 64;
    *((void *)&v4 + 1) = &unk_19D610040;
    *(void *)&long long v5 = &unk_19D610040;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_19D59D118(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v7 = 8;
  }
  else {
    unint64_t v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  int v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 31) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (void *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
  }
  else
  {
    unsigned int v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v11 >= 2) {
      unsigned int v11 = *(_DWORD *)a2 + 2;
    }
    uint64_t v13 = v7 | 1;
    if (v11 == 1)
    {
      uint64_t v15 = *a2;
      uint64_t v14 = (char *)a2 + 7;
      *a1 = v15;
      uint64_t v16 = (char *)a1 + 7;
      char v17 = 1;
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      uint64_t v16 = (char *)a1 + 7;
      uint64_t v18 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v14 = (char *)a2 + 7;
      uint64_t v19 = (void *)((unint64_t)&v14[v6] & 0xFFFFFFFFFFFFFFF8);
      uint64_t v20 = v19[1];
      void *v18 = *v19;
      v18[1] = v20;
      uint64_t v21 = (void *)(((unint64_t)v18 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v22 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v23 = v22[1];
      void *v21 = *v22;
      v21[1] = v23;
      swift_retain();
      char v17 = 0;
    }
    swift_retain();
    *((unsigned char *)a1 + v7) = v17;
    unint64_t v24 = (unint64_t)&v16[v13] & 0xFFFFFFFFFFFFFFF8;
    unint64_t v25 = (unint64_t)&v14[v13] & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)v25 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v24 = *(_OWORD *)v25;
    }
    else
    {
      uint64_t v26 = *(void *)(v25 + 8);
      *(void *)unint64_t v24 = *(void *)v25;
      *(void *)(v24 + 8) = v26;
      swift_retain();
    }
    unint64_t v27 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v28 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    if (*(void *)v28 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
      return a1;
    }
    uint64_t v29 = *(void *)(v28 + 8);
    *(void *)unint64_t v27 = *(void *)v28;
    *(void *)(v27 + 8) = v29;
  }
  swift_retain();
  return a1;
}

uint64_t sub_19D59D330(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v4 = 8;
  }
  else {
    unint64_t v4 = ((((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v5 = *((unsigned __int8 *)a1 + v4);
  if (v5 >= 2 && (v4 & 0xFFFFFFF8) != 0) {
    unsigned int v5 = *a1 + 2;
  }
  if (v5 != 1)
  {
    (*(void (**)(_DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
    swift_release();
  }
  uint64_t result = swift_release();
  int v8 = (void *)(((unint64_t)a1 + v4 + 8) & 0xFFFFFFFFFFFFFFF8);
  if (*v8 >= 0xFFFFFFFFuLL) {
    uint64_t result = swift_release();
  }
  if (*(void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8) >= 0xFFFFFFFFuLL)
  {
    return swift_release();
  }
  return result;
}

void *sub_19D59D4A4(void *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v6 = 8;
  }
  else {
    unint64_t v6 = ((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFF8) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    *a1 = *(void *)a2;
    char v9 = 1;
  }
  else
  {
    (*(void (**)(void *, _DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
    uint64_t v10 = (void *)(((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (void *)(((unint64_t)a2 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_retain();
    char v9 = 0;
  }
  swift_retain();
  *((unsigned char *)a1 + v6) = v9;
  unint64_t v16 = ((unint64_t)a1 + v6 + 8) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v17 = ((unint64_t)a2 + v6 + 8) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v17 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v16 = *(_OWORD *)v17;
  }
  else
  {
    uint64_t v18 = *(void *)(v17 + 8);
    *(void *)unint64_t v16 = *(void *)v17;
    *(void *)(v16 + 8) = v18;
    swift_retain();
  }
  unint64_t v19 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v20 = (v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v20 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
  }
  else
  {
    uint64_t v21 = *(void *)(v20 + 8);
    *(void *)unint64_t v19 = *(void *)v20;
    *(void *)(v19 + 8) = v21;
    swift_retain();
  }
  return a1;
}

_DWORD *sub_19D59D66C(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = AssociatedTypeWitness;
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = ((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v9 = *((unsigned __int8 *)a1 + v8);
    BOOL v10 = v9 < 2 || (v8 & 0xFFFFFFF8) == 0;
    if (!v10) {
      unsigned int v9 = *a1 + 2;
    }
    if (v9 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    unsigned int v11 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v11 >= 2) {
      unsigned int v11 = *a2 + 2;
    }
    if (v11 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *((unsigned char *)a1 + v8) = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      uint64_t v13 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v14 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v15 = v14[1];
      void *v13 = *v14;
      v13[1] = v15;
      unint64_t v16 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v17 = (void *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v18 = v17[1];
      void *v16 = *v17;
      v16[1] = v18;
      *((unsigned char *)a1 + v8) = 0;
      swift_retain();
    }
    swift_retain();
  }
  unint64_t v19 = (((*(void *)(*(void *)(v5 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v20 = v19 + 24;
  BOOL v10 = v19 == -16;
  uint64_t v21 = 16;
  if (!v10) {
    uint64_t v21 = v20;
  }
  uint64_t v22 = (void *)(((unint64_t)a1 + v21) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v23 = (unint64_t *)(((unint64_t)a2 + v21) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v24 = *v23;
  if (*v22 < 0xFFFFFFFFuLL)
  {
    if (v24 >= 0xFFFFFFFF)
    {
      unint64_t v26 = v23[1];
      void *v22 = v24;
      v22[1] = v26;
      swift_retain();
      goto LABEL_31;
    }
  }
  else
  {
    if (v24 >= 0xFFFFFFFF)
    {
      unint64_t v25 = v23[1];
      void *v22 = v24;
      v22[1] = v25;
      swift_retain();
      swift_release();
      goto LABEL_31;
    }
    swift_release();
  }
  *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
LABEL_31:
  unint64_t v27 = (void *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v28 = (unint64_t *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v29 = *v28;
  if (*v27 < 0xFFFFFFFFuLL)
  {
    if (v29 >= 0xFFFFFFFF)
    {
      unint64_t v31 = v28[1];
      void *v27 = v29;
      v27[1] = v31;
      swift_retain();
      return a1;
    }
LABEL_37:
    *(_OWORD *)unint64_t v27 = *(_OWORD *)v28;
    return a1;
  }
  if (v29 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_37;
  }
  unint64_t v30 = v28[1];
  void *v27 = v29;
  v27[1] = v30;
  swift_retain();
  swift_release();
  return a1;
}

void *sub_19D59D95C(void *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v6 = 8;
  }
  else {
    unint64_t v6 = ((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFF8) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    *a1 = *(void *)a2;
    char v9 = 1;
  }
  else
  {
    (*(void (**)(void *, _DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
    char v9 = 0;
    BOOL v10 = (_OWORD *)(((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (_OWORD *)(((unint64_t)a2 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    *BOOL v10 = *v11;
    *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  }
  *((unsigned char *)a1 + v6) = v9;
  unint64_t v12 = ((unint64_t)a1 + v6 + 8) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v13 = ((unint64_t)a2 + v6 + 8) & 0xFFFFFFFFFFFFFFF8;
  if (*(void *)v13 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)unint64_t v12 = *(_OWORD *)v13;
  }
  else
  {
    uint64_t v14 = *(void *)(v13 + 8);
    *(void *)unint64_t v12 = *(void *)v13;
    *(void *)(v12 + 8) = v14;
  }
  unint64_t v15 = (v12 + 23) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v16 = (uint64_t *)((v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v17 = *v16;
  if ((unint64_t)*v16 < 0xFFFFFFFF)
  {
    *(_OWORD *)unint64_t v15 = *(_OWORD *)v16;
  }
  else
  {
    uint64_t v18 = v16[1];
    *(void *)unint64_t v15 = v17;
    *(void *)(v15 + 8) = v18;
  }
  return a1;
}

_DWORD *sub_19D59DB00(_DWORD *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = AssociatedTypeWitness;
  if (a1 != a2)
  {
    uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v7 = *(void *)(v6 + 64);
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
      unint64_t v8 = 8;
    }
    else {
      unint64_t v8 = ((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v9 = *((unsigned __int8 *)a1 + v8);
    BOOL v10 = v9 < 2 || (v8 & 0xFFFFFFF8) == 0;
    if (!v10) {
      unsigned int v9 = *a1 + 2;
    }
    if (v9 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    unsigned int v11 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v11 >= 2) {
      unsigned int v11 = *a2 + 2;
    }
    if (v11 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v13 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v13 = 0;
      uint64_t v14 = (_OWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v15 = (_OWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
      _OWORD *v14 = *v15;
      *(_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
    }
    *((unsigned char *)a1 + v8) = v13;
  }
  unint64_t v16 = (((*(void *)(*(void *)(v5 - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v17 = v16 + 24;
  BOOL v10 = v16 == -16;
  uint64_t v18 = 16;
  if (!v10) {
    uint64_t v18 = v17;
  }
  unint64_t v19 = (void *)(((unint64_t)a1 + v18) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v20 = (unint64_t *)(((unint64_t)a2 + v18) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v21 = *v20;
  if (*v19 < 0xFFFFFFFFuLL)
  {
    if (v21 >= 0xFFFFFFFF)
    {
      unint64_t v23 = v20[1];
      void *v19 = v21;
      v19[1] = v23;
      goto LABEL_31;
    }
  }
  else
  {
    if (v21 >= 0xFFFFFFFF)
    {
      unint64_t v22 = v20[1];
      void *v19 = v21;
      v19[1] = v22;
      swift_release();
      goto LABEL_31;
    }
    swift_release();
  }
  *(_OWORD *)unint64_t v19 = *(_OWORD *)v20;
LABEL_31:
  unint64_t v24 = (void *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v25 = (unint64_t *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v26 = *v25;
  if (*v24 < 0xFFFFFFFFuLL)
  {
    if (v26 >= 0xFFFFFFFF)
    {
      unint64_t v28 = v25[1];
      void *v24 = v26;
      v24[1] = v28;
      return a1;
    }
LABEL_37:
    *(_OWORD *)unint64_t v24 = *(_OWORD *)v25;
    return a1;
  }
  if (v26 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_37;
  }
  unint64_t v27 = v25[1];
  void *v24 = v26;
  v24[1] = v27;
  swift_release();
  return a1;
}

uint64_t sub_19D59DDC8(_DWORD *a1, unsigned int a2)
{
  unint64_t v4 = (((*(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = v4 + 17;
  BOOL v6 = v4 == -16;
  uint64_t v7 = 9;
  if (!v6) {
    uint64_t v7 = v5;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0x7FFFFFFF) {
    goto LABEL_23;
  }
  unint64_t v8 = ((v7 + 30) & 0xFFFFFFFFFFFFFFF8) + 16;
  uint64_t v9 = v8 & 0xFFFFFFF8;
  unsigned int v10 = a2 - 2147483645;
  if ((v8 & 0xFFFFFFF8) != 0) {
    unsigned int v10 = 2;
  }
  if (v10 >= 0x10000) {
    int v11 = 4;
  }
  else {
    int v11 = 2;
  }
  if (v10 < 0x100) {
    int v12 = 1;
  }
  else {
    int v12 = v11;
  }
  if (v12 == 4)
  {
    int v13 = *(_DWORD *)((char *)a1 + v8);
    if (v13) {
      goto LABEL_19;
    }
LABEL_23:
    unint64_t v16 = *(void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v16 >= 0xFFFFFFFF) {
      LODWORD(v16) = -1;
    }
    if ((v16 + 1) >= 2) {
      return v16;
    }
    else {
      return 0;
    }
  }
  if (v12 != 2)
  {
    int v13 = *((unsigned __int8 *)a1 + v8);
    if (v13) {
      goto LABEL_19;
    }
    goto LABEL_23;
  }
  int v13 = *(unsigned __int16 *)((char *)a1 + v8);
  if (!v13) {
    goto LABEL_23;
  }
LABEL_19:
  int v15 = v13 - 1;
  if (v9)
  {
    int v15 = 0;
    LODWORD(v9) = *a1;
  }
  return (v9 | v15) + 0x7FFFFFFF;
}

void sub_19D59DF04(_DWORD *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6 = (((*(void *)(*(void *)(swift_getAssociatedTypeWitness() - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = v6 + 17;
  BOOL v8 = v6 == -16;
  uint64_t v9 = 9;
  if (!v8) {
    uint64_t v9 = v7;
  }
  size_t v10 = ((v9 + 30) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (a3 < 0x7FFFFFFF)
  {
    int v13 = 0;
  }
  else
  {
    unsigned int v11 = a3 - 2147483645;
    if (((v9 + 30) & 0xFFFFFFF8) != 0xFFFFFFF0) {
      unsigned int v11 = 2;
    }
    if (v11 >= 0x10000) {
      int v12 = 4;
    }
    else {
      int v12 = 2;
    }
    if (v11 < 0x100) {
      int v13 = 1;
    }
    else {
      int v13 = v12;
    }
  }
  if (a2 > 0x7FFFFFFE)
  {
    if (((v9 + 30) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v14 = a2 - 2147483646;
    }
    else {
      int v14 = 1;
    }
    if (((v9 + 30) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      bzero(a1, v10);
      *a1 = a2 - 0x7FFFFFFF;
    }
    switch(v13)
    {
      case 1:
        *((unsigned char *)a1 + v10) = v14;
        break;
      case 2:
        *(_WORD *)((char *)a1 + v10) = v14;
        break;
      case 3:
LABEL_32:
        __break(1u);
        JUMPOUT(0x19D59E0ACLL);
      case 4:
        *(_DWORD *)((char *)a1 + v10) = v14;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v13)
    {
      case 1:
        *((unsigned char *)a1 + v10) = 0;
        if (!a2) {
          return;
        }
        goto LABEL_26;
      case 2:
        *(_WORD *)((char *)a1 + v10) = 0;
        goto LABEL_25;
      case 3:
        goto LABEL_32;
      case 4:
        *(_DWORD *)((char *)a1 + v10) = 0;
        if (!a2) {
          return;
        }
        goto LABEL_26;
      default:
LABEL_25:
        if (a2) {
LABEL_26:
        }
          *(void *)(((unint64_t)a1 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) = a2;
        break;
    }
  }
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState);
}

uint64_t sub_19D59E0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 56);
}

uint64_t sub_19D59E0F4()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[4] = v2;
    v2[5] = "\b";
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19D59E1B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v7 = 8;
  }
  else {
    unint64_t v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  int v8 = *(_DWORD *)(v5 + 80);
  if ((v8 & 0x1000F8) != 0 || (v7 | 1) > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = v10;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
  }
  else
  {
    unsigned int v11 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v11 >= 2) {
      unsigned int v11 = *(_DWORD *)a2 + 2;
    }
    if (v11 == 1)
    {
      *a1 = *a2;
      *((unsigned char *)a1 + v7) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      int v13 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      int v14 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v15 = v14[1];
      void *v13 = *v14;
      v13[1] = v15;
      unint64_t v16 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v17 = (void *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v18 = v17[1];
      void *v16 = *v17;
      v16[1] = v18;
      *((unsigned char *)a1 + v7) = 0;
      swift_retain();
    }
  }
  swift_retain();
  return a1;
}

uint64_t sub_19D59E33C(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  unint64_t v4 = 8;
  if (((((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) != 0xFFFFFFFFFFFFFFF0) {
    unint64_t v4 = ((((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v5 = *((unsigned __int8 *)a1 + v4);
  uint64_t v6 = v4 & 0xFFFFFFF8;
  if (v5 >= 2 && v6 != 0) {
    unsigned int v5 = *a1 + 2;
  }
  if (v5 != 1)
  {
    (*(void (**)(_DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
    swift_release();
  }
  return swift_release();
}

void *sub_19D59E450(void *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v6 = 8;
  }
  else {
    unint64_t v6 = ((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFF8) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    *a1 = *(void *)a2;
    char v9 = 1;
  }
  else
  {
    (*(void (**)(void *, _DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
    uint64_t v10 = (void *)(((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (void *)(((unint64_t)a2 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    int v13 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    int v14 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_retain();
    char v9 = 0;
  }
  swift_retain();
  *((unsigned char *)a1 + v6) = v9;
  return a1;
}

_DWORD *sub_19D59E59C(_DWORD *a1, _DWORD *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
      unint64_t v7 = 8;
    }
    else {
      unint64_t v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0) {
      unsigned int v8 = *a1 + 2;
    }
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    unsigned int v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v10 >= 2) {
      unsigned int v10 = *a2 + 2;
    }
    if (v10 == 1)
    {
      *(void *)a1 = *(void *)a2;
      *((unsigned char *)a1 + v7) = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      uint64_t v12 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      int v13 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v14 = v13[1];
      *uint64_t v12 = *v13;
      v12[1] = v14;
      uint64_t v15 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
      unint64_t v16 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v17 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v17;
      *((unsigned char *)a1 + v7) = 0;
      swift_retain();
    }
    swift_retain();
  }
  return a1;
}

void *sub_19D59E768(void *a1, _DWORD *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v6 = 8;
  }
  else {
    unint64_t v6 = ((((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  }
  unsigned int v7 = *((unsigned __int8 *)a2 + v6);
  if (v7 >= 2 && (v6 & 0xFFFFFFF8) != 0) {
    unsigned int v7 = *a2 + 2;
  }
  if (v7 == 1)
  {
    *a1 = *(void *)a2;
    char v9 = 1;
  }
  else
  {
    (*(void (**)(void *, _DWORD *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
    char v9 = 0;
    unsigned int v10 = (_OWORD *)(((unint64_t)a1 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (_OWORD *)(((unint64_t)a2 + v5 + 7) & 0xFFFFFFFFFFFFFFF8);
    *unsigned int v10 = *v11;
    *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
  }
  *((unsigned char *)a1 + v6) = v9;
  return a1;
}

_DWORD *sub_19D59E8A0(_DWORD *a1, _DWORD *a2)
{
  if (a1 != a2)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
    uint64_t v6 = *(void *)(v5 + 64);
    if (((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
      unint64_t v7 = 8;
    }
    else {
      unint64_t v7 = ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    }
    unsigned int v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2 && (v7 & 0xFFFFFFF8) != 0) {
      unsigned int v8 = *a1 + 2;
    }
    if (v8 != 1)
    {
      (*(void (**)(_DWORD *, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
      swift_release();
    }
    swift_release();
    unsigned int v10 = *((unsigned __int8 *)a2 + v7);
    if ((v7 & 0xFFFFFFF8) != 0 && v10 >= 2) {
      unsigned int v10 = *a2 + 2;
    }
    if (v10 == 1)
    {
      *(void *)a1 = *(void *)a2;
      char v12 = 1;
    }
    else
    {
      (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      char v12 = 0;
      int v13 = (_OWORD *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v14 = (_OWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
      _OWORD *v13 = *v14;
      *(_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
    }
    *((unsigned char *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_19D59EA5C(unsigned __int8 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v5 = ((((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16;
  if (((((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v5 = 8;
  }
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_20;
  }
  uint64_t v6 = v5 | 1;
  char v7 = 8 * (v5 | 1);
  if ((v5 | 1) <= 3)
  {
    unsigned int v8 = (a2 + ~(-1 << v7) - 254) >> v7;
    if (v8 > 0xFFFE)
    {
      int v9 = *(_DWORD *)&a1[v6];
      if (!v9) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (v8 > 0xFE)
    {
      int v9 = *(unsigned __int16 *)&a1[v6];
      if (!*(_WORD *)&a1[v6]) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (!v8) {
      goto LABEL_20;
    }
  }
  int v9 = a1[v6];
  if (!a1[v6])
  {
LABEL_20:
    unsigned int v13 = a1[v5];
    if (v13 >= 2) {
      return (v13 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
LABEL_13:
  int v11 = (v9 - 1) << v7;
  if (v6 >= 4) {
    int v11 = 0;
  }
  if (v6 == 1) {
    int v12 = *a1;
  }
  else {
    int v12 = *(_DWORD *)a1;
  }
  return (v12 | v11) + 255;
}

void sub_19D59EB80(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v7 = ((((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((((*(void *)(v6 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v7 = 8;
  }
  size_t v8 = v7 | 1;
  if (a3 < 0xFF)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = (a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8);
    if (v12 > 0xFFFE)
    {
      int v9 = 4;
    }
    else if (v12 >= 0xFF)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 != 0;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (a2 <= 0xFE)
  {
    switch(v9)
    {
      case 1:
        a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_24;
      case 2:
        *(_WORD *)&a1[v8] = 0;
        goto LABEL_23;
      case 3:
        goto LABEL_31;
      case 4:
        *(_DWORD *)&a1[v8] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_24;
      default:
LABEL_23:
        if (a2) {
LABEL_24:
        }
          a1[v7] = -(char)a2;
        break;
    }
    return;
  }
  unsigned int v10 = a2 - 255;
  if (v8 < 4)
  {
    int v11 = (v10 >> (8 * v8)) + 1;
    v10 &= ~(-1 << (8 * v8));
    bzero(a1, v8);
    if (v8 == 1)
    {
      *a1 = v10;
      goto LABEL_20;
    }
  }
  else
  {
    bzero(a1, v7 | 1);
    int v11 = 1;
  }
  *(_DWORD *)a1 = v10;
LABEL_20:
  switch(v9)
  {
    case 1:
      a1[v8] = v11;
      break;
    case 2:
      *(_WORD *)&a1[v8] = v11;
      break;
    case 3:
LABEL_31:
      __break(1u);
      JUMPOUT(0x19D59ED5CLL);
    case 4:
      *(_DWORD *)&a1[v8] = v11;
      break;
    default:
      return;
  }
}

uint64_t sub_19D59ED84(_DWORD *a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  unint64_t v3 = ((((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16;
  if (((((*(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    unint64_t v3 = 8;
  }
  uint64_t result = *((unsigned __int8 *)a1 + v3);
  uint64_t v5 = v3 & 0xFFFFFFF8;
  if (result >= 2 && v5 != 0) {
    return (*a1 + 2);
  }
  return result;
}

void sub_19D59EE18(unsigned int *a1, unsigned int a2)
{
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unint64_t v5 = ((((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (((((*(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) == 0xFFFFFFFFFFFFFFF0) {
    size_t v6 = 8;
  }
  else {
    size_t v6 = v5;
  }
  if (a2 > 1)
  {
    if (v6) {
      char v7 = 2;
    }
    else {
      char v7 = a2;
    }
    if (v6) {
      unsigned int v8 = a2 - 2;
    }
    else {
      unsigned int v8 = 0;
    }
    *((unsigned char *)a1 + v6) = v7;
    bzero(a1, v6);
    *a1 = v8;
  }
  else
  {
    *((unsigned char *)a1 + v6) = a2;
  }
}

uint64_t sub_19D59EEC0(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v34 = a5;
  uint64_t v35 = a8;
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v33 = *(void *)(a5 - 8);
  MEMORY[0x1F4188790](a1, a2, a3);
  uint64_t v46 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v39 = *(void (***)(char *, uint64_t))(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x1F4188790](AssociatedTypeWitness, v10, v11);
  uint64_t v14 = (char *)&v32 - v13;
  MEMORY[0x1F4188790](v12, v15, v16);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = swift_getAssociatedTypeWitness();
  uint64_t v36 = *(void *)(v19 - 8);
  uint64_t v37 = v19;
  MEMORY[0x1F4188790](v19, v20, v21);
  unint64_t v23 = (char *)&v32 - v22;
  uint64_t v24 = sub_19D603498();
  if (!v24) {
    return sub_19D603368();
  }
  uint64_t v25 = v24;
  uint64_t v49 = sub_19D603268();
  uint64_t v38 = sub_19D6035E8();
  sub_19D6035B8();
  uint64_t v42 = v8;
  uint64_t result = sub_19D603488();
  if (v25 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v40 = (void (**)(char *))(v39 + 2);
    uint64_t v41 = v18;
    ++v39;
    while (1)
    {
      unint64_t v27 = (void (*)(char *, void))sub_19D6034C8();
      unint64_t v28 = v14;
      unint64_t v29 = v14;
      uint64_t v30 = AssociatedTypeWitness;
      (*v40)(v28);
      v27(v48, 0);
      uint64_t v31 = v47;
      v44(v29, v46);
      if (v31) {
        break;
      }
      uint64_t v47 = 0;
      (*v39)(v29, v30);
      sub_19D6035C8();
      sub_19D6034A8();
      --v25;
      uint64_t v14 = v29;
      if (!v25)
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v23, v37);
        return v49;
      }
    }
    (*v39)(v29, v30);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v23, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v33 + 32))(v35, v46, v34);
  }
  return result;
}

uint64_t sub_19D59F2C0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = MEMORY[0x1F4188790](AssociatedTypeWitness, v6, v7);
  uint64_t v10 = (char *)&v18 - v9;
  MEMORY[0x1F4188790](v8, v11, v12);
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v14, v2, a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, AssociatedTypeWitness) == 1) {
    return 0x3E746F6F723CLL;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v14, AssociatedTypeWitness);
  uint64_t v16 = sub_19D603678();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, AssociatedTypeWitness);
  return v16;
}

uint64_t sub_19D59F4A8(void *a1, uint64_t a2)
{
  return sub_19D59CAE8(a1, *(void *)(a2 - 8));
}

uint64_t sub_19D59F4B0(uint64_t a1)
{
  return sub_19D59F2C0(a1);
}

uint64_t _s4NodeO13NodeStateTypeOMa(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &_s4NodeO13NodeStateTypeOMn);
}

uint64_t sub_19D59F4D0()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D59F4E0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = sub_19D594A94;
  return MEMORY[0x1F4188298](sub_19D5994D0, 0, 0);
}

uint64_t sub_19D59F590(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_19D59F5A0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_19D59F5B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 64);
  long long v4 = *(_OWORD *)(v1 + 32);
  v8[0] = *(_OWORD *)(v1 + 16);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(v1 + 48);
  uint64_t v5 = _s4NodeOMa(0, (uint64_t)v8);
  uint64_t result = sub_19D59CAE8(v5, v3);
  *a1 = result;
  a1[1] = v7;
  return result;
}

unint64_t sub_19D59F624()
{
  unint64_t result = qword_1E9444588[0];
  if (!qword_1E9444588[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444580);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1E9444588);
  }
  return result;
}

uint64_t sub_19D59F680@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  MEMORY[0x1F4188790](a1, v3, a2);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = a1[3];
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    uint64_t v14 = a1[7];
    uint64_t v20 = a1[2];
    uint64_t v9 = v20;
    uint64_t v21 = v10;
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    uint64_t v24 = v13;
    uint64_t v25 = v14;
    _s4NodeO13NodeStateTypeOMa(255, (uint64_t)&v20);
    sub_19D6033B8();
    uint64_t v15 = swift_projectBox();
    uint64_t v20 = v9;
    uint64_t v21 = v10;
    uint64_t v22 = v11;
    uint64_t v23 = v12;
    uint64_t v24 = v13;
    uint64_t v25 = v14;
    uint64_t v16 = _s4NodeO13NodeStateTypeOMa(0, (uint64_t)&v20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16))(a3, v15, v16);
    return swift_release();
  }
  else
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    swift_getTupleTypeMetadata3();
    swift_release();
    swift_release();
    uint64_t v19 = *(void *)(AssociatedTypeWitness - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(a3, v7, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v19 + 56))(a3, 0, 1, AssociatedTypeWitness);
  }
}

uint64_t sub_19D59F8E8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1F4188790](a1, v3, a3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v6);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    MEMORY[0x1F4188790](EnumCaseMultiPayload, v9, v10);
    strcpy((char *)&v16 - 64, "nodeState eventHandler stateTransitionHandler substates ");
    long long v11 = a1[2];
    long long v16 = a1[1];
    long long v17 = v11;
    long long v18 = a1[3];
    *(void *)&long long v16 = _s4NodeO13NodeStateTypeOMa(255, (uint64_t)&v16);
    *((void *)&v16 + 1) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    *(void *)&long long v17 = *((void *)&v16 + 1);
    *((void *)&v17 + 1) = sub_19D6033B8();
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v13 = *(void *)(swift_projectBox() + *(int *)(TupleTypeMetadata + 48));
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    uint64_t v13 = *(void *)&v6[*(int *)(swift_getTupleTypeMetadata3() + 48)];
    swift_release();
    (*(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v6, AssociatedTypeWitness);
  }
  return v13;
}

uint64_t sub_19D59FB58@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = *(a2 - 1);
  MEMORY[0x1F4188790](a1, a2, a3);
  uint64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, void *))(v7 + 16))(v9, v10, a2);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v26[1] = v26;
    MEMORY[0x1F4188790](EnumCaseMultiPayload, v12, v13);
    strcpy((char *)&v26[-8], "nodeState eventHandler stateTransitionHandler substates ");
    uint64_t v14 = a2[2];
    uint64_t v15 = a2[3];
    uint64_t v16 = a2[4];
    uint64_t v17 = a2[5];
    v26[2] = a4;
    v26[0] = a1;
    uint64_t v18 = a2[6];
    uint64_t v19 = a2[7];
    uint64_t v27 = v14;
    uint64_t v28 = v15;
    uint64_t v29 = v16;
    uint64_t v30 = v17;
    uint64_t v31 = v18;
    uint64_t v32 = v19;
    uint64_t v27 = _s4NodeO13NodeStateTypeOMa(255, (uint64_t)&v27);
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    uint64_t v29 = v28;
    uint64_t v30 = sub_19D6033B8();
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v21 = swift_projectBox();
    uint64_t v27 = *(void *)(v21 + *(int *)(TupleTypeMetadata + 80));
    MEMORY[0x1F4188790](v21, v22, v23);
    v26[-8] = v14;
    v26[-7] = v15;
    v26[-6] = v16;
    v26[-5] = v17;
    v26[-4] = v18;
    v26[-3] = v19;
    v26[-2] = v26[0];
    sub_19D6033B8();
    swift_getWitnessTable();
    sub_19D603308();
    return swift_release();
  }
  else
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    swift_getTupleTypeMetadata3();
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v7 + 56))(a4, 1, 1, a2);
    return (*(uint64_t (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v9, AssociatedTypeWitness);
  }
}

uint64_t sub_19D59FEB8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1F4188790](a1, v3, a3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v6);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    MEMORY[0x1F4188790](EnumCaseMultiPayload, v9, v10);
    strcpy((char *)&v17 - 64, "nodeState eventHandler stateTransitionHandler substates ");
    long long v11 = a1[2];
    long long v17 = a1[1];
    long long v18 = v11;
    long long v19 = a1[3];
    *(void *)&long long v17 = _s4NodeO13NodeStateTypeOMa(255, (uint64_t)&v17);
    *((void *)&v17 + 1) = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    *(void *)&long long v18 = *((void *)&v17 + 1);
    *((void *)&v18 + 1) = sub_19D6033B8();
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v13 = *(void *)(swift_projectBox() + *(int *)(TupleTypeMetadata + 64));
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    swift_release();
    uint64_t v13 = *(void *)&v6[*(int *)(TupleTypeMetadata3 + 64)];
    (*(void (**)(char *, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(v6, AssociatedTypeWitness);
  }
  return v13;
}

uint64_t sub_19D5A012C(uint64_t a1, void *a2)
{
  uint64_t v69 = a1;
  uint64_t v4 = a2[2];
  uint64_t v3 = a2[3];
  uint64_t v5 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v8 = a2[6];
  uint64_t v7 = a2[7];
  uint64_t v72 = v4;
  uint64_t v73 = v3;
  uint64_t v64 = v5;
  uint64_t v65 = v3;
  uint64_t v74 = v5;
  uint64_t v75 = v6;
  uint64_t v76 = v8;
  uint64_t v77 = v7;
  uint64_t v66 = _s4NodeO13NodeStateTypeOMa(0, (uint64_t)&v72);
  uint64_t v68 = *(void *)(v66 - 8);
  uint64_t v11 = MEMORY[0x1F4188790](v66, v9, v10);
  v67 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11, v13, v14);
  uint64_t v16 = (char *)&v58 - v15;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v70 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v20 = MEMORY[0x1F4188790](AssociatedTypeWitness, v18, v19);
  uint64_t v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = MEMORY[0x1F4188790](v20, v23, v24);
  uint64_t v27 = (char *)&v58 - v26;
  MEMORY[0x1F4188790](v25, v28, v29);
  uint64_t v31 = (uint64_t *)((char *)&v58 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, char *, void *))(v32 + 16))(v31, v71, a2);
  uint64_t EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v59 = v22;
    uint64_t v61 = v7;
    uint64_t v62 = v8;
    uint64_t v36 = *v31;
    MEMORY[0x1F4188790](EnumCaseMultiPayload, v34, v35);
    strcpy((char *)&v58 - 64, "nodeState eventHandler stateTransitionHandler substates ");
    uint64_t v37 = v66;
    uint64_t v72 = v66;
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    uint64_t v74 = v73;
    uint64_t v75 = sub_19D6033B8();
    uint64_t TupleTypeMetadata = swift_getTupleTypeMetadata();
    uint64_t v39 = swift_projectBox();
    uint64_t v60 = *(void *)(v39 + *(int *)(TupleTypeMetadata + 80));
    uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 16);
    v40(v16, v39, v37);
    uint64_t v41 = v67;
    v71 = v16;
    v40(v67, (uint64_t)v16, v37);
    uint64_t v42 = v70;
    int v43 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v70 + 48))(v41, 1, AssociatedTypeWitness);
    uint64_t v63 = v36;
    if (v43 == 1)
    {
      uint64_t v44 = v68;
      uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v67, v37);
      uint64_t v48 = v69;
      uint64_t v49 = v6;
      uint64_t v50 = v44;
LABEL_7:
      uint64_t v72 = v60;
      MEMORY[0x1F4188790](v45, v46, v47);
      uint64_t v55 = v65;
      *(&v58 - 8) = v4;
      *(&v58 - 7) = v55;
      *(&v58 - 6) = v64;
      *(&v58 - 5) = v49;
      uint64_t v56 = v61;
      *(&v58 - 4) = v62;
      *(&v58 - 3) = v56;
      *(&v58 - 2) = v48;
      sub_19D6033B8();
      swift_getWitnessTable();
      char v52 = sub_19D603328();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v71, v37);
      swift_release();
      return v52 & 1;
    }
    uint64_t v53 = v59;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v59, v67, AssociatedTypeWitness);
    uint64_t v49 = v6;
    swift_getAssociatedConformanceWitness();
    uint64_t v48 = v69;
    char v54 = sub_19D603288();
    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v53, AssociatedTypeWitness);
    uint64_t v50 = v68;
    if ((v54 & 1) == 0) {
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v37);
    swift_release();
    char v52 = 1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
    swift_getTupleTypeMetadata3();
    swift_release();
    swift_release();
    uint64_t v51 = v70;
    (*(void (**)(char *, uint64_t *, uint64_t))(v70 + 32))(v27, v31, AssociatedTypeWitness);
    swift_getAssociatedConformanceWitness();
    char v52 = sub_19D603288();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v27, AssociatedTypeWitness);
  }
  return v52 & 1;
}

uint64_t sub_19D5A0740()
{
  return sub_19D5A075C() & 1;
}

uint64_t sub_19D5A075C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  long long v2 = *(_OWORD *)(v0 + 32);
  v5[0] = *(_OWORD *)(v0 + 16);
  v5[1] = v2;
  v5[2] = *(_OWORD *)(v0 + 48);
  uint64_t v3 = (void *)_s4NodeOMa(0, (uint64_t)v5);
  return sub_19D5A012C(v1, v3) & 1;
}

uint64_t sub_19D5A07C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 48);
}

uint64_t sub_19D5A07D0()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19D5A0860(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if (*(_DWORD *)(v5 + 84)) {
    size_t v6 = *(void *)(v5 + 64);
  }
  else {
    size_t v6 = *(void *)(v5 + 64) + 1;
  }
  uint64_t v7 = *(_DWORD *)(v5 + 80);
  if (v7 > 7 || (*(_DWORD *)(v5 + 80) & 0x100000) != 0 || v6 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  else
  {
    uint64_t v11 = AssociatedTypeWitness;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
    {
      memcpy(a1, a2, v6);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, v11);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_19D5A09BC(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, AssociatedTypeWitness);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, AssociatedTypeWitness);
  }
  return result;
}

void *sub_19D5A0A94(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84)) {
      size_t v6 = *(void *)(v5 + 64);
    }
    else {
      size_t v6 = *(void *)(v5 + 64) + 1;
    }
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *sub_19D5A0B98(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  size_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, AssociatedTypeWitness);
  int v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    uint64_t v12 = *(void (**)(void *, uint64_t))(v5 + 8);
    uint64_t v11 = v5 + 8;
    v12(a1, AssociatedTypeWitness);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v13 = v10;
  }
  else {
    size_t v13 = v10 + 1;
  }
  memcpy(a1, a2, v13);
  return a1;
}

void *sub_19D5A0D14(void *a1, const void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(a2, 1, AssociatedTypeWitness))
  {
    if (*(_DWORD *)(v5 + 84)) {
      size_t v6 = *(void *)(v5 + 64);
    }
    else {
      size_t v6 = *(void *)(v5 + 64) + 1;
    }
    memcpy(a1, a2, v6);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
  }
  return a1;
}

void *sub_19D5A0E18(void *a1, void *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  size_t v6 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  int v7 = v6(a1, 1, AssociatedTypeWitness);
  int v8 = v6(a2, 1, AssociatedTypeWitness);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, AssociatedTypeWitness);
      return a1;
    }
    int v9 = *(_DWORD *)(v5 + 84);
    size_t v10 = *(void *)(v5 + 64);
  }
  else
  {
    if (!v8)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(a1, a2, AssociatedTypeWitness);
      return a1;
    }
    uint64_t v12 = *(void (**)(void *, uint64_t))(v5 + 8);
    uint64_t v11 = v5 + 8;
    v12(a1, AssociatedTypeWitness);
    int v9 = *(_DWORD *)(v11 + 76);
    size_t v10 = *(void *)(v11 + 56);
  }
  if (v9) {
    size_t v13 = v10;
  }
  else {
    size_t v13 = v10 + 1;
  }
  memcpy(a1, a2, v13);
  return a1;
}

uint64_t sub_19D5A0F94(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  unsigned int v7 = v6 - 1;
  if (!v6) {
    unsigned int v7 = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!v6) {
    ++v8;
  }
  if (!a2) {
    return 0;
  }
  if (a2 > v7)
  {
    char v9 = 8 * v8;
    if (v8 > 3) {
      goto LABEL_8;
    }
    unsigned int v11 = ((a2 - v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)((char *)a1 + v8);
      if (v10) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_23;
        }
LABEL_8:
        int v10 = *((unsigned __int8 *)a1 + v8);
        if (!*((unsigned char *)a1 + v8)) {
          goto LABEL_23;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if (v8 > 3) {
          int v12 = 0;
        }
        if (v8)
        {
          if (v8 > 3) {
            LODWORD(v8) = 4;
          }
          switch((int)v8)
          {
            case 2:
              LODWORD(v8) = *a1;
              break;
            case 3:
              LODWORD(v8) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
              break;
            case 4:
              LODWORD(v8) = *(_DWORD *)a1;
              break;
            default:
              LODWORD(v8) = *(unsigned __int8 *)a1;
              break;
          }
        }
        return v7 + (v8 | v12) + 1;
      }
      int v10 = *(unsigned __int16 *)((char *)a1 + v8);
      if (*(unsigned __int16 *)((char *)a1 + v8)) {
        goto LABEL_15;
      }
    }
  }
LABEL_23:
  if (v6 < 2) {
    return 0;
  }
  unsigned int v14 = (*(uint64_t (**)(unsigned __int16 *))(v5 + 48))(a1);
  if (v14 >= 2) {
    return v14 - 1;
  }
  else {
    return 0;
  }
}

void sub_19D5A1154(unsigned char *a1, unsigned int a2, unsigned int a3)
{
  int v6 = 0;
  uint64_t v7 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }
  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1;
  }
  if (a3 <= v9) {
    goto LABEL_12;
  }
  if (v10 <= 3)
  {
    unsigned int v11 = ((a3 - v9 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v11))
    {
      int v6 = 4;
      if (v9 >= a2) {
        goto LABEL_20;
      }
      goto LABEL_13;
    }
    if (v11 >= 0x100) {
      int v6 = 2;
    }
    else {
      int v6 = v11 > 1;
    }
LABEL_12:
    if (v9 >= a2) {
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  int v6 = 1;
  if (v9 >= a2)
  {
LABEL_20:
    switch(v6)
    {
      case 1:
        a1[v10] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      case 2:
        *(_WORD *)&a1[v10] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_25;
      case 3:
        goto LABEL_38;
      case 4:
        *(_DWORD *)&a1[v10] = 0;
        goto LABEL_24;
      default:
LABEL_24:
        if (a2)
        {
LABEL_25:
          if (v8 >= 2)
          {
            uint64_t v15 = *(void (**)(unsigned char *, void))(v7 + 56);
            v15(a1, a2 + 1);
          }
        }
        break;
    }
    return;
  }
LABEL_13:
  unsigned int v12 = ~v9 + a2;
  if (v10 < 4)
  {
    int v13 = (v12 >> (8 * v10)) + 1;
    if (v10)
    {
      int v14 = v12 & ~(-1 << (8 * v10));
      bzero(a1, v10);
      if (v10 == 3)
      {
        *(_WORD *)a1 = v14;
        a1[2] = BYTE2(v14);
      }
      else if (v10 == 2)
      {
        *(_WORD *)a1 = v14;
      }
      else
      {
        *a1 = v14;
      }
    }
  }
  else
  {
    bzero(a1, v10);
    *(_DWORD *)a1 = v12;
    int v13 = 1;
  }
  switch(v6)
  {
    case 1:
      a1[v10] = v13;
      break;
    case 2:
      *(_WORD *)&a1[v10] = v13;
      break;
    case 3:
LABEL_38:
      __break(1u);
      JUMPOUT(0x19D5A13B4);
    case 4:
      *(_DWORD *)&a1[v10] = v13;
      break;
    default:
      return;
  }
}

uint64_t sub_19D5A13DC(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 48);
  return v3(a1, 1, AssociatedTypeWitness);
}

uint64_t sub_19D5A1460(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56);
  return v5(a1, a2, 1, AssociatedTypeWitness);
}

uint64_t static HierarchicalStateMachine.EventReaction.transition(to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  long long v17 = (void *)(a8 + *(int *)(TupleTypeMetadata2 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 16))(a8, a1, a2);
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = a2;
  v18[3] = a3;
  v18[4] = a4;
  v18[5] = a5;
  v18[6] = a6;
  v18[7] = a7;
  *long long v17 = &unk_1E9444618;
  v17[1] = v18;
  uint64_t v19 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56);
  return v19(a8, 0, 2, TupleTypeMetadata2);
}

uint64_t sub_19D5A1630()
{
  return sub_19D5A2A50(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_19D5A1664()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D5A1674()
{
  unint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *unint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  return sub_19D594A94();
}

uint64_t static HierarchicalStateMachine.EventReaction.transition(to:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = (void *)(a9 + *(int *)(TupleTypeMetadata2 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(a9, a1, a4);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a4;
  v19[3] = a5;
  v19[4] = a6;
  v19[5] = a7;
  v19[6] = a8;
  v19[7] = a10;
  v19[8] = a2;
  v19[9] = a3;
  void *v18 = &unk_1E9444628;
  v18[1] = v19;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(a9, 0, 2, TupleTypeMetadata2);
  return swift_retain();
}

uint64_t sub_19D5A185C(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_19D5990F4;
  return v5();
}

uint64_t sub_19D5A192C()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

uint64_t sub_19D5A1964()
{
  uint64_t v2 = *(int **)(v0 + 64);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_19D594A94;
  uint64_t v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v3[2] = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_19D5990F4;
  return v6();
}

uint64_t static HierarchicalStateMachine.EventReaction.transition(to:action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  unsigned int v11 = (void *)(a5 + *(int *)(TupleTypeMetadata2 + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 16))(a5, a1, a4);
  *unsigned int v11 = a2;
  v11[1] = a3;
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 56))(a5, 0, 2, TupleTypeMetadata2);
  return swift_retain();
}

uint64_t sub_19D5A1B7C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19D5A1C18(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  int v8 = *(_DWORD *)(v6 + 80);
  if ((v8 & 0x1000F8) != 0 || ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v8 & 0xF8) + 23) & (unsigned __int16)~(v8 & 0xF8) & 0x1F8));
LABEL_14:
    swift_retain();
    return a1;
  }
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v11 = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    if (v11 != -1) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  if (!(*(unsigned int (**)(uint64_t *))(v6 + 48))(a2))
  {
LABEL_13:
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    unsigned int v12 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v13 = v12[1];
    int v14 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    void *v14 = *v12;
    v14[1] = v13;
    goto LABEL_14;
  }
LABEL_9:
  memcpy(a1, a2, ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  return a1;
}

uint64_t sub_19D5A1D80(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  if (*(_DWORD *)(v4 + 84) >= 0x7FFFFFFFu)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v4 + 48))(a1);
    if (result) {
      return result;
    }
    goto LABEL_7;
  }
  unint64_t v6 = *(void *)((a1 + *(void *)(v4 + 64) + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v6 >= 0xFFFFFFFF) {
    LODWORD(v6) = -1;
  }
  uint64_t result = (v6 + 1);
  if (v6 == -1)
  {
LABEL_7:
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
    return swift_release();
  }
  return result;
}

void *sub_19D5A1E8C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v8 = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v8 >= 0xFFFFFFFF) {
      LODWORD(v8) = -1;
    }
    if (v8 != -1) {
      goto LABEL_3;
    }
LABEL_7:
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    unsigned int v9 = (void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v10 = v9[1];
    unint64_t v11 = (void *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    *unint64_t v11 = *v9;
    v11[1] = v10;
    swift_retain();
    return a1;
  }
  if (!(*(unsigned int (**)(const void *))(v6 + 48))(a2)) {
    goto LABEL_7;
  }
LABEL_3:
  memcpy(a1, a2, ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  return a1;
}

void *sub_19D5A1FBC(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 >= 0x7FFFFFFF)
  {
    unsigned int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
    int v10 = v9(a1, v7, v5);
    int v11 = v9(a2, v7, v5);
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      long long v17 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v18 = (void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
      uint64_t v19 = v18[1];
      *long long v17 = *v18;
      v17[1] = v19;
      swift_retain();
      swift_release();
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    swift_release();
    goto LABEL_10;
  }
  unint64_t v15 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v16 = *(void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v16 >= 0xFFFFFFFF) {
    LODWORD(v16) = -1;
  }
  int v11 = v16 + 1;
  if (v15 >= 0xFFFFFFFF) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11)
  {
LABEL_10:
    memcpy(a1, a2, ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
  unsigned int v12 = (void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v13 = v12[1];
  int v14 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  void *v14 = *v12;
  v14[1] = v13;
  swift_retain();
  return a1;
}

void *sub_19D5A21B8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  if (*(_DWORD *)(v6 + 84) < 0x7FFFFFFFu)
  {
    unint64_t v8 = *(void *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v8 >= 0xFFFFFFFF) {
      LODWORD(v8) = -1;
    }
    if (v8 != -1) {
      goto LABEL_3;
    }
LABEL_7:
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    *(_OWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8);
    return a1;
  }
  if (!(*(unsigned int (**)(const void *))(v6 + 48))(a2)) {
    goto LABEL_7;
  }
LABEL_3:
  memcpy(a1, a2, ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
  return a1;
}

void *sub_19D5A22E4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 >= 0x7FFFFFFF)
  {
    unsigned int v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
    int v10 = v9(a1, v7, v5);
    int v11 = v9(a2, v7, v5);
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      *(_OWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
      swift_release();
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
    swift_release();
    goto LABEL_10;
  }
  unint64_t v12 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  unint64_t v13 = *(void *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v13 >= 0xFFFFFFFF) {
    LODWORD(v13) = -1;
  }
  int v11 = v13 + 1;
  if (v12 >= 0xFFFFFFFF) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11)
  {
LABEL_10:
    memcpy(a1, a2, ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
  *(_OWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_19D5A24D4(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    int v7 = 0x7FFFFFFF;
  }
  else {
    int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  if (v7 - 2 < a2)
  {
    unint64_t v8 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
    unsigned int v9 = a2 - v7;
    uint64_t v10 = v8 & 0xFFFFFFF8;
    unsigned int v11 = v9 + 3;
    if ((v8 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v8);
        if (!v14) {
          break;
        }
        goto LABEL_21;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v8);
        if (v14) {
          goto LABEL_21;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x19D5A2650);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v8);
        if (!v14) {
          break;
        }
LABEL_21:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) - 1;
      default:
        break;
    }
  }
  if (v5 < 0x7FFFFFFF)
  {
    unint64_t v18 = *(void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v18 >= 0xFFFFFFFF) {
      LODWORD(v18) = -1;
    }
    unsigned int v17 = v18 + 1;
  }
  else
  {
    unsigned int v17 = (*(uint64_t (**)(void))(v4 + 48))();
  }
  if (v17 >= 3) {
    return v17 - 2;
  }
  else {
    return 0;
  }
}

void sub_19D5A2664(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  unsigned int v9 = v8 - 2;
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  size_t v11 = ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  unsigned int v12 = a3 - v8 + 3;
  if (((v10 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0) {
    unsigned int v12 = 2;
  }
  if (v12 >= 0x10000) {
    int v13 = 4;
  }
  else {
    int v13 = 2;
  }
  if (v12 < 0x100) {
    int v13 = 1;
  }
  if (v12 >= 2) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v9 < a3) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v9 < a2)
  {
    if (((v10 + 7) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      int v16 = a2 - v8 + 2;
    }
    else {
      int v16 = 1;
    }
    if (((v10 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      int v17 = a2 - v8 + 1;
      bzero(a1, v11);
      *(_DWORD *)a1 = v17;
    }
    switch(v15)
    {
      case 1:
        a1[v11] = v16;
        return;
      case 2:
        *(_WORD *)&a1[v11] = v16;
        return;
      case 3:
        goto LABEL_47;
      case 4:
        *(_DWORD *)&a1[v11] = v16;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 2:
      *(_WORD *)&a1[v11] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_32;
    case 3:
LABEL_47:
      __break(1u);
      JUMPOUT(0x19D5A288CLL);
    case 4:
      *(_DWORD *)&a1[v11] = 0;
      goto LABEL_31;
    default:
LABEL_31:
      if (a2)
      {
LABEL_32:
        if (a2 + 2 <= v8)
        {
          if (a2 != -2)
          {
            if (v7 < 0x7FFFFFFF)
            {
              uint64_t v20 = (void *)((unint64_t)&a1[v10 + 7] & 0xFFFFFFFFFFFFFFF8);
              if (((a2 + 2) & 0x80000000) != 0)
              {
                uint64_t v21 = a2 - 2147483646;
                v20[1] = 0;
              }
              else
              {
                uint64_t v21 = a2 + 1;
              }
              void *v20 = v21;
            }
            else
            {
              uint64_t v19 = *(void (**)(void))(v6 + 56);
              v19();
            }
          }
        }
        else if (((v10 + 7) & 0xFFFFFFF8) != 0xFFFFFFF0)
        {
          int v18 = a2 - v8 + 1;
          bzero(a1, ((v10 + 7) & 0xFFFFFFFFFFFFFFF8) + 16);
          *(_DWORD *)a1 = v18;
        }
      }
      return;
  }
}

uint64_t sub_19D5A28B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8);
  if (*(_DWORD *)(v2 + 84) >= 0x7FFFFFFFu) {
    return (*(uint64_t (**)(void))(v2 + 48))();
  }
  unint64_t v4 = *(void *)((a1 + *(void *)(v2 + 64) + 7) & 0xFFFFFFFFFFFFFFF8);
  if (v4 >= 0xFFFFFFFF) {
    LODWORD(v4) = -1;
  }
  return (v4 + 1);
}

void sub_19D5A292C(_DWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (v7 >= a2)
  {
    if (a2)
    {
      if (v5 < 0x7FFFFFFF)
      {
        size_t v11 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
        if ((a2 & 0x80000000) != 0)
        {
          *size_t v11 = a2 ^ 0x80000000;
          v11[1] = 0;
        }
        else
        {
          *size_t v11 = a2 - 1;
        }
      }
      else
      {
        uint64_t v10 = *(void (**)(void))(v4 + 56);
        v10();
      }
    }
  }
  else
  {
    size_t v8 = ((v6 + 7) & 0xFFFFFFF8) + 16;
    if (v8)
    {
      int v9 = ~v7 + a2;
      bzero(a1, v8);
      *a1 = v9;
    }
  }
}

uint64_t type metadata accessor for HierarchicalStateMachine.EventReaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.EventReaction);
}

uint64_t sub_19D5A2A50(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t StateMachine.Error.description.getter()
{
  return 0xD000000000000013;
}

void *_s5ErrorOwCP(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5ErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

void *_s5ErrorOwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *_s5ErrorOwta(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5ErrorOwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s5ErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_19D5A2C38()
{
  return 0;
}

ValueMetadata *type metadata accessor for StateMachine.Error()
{
  return &type metadata for StateMachine.Error;
}

uint64_t unwrap<A>(_:_:fileID:function:line:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  v22[4] = a6;
  uint64_t v23 = a7;
  v22[2] = a4;
  v22[3] = a5;
  v22[1] = a3;
  uint64_t v12 = sub_19D603508();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14, v15);
  int v17 = (char *)v22 - v16;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)v22 - v16, a1, v12);
  uint64_t v18 = *(void *)(a9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, a9) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(a8, v17, a9);
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  unint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_19D603568();
  swift_bridgeObjectRelease();
  if (a2)
  {
    unint64_t v24 = 0xD000000000000011;
    unint64_t v25 = 0x800000019D60BA20;
    sub_19D6032B8();
    sub_19D6032B8();
  }
  else
  {
    unint64_t v24 = 0xD00000000000001DLL;
    unint64_t v25 = 0x800000019D60BA00;
  }
  sub_19D6032B8();
  sub_19D6032B8();
  sub_19D6032B8();
  sub_19D6032B8();
  uint64_t v26 = v23;
  sub_19D603678();
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  _s12HMFoundation4FlowO5erroryySSFZ_0();
  uint64_t v20 = self;
  uint64_t v21 = (void *)sub_19D603298();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_hmfErrorWithCode_reason_, 19, v21);

  return swift_willThrow();
}

uint64_t HMF.VisibleDevice.init(idsIdentifierString:mediaRouteIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t HMF.VisibleDevice.idsIdentifierString.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.VisibleDevice.mediaRouteIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _s13VisibleDeviceVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s13VisibleDeviceVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *_s13VisibleDeviceVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *_s13VisibleDeviceVwca(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *_s13VisibleDeviceVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13VisibleDeviceVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s13VisibleDeviceVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.VisibleDevice()
{
  return &type metadata for HMF.VisibleDevice;
}

void *sub_19D5A31B8(_OWORD *a1)
{
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[3];
  uint64_t v5 = v1[4];
  if (v3) {
    uint64_t v6 = v1[2];
  }
  else {
    uint64_t v6 = 0;
  }
  if (v4) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  if (!v3)
  {
    if (!v4)
    {
      uint64_t v13 = (_OWORD *)swift_allocObject();
      long long v14 = a1[2];
      v13[1] = a1[1];
      v13[2] = v14;
      v13[3] = a1[3];
      uint64_t v10 = &unk_1E94450F0;
      goto LABEL_11;
    }
    sub_19D59F590(0);
  }
  uint64_t v8 = swift_allocObject();
  long long v9 = a1[2];
  *(_OWORD *)(v8 + 16) = a1[1];
  *(_OWORD *)(v8 + 32) = v9;
  *(_OWORD *)(v8 + 48) = a1[3];
  *(void *)(v8 + 64) = v3;
  *(void *)(v8 + 72) = v6;
  *(void *)(v8 + 80) = v4;
  *(void *)(v8 + 88) = v7;
  uint64_t v10 = &unk_1E9445100;
LABEL_11:
  size_t v11 = v10;
  sub_19D59F590(v3);
  sub_19D59F590(v4);
  return v11;
}

uint64_t HierarchicalStateMachine.__allocating_init(stateValueType:eventType:delegateEventType:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v6 = v4[10];
  uint64_t v28 = v4[11];
  uint64_t v29 = v6;
  uint64_t v7 = v4[12];
  uint64_t v26 = v4[13];
  uint64_t v27 = v7;
  uint64_t v8 = v4[14];
  uint64_t v24 = v4[15];
  uint64_t v25 = v8;
  uint64_t v30 = v6;
  uint64_t v31 = v28;
  uint64_t v32 = v7;
  uint64_t v33 = v26;
  uint64_t v34 = v8;
  uint64_t v35 = v24;
  uint64_t v9 = type metadata accessor for HierarchicalStateMachine.RootState(0, (uint64_t)&v30);
  uint64_t v12 = MEMORY[0x1F4188790](v9 - 8, v10, v11);
  uint64_t v23 = (uint64_t *)((char *)&v21 - v13);
  a4(&v30, v12);
  uint64_t v14 = v31;
  uint64_t v15 = v33;
  uint64_t v16 = v35;
  uint64_t v17 = v36;
  uint64_t v22 = v36;
  swift_bridgeObjectRetain();
  sub_19D59F590(v14);
  sub_19D59F590(v15);
  sub_19D59F590(v16);
  sub_19D59F590(v17);
  uint64_t v18 = v23;
  sub_19D5990F8(&v30, v29, v28, v27, v26, v25, v24, v23);
  uint64_t v19 = HierarchicalStateMachine.__allocating_init(rootState:)((uint64_t)v18);
  swift_bridgeObjectRelease();
  sub_19D59F5A0(v14);
  sub_19D59F5A0(v15);
  sub_19D59F5A0(v16);
  sub_19D59F5A0(v22);
  return v19;
}

uint64_t static HierarchicalStateMachine.makeStartedMachine(initialValue:eventType:delegateEventType:builder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[6] = a5;
  v6[7] = v5;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  _OWORD v6[3] = a2;
  return MEMORY[0x1F4188298](sub_19D5A3478, 0, 0);
}

uint64_t sub_19D5A3478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 64) = HierarchicalStateMachine.__allocating_init(stateValueType:eventType:delegateEventType:builder:)(a1, a2, a3, *(void (**)(uint64_t *__return_ptr, uint64_t))(v3 + 40));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 72) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_19D5A3524;
  uint64_t v5 = *(void *)(v3 + 16);
  return HierarchicalStateMachine.start(with:)(v5);
}

uint64_t sub_19D5A3524()
{
  uint64_t v1 = *v0;
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(uint64_t))(v5 + 8);
  uint64_t v3 = *(void *)(v1 + 64);
  return v2(v3);
}

uint64_t sub_19D5A3630(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v7 = a1[5];
  uint64_t v10 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v11 = a1[8];
  uint64_t v19 = *a1;
  swift_bridgeObjectRetain();
  long long v12 = a2[2];
  v18[0] = a2[1];
  v18[1] = v12;
  v18[2] = a2[3];
  _s4NodeOMa(255, (uint64_t)v18);
  sub_19D6033B8();
  swift_getWitnessTable();
  uint64_t result = sub_19D603388();
  uint64_t v14 = v2[1];
  if (v14)
  {
    uint64_t v6 = v2[2];
  }
  else
  {
    uint64_t result = sub_19D59F590(v4);
    uint64_t v14 = v4;
  }
  v2[1] = v14;
  v2[2] = v6;
  uint64_t v15 = v2[3];
  if (v15)
  {
    uint64_t v8 = v2[4];
  }
  else
  {
    uint64_t result = sub_19D59F590(v5);
    uint64_t v15 = v5;
  }
  v2[3] = v15;
  v2[4] = v8;
  uint64_t v16 = v2[5];
  if (v16)
  {
    uint64_t v10 = v2[6];
  }
  else
  {
    uint64_t result = sub_19D59F590(v7);
    uint64_t v16 = v7;
  }
  v2[5] = v16;
  void v2[6] = v10;
  uint64_t v17 = v2[7];
  if (v17)
  {
    uint64_t v11 = v2[8];
  }
  else
  {
    uint64_t result = sub_19D59F590(v9);
    uint64_t v17 = v9;
  }
  v2[7] = v17;
  v2[8] = v11;
  return result;
}

uint64_t sub_19D5A3784(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_19D5990F4;
  return v5();
}

uint64_t sub_19D5A3850(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 104) = a7;
  *(void *)(v8 + 112) = a8;
  *(void *)(v8 + 88) = a5;
  *(void *)(v8 + 96) = a6;
  *(void *)(v8 + 72) = a3;
  *(void *)(v8 + 80) = a4;
  *(void *)(v8 + 56) = v14;
  *(void *)(v8 + 64) = a1;
  *(void *)(v8 + 16) = a7;
  *(void *)(v8 + 24) = a8;
  *(_OWORD *)(v8 + 32) = v12;
  *(void *)(v8 + 48) = v13;
  uint64_t v9 = type metadata accessor for HierarchicalStateMachine.StateTransition(0, v8 + 16);
  *(void *)(v8 + 120) = v9;
  *(void *)(v8 + 128) = *(void *)(v9 - 8);
  *(void *)(v8 + 136) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5A393C, 0, 0);
}

uint64_t sub_19D5A393C()
{
  (*(void (**)(void, void, void))(v0[16] + 16))(v0[17], v0[8], v0[15]);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
    case 2u:
      uint64_t v1 = v0[17];
      uint64_t v3 = v0[13];
      uint64_t v2 = v0[14];
      TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
      uint64_t v5 = v1 + *(int *)(TupleTypeMetadata3 + 48);
      uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
      v6(v1 + *(int *)(TupleTypeMetadata3 + 64), v3);
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v5, v2);
      v6(v1, v3);
      goto LABEL_11;
    case 3u:
      uint64_t v10 = (int *)v0[11];
      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v13 = (uint64_t (*)(void))((char *)v10 + *v10);
      uint64_t v8 = (void *)swift_task_alloc();
      v0[19] = v8;
      *uint64_t v8 = v0;
      uint64_t v9 = sub_19D5A3D78;
      goto LABEL_7;
    default:
      uint64_t v7 = (int *)v0[9];
      if (v7)
      {
        uint64_t v13 = (uint64_t (*)(void))((char *)v7 + *v7);
        uint64_t v8 = (void *)swift_task_alloc();
        v0[18] = v8;
        *uint64_t v8 = v0;
        uint64_t v9 = sub_19D5A3C04;
LABEL_7:
        v8[1] = v9;
        return v13();
      }
      else
      {
LABEL_10:
        (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
LABEL_11:
        swift_task_dealloc();
        long long v12 = (uint64_t (*)(void))v0[1];
        return v12();
      }
  }
}

uint64_t sub_19D5A3C04()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5A3D00, 0, 0);
}

uint64_t sub_19D5A3D00()
{
  (*(void (**)(void, void))(v0[16] + 8))(v0[17], v0[15]);
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D5A3D78()
{
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5A9FEC, 0, 0);
}

uint64_t static HierarchicalStateMachine.RootState.RootStateBuilder.buildBlock(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = a1;
  uint64_t v15 = a2;
  *(void *)&long long v16 = a3;
  *((void *)&v16 + 1) = a4;
  *(void *)&long long v17 = a5;
  *((void *)&v17 + 1) = a6;
  *(void *)&long long v18 = a7;
  _s4NodeOMa(0, (uint64_t)&v15);
  uint64_t v15 = sub_19D603268();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v14[0] = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a6;
  v14[5] = a7;
  type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components(255, (uint64_t)v14);
  sub_19D6033B8();
  swift_getWitnessTable();
  return sub_19D603318();
}

uint64_t sub_19D5A3F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)a2;
  v13[5] = a8;
  uint64_t v14 = v8;
  long long v9 = *(_OWORD *)(a2 + 24);
  long long v15 = *(_OWORD *)(a2 + 8);
  long long v16 = v9;
  long long v10 = *(_OWORD *)(a2 + 56);
  long long v17 = *(_OWORD *)(a2 + 40);
  long long v18 = v10;
  v13[0] = a3;
  v13[1] = a4;
  v13[2] = a5;
  v13[3] = a6;
  v13[4] = a7;
  uint64_t v11 = (_OWORD *)type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components(0, (uint64_t)v13);
  return sub_19D5A3630(&v14, v11);
}

double static HierarchicalStateMachine.RootState.RootStateBuilder.buildExpression(_:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  return sub_19D5A41E4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, uint64_t *))type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State, a7, (void (*)(uint64_t))sub_19D5A4058);
}

{
  return sub_19D5A41E4(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, uint64_t *))type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState, a7, (void (*)(uint64_t))sub_19D5A4338);
}

uint64_t sub_19D5A4058@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  long long v10 = (void *)(a2 + *(int *)(TupleTypeMetadata3 + 48));
  uint64_t v11 = (void *)(a2 + *(int *)(TupleTypeMetadata3 + 64));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a2, v3, AssociatedTypeWitness);
  uint64_t v12 = *(int *)(a1 + 72);
  uint64_t v13 = (void *)(v3 + *(int *)(a1 + 68));
  uint64_t v14 = v13[1];
  *long long v10 = *v13;
  v10[1] = v14;
  uint64_t v15 = v3 + v12;
  uint64_t v16 = *(void *)(v3 + v12);
  uint64_t v17 = *(void *)(v15 + 8);
  *uint64_t v11 = v16;
  v11[1] = v17;
  uint64_t v19 = v7;
  long long v20 = *(_OWORD *)(a1 + 24);
  uint64_t v21 = v6;
  long long v22 = *(_OWORD *)(a1 + 48);
  _s4NodeOMa(0, (uint64_t)&v19);
  swift_storeEnumTagMultiPayload();
  swift_retain();
  return swift_retain();
}

double sub_19D5A41E4@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t (*a7)(void, uint64_t *)@<X7>, uint64_t a8@<X8>, void (*a9)(uint64_t))
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  _s4NodeOMa(255, (uint64_t)&v20);
  sub_19D603688();
  swift_allocObject();
  uint64_t v16 = sub_19D603338();
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v17 = a7(0, &v20);
  a9(v17);
  sub_19D6033B8();
  *(void *)a8 = v16;
  double result = 0.0;
  *(_OWORD *)(a8 + 8) = 0u;
  *(_OWORD *)(a8 + 24) = 0u;
  *(_OWORD *)(a8 + 40) = 0u;
  *(_OWORD *)(a8 + 56) = 0u;
  return result;
}

uint64_t sub_19D5A4338@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v33 = *(void *)(a1 + 16);
  uint64_t v5 = v33;
  uint64_t v34 = v4;
  uint64_t v10 = v4;
  uint64_t v30 = v6;
  uint64_t v31 = v4;
  uint64_t v35 = v6;
  uint64_t v36 = v7;
  uint64_t v11 = v6;
  uint64_t v37 = v8;
  uint64_t v38 = v9;
  uint64_t v12 = v8;
  uint64_t v28 = v9;
  uint64_t v29 = v8;
  uint64_t v13 = v9;
  uint64_t v39 = _s4NodeO13NodeStateTypeOMa(255, (uint64_t)&v33);
  uint64_t v40 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  uint64_t v41 = v40;
  uint64_t v33 = v5;
  uint64_t v34 = v10;
  uint64_t v35 = v11;
  uint64_t v36 = v7;
  uint64_t v37 = v12;
  uint64_t v38 = v13;
  _s4NodeOMa(255, (uint64_t)&v33);
  uint64_t v42 = sub_19D6033B8();
  uint64_t TupleTypeMetadata = (int *)swift_getTupleTypeMetadata();
  uint64_t v27 = swift_allocBox();
  uint64_t v16 = v15;
  uint64_t v17 = (void *)(v15 + TupleTypeMetadata[12]);
  long long v18 = (void *)(v15 + TupleTypeMetadata[16]);
  uint64_t v19 = TupleTypeMetadata[20];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v21 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v16, v2, AssociatedTypeWitness);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v21 + 56))(v16, 0, 1, AssociatedTypeWitness);
  uint64_t v22 = (void *)(v2 + *(int *)(a1 + 72));
  uint64_t v23 = v22[1];
  *uint64_t v17 = *v22;
  v17[1] = v23;
  uint64_t v24 = (void *)(v2 + *(int *)(a1 + 76));
  uint64_t v25 = v24[1];
  void *v18 = *v24;
  v18[1] = v25;
  *(void *)(v16 + v19) = *(void *)(v2 + *(int *)(a1 + 68));
  *a2 = v27;
  uint64_t v33 = v5;
  uint64_t v34 = v31;
  uint64_t v35 = v30;
  uint64_t v36 = v7;
  uint64_t v37 = v29;
  uint64_t v38 = v28;
  _s4NodeOMa(0, (uint64_t)&v33);
  swift_storeEnumTagMultiPayload();
  swift_retain();
  swift_retain();
  return swift_bridgeObjectRetain();
}

double static HierarchicalStateMachine.RootState.RootStateBuilder.buildExpression(_:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_retain();
  v18[0] = a2;
  v18[1] = a3;
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  _s4NodeOMa(0, (uint64_t)v18);
  *(void *)a8 = sub_19D603268();
  *(void *)(a8 + 8) = v16;
  *(void *)(a8 + 16) = v15;
  double result = 0.0;
  *(_OWORD *)(a8 + 24) = 0u;
  *(_OWORD *)(a8 + 40) = 0u;
  *(_OWORD *)(a8 + 56) = 0u;
  return result;
}

{
  uint64_t v15;
  uint64_t v16;
  double result;
  void v18[6];

  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_retain();
  v18[0] = a2;
  v18[1] = a3;
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  _s4NodeOMa(0, (uint64_t)v18);
  *(void *)a8 = sub_19D603268();
  *(void *)(a8 + 8) = 0;
  *(void *)(a8 + 16) = 0;
  *(void *)(a8 + 24) = v16;
  *(void *)(a8 + 32) = v15;
  double result = 0.0;
  *(_OWORD *)(a8 + 40) = 0u;
  *(_OWORD *)(a8 + 56) = 0u;
  return result;
}

{
  uint64_t v15;
  uint64_t v16;
  double result;
  void v18[6];

  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_retain();
  v18[0] = a2;
  v18[1] = a3;
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  _s4NodeOMa(0, (uint64_t)v18);
  *(void *)a8 = sub_19D603268();
  double result = 0.0;
  *(_OWORD *)(a8 + 8) = 0u;
  *(_OWORD *)(a8 + 24) = 0u;
  *(void *)(a8 + 40) = v16;
  *(void *)(a8 + 48) = v15;
  *(void *)(a8 + 56) = 0;
  *(void *)(a8 + 64) = 0;
  return result;
}

{
  uint64_t v15;
  uint64_t v16;
  double result;
  void v18[6];

  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_retain();
  v18[0] = a2;
  v18[1] = a3;
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  _s4NodeOMa(0, (uint64_t)v18);
  *(void *)a8 = sub_19D603268();
  double result = 0.0;
  *(_OWORD *)(a8 + 8) = 0u;
  *(_OWORD *)(a8 + 24) = 0u;
  *(_OWORD *)(a8 + 40) = 0u;
  *(void *)(a8 + 56) = v16;
  *(void *)(a8 + 64) = v15;
  return result;
}

uint64_t sub_19D5A4824(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v7 = a1[4];
  uint64_t v13 = *a1;
  swift_bridgeObjectRetain();
  long long v8 = a2[2];
  v12[0] = a2[1];
  v12[1] = v8;
  v12[2] = a2[3];
  _s4NodeOMa(255, (uint64_t)v12);
  sub_19D6033B8();
  swift_getWitnessTable();
  uint64_t result = sub_19D603388();
  uint64_t v10 = v2[1];
  if (v10)
  {
    uint64_t v6 = v2[2];
  }
  else
  {
    uint64_t result = sub_19D59F590(v4);
    uint64_t v10 = v4;
  }
  v2[1] = v10;
  v2[2] = v6;
  uint64_t v11 = v2[3];
  if (v11)
  {
    uint64_t v7 = v2[4];
  }
  else
  {
    uint64_t result = sub_19D59F590(v5);
    uint64_t v11 = v5;
  }
  v2[3] = v11;
  v2[4] = v7;
  return result;
}

uint64_t static HierarchicalStateMachine.RootState.CompositeStateBuilder.buildBlock(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  uint64_t v18 = a6;
  uint64_t v19 = a7;
  _s4NodeOMa(0, (uint64_t)&v14);
  sub_19D603268();
  uint64_t v14 = a2;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  uint64_t v18 = a6;
  uint64_t v19 = a7;
  type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components(255, (uint64_t)&v14);
  sub_19D6033B8();
  swift_getWitnessTable();
  return sub_19D603318();
}

uint64_t sub_19D5A4A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)a2;
  v12[5] = a8;
  uint64_t v13 = v8;
  long long v9 = *(_OWORD *)(a2 + 24);
  long long v14 = *(_OWORD *)(a2 + 8);
  long long v15 = v9;
  v12[0] = a3;
  v12[1] = a4;
  v12[2] = a5;
  _OWORD v12[3] = a6;
  void v12[4] = a7;
  uint64_t v10 = (_OWORD *)type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components(0, (uint64_t)v12);
  return sub_19D5A4824(&v13, v10);
}

double static HierarchicalStateMachine.RootState.CompositeStateBuilder.buildExpression(_:)@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  return sub_19D5A4B24(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, uint64_t *))type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State, a7, (void (*)(uint64_t))sub_19D5A4058);
}

{
  return sub_19D5A4B24(a1, a2, a3, a4, a5, a6, (uint64_t (*)(void, uint64_t *))type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState, a7, (void (*)(uint64_t))sub_19D5A4338);
}

double sub_19D5A4B24@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t (*a7)(void, uint64_t *)@<X7>, uint64_t a8@<X8>, void (*a9)(uint64_t))
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  _s4NodeOMa(255, (uint64_t)&v20);
  sub_19D603688();
  swift_allocObject();
  uint64_t v16 = sub_19D603338();
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v25 = a6;
  uint64_t v17 = a7(0, &v20);
  a9(v17);
  sub_19D6033B8();
  *(void *)a8 = v16;
  double result = 0.0;
  *(_OWORD *)(a8 + 8) = 0u;
  *(_OWORD *)(a8 + 24) = 0u;
  return result;
}

uint64_t static HierarchicalStateMachine.RootState.CompositeStateBuilder.buildExpression(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_retain();
  v18[0] = a2;
  v18[1] = a3;
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  _s4NodeOMa(0, (uint64_t)v18);
  uint64_t result = sub_19D603268();
  *a8 = result;
  a8[1] = v16;
  a8[3] = 0;
  a8[4] = 0;
  a8[2] = v15;
  return result;
}

{
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  void v18[6];

  uint64_t v16 = *a1;
  uint64_t v15 = a1[1];
  swift_retain();
  v18[0] = a2;
  v18[1] = a3;
  v18[2] = a4;
  _OWORD v18[3] = a5;
  v18[4] = a6;
  v18[5] = a7;
  _s4NodeOMa(0, (uint64_t)v18);
  uint64_t result = sub_19D603268();
  *a8 = result;
  a8[1] = 0;
  a8[2] = 0;
  a8[3] = v16;
  a8[4] = v15;
  return result;
}

uint64_t *sub_19D5A4D98(uint64_t *result)
{
  uint64_t v3 = result[2];
  uint64_t v2 = result[3];
  uint64_t v4 = *v1;
  if (*v1)
  {
    uint64_t v5 = v1[1];
  }
  else
  {
    uint64_t v4 = *result;
    uint64_t v5 = result[1];
    uint64_t result = (uint64_t *)sub_19D59F590(*result);
  }
  *uint64_t v1 = v4;
  v1[1] = v5;
  uint64_t v6 = v1[2];
  if (v6)
  {
    uint64_t v2 = v1[3];
  }
  else
  {
    uint64_t result = (uint64_t *)sub_19D59F590(v3);
    uint64_t v6 = v3;
  }
  v1[2] = v6;
  v1[3] = v2;
  return result;
}

uint64_t static HierarchicalStateMachine.RootState.StateBuilder.buildBlock(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = a1;
  long long v9 = 0u;
  long long v10 = 0u;
  v8[0] = a2;
  v8[1] = a3;
  v8[2] = a4;
  _OWORD v8[3] = a5;
  v8[4] = a6;
  v8[5] = a7;
  type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Components(255, (uint64_t)v8);
  sub_19D6033B8();
  swift_getWitnessTable();
  return sub_19D603318();
}

uint64_t *sub_19D5A4ED8(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v8 = a2[1];
  v11[0] = *a2;
  v11[1] = v8;
  v10[0] = a3;
  v10[1] = a4;
  v10[2] = a5;
  v10[3] = a6;
  v10[4] = a7;
  v10[5] = a8;
  type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Components(0, (uint64_t)v10);
  return sub_19D5A4D98((uint64_t *)v11);
}

uint64_t static HierarchicalStateMachine.RootState.StateBuilder.buildExpression(_:)@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  a2[2] = 0;
  a2[3] = 0;
  return swift_retain();
}

{
  uint64_t v2;
  uint64_t v3;

  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = v2;
  a2[3] = v3;
  return swift_retain();
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.State.init(_:eventHandler:stateTransitionHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a9, a1, AssociatedTypeWitness);
  v25[0] = a6;
  v25[1] = a7;
  v25[2] = a8;
  v25[3] = a10;
  void v25[4] = a11;
  v25[5] = a12;
  uint64_t result = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State(0, (uint64_t)v25);
  uint64_t v21 = (void *)(a9 + *(int *)(result + 68));
  void *v21 = a2;
  v21[1] = a3;
  uint64_t v22 = (void *)(a9 + *(int *)(result + 72));
  void *v22 = a4;
  v22[1] = a5;
  return result;
}

void *HierarchicalStateMachine.RootState.BuilderTypes.State.init(_:builder:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr)@<X1>, uint64_t a3@<X3>, void *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  a2(&v37);
  uint64_t v17 = v37;
  uint64_t v16 = v38;
  uint64_t v34 = v39;
  uint64_t v35 = v40;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v36 = a8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a8, a1, AssociatedTypeWitness);
  if (v17)
  {
    uint64_t v19 = a5;
    uint64_t v20 = (void *)v17;
    uint64_t v21 = v16;
    uint64_t v22 = a9;
  }
  else
  {
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = a3;
    v21[3] = a4;
    void v21[4] = a5;
    v21[5] = a6;
    uint64_t v22 = a9;
    v21[6] = a7;
    v21[7] = a9;
    uint64_t v19 = a5;
    uint64_t v20 = &unk_1E94446C0;
  }
  uint64_t v32 = a6;
  uint64_t v37 = a3;
  uint64_t v38 = a4;
  uint64_t v39 = v19;
  uint64_t v40 = a6;
  uint64_t v41 = a7;
  uint64_t v42 = v22;
  uint64_t v23 = a4;
  uint64_t v24 = a3;
  uint64_t v25 = v22;
  uint64_t v33 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State(0, (uint64_t)&v37);
  uint64_t v26 = (void *)(v36 + *(int *)(v33 + 68));
  void *v26 = v20;
  v26[1] = v21;
  sub_19D59F590(v17);
  if (v34)
  {
    sub_19D59F590(v34);
    sub_19D59F5A0(v17);
    sub_19D59F5A0(v34);
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = a3;
    v27[3] = v23;
    v27[4] = v19;
    v27[5] = v32;
    v27[6] = a7;
    v27[7] = v25;
    v27[8] = v34;
    v27[9] = v35;
    uint64_t v28 = &unk_1E94446F0;
    uint64_t v29 = v32;
  }
  else
  {
    sub_19D59F5A0(v17);
    sub_19D59F5A0(0);
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = a3;
    v27[3] = v23;
    uint64_t v29 = v32;
    v27[4] = v19;
    v27[5] = v32;
    v27[6] = a7;
    v27[7] = v25;
    uint64_t v28 = &unk_1E94446D0;
  }
  uint64_t result = (void *)swift_allocObject();
  result[2] = v24;
  result[3] = v23;
  result[4] = v19;
  result[5] = v29;
  result[6] = a7;
  result[7] = v25;
  result[8] = v28;
  result[9] = v27;
  uint64_t v31 = (void *)(v36 + *(int *)(v33 + 72));
  *uint64_t v31 = &unk_1E94446E0;
  v31[1] = result;
  return result;
}

uint64_t sub_19D5A52E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return MEMORY[0x1F4188298](sub_19D5A9FDC, 0, 0);
}

uint64_t sub_19D5A530C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  long long v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  void *v7 = v4;
  v7[1] = sub_19D5990F4;
  return v9(a2, a3);
}

uint64_t sub_19D5A53F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_19D5990F4;
  return v6();
}

void *HierarchicalStateMachine.RootState.BuilderTypes.CompositeState.init(_:eventHandler:stateTransitionHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v18 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(a9, a1, AssociatedTypeWitness);
  uint64_t v31 = a6;
  uint64_t v32 = a7;
  uint64_t v33 = a8;
  uint64_t v34 = a10;
  uint64_t v19 = a8;
  uint64_t v35 = a11;
  uint64_t v36 = a12;
  _s4NodeOMa(0, (uint64_t)&v31);
  uint64_t v20 = sub_19D603368();
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a1, AssociatedTypeWitness);
  uint64_t v31 = a6;
  uint64_t v32 = a7;
  uint64_t v33 = v19;
  uint64_t v34 = a10;
  uint64_t v35 = a11;
  uint64_t v36 = a12;
  uint64_t v21 = (int *)type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState(0, (uint64_t)&v31);
  *(void *)(a9 + v21[17]) = v20;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = a6;
  v22[3] = a7;
  v22[4] = v19;
  void v22[5] = a10;
  v22[6] = a11;
  v22[7] = a12;
  v22[8] = a2;
  v22[9] = a3;
  uint64_t v23 = (void *)(a9 + v21[18]);
  *uint64_t v23 = &unk_1E9444700;
  v23[1] = v22;
  uint64_t result = (void *)swift_allocObject();
  result[2] = a6;
  result[3] = a7;
  result[4] = v19;
  result[5] = a10;
  result[6] = a11;
  result[7] = a12;
  result[8] = a4;
  result[9] = a5;
  uint64_t v25 = (void *)(a9 + v21[19]);
  *uint64_t v25 = &unk_1E9444710;
  v25[1] = result;
  return result;
}

uint64_t sub_19D5A56B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  long long v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v7;
  void *v7 = v4;
  v7[1] = sub_19D5990F4;
  return v9(a1, a2);
}

uint64_t sub_19D5A57A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_19D5990F4;
  return v7(a1);
}

void *HierarchicalStateMachine.RootState.BuilderTypes.CompositeState.init(_:builder:)@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, void *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  a2(&v36);
  uint64_t v16 = v36;
  uint64_t v17 = v37;
  uint64_t v32 = v38;
  uint64_t v33 = v39;
  uint64_t v34 = v40;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v19 = a1;
  uint64_t v20 = a4;
  uint64_t v21 = a8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a8, v19, AssociatedTypeWitness);
  uint64_t v36 = a3;
  uint64_t v37 = v20;
  uint64_t v38 = a5;
  uint64_t v39 = a6;
  uint64_t v40 = a7;
  uint64_t v41 = a9;
  uint64_t v22 = (int *)type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState(0, (uint64_t)&v36);
  uint64_t v35 = v21;
  *(void *)(v21 + v22[17]) = v16;
  if (v17)
  {
    uint64_t v23 = (void *)v17;
    uint64_t v24 = v32;
  }
  else
  {
    uint64_t v24 = (void *)swift_allocObject();
    v24[2] = a3;
    v24[3] = v20;
    void v24[4] = a5;
    v24[5] = a6;
    v24[6] = a7;
    v24[7] = a9;
    uint64_t v23 = &unk_1E9444720;
  }
  uint64_t v25 = (void *)(v21 + v22[18]);
  *uint64_t v25 = v23;
  v25[1] = v24;
  swift_bridgeObjectRetain();
  sub_19D59F590(v17);
  if (v33)
  {
    sub_19D59F590(v33);
    swift_bridgeObjectRelease();
    sub_19D59F5A0(v17);
    sub_19D59F5A0(v33);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = a9;
    v26[2] = a3;
    v26[3] = v20;
    void v26[4] = a5;
    v26[5] = a6;
    v26[6] = a7;
    v26[7] = a9;
    v26[8] = v33;
    v26[9] = v34;
    uint64_t v28 = &unk_1E9444740;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_19D59F5A0(v17);
    sub_19D59F5A0(0);
    uint64_t v26 = (void *)swift_allocObject();
    uint64_t v27 = a9;
    v26[2] = a3;
    v26[3] = v20;
    void v26[4] = a5;
    v26[5] = a6;
    v26[6] = a7;
    v26[7] = a9;
    uint64_t v28 = &unk_1E9444730;
  }
  uint64_t v29 = v28;
  uint64_t result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = v20;
  result[4] = a5;
  result[5] = a6;
  result[6] = a7;
  result[7] = v27;
  result[8] = v29;
  result[9] = v26;
  uint64_t v31 = (void *)(v35 + v22[19]);
  *uint64_t v31 = &unk_1E9444738;
  v31[1] = result;
  return result;
}

uint64_t sub_19D5A5B30()
{
  return sub_19D5A2A50(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnEvent.eventHandler.modify())()
{
  return nullsub_1;
}

void *HierarchicalStateMachine.RootState.BuilderTypes.OnEvent.init(eventHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a7;
  result[7] = a8;
  result[8] = a1;
  result[9] = a2;
  *a9 = &unk_1E9444750;
  a9[1] = result;
  return result;
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.stateTransitionHandler.getter()
{
  uint64_t v1 = *v0;
  swift_retain();
  return v1;
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.stateTransitionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_release();
  *uint64_t v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.stateTransitionHandler.modify())()
{
  return nullsub_1;
}

void *HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.init(stateTransitionHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>)
{
  uint64_t result = (void *)swift_allocObject();
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  result[5] = a6;
  result[6] = a7;
  result[7] = a8;
  result[8] = a1;
  result[9] = a2;
  *a9 = &unk_1E9444760;
  a9[1] = result;
  return result;
}

uint64_t HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition.init(stateTransitionHandler:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_19D5A5D48(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_19D5990F4;
  return v7(a2);
}

uint64_t sub_19D5A5E24(uint64_t a1, int *a2)
{
  uint64_t v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_19D5990F4;
  return v5();
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent.onDelegateEvent.modify())()
{
  return nullsub_1;
}

uint64_t sub_19D5A5F20@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, void *a5@<X8>)
{
  uint64_t v7 = a3 + a2;
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v10 = swift_allocObject();
  long long v11 = *(_OWORD *)(v7 - 32);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)(v7 - 48);
  *(_OWORD *)(v10 + 32) = v11;
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v7 - 16);
  *(void *)(v10 + 64) = v9;
  *(void *)(v10 + 72) = v8;
  *a5 = a4;
  a5[1] = v10;
  return swift_retain();
}

uint64_t sub_19D5A5F98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  long long v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a5 + *a5);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v9;
  *uint64_t v9 = v5;
  v9[1] = sub_19D5990F4;
  return v11(a2, a3, a4);
}

uint64_t sub_19D5A608C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = a4 + a3;
  uint64_t v10 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v11 = swift_allocObject();
  long long v12 = *(_OWORD *)(v8 - 32);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)(v8 - 48);
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(v8 - 16);
  *(void *)(v11 + 64) = v10;
  *(void *)(v11 + 72) = v9;
  swift_retain();
  uint64_t result = swift_release();
  *a2 = a6;
  a2[1] = v11;
  return result;
}

uint64_t sub_19D5A6108(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_19D5990F4;
  return v7();
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction.traceEventReaction.modify())()
{
  return nullsub_1;
}

uint64_t sub_19D5A621C(int *a1)
{
  uint64_t v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19D5990F4;
  return v4();
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize.onInitialize.modify())()
{
  return nullsub_1;
}

uint64_t sub_19D5A6308(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = v8;
  swift_retain();
  uint64_t result = swift_release();
  *a2 = a6;
  a2[1] = v10;
  return result;
}

uint64_t (*HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate.onInvalidate.modify())()
{
  return nullsub_1;
}

uint64_t sub_19D5A6390(uint64_t a1, uint64_t a2)
{
  return sub_19D5A3F9C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Components(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.RootStateBuilder.Components);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.State(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.State);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.CompositeState);
}

uint64_t sub_19D5A63FC(uint64_t a1, uint64_t a2)
{
  return sub_19D5A4A2C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Components);
}

uint64_t *sub_19D5A6438(uint64_t a1, _OWORD *a2)
{
  return sub_19D5A4ED8(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Components(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.StateBuilder.Components);
}

uint64_t sub_19D5A6474()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D5A6484(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  _OWORD v5[3] = v4;
  v5[1] = sub_19D5990F4;
  return MEMORY[0x1F4188298](sub_19D5A9FDC, 0, 0);
}

uint64_t sub_19D5A6534()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D5A6544()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  return sub_19D594A94();
}

void sub_19D5A65D0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  uint64_t v2 = (char *)&dword_1E94446D8 + dword_1E94446D8;
  __asm { BR              X8; sub_19D5A53F4 }
}

void sub_19D5A66C4()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  uint64_t v2 = (char *)&dword_1E94446E8 + dword_1E94446E8;
  __asm { BR              X9; sub_19D5A530C }
}

uint64_t sub_19D5A67D4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 64);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_19D5990F4;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[2] = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_19D5990F4;
  return v10(a1, a2);
}

uint64_t sub_19D5A6904(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 64);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D5990F4;
  return v8(a1);
}

uint64_t sub_19D5A6A28()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D5A6A38(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[2] = a1;
  _OWORD v5[3] = v4;
  v5[1] = sub_19D5990F4;
  return MEMORY[0x1F4188298](sub_19D5994D0, 0, 0);
}

uint64_t sub_19D5A6AE8()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D5A6AF8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  return sub_19D594A94();
}

uint64_t sub_19D5A6B84(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 64);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_19D5990F4;
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  uint64_t v8 = (void *)swift_task_alloc();
  v7[2] = v8;
  *uint64_t v8 = v7;
  v8[1] = sub_19D5990F4;
  return v10(a1, a2);
}

uint64_t sub_19D5A6CB4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 64);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D5990F4;
  return v8(a1);
}

uint64_t sub_19D5A6DD8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_retain();
}

uint64_t sub_19D5A6DE4(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  swift_retain();
  uint64_t result = swift_release();
  *a2 = v4;
  a2[1] = v3;
  return result;
}

uint64_t sub_19D5A6E28()
{
  return 48;
}

__n128 sub_19D5A6E34(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19D5A6E48@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_19D5A5F20(a1, a2, a3, (uint64_t)&unk_1E94450E0, a4);
}

uint64_t sub_19D5A6E7C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19D5A608C(a1, a2, a3, a4, (uint64_t)&unk_1EEF0DFC8, (uint64_t)&unk_1E94450D8);
}

uint64_t sub_19D5A6EB0()
{
  return 48;
}

__n128 sub_19D5A6EBC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19D5A6ED0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_19D5A5F20(a1, a2, a3, (uint64_t)&unk_1E94450D0, a4);
}

uint64_t sub_19D5A6F04(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19D5A608C(a1, a2, a3, a4, (uint64_t)&unk_1EEF0DF78, (uint64_t)&unk_1E94450C0);
}

uint64_t sub_19D5A6F38()
{
  return 48;
}

__n128 sub_19D5A6F44(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19D5A6F58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  return sub_19D5A5F20(a1, a2, a3, (uint64_t)&unk_1E94450B0, a4);
}

uint64_t sub_19D5A6F8C(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19D5A608C(a1, a2, a3, a4, (uint64_t)&unk_1EEF0DF28, (uint64_t)&unk_1E94450A0);
}

uint64_t sub_19D5A6FC0()
{
  return 48;
}

__n128 sub_19D5A6FCC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19D5A6FE0@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_61Tm(a1, (uint64_t)&unk_1E9445090, a2);
}

uint64_t sub_19D5A7000(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19D5A6308(a1, a2, a3, a4, (uint64_t)&unk_1EEF0DED8, (uint64_t)&unk_1E9445088);
}

uint64_t sub_19D5A7034()
{
  return 48;
}

__n128 sub_19D5A7040(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_19D5A7054@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return keypath_get_61Tm(a1, (uint64_t)&unk_1E9445080, a2);
}

uint64_t keypath_get_61Tm@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X4>, void *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v5;
  *a3 = a2;
  a3[1] = v7;
  return swift_retain();
}

uint64_t sub_19D5A70D0(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_19D5A6308(a1, a2, a3, a4, (uint64_t)&unk_1EEF0DE88, (uint64_t)&unk_1E9445070);
}

uint64_t sub_19D5A7104()
{
  return 48;
}

__n128 sub_19D5A7110(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.RootStateBuilder);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.RootStateBuilder.Actions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.RootStateBuilder.Actions);
}

uint64_t sub_19D5A716C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F41863F8](a1, a2, a3, 72);
}

uint64_t sub_19D5A7174(void *a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (a1[1]) {
    uint64_t result = swift_release();
  }
  if (a1[3]) {
    uint64_t result = swift_release();
  }
  if (a1[5]) {
    uint64_t result = swift_release();
  }
  if (a1[7])
  {
    return swift_release();
  }
  return result;
}

void *sub_19D5A71F4(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v5 = a2 + 1;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  uint64_t v7 = a2[3];
  if (v7)
  {
    uint64_t v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  uint64_t v9 = a2[5];
  if (v9)
  {
    uint64_t v10 = a2[6];
    a1[5] = v9;
    a1[6] = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  }
  uint64_t v11 = a2[7];
  if (v11)
  {
    uint64_t v12 = a2[8];
    a1[7] = v11;
    a1[8] = v12;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
  }
  return a1;
}

void *sub_19D5A72D8(void *a1, void *a2, _OWORD *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[1];
  if (a1[1])
  {
    if (v6)
    {
      uint64_t v7 = a2[2];
      a1[1] = v6;
      a1[2] = v7;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    long long v9 = a3[2];
    long long v27 = a3[1];
    long long v28 = v9;
    long long v29 = a3[3];
    uint64_t v10 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize(0, (uint64_t)&v27);
    (*(void (**)(void *, uint64_t))(*(void *)(v10 - 8) + 8))(a1 + 1, v10);
  }
  else if (v6)
  {
    uint64_t v8 = a2[2];
    a1[1] = v6;
    a1[2] = v8;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
LABEL_8:
  uint64_t v11 = a2[3];
  if (a1[3])
  {
    if (v11)
    {
      uint64_t v12 = a2[4];
      a1[3] = v11;
      a1[4] = v12;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    long long v14 = a3[2];
    long long v27 = a3[1];
    long long v28 = v14;
    long long v29 = a3[3];
    uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate(0, (uint64_t)&v27);
    (*(void (**)(void *, uint64_t))(*(void *)(v15 - 8) + 8))(a1 + 3, v15);
  }
  else if (v11)
  {
    uint64_t v13 = a2[4];
    a1[3] = v11;
    a1[4] = v13;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
LABEL_15:
  uint64_t v16 = a2[5];
  if (a1[5])
  {
    if (v16)
    {
      uint64_t v17 = a2[6];
      a1[5] = v16;
      a1[6] = v17;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    long long v19 = a3[2];
    long long v27 = a3[1];
    long long v28 = v19;
    long long v29 = a3[3];
    uint64_t v20 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent(0, (uint64_t)&v27);
    (*(void (**)(void *, uint64_t))(*(void *)(v20 - 8) + 8))(a1 + 5, v20);
  }
  else if (v16)
  {
    uint64_t v18 = a2[6];
    a1[5] = v16;
    a1[6] = v18;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
LABEL_22:
  uint64_t v21 = a2[7];
  if (!a1[7])
  {
    if (v21)
    {
      uint64_t v23 = a2[8];
      a1[7] = v21;
      a1[8] = v23;
      swift_retain();
      return a1;
    }
LABEL_28:
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
    return a1;
  }
  if (!v21)
  {
    long long v24 = a3[2];
    long long v27 = a3[1];
    long long v28 = v24;
    long long v29 = a3[3];
    uint64_t v25 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction(0, (uint64_t)&v27);
    (*(void (**)(void *, uint64_t))(*(void *)(v25 - 8) + 8))(a1 + 7, v25);
    goto LABEL_28;
  }
  uint64_t v22 = a2[8];
  a1[7] = v21;
  a1[8] = v22;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction);
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_19D5A7628(uint64_t a1, void *a2, _OWORD *a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[1];
  if (*(void *)(a1 + 8))
  {
    if (v6)
    {
      uint64_t v7 = a2[2];
      *(void *)(a1 + 8) = v6;
      *(void *)(a1 + 16) = v7;
      swift_release();
      goto LABEL_6;
    }
    long long v8 = a3[2];
    long long v23 = a3[1];
    long long v24 = v8;
    long long v25 = a3[3];
    uint64_t v9 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInitialize(0, (uint64_t)&v23);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1 + 8, v9);
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
LABEL_6:
  uint64_t v10 = a2[3];
  if (*(void *)(a1 + 24))
  {
    if (v10)
    {
      uint64_t v11 = a2[4];
      *(void *)(a1 + 24) = v10;
      *(void *)(a1 + 32) = v11;
      swift_release();
      goto LABEL_11;
    }
    long long v12 = a3[2];
    long long v23 = a3[1];
    long long v24 = v12;
    long long v25 = a3[3];
    uint64_t v13 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnInvalidate(0, (uint64_t)&v23);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1 + 24, v13);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
LABEL_11:
  uint64_t v14 = a2[5];
  if (*(void *)(a1 + 40))
  {
    if (v14)
    {
      uint64_t v15 = a2[6];
      *(void *)(a1 + 40) = v14;
      *(void *)(a1 + 48) = v15;
      swift_release();
      goto LABEL_16;
    }
    long long v16 = a3[2];
    long long v23 = a3[1];
    long long v24 = v16;
    long long v25 = a3[3];
    uint64_t v17 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnDelegateEvent(0, (uint64_t)&v23);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(a1 + 40, v17);
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
LABEL_16:
  uint64_t v18 = a2[7];
  if (!*(void *)(a1 + 56))
  {
LABEL_20:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 7);
    return a1;
  }
  if (!v18)
  {
    long long v20 = a3[2];
    long long v23 = a3[1];
    long long v24 = v20;
    long long v25 = a3[3];
    uint64_t v21 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.TraceEventReaction(0, (uint64_t)&v23);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v21 - 8) + 8))(a1 + 56, v21);
    goto LABEL_20;
  }
  uint64_t v19 = a2[8];
  *(void *)(a1 + 56) = v18;
  *(void *)(a1 + 64) = v19;
  swift_release();
  return a1;
}

uint64_t sub_19D5A787C(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 72)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19D5A78C4(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 72) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 72) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.CompositeStateBuilder);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Actions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.CompositeStateBuilder.Actions);
}

uint64_t sub_19D5A7944(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 8)) {
    uint64_t result = swift_release();
  }
  if (*(void *)(a1 + 24))
  {
    return swift_release();
  }
  return result;
}

void *sub_19D5A79A4(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v5 = a2 + 1;
  uint64_t v4 = a2[1];
  swift_bridgeObjectRetain();
  if (v4)
  {
    uint64_t v6 = a2[2];
    a1[1] = v4;
    a1[2] = v6;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 1) = *v5;
  }
  uint64_t v7 = a2[3];
  if (v7)
  {
    uint64_t v8 = a2[4];
    a1[3] = v7;
    a1[4] = v8;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  }
  return a1;
}

void *sub_19D5A7A38(void *a1, void *a2, _OWORD *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[1];
  if (a1[1])
  {
    if (v6)
    {
      uint64_t v7 = a2[2];
      a1[1] = v6;
      a1[2] = v7;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    long long v9 = a3[2];
    long long v17 = a3[1];
    long long v18 = v9;
    long long v19 = a3[3];
    uint64_t v10 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent(0, (uint64_t)&v17);
    (*(void (**)(void *, uint64_t))(*(void *)(v10 - 8) + 8))(a1 + 1, v10);
  }
  else if (v6)
  {
    uint64_t v8 = a2[2];
    a1[1] = v6;
    a1[2] = v8;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
LABEL_8:
  uint64_t v11 = a2[3];
  if (!a1[3])
  {
    if (v11)
    {
      uint64_t v13 = a2[4];
      a1[3] = v11;
      a1[4] = v13;
      swift_retain();
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v11)
  {
    long long v14 = a3[2];
    long long v17 = a3[1];
    long long v18 = v14;
    long long v19 = a3[3];
    uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition(0, (uint64_t)&v17);
    (*(void (**)(void *, uint64_t))(*(void *)(v15 - 8) + 8))(a1 + 3, v15);
    goto LABEL_14;
  }
  uint64_t v12 = a2[4];
  a1[3] = v11;
  a1[4] = v12;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_19D5A7C10(uint64_t a1, void *a2, _OWORD *a3)
{
  *(void *)a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[1];
  if (*(void *)(a1 + 8))
  {
    if (v6)
    {
      uint64_t v7 = a2[2];
      *(void *)(a1 + 8) = v6;
      *(void *)(a1 + 16) = v7;
      swift_release();
      goto LABEL_6;
    }
    long long v8 = a3[2];
    long long v15 = a3[1];
    long long v16 = v8;
    long long v17 = a3[3];
    uint64_t v9 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent(0, (uint64_t)&v15);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(a1 + 8, v9);
  }
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
LABEL_6:
  uint64_t v10 = a2[3];
  if (!*(void *)(a1 + 24))
  {
LABEL_10:
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v10)
  {
    long long v12 = a3[2];
    long long v15 = a3[1];
    long long v16 = v12;
    long long v17 = a3[3];
    uint64_t v13 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition(0, (uint64_t)&v15);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1 + 24, v13);
    goto LABEL_10;
  }
  uint64_t v11 = a2[4];
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v11;
  swift_release();
  return a1;
}

uint64_t sub_19D5A7D64(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19D5A7DAC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.StateBuilder);
}

uint64_t type metadata accessor for HierarchicalStateMachine.RootState.StateBuilder.Actions(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.RootState.StateBuilder.Actions);
}

void *sub_19D5A7E24(void *result)
{
  uint64_t v1 = result;
  if (*result) {
    __n128 result = (void *)swift_release();
  }
  if (v1[2])
  {
    return (void *)swift_release();
  }
  return result;
}

void *sub_19D5A7E7C(void *a1, void *a2)
{
  if (*a2)
  {
    uint64_t v4 = a2[1];
    *a1 = *a2;
    a1[1] = v4;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  uint64_t v5 = a2[2];
  if (v5)
  {
    uint64_t v6 = a2[3];
    a1[2] = v5;
    a1[3] = v6;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  }
  return a1;
}

void *sub_19D5A7EEC(void *a1, void *a2, _OWORD *a3)
{
  uint64_t v6 = *a2;
  if (*a1)
  {
    if (v6)
    {
      uint64_t v7 = a2[1];
      *a1 = v6;
      a1[1] = v7;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    long long v9 = a3[2];
    long long v17 = a3[1];
    long long v18 = v9;
    long long v19 = a3[3];
    uint64_t v10 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent(0, (uint64_t)&v17);
    (*(void (**)(void *, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  }
  else if (v6)
  {
    uint64_t v8 = a2[1];
    *a1 = v6;
    a1[1] = v8;
    swift_retain();
    goto LABEL_8;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_8:
  uint64_t v11 = a2[2];
  if (!a1[2])
  {
    if (v11)
    {
      uint64_t v13 = a2[3];
      a1[2] = v11;
      a1[3] = v13;
      swift_retain();
      return a1;
    }
LABEL_14:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v11)
  {
    long long v14 = a3[2];
    long long v17 = a3[1];
    long long v18 = v14;
    long long v19 = a3[3];
    uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition(0, (uint64_t)&v17);
    (*(void (**)(void *, uint64_t))(*(void *)(v15 - 8) + 8))(a1 + 2, v15);
    goto LABEL_14;
  }
  uint64_t v12 = a2[3];
  a1[2] = v11;
  a1[3] = v12;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19D5A8060(uint64_t a1, void *a2, _OWORD *a3)
{
  if (*(void *)a1)
  {
    if (*a2)
    {
      uint64_t v6 = a2[1];
      *(void *)a1 = *a2;
      *(void *)(a1 + 8) = v6;
      swift_release();
      goto LABEL_6;
    }
    long long v7 = a3[2];
    long long v14 = a3[1];
    long long v15 = v7;
    long long v16 = a3[3];
    uint64_t v8 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnEvent(0, (uint64_t)&v14);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(a1, v8);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v9 = a2[2];
  if (!*(void *)(a1 + 16))
  {
LABEL_10:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v9)
  {
    long long v11 = a3[2];
    long long v14 = a3[1];
    long long v15 = v11;
    long long v16 = a3[3];
    uint64_t v12 = type metadata accessor for HierarchicalStateMachine.RootState.BuilderTypes.OnStateTransition(0, (uint64_t)&v14);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1 + 16, v12);
    goto LABEL_10;
  }
  uint64_t v10 = a2[3];
  *(void *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v10;
  swift_release();
  return a1;
}

uint64_t sub_19D5A819C(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 32)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t sub_19D5A81F8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }
  return result;
}

uint64_t sub_19D5A824C()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_19D5A8300(void *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = v9;
    a1 = (void *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(void *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    uint64_t v10 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    long long v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
    long long v14 = (void *)(((unint64_t)v11 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v15 = v14[1];
    void *v13 = *v14;
    v13[1] = v15;
    swift_retain();
  }
  swift_retain();
  return a1;
}

uint64_t sub_19D5A8440(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  swift_release();
  return swift_release();
}

uint64_t sub_19D5A84E8(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  void *v7 = *v8;
  v7[1] = v9;
  uint64_t v10 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v11 = (void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_19D5A85B0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v9 = v8[1];
  void *v7 = *v8;
  v7[1] = v9;
  swift_retain();
  swift_release();
  uint64_t v10 = (void *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8);
  long long v11 = (void *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v12 = v11[1];
  *uint64_t v10 = *v11;
  v10[1] = v12;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19D5A868C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  _OWORD *v7 = *v8;
  *(_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v8 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_19D5A8740(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 23;
  _OWORD *v7 = *(_OWORD *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  *(_OWORD *)(((unint64_t)v7 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(v9 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_19D5A8808(_DWORD *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    uint64_t v10 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = a2 - v7 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v9);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x19D5A89B4);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v9);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFF)
  {
    unint64_t v18 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v18 >= 0xFFFFFFFF) {
      LODWORD(v18) = -1;
    }
    return (v18 + 1);
  }
  else
  {
    long long v17 = *(uint64_t (**)(_DWORD *))(v5 + 48);
    return v17(a1);
  }
}

void sub_19D5A89C8(_DWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  size_t v10 = ((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 >= a3)
  {
    int v13 = 0;
    int v14 = a2 - v9;
    if (a2 <= v9)
    {
LABEL_17:
      switch(v13)
      {
        case 1:
          *((unsigned char *)a1 + v10) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)((char *)a1 + v10) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)((char *)a1 + v10) = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              unint64_t v18 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0)
              {
                uint64_t v19 = a2 ^ 0x80000000;
                v18[1] = 0;
              }
              else
              {
                uint64_t v19 = (a2 - 1);
              }
              void *v18 = v19;
            }
            else
            {
              long long v17 = *(void (**)(_DWORD *, uint64_t))(v6 + 56);
              v17(a1, a2);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((((v8 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v11 = a3 - v9 + 1;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v11 >= 0x10000) {
      int v12 = 4;
    }
    else {
      int v12 = 2;
    }
    if (v11 < 0x100) {
      int v12 = 1;
    }
    if (v11 >= 2) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    int v14 = a2 - v9;
    if (a2 <= v9) {
      goto LABEL_17;
    }
  }
  if (((((v8 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v15 = v14;
  }
  else {
    int v15 = 1;
  }
  if (((((v8 + 7) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v16 = ~v9 + a2;
    bzero(a1, v10);
    *a1 = v16;
  }
  switch(v13)
  {
    case 1:
      *((unsigned char *)a1 + v10) = v15;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v10) = v15;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x19D5A8BE4);
    case 4:
      *(_DWORD *)((char *)a1 + v10) = v15;
      break;
    default:
      return;
  }
}

uint64_t sub_19D5A8C0C()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_19D5A8CCC(void *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  int v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0
    || ((((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = v9;
    a1 = (void *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
  }
  else
  {
    (*(void (**)(void *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    size_t v10 = (void *)(((unint64_t)a1 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    unsigned int v11 = (void *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8);
    *size_t v10 = *v11;
    int v12 = (void *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
    int v13 = (void *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v14 = v13[1];
    *int v12 = *v13;
    v12[1] = v14;
    int v15 = (void *)(((unint64_t)v12 + 23) & 0xFFFFFFFFFFFFFFF8);
    int v16 = (void *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
    uint64_t v17 = v16[1];
    *int v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return a1;
}

uint64_t sub_19D5A8E2C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t sub_19D5A8EE0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  uint64_t v9 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v10 = (void *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  int v12 = (void *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v13 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *int v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_19D5A8FC0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = v6 + a2;
  unint64_t v9 = (v8 & 0xFFFFFFFFFFFFFFF8) + 15;
  void *v7 = *(void *)(v8 & 0xFFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  size_t v10 = (void *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v9 &= 0xFFFFFFFFFFFFFFF8;
  uint64_t v11 = *(void *)(v9 + 8);
  *size_t v10 = *(void *)v9;
  v10[1] = v11;
  swift_retain();
  swift_release();
  int v12 = (void *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  int v13 = (void *)((v9 + 23) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v14 = v13[1];
  *int v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19D5A90BC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  unint64_t v9 = (_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v10 = (_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v9 = *v10;
  *(_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_19D5A9180(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24) + 7;
  int v7 = (void *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v8 = (void *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  void *v7 = *v8;
  swift_bridgeObjectRelease();
  unint64_t v9 = (_OWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  size_t v10 = (_OWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *unint64_t v9 = *v10;
  swift_release();
  *(_OWORD *)(((unint64_t)v9 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v10 + 23) & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  return a1;
}

uint64_t sub_19D5A9260(_DWORD *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v6 = *(_DWORD *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v5 + 84);
  }
  uint64_t v8 = *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  if (!a2) {
    return 0;
  }
  if (v7 < a2)
  {
    unint64_t v9 = ((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
    uint64_t v10 = v9 & 0xFFFFFFF8;
    if ((v9 & 0xFFFFFFF8) != 0) {
      unsigned int v11 = 2;
    }
    else {
      unsigned int v11 = a2 - v7 + 1;
    }
    if (v11 >= 0x10000) {
      unsigned int v12 = 4;
    }
    else {
      unsigned int v12 = 2;
    }
    if (v11 < 0x100) {
      unsigned int v12 = 1;
    }
    if (v11 >= 2) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    switch(v13)
    {
      case 1:
        int v14 = *((unsigned __int8 *)a1 + v9);
        if (!v14) {
          break;
        }
        goto LABEL_22;
      case 2:
        int v14 = *(unsigned __int16 *)((char *)a1 + v9);
        if (v14) {
          goto LABEL_22;
        }
        break;
      case 3:
        __break(1u);
        JUMPOUT(0x19D5A9414);
      case 4:
        int v14 = *(_DWORD *)((char *)a1 + v9);
        if (!v14) {
          break;
        }
LABEL_22:
        int v16 = v14 - 1;
        if (v10)
        {
          int v16 = 0;
          LODWORD(v10) = *a1;
        }
        return v7 + (v10 | v16) + 1;
      default:
        break;
    }
  }
  if (v6 < 0x7FFFFFFF)
  {
    unint64_t v18 = *(void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
    if (v18 >= 0xFFFFFFFF) {
      LODWORD(v18) = -1;
    }
    return (v18 + 1);
  }
  else
  {
    uint64_t v17 = *(uint64_t (**)(_DWORD *))(v5 + 48);
    return v17(a1);
  }
}

void sub_19D5A9428(_DWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  uint64_t v8 = *(void *)(v6 + 64);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v9 = 0x7FFFFFFF;
  }
  else {
    unsigned int v9 = *(_DWORD *)(v6 + 84);
  }
  size_t v10 = ((((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 16;
  if (v9 >= a3)
  {
    int v13 = 0;
    int v14 = a2 - v9;
    if (a2 <= v9)
    {
LABEL_17:
      switch(v13)
      {
        case 1:
          *((unsigned char *)a1 + v10) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 2:
          *(_WORD *)((char *)a1 + v10) = 0;
          if (!a2) {
            return;
          }
          goto LABEL_30;
        case 3:
          goto LABEL_43;
        case 4:
          *(_DWORD *)((char *)a1 + v10) = 0;
          goto LABEL_29;
        default:
LABEL_29:
          if (a2)
          {
LABEL_30:
            if (v7 < 0x7FFFFFFF)
            {
              unint64_t v18 = (void *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFFFF8);
              if ((a2 & 0x80000000) != 0) {
                uint64_t v19 = a2 ^ 0x80000000;
              }
              else {
                uint64_t v19 = (a2 - 1);
              }
              void *v18 = v19;
            }
            else
            {
              uint64_t v17 = *(void (**)(_DWORD *, uint64_t))(v6 + 56);
              v17(a1, a2);
            }
          }
          break;
      }
      return;
    }
  }
  else
  {
    if (((((((v8 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
      unsigned int v11 = a3 - v9 + 1;
    }
    else {
      unsigned int v11 = 2;
    }
    if (v11 >= 0x10000) {
      int v12 = 4;
    }
    else {
      int v12 = 2;
    }
    if (v11 < 0x100) {
      int v12 = 1;
    }
    if (v11 >= 2) {
      int v13 = v12;
    }
    else {
      int v13 = 0;
    }
    int v14 = a2 - v9;
    if (a2 <= v9) {
      goto LABEL_17;
    }
  }
  if (((((((v8 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) == 0xFFFFFFF0) {
    int v15 = v14;
  }
  else {
    int v15 = 1;
  }
  if (((((((v8 + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
  {
    int v16 = ~v9 + a2;
    bzero(a1, v10);
    *a1 = v16;
  }
  switch(v13)
  {
    case 1:
      *((unsigned char *)a1 + v10) = v15;
      break;
    case 2:
      *(_WORD *)((char *)a1 + v10) = v15;
      break;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x19D5A9648);
    case 4:
      *(_DWORD *)((char *)a1 + v10) = v15;
      break;
    default:
      return;
  }
}

void *sub_19D5A967C(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_19D5A96AC()
{
  return swift_release();
}

_OWORD *sub_19D5A96B4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

void *sub_19D5A96E8(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_19D5A9724(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_19D5A976C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

uint64_t sub_19D5A97A8()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_19D5A97E0()
{
  uint64_t v2 = *(int **)(v0 + 16);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_19D5990F4;
  int v4 = (uint64_t (*)(int *))((char *)&dword_1E9445068 + dword_1E9445068);
  return v4(v2);
}

uint64_t sub_19D5A988C(uint64_t a1)
{
  int v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1E9445078 + dword_1E9445078);
  return v6(a1, v4);
}

void sub_19D5A9944()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  uint64_t v2 = (char *)&dword_1E9445098 + dword_1E9445098;
  __asm { BR              X8; sub_19D5A6108 }
}

uint64_t sub_19D5A9A50()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 80, 7);
}

void sub_19D5A9A88()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  uint64_t v2 = (char *)&dword_1E94450A8 + dword_1E94450A8;
  __asm { BR              X9; sub_19D5A5F98 }
}

void sub_19D5A9B90()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  uint64_t v2 = (char *)&dword_1E94450B8 + dword_1E94450B8;
  __asm { BR              X8; sub_19D5A5E24 }
}

void sub_19D5A9C88()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  uint64_t v2 = (char *)&dword_1E94450C8 + dword_1E94450C8;
  __asm { BR              X9; sub_19D5A5D48 }
}

uint64_t sub_19D5A9D80()
{
  return MEMORY[0x1F4186498](v0, 64, 7);
}

uint64_t sub_19D5A9D90()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5990F4;
  return sub_19D594A94();
}

uint64_t sub_19D5A9E1C()
{
  if (*(void *)(v0 + 64)) {
    swift_release();
  }
  if (*(void *)(v0 + 80)) {
    swift_release();
  }
  return MEMORY[0x1F4186498](v0, 96, 7);
}

uint64_t sub_19D5A9E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[3];
  uint64_t v13 = v2[2];
  uint64_t v7 = v2[8];
  uint64_t v8 = v2[9];
  uint64_t v10 = v2[10];
  uint64_t v9 = v2[11];
  unsigned int v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v11;
  *unsigned int v11 = v3;
  v11[1] = sub_19D594A94;
  return sub_19D5A3850(a1, a2, v7, v8, v10, v9, v13, v6);
}

uint64_t sub_19D5A9FE0()
{
  return sub_19D5A5B30();
}

uint64_t HierarchicalStateMachine.start(with:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_19D5AA02C, v1, 0);
}

uint64_t sub_19D5AA02C()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = swift_task_alloc();
  v0[4] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v6 = (uint64_t (*)(void))((char *)&dword_1E9445120 + dword_1E9445120);
  int v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *int v4 = v0;
  v4[1] = sub_19D5AA10C;
  return v6();
}

uint64_t sub_19D5AA10C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 24);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5B35DC, v1, 0);
}

uint64_t HierarchicalStateMachine.__allocating_init(rootState:)(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  HierarchicalStateMachine.init(rootState:)(a1);
  return v2;
}

char *HierarchicalStateMachine.init(rootState:)(uint64_t a1)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)v1;
  swift_defaultActor_initialize();
  uint64_t v5 = *(void *)(*(void *)v1 + 152);
  uint64_t v6 = *(void *)(v3 + 88);
  *(void *)&v1[v5] = sub_19D603268();
  uint64_t v7 = *(void *)(v3 + 80);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(&v1[*(void *)(*(void *)v1 + 160)], 1, 2, v7);
  type metadata accessor for AsyncSerialQueue();
  uint64_t v8 = swift_allocObject();
  swift_defaultActor_initialize();
  *(unsigned char *)(v8 + 112) = 0;
  *(void *)(v8 + 120) = *(void *)sub_19D603218();
  *(void *)(v8 + 128) = sub_19D5B0070;
  *(void *)(v8 + 136) = 0;
  *((void *)v1 + 14) = v8;
  uint64_t v9 = &v1[*(void *)(*(void *)v1 + 144)];
  v13[0] = v7;
  v13[1] = v6;
  long long v10 = *(_OWORD *)(v4 + 112);
  long long v14 = *(_OWORD *)(v4 + 96);
  long long v15 = v10;
  uint64_t v11 = type metadata accessor for HierarchicalStateMachine.RootState(0, (uint64_t)v13);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 32))(v9, a1, v11);
  swift_retain();
  return v1;
}

uint64_t HierarchicalStateMachine.currentValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  long long v5 = *(_OWORD *)(*v1 + 96);
  long long v18 = *(_OWORD *)(*v1 + 80);
  v19[0] = v18;
  long long v6 = *(_OWORD *)(v4 + 112);
  v19[1] = v5;
  v19[2] = v6;
  uint64_t v7 = type metadata accessor for HierarchicalStateMachine.MetaState(0, (uint64_t)v19);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9, v10);
  int v12 = (char *)&v19[-1] - v11;
  uint64_t v13 = (uint64_t)v1 + *(void *)(v3 + 160);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, v13, v7);
  uint64_t v14 = v18;
  uint64_t v15 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, void))(v15 + 48))(v12, 2, v18))
  {
    uint64_t v16 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a1, v12, v14);
    uint64_t v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a1, v16, 1, v14);
}

uint64_t sub_19D5AA604(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  *(void *)(v3 + 112) = a2;
  *(void *)(v3 + 120) = a3;
  uint64_t v5 = *a2;
  uint64_t v6 = *a2;
  uint64_t v7 = *(void *)(*a2 + 80);
  *(void *)(v3 + 128) = v7;
  uint64_t v8 = *(void *)(v5 + 120);
  long long v9 = *(_OWORD *)(v6 + 88);
  long long v10 = *(_OWORD *)(v6 + 104);
  *(void *)(v3 + 16) = v7;
  *(_OWORD *)(v3 + 24) = v9;
  *(_OWORD *)(v3 + 40) = v10;
  *(void *)(v3 + 56) = v8;
  uint64_t v11 = type metadata accessor for HierarchicalStateMachine.MetaState(0, v3 + 16);
  *(void *)(v3 + 136) = v11;
  *(void *)(v3 + 144) = *(void *)(v11 - 8);
  *(void *)(v3 + 152) = swift_task_alloc();
  *(void *)(v3 + 160) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AA74C, a2, 0);
}

uint64_t sub_19D5AA74C()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[14] + *(void *)(*(void *)v0[14] + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  uint64_t v6 = *(void *)(v4 - 8);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v1, 2, v4);
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v9 = v0[18];
      uint64_t v8 = v0[19];
      uint64_t v11 = v0[16];
      uint64_t v10 = v0[17];
      uint64_t v13 = v0[14];
      uint64_t v12 = v0[15];
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v8, v12, v11);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 2, v11);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v5, v8, v10);
      swift_endAccess();
      uint64_t v14 = swift_task_alloc();
      v0[21] = v14;
      *(void *)(v14 + 16) = v13;
      *(void *)(v14 + 24) = v12;
      uint64_t v15 = (void *)swift_task_alloc();
      v0[22] = v15;
      *uint64_t v15 = v0;
      v15[1] = sub_19D5AA9D8;
      return sub_19D5AAF58((uint64_t)v15, (uint64_t)&unk_1E9445370, v14);
    }
  }
  else
  {
    (*(void (**)(void, void))(v0[18] + 8))(v0[20], v0[17]);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

uint64_t sub_19D5AA9D8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AAB04, v1, 0);
}

uint64_t sub_19D5AAB04()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5AAB70(uint64_t a1)
{
  uint64_t v5 = *(uint64_t **)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_19D5990F4;
  return sub_19D5AA604(a1, v5, v4);
}

uint64_t sub_19D5AAC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a3;
  v4[19] = a4;
  v4[17] = a2;
  uint64_t v6 = *(void **)a3;
  uint64_t v7 = *(void *)(*(void *)a3 + 80);
  v4[20] = v7;
  uint64_t v8 = v6[11];
  uint64_t v9 = v6[12];
  uint64_t v10 = v6[13];
  uint64_t v11 = v6[14];
  uint64_t v12 = v6[15];
  v4[2] = v7;
  v4[3] = v8;
  v4[4] = v9;
  v4[5] = v10;
  v4[6] = v11;
  v4[7] = v12;
  uint64_t v13 = type metadata accessor for HierarchicalStateMachine.StateTransition(0, (uint64_t)(v4 + 2));
  v4[21] = v13;
  v4[22] = *(void *)(v13 - 8);
  uint64_t v14 = swift_task_alloc();
  v4[8] = v7;
  v4[23] = v14;
  v4[9] = v8;
  v4[10] = v9;
  v4[11] = v10;
  v4[12] = v11;
  v4[13] = v12;
  uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState(0, (uint64_t)(v4 + 8));
  v4[24] = v15;
  v4[25] = *(void *)(v15 - 8);
  v4[26] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AAE00, a3, 0);
}

uint64_t sub_19D5AAE00()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[18] + *(void *)(*(void *)v0[18] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v4, v6, v5);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[27] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_19D5B35D4;
  uint64_t v10 = v0[23];
  uint64_t v9 = (_OWORD *)v0[24];
  uint64_t v12 = v0[18];
  uint64_t v11 = v0[19];
  uint64_t v13 = v0[17];
  return HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:isolation:)(v10, v11, v13, v12, v9);
}

uint64_t sub_19D5AAF58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[20] = a3;
  v4[21] = v3;
  v4[18] = a1;
  v4[19] = a2;
  uint64_t v5 = *v3;
  v4[22] = *v3;
  uint64_t v6 = *(void *)(v5 + 96);
  v4[23] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[24] = v7;
  v4[25] = *(void *)(v7 + 64);
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AB068, v3, 0);
}

uint64_t sub_19D5AB068()
{
  uint64_t v1 = (void *)v0[22];
  uint64_t v2 = (int *)v0[19];
  v0[28] = v1[10];
  v0[29] = v1[11];
  v0[30] = v1[13];
  v0[31] = v1[14];
  v0[32] = v1[15];
  v0[14] = sub_19D5B35E8();
  v0[15] = v3;
  uint64_t v7 = (int *)((char *)v2 + *v2);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[33] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19D5AB184;
  uint64_t v5 = v0[18];
  return ((uint64_t (*)(uint64_t, void *))v7)(v5, v0 + 14);
}

uint64_t sub_19D5AB184()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 168);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AB294, v1, 0);
}

uint64_t sub_19D5AB294()
{
  *(void *)(v0 + 128) = *(void *)(v0 + 112);
  swift_beginAccess();
  sub_19D6033B8();
  swift_getWitnessTable();
  sub_19D603388();
  swift_endAccess();
  *(void *)(v0 + 272) = *(void *)(v0 + 120);
  if (MEMORY[0x19F3A7540]())
  {
    uint64_t v1 = 0;
    *(void *)(v0 + 280) = *(void *)(**(void **)(v0 + 168) + 144);
    while (1)
    {
      char v2 = sub_19D603378();
      sub_19D603348();
      if (v2)
      {
        uint64_t result = (*(uint64_t (**)(void, unint64_t, void))(*(void *)(v0 + 192) + 16))(*(void *)(v0 + 216), *(void *)(v0 + 272)+ ((*(unsigned __int8 *)(*(void *)(v0 + 192) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 192) + 80))+ *(void *)(*(void *)(v0 + 192) + 72) * v1, *(void *)(v0 + 184));
      }
      else
      {
        uint64_t v10 = *(void *)(v0 + 200);
        uint64_t result = sub_19D603588();
        if (v10 != 8) {
          goto LABEL_18;
        }
        uint64_t v11 = result;
        uint64_t v12 = *(void *)(v0 + 216);
        uint64_t v13 = *(void *)(v0 + 184);
        uint64_t v14 = *(void *)(v0 + 192);
        *(void *)(v0 + 136) = v11;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v12, v0 + 136, v13);
        uint64_t result = swift_unknownObjectRelease();
      }
      *(void *)(v0 + 288) = v1 + 1;
      if (__OFADD__(v1, 1))
      {
        __break(1u);
LABEL_18:
        __break(1u);
        return result;
      }
      uint64_t v4 = *(void *)(v0 + 256);
      uint64_t v5 = *(void *)(v0 + 184);
      uint64_t v6 = *(void *)(v0 + 168) + *(void *)(v0 + 280);
      long long v18 = *(_OWORD *)(v0 + 224);
      long long v19 = *(_OWORD *)(v0 + 240);
      (*(void (**)(void, void, uint64_t))(*(void *)(v0 + 192) + 32))(*(void *)(v0 + 208), *(void *)(v0 + 216), v5);
      swift_beginAccess();
      *(_OWORD *)(v0 + 16) = v18;
      *(void *)(v0 + 32) = v5;
      *(_OWORD *)(v0 + 40) = v19;
      *(void *)(v0 + 56) = v4;
      uint64_t v7 = *(int *)(type metadata accessor for HierarchicalStateMachine.RootState(0, v0 + 16) + 68);
      uint64_t v8 = *(int **)(v6 + v7);
      *(void *)(v0 + 296) = v8;
      if (v8) {
        break;
      }
      (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 184));
      swift_endAccess();
      uint64_t v9 = *(void *)(v0 + 288);
      if (v9 == MEMORY[0x19F3A7540](*(void *)(v0 + 272), *(void *)(v0 + 184))) {
        goto LABEL_11;
      }
      uint64_t v1 = *(void *)(v0 + 288);
    }
    *(void *)(v0 + 304) = *(void *)(v6 + v7 + 8);
    swift_endAccess();
    long long v20 = (uint64_t (*)(uint64_t))((char *)v8 + *v8);
    swift_retain();
    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v16;
    void *v16 = v0;
    v16[1] = sub_19D5AB650;
    uint64_t v17 = *(void *)(v0 + 208);
    return v20(v17);
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
    return v15();
  }
}

uint64_t sub_19D5AB650()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 296);
  uint64_t v2 = *(void *)(*(void *)v0 + 168);
  swift_task_dealloc();
  sub_19D59F5A0(v1);
  return MEMORY[0x1F4188298](sub_19D5AB79C, v2, 0);
}

uint64_t sub_19D5AB79C()
{
  (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 184));
  uint64_t v1 = *(void *)(v0 + 288);
  if (v1 == MEMORY[0x19F3A7540](*(void *)(v0 + 272), *(void *)(v0 + 184)))
  {
LABEL_2:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    while (1)
    {
      uint64_t v4 = *(void *)(v0 + 288);
      char v5 = sub_19D603378();
      sub_19D603348();
      if (v5)
      {
        uint64_t result = (*(uint64_t (**)(void, unint64_t, void))(*(void *)(v0 + 192) + 16))(*(void *)(v0 + 216), *(void *)(v0 + 272)+ ((*(unsigned __int8 *)(*(void *)(v0 + 192) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 192) + 80))+ *(void *)(*(void *)(v0 + 192) + 72) * v4, *(void *)(v0 + 184));
      }
      else
      {
        uint64_t v12 = *(void *)(v0 + 200);
        uint64_t result = sub_19D603588();
        if (v12 != 8) {
          goto LABEL_17;
        }
        uint64_t v13 = result;
        uint64_t v14 = *(void *)(v0 + 216);
        uint64_t v15 = *(void *)(v0 + 184);
        uint64_t v16 = *(void *)(v0 + 192);
        *(void *)(v0 + 136) = v13;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v0 + 136, v15);
        uint64_t result = swift_unknownObjectRelease();
      }
      *(void *)(v0 + 288) = v4 + 1;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
LABEL_17:
        __break(1u);
        return result;
      }
      uint64_t v6 = *(void *)(v0 + 256);
      uint64_t v7 = *(void *)(v0 + 184);
      uint64_t v8 = *(void *)(v0 + 168) + *(void *)(v0 + 280);
      long long v19 = *(_OWORD *)(v0 + 224);
      long long v20 = *(_OWORD *)(v0 + 240);
      (*(void (**)(void, void, uint64_t))(*(void *)(v0 + 192) + 32))(*(void *)(v0 + 208), *(void *)(v0 + 216), v7);
      swift_beginAccess();
      *(_OWORD *)(v0 + 16) = v19;
      *(void *)(v0 + 32) = v7;
      *(_OWORD *)(v0 + 40) = v20;
      *(void *)(v0 + 56) = v6;
      uint64_t v9 = *(int *)(type metadata accessor for HierarchicalStateMachine.RootState(0, v0 + 16) + 68);
      uint64_t v10 = *(int **)(v8 + v9);
      *(void *)(v0 + 296) = v10;
      if (v10) {
        break;
      }
      (*(void (**)(void, void))(*(void *)(v0 + 192) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 184));
      swift_endAccess();
      uint64_t v11 = *(void *)(v0 + 288);
      if (v11 == MEMORY[0x19F3A7540](*(void *)(v0 + 272), *(void *)(v0 + 184))) {
        goto LABEL_2;
      }
    }
    *(void *)(v0 + 304) = *(void *)(v8 + v9 + 8);
    swift_endAccess();
    uint64_t v21 = (uint64_t (*)(uint64_t))((char *)v10 + *v10);
    swift_retain();
    uint64_t v17 = (void *)swift_task_alloc();
    *(void *)(v0 + 312) = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_19D5AB650;
    uint64_t v18 = *(void *)(v0 + 208);
    return v21(v18);
  }
}

uint64_t HierarchicalStateMachine.invalidate()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_19D5ABADC, v0, 0);
}

uint64_t sub_19D5ABADC()
{
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1E9445120 + dword_1E9445120);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5ABB9C;
  uint64_t v2 = *(void *)(v0 + 16);
  return v4((uint64_t)v4, (uint64_t)&unk_1E9445138, v2);
}

uint64_t sub_19D5ABB9C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5ABCAC, v1, 0);
}

uint64_t sub_19D5ABCAC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19D5ABCC0(uint64_t a1, uint64_t *a2)
{
  *(void *)(v2 + 136) = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(*a2 + 80);
  *(void *)(v2 + 144) = v6;
  *(void *)(v2 + 152) = *(void *)(v6 - 8);
  *(void *)(v2 + 160) = swift_task_alloc();
  uint64_t v7 = *(void *)(v4 + 120);
  long long v8 = *(_OWORD *)(v5 + 88);
  long long v9 = *(_OWORD *)(v5 + 104);
  *(void *)(v2 + 16) = v6;
  *(_OWORD *)(v2 + 24) = v8;
  *(_OWORD *)(v2 + 40) = v9;
  *(void *)(v2 + 56) = v7;
  uint64_t v10 = type metadata accessor for HierarchicalStateMachine.MetaState(0, v2 + 16);
  *(void *)(v2 + 168) = v10;
  *(void *)(v2 + 176) = *(void *)(v10 - 8);
  *(void *)(v2 + 184) = swift_task_alloc();
  *(void *)(v2 + 192) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5ABE64, a2, 0);
}

uint64_t sub_19D5ABE64()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[21];
  uint64_t v3 = v0[22];
  uint64_t v4 = v0[18];
  uint64_t v5 = v0[19];
  uint64_t v6 = v0[17] + *(void *)(*(void *)v0[17] + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v1, 2, v4);
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v9 = v0[22];
      uint64_t v8 = v0[23];
      uint64_t v10 = v0[21];
      (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v0[19] + 56))(v8, 2, 2, v0[18]);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 40))(v6, v8, v10);
      swift_endAccess();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  else
  {
    uint64_t v13 = v0[23];
    uint64_t v14 = v0[21];
    uint64_t v15 = v0[22];
    uint64_t v17 = v0[19];
    uint64_t v16 = v0[20];
    uint64_t v19 = v0[17];
    uint64_t v18 = v0[18];
    (*(void (**)(uint64_t, void, uint64_t))(v17 + 32))(v16, v0[24], v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v13, 2, 2, v18);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 40))(v6, v13, v14);
    swift_endAccess();
    uint64_t v20 = swift_task_alloc();
    v0[25] = v20;
    *(void *)(v20 + 16) = v19;
    *(void *)(v20 + 24) = v16;
    uint64_t v21 = (void *)swift_task_alloc();
    v0[26] = v21;
    void *v21 = v0;
    v21[1] = sub_19D5AC118;
    return sub_19D5AAF58((uint64_t)v21, (uint64_t)&unk_1E9445360, v20);
  }
}

uint64_t sub_19D5AC118()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AC244, v1, 0);
}

uint64_t sub_19D5AC244()
{
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_19D5AC2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[18] = a3;
  v4[19] = a4;
  v4[17] = a2;
  uint64_t v6 = *(void **)a3;
  uint64_t v7 = *(void *)(*(void *)a3 + 80);
  v4[20] = v7;
  uint64_t v8 = v6[11];
  uint64_t v9 = v6[12];
  uint64_t v10 = v6[13];
  uint64_t v11 = v6[14];
  uint64_t v12 = v6[15];
  v4[2] = v7;
  v4[3] = v8;
  v4[4] = v9;
  v4[5] = v10;
  v4[6] = v11;
  v4[7] = v12;
  uint64_t v13 = type metadata accessor for HierarchicalStateMachine.StateTransition(0, (uint64_t)(v4 + 2));
  v4[21] = v13;
  v4[22] = *(void *)(v13 - 8);
  uint64_t v14 = swift_task_alloc();
  v4[8] = v7;
  v4[23] = v14;
  v4[9] = v8;
  v4[10] = v9;
  v4[11] = v10;
  v4[12] = v11;
  v4[13] = v12;
  uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState(0, (uint64_t)(v4 + 8));
  v4[24] = v15;
  v4[25] = *(void *)(v15 - 8);
  v4[26] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AC4B8, a3, 0);
}

uint64_t sub_19D5AC4B8()
{
  uint64_t v2 = v0[25];
  uint64_t v1 = v0[26];
  uint64_t v4 = v0[23];
  uint64_t v3 = v0[24];
  uint64_t v5 = v0[20];
  uint64_t v6 = v0[19];
  uint64_t v7 = v0[18] + *(void *)(*(void *)v0[18] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(v4, v6, v5);
  swift_storeEnumTagMultiPayload();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[27] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_19D5AC610;
  uint64_t v10 = v0[23];
  uint64_t v9 = (_OWORD *)v0[24];
  uint64_t v12 = v0[18];
  uint64_t v11 = v0[19];
  uint64_t v13 = v0[17];
  return HierarchicalStateMachine.RootState.handleStateTransition(_:currentState:delegate:isolation:)(v10, v11, v13, v12, v9);
}

uint64_t sub_19D5AC610()
{
  uint64_t v1 = *(void *)(*v0 + 208);
  uint64_t v2 = *(void *)(*v0 + 200);
  uint64_t v3 = *(void *)(*v0 + 192);
  uint64_t v4 = *(void *)(*v0 + 184);
  uint64_t v5 = *(void *)(*v0 + 176);
  uint64_t v6 = *(void *)(*v0 + 168);
  uint64_t v9 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v9 + 8);
  return v7();
}

uint64_t HierarchicalStateMachine.enqueue(event:)(uint64_t a1)
{
  v2[3] = a1;
  v2[4] = v1;
  uint64_t v3 = *v1;
  v2[5] = *v1;
  uint64_t v4 = *(void *)(v3 + 88);
  void v2[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[7] = v5;
  v2[8] = *(void *)(v5 + 64);
  v2[9] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AC8C8, v1, 0);
}

uint64_t sub_19D5AC8C8()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[3];
  uint64_t v7 = *(void *)(v4 + 112);
  v0[10] = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v6, v2);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  v0[11] = v9;
  *(void *)(v9 + 16) = *(void *)(v5 + 80);
  *(void *)(v9 + 24) = v2;
  *(void *)(v9 + 32) = *(void *)(v5 + 96);
  *(_OWORD *)(v9 + 40) = *(_OWORD *)(v5 + 104);
  *(void *)(v9 + 56) = *(void *)(v5 + 120);
  *(void *)(v9 + 64) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v2);
  swift_retain();
  return MEMORY[0x1F4188298](sub_19D5AC9E0, v7, 0);
}

uint64_t sub_19D5AC9E0()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[11];
  v0[2] = 0;
  sub_19D5B0B90();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[12] = v3;
  v3[2] = v0 + 2;
  v3[3] = v1;
  v3[4] = &unk_1E9445150;
  void v3[5] = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19D5ACB04;
  return MEMORY[0x1F41880D8]();
}

uint64_t sub_19D5ACB04()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5ACC30, v1, 0);
}

uint64_t sub_19D5ACC30()
{
  if (*(void *)(v0 + 16))
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
    return v1();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_19D5ACCB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_19D5B35E4;
  return sub_19D5ACD50(a3);
}

uint64_t sub_19D5ACD50(uint64_t a1)
{
  *(void *)(v2 + 144) = a1;
  *(void *)(v2 + 152) = v1;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(*v1 + 88);
  *(void *)(v2 + 160) = v5;
  *(void *)(v2 + 168) = *(void *)(v5 - 8);
  *(void *)(v2 + 176) = swift_task_alloc();
  uint64_t v6 = *(void *)(v3 + 80);
  *(void *)(v2 + 184) = v6;
  long long v7 = *(_OWORD *)(v4 + 96);
  long long v8 = *(_OWORD *)(v4 + 112);
  *(void *)(v2 + 16) = v6;
  *(void *)(v2 + 24) = v5;
  *(_OWORD *)(v2 + 32) = v7;
  *(_OWORD *)(v2 + 48) = v8;
  uint64_t v9 = type metadata accessor for HierarchicalStateMachine.MetaState(0, v2 + 16);
  *(void *)(v2 + 192) = v9;
  *(void *)(v2 + 200) = *(void *)(v9 - 8);
  *(void *)(v2 + 208) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5ACEDC, v1, 0);
}

uint64_t sub_19D5ACEDC()
{
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v1 = (void *)(v0[19] + *(void *)(*(void *)v0[19] + 152));
  swift_beginAccess();
  v0[17] = *v1;
  sub_19D6033B8();
  swift_getWitnessTable();
  uint64_t result = sub_19D6034B8();
  if (result)
  {
    uint64_t v4 = v0[25];
    uint64_t v3 = v0[26];
    uint64_t v6 = v0[23];
    uint64_t v5 = v0[24];
    uint64_t v7 = v0[19] + *(void *)(*(void *)v0[19] + 160);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v7, v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 2, v6))
    {
      swift_task_dealloc();
      swift_task_dealloc();
      long long v8 = (uint64_t (*)(void))v0[1];
      return v8();
    }
    else
    {
      (*(void (**)(void, void, void))(v0[21] + 16))(v0[22], v0[18], v0[20]);
      swift_beginAccess();
      sub_19D603398();
      swift_endAccess();
      uint64_t v9 = (void *)swift_task_alloc();
      v0[27] = v9;
      *uint64_t v9 = v0;
      v9[1] = sub_19D5AD15C;
      return sub_19D5AD5A4();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_19D5AD15C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AD26C, v1, 0);
}

uint64_t sub_19D5AD26C()
{
  (*(void (**)(void, void))(v0[25] + 8))(v0[26], v0[24]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t HierarchicalStateMachine.enqueueAndWait(event:)(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_19D5AD310, v1, 0);
}

uint64_t sub_19D5AD310()
{
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = swift_task_alloc();
  v0[4] = v3;
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = v2;
  uint64_t v6 = (uint64_t (*)(void))((char *)&dword_1E9445120 + dword_1E9445120);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19D5AA10C;
  return v6();
}

uint64_t sub_19D5AD3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_19D598408;
  return sub_19D5ACD50(a3);
}

uint64_t HierarchicalStateMachine.runToCompletion()()
{
  *(void *)(v1 + 16) = v0;
  return MEMORY[0x1F4188298](sub_19D5AD4AC, v0, 0);
}

uint64_t sub_19D5AD4AC()
{
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1E9445120 + dword_1E9445120);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_19D5ABB9C;
  return v3((uint64_t)v3, (uint64_t)&unk_1E9445180, 0);
}

uint64_t sub_19D5AD56C()
{
  return sub_19D5B1F04(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_19D5AD5A4()
{
  v1[9] = v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 88);
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AD670, v0, 0);
}

uint64_t sub_19D5AD670()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = *(void *)(*(void *)v1 + 152);
  v0[13] = v2;
  uint64_t v3 = (void *)(v1 + v2);
  swift_beginAccess();
  v0[8] = *v3;
  v0[14] = sub_19D6033B8();
  swift_getWitnessTable();
  if (sub_19D6034B8())
  {
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    swift_beginAccess();
    swift_getWitnessTable();
    sub_19D6034D8();
    swift_endAccess();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[15] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_19D5AD82C;
    uint64_t v7 = v0[12];
    return sub_19D5ADACC(v7);
  }
}

uint64_t sub_19D5AD82C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AD93C, v1, 0);
}

uint64_t sub_19D5AD93C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[9];
  (*(void (**)(void, void))(v0[11] + 8))(v0[12], v0[10]);
  v0[8] = *(void *)(v2 + v1);
  swift_getWitnessTable();
  if (sub_19D6034B8())
  {
    swift_task_dealloc();
    uint64_t v3 = (uint64_t (*)(void))v0[1];
    return v3();
  }
  else
  {
    swift_beginAccess();
    swift_getWitnessTable();
    sub_19D6034D8();
    swift_endAccess();
    uint64_t v5 = (void *)swift_task_alloc();
    v0[15] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_19D5AD82C;
    uint64_t v6 = v0[12];
    return sub_19D5ADACC(v6);
  }
}

uint64_t sub_19D5ADACC(uint64_t a1)
{
  v2[17] = a1;
  v2[18] = v1;
  uint64_t v3 = *(void **)v1;
  uint64_t v4 = *(void *)(*(void *)v1 + 80);
  v2[19] = v4;
  uint64_t v5 = v3[11];
  uint64_t v6 = v3[12];
  uint64_t v7 = v3[13];
  uint64_t v8 = v3[14];
  uint64_t v9 = v3[15];
  v2[2] = v4;
  v2[3] = v5;
  v2[4] = v6;
  v2[5] = v7;
  void v2[6] = v8;
  v2[7] = v9;
  uint64_t v10 = type metadata accessor for HierarchicalStateMachine.EventReaction(0, (uint64_t)(v2 + 2));
  v2[20] = v10;
  v2[21] = *(void *)(v10 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v11 = swift_task_alloc();
  v2[8] = v4;
  v2[23] = v11;
  v2[9] = v5;
  v2[10] = v6;
  v2[11] = v7;
  v2[12] = v8;
  v2[13] = v9;
  uint64_t v12 = type metadata accessor for HierarchicalStateMachine.MetaState(0, (uint64_t)(v2 + 8));
  v2[24] = v12;
  v2[25] = *(void *)(v12 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = *(void *)(v4 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5ADD18, v1, 0);
}

uint64_t sub_19D5ADD18()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 192);
  uint64_t v4 = *(void *)(v0 + 200);
  uint64_t v5 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 144) + *(void *)(**(void **)(v0 + 144) + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v6, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 2, v5))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 200) + 8))(*(void *)(v0 + 208), *(void *)(v0 + 192));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 232);
    uint64_t v10 = *(void *)(v0 + 208);
    uint64_t v11 = *(void *)(v0 + 216);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
    uint64_t v13 = *(void *)(v0 + 152);
    *(void *)(v0 + 240) = v12;
    *(void *)(v0 + 248) = (v11 + 32) & 0xFFFFFFFFFFFFLL | 0x48D8000000000000;
    int8x16_t v17 = *(int8x16_t *)(v0 + 136);
    v12(v9, v10, v13);
    uint64_t v14 = (int8x16_t *)swift_task_alloc();
    *(void *)(v0 + 256) = v14;
    v14[1] = vextq_s8(v17, v17, 8uLL);
    v14[2].i64[0] = v9;
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 264) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_19D5ADF34;
    uint64_t v16 = *(void *)(v0 + 184);
    return sub_19D5AAF58(v16, (uint64_t)&unk_1E94452D8, (uint64_t)v14);
  }
}

uint64_t sub_19D5ADF34()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AE060, v1, 0);
}

uint64_t sub_19D5AE060()
{
  uint64_t v1 = v0[22];
  (*(void (**)(uint64_t, void, void))(v0[21] + 16))(v1, v0[23], v0[20]);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1E9444568);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(TupleTypeMetadata2 - 8) + 48))(v1, 2, TupleTypeMetadata2))
  {
    uint64_t v3 = v0[27];
    (*(void (**)(void, void))(v0[21] + 8))(v0[23], v0[20]);
    (*(void (**)(void, void))(v3 + 8))(v0[29], v0[19]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    uint64_t v6 = (void (*)(uint64_t))v0[30];
    uint64_t v7 = v0[28];
    uint64_t v8 = (uint64_t *)(v0[22] + *(int *)(TupleTypeMetadata2 + 48));
    uint64_t v10 = *v8;
    uint64_t v9 = v8[1];
    v0[34] = v9;
    v6(v7);
    swift_retain();
    uint64_t v11 = (void *)swift_task_alloc();
    v0[35] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_19D5AE268;
    uint64_t v12 = v0[28];
    uint64_t v13 = v0[29];
    uint64_t v14 = v0[17];
    return sub_19D5AE7F0(v13, v12, v14, v10, v9);
  }
}

uint64_t sub_19D5AE268()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 144);
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x1F4188298](sub_19D5AE394, v1, 0);
}

uint64_t sub_19D5AE394()
{
  uint64_t v2 = v0[27];
  uint64_t v1 = v0[28];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[20];
  uint64_t v5 = v0[21];
  uint64_t v6 = v0[19];
  swift_release();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7(v1, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v7(v0[29], v0[19]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_19D5AE494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 112) = a4;
  *(void *)(v5 + 120) = a5;
  *(void *)(v5 + 96) = a2;
  *(void *)(v5 + 104) = a3;
  *(void *)(v5 + 88) = a1;
  long long v7 = *(_OWORD *)(*(void *)a3 + 96);
  long long v8 = *(_OWORD *)(*(void *)a3 + 112);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)(*(void *)a3 + 80);
  *(_OWORD *)(v5 + 32) = v7;
  *(_OWORD *)(v5 + 48) = v8;
  uint64_t v9 = type metadata accessor for HierarchicalStateMachine.RootState(0, v5 + 16);
  *(void *)(v5 + 128) = v9;
  *(void *)(v5 + 136) = *(void *)(v9 - 8);
  *(void *)(v5 + 144) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AE598, a3, 0);
}

uint64_t sub_19D5AE598()
{
  uint64_t v2 = v0[17];
  uint64_t v1 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[13] + *(void *)(*(void *)v0[13] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[19] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_19D5AE698;
  uint64_t v6 = v0[15];
  long long v7 = (_OWORD *)v0[16];
  uint64_t v9 = v0[13];
  uint64_t v8 = v0[14];
  uint64_t v10 = v0[11];
  uint64_t v11 = v0[12];
  return HierarchicalStateMachine.RootState.handleEvent(_:currentState:delegate:isolation:)(v10, v8, v6, v11, v9, v7);
}

uint64_t sub_19D5AE698()
{
  uint64_t v1 = *(void *)(*v0 + 144);
  uint64_t v2 = *(void *)(*v0 + 136);
  uint64_t v3 = *(void *)(*v0 + 128);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_19D5AE7F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[21] = a5;
  v6[22] = v5;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  uint64_t v7 = *(void **)v5;
  uint64_t v8 = *(void *)(*(void *)v5 + 80);
  v6[23] = v8;
  uint64_t v9 = v7[11];
  v6[24] = v9;
  uint64_t v10 = v7[12];
  v6[25] = v10;
  uint64_t v11 = v7[13];
  v6[26] = v11;
  uint64_t v12 = v7[14];
  v6[27] = v12;
  uint64_t v13 = v7[15];
  v6[2] = v8;
  v6[28] = v13;
  _OWORD v6[3] = v9;
  v6[4] = v10;
  v6[5] = v11;
  v6[6] = v12;
  v6[7] = v13;
  uint64_t v14 = type metadata accessor for HierarchicalStateMachine.MetaState(0, (uint64_t)(v6 + 2));
  v6[29] = v14;
  v6[30] = *(void *)(v14 - 8);
  uint64_t v15 = swift_task_alloc();
  v6[8] = v8;
  v6[31] = v15;
  v6[9] = v9;
  v6[10] = v10;
  v6[11] = v11;
  v6[12] = v12;
  v6[13] = v13;
  uint64_t v16 = type metadata accessor for HierarchicalStateMachine.StateTransition(0, (uint64_t)(v6 + 8));
  v6[32] = v16;
  v6[33] = *(void *)(v16 - 8);
  v6[34] = swift_task_alloc();
  v6[35] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AE9F8, v5, 0);
}

uint64_t sub_19D5AE9F8()
{
  uint64_t v1 = v0[35];
  uint64_t v3 = v0[23];
  uint64_t v2 = v0[24];
  uint64_t v17 = v0[22];
  uint64_t v4 = v0[18];
  uint64_t v16 = v0[19];
  uint64_t v5 = v0[17];
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  v0[36] = TupleTypeMetadata3;
  uint64_t v7 = v1 + *(int *)(TupleTypeMetadata3 + 48);
  uint64_t v8 = v1 + *(int *)(TupleTypeMetadata3 + 64);
  uint64_t v9 = *(void *)(v3 - 8);
  v0[37] = v9;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v0[38] = v10;
  v0[39] = (v9 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v10(v1, v5, v3);
  uint64_t v11 = *(void *)(v2 - 8);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16);
  v0[40] = v12;
  v0[41] = (v11 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v12(v7, v16, v2);
  v10(v8, v4, v3);
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = (void *)swift_task_alloc();
  v0[42] = v13;
  void v13[2] = v17;
  v13[3] = v1;
  v13[4] = v5;
  v13[5] = v4;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[43] = v14;
  void *v14 = v0;
  v14[1] = sub_19D5AEBF8;
  return sub_19D5AAF58((uint64_t)v14, (uint64_t)&unk_1E94452F8, (uint64_t)v13);
}

uint64_t sub_19D5AEBF8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AED24, v1, 0);
}

uint64_t sub_19D5AED24()
{
  uint64_t v1 = (_OWORD *)swift_task_alloc();
  *(void *)(v0 + 352) = v1;
  long long v2 = *(_OWORD *)(v0 + 200);
  long long v3 = *(_OWORD *)(v0 + 216);
  long long v4 = *(_OWORD *)(v0 + 160);
  v1[1] = *(_OWORD *)(v0 + 184);
  v1[2] = v2;
  v1[3] = v3;
  v1[4] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_19D5AEE00;
  return sub_19D5AAF58((uint64_t)v5, (uint64_t)&unk_1E9445308, (uint64_t)v1);
}

uint64_t sub_19D5AEE00()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AEF2C, v1, 0);
}

uint64_t sub_19D5AEF2C()
{
  uint64_t v20 = (void (*)(uint64_t, uint64_t, uint64_t))v0[40];
  uint64_t v1 = v0[37];
  long long v2 = (void (*)(uint64_t))v0[38];
  uint64_t v3 = v0[34];
  uint64_t v4 = v0[31];
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[23];
  uint64_t v7 = v0[22];
  uint64_t v18 = v0[19];
  uint64_t v19 = v0[24];
  uint64_t v16 = v0[36];
  uint64_t v17 = v0[18];
  uint64_t v14 = v0[29];
  uint64_t v15 = v0[17];
  v2(v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v1 + 56))(v4, 0, 2, v6);
  uint64_t v8 = v7 + *(void *)(*(void *)v7 + 160);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 40))(v8, v4, v14);
  swift_endAccess();
  uint64_t v9 = v3 + *(int *)(v16 + 48);
  uint64_t v10 = v3 + *(int *)(v16 + 64);
  ((void (*)(uint64_t, uint64_t, uint64_t))v2)(v3, v15, v6);
  v20(v9, v18, v19);
  ((void (*)(uint64_t, uint64_t, uint64_t))v2)(v10, v17, v6);
  swift_storeEnumTagMultiPayload();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[46] = v11;
  _OWORD v11[2] = v7;
  v11[3] = v3;
  v11[4] = v17;
  v11[5] = v15;
  uint64_t v12 = (void *)swift_task_alloc();
  v0[47] = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_19D5AF130;
  return sub_19D5AAF58((uint64_t)v12, (uint64_t)&unk_1E9445318, (uint64_t)v11);
}

uint64_t sub_19D5AF130()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5AF25C, v1, 0);
}

uint64_t sub_19D5AF25C()
{
  uint64_t v1 = v0[35];
  uint64_t v2 = v0[32];
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0[33] + 8);
  v3(v0[34], v2);
  v3(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_19D5AF314(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 112) = a5;
  *(void *)(v6 + 120) = a6;
  *(void *)(v6 + 96) = a3;
  *(void *)(v6 + 104) = a4;
  *(void *)(v6 + 88) = a2;
  uint64_t v8 = *a3;
  uint64_t v9 = *a3;
  uint64_t v10 = *(void *)(*a3 + 104);
  *(void *)(v6 + 128) = v10;
  uint64_t v11 = *(void *)(v8 + 80);
  *(void *)(v6 + 136) = v11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(v6 + 144) = AssociatedTypeWitness;
  *(void *)(v6 + 152) = *(void *)(AssociatedTypeWitness - 8);
  *(void *)(v6 + 160) = swift_task_alloc();
  long long v13 = *(_OWORD *)(v9 + 88);
  long long v14 = *(_OWORD *)(v9 + 112);
  *(void *)(v6 + 16) = v11;
  *(_OWORD *)(v6 + 24) = v13;
  *(void *)(v6 + 40) = v10;
  *(_OWORD *)(v6 + 48) = v14;
  uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState(0, v6 + 16);
  *(void *)(v6 + 168) = v15;
  *(void *)(v6 + 176) = *(void *)(v15 - 8);
  *(void *)(v6 + 184) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AF4D4, a3, 0);
}

uint64_t sub_19D5AF4D4()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  uint64_t v5 = v0[16];
  uint64_t v4 = v0[17];
  uint64_t v6 = v0[12] + *(void *)(*(void *)v0[12] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[24] = v7;
  void *v7 = v0;
  v7[1] = sub_19D5B35D8;
  uint64_t v8 = v0[20];
  uint64_t v9 = (_OWORD *)v0[21];
  uint64_t v11 = v0[13];
  uint64_t v10 = v0[14];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[12];
  return HierarchicalStateMachine.RootState.handleStateTransition(_:stateValue:otherStateLabel:delegate:isolation:)(v11, v10, v8, v12, v13, v9);
}

uint64_t sub_19D5AF60C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 112) = a5;
  *(void *)(v6 + 120) = a6;
  *(void *)(v6 + 96) = a3;
  *(void *)(v6 + 104) = a4;
  *(void *)(v6 + 88) = a2;
  uint64_t v8 = *a3;
  uint64_t v9 = *a3;
  uint64_t v10 = *(void *)(*a3 + 104);
  *(void *)(v6 + 128) = v10;
  uint64_t v11 = *(void *)(v8 + 80);
  *(void *)(v6 + 136) = v11;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(void *)(v6 + 144) = AssociatedTypeWitness;
  *(void *)(v6 + 152) = *(void *)(AssociatedTypeWitness - 8);
  *(void *)(v6 + 160) = swift_task_alloc();
  long long v13 = *(_OWORD *)(v9 + 88);
  long long v14 = *(_OWORD *)(v9 + 112);
  *(void *)(v6 + 16) = v11;
  *(_OWORD *)(v6 + 24) = v13;
  *(void *)(v6 + 40) = v10;
  *(_OWORD *)(v6 + 48) = v14;
  uint64_t v15 = type metadata accessor for HierarchicalStateMachine.RootState(0, v6 + 16);
  *(void *)(v6 + 168) = v15;
  *(void *)(v6 + 176) = *(void *)(v15 - 8);
  *(void *)(v6 + 184) = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5AF7CC, a3, 0);
}

uint64_t sub_19D5AF7CC()
{
  uint64_t v2 = v0[22];
  uint64_t v1 = v0[23];
  uint64_t v3 = v0[21];
  uint64_t v5 = v0[16];
  uint64_t v4 = v0[17];
  uint64_t v6 = v0[12] + *(void *)(*(void *)v0[12] + 144);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[24] = v7;
  void *v7 = v0;
  v7[1] = sub_19D5AF904;
  uint64_t v8 = v0[20];
  uint64_t v9 = (_OWORD *)v0[21];
  uint64_t v11 = v0[13];
  uint64_t v10 = v0[14];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[12];
  return HierarchicalStateMachine.RootState.handleStateTransition(_:stateValue:otherStateLabel:delegate:isolation:)(v11, v10, v8, v12, v13, v9);
}

uint64_t sub_19D5AF904()
{
  uint64_t v1 = *(void *)(*v0 + 184);
  uint64_t v2 = *(void *)(*v0 + 176);
  uint64_t v3 = *(void *)(*v0 + 168);
  uint64_t v4 = *(void *)(*v0 + 160);
  uint64_t v5 = *(void *)(*v0 + 152);
  uint64_t v6 = *(void *)(*v0 + 144);
  uint64_t v9 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v9 + 8);
  return v7();
}

uint64_t HierarchicalStateMachine.deinit()
{
  uint64_t v1 = *(void **)v0;
  swift_release();
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  uint64_t v4 = v1[11];
  uint64_t v5 = v1[12];
  uint64_t v6 = v1[13];
  uint64_t v7 = v1[14];
  uint64_t v8 = v1[15];
  uint64_t v14 = v1[10];
  uint64_t v3 = v14;
  uint64_t v15 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  uint64_t v9 = v0 + v2;
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  uint64_t v10 = type metadata accessor for HierarchicalStateMachine.RootState(0, (uint64_t)&v14);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = v0 + *(void *)(*(void *)v0 + 160);
  uint64_t v14 = v3;
  uint64_t v15 = v4;
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  uint64_t v18 = v7;
  uint64_t v19 = v8;
  uint64_t v12 = type metadata accessor for HierarchicalStateMachine.MetaState(0, (uint64_t)&v14);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t HierarchicalStateMachine.__deallocating_deinit()
{
  HierarchicalStateMachine.deinit();
  return MEMORY[0x1F4188210](v0);
}

uint64_t HierarchicalStateMachine.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_19D5AFCA0()
{
  return HierarchicalStateMachine.unownedExecutor.getter();
}

uint64_t sub_19D5AFCBC(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return MEMORY[0x1F4188298](sub_19D5AFCDC, v1, 0);
}

uint64_t sub_19D5AFCDC()
{
  HierarchicalStateMachine.currentValue.getter(*(void *)(v0 + 16));
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5AFD3C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_19D5B35E4;
  return MEMORY[0x1F4188298](sub_19D5AA02C, v1, 0);
}

uint64_t sub_19D5AFDE8()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19D5990F4;
  v2[2] = v0;
  return MEMORY[0x1F4188298](sub_19D5ABADC, v0, 0);
}

uint64_t sub_19D5AFE8C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_19D5990F4;
  return HierarchicalStateMachine.enqueue(event:)(a1);
}

uint64_t sub_19D5AFF20(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[2] = a1;
  v4[3] = v1;
  v4[1] = sub_19D5990F4;
  return MEMORY[0x1F4188298](sub_19D5AD310, v1, 0);
}

uint64_t sub_19D5AFFCC()
{
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_19D5990F4;
  v2[2] = v0;
  return MEMORY[0x1F4188298](sub_19D5AD4AC, v0, 0);
}

void sub_19D5B0070(void (*a1)(void))
{
}

uint64_t sub_19D5B00DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[12] = a3;
  v4[13] = v3;
  v4[10] = a1;
  v4[11] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  v4[14] = swift_task_alloc();
  v4[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5B0184, v3, 0);
}

uint64_t sub_19D5B0184()
{
  if (qword_1E9444350 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 104);
  sub_19D603758();
  LOBYTE(v1) = sub_19D5BCBAC(v1, *(void *)(v0 + 72));
  swift_bridgeObjectRelease();
  if (v1)
  {
    (*(void (**)(unint64_t (*)(), void, const char *, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 104) + 128))(sub_19D5BCC78, 0, "HMFoundation/AsyncSerialQueue.swift", 35, 2, 114);
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  }
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v2, 1, 1, v4);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v0 + 104);
  if (*(void *)(*(void *)(v3 + 120) + 24)) {
    goto LABEL_9;
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *(void *)(v0 + 104);
  if (*(unsigned char *)(v6 + 112))
  {
LABEL_9:
    uint64_t v7 = *(void *)(v0 + 120);
    sub_19D5B0B90();
    uint64_t v8 = swift_task_alloc();
    *(void *)(v0 + 128) = v8;
    *(void *)(v8 + 16) = v6;
    *(void *)(v8 + 24) = v7;
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_19D5B050C;
    return MEMORY[0x1F41880D8]();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v10 = *(void *)(v0 + 120);
    *(unsigned char *)(v6 + 112) = 1;
    sub_19D5B3290(v10, v11);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4);
    uint64_t v13 = *(void *)(v0 + 112);
    if (v12 == 1)
    {
      sub_19D5B3234(*(void *)(v0 + 112), &qword_1E9445338);
    }
    else
    {
      sub_19D6033D8();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v13, v4);
    }
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 144) = v14;
    *(void *)uint64_t v14 = v0;
    *(void *)(v14 + 8) = sub_19D5B06E8;
    uint64_t v15 = *(void *)(v0 + 104);
    long long v16 = *(_OWORD *)(v0 + 80);
    *(void *)(v14 + 48) = *(void *)(v0 + 96);
    *(void *)(v14 + 56) = v15;
    *(_OWORD *)(v14 + 32) = v16;
    return MEMORY[0x1F4188298](sub_19D5B2C08, v15, 0);
  }
}

uint64_t sub_19D5B050C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 104);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5B0638, v1, 0);
}

uint64_t sub_19D5B0638()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 144) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = sub_19D5B06E8;
  uint64_t v2 = *(void *)(v0 + 104);
  long long v3 = *(_OWORD *)(v0 + 80);
  *(void *)(v1 + 48) = *(void *)(v0 + 96);
  *(void *)(v1 + 56) = v2;
  *(_OWORD *)(v1 + 32) = v3;
  return MEMORY[0x1F4188298](sub_19D5B2C08, v2, 0);
}

uint64_t sub_19D5B06E8()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v4 = sub_19D5B08A4;
  }
  else {
    uint64_t v4 = sub_19D5B0814;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_19D5B0814()
{
  uint64_t v1 = *(void *)(v0 + 120);
  sub_19D5BCFFC();
  sub_19D5B3234(v1, &qword_1E9445338);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_19D5B08A4()
{
  uint64_t v1 = *(void *)(v0 + 120);
  sub_19D5BCFFC();
  sub_19D5B3234(v1, &qword_1E9445338);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t type metadata accessor for HierarchicalStateMachine.MetaState(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.MetaState);
}

uint64_t sub_19D5B094C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_19D5990F4;
  return sub_19D5ABCC0(a1, v1);
}

uint64_t sub_19D5B09E8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 72) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x1F4186498](v0, v5, v6);
}

uint64_t sub_19D5B0AAC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = v1
     + ((*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(v1 + 24) - 8) + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_19D5990F4;
  return sub_19D5ACCB4(a1, v4, v5);
}

unint64_t sub_19D5B0B90()
{
  unint64_t result = qword_1E9445158;
  if (!qword_1E9445158)
  {
    type metadata accessor for AsyncSerialQueue();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9445158);
  }
  return result;
}

uint64_t sub_19D5B0BE8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v27 = a4;
  long long v28 = a2;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  MEMORY[0x1F4188790](v8, v11, v12);
  uint64_t v13 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  MEMORY[0x1F4188790](v14 - 8, v15, v16);
  uint64_t v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v19 = sub_19D603438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  unint64_t v20 = sub_19D5B0B90();
  unint64_t v21 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  unint64_t v22 = (v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  long long v23 = (char *)swift_allocObject();
  *((void *)v23 + 2) = a3;
  *((void *)v23 + 3) = v20;
  *((void *)v23 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v23[v21], v13, v8);
  long long v24 = &v23[v22];
  *(void *)long long v24 = v27;
  *((void *)v24 + 1) = a5;
  swift_retain_n();
  swift_retain();
  uint64_t v25 = sub_19D5B2A5C((uint64_t)v18, (uint64_t)&unk_1E9445330, (uint64_t)v23);
  *long long v28 = v25;
  return swift_release();
}

uint64_t sub_19D5B0E40(uint64_t a1)
{
  return sub_19D5B0BE8(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t sub_19D5B0E4C(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_19D5990F4;
  return sub_19D5AD3F0(a1, v5, v4);
}

uint64_t sub_19D5B0EF8()
{
  return swift_getWitnessTable();
}

uint64_t sub_19D5B0F18(void *a1)
{
  uint64_t v17 = MEMORY[0x1E4FBADB0] + 64;
  uint64_t v1 = a1[10];
  uint64_t v2 = a1[11];
  uint64_t v3 = a1[12];
  uint64_t v4 = a1[13];
  uint64_t v5 = a1[14];
  uint64_t v6 = a1[15];
  uint64_t v10 = v1;
  uint64_t v11 = v2;
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  uint64_t v14 = v5;
  uint64_t v15 = v6;
  uint64_t result = type metadata accessor for HierarchicalStateMachine.RootState(319, (uint64_t)&v10);
  if (v8 <= 0x3F)
  {
    uint64_t v18 = *(void *)(result - 8) + 64;
    uint64_t v19 = MEMORY[0x1E4FBAD80] + 64;
    uint64_t v10 = v1;
    uint64_t v11 = v2;
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    uint64_t v14 = v5;
    uint64_t v15 = v6;
    uint64_t result = type metadata accessor for HierarchicalStateMachine.MetaState(319, (uint64_t)&v10);
    if (v9 <= 0x3F)
    {
      uint64_t v20 = *(void *)(result - 8) + 64;
      return swift_initClassMetadata2();
    }
  }
  return result;
}

uint64_t type metadata accessor for HierarchicalStateMachine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine);
}

uint64_t method lookup function for HierarchicalStateMachine(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for HierarchicalStateMachine);
}

uint64_t dispatch thunk of HierarchicalStateMachine.__allocating_init(rootState:)()
{
  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_19D5B108C()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_19D5B1108(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  unint64_t v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    unint64_t v9 = v10 + v8;
  }
  uint64_t v14 = *(_DWORD *)(v6 + 80);
  if (v14 <= 7 && v9 <= 0x18 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
    {
      if (v7 <= 1)
      {
        if (v8 <= 3)
        {
          unsigned int v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v19 > 0xFFFE)
          {
            uint64_t v18 = 4;
          }
          else
          {
            BOOL v20 = v19 != 0;
            BOOL v13 = v19 >= 0xFF;
            uint64_t v18 = 2;
            if (!v13) {
              uint64_t v18 = v20;
            }
          }
        }
        else
        {
          uint64_t v18 = 1;
        }
        v8 += v18;
      }
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
    }
  }
  else
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  return a1;
}

uint64_t sub_19D5B1300(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 2, v3);
  if (!result)
  {
    uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(a1, v3);
  }
  return result;
}

void *sub_19D5B13C4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          uint64_t v9 = 4;
        }
        else
        {
          BOOL v11 = v10 != 0;
          BOOL v12 = v10 >= 0xFF;
          uint64_t v9 = 2;
          if (!v12) {
            uint64_t v9 = v11;
          }
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_19D5B1514(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 2, v5);
  int v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 84);
      size_t v11 = *(void *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          uint64_t v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        unsigned int v15 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v15 > 0xFFFE)
        {
          uint64_t v12 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v12 = 2;
          if (!v17) {
            uint64_t v12 = v16;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
      uint64_t v13 = v6 + 8;
      v14(a1, v5);
      unsigned int v10 = *(_DWORD *)(v13 + 76);
      size_t v11 = *(void *)(v13 + 56);
      if (v10 <= 1)
      {
        if (v11 > 3) {
          goto LABEL_5;
        }
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
  }
  return a1;
}

void *sub_19D5B16E4(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    unsigned int v7 = *(_DWORD *)(v6 + 84);
    size_t v8 = *(void *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        unsigned int v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          uint64_t v9 = 4;
        }
        else
        {
          BOOL v11 = v10 != 0;
          BOOL v12 = v10 >= 0xFF;
          uint64_t v9 = 2;
          if (!v12) {
            uint64_t v9 = v11;
          }
        }
      }
      else
      {
        uint64_t v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_19D5B1834(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unsigned int v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 2, v5);
  int v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = *(_DWORD *)(v6 + 84);
      size_t v11 = *(void *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          uint64_t v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        unsigned int v15 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v15 > 0xFFFE)
        {
          uint64_t v12 = 4;
        }
        else
        {
          BOOL v16 = v15 != 0;
          BOOL v17 = v15 >= 0xFF;
          uint64_t v12 = 2;
          if (!v17) {
            uint64_t v12 = v16;
          }
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      uint64_t v14 = *(void (**)(void *, uint64_t))(v6 + 8);
      uint64_t v13 = v6 + 8;
      v14(a1, v5);
      unsigned int v10 = *(_DWORD *)(v13 + 76);
      size_t v11 = *(void *)(v13 + 56);
      if (v10 <= 1)
      {
        if (v11 > 3) {
          goto LABEL_5;
        }
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
  }
  return a1;
}

uint64_t sub_19D5B1A04(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 2;
  uint64_t v7 = *(void *)(v4 + 64);
  if (v5 <= 1)
  {
    unsigned int v6 = 0;
    if (v7 <= 3)
    {
      unsigned int v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        uint64_t v8 = 4;
      }
      else
      {
        BOOL v10 = v9 != 0;
        BOOL v11 = v9 >= 0xFF;
        uint64_t v8 = 2;
        if (!v11) {
          uint64_t v8 = v10;
        }
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
    v7 += v8;
  }
  if (!a2) {
    return 0;
  }
  int v12 = a2 - v6;
  if (a2 <= v6) {
    goto LABEL_30;
  }
  char v13 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      int v14 = *(_DWORD *)((char *)a1 + v7);
      if (!v14) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      int v14 = *(unsigned __int16 *)((char *)a1 + v7);
      if (!*(unsigned __int16 *)((char *)a1 + v7)) {
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_30:
      if (v6)
      {
        unsigned int v19 = (*(uint64_t (**)(void))(v4 + 48))();
        if (v19 >= 3) {
          return v19 - 2;
        }
        else {
          return 0;
        }
      }
      return 0;
    }
  }
  int v14 = *((unsigned __int8 *)a1 + v7);
  if (!*((unsigned char *)a1 + v7)) {
    goto LABEL_30;
  }
LABEL_20:
  int v16 = (v14 - 1) << v13;
  if (v7 > 3) {
    int v16 = 0;
  }
  if (v7)
  {
    if (v7 <= 3) {
      int v17 = v7;
    }
    else {
      int v17 = 4;
    }
    switch(v17)
    {
      case 2:
        int v18 = *a1;
        break;
      case 3:
        int v18 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v18 = *(_DWORD *)a1;
        break;
      default:
        int v18 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v18 = 0;
  }
  return v6 + (v18 | v16) + 1;
}

void sub_19D5B1BF8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  unsigned int v8 = v7 - 2;
  size_t v9 = *(void *)(v6 + 64);
  if (v7 <= 1)
  {
    unsigned int v8 = 0;
    if (v9 <= 3)
    {
      unsigned int v11 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v11 > 0xFFFE)
      {
        uint64_t v10 = 4;
      }
      else
      {
        BOOL v12 = v11 != 0;
        BOOL v13 = v11 >= 0xFF;
        uint64_t v10 = 2;
        if (!v13) {
          uint64_t v10 = v12;
        }
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    v9 += v10;
  }
  BOOL v13 = a3 >= v8;
  unsigned int v14 = a3 - v8;
  if (v14 != 0 && v13)
  {
    if (v9 <= 3)
    {
      unsigned int v18 = ((v14 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v18))
      {
        int v15 = 4;
      }
      else if (v18 >= 0x100)
      {
        int v15 = 2;
      }
      else
      {
        int v15 = v18 > 1;
      }
    }
    else
    {
      int v15 = 1;
    }
  }
  else
  {
    int v15 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v16 = ~v8 + a2;
    if (v9 < 4)
    {
      int v17 = (v16 >> (8 * v9)) + 1;
      if (v9)
      {
        int v19 = v16 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if (v9 == 3)
        {
          *(_WORD *)a1 = v19;
          a1[2] = BYTE2(v19);
        }
        else if (v9 == 2)
        {
          *(_WORD *)a1 = v19;
        }
        else
        {
          *a1 = v19;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v16;
      int v17 = 1;
    }
    switch(v15)
    {
      case 1:
        a1[v9] = v17;
        return;
      case 2:
        *(_WORD *)&a1[v9] = v17;
        return;
      case 3:
        goto LABEL_43;
      case 4:
        *(_DWORD *)&a1[v9] = v17;
        return;
      default:
        return;
    }
  }
  switch(v15)
  {
    case 1:
      a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 2:
      *(_WORD *)&a1[v9] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_30;
    case 3:
LABEL_43:
      __break(1u);
      JUMPOUT(0x19D5B1E7CLL);
    case 4:
      *(_DWORD *)&a1[v9] = 0;
      goto LABEL_29;
    default:
LABEL_29:
      if (a2)
      {
LABEL_30:
        BOOL v20 = *(void (**)(void))(v6 + 56);
        v20();
      }
      return;
  }
}

uint64_t sub_19D5B1EA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8) + 48))(a1, 2);
}

uint64_t sub_19D5B1ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8) + 56))(a1, a2, 2);
}

uint64_t sub_19D5B1F04(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_19D5B1F10(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = v2[2];
  uint64_t v7 = v2[3];
  uint64_t v8 = v2[4];
  size_t v9 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v9;
  *size_t v9 = v3;
  v9[1] = sub_19D5990F4;
  return sub_19D5AE494(a1, a2, v6, v7, v8);
}

uint64_t sub_19D5B1FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (uint64_t *)v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_19D5990F4;
  return sub_19D5AF314(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_19D5B209C(uint64_t a1, uint64_t a2)
{
  unsigned int v5 = *(int **)(v2 + 64);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_19D5990F4;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  uint64_t v7 = (void *)swift_task_alloc();
  v6[2] = v7;
  void *v7 = v6;
  v7[1] = sub_19D5990F4;
  return v9(a2);
}

uint64_t sub_19D5B21C0(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (uint64_t *)v2[2];
  uint64_t v7 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v8 = v2[5];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v10;
  *uint64_t v10 = v3;
  v10[1] = sub_19D5990F4;
  return sub_19D5AF60C(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_19D5B2288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  v7[5] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  v7[10] = swift_task_alloc();
  v7[11] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5B2338, a4, 0);
}

uint64_t sub_19D5B2338()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, v2, v4);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(v1, 0, 1, v4);
  swift_beginAccess();
  uint64_t v6 = *(void *)(v0 + 48);
  if (*(void *)(*(void *)(v3 + 120) + 24)) {
    goto LABEL_5;
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v6 = *(void *)(v0 + 48);
  if (*(unsigned char *)(v6 + 112))
  {
LABEL_5:
    uint64_t v7 = *(void *)(v0 + 88);
    sub_19D5B0B90();
    uint64_t v8 = swift_task_alloc();
    *(void *)(v0 + 96) = v8;
    *(void *)(v8 + 16) = v6;
    *(void *)(v8 + 24) = v7;
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v9;
    *uint64_t v9 = v0;
    v9[1] = sub_19D5B2630;
    return MEMORY[0x1F41880D8]();
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v10 = *(void *)(v0 + 88);
    *(unsigned char *)(v6 + 112) = 1;
    sub_19D5B3290(v10, v11);
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v4);
    uint64_t v13 = *(void *)(v0 + 80);
    if (v12 == 1)
    {
      sub_19D5B3234(*(void *)(v0 + 80), &qword_1E9445338);
    }
    else
    {
      sub_19D6033D8();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v13, v4);
    }
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 112) = v14;
    *(void *)uint64_t v14 = v0;
    *(void *)(v14 + 8) = sub_19D5B2810;
    uint64_t v16 = *(void *)(v0 + 40);
    uint64_t v15 = *(void *)(v0 + 48);
    long long v17 = *(_OWORD *)(v0 + 64);
    *(void *)(v14 + 56) = v15;
    *(_OWORD *)(v14 + 40) = v17;
    *(void *)(v14 + 32) = v16;
    return MEMORY[0x1F4188298](sub_19D5B2C08, v15, 0);
  }
}

uint64_t sub_19D5B2630()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5B275C, v1, 0);
}

uint64_t sub_19D5B275C()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = sub_19D5B2810;
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  long long v4 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + 56) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(void *)(v1 + 32) = v3;
  return MEMORY[0x1F4188298](sub_19D5B2C08, v2, 0);
}

uint64_t sub_19D5B2810()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 48);
  if (v0) {
    long long v4 = sub_19D5B29CC;
  }
  else {
    long long v4 = sub_19D5B293C;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_19D5B293C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  sub_19D5BCFFC();
  sub_19D5B3234(v1, &qword_1E9445338);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_19D5B29CC()
{
  uint64_t v1 = *(void *)(v0 + 88);
  sub_19D5BCFFC();
  sub_19D5B3234(v1, &qword_1E9445338);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_19D5B2A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_19D603438();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_19D603428();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_19D5B3234(a1, &qword_1E94443B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19D6033C8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_19D5B2BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return MEMORY[0x1F4188298](sub_19D5B2C08, v3, 0);
}

uint64_t sub_19D5B2C08()
{
  uint64_t v9 = v0;
  if (qword_1E9444350 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 56);
  long long v7 = *(_OWORD *)(v0 + 40);
  sub_19D603758();
  sub_19D5BDFF0(&v8, v1);
  *(void *)(v0 + 24) = *(void *)(v0 + 16);
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 64) = v2;
  *(_OWORD *)(v2 + 16) = v7;
  unint64_t v3 = sub_19D5B0B90();
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19D5B2D98;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v11 = 120;
  uint64_t v12 = MEMORY[0x1E4FBC848] + 8;
  return MEMORY[0x1F41881B8](v5, v0 + 24, &unk_1E9445350, v2, v1, v3, 0xD000000000000023, 0x800000019D60BAC0);
}

uint64_t sub_19D5B2D98()
{
  uint64_t v2 = (void *)*v1;
  v2[10] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[7];
    return MEMORY[0x1F4188298](sub_19D5B2F00, v3, 0);
  }
  else
  {
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_19D5B2F00()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19D5B2F18(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_19D594A94;
  return v6(a1);
}

uint64_t sub_19D5B2FF4()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_19D5B30EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  void *v13 = v2;
  v13[1] = sub_19D5990F4;
  return sub_19D5B2288(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_19D5B322C(uint64_t a1)
{
  return sub_19D5BC9C4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_19D5B3234(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_19D5B3290(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_19D5B32F8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_19D594A94;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D594A94;
  return v8(a1);
}

uint64_t sub_19D5B341C(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_19D594A94;
  return sub_19D5AC2D4(a1, a2, v7, v6);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_19D5B3520(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_19D5990F4;
  return sub_19D5AAC1C(a1, a2, v7, v6);
}

uint64_t sub_19D5B35E8()
{
  uint64_t v0 = sub_19D603268();
  sub_19D603268();
  return v0;
}

uint64_t HierarchicalStateMachine.HandlerDelegate.enqueue(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  MEMORY[0x1F4188790](a1, a2, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v3);
  sub_19D6033B8();
  return sub_19D603398();
}

uint64_t HierarchicalStateMachine.HandlerDelegate.enqueue(delegating:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 32);
  MEMORY[0x1F4188790](a1, a2, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v3);
  sub_19D6033B8();
  return sub_19D603398();
}

uint64_t sub_19D5B37C8(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 56);
}

uint64_t sub_19D5B37D0(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 48);
}

uint64_t sub_19D5B37E4()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *sub_19D5B3820(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_19D5B3858(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_19D5B38B8(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for HierarchicalStateMachine.HandlerDelegate(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.HandlerDelegate);
}

uint64_t sub_19D5B3910()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t v2 = *(void *)(result - 8) + 64;
    uint64_t v6 = v2;
    uint64_t result = swift_checkMetadataState();
    if (v3 <= 0x3F)
    {
      swift_getTupleTypeLayout3();
      uint64_t v7 = &v5;
      swift_getTupleTypeLayout3();
      uint64_t v8 = &v4;
      uint64_t v9 = v2;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

void *sub_19D5B3A18(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  unint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = *(void *)(*(void *)(a3 + 24) - 8);
  unint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v7 + v9;
  uint64_t v11 = *(void *)(v8 + 64);
  uint64_t v12 = *(_DWORD *)(v6 + 80);
  if (((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7 <= v7) {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v13 = ((v11 + v12 + ((v7 + v9) & ~v9)) & ~v12) + v7;
  }
  if ((v12 | v9) > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || (unint64_t)(v13 + 1) > 0x18)
  {
    uint64_t v16 = *(void *)a2;
    *uint64_t v4 = *(void *)a2;
    uint64_t v4 = (void *)(v16 + (((v12 | v9) + 16) & ~(v12 | v9)));
    swift_retain();
  }
  else
  {
    unsigned int v18 = a2[v13];
    unsigned int v19 = v18 - 4;
    if (v18 >= 4)
    {
      if (v13 <= 3) {
        uint64_t v20 = v13;
      }
      else {
        uint64_t v20 = 4;
      }
      switch(v20)
      {
        case 1:
          int v21 = *a2;
          goto LABEL_23;
        case 2:
          int v21 = *(unsigned __int16 *)a2;
          goto LABEL_23;
        case 3:
          int v21 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_23;
        case 4:
          int v21 = *(_DWORD *)a2;
LABEL_23:
          int v22 = (v21 | (v19 << (8 * v13))) + 4;
          unsigned int v18 = v21 + 4;
          if (v13 < 4) {
            unsigned int v18 = v22;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v23 = ~v9;
    switch(v18)
    {
      case 1u:
        long long v24 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16);
        uint64_t v26 = *(void *)(a3 + 16);
        v24(a1, a2, v5);
        (*(void (**)(void))(v8 + 16))();
        v24((void *)(((((unint64_t)v4 + v10) & v23) + v11 + v12) & ~v12), (unsigned __int8 *)((((unint64_t)&a2[v10] & v23) + v11 + v12) & ~v12), v26);
        *((unsigned char *)v4 + v13) = 1;
        break;
      case 2u:
        uint64_t v25 = *(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16);
        uint64_t v27 = *(void *)(a3 + 16);
        v25(a1, a2, v5);
        (*(void (**)(void))(v8 + 16))();
        v25((void *)(((((unint64_t)v4 + v10) & v23) + v11 + v12) & ~v12), (unsigned __int8 *)((((unint64_t)&a2[v10] & v23) + v11 + v12) & ~v12), v27);
        *((unsigned char *)v4 + v13) = 2;
        break;
      case 3u:
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        *((unsigned char *)v4 + v13) = 3;
        break;
      default:
        (*(void (**)(void *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        *((unsigned char *)v4 + v13) = 0;
        break;
    }
  }
  return v4;
}

uint64_t sub_19D5B3D80(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(v3 - 8);
  unint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = *(void *)(v4 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = v6 + v8;
  uint64_t v10 = (v6 + v8) & ~v8;
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v5 + 80);
  if (((v11 + v12 + v10) & ~v12) + v6 > v6) {
    v6 += (v11 + v12 + v10) & ~v12;
  }
  unsigned int v13 = a1[v6];
  unsigned int v14 = v13 - 4;
  if (v13 >= 4)
  {
    if (v6 <= 3) {
      uint64_t v15 = v6;
    }
    else {
      uint64_t v15 = 4;
    }
    switch(v15)
    {
      case 1:
        int v16 = *a1;
        goto LABEL_12;
      case 2:
        int v16 = *(unsigned __int16 *)a1;
        goto LABEL_12;
      case 3:
        int v16 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_12;
      case 4:
        int v16 = *(_DWORD *)a1;
LABEL_12:
        int v17 = (v16 | (v14 << (8 * v6))) + 4;
        unsigned int v13 = v16 + 4;
        if (v6 < 4) {
          unsigned int v13 = v17;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v18 = ~v8;
  switch(v13)
  {
    case 1u:
    case 2u:
      uint64_t v23 = *(void (**)(unsigned __int8 *, uint64_t))(v5 + 8);
      v23(a1, v3);
      unint64_t v21 = (unint64_t)&v2[v9] & v18;
      (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v21, v4);
      a1 = (unsigned __int8 *)((v21 + v11 + v12) & ~v12);
      uint64_t v20 = v3;
      unsigned int v19 = (uint64_t (*)(unsigned __int8 *, uint64_t))v23;
      break;
    default:
      unsigned int v19 = *(uint64_t (**)(unsigned __int8 *, uint64_t))(v5 + 8);
      uint64_t v20 = *(void *)(a2 + 16);
      break;
  }
  return v19(a1, v20);
}

uint64_t sub_19D5B3FC0(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v5 - 8);
  unint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = (v8 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
  if (((v13 + v14 + v12) & ~v14) + v8 <= v8) {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v15 = ((v13 + v14 + v12) & ~v14) + v8;
  }
  unsigned int v16 = a2[v15];
  unsigned int v17 = v16 - 4;
  if (v16 >= 4)
  {
    if (v15 <= 3) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = 4;
    }
    switch(v18)
    {
      case 1:
        int v19 = *a2;
        goto LABEL_13;
      case 2:
        int v19 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v19 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v19 = *(_DWORD *)a2;
LABEL_13:
        int v20 = (v19 | (v17 << (8 * v15))) + 4;
        unsigned int v16 = v19 + 4;
        if (v15 < 4) {
          unsigned int v16 = v20;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v21 = ~v10;
  uint64_t v22 = ~v14;
  switch(v16)
  {
    case 1u:
      long long v24 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 16);
      uint64_t v29 = *(void *)(a3 + 24);
      uint64_t v31 = *(void *)(*(void *)(v6 - 8) + 64);
      uint64_t v33 = *(void *)(a3 + 16);
      v24(a1, a2, v5);
      unint64_t v25 = (unint64_t)&a2[v11] & v21;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16))((v11 + a1) & v21, v25, v29);
      v24((((v11 + a1) & v21) + v31 + v14) & v22, (unsigned __int8 *)((v25 + v31 + v14) & v22), v33);
      char v23 = 1;
      break;
    case 2u:
      uint64_t v26 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 16);
      uint64_t v30 = *(void *)(a3 + 24);
      uint64_t v32 = *(void *)(*(void *)(v6 - 8) + 64);
      uint64_t v34 = *(void *)(a3 + 16);
      v26(a1, a2, v5);
      unint64_t v27 = (unint64_t)&a2[v11] & v21;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 16))((v11 + a1) & v21, v27, v30);
      v26((((v11 + a1) & v21) + v32 + v14) & v22, (unsigned __int8 *)((v27 + v32 + v14) & v22), v34);
      char v23 = 2;
      break;
    case 3u:
      (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v5);
      char v23 = 3;
      break;
    default:
      (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 16))(a1, a2, v5);
      char v23 = 0;
      break;
  }
  *(unsigned char *)(a1 + v15) = v23;
  return a1;
}

unsigned __int8 *sub_19D5B42D4(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v45 = *(void *)(a3 + 24);
    uint64_t v8 = *(void *)(v45 - 8);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v10 = v7 + v9;
    uint64_t v11 = (v7 + v9) & ~v9;
    uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v44 = *(void *)(v8 + 64);
    if (((v44 + v12 + v11) & ~v12) + v7 <= v7) {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    else {
      uint64_t v13 = ((v44 + v12 + v11) & ~v12) + v7;
    }
    unsigned int v14 = a1[v13];
    unsigned int v15 = v14 - 4;
    if (v14 >= 4)
    {
      if (v13 <= 3) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a1;
          goto LABEL_14;
        case 2:
          int v17 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v17 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v17 = *(_DWORD *)a1;
LABEL_14:
          int v18 = (v17 | (v15 << (8 * v13))) + 4;
          unsigned int v14 = v17 + 4;
          if (v13 < 4) {
            unsigned int v14 = v18;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v42 = ~v9;
    uint64_t v43 = ~v12;
    switch(v14)
    {
      case 1u:
        int v19 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
        v19(a1, v5);
        uint64_t v40 = v10;
        unint64_t v20 = (unint64_t)&a1[v10] & v42;
        (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v20, v45);
        unint64_t v21 = v20 + v44 + v12;
        uint64_t v10 = v40;
        v19((unsigned __int8 *)(v21 & v43), v5);
        break;
      case 2u:
        uint64_t v22 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
        v22(a1, v5);
        uint64_t v41 = v10;
        unint64_t v23 = (unint64_t)&a1[v10] & v42;
        (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v23, v45);
        unint64_t v24 = v23 + v44 + v12;
        uint64_t v10 = v41;
        v22((unsigned __int8 *)(v24 & v43), v5);
        break;
      default:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        break;
    }
    unsigned int v25 = a2[v13];
    unsigned int v26 = v25 - 4;
    if (v25 >= 4)
    {
      if (v13 <= 3) {
        uint64_t v27 = v13;
      }
      else {
        uint64_t v27 = 4;
      }
      switch(v27)
      {
        case 1:
          int v28 = *a2;
          goto LABEL_29;
        case 2:
          int v28 = *(unsigned __int16 *)a2;
          goto LABEL_29;
        case 3:
          int v28 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_29;
        case 4:
          int v28 = *(_DWORD *)a2;
LABEL_29:
          int v29 = (v28 | (v26 << (8 * v13))) + 4;
          unsigned int v25 = v28 + 4;
          if (v13 < 4) {
            unsigned int v25 = v29;
          }
          break;
        default:
          break;
      }
    }
    switch(v25)
    {
      case 1u:
        uint64_t v31 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
        v31(a1, a2, v5);
        uint64_t v32 = v10;
        unint64_t v33 = (unint64_t)&a1[v10] & v42;
        unint64_t v34 = (unint64_t)&a2[v32] & v42;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(v33, v34, v45);
        v31((unsigned __int8 *)((v33 + v44 + v12) & v43), (unsigned __int8 *)((v34 + v44 + v12) & v43), v5);
        char v30 = 1;
        break;
      case 2u:
        uint64_t v35 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
        v35(a1, a2, v5);
        uint64_t v36 = v10;
        unint64_t v37 = (unint64_t)&a1[v10] & v42;
        unint64_t v38 = (unint64_t)&a2[v36] & v42;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(v37, v38, v45);
        v35((unsigned __int8 *)((v37 + v44 + v12) & v43), (unsigned __int8 *)((v38 + v44 + v12) & v43), v5);
        char v30 = 2;
        break;
      case 3u:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        char v30 = 3;
        break;
      default:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16))(a1, a2, v5);
        char v30 = 0;
        break;
    }
    a1[v13] = v30;
  }
  return a1;
}

uint64_t sub_19D5B47B8(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(a3 + 24);
  uint64_t v7 = *(void *)(v5 - 8);
  unint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = v8 + v10;
  uint64_t v12 = (v8 + v10) & ~v10;
  uint64_t v13 = *(void *)(v9 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v7 + 80);
  if (((v13 + v14 + v12) & ~v14) + v8 <= v8) {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  }
  else {
    uint64_t v15 = ((v13 + v14 + v12) & ~v14) + v8;
  }
  unsigned int v16 = a2[v15];
  unsigned int v17 = v16 - 4;
  if (v16 >= 4)
  {
    if (v15 <= 3) {
      uint64_t v18 = v15;
    }
    else {
      uint64_t v18 = 4;
    }
    switch(v18)
    {
      case 1:
        int v19 = *a2;
        goto LABEL_13;
      case 2:
        int v19 = *(unsigned __int16 *)a2;
        goto LABEL_13;
      case 3:
        int v19 = *(unsigned __int16 *)a2 | (a2[2] << 16);
        goto LABEL_13;
      case 4:
        int v19 = *(_DWORD *)a2;
LABEL_13:
        int v20 = (v19 | (v17 << (8 * v15))) + 4;
        unsigned int v16 = v19 + 4;
        if (v15 < 4) {
          unsigned int v16 = v20;
        }
        break;
      default:
        break;
    }
  }
  uint64_t v21 = ~v10;
  uint64_t v22 = ~v14;
  switch(v16)
  {
    case 1u:
      unint64_t v24 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 32);
      uint64_t v29 = *(void *)(a3 + 24);
      uint64_t v31 = *(void *)(*(void *)(v6 - 8) + 64);
      uint64_t v33 = *(void *)(a3 + 16);
      v24(a1, a2, v5);
      unint64_t v25 = (unint64_t)&a2[v11] & v21;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))((v11 + a1) & v21, v25, v29);
      v24((((v11 + a1) & v21) + v31 + v14) & v22, (unsigned __int8 *)((v25 + v31 + v14) & v22), v33);
      char v23 = 1;
      break;
    case 2u:
      unsigned int v26 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 32);
      uint64_t v30 = *(void *)(a3 + 24);
      uint64_t v32 = *(void *)(*(void *)(v6 - 8) + 64);
      uint64_t v34 = *(void *)(a3 + 16);
      v26(a1, a2, v5);
      unint64_t v27 = (unint64_t)&a2[v11] & v21;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v9 + 32))((v11 + a1) & v21, v27, v30);
      v26((((v11 + a1) & v21) + v32 + v14) & v22, (unsigned __int8 *)((v27 + v32 + v14) & v22), v34);
      char v23 = 2;
      break;
    case 3u:
      (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v5);
      char v23 = 3;
      break;
    default:
      (*(void (**)(uint64_t, unsigned __int8 *, uint64_t))(v7 + 32))(a1, a2, v5);
      char v23 = 0;
      break;
  }
  *(unsigned char *)(a1 + v15) = v23;
  return a1;
}

unsigned __int8 *sub_19D5B4ACC(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    unint64_t v7 = *(void *)(v6 + 64);
    uint64_t v45 = *(void *)(a3 + 24);
    uint64_t v8 = *(void *)(v45 - 8);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v10 = v7 + v9;
    uint64_t v11 = (v7 + v9) & ~v9;
    uint64_t v12 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v44 = *(void *)(v8 + 64);
    if (((v44 + v12 + v11) & ~v12) + v7 <= v7) {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
    }
    else {
      uint64_t v13 = ((v44 + v12 + v11) & ~v12) + v7;
    }
    unsigned int v14 = a1[v13];
    unsigned int v15 = v14 - 4;
    if (v14 >= 4)
    {
      if (v13 <= 3) {
        uint64_t v16 = v13;
      }
      else {
        uint64_t v16 = 4;
      }
      switch(v16)
      {
        case 1:
          int v17 = *a1;
          goto LABEL_14;
        case 2:
          int v17 = *(unsigned __int16 *)a1;
          goto LABEL_14;
        case 3:
          int v17 = *(unsigned __int16 *)a1 | (a1[2] << 16);
          goto LABEL_14;
        case 4:
          int v17 = *(_DWORD *)a1;
LABEL_14:
          int v18 = (v17 | (v15 << (8 * v13))) + 4;
          unsigned int v14 = v17 + 4;
          if (v13 < 4) {
            unsigned int v14 = v18;
          }
          break;
        default:
          break;
      }
    }
    uint64_t v42 = ~v9;
    uint64_t v43 = ~v12;
    switch(v14)
    {
      case 1u:
        int v19 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
        v19(a1, v5);
        uint64_t v40 = v10;
        unint64_t v20 = (unint64_t)&a1[v10] & v42;
        (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v20, v45);
        unint64_t v21 = v20 + v44 + v12;
        uint64_t v10 = v40;
        v19((unsigned __int8 *)(v21 & v43), v5);
        break;
      case 2u:
        uint64_t v22 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
        v22(a1, v5);
        uint64_t v41 = v10;
        unint64_t v23 = (unint64_t)&a1[v10] & v42;
        (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v23, v45);
        unint64_t v24 = v23 + v44 + v12;
        uint64_t v10 = v41;
        v22((unsigned __int8 *)(v24 & v43), v5);
        break;
      default:
        (*(void (**)(unsigned __int8 *, uint64_t))(v6 + 8))(a1, v5);
        break;
    }
    unsigned int v25 = a2[v13];
    unsigned int v26 = v25 - 4;
    if (v25 >= 4)
    {
      if (v13 <= 3) {
        uint64_t v27 = v13;
      }
      else {
        uint64_t v27 = 4;
      }
      switch(v27)
      {
        case 1:
          int v28 = *a2;
          goto LABEL_29;
        case 2:
          int v28 = *(unsigned __int16 *)a2;
          goto LABEL_29;
        case 3:
          int v28 = *(unsigned __int16 *)a2 | (a2[2] << 16);
          goto LABEL_29;
        case 4:
          int v28 = *(_DWORD *)a2;
LABEL_29:
          int v29 = (v28 | (v26 << (8 * v13))) + 4;
          unsigned int v25 = v28 + 4;
          if (v13 < 4) {
            unsigned int v25 = v29;
          }
          break;
        default:
          break;
      }
    }
    switch(v25)
    {
      case 1u:
        uint64_t v31 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
        v31(a1, a2, v5);
        uint64_t v32 = v10;
        unint64_t v33 = (unint64_t)&a1[v10] & v42;
        unint64_t v34 = (unint64_t)&a2[v32] & v42;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))(v33, v34, v45);
        v31((unsigned __int8 *)((v33 + v44 + v12) & v43), (unsigned __int8 *)((v34 + v44 + v12) & v43), v5);
        char v30 = 1;
        break;
      case 2u:
        uint64_t v35 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
        v35(a1, a2, v5);
        uint64_t v36 = v10;
        unint64_t v37 = (unint64_t)&a1[v10] & v42;
        unint64_t v38 = (unint64_t)&a2[v36] & v42;
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))(v37, v38, v45);
        v35((unsigned __int8 *)((v37 + v44 + v12) & v43), (unsigned __int8 *)((v38 + v44 + v12) & v43), v5);
        char v30 = 2;
        break;
      case 3u:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        char v30 = 3;
        break;
      default:
        (*(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32))(a1, a2, v5);
        char v30 = 0;
        break;
    }
    a1[v13] = v30;
  }
  return a1;
}

uint64_t sub_19D5B4FB0(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  if (((((v3 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
     + v3 <= v3)
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  else {
    uint64_t v4 = ((((v3 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
  }
         + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64)
         + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 16) - 8) + 80))
       + v3;
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_23;
  }
  uint64_t v5 = v4 + 1;
  char v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    unsigned int v9 = ((a2 + ~(-1 << v6) - 252) >> v6) + 1;
    if (HIWORD(v9))
    {
      int v7 = *(_DWORD *)((char *)a1 + v5);
      if (!v7) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 > 0xFF)
    {
      int v7 = *(unsigned __int16 *)((char *)a1 + v5);
      if (!*(unsigned __int16 *)((char *)a1 + v5)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v9 < 2)
    {
LABEL_23:
      unsigned int v11 = *((unsigned __int8 *)a1 + v4);
      if (v11 >= 4) {
        return (v11 ^ 0xFF) + 1;
      }
      else {
        return 0;
      }
    }
  }
  int v7 = *((unsigned __int8 *)a1 + v5);
  if (!*((unsigned char *)a1 + v5)) {
    goto LABEL_23;
  }
LABEL_15:
  int v10 = (v7 - 1) << v6;
  if (v5 > 3) {
    int v10 = 0;
  }
  if (v5)
  {
    if (v5 > 3) {
      LODWORD(v5) = 4;
    }
    switch((int)v5)
    {
      case 2:
        LODWORD(v5) = *a1;
        break;
      case 3:
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v5) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v5) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return (v5 | v10) + 253;
}

void sub_19D5B516C(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  unint64_t v6 = ((((v5 + *(unsigned __int8 *)(*(void *)(*(void *)(a4 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a4 + 24) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a4 + 24) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a4 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a4 + 16) - 8) + 80))
     + v5;
  if (v6 <= v5) {
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  }
  size_t v7 = v6 + 1;
  if (a3 < 0xFD)
  {
    int v8 = 0;
  }
  else if (v7 <= 3)
  {
    unsigned int v11 = ((a3 + ~(-1 << (8 * v7)) - 252) >> (8 * v7)) + 1;
    if (HIWORD(v11))
    {
      int v8 = 4;
    }
    else if (v11 >= 0x100)
    {
      int v8 = 2;
    }
    else
    {
      int v8 = v11 > 1;
    }
  }
  else
  {
    int v8 = 1;
  }
  if (a2 > 0xFC)
  {
    unsigned int v9 = a2 - 253;
    if (v7 < 4)
    {
      int v10 = (v9 >> (8 * v7)) + 1;
      if (v6 != -1)
      {
        int v12 = v9 & ~(-1 << (8 * v7));
        bzero(a1, v7);
        if (v7 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }
        else if (v7 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v6 + 1);
      *(_DWORD *)a1 = v9;
      int v10 = 1;
    }
    switch(v8)
    {
      case 1:
        a1[v7] = v10;
        break;
      case 2:
        *(_WORD *)&a1[v7] = v10;
        break;
      case 3:
LABEL_34:
        __break(1u);
        JUMPOUT(0x19D5B53BCLL);
      case 4:
        *(_DWORD *)&a1[v7] = v10;
        break;
      default:
        return;
    }
  }
  else
  {
    switch(v8)
    {
      case 1:
        a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      case 2:
        *(_WORD *)&a1[v7] = 0;
        goto LABEL_22;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v7] = 0;
        if (!a2) {
          return;
        }
        goto LABEL_23;
      default:
LABEL_22:
        if (a2) {
LABEL_23:
        }
          a1[v6] = -(char)a2;
        break;
    }
  }
}

uint64_t sub_19D5B53E4(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  if (((((v2 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80))
       + *(void *)(*(void *)(*(void *)(a2 + 24) - 8) + 64)
       + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80))
     + v2 <= v2)
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8) + 64);
  else {
    uint64_t v3 = ((((v2 + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 24) - 8) + 80))
  }
         + *(void *)(*(void *)(*(void *)(a2 + 24) - 8) + 64)
         + *(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a2 + 16) - 8) + 80))
       + v2;
  uint64_t v4 = a1[v3];
  int v5 = v4 - 4;
  if (v4 >= 4)
  {
    if (v3 <= 3) {
      uint64_t v6 = v3;
    }
    else {
      uint64_t v6 = 4;
    }
    switch(v6)
    {
      case 1:
        int v7 = *a1;
        goto LABEL_13;
      case 2:
        int v7 = *(unsigned __int16 *)a1;
        goto LABEL_13;
      case 3:
        int v7 = *(unsigned __int16 *)a1 | (a1[2] << 16);
        goto LABEL_13;
      case 4:
        int v7 = *(_DWORD *)a1;
LABEL_13:
        unsigned int v8 = (v7 | (v5 << (8 * v3))) + 4;
        LODWORD(v4) = v7 + 4;
        if (v3 >= 4) {
          uint64_t v4 = v4;
        }
        else {
          uint64_t v4 = v8;
        }
        break;
      default:
        return v4;
    }
  }
  return v4;
}

void sub_19D5B5524(unsigned char *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8);
  if (a2 > 3)
  {
    uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
    size_t v8 = *(void *)(v4 + 64);
    size_t v9 = ((((v8 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
         + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64)
         + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + v8;
    if (v9 <= v8) {
      size_t v10 = *(void *)(v4 + 64);
    }
    else {
      size_t v10 = v9;
    }
    unsigned int v11 = a2 - 4;
    if (v10 < 4)
    {
      unsigned int v12 = v11 >> (8 * v10);
      int v13 = v11 & ~(-1 << (8 * v10));
      a1[v10] = v12 + 4;
      bzero(a1, v10);
      if (v10 == 3)
      {
        *(_WORD *)a1 = v13;
        a1[2] = BYTE2(v13);
      }
      else if (v10 == 2)
      {
        *(_WORD *)a1 = v13;
      }
      else
      {
        *a1 = v13;
      }
    }
    else
    {
      a1[v10] = 4;
      bzero(a1, v10);
      *(_DWORD *)a1 = v11;
    }
  }
  else
  {
    unint64_t v6 = *(void *)(v5 + 64);
    unint64_t v7 = ((((v6 + *(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(*(void *)(a3 + 24) - 8) + 80))
         + *(void *)(*(void *)(*(void *)(a3 + 24) - 8) + 64)
         + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + v6;
    if (v7 <= v6) {
      unint64_t v7 = v6;
    }
    a1[v7] = a2;
  }
}

uint64_t type metadata accessor for HierarchicalStateMachine.StateTransition(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F41865E0](a1, a2, &nominal type descriptor for HierarchicalStateMachine.StateTransition);
}

ValueMetadata *type metadata accessor for StateMachine()
{
  return &type metadata for StateMachine;
}

uint64_t dispatch thunk of StateMachine.StateValue.stateLabel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_19D5B5720()
{
  qword_1E9445478 = 0x746C7561666544;
  unk_1E9445480 = 0xE700000000000000;
}

uint64_t static Flow.defaultLogCategory.getter()
{
  if (qword_1E9444328 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_1E9445478;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_19D5B57AC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445540);
  swift_allocObject();
  uint64_t result = sub_19D603748();
  qword_1E9445488 = result;
  return result;
}

uint64_t static Flow.$flow.getter()
{
  return sub_19D5B5BC0(&qword_1E9444330);
}

uint64_t static Flow.flow.getter()
{
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  sub_19D603758();
  return v1;
}

uint64_t sub_19D5B588C()
{
  if (qword_1E9444328 != -1) {
    swift_once();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445538);
  swift_allocObject();
  swift_bridgeObjectRetain();
  uint64_t result = sub_19D603748();
  qword_1E9445490 = result;
  return result;
}

uint64_t static Flow.$category.getter()
{
  return sub_19D5B5BC0(&qword_1E9444338);
}

uint64_t static Flow.category.getter()
{
  return sub_19D5B5A18(&qword_1E9444338);
}

uint64_t sub_19D5B596C()
{
  sub_19D6032A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445538);
  swift_allocObject();
  uint64_t result = sub_19D603748();
  qword_1E9445498 = result;
  return result;
}

uint64_t static Flow.$subsystem.getter()
{
  return sub_19D5B5BC0(&qword_1E9444340);
}

uint64_t static Flow.subsystem.getter()
{
  return sub_19D5B5A18(&qword_1E9444340);
}

uint64_t sub_19D5B5A18(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  sub_19D603758();
  return v2;
}

uint64_t sub_19D5B5A68()
{
  uint64_t v0 = sub_19D603258();
  MEMORY[0x1F4188790](v0 - 8, v1, v2);
  if (qword_1E9444340 != -1) {
    swift_once();
  }
  sub_19D603758();
  if (qword_1E9444338 != -1) {
    swift_once();
  }
  sub_19D603758();
  sub_19D603248();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445530);
  swift_allocObject();
  uint64_t result = sub_19D603748();
  qword_1E94454A0 = result;
  return result;
}

uint64_t static Flow.$logger.getter()
{
  return sub_19D5B5BC0(&qword_1E9444348);
}

uint64_t sub_19D5B5BC0(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t static Flow.logger.getter()
{
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  return sub_19D603758();
}

uint64_t static Flow.log(_:)(uint64_t a1, uint64_t a2)
{
  return sub_19D5B5CB4(a1, a2, MEMORY[0x1E4FBD390]);
}

uint64_t static Flow.info(_:)(uint64_t a1, uint64_t a2)
{
  return sub_19D5B5CB4(a1, a2, MEMORY[0x1E4FBD370]);
}

uint64_t static Flow.debug(_:)(uint64_t a1, uint64_t a2)
{
  return sub_19D5B5CB4(a1, a2, MEMORY[0x1E4FBD378]);
}

uint64_t sub_19D5B5CB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v24 = a3;
  uint64_t v25 = sub_19D603258();
  uint64_t v3 = *(void *)(v25 - 8);
  MEMORY[0x1F4188790](v25, v4, v5);
  unint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_19D603208();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10, v11);
  int v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = 0x203A776F6C465BLL;
  unint64_t v28 = 0xE700000000000000;
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  sub_19D603758();
  id v14 = v26;
  if (v26)
  {
    id v15 = objc_msgSend(v26, sel_UUID);

    sub_19D6031F8();
    sub_19D6031E8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  sub_19D6032B8();
  sub_19D6032B8();
  uint64_t v17 = v27;
  unint64_t v16 = v28;
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  sub_19D603758();
  swift_bridgeObjectRetain();
  int v18 = sub_19D603238();
  os_log_type_t v19 = v24();
  if (os_log_type_enabled(v18, v19))
  {
    unint64_t v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v27 = v21;
    *(_DWORD *)unint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    id v26 = (id)sub_19D5B86E8(v17, v16, &v27);
    sub_19D603528();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19D57B000, v18, v19, "%s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A8FE0](v21, -1, -1);
    MEMORY[0x19F3A8FE0](v20, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v25);
}

uint64_t static Flow.withNewFlow<A>(_:_:)()
{
  id v0 = _s12HMFoundation4FlowO03newB0ySo7HMFFlowCSSFZ_0();
  uint64_t v1 = sub_19D6032A8();
  uint64_t v3 = v2;
  uint64_t v4 = qword_1E9444328;
  id v5 = v0;
  if (v4 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  static Flow.with<A>(_:subsystem:category:_:)((uint64_t)v0, v1, v3);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t static Flow.with<A>(_:subsystem:category:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if (qword_1E9444330 != -1) {
    a1 = swift_once();
  }
  v5[1] = v5;
  _OWORD v5[3] = v3;
  MEMORY[0x1F4188790](a1, a2, a3);
  return sub_19D603778();
}

uint64_t static Flow.withNewFlow<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  _OWORD v6[3] = a2;
  return MEMORY[0x1F4188298](sub_19D5B62E0, 0, 0);
}

uint64_t sub_19D5B62E0()
{
  uint64_t v1 = *(void *)(v0 + 56);
  long long v15 = *(_OWORD *)(v0 + 40);
  id v2 = _s12HMFoundation4FlowO03newB0ySo7HMFFlowCSSFZ_0();
  *(void *)(v0 + 64) = v2;
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  *(void *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v15;
  uint64_t v4 = sub_19D6032A8();
  uint64_t v6 = v5;
  *(void *)(v0 + 80) = v5;
  uint64_t v7 = qword_1E9444328;
  id v8 = v2;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1E9445478;
  uint64_t v9 = unk_1E9445480;
  *(void *)(v0 + 88) = unk_1E9445480;
  swift_bridgeObjectRetain();
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v11;
  *uint64_t v11 = v0;
  v11[1] = sub_19D5B6470;
  uint64_t v12 = *(void *)(v0 + 56);
  uint64_t v13 = *(void *)(v0 + 16);
  v11[10] = v3;
  v11[11] = v12;
  v11[8] = v9;
  v11[9] = &unk_1E94454B8;
  v11[6] = v6;
  v11[7] = v10;
  v11[4] = v8;
  v11[5] = v4;
  v11[3] = v13;
  return MEMORY[0x1F4188298](sub_19D5B66D0, 0, 0);
}

uint64_t sub_19D5B6470()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 104) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_19D5B6610;
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    uint64_t v3 = sub_19D5B65AC;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_19D5B65AC()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5B6610()
{
  uint64_t v1 = *(void **)(v0 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t static Flow.with<A>(_:subsystem:category:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a8;
  v8[11] = v10;
  v8[8] = a6;
  v8[9] = a7;
  v8[6] = a4;
  void v8[7] = a5;
  v8[4] = a2;
  v8[5] = a3;
  _OWORD v8[3] = a1;
  return MEMORY[0x1F4188298](sub_19D5B66D0, 0, 0);
}

uint64_t sub_19D5B66D0()
{
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  *(void *)(v0 + 16) = *(void *)(v0 + 32);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  long long v7 = *(_OWORD *)(v0 + 72);
  *(void *)(v6 + 16) = v1;
  *(void *)(v6 + 24) = v3;
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v5;
  *(void *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 56) = v7;
  id v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v8;
  *id v8 = v0;
  v8[1] = sub_19D5B6840;
  uint64_t v9 = *(void *)(v0 + 24);
  return MEMORY[0x1F41881B8](v9, v0 + 16, &unk_1E94454D0, v6, 0, 0, 0xD000000000000017, 0x800000019D60BB20);
}

uint64_t sub_19D5B6840()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 112) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19D5B6990, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_19D5B6990()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static Flow.withChildFlow<A>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v48 = a3;
  uint64_t v49 = a4;
  uint64_t v41 = a1;
  uint64_t v42 = a2;
  uint64_t v50 = a6;
  uint64_t v7 = sub_19D603258();
  uint64_t v45 = *(void *)(v7 - 8);
  uint64_t v46 = v7;
  MEMORY[0x1F4188790](v7, v8, v9);
  uint64_t v44 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_19D603208();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1F4188790](v11, v13, v14);
  uint64_t v16 = (char *)&v41 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  sub_19D603758();
  id v17 = (id)v52[0];
  uint64_t v51 = a5;
  if (!v52[0]) {
    id v17 = objc_msgSend(self, sel_untrackedPlaceholderFlow, v41, v42);
  }
  id v18 = objc_msgSend(self, sel_internalOnlyInitializer);
  v52[0] = 0;
  v52[1] = 0xE000000000000000;
  sub_19D603568();
  swift_bridgeObjectRelease();
  strcpy((char *)v52, "[ChildFlow: ");
  BYTE5(v52[1]) = 0;
  HIWORD(v52[1]) = -5120;
  id v43 = v18;
  id v19 = objc_msgSend(v18, sel_UUID);
  sub_19D6031F8();

  sub_19D5B96E0();
  sub_19D603678();
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  unint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v16, v11);
  sub_19D6032B8();
  id v47 = v17;
  id v21 = objc_msgSend(v17, sel_UUID);
  sub_19D6031F8();

  sub_19D603678();
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  v20(v16, v11);
  sub_19D6032B8();
  sub_19D6032B8();
  uint64_t v23 = v52[0];
  unint64_t v22 = v52[1];
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  unint64_t v24 = v44;
  sub_19D603758();
  swift_bridgeObjectRetain();
  uint64_t v25 = sub_19D603238();
  os_log_type_t v26 = sub_19D6034E8();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    v52[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    swift_bridgeObjectRetain();
    v52[3] = sub_19D5B86E8(v23, v22, v52);
    sub_19D603528();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19D57B000, v25, v26, "%s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A8FE0](v28, -1, -1);
    MEMORY[0x19F3A8FE0](v27, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v29 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v24, v46);
  uint64_t v30 = v51;
  MEMORY[0x1F4188790](v29, v31, v32);
  uint64_t v33 = v48;
  *(&v41 - 4) = v30;
  *(&v41 - 3) = v33;
  *(&v41 - 2) = v49;
  uint64_t v34 = sub_19D6032A8();
  uint64_t v36 = v35;
  uint64_t v37 = qword_1E9444328;
  uint64_t v38 = (uint64_t)v43;
  id v39 = v43;
  if (v37 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  static Flow.with<A>(_:subsystem:category:_:)(v38, v34, v36);

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id static Flow.flowOrUntracked.getter()
{
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  sub_19D603758();
  id result = v2;
  if (!v2)
  {
    id v1 = objc_msgSend(self, sel_untrackedPlaceholderFlow);
    return v1;
  }
  return result;
}

uint64_t static Flow.withChildFlow<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = sub_19D603258();
  v6[10] = v7;
  v6[11] = *(void *)(v7 - 8);
  v6[12] = swift_task_alloc();
  uint64_t v8 = sub_19D603208();
  v6[13] = v8;
  v6[14] = *(void *)(v8 - 8);
  v6[15] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5B710C, 0, 0);
}

uint64_t sub_19D5B710C()
{
  uint64_t v36 = v0;
  id v1 = (id *)(v0 + 16);
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  sub_19D603758();
  id v2 = *v1;
  if (!*v1) {
    id v2 = objc_msgSend(self, sel_untrackedPlaceholderFlow);
  }
  *(void *)(v0 + 128) = v2;
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 104);
  id v6 = objc_msgSend(self, sel_internalOnlyInitializer);
  *(void *)(v0 + 136) = v6;
  sub_19D603568();
  swift_bridgeObjectRelease();
  strcpy((char *)v35, "[ChildFlow: ");
  BYTE5(v35[1]) = 0;
  HIWORD(v35[1]) = -5120;
  id v7 = objc_msgSend(v6, sel_UUID);
  sub_19D6031F8();

  sub_19D5B96E0();
  sub_19D603678();
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v8(v4, v5);
  sub_19D6032B8();
  id v9 = objc_msgSend(v2, sel_UUID);
  sub_19D6031F8();

  sub_19D603678();
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  v8(v4, v5);
  sub_19D6032B8();
  sub_19D6032B8();
  uint64_t v11 = v35[0];
  unint64_t v10 = v35[1];
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  sub_19D603758();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_19D603238();
  os_log_type_t v13 = sub_19D6034E8();
  BOOL v14 = os_log_type_enabled(v12, v13);
  uint64_t v16 = *(void *)(v0 + 88);
  uint64_t v15 = *(void *)(v0 + 96);
  uint64_t v17 = *(void *)(v0 + 80);
  if (v14)
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = v15;
    uint64_t v19 = swift_slowAlloc();
    v35[0] = v19;
    *(_DWORD *)id v18 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 24) = sub_19D5B86E8(v11, v10, v35);
    sub_19D603528();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19D57B000, v12, v13, "%s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A8FE0](v19, -1, -1);
    MEMORY[0x19F3A8FE0](v18, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v34, v17);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  uint64_t v20 = *(void *)(v0 + 72);
  uint64_t v21 = swift_task_alloc();
  *(void *)(v0 + 144) = v21;
  long long v22 = *(_OWORD *)(v0 + 56);
  *(void *)(v21 + 16) = v20;
  *(_OWORD *)(v21 + 24) = v22;
  uint64_t v23 = sub_19D6032A8();
  uint64_t v25 = v24;
  *(void *)(v0 + 152) = v24;
  uint64_t v26 = qword_1E9444328;
  id v27 = v6;
  if (v26 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_1E9445478;
  uint64_t v28 = unk_1E9445480;
  *(void *)(v0 + 160) = unk_1E9445480;
  swift_bridgeObjectRetain();
  uint64_t v30 = (void *)swift_task_alloc();
  *(void *)(v0 + 168) = v30;
  *uint64_t v30 = v0;
  v30[1] = sub_19D5B7618;
  uint64_t v31 = *(void *)(v0 + 72);
  uint64_t v32 = *(void *)(v0 + 32);
  v30[10] = v21;
  v30[11] = v31;
  v30[8] = v28;
  v30[9] = &unk_1E94454F0;
  v30[6] = v25;
  v30[7] = v29;
  v30[4] = v27;
  v30[5] = v23;
  v30[3] = v32;
  return MEMORY[0x1F4188298](sub_19D5B66D0, 0, 0);
}

uint64_t sub_19D5B7618()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_19D5B77DC;
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 136);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    uint64_t v3 = sub_19D5B7754;
  }
  return MEMORY[0x1F4188298](v3, 0, 0);
}

uint64_t sub_19D5B7754()
{
  id v1 = *(void **)(v0 + 128);

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_19D5B77DC()
{
  id v1 = (void *)v0[17];
  uint64_t v2 = (void *)v0[16];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_19D5B7888(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_19D5990F4;
  return v6(a1);
}

uint64_t sub_19D5B7964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1E9444338 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x1F4188790](a1, a2, a3);
  return sub_19D603778();
}

uint64_t sub_19D5B7A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1E9444340 != -1) {
    a1 = swift_once();
  }
  MEMORY[0x1F4188790](a1, a2, a3);
  return sub_19D603778();
}

uint64_t sub_19D5B7BA0@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  v16[0] = a2;
  v16[1] = a4;
  uint64_t v6 = sub_19D603258();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8, v9);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  if (qword_1E9444340 != -1) {
    swift_once();
  }
  sub_19D603758();
  swift_bridgeObjectRetain();
  uint64_t v12 = sub_19D603248();
  MEMORY[0x1F4188790](v12, v13, v14);
  v16[-4] = a3;
  v16[-3] = a1;
  v16[-2] = v16[0];
  sub_19D603778();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
}

uint64_t sub_19D5B7DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  void v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  return MEMORY[0x1F4188298](sub_19D5B7DD8, 0, 0);
}

uint64_t sub_19D5B7DD8()
{
  if (qword_1E9444338 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  *(void *)(v0 + 16) = v5;
  *(void *)(v0 + 24) = v4;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v0 + 96) = v6;
  long long v7 = *(_OWORD *)(v0 + 72);
  *(void *)(v6 + 16) = v1;
  *(void *)(v6 + 24) = v3;
  *(void *)(v6 + 32) = v2;
  *(void *)(v6 + 40) = v5;
  *(void *)(v6 + 48) = v4;
  *(_OWORD *)(v6 + 56) = v7;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_19D5B6840;
  uint64_t v9 = *(void *)(v0 + 32);
  return MEMORY[0x1F41881B8](v9, v0 + 16, &unk_1E9445500, v6, 0, 0, 0xD000000000000017, 0x800000019D60BB20);
}

uint64_t sub_19D5B7F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[6] = a3;
  void v8[7] = a4;
  v8[4] = a1;
  v8[5] = a2;
  return MEMORY[0x1F4188298](sub_19D5B7F74, 0, 0);
}

uint64_t sub_19D5B7F74()
{
  if (qword_1E9444340 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  *(void *)(v0 + 16) = *(void *)(v0 + 40);
  *(void *)(v0 + 24) = v3;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v0 + 96) = v5;
  long long v6 = *(_OWORD *)(v0 + 64);
  *(void *)(v5 + 16) = v1;
  *(void *)(v5 + 24) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(void *)(v5 + 48) = v2;
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  void *v7 = v0;
  v7[1] = sub_19D5B80D8;
  uint64_t v8 = *(void *)(v0 + 32);
  return MEMORY[0x1F41881B8](v8, v0 + 16, &unk_1E9445510, v5, 0, 0, 0xD000000000000017, 0x800000019D60BB20);
}

uint64_t sub_19D5B80D8()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 112) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19D5B9C20, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_19D5B8228(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[8] = a5;
  v6[9] = a6;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = sub_19D603258();
  v6[10] = v7;
  v6[11] = *(void *)(v7 - 8);
  v6[12] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5B82F0, 0, 0);
}

uint64_t sub_19D5B82F0()
{
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  if (qword_1E9444340 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void *)(v0 + 72);
  long long v7 = *(_OWORD *)(v0 + 56);
  sub_19D603758();
  swift_bridgeObjectRetain();
  sub_19D603248();
  uint64_t v2 = swift_task_alloc();
  *(void *)(v0 + 104) = v2;
  *(void *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v7;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_19D5B84C0;
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 32);
  return MEMORY[0x1F41881B8](v5, v4, &unk_1E9445520, v2, 0, 0, 0xD000000000000017, 0x800000019D60BB20);
}

uint64_t sub_19D5B84C0()
{
  uint64_t v2 = *(void *)(*v1 + 96);
  uint64_t v3 = *(void *)(*v1 + 88);
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *v1;
  *(void *)(v5 + 120) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x1F4188298](sub_19D5B8684, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    long long v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
}

uint64_t sub_19D5B8684()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5B86E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_19D5B87BC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_19D5B9BC0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_19D5B9BC0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_19D5B87BC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_19D603538();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_19D5B8978(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_19D603598();
  if (!v8)
  {
    sub_19D6035F8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_19D603658();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_19D5B8978(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_19D5B8A10(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_19D5B8BF0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_19D5B8BF0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_19D5B8A10(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_19D5B8B88(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_19D603578();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_19D6035F8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_19D6032C8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_19D603658();
    __break(1u);
LABEL_14:
    uint64_t result = sub_19D6035F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_19D5B8B88(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445528);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_19D5B8BF0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445528);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_19D603658();
  __break(1u);
  return result;
}

uint64_t _s12HMFoundation4FlowO5erroryySSFZ_0()
{
  uint64_t v20 = sub_19D603258();
  uint64_t v0 = *(void *)(v20 - 8);
  MEMORY[0x1F4188790](v20, v1, v2);
  unint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_19D603208();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7, v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = 0x203A776F6C465BLL;
  unint64_t v23 = 0xE700000000000000;
  if (qword_1E9444330 != -1) {
    swift_once();
  }
  sub_19D603758();
  id v11 = v21;
  if (v21)
  {
    id v12 = objc_msgSend(v21, sel_UUID);

    sub_19D6031F8();
    sub_19D6031E8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  sub_19D6032B8();
  sub_19D6032B8();
  uint64_t v14 = v22;
  unint64_t v13 = v23;
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  sub_19D603758();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_19D603238();
  os_log_type_t v16 = sub_19D6034F8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v22 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    id v21 = (id)sub_19D5B86E8(v14, v13, &v22);
    sub_19D603528();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19D57B000, v15, v16, "%s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A8FE0](v18, -1, -1);
    MEMORY[0x19F3A8FE0](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v0 + 8))(v4, v20);
}

id _s12HMFoundation4FlowO03newB0ySo7HMFFlowCSSFZ_0()
{
  uint64_t v22 = sub_19D603258();
  uint64_t v0 = *(void *)(v22 - 8);
  MEMORY[0x1F4188790](v22, v1, v2);
  unint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_19D603208();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5, v7, v8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = objc_msgSend(self, sel_internalOnlyInitializer);
  uint64_t v24 = 0;
  unint64_t v25 = 0xE000000000000000;
  sub_19D603568();
  swift_bridgeObjectRelease();
  uint64_t v24 = 0x776F6C4677654E5BLL;
  unint64_t v25 = 0xEA0000000000203ALL;
  id v21 = v11;
  id v12 = objc_msgSend(v11, sel_UUID);
  sub_19D6031F8();

  sub_19D6031E8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  sub_19D6032B8();
  swift_bridgeObjectRelease();
  sub_19D6032B8();
  sub_19D6032B8();
  uint64_t v14 = v24;
  unint64_t v13 = v25;
  if (qword_1E9444348 != -1) {
    swift_once();
  }
  sub_19D603758();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_19D603238();
  os_log_type_t v16 = sub_19D6034E8();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v24 = v18;
    *(_DWORD *)uint64_t v17 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_19D5B86E8(v14, v13, &v24);
    sub_19D603528();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_19D57B000, v15, v16, "%s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x19F3A8FE0](v18, -1, -1);
    MEMORY[0x19F3A8FE0](v17, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v0 + 8))(v4, v22);
  return v21;
}

uint64_t sub_19D5B9480()
{
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_19D5B94A8()
{
  return sub_19D5B9B6C((uint64_t (*)(void, void, void, void, void, void, void))sub_19D5B7964);
}

uint64_t sub_19D5B94D4(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D594A94;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D594A94;
  return v8(a1);
}

uint64_t sub_19D5B95F8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  long long v10 = *(_OWORD *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 64);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v7;
  *(void *)uint64_t v7 = v2;
  *(void *)(v7 + 8) = sub_19D5990F4;
  *(void *)(v7 + 80) = v6;
  *(void *)(v7 + 88) = v4;
  *(_OWORD *)(v7 + 64) = v8;
  *(void *)(v7 + 56) = v5;
  *(_OWORD *)(v7 + 40) = v10;
  *(void *)(v7 + 32) = a1;
  return MEMORY[0x1F4188298](sub_19D5B7DD8, 0, 0);
}

unint64_t sub_19D5B96E0()
{
  unint64_t result = qword_1E94454D8;
  if (!qword_1E94454D8)
  {
    sub_19D603208();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E94454D8);
  }
  return result;
}

uint64_t sub_19D5B9738(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  long long v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D5990F4;
  return v8(a1);
}

ValueMetadata *type metadata accessor for Flow()
{
  return &type metadata for Flow;
}

uint64_t sub_19D5B986C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  long long v10 = *(_OWORD *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = *(void *)(v1 + 64);
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v7;
  *(void *)uint64_t v7 = v2;
  *(void *)(v7 + 8) = sub_19D5990F4;
  *(void *)(v7 + 80) = v6;
  *(void *)(v7 + 88) = v4;
  *(_OWORD *)(v7 + 64) = v8;
  *(void *)(v7 + 56) = v5;
  *(_OWORD *)(v7 + 40) = v10;
  *(void *)(v7 + 32) = a1;
  return MEMORY[0x1F4188298](sub_19D5B7F74, 0, 0);
}

uint64_t sub_19D5B9954(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_19D5990F4;
  return sub_19D5B8228(a1, v5, v6, v7, v8, v4);
}

uint64_t sub_19D5B9A1C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  uint64_t v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *uint64_t v6 = v5;
  v6[1] = sub_19D5990F4;
  return v8(a1);
}

uint64_t sub_19D5B9B40()
{
  return sub_19D5B9B6C((uint64_t (*)(void, void, void, void, void, void, void))sub_19D5B7A84);
}

uint64_t sub_19D5B9B6C(uint64_t (*a1)(void, void, void, void, void, void, void))
{
  return a1(v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[2]);
}

uint64_t sub_19D5B9B9C@<X0>(uint64_t a1@<X8>)
{
  return sub_19D5B7BA0(v1[5], v1[6], v1[2], a1);
}

uint64_t sub_19D5B9BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_19D5B9C24()
{
  return sub_19D5B9480();
}

BOOL static HMF.NetworkInterfaceType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HMF.NetworkInterfaceType.hash(into:)()
{
  return sub_19D603718();
}

uint64_t HMF.NetworkInterfaceType.hashValue.getter()
{
  return sub_19D603728();
}

BOOL sub_19D5B9CC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_19D5B9CD8()
{
  return sub_19D603728();
}

uint64_t sub_19D5B9D20()
{
  return sub_19D603718();
}

uint64_t sub_19D5B9D4C()
{
  return sub_19D603728();
}

uint64_t HMF.WifiNetworkInfo.init(SSID:BSSID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t HMF.WifiNetworkInfo.SSID.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_19D5B9DD0(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t sub_19D5B9DD0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t HMF.WifiNetworkInfo.BSSID.getter()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_19D5B9DD0(v1, *(void *)(v0 + 24));
  return v1;
}

__n128 HMF.NetworkInfo.init(name:type:macAddress:ipv4Addresses:ipv6Addresses:wifiInfo:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  __n128 result = *(__n128 *)a8;
  long long v10 = *(_OWORD *)(a8 + 16);
  *(_OWORD *)(a9 + 56) = *(_OWORD *)a8;
  char v11 = *a3;
  *(void *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(unsigned char *)(a9 + 16) = v11;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(_OWORD *)(a9 + 72) = v10;
  return result;
}

uint64_t HMF.NetworkInfo.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void HMF.NetworkInfo.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t HMF.NetworkInfo.macAddress.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkInfo.ipv4Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkInfo.ipv6Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkInfo.wifiInfo.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = v1[7];
  unint64_t v3 = v1[8];
  uint64_t v4 = v1[9];
  unint64_t v5 = v1[10];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_19D5B9F10(v2, v3, v4, v5);
}

uint64_t sub_19D5B9F10(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_19D5B9DD0(result, a2);
    return sub_19D5B9DD0(a3, a4);
  }
  return result;
}

__n128 HMF.NetworkServiceInfo.init(isPrimary:interfaceName:confirmedInterfaceName:ipv4Addresses:routerIPv4:networkSignatureV4:ipv6Addresses:routerIPv6:networkSignatureV6:)@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, long long a10, long long a11, __n128 a12, uint64_t a13)
{
  __n128 result = a12;
  *(unsigned char *)a9 = a1;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = a4;
  *(void *)(a9 + 32) = a5;
  *(void *)(a9 + 40) = a6;
  *(void *)(a9 + 48) = a7;
  *(void *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(_OWORD *)(a9 + 80) = a11;
  *(__n128 *)(a9 + 96) = a12;
  *(void *)(a9 + 112) = a13;
  return result;
}

uint64_t HMF.NetworkServiceInfo.isPrimary.getter()
{
  return *v0;
}

uint64_t HMF.NetworkServiceInfo.interfaceName.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.confirmedInterfaceName.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.ipv4Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkServiceInfo.routerIPv4.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.networkSignatureV4.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.ipv6Addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HMF.NetworkServiceInfo.routerIPv6.getter()
{
  uint64_t v1 = *(void *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HMF.NetworkServiceInfo.networkSignatureV6.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_19D5BA0CC()
{
  unint64_t result = qword_1E9445548;
  if (!qword_1E9445548)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1E9445548);
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s20NetworkInterfaceTypeOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s20NetworkInterfaceTypeOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x19D5BA28CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_19D5BA2B4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_19D5BA2BC(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HMF.NetworkInterfaceType()
{
  return &type metadata for HMF.NetworkInterfaceType;
}

uint64_t _s15WifiNetworkInfoVwxx(uint64_t *a1)
{
  sub_19D5BA314(*a1, a1[1]);
  uint64_t v2 = a1[2];
  unint64_t v3 = a1[3];
  return sub_19D5BA314(v2, v3);
}

uint64_t sub_19D5BA314(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

uint64_t *_s15WifiNetworkInfoVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_19D5B9DD0(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  uint64_t v7 = a2[2];
  unint64_t v6 = a2[3];
  sub_19D5B9DD0(v7, v6);
  a1[2] = v7;
  a1[3] = v6;
  return a1;
}

uint64_t *_s15WifiNetworkInfoVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  sub_19D5B9DD0(*a2, v5);
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_19D5BA314(v6, v7);
  uint64_t v9 = a2[2];
  unint64_t v8 = a2[3];
  sub_19D5B9DD0(v9, v8);
  uint64_t v10 = a1[2];
  unint64_t v11 = a1[3];
  a1[2] = v9;
  a1[3] = v8;
  sub_19D5BA314(v10, v11);
  return a1;
}

uint64_t *_s15WifiNetworkInfoVwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_19D5BA314(v4, v5);
  uint64_t v6 = a1[2];
  unint64_t v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_19D5BA314(v6, v7);
  return a1;
}

uint64_t _s15WifiNetworkInfoVwet(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t _s15WifiNetworkInfoVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)uint64_t result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.WifiNetworkInfo()
{
  return &type metadata for HMF.WifiNetworkInfo;
}

uint64_t _s11NetworkInfoVwxx(uint64_t *a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  unint64_t v3 = a1[8];
  if (v3 >> 60 != 15)
  {
    sub_19D5BA314(a1[7], v3);
    uint64_t v4 = a1[9];
    unint64_t v5 = a1[10];
    return sub_19D5BA314(v4, v5);
  }
  return result;
}

uint64_t _s11NetworkInfoVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  unint64_t v7 = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7 >> 60 == 15)
  {
    long long v8 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v8;
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 56);
    sub_19D5B9DD0(v9, v7);
    *(void *)(a1 + 56) = v9;
    *(void *)(a1 + 64) = v7;
    uint64_t v11 = *(void *)(a2 + 72);
    unint64_t v10 = *(void *)(a2 + 80);
    sub_19D5B9DD0(v11, v10);
    *(void *)(a1 + 72) = v11;
    *(void *)(a1 + 80) = v10;
  }
  return a1;
}

uint64_t _s11NetworkInfoVwca(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 56);
  uint64_t v5 = (_OWORD *)(a2 + 56);
  unint64_t v6 = *(void *)(a2 + 64);
  if (*(void *)(a1 + 64) >> 60 == 15)
  {
    if (v6 >> 60 == 15)
    {
      long long v7 = *(_OWORD *)(a2 + 72);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 72) = v7;
    }
    else
    {
      uint64_t v9 = *(void *)(a2 + 56);
      sub_19D5B9DD0(v9, *(void *)(a2 + 64));
      *(void *)(a1 + 56) = v9;
      *(void *)(a1 + 64) = v6;
      uint64_t v11 = *(void *)(a2 + 72);
      unint64_t v10 = *(void *)(a2 + 80);
      sub_19D5B9DD0(v11, v10);
      *(void *)(a1 + 72) = v11;
      *(void *)(a1 + 80) = v10;
    }
  }
  else if (v6 >> 60 == 15)
  {
    sub_19D5BA7CC(a1 + 56);
    long long v8 = *(_OWORD *)(a2 + 72);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 72) = v8;
  }
  else
  {
    uint64_t v12 = *(void *)(a2 + 56);
    sub_19D5B9DD0(v12, *(void *)(a2 + 64));
    uint64_t v13 = *(void *)(a1 + 56);
    unint64_t v14 = *(void *)(a1 + 64);
    *(void *)(a1 + 56) = v12;
    *(void *)(a1 + 64) = v6;
    sub_19D5BA314(v13, v14);
    uint64_t v16 = *(void *)(a2 + 72);
    unint64_t v15 = *(void *)(a2 + 80);
    sub_19D5B9DD0(v16, v15);
    uint64_t v17 = *(void *)(a1 + 72);
    unint64_t v18 = *(void *)(a1 + 80);
    *(void *)(a1 + 72) = v16;
    *(void *)(a1 + 80) = v15;
    sub_19D5BA314(v17, v18);
  }
  return a1;
}

uint64_t sub_19D5BA7CC(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s11NetworkInfoVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(a1 + 64);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = *(void *)(a2 + 64);
    if (v7 >> 60 != 15)
    {
      uint64_t v9 = *(void *)(a1 + 56);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v7;
      sub_19D5BA314(v9, v6);
      uint64_t v10 = *(void *)(a1 + 72);
      unint64_t v11 = *(void *)(a1 + 80);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
      sub_19D5BA314(v10, v11);
      return a1;
    }
    sub_19D5BA7CC(a1 + 56);
  }
  long long v8 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = v8;
  return a1;
}

uint64_t _s11NetworkInfoVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s11NetworkInfoVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 88) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.NetworkInfo()
{
  return &type metadata for HMF.NetworkInfo;
}

uint64_t _s18NetworkServiceInfoVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s18NetworkServiceInfoVwcp(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  uint64_t v8 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v8;
  uint64_t v9 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s18NetworkServiceInfoVwca(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[6];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t _s18NetworkServiceInfoVwta(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18NetworkServiceInfoVwet(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 120)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s18NetworkServiceInfoVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 120) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 120) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for HMF.NetworkServiceInfo()
{
  return &type metadata for HMF.NetworkServiceInfo;
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.currentValue.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 24) + **(int **)(a3 + 24));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_19D5990F4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.start(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 32) + **(int **)(a3 + 32));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_19D594A94;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.invalidate()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 40) + **(int **)(a2 + 40));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D594A94;
  return v7(a1, a2);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.enqueue(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 48) + **(int **)(a3 + 48));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_19D5990F4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.enqueueAndWait(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(a3 + 56) + **(int **)(a3 + 56));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  void *v7 = v3;
  v7[1] = sub_19D5990F4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of StateMachine.EngineProtocol.runToCompletion()(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))(*(void *)(a2 + 64) + **(int **)(a2 + 64));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  return v7(a1, a2);
}

uint64_t AsyncSerialQueue.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = *(void *)sub_19D603218();
  *(void *)(v0 + 128) = sub_19D5B0070;
  *(void *)(v0 + 136) = 0;
  swift_retain();
  return v0;
}

uint64_t sub_19D5BB3D8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455E8);
  swift_allocObject();
  uint64_t result = sub_19D603748();
  qword_1E9445580 = result;
  return result;
}

uint64_t AsyncSerialQueue.init()()
{
  swift_defaultActor_initialize();
  *(unsigned char *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = *(void *)sub_19D603218();
  *(void *)(v0 + 128) = sub_19D5B0070;
  *(void *)(v0 + 136) = 0;
  swift_retain();
  return v0;
}

uint64_t sub_19D5BB47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  v5[12] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5BB518, v4, 0);
}

uint64_t sub_19D5BB518()
{
  if (qword_1E9444350 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[11];
  sub_19D603758();
  LOBYTE(v1) = sub_19D5BCBAC(v1, v0[6]);
  swift_bridgeObjectRelease();
  if (v1)
  {
    (*(void (**)(unint64_t (*)(), void, const char *, uint64_t, uint64_t, uint64_t))(v0[11] + 128))(sub_19D5BCC78, 0, "HMFoundation/AsyncSerialQueue.swift", 35, 2, 114);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  }
  uint64_t v2 = v0[12];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[13] = (uint64_t)v4;
  *uint64_t v4 = v0;
  v4[1] = sub_19D5BB6B8;
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[10];
  uint64_t v8 = v0[7];
  uint64_t v9 = v0[8];
  return sub_19D5BC298(v8, v5, v9, v6, v7);
}

uint64_t sub_19D5BB6B8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 96);
  uint64_t v3 = *(void **)v1;
  v3[14] = v0;
  swift_task_dealloc();
  sub_19D5B3234(v2, &qword_1E9445338);
  if (v0)
  {
    uint64_t v4 = v3[11];
    return MEMORY[0x1F4188298](sub_19D5BB824, v4, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v3[1];
    return v5();
  }
}

uint64_t sub_19D5BB824()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5BB888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  return MEMORY[0x1F4188298](sub_19D5BB8AC, v3, 0);
}

uint64_t sub_19D5BB8AC()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v1 = *(void *)(v0 + 48);
  *(void *)(v0 + 16) = 0;
  sub_19D5B0B90();
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  long long v4 = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = v0 + 16;
  *(void *)(v3 + 32) = v1;
  *(_OWORD *)(v3 + 40) = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_19D5BB9C8;
  return MEMORY[0x1F41880D8]();
}

uint64_t sub_19D5BB9C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5BBAF4, v1, 0);
}

uint64_t sub_19D5BBAF4()
{
  uint64_t result = *(void *)(v0 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  __break(1u);
  return result;
}

uint64_t sub_19D5BBB18(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v29 = a4;
  uint64_t v30 = a6;
  uint64_t v31 = a2;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x1F4188790](v9, v12, v13);
  unint64_t v14 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94443B8);
  MEMORY[0x1F4188790](v15 - 8, v16, v17);
  uint64_t v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v20 = sub_19D603438();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v21 = sub_19D5B0B90();
  unint64_t v22 = (*(unsigned __int8 *)(v10 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v23 = (v11 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v24 = (char *)swift_allocObject();
  *((void *)v24 + 2) = a3;
  *((void *)v24 + 3) = v21;
  *((void *)v24 + 4) = v30;
  *((void *)v24 + 5) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v24[v22], v14, v9);
  unint64_t v25 = &v24[v23];
  *(void *)unint64_t v25 = v29;
  *((void *)v25 + 1) = a5;
  swift_retain_n();
  swift_retain();
  uint64_t v26 = sub_19D5BC114((uint64_t)v19, (uint64_t)&unk_1E94455E0, (uint64_t)v24);
  *uint64_t v31 = v26;
  return swift_release();
}

uint64_t sub_19D5BBD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[6] = a7;
  void v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[2] = a1;
  _OWORD v8[3] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  v8[8] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5BBE1C, a4, 0);
}

uint64_t sub_19D5BBE1C()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = v0[4];
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56))(v1, 0, 1, v3);
  uint64_t v5 = (void *)swift_task_alloc();
  v0[9] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_19D5BBF44;
  uint64_t v7 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[6];
  uint64_t v10 = v0[2];
  return sub_19D5BC298(v10, v6, v8, v9, v7);
}

uint64_t sub_19D5BBF44()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64);
  uint64_t v3 = *(void **)v1;
  v3[10] = v0;
  swift_task_dealloc();
  sub_19D5B3234(v2, &qword_1E9445338);
  if (v0)
  {
    uint64_t v4 = v3[3];
    return MEMORY[0x1F4188298](sub_19D5BC0B0, v4, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v3[1];
    return v5();
  }
}

uint64_t sub_19D5BC0B0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5BC114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_19D603438();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_19D603428();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_19D5B3234(a1, &qword_1E94443B8);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_19D6033C8();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_19D5BC298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[9] = a5;
  v6[10] = v5;
  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  v6[11] = swift_task_alloc();
  return MEMORY[0x1F4188298](sub_19D5BC334, v5, 0);
}

uint64_t sub_19D5BC334()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_beginAccess();
  uint64_t v2 = *(void *)(*(void *)(v1 + 120) + 24);
  uint64_t v3 = *(void *)(v0 + 80);
  if (v2) {
    goto LABEL_5;
  }
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v3 = *(void *)(v0 + 80);
  if (*(unsigned char *)(v3 + 112))
  {
LABEL_5:
    uint64_t v4 = *(void *)(v0 + 48);
    sub_19D5B0B90();
    uint64_t v5 = swift_task_alloc();
    *(void *)(v0 + 96) = v5;
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_19D5BC5DC;
    return MEMORY[0x1F41880D8]();
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 48);
    *(unsigned char *)(v3 + 112) = 1;
    sub_19D5B3290(v8, v7);
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
    uint64_t v10 = *(void *)(v9 - 8);
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9);
    uint64_t v12 = *(void *)(v0 + 88);
    if (v11 == 1)
    {
      sub_19D5B3234(*(void *)(v0 + 88), &qword_1E9445338);
    }
    else
    {
      sub_19D6033D8();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v9);
    }
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 112) = v13;
    *(void *)uint64_t v13 = v0;
    *(void *)(v13 + 8) = sub_19D5BC7C0;
    uint64_t v14 = *(void *)(v0 + 80);
    uint64_t v15 = *(void *)(v0 + 40);
    long long v16 = *(_OWORD *)(v0 + 56);
    *(void *)(v13 + 56) = *(void *)(v0 + 72);
    *(void *)(v13 + 64) = v14;
    *(_OWORD *)(v13 + 40) = v16;
    *(void *)(v13 + 32) = v15;
    return MEMORY[0x1F4188298](sub_19D5BCCF0, v14, 0);
  }
}

uint64_t sub_19D5BC5DC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  return MEMORY[0x1F4188298](sub_19D5BC708, v1, 0);
}

uint64_t sub_19D5BC708()
{
  uint64_t v1 = swift_task_alloc();
  *(void *)(v0 + 112) = v1;
  *(void *)uint64_t v1 = v0;
  *(void *)(v1 + 8) = sub_19D5BC7C0;
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 40);
  long long v4 = *(_OWORD *)(v0 + 56);
  *(void *)(v1 + 56) = *(void *)(v0 + 72);
  *(void *)(v1 + 64) = v2;
  *(_OWORD *)(v1 + 40) = v4;
  *(void *)(v1 + 32) = v3;
  return MEMORY[0x1F4188298](sub_19D5BCCF0, v2, 0);
}

uint64_t sub_19D5BC7C0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 120) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 80);
  if (v0) {
    long long v4 = sub_19D5BC958;
  }
  else {
    long long v4 = sub_19D5BC8EC;
  }
  return MEMORY[0x1F4188298](v4, v3, 0);
}

uint64_t sub_19D5BC8EC()
{
  sub_19D5BCFFC();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5BC958()
{
  sub_19D5BCFFC();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_19D5BC9C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  MEMORY[0x1F4188790](v6 - 8, v7, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  int v11 = (uint64_t *)(a2 + 120);
  swift_beginAccess();
  uint64_t result = *(void *)(a2 + 120);
  uint64_t v13 = *(void *)(result + 24);
  uint64_t v14 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
  }
  else
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v11;
    if (*(void *)(*v11 + 16) < v14 || (isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_19D5BD684(v14);
      uint64_t v16 = *v11;
    }
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
    uint64_t v18 = *(void *)(v17 - 8);
    sub_19D5BD964((void *)(v16 + 16), v16 + ((*(unsigned __int8 *)(v18 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80)), a1);
    swift_endAccess();
    sub_19D5B3290(a3, (uint64_t)v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v10, 1, v17) == 1)
    {
      return sub_19D5B3234((uint64_t)v10, &qword_1E9445338);
    }
    else
    {
      sub_19D6033D8();
      return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v10, v17);
    }
  }
  return result;
}

BOOL sub_19D5BCBAC(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v4 = sub_19D6036F8();
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1;
  }
  uint64_t v9 = ~v5;
  unint64_t v10 = (v6 + 1) & v9;
  if (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
    return 0;
  }
  do
  {
    uint64_t v11 = *(void *)(v8 + 8 * v10);
    BOOL result = v11 == a1;
    if (v11 == a1) {
      break;
    }
    unint64_t v10 = (v10 + 1) & v9;
  }
  while (((*(void *)(v7 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  return result;
}

unint64_t sub_19D5BCC78()
{
  return 0xD000000000000032;
}

uint64_t type metadata accessor for AsyncSerialQueue()
{
  return self;
}

uint64_t sub_19D5BCCB8(uint64_t a1)
{
  return sub_19D5BBB18(a1, *(uint64_t **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 16));
}

uint64_t sub_19D5BCCC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[7] = a4;
  v5[8] = v4;
  v5[5] = a2;
  v5[6] = a3;
  void v5[4] = a1;
  return MEMORY[0x1F4188298](sub_19D5BCCF0, v4, 0);
}

uint64_t sub_19D5BCCF0()
{
  uint64_t v11 = v0;
  if (qword_1E9444350 != -1) {
    swift_once();
  }
  uint64_t v2 = *(void *)(v0 + 56);
  uint64_t v1 = *(void *)(v0 + 64);
  long long v9 = *(_OWORD *)(v0 + 40);
  sub_19D603758();
  sub_19D5BDFF0(&v10, v1);
  *(void *)(v0 + 24) = *(void *)(v0 + 16);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  *(void *)(v3 + 16) = v2;
  *(_OWORD *)(v3 + 24) = v9;
  unint64_t v4 = sub_19D5B0B90();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_19D5BCE7C;
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v7 = *(void *)(v0 + 32);
  uint64_t v13 = 120;
  uint64_t v14 = v6;
  return MEMORY[0x1F41881B8](v7, v0 + 24, &unk_1E94455C8, v3, v1, v4, 0xD000000000000023, 0x800000019D60BAC0);
}

uint64_t sub_19D5BCE7C()
{
  uint64_t v2 = (void *)*v1;
  v2[11] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[8];
    return MEMORY[0x1F4188298](sub_19D5BCFE4, v3, 0);
  }
  else
  {
    unint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_19D5BCFE4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_19D5BCFFC()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445338);
  MEMORY[0x1F4188790](v2 - 8, v3, v4);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7, v9, v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = swift_task_isCurrentExecutor();
  if ((result & 1) == 0) {
    uint64_t result = swift_task_reportUnexpectedExecutor();
  }
  if (*(unsigned char *)(v0 + 112) != 1)
  {
    __break(1u);
    goto LABEL_18;
  }
  swift_beginAccess();
  if (*(uint64_t *)(*(void *)(v0 + 120) + 24) >= 1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      sub_19D5BE890();
    }
    uint64_t v14 = *(void **)(v0 + 120);
    uint64_t result = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v8 + 32))(v6, (unint64_t)v14+ ((*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v14[4], v7);
    uint64_t v15 = v14[4];
    BOOL v16 = __OFADD__(v15, 1);
    uint64_t v17 = v15 + 1;
    if (!v16)
    {
      uint64_t v18 = v14[3];
      if (v17 >= v14[2]) {
        uint64_t v17 = 0;
      }
      v14[4] = v17;
      if (!__OFSUB__(v18, 1))
      {
        uint64_t v19 = 0;
        v14[3] = v18 - 1;
        goto LABEL_13;
      }
LABEL_19:
      __break(1u);
      return result;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v19 = 1;
LABEL_13:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v19, 1, v7);
  swift_endAccess();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    uint64_t result = sub_19D5B3234((uint64_t)v6, &qword_1E9445338);
    *(unsigned char *)(v1 + 112) = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v12, v6, v7);
    sub_19D6033D8();
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }
  return result;
}

uint64_t AsyncSerialQueue.deinit()
{
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AsyncSerialQueue.__deallocating_deinit()
{
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return MEMORY[0x1F4188210](v0);
}

uint64_t AsyncSerialQueue.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_19D5BD30C()
{
  return v0;
}

uint64_t method lookup function for AsyncSerialQueue(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F4186708](a1, a2, &nominal type descriptor for AsyncSerialQueue);
}

uint64_t dispatch thunk of AsyncSerialQueue.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AsyncSerialQueue.performAndWait<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v4 + 176)
                                                                   + **(int **)(*(void *)v4 + 176));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_19D594A94;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AsyncSerialQueue.perform<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)v3 + 184)
                                                          + **(int **)(*(void *)v3 + 184));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_19D5BD588;
  return v10(a1, a2, a3);
}

uint64_t sub_19D5BD588(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

size_t sub_19D5BD684(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = (uint64_t *)(*v1 + 16);
  uint64_t v4 = *v3;
  if (*v3 >= a1)
  {
    uint64_t v16 = *(unsigned __int8 *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455B8);
    uint64_t v13 = swift_allocObject();
    long long v17 = *(_OWORD *)(v2 + 24);
    *(void *)(v13 + 16) = v4;
    *(_OWORD *)(v13 + 24) = v17;
    if ((uint64_t)v17 >= 1) {
      sub_19D5BDE0C(v13 + 16, v13 + ((v16 + 40) & ~v16), v3, v2 + ((v16 + 40) & ~v16));
    }
    goto LABEL_19;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v6 = *v1;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  sub_19D603228();
  if (isUniquelyReferenced_nonNull_native)
  {
    uint64_t v8 = *(void *)(v7 - 8);
    uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
    uint64_t v10 = *(void *)(v6 + 24);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455B8);
    uint64_t v11 = *(void *)(v8 + 72);
    uint64_t v12 = (v9 + 40) & ~v9;
    uint64_t v13 = swift_allocObject();
    size_t result = _swift_stdlib_malloc_size((const void *)v13);
    if (v11)
    {
      if (result - v12 != 0x8000000000000000 || v11 != -1)
      {
        *(void *)(v13 + 16) = (uint64_t)(result - v12) / v11;
        *(void *)(v13 + 24) = v10;
        *(void *)(v13 + 32) = 0;
        if (v10 >= 1)
        {
          swift_retain();
          sub_19D5BDA3C(v13 + 16, v13 + v12, (void *)(v6 + 16), v6 + v12);
          *(void *)(v6 + 24) = 0;
          swift_release();
        }
LABEL_19:
        size_t result = swift_release();
        *uint64_t v1 = v13;
        return result;
      }
      goto LABEL_22;
    }
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v18 = *(void *)(v7 - 8);
  uint64_t v19 = *(unsigned __int8 *)(v18 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455B8);
  uint64_t v20 = *(void *)(v18 + 72);
  uint64_t v21 = (v19 + 40) & ~v19;
  uint64_t v13 = swift_allocObject();
  size_t result = _swift_stdlib_malloc_size((const void *)v13);
  if (!v20) {
    goto LABEL_21;
  }
  if (result - v21 != 0x8000000000000000 || v20 != -1)
  {
    uint64_t v23 = *(void *)(v6 + 24);
    *(void *)(v13 + 16) = (uint64_t)(result - v21) / v20;
    *(void *)(v13 + 24) = v23;
    *(void *)(v13 + 32) = 0;
    if (v23 >= 1) {
      sub_19D5BDC24(v13 + 16, v13 + v21, (void *)(v6 + 16), v6 + v21);
    }
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
  return result;
}

void *sub_19D5BD964(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[1];
  uint64_t v4 = result[2];
  uint64_t v5 = v4 + v3;
  if (!__OFADD__(v4, v3))
  {
    uint64_t v8 = result;
    if ((v3 & 0x8000000000000000) == 0)
    {
      BOOL v9 = __OFSUB__(v5, *result);
      if (v5 < *result || (v5 -= *result, !v9))
      {
LABEL_9:
        uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
        size_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(a2 + *(void *)(*(void *)(v10 - 8) + 72) * v5, a3, v10);
        uint64_t v11 = v8[1];
        BOOL v9 = __OFADD__(v11, 1);
        uint64_t v12 = v11 + 1;
        if (!v9)
        {
          v8[1] = v12;
          return result;
        }
        goto LABEL_12;
      }
      __break(1u);
    }
    if (v5 < 0)
    {
      BOOL v9 = __OFADD__(v5, *result);
      v5 += *result;
      if (v9) {
        goto LABEL_13;
      }
    }
    goto LABEL_9;
  }
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

void sub_19D5BDA3C(uint64_t a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v4 = a3[2];
  uint64_t v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v8 = a3[1];
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8);
  if (v5 < v8)
  {
    uint64_t v10 = v8 - v5;
    if (!__OFSUB__(v8, v5))
    {
      uint64_t v11 = v5;
      unint64_t v12 = a4;
      goto LABEL_6;
    }
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  unint64_t v12 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = v8;
LABEL_6:
  BOOL v13 = v5 < v8;
  BOOL v14 = v10 != 0;
  BOOL v15 = v13 && v14;
  if (v13 && v14) {
    unint64_t v16 = v12;
  }
  else {
    unint64_t v16 = 0;
  }
  if (v13 && v14) {
    uint64_t v17 = v10;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v11 < 1)
  {
    uint64_t v11 = 0;
    goto LABEL_20;
  }
  if (!a4)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  unint64_t v18 = a4 + *(void *)(v9 + 72) * v4;
  if (v18 > a2
    || v18 + *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 72) * v11 <= a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v18 != a2)
  {
    swift_arrayInitWithTakeBackToFront();
  }
LABEL_20:
  if (!v15 || v17 <= 0) {
    return;
  }
  if (!v16)
  {
LABEL_34:
    __break(1u);
    return;
  }
  uint64_t v19 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 72);
  unint64_t v20 = a2 + v19 * v11;
  unint64_t v21 = v16 + v19 * v17;
  if (v20 < v16 || v20 >= v21)
  {
    swift_arrayInitWithTakeFrontToBack();
  }
  else if (v20 != v16)
  {
    swift_arrayInitWithTakeBackToFront();
  }
}

uint64_t sub_19D5BDC24(uint64_t a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v4 = a3[2];
  uint64_t v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v8 = a3[1];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = v9 - 8;
  uint64_t v11 = v12;
  if (v5 >= v8)
  {
    unint64_t v15 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = v8;
    if (v8 < 1) {
      goto LABEL_5;
    }
    goto LABEL_7;
  }
  uint64_t v13 = v8 - v5;
  if (__OFSUB__(v8, v5))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v14 = v5;
  unint64_t v15 = a4;
  if (v5 < 1)
  {
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_13;
  }
LABEL_7:
  if (!a4)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v16 = a4 + *(void *)(v11 + 72) * v4;
  uint64_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 72) * v14;
  unint64_t v18 = a2 + v17;
  unint64_t v19 = v16 + v17;
  if (v16 < v18 && v19 > a2) {
    goto LABEL_29;
  }
  uint64_t result = swift_arrayInitWithCopy();
LABEL_13:
  if (v5 >= v8 || v13 < 1) {
    return result;
  }
  if (!v15)
  {
LABEL_28:
    __break(1u);
LABEL_29:
    uint64_t result = sub_19D603658();
    __break(1u);
    return result;
  }
  uint64_t v22 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 72);
  unint64_t v23 = a2 + v22 * v14;
  uint64_t v24 = v22 * v13;
  unint64_t v25 = v23 + v24;
  unint64_t v26 = v15 + v24;
  if (v25 > v15 && v23 < v26) {
    goto LABEL_29;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_19D5BDE0C(uint64_t a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v4 = a3[2];
  uint64_t v5 = *a3 - v4;
  if (__OFSUB__(*a3, v4))
  {
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v8 = a3[1];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v12 = *(void *)(v9 - 8);
  uint64_t result = v9 - 8;
  uint64_t v11 = v12;
  if (v5 >= v8)
  {
    unint64_t v15 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = v8;
    if (v8 < 1) {
      goto LABEL_14;
    }
    goto LABEL_7;
  }
  uint64_t v13 = v8 - v5;
  if (__OFSUB__(v8, v5))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v14 = v5;
  unint64_t v15 = a4;
  if (v5 < 1) {
    goto LABEL_14;
  }
LABEL_7:
  if (!a4)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v16 = a4 + *(void *)(v11 + 72) * v4;
  uint64_t v17 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 72);
  unint64_t v18 = a2 + v17 * v4;
  uint64_t v19 = v17 * v14;
  unint64_t v20 = v18 + v19;
  unint64_t v21 = v16 + v19;
  if (v16 < v20 && v18 < v21) {
    goto LABEL_29;
  }
  uint64_t result = swift_arrayInitWithCopy();
LABEL_14:
  if (v5 < v8 && v13 >= 1)
  {
    if (v15)
    {
      uint64_t v24 = *(void *)(*(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8) + 72) * v13;
      unint64_t v25 = a2 + v24;
      unint64_t v26 = v15 + v24;
      if (v25 <= v15 || v26 <= a2) {
        return swift_arrayInitWithCopy();
      }
LABEL_29:
      uint64_t result = sub_19D603658();
      __break(1u);
      return result;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  return result;
}

uint64_t sub_19D5BDFF0(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = sub_19D6036F8();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_19D5BE370(a2, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v14;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)(v6 + 48);
  if (*(void *)(v10 + 8 * v9) != a2)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v9 = (v9 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v10 + 8 * v9) != a2);
  }
  uint64_t result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_19D5BE0EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455D0);
  uint64_t result = sub_19D603558();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    uint64_t v6 = (uint64_t *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v26 = -1 << v7;
    id v27 = v1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        unint64_t v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v14 = v13 | (v5 << 6);
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          int64_t v5 = v15 + 1;
          if (v15 + 1 >= v10) {
            goto LABEL_33;
          }
          unint64_t v16 = v6[v5];
          if (!v16)
          {
            int64_t v5 = v15 + 2;
            if (v15 + 2 >= v10) {
              goto LABEL_33;
            }
            unint64_t v16 = v6[v5];
            if (!v16)
            {
              int64_t v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64) {
                  bzero((void *)(v2 + 56), 8 * v10);
                }
                else {
                  *uint64_t v6 = v26;
                }
                uint64_t v1 = v27;
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  int64_t v5 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_39;
                  }
                  if (v5 >= v10) {
                    goto LABEL_33;
                  }
                  unint64_t v16 = v6[v5];
                  ++v17;
                  if (v16) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v5 = v17;
            }
          }
        }
LABEL_23:
        unint64_t v9 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
      uint64_t result = sub_19D6036F8();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = result & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_19D5BE370(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_19D5BE0EC();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (uint64_t)sub_19D5BE494();
      goto LABEL_14;
    }
    sub_19D5BE62C();
  }
  uint64_t v8 = *v3;
  uint64_t result = sub_19D6036F8();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = sub_19D6036A8();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_19D5BE494()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_19D603548();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_19D5BE62C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455D0);
  uint64_t result = sub_19D603558();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v26 = v1;
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v9 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = sub_19D6036F8();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      unint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_19D5BE890()
{
  uint64_t v1 = *v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(v2 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E94455B8);
  uint64_t v5 = swift_allocObject();
  long long v6 = *(_OWORD *)(v1 + 24);
  *(void *)(v5 + 16) = v3;
  *(_OWORD *)(v5 + 24) = v6;
  if ((uint64_t)v6 >= 1) {
    sub_19D5BDE0C(v5 + 16, v5 + ((v4 + 40) & ~v4), (void *)(v1 + 16), v1 + ((v4 + 40) & ~v4));
  }
  uint64_t result = swift_release();
  *uint64_t v0 = v5;
  return result;
}

uint64_t sub_19D5BE984(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 24);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_19D5990F4;
  uint64_t v8 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  long long v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *long long v6 = v5;
  v6[1] = sub_19D594A94;
  return v8(a1);
}

uint64_t sub_19D5BEAA8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return MEMORY[0x1F4186498](v0, v6, v5);
}

uint64_t sub_19D5BEBA0(uint64_t a1)
{
  uint64_t v4 = v1[4];
  uint64_t v5 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1E9445320) - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = v1[2];
  uint64_t v8 = v1[3];
  uint64_t v9 = v1[5];
  uint64_t v10 = (uint64_t)v1 + v6;
  uint64_t v11 = (void *)((char *)v1 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v12 = *v11;
  uint64_t v13 = v11[1];
  unint64_t v14 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v14;
  void *v14 = v2;
  v14[1] = sub_19D5990F4;
  return sub_19D5BBD7C(a1, v7, v8, v9, v10, v12, v13, v4);
}

uint64_t dispatch thunk of StateMachine.RootState.handleEvent(_:currentState:delegate:isolation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int64_t v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a7 + 104)
                                                                                              + **(int **)(a7 + 104));
  int64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + 16) = v15;
  *int64_t v15 = v7;
  v15[1] = sub_19D5990F4;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of StateMachine.RootState.handleStateTransition(_:currentState:delegate:isolation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int64_t v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a6 + 112)
                                                                                     + **(int **)(a6 + 112));
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = sub_19D594A94;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of StateMachine.HandlerDelegate.enqueue(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of StateMachine.HandlerDelegate.enqueue(delegating:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

ValueMetadata *type metadata accessor for HMF()
{
  return &type metadata for HMF;
}

void sub_19D5BFD54(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5BFDD4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5BFE50(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C02C4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C0754(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C08F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C095C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C0A68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C0E38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C11C8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C124C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C18A8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C1F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D5C2294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D5C34F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C4B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D5C4F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL HMFDataIsReversed(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  BOOL v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = [v3 length];
    if (v7 == [v5 length])
    {
      id v8 = v3;
      uint64_t v9 = [v8 bytes];
      unint64_t v10 = 0;
      uint64_t v11 = [v5 bytes] - 1;
      do
      {
        unint64_t v12 = [v8 length];
        BOOL v6 = v12 <= v10;
        if (v12 <= v10) {
          break;
        }
        int v13 = *(unsigned __int8 *)(v9 + v10++);
        int v14 = *(unsigned __int8 *)(v11 + [v8 length]);
        --v11;
      }
      while (v13 == v14);
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

id HMFHTTPProtocolVersionString(unint64_t a1)
{
  if (a1 > 2)
  {
    id v2 = 0;
  }
  else
  {
    id v2 = **((id **)&unk_1E5957868 + a1);
  }
  return v2;
}

void sub_19D5C5A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_40n11_8_8_t0w8_s8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  id result = *(id *)(a2 + 48);
  *(void *)(a1 + 48) = result;
  return result;
}

void __destroy_helper_block_e8_40n4_8_s8(uint64_t a1)
{
}

void sub_19D5C7380(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C79E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C7A84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C7B20(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C7BC0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C7C4C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C7CD8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMFWiFiAssertionOptionsDescription(unint64_t a1)
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v3 = 1;
    do
    {
      if (v3 == 1 && (a1 & 1) != 0) {
        [v2 addObject:@"Foreground"];
      }
      v3 *= 2;
    }
    while (v3 - 1 < a1);
    id v4 = [v2 componentsJoinedByString:@", "];
  }
  else
  {
    id v4 = @"None";
  }
  return v4;
}

void sub_19D5C7F14(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C7FFC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C8BCC(_Unwind_Exception *exception_object)
{
}

void sub_19D5C8CD8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5C8F88(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __CoreLocationLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary = result;
  return result;
}

id HMFDescribeCollection(void *a1)
{
  uint64_t v1 = (objc_class *)MEMORY[0x1E4F28E78];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  HMFDescribeIntoBufferWithIndent(v3, &stru_1EEF0F5E0, v2);

  id v4 = (void *)[v3 copy];
  return v4;
}

void HMFDescribeIntoBufferWithIndent(void *a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 _stringRepresentation];
LABEL_8:
      uint64_t v9 = (void *)v8;
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v8 = [v7 description];
      goto LABEL_8;
    }
    if (([v7 conformsToProtocol:&unk_1EEF34160] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (([v7 conformsToProtocol:&unk_1EEF27B90] & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v23 = v7;
              [v5 appendString:@"{\n"];
              BOOL v24 = [v6 stringByAppendingString:@"    "];
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v34[2] = __HMFDescribeIntoBufferWithIndent_block_invoke;
              v34[3] = &unk_1E5957C10;
              id v25 = v5;
              id v35 = v25;
              id v36 = v24;
              id v26 = v24;
              [v23 enumerateKeysAndObjectsUsingBlock:v34];

              [v25 appendString:v6];
              [v25 appendString:@"}"];

              goto LABEL_11;
            }
            uint64_t v27 = [v6 length];
            uint64_t v28 = [v7 description];
            uint64_t v9 = v28;
            if (v27)
            {
              uint64_t v29 = [v28 _stringRepresentation];
              [v5 appendString:v29];

              goto LABEL_10;
            }
LABEL_9:
            [v5 appendString:v9];
LABEL_10:

            goto LABEL_11;
          }
        }
      }
    }
    id v10 = v7;
    objc_opt_class();
    id v31 = v7;
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v11 = CFSTR("{(\n");
      unint64_t v12 = @"}");
    }
    else
    {
      uint64_t v11 = CFSTR("(\n");
      unint64_t v12 = @"");
    }
    uint64_t v30 = v12;
    [v5 appendString:v11];
    uint64_t v13 = [v10 count];
    id v32 = v6;
    int v14 = [v6 stringByAppendingString:@"    "];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    int64_t v15 = [v10 objectEnumerator];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        uint64_t v19 = 0;
        uint64_t v33 = v13;
        uint64_t v20 = v13 - 1;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = *(void *)(*((void *)&v37 + 1) + 8 * v19);
          [v5 appendString:v14];
          HMFDescribeIntoBufferWithIndent(v5, v14, v21);
          if (v20 == v19) {
            char v22 = @"\n";
          }
          else {
            char v22 = @",\n";
          }
          [v5 appendString:v22];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
        uint64_t v13 = v33 - v19;
      }
      while (v17);
    }

    id v6 = v32;
    [v5 appendString:v32];
    [v5 appendString:v30];

    id v7 = v31;
  }
  else
  {
    [v5 appendString:@"(null)"];
  }
LABEL_11:
}

uint64_t __HMFDescribeIntoBufferWithIndent_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  [v5 appendString:v6];
  HMFDescribeIntoBufferWithIndent(*(void *)(a1 + 32), *(void *)(a1 + 40), v8);

  [*(id *)(a1 + 32) appendString:@" = "];
  HMFDescribeIntoBufferWithIndent(*(void *)(a1 + 32), *(void *)(a1 + 40), v7);

  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 appendString:@";\n"];
}

id __getPlatformInformationForKey(void *a1)
{
  uint64_t v1 = a1;
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService) {
    goto LABEL_6;
  }
  io_object_t v5 = MatchingService;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, v1, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (!CFProperty)
  {
    IOObjectRelease(v5);
LABEL_6:
    id v10 = 0;
    goto LABEL_12;
  }
  id v7 = (void *)CFProperty;
  CFTypeID v8 = CFGetTypeID(CFProperty);
  if (v8 == CFStringGetTypeID())
  {
    uint64_t v9 = [v7 copy];
  }
  else
  {
    CFTypeID v11 = CFGetTypeID(v7);
    if (v11 != CFDataGetTypeID())
    {
      id v10 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = [[NSString alloc] initWithData:v7 encoding:4];
  }
  id v10 = (void *)v9;
LABEL_11:
  IOObjectRelease(v5);
  CFRelease(v7);
LABEL_12:

  return v10;
}

void sub_19D5C9BE0(_Unwind_Exception *a1)
{
}

void __updateValue(void *a1, uint64_t a2)
{
  CFDictionaryRef v3 = a1;
  if (v3)
  {
    id v10 = v3;
    os_unfair_lock_assert_owner(v3 + 2);
    CFDictionaryRef v3 = v10;
    uint64_t v4 = *(void *)&v10[6]._os_unfair_lock_opaque;
    if (v4 != a2)
    {
      uint64_t v5 = *(void *)&v10[8]._os_unfair_lock_opaque;
      [(os_unfair_lock *)v10 willChangeValueForKey:@"value"];
      BOOL v6 = v4 == v5 || v5 == a2;
      int v7 = v6;
      if (v6) {
        [(os_unfair_lock *)v10 willChangeValueForKey:@"full"];
      }
      if (a2) {
        BOOL v8 = v4 == 0;
      }
      else {
        BOOL v8 = 1;
      }
      int v9 = v8;
      if (v8) {
        [(os_unfair_lock *)v10 willChangeValueForKey:@"empty"];
      }
      *(void *)&v10[6]._os_unfair_lock_opaque = a2;
      [(os_unfair_lock *)v10 didChangeValueForKey:@"value"];
      if (v7) {
        [(os_unfair_lock *)v10 didChangeValueForKey:@"full"];
      }
      CFDictionaryRef v3 = v10;
      if (v9)
      {
        [(os_unfair_lock *)v10 didChangeValueForKey:@"empty"];
        CFDictionaryRef v3 = v10;
      }
    }
  }
}

void sub_19D5CA03C(_Unwind_Exception *a1)
{
}

void sub_19D5CA3C4(_Unwind_Exception *a1)
{
}

uint64_t NSOperatingSystemVersionToString(void *a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%ld.%ld.%ld", *a1, a1[1], a1[2]);
}

uint64_t HMFOperatingSystemVersionCompare(void *a1, void *a2)
{
  if (*a1 > *a2) {
    return 1;
  }
  if (*a1 < *a2) {
    return -1;
  }
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  if (v2 > v3) {
    return 1;
  }
  if (v2 < v3) {
    return -1;
  }
  uint64_t v5 = a1[2];
  uint64_t v6 = a2[2];
  BOOL v7 = v5 <= v6;
  if (v5 >= v6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = -1;
  }
  if (v7) {
    return v8;
  }
  else {
    return 1;
  }
}

uint64_t ignore_block_invoke()
{
  return 1;
}

uint64_t __thenBlockForFinallyBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HMFFuture;
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (HMFFuture)
  {
    uint64_t v4 = +[HMFFuture _futureWithOutcome:v6];
  }
  else
  {
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __thenBlockForFinallyBlock_block_invoke_2;
  v11[3] = &unk_1E5957C80;
  id v7 = v3;
  id v12 = v7;
  id v8 = [(__objc2_class *)v4 then:v11];
  if (!v8) {
    _HMFPreconditionFailure(@"future");
  }
  int v9 = v8;

  return 3;
}

uint64_t __thenBlockForFinallyBlock_block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  return 1;
}

uint64_t __recoverBlockForFinallyBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = HMFFuture;
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (HMFFuture)
  {
    uint64_t v4 = +[HMFFuture _futureWithOutcome:v6];
  }
  else
  {
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __recoverBlockForFinallyBlock_block_invoke_2;
  v11[3] = &unk_1E5957C80;
  id v7 = v3;
  id v12 = v7;
  id v8 = [(__objc2_class *)v4 then:v11];
  if (!v8) {
    _HMFPreconditionFailure(@"future");
  }
  int v9 = v8;

  return 3;
}

uint64_t __recoverBlockForFinallyBlock_block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    [MEMORY[0x1E4F28C58] hmfUnspecifiedError];
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

void sub_19D5CC850(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CC8C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CC930(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CC9B8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCA54(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCAEC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCB84(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCC00(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCC7C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCDFC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CCFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D5CD664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HMFRandomDataWithLength(unint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA58] dataWithCapacity:a1];
  if (a1)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    unint64_t v5 = 4;
    do
    {
      if (a1 >= v5) {
        unint64_t v6 = v5;
      }
      else {
        unint64_t v6 = a1;
      }
      uint64_t v7 = v6 + v3;
      uint32_t v9 = 0;
      uint32_t v9 = arc4random();
      v4 += 4;
      [v2 appendBytes:&v9 length:v7];
      v5 += 4;
      v3 -= 4;
    }
    while (v4 < a1);
  }
  return v2;
}

uint64_t HMFRandomUInt32()
{
  unsigned int bytes = 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], 4uLL, &bytes)) {
    return arc4random();
  }
  else {
    return bytes;
  }
}

double HMFSecondsFromMachTime(uint64_t a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  return (double)((unint64_t)info.numer * a1 / info.denom) / 1000000000.0;
}

BOOL HMFIsInternalBuild()
{
  uint64_t v0 = +[HMFProductInfo productInfo];
  BOOL v1 = [v0 productVariant] == 3;

  return v1;
}

BOOL HMFIsDeveloperBuild()
{
  uint64_t v0 = +[HMFProductInfo productInfo];
  BOOL v1 = [v0 productVariant] == 1;

  return v1;
}

BOOL HMFIsCustomerBuild()
{
  uint64_t v0 = +[HMFProductInfo productInfo];
  BOOL v1 = [v0 productVariant] == 0;

  return v1;
}

BOOL HMFIsCarrierBuild()
{
  uint64_t v0 = +[HMFProductInfo productInfo];
  BOOL v1 = [v0 productVariant] == 2;

  return v1;
}

id HMFEncodedRootObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v3 = [[HMFOSTransaction alloc] initWithName:@"com.apple.HMFoundation.hmfutilities.encode-root."];
  unint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v4 encodeObject:v1 forKey:*MEMORY[0x1E4F284E8]];
  [v4 finishEncoding];
  unint64_t v5 = [v4 encodedData];

  return v5;
}

void sub_19D5CEF10(_Unwind_Exception *exception_object)
{
}

void sub_19D5CEFB8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CF068(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5CFFB4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5D051C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMFSystemMemoryStateToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"HMFSystemMemoryStateUndefined";
  }
  else {
    return off_1E5957DD8[a1];
  }
}

__CFString *HMFProcessMemoryStateToString(unint64_t a1)
{
  if (a1 > 2) {
    return @"HMFProcessMemoryStateUndefined";
  }
  else {
    return off_1E5957DF8[a1];
  }
}

void sub_19D5D1A38(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5D1ACC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5D1BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  os_unfair_lock_unlock(v14);
  _Unwind_Resume(a1);
}

void sub_19D5D22C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_19D5D2374(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

__CFString *HMFStringFromMemoryEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<Unknown value: %ld>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5957E10[a1 - 1];
  }
  return v1;
}

void serverDidInvalidate(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  unint64_t v4 = [v3 object];
  if (v4)
  {
    unint64_t v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = v4;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = HMFGetLogIdentifier(v6);
      int v10 = 138543362;
      CFTypeID v11 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Server invalidated", (uint8_t *)&v10, 0xCu);
    }
    uint32_t v9 = [v6 delegate];
    [v9 serverDidInvalidate:v6];
  }
}

void serverDidReceiveError(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 object];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A87A0]();
    id v8 = v6;
    uint32_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = HMFGetLogIdentifier(v8);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = a2;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Server received error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void serverDidOpenConnection(void *a1, _HMFCFHTTPServerConnection *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 object];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A87A0]();
    id v8 = v6;
    uint32_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = HMFGetLogIdentifier(v8);
      int v18 = 138543618;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = a2;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Server did open connection: %@", (uint8_t *)&v18, 0x16u);
    }
    int v11 = [[_HMFCFHTTPServerConnection alloc] initWithConnectionRef:a2];
    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x19F3A87A0]();
      id v13 = v8;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier(v13);
        int v18 = 138543618;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        uint64_t v21 = v11;
        _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_INFO, "%{public}@Server did open connection: %@", (uint8_t *)&v18, 0x16u);
      }
      uint64_t v16 = [v13 connections];
      [v16 addObject:v11];

      uint64_t v17 = [v13 delegate];
      [v17 server:v13 didOpenConnection:v11];
    }
  }
}

void serverDidCloseConnection(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 object];
  if (v6)
  {
    id v29 = v5;
    uint64_t v7 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v28 = v6;
    id v8 = v6;
    uint32_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = HMFGetLogIdentifier(v8);
      *(_DWORD *)buf = 138543618;
      long long v37 = v10;
      __int16 v38 = 2112;
      long long v39 = a2;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Server did close connection: %@", buf, 0x16u);
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    int v11 = [v8 connections];
    uint64_t v12 = (void *)[v11 copy];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        uint64_t v16 = 0;
        uint64_t v30 = v14;
        do
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v31 + 1) + 8 * v16);
          if (objc_msgSend(v17, "internal", v28) == a2)
          {
            int v18 = (void *)MEMORY[0x19F3A87A0]();
            id v19 = v8;
            __int16 v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier(v19);
              uint64_t v21 = v15;
              uint64_t v22 = a2;
              id v23 = v12;
              id v25 = v24 = v8;
              *(_DWORD *)buf = 138543618;
              long long v37 = v25;
              __int16 v38 = 2112;
              long long v39 = v17;
              _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_INFO, "%{public}@Server did close connection: %@", buf, 0x16u);

              id v8 = v24;
              uint64_t v12 = v23;
              a2 = v22;
              uint64_t v15 = v21;
              uint64_t v14 = v30;
            }

            [v17 close];
            id v26 = [v19 connections];
            [v26 removeObject:v17];

            uint64_t v27 = [v19 delegate];
            [v27 server:v19 didCloseConnection:v17];
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v14);
    }

    id v6 = v28;
    id v5 = v29;
  }
}

HMFMessageBinding *HMF_MESSAGE_BINDING(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = [[HMFMessageBinding alloc] initWithName:v6 policies:v5 selector:a3];

  return v7;
}

void sub_19D5D5814(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5D601C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5D6298(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _connectionDidInvalidate(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v2 = v1;
  }
  else {
    uint64_t v2 = 0;
  }
  id v3 = v2;

  unint64_t v4 = [v3 object];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = v4;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier(v6);
      int v9 = 138543362;
      int v10 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Connection invalidated", (uint8_t *)&v9, 0xCu);
    }
  }
}

void _connectionDidReceiveError(void *a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 object];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x19F3A87A0]();
    id v8 = v6;
    int v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = HMFGetLogIdentifier(v8);
      int v11 = 138543618;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = a2;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Connection received error: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void _connectionDidReceiveRequest(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  id v7 = [v5 object];

  id v6 = v7;
  if (v7)
  {
    [v7 _handleReceivedRequestRef:a2];
    id v6 = v7;
  }
}

void _connectionDidSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v8 = [v6 object];

  id v7 = v8;
  if (v8)
  {
    [v8 _handleCompletedResponse:a3 error:0];
    id v7 = v8;
  }
}

void _connectionDidFailToSendResponse(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v8 = [v6 object];

  if (v8)
  {
    id v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11];
    [v8 _handleCompletedResponse:a3 error:v7];
  }
}

CFTypeRef _retainInfo(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void _releaseInfo(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void readStreamCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v9 = [v7 object];

  if (v9)
  {
    id v8 = [v9 connection];
    [v8 handleRequest:v9 bodyReadStream:a1 eventType:a2];
  }
}

void sub_19D5D7EA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void __updateBatteryLevel(void *a1, float a2)
{
  id v3 = a1;
  if (v3)
  {
    float v4 = roundf(a2 * 1000.0) / 1000.0;
    id v5 = v3 + 2;
    p_os_unfair_lock_opaque = (float *)&v3->_os_unfair_lock_opaque;
    os_unfair_lock_lock_with_options();
    if (vabds_f32(p_os_unfair_lock_opaque[4], v4) <= 0.1)
    {
      os_unfair_lock_unlock(v5);
    }
    else
    {
      p_os_unfair_lock_opaque[4] = v4;
      os_unfair_lock_unlock(v5);
      id v6 = +[HMFNotificationCenter defaultCenter];
      [v6 postNotificationName:@"HMFPowerManagerBatteryLevelDidChangeNotification" object:p_os_unfair_lock_opaque];
    }
    id v3 = (os_unfair_lock_s *)p_os_unfair_lock_opaque;
  }
}

void __updateBatteryState(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    uint64_t v4 = os_unfair_lock_lock_with_options();
    if (*(void *)&v3[6]._os_unfair_lock_opaque == a2)
    {
      os_unfair_lock_unlock(v3 + 2);
    }
    else
    {
      id v5 = (void *)MEMORY[0x19F3A87A0](v4);
      id v6 = v3;
      HMFGetOSLogHandle();
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = HMFGetLogIdentifier(v6);
        int v10 = 138543618;
        int v11 = v8;
        __int16 v12 = 2048;
        uint64_t v13 = a2;
        _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Battery state changed: %tu", (uint8_t *)&v10, 0x16u);
      }
      *(void *)&v6[6]._os_unfair_lock_opaque = a2;
      os_unfair_lock_unlock(v3 + 2);
      id v9 = +[HMFNotificationCenter defaultCenter];
      [v9 postNotificationName:@"HMFPowerManagerBatteryStateDidChangeNotification" object:v6];
    }
  }
}

void sub_19D5D93F0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void _matchedBatteryMatchingCallback(void *a1, io_iterator_t a2)
{
  uint64_t v4 = (void *)MEMORY[0x19F3A87A0]();
  id v5 = a1;
  if (v5)
  {
    uint64_t v6 = IOIteratorNext(a2);
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        if (!IOServiceAddInterestNotification((IONotificationPortRef)[(io_object_t *)v5 notificationPort], v7, "IOGeneralInterest", (IOServiceInterestCallback)_batteryInterestCallback, v5, v5 + 5))[(io_object_t *)v5 updateBatteryState:v7]; {
        IOObjectRelease(v7);
        }
        uint64_t v7 = IOIteratorNext(a2);
      }
      while (v7);
    }
  }
}

void *_batteryInterestCallback(void *a1, const char *a2, int a3)
{
  if (a1)
  {
    if (a3 == -536723200) {
      return (void *)[a1 updateBatteryState:a2];
    }
  }
  return a1;
}

void sub_19D5DAF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_19D5DC588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __get_nw_parameters_block_invoke(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40F3FA0](a2, 1);
}

void sub_19D5DDC68(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5DDDAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5DDF2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5DE9B4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __browse_result_changed_handler_block_invoke(uint64_t a1, void *a2, void *a3)
{
  old_uint64_t result = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  nw_browse_result_change_t changes = nw_browse_result_get_changes(old_result, v5);
  if ((changes & 1) == 0)
  {
    if ((changes & 2) != 0)
    {
      uint64_t v8 = 2;
    }
    else if ((changes & 4) != 0)
    {
      uint64_t v8 = 3;
    }
    else
    {
      if (((changes >> 3) & 4) == 0) {
        goto LABEL_14;
      }
      uint64_t v8 = (changes >> 3) & 4;
    }
    id v9 = [HMFNetworkService alloc];
    nw_txt_record_t v10 = nw_browse_result_copy_txt_record_object(v5);
    if (v5) {
      int v11 = v5;
    }
    else {
      int v11 = old_result;
    }
    __int16 v12 = [WeakRetained workQueue];
    uint64_t v13 = [(HMFNetworkService *)v9 initWithTXTRecords:v10 browseResult:v11 queue:v12];

    uint64_t v14 = [WeakRetained updateBlock];
    uint64_t v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, HMFNetworkService *, uint64_t))(v14 + 16))(v14, v13, v8);
    }
  }
LABEL_14:
}

uint64_t __networkServiceDidUpdate_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  switch(a3)
  {
    case 4:
      id v8 = v5;
      id v5 = (id)[*(id *)(a1 + 32) _updateService:v5];
      break;
    case 3:
      id v8 = v5;
      id v5 = (id)[*(id *)(a1 + 32) _removeService:v5];
      break;
    case 2:
      id v8 = v5;
      id v5 = (id)[*(id *)(a1 + 32) _addService:v5];
      break;
    default:
      goto LABEL_8;
  }
  id v6 = v8;
LABEL_8:
  return MEMORY[0x1F41817F8](v5, v6);
}

uint64_t ____registerForUpdates_block_invoke(uint64_t a1, const __CFString *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v11 = WeakRetained;
    if (CFEqual(a2, @"UserAssignedDeviceName"))
    {
      id v4 = v11;
      id v5 = (void *)MGCopyAnswer();
      CFTypeID TypeID = CFStringGetTypeID();
      objc_opt_class();
      if (v5 && CFGetTypeID(v5) != TypeID)
      {
        CFRelease(v5);
        id v5 = 0;
      }
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v5;
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;

      os_unfair_lock_lock_with_options();
      if (HMFEqualObjects(*((void **)v4 + 3), v8))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
      }
      else
      {
        objc_storeStrong((id *)v4 + 3, v7);
        os_unfair_lock_unlock((os_unfair_lock_t)v4 + 2);
        id v9 = [v4 delegate];
        [v9 dataSource:v4 didUpdateName:v8];
      }
    }
  }
  return MEMORY[0x1F41817F8]();
}

void sub_19D5DF110(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5E0020(_Unwind_Exception *a1)
{
}

void sub_19D5E0960(_Unwind_Exception *a1)
{
  CFRelease(*v1);
  *id v1 = v2;
  _Unwind_Resume(a1);
}

void sub_19D5E09E8(_Unwind_Exception *a1)
{
  CFRelease(*v1);
  *id v1 = v2;
  _Unwind_Resume(a1);
}

void HMFImplicitDispatchContextDestroy(id *a1)
{
  objc_storeWeak(a1 + 1, 0);
  free(a1);
}

HMFDispatchContext *HMFImplicitDispatchContext()
{
  specifiCC_SHA1_CTX c = (char *)dispatch_get_specific(&implicitContextKey);
  if (specific)
  {
    id v1 = specific;
    uint64_t v2 = (id *)(specific + 8);
    id WeakRetained = (HMFDispatchContext *)objc_loadWeakRetained((id *)specific + 1);
    if (!WeakRetained)
    {
      id WeakRetained = [[HMFDispatchContext alloc] initWithQueue:*v1];
      objc_storeWeak(v2, WeakRetained);
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

void sub_19D5E28D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_19D5E2AC8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_19D5E2F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D5E4670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19D5E4AC4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __HMFHTTPClientHandleReachabilityChange(void *a1, int a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (v3)
  {
    id v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = v3;
    id v6 = HMFGetOSLogHandle();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v7)
      {
        id v8 = HMFGetLogIdentifier(v5);
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v8;
        _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that the server is now reachable", buf, 0xCu);
      }
      if (([v5 isReachable] & 1) == 0)
      {
        objc_initWeak((id *)buf, v5);
        id v9 = [v5 netService];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = ____HMFHTTPClientHandleReachabilityChange_block_invoke;
        _OWORD v19[3] = &unk_1E5958450;
        objc_copyWeak(&v20, (id *)buf);
        [v9 resolveWithTimeout:v19 completionHandler:15.0];

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
      nw_txt_record_t v10 = [v5 reachabilityProbeQueue];
      int v11 = [v10 operations];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        uint64_t v13 = (void *)MEMORY[0x19F3A87A0]();
        id v14 = v5;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = HMFGetLogIdentifier(v14);
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v16;
          _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_INFO, "%{public}@Cancelling pending confirmations due to reachability change", buf, 0xCu);
        }
      }
      uint64_t v17 = [v5 reachabilityProbeQueue];
      [v17 cancelAllOperations];
    }
    else
    {
      if (v7)
      {
        int v18 = HMFGetLogIdentifier(v5);
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = v18;
        _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Received notification that the server is now unreachable", buf, 0xCu);
      }
      if ([v5 isActive])
      {
        if (([v5 isReachable] & 1) == 0) {
          [v5 stopDelegatedPingTimer];
        }
      }
      else
      {
        [v5 setReachable:0];
      }
    }
  }
}

void sub_19D5E51FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_19D5E5F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D5E6130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D5E6354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D5E652C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19D5E673C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19D5E695C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _HMFPreconditionFailure(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  if (v1) {
    id v4 = v1;
  }
  else {
    id v4 = @"(null)";
  }
  id v5 = [@"Precondition not satisfied: " stringByAppendingString:v4];
  id v6 = [v2 exceptionWithName:v3 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

void _HMFPreconditionFailureWithFormat(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  _HMFPreconditionFailure((void *)[[NSString alloc] initWithFormat:v9 arguments:&a9]);
}

__CFString *HMFProductPlatformToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5958508[a1 - 1];
  }
}

uint64_t HMFProductClassFromString(void *a1)
{
  id v1 = [a1 lowercaseString];
  uint64_t v2 = [@"iPhone" lowercaseString];
  char v3 = [v1 containsString:v2];

  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [@"iPod" lowercaseString];
    char v6 = [v1 containsString:v5];

    if (v6)
    {
      uint64_t v4 = 2;
    }
    else
    {
      BOOL v7 = [@"iPad" lowercaseString];
      char v8 = [v1 containsString:v7];

      if (v8)
      {
        uint64_t v4 = 3;
      }
      else
      {
        id v9 = [@"AppleTV" lowercaseString];
        char v10 = [v1 containsString:v9];

        if (v10)
        {
          uint64_t v4 = 4;
        }
        else
        {
          int v11 = [@"Watch" lowercaseString];
          char v12 = [v1 containsString:v11];

          if (v12)
          {
            uint64_t v4 = 5;
          }
          else
          {
            uint64_t v13 = [@"iMac" lowercaseString];
            char v14 = [v1 containsString:v13];

            if (v14)
            {
              uint64_t v4 = 7;
            }
            else
            {
              uint64_t v15 = [@"MacBook" lowercaseString];
              char v16 = [v1 containsString:v15];

              if (v16)
              {
                uint64_t v4 = 8;
              }
              else
              {
                uint64_t v17 = [@"Macmini" lowercaseString];
                char v18 = [v1 containsString:v17];

                if (v18)
                {
                  uint64_t v4 = 9;
                }
                else
                {
                  id v19 = [@"MacPro" lowercaseString];
                  char v20 = [v1 containsString:v19];

                  if (v20)
                  {
                    uint64_t v4 = 10;
                  }
                  else
                  {
                    uint64_t v21 = [@"AudioAccessory" lowercaseString];
                    char v22 = [v1 containsString:v21];

                    if (v22)
                    {
                      uint64_t v4 = 6;
                    }
                    else
                    {
                      uint64_t v23 = [@"RealityDevice" lowercaseString];
                      int v24 = [v1 containsString:v23];

                      if (v24) {
                        uint64_t v4 = 11;
                      }
                      else {
                        uint64_t v4 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

__CFString *HMFProductClassToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xA) {
    return @"Unknown";
  }
  else {
    return off_1E5958530[a1 - 1];
  }
}

__CFString *HMFProductVariantToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"Customer";
  }
  else {
    return off_1E5958588[a1 - 1];
  }
}

__CFString *HMFProductColorToString(unint64_t a1)
{
  if (a1 >= 6)
  {
    uint64_t v2 = NSString;
    char v3 = [NSNumber numberWithInteger:a1];
    id v1 = [v2 stringWithFormat:@"Unknown (%@)", v3];
  }
  else
  {
    id v1 = off_1E59584D8[a1];
  }
  return v1;
}

__CFString *HMFGetActivityIdentifier(void *a1)
{
  if (a1)
  {
    id v1 = NSString;
    uint64_t v2 = [a1 identifier];
    char v3 = [v2 shortDescription];
    uint64_t v4 = [v1 stringWithFormat:@"[%@] ", v3];
  }
  else
  {
    uint64_t v4 = &stru_1EEF0F5E0;
  }
  return v4;
}

__CFSocket *create_socket(CFSocketNativeHandle sock, CFSocketContext *context)
{
  if (sock < 0) {
    return 0;
  }
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  char v3 = CFSocketCreateWithNative((CFAllocatorRef)*MEMORY[0x1E4F1CF80], sock, 1uLL, (CFSocketCallBack)SocketReadCallback, context);
  uint64_t v4 = v3;
  if (v3 && (CFSocketGetSocketFlags(v3) & 0x80) == 0) {
    __assert_rtn("create_socket", "HMFNetworkDiagnosticPing.m", 383, "CFSocketGetSocketFlags(socket) & kCFSocketCloseOnInvalidate");
  }
  CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(v2, v4, 0);
  if (!RunLoopSource) {
    return 0;
  }
  char v6 = RunLoopSource;
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRelease(v6);
  return v4;
}

void SocketReadCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  id v8 = v7;

  [v8 _readDataFromSocket:a1];
}

uint64_t HMFQualityOfServiceCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 1;
  if (a1 <= a2) {
    uint64_t v2 = -1;
  }
  uint64_t v3 = -1;
  if (a1 >= 25) {
    uint64_t v3 = 1;
  }
  if (a2 == -1) {
    uint64_t v2 = v3;
  }
  uint64_t v4 = 1;
  if (a2 >= 25) {
    uint64_t v4 = -1;
  }
  if (a1 == -1) {
    uint64_t v2 = v4;
  }
  if (a1 == a2) {
    return 0;
  }
  else {
    return v2;
  }
}

id _HMFValidateMessagePayload(id a1)
{
  if (a1)
  {
    a1 = validatePayloadObject(a1);
    uint64_t v1 = vars8;
  }
  return a1;
}

id validatePayloadObject(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = CFGetTypeID(v1);
  if (v2 == CFArrayGetTypeID())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = @": NSMutableArray";
LABEL_17:
      id v4 = (id)[(__CFString *)v3 mutableCopy];
      goto LABEL_20;
    }
    uint64_t v10 = 0;
    int v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__1;
    char v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __validatePayloadObject_block_invoke;
    v9[3] = &unk_1E5958638;
    v9[4] = &v10;
    [v1 enumerateObjectsUsingBlock:v9];
  }
  else
  {
    if (v2 != CFDictionaryGetTypeID())
    {
      if (v2 == CFSetGetTypeID())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v3 = @": NSMutableSet";
          goto LABEL_17;
        }
        uint64_t v10 = 0;
        int v11 = &v10;
        uint64_t v12 = 0x3032000000;
        uint64_t v13 = __Block_byref_object_copy__1;
        char v14 = __Block_byref_object_dispose__1;
        id v15 = 0;
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __validatePayloadObject_block_invoke_3;
        v7[3] = &unk_1E5958688;
        v7[4] = &v10;
        [v1 enumerateObjectsUsingBlock:v7];
        _Block_object_dispose(&v10, 8);
      }
      else if (v2 == CFStringGetTypeID())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v5 = (id)[v1 copy];

          if (v5 != v1)
          {
            uint64_t v3 = @": NSMutableString";
            goto LABEL_17;
          }
        }
      }
      id v4 = 0;
      goto LABEL_20;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = @": NSMutableDictionary";
      goto LABEL_17;
    }
    uint64_t v10 = 0;
    int v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__1;
    char v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __validatePayloadObject_block_invoke_2;
    _OWORD v8[3] = &unk_1E5958660;
    v8[4] = &v10;
    [v1 enumerateKeysAndObjectsUsingBlock:v8];
  }
  id v4 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

LABEL_20:
  return v4;
}

void sub_19D5EB69C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __validatePayloadObject_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = validatePayloadObject(a2);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (v7)
  {
    uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v11 = objc_msgSend(NSString, "stringWithFormat:", @"[%tu]", a3);
    [v10 insertString:v11 atIndex:0];

    *a4 = 1;
  }
}

void __validatePayloadObject_block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a3;
  uint64_t v8 = validatePayloadObject(v19);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v8)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) insertString:@": invalid dictionary key" atIndex:0];
  }
  else
  {
    uint64_t v11 = validatePayloadObject(v7);
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (!v11) {
      goto LABEL_6;
    }
    char v14 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v15 = NSString;
    char v16 = [v19 description];
    uint64_t v17 = [v16 _stringRepresentation];
    char v18 = [v15 stringWithFormat:@"[%@]", v17];
    [v14 insertString:v18 atIndex:0];
  }
  *a4 = 1;
LABEL_6:
}

void __validatePayloadObject_block_invoke_3(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = validatePayloadObject(a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v5) {
    *a3 = 1;
  }
}

void sortKeysAndValuesOfDictionary(void *a1, void *a2, void **a3, void **a4)
{
  uint64_t v7 = _MergedGlobals_68;
  id v8 = a2;
  id v9 = a1;
  if (v7 != -1) {
    dispatch_once(&_MergedGlobals_68, &__block_literal_global_35);
  }
  id v16 = (id)qword_1EB4EED90;
  uint64_t v10 = [v9 allKeys];
  uint64_t v11 = [v10 sortedArrayUsingComparator:v8];

  uint64_t v12 = [v9 objectsForKeys:v11 notFoundMarker:v16];

  uint64_t v13 = *a3;
  *a3 = v11;
  id v14 = v11;

  id v15 = *a4;
  *a4 = (void *)v12;
}

uint64_t __sortKeysAndValuesOfDictionary_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
  uint64_t v1 = qword_1EB4EED90;
  qword_1EB4EED90 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __updateName(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = a3;
  if ([v7 store] == a1)
  {
    id v4 = (__CFString *)SCDynamicStoreCopyLocalHostName(0);
    uint64_t v5 = (os_unfair_lock_s *)(v7 + 1);
    os_unfair_lock_lock_with_options();
    if (HMFEqualObjects(v7[3], v4))
    {
      os_unfair_lock_unlock(v5);
    }
    else
    {
      objc_storeStrong(v7 + 3, v4);
      os_unfair_lock_unlock(v5);
      uint64_t v6 = [v7 delegate];
      [v6 dataSource:v7 didUpdateName:v4];
    }
  }
}

void sub_19D5EE680(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5EE810(_Unwind_Exception *a1)
{
}

void sub_19D5EFD18(_Unwind_Exception *a1)
{
}

id HMFTimeIntervalDescription(double a1)
{
  CFTypeID v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v2 sinceDate:a1];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = [v4 components:248 fromDate:v2 toDate:v3 options:0];

  uint64_t v6 = objc_msgSend(v5, "hmf_localTimeDescription");

  return v6;
}

void sub_19D5F0A60(_Unwind_Exception *a1)
{
}

void sub_19D5F224C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5F2A60(_Unwind_Exception *exception_object)
{
}

uint64_t __txtRecordDictionary_block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  id v9 = (void *)[[NSString alloc] initWithUTF8String:a2];
  if (a3 == 4)
  {
    id v10 = [NSString alloc];
    uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a4 length:a5];
    uint64_t v12 = (void *)[v10 initWithData:v11 encoding:4];

    if (!v12)
    {
      uint64_t v13 = 0;
      goto LABEL_7;
    }
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v9];
  }
  else if (a3 == 3)
  {
    [*(id *)(a1 + 32) setObject:&stru_1EEF0F5E0 forKeyedSubscript:v9];
  }
  uint64_t v13 = 1;
LABEL_7:

  return v13;
}

uint64_t __SetupAssistantLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  SetupAssistantLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getBYSetupAssistantNeedsToRunSymbolLoc_block_invoke(uint64_t a1)
{
  CFTypeID v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantNeedsToRunSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __migrationFinishedCallback(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = v4;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = HMFGetLogIdentifier(v6);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received notification migration has finished", (uint8_t *)&v10, 0xCu);
    }
    id v9 = [v6 delegate];
    [v9 dataSource:v6 didUpdateMigrating:0];
  }
}

void *__getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)SetupAssistantLibrary();
  uint64_t result = dlsym(v2, "BYSetupAssistantFinishedDarwinNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *HMFDigestAlgorithmToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6) {
    return @"Unknown";
  }
  else {
    return off_1E59587A8[a1 - 2];
  }
}

uint64_t HMFDigestAlgorithmFromString(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"SHA1"]
    && [v1 caseInsensitiveCompare:@"SHA-1"])
  {
    if ([v1 caseInsensitiveCompare:@"SHA224"]
      && [v1 caseInsensitiveCompare:@"SHA-224"])
    {
      if ([v1 caseInsensitiveCompare:@"SHA256"]
        && [v1 caseInsensitiveCompare:@"SHA-256"])
      {
        if ([v1 caseInsensitiveCompare:@"SHA384"]
          && [v1 caseInsensitiveCompare:@"SHA-384"])
        {
          if ([v1 caseInsensitiveCompare:@"SHA512"]) {
            uint64_t v2 = 8 * ([v1 caseInsensitiveCompare:@"SHA-512"] == 0);
          }
          else {
            uint64_t v2 = 8;
          }
        }
        else
        {
          uint64_t v2 = 7;
        }
      }
      else
      {
        uint64_t v2 = 6;
      }
    }
    else
    {
      uint64_t v2 = 5;
    }
  }
  else
  {
    uint64_t v2 = 2;
  }

  return v2;
}

void sub_19D5F40CC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5F46E4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

id HMFMainThreadAsyncContext()
{
  if (_MergedGlobals_73 != -1) {
    dispatch_once(&_MergedGlobals_73, &__block_literal_global_44);
  }
  id v0 = (void *)qword_1EB4EEDE8;
  return v0;
}

uint64_t __HMFMainThreadAsyncContext_block_invoke()
{
  id v0 = objc_alloc_init(_HMFMainThreadAsyncContext);
  uint64_t v1 = qword_1EB4EEDE8;
  qword_1EB4EEDE8 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id HMFCallerAsyncContext()
{
  if (qword_1EB4EEDF0 != -1) {
    dispatch_once(&qword_1EB4EEDF0, &__block_literal_global_23);
  }
  id v0 = (void *)qword_1EB4EEDF8;
  return v0;
}

uint64_t __HMFCallerAsyncContext_block_invoke()
{
  id v0 = objc_alloc_init(_HMFCallerAsyncContext);
  uint64_t v1 = qword_1EB4EEDF8;
  qword_1EB4EEDF8 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t _HMFThreadLocalAsyncContextPush(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (uint64_t *)_HMFThreadLocalAsyncContext();
  uint64_t v3 = *v2;
  *uint64_t v2 = v4;
  return v3;
}

void _HMFThreadLocalAsyncContextPop(CFTypeRef *a1)
{
  uint64_t v2 = (CFTypeRef *)_HMFThreadLocalAsyncContext();
  CFRelease(*v2);
  *uint64_t v2 = *a1;
}

id HMFCurrentAsyncContext()
{
  id v0 = *(id *)_HMFThreadLocalAsyncContext();
  if (!v0)
  {
    HMFImplicitDispatchContext();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    if (!v0)
    {
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        HMFMainThreadAsyncContext();
        id v0 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v0 = 0;
      }
    }
  }
  return v0;
}

id HMFRequireCurrentAsyncContext()
{
  id v0 = *(id *)_HMFThreadLocalAsyncContext();
  if (!v0)
  {
    HMFImplicitDispatchContext();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    if (!v0)
    {
      if (![MEMORY[0x1E4F29060] isMainThread])
      {
        id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"No current HMFAsyncContext" userInfo:0];
        objc_exception_throw(v2);
      }
      HMFMainThreadAsyncContext();
      id v0 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v0;
}

void hmdWiFiClientDeviceAttachmentCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3A87A0]();
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier(0);
    int v8 = 138543618;
    id v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = a2;
    _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] Device attachement callback: %@", (uint8_t *)&v8, 0x16u);
  }
  [v4 startWithWiFiDevice:a2];
}

void hmdWiFiClientWoWStateChangedCallback(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __hmdWiFiClientWoWStateChangedCallback_block_invoke;
  v7[3] = &unk_1E5958810;
  id v8 = v4;
  char v9 = a2;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void sub_19D5F5B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_unfair_lock_t lock)
{
}

void sub_19D5F5C2C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t hmdWiFiDeviceClientExtendedLinkCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 handleWiFiLinkChangedWithEventDictionary:a2];
}

void sub_19D5F6570(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t dynamicStoreCallback(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier(0);
    int v8 = 138543362;
    char v9 = v6;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@[HMFWiFiManagerDataSource] captive state changed", (uint8_t *)&v8, 0xCu);
  }
  return [a3 _invalidateCaptiveState];
}

void __hmdWiFiClientWoWStateChangedCallback_block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dataSource:*(void *)(a1 + 32) didChangeWoWState:*(unsigned char *)(a1 + 40) != 0];
}

BOOL HMFAreStringsEqualIgnoringCase(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (v3 == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
    if (v3 && v4) {
      BOOL v6 = [v3 caseInsensitiveCompare:v4] == 0;
    }
  }

  return v6;
}

uint64_t HMFIntrinsicComparator_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t HMFReverseIntrinsicComparator_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

void sub_19D5F8408(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t __CoreLocationLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreLocationLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_19D5F96FC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5F9780(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5F9818(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5F98B0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5F9F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_19D5FA444(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5FA58C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5FA6DC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5FAF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HMFEnabledStatusToString(int a1)
{
  if (a1) {
    return @"Enabled";
  }
  else {
    return @"Disabled";
  }
}

void _networkReachabilityChangeCallback(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 object];

  [v7 handleNetworkReachabilityChange:a2];
}

__CFString *__SCNetworkReachabilityFlagsToString(unsigned int a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (a1)
  {
    for (int i = 1; i - 1 < a1; i *= 2)
    {
      if ((i & a1) != 0)
      {
        if (i == 2)
        {
          id v4 = @"Reachable";
          goto LABEL_8;
        }
        if (i == 0x40000)
        {
          id v4 = @"WWAN";
LABEL_8:
          [v2 addObject:v4];
        }
      }
    }
  }
  if (objc_msgSend(v2, "hmf_isEmpty"))
  {
    uint64_t v5 = @"None";
  }
  else
  {
    uint64_t v5 = [v2 componentsJoinedByString:@", "];
  }

  return v5;
}

void sub_19D5FD7E0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5FE070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_19D5FFD0C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5FFEAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D5FFFAC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __notifyUpdatedTXTRecord(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if (v5 && v3)
  {
    id v4 = [v5 delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 netService:v5 didUpdateTXTRecord:v3];
    }
  }
}

void sub_19D6000F4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void __HMFNetServiceUpdatePort(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = a1;
    id v4 = NSStringFromSelector(sel_port);
    [(os_unfair_lock_s *)v3 willChangeValueForKey:v4];

    os_unfair_lock_lock_with_options();
    *(void *)&v3[12]._os_unfair_lock_opaque = a2;
    os_unfair_lock_unlock(v3 + 2);
    NSStringFromSelector(sel_port);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(os_unfair_lock_s *)v3 didChangeValueForKey:v5];
  }
}

void sub_19D601B18(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_19D601E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, uint64_t a10, __int16 a11, uint64_t a12)
{
  os_unfair_lock_unlock(v12);
  _Unwind_Resume(a1);
}

void sub_19D602148(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19D6031E8()
{
  return MEMORY[0x1F40E53B0]();
}

uint64_t sub_19D6031F8()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_19D603208()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_19D603218()
{
  return MEMORY[0x1F4112860]();
}

uint64_t sub_19D603228()
{
  return MEMORY[0x1F4112868]();
}

uint64_t sub_19D603238()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_19D603248()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_19D603258()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_19D603268()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_19D603278()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_19D603288()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_19D603298()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_19D6032A8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_19D6032B8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_19D6032C8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_19D6032D8()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_19D6032E8()
{
  return MEMORY[0x1F4183BE8]();
}

uint64_t sub_19D6032F8()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_19D603308()
{
  return MEMORY[0x1F4183C40]();
}

uint64_t sub_19D603318()
{
  return MEMORY[0x1F4183C60]();
}

uint64_t sub_19D603328()
{
  return MEMORY[0x1F4183C88]();
}

uint64_t sub_19D603338()
{
  return MEMORY[0x1F4183EA0]();
}

uint64_t sub_19D603348()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_19D603358()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_19D603368()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_19D603378()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_19D603388()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_19D603398()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_19D6033A8()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_19D6033B8()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_19D6033C8()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_19D6033D8()
{
  return MEMORY[0x1F4187C08]();
}

uint64_t sub_19D6033E8()
{
  return MEMORY[0x1F4187C38]();
}

uint64_t sub_19D603408()
{
  return MEMORY[0x1F4187C60]();
}

uint64_t sub_19D603418()
{
  return MEMORY[0x1F4187C70]();
}

uint64_t sub_19D603428()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_19D603438()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_19D603468()
{
  return MEMORY[0x1F4187E40]();
}

uint64_t sub_19D603478()
{
  return MEMORY[0x1F4187E60]();
}

uint64_t sub_19D603488()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_19D603498()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_19D6034A8()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_19D6034B8()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_19D6034C8()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_19D6034D8()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t sub_19D6034E8()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_19D6034F8()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_19D603508()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_19D603518()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_19D603528()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_19D603538()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_19D603548()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_19D603558()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_19D603568()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_19D603578()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_19D603588()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_19D603598()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_19D6035B8()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_19D6035C8()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_19D6035D8()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_19D6035E8()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_19D6035F8()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_19D603608()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_19D603618()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_19D603628()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_19D603638()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_19D603648()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_19D603658()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_19D603678()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_19D603688()
{
  return MEMORY[0x1F4185768]();
}

uint64_t sub_19D6036A8()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_19D6036B8()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_19D6036C8()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_19D6036D8()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_19D6036E8()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_19D6036F8()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_19D603708()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_19D603718()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_19D603728()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_19D603738()
{
  return MEMORY[0x1F4185F68]();
}

uint64_t sub_19D603748()
{
  return MEMORY[0x1F4188198]();
}

uint64_t sub_19D603758()
{
  return MEMORY[0x1F41881A0]();
}

uint64_t sub_19D603768()
{
  return MEMORY[0x1F41881A8]();
}

uint64_t sub_19D603778()
{
  return MEMORY[0x1F41881B0]();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1F4115F10]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x1F40D5288](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x1F40D5290](message);
}

CFStringRef CFHTTPMessageCopyHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField)
{
  return (CFStringRef)MEMORY[0x1F40D5298](message, headerField);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1F40D52D8](alloc, requestMethod, url, httpVersion);
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x1F40D52E0](alloc, statusCode, statusDescription, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1F40D7BA8]();
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8000](stream, buffer, bufferLength);
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x1F40D8010](stream, streamEvents, clientCB, clientContext);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1F40D8230]();
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8290](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1F40D8298](allocator, *(void *)&sock, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x1F40D82B0](s);
}

CFOptionFlags CFSocketGetSocketFlags(CFSocketRef s)
{
  return MEMORY[0x1F40D82B8](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1F4116180]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1F4116578]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1F40E8ED8](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40E8F20](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1F40E8F70](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1F40E8FA8](*(void *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1F40E9168](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1F40E9238](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E9268](name);
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1F417CDD0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1F417CDF8]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1F417CE60]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t RandomBytes()
{
  return MEMORY[0x1F4116A00]();
}

uint64_t SCDynamicStoreAddWatchedKey()
{
  return MEMORY[0x1F4101D68]();
}

CFStringRef SCDynamicStoreCopyLocalHostName(SCDynamicStoreRef store)
{
  return (CFStringRef)MEMORY[0x1F4101D90](store);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateHostNames(CFAllocatorRef allocator)
{
  return (CFStringRef)MEMORY[0x1F4101DD0](allocator);
}

uint64_t SCDynamicStoreRemoveWatchedKey()
{
  return MEMORY[0x1F4101DF8]();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1F40F70F0](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1F4116BA0]();
}

uint64_t WiFiCopyCurrentNetworkInfo()
{
  return MEMORY[0x1F4116C28]();
}

uint64_t WiFiCopyCurrentNetworkInfoEx()
{
  return MEMORY[0x1F4116C30]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1F412FD90]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1F412FE00]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1F412FE78]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1F412FEA0]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x1F412FED8]();
}

uint64_t WiFiManagerClientGetWoWState()
{
  return MEMORY[0x1F412FEE8]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1F412FEF0]();
}

uint64_t WiFiManagerClientRegisterWowStateChangedCallback()
{
  return MEMORY[0x1F412FF10]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1F412FF20]();
}

uint64_t WiFiManagerClientSetWoWState()
{
  return MEMORY[0x1F412FF48]();
}

uint64_t WiFiNetworkCopyBSSIDData()
{
  return MEMORY[0x1F412FF60]();
}

uint64_t WiFiNetworkGetRSSI()
{
  return MEMORY[0x1F412FFC0]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1F412FFC8]();
}

uint64_t WiFiNetworkRequiresPassword()
{
  return MEMORY[0x1F4130058]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1F40D8BB0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFHTTPServerConnectionCopyProperty()
{
  return MEMORY[0x1F40D5610]();
}

uint64_t _CFHTTPServerConnectionInvalidate()
{
  return MEMORY[0x1F40D5618]();
}

uint64_t _CFHTTPServerConnectionIsValid()
{
  return MEMORY[0x1F40D5620]();
}

uint64_t _CFHTTPServerConnectionSetClient()
{
  return MEMORY[0x1F40D5628]();
}

uint64_t _CFHTTPServerConnectionSetDispatchQueue()
{
  return MEMORY[0x1F40D5630]();
}

uint64_t _CFHTTPServerCopyProperty()
{
  return MEMORY[0x1F40D5638]();
}

uint64_t _CFHTTPServerCreateService()
{
  return MEMORY[0x1F40D5640]();
}

uint64_t _CFHTTPServerInvalidate()
{
  return MEMORY[0x1F40D5648]();
}

uint64_t _CFHTTPServerIsValid()
{
  return MEMORY[0x1F40D5650]();
}

uint64_t _CFHTTPServerRequestCopyBodyStream()
{
  return MEMORY[0x1F40D5658]();
}

uint64_t _CFHTTPServerRequestCopyProperty()
{
  return MEMORY[0x1F40D5660]();
}

uint64_t _CFHTTPServerRequestCreateResponseMessage()
{
  return MEMORY[0x1F40D5668]();
}

uint64_t _CFHTTPServerResponseCreateWithData()
{
  return MEMORY[0x1F40D5670]();
}

uint64_t _CFHTTPServerResponseEnqueue()
{
  return MEMORY[0x1F40D5678]();
}

uint64_t _CFHTTPServerResponseSetClient()
{
  return MEMORY[0x1F40D5680]();
}

uint64_t _CFHTTPServerSetDispatchQueue()
{
  return MEMORY[0x1F40D5688]();
}

uint64_t _CFHTTPServerSetProperty()
{
  return MEMORY[0x1F40D5690]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CA6A0]();
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x1F4116C90]();
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

uint64_t dispatch_block_create_with_voucher()
{
  return MEMORY[0x1F40CB9D0]();
}

uint64_t dispatch_block_create_with_voucher_and_qos_class()
{
  return MEMORY[0x1F40CB9D8]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
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

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1F40CBBE8](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1F40CBCA0](source);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1F40CC648](*(void *)&a1, a2);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1F40CC670](*(void *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

nw_browse_descriptor_t nw_browse_descriptor_create_bonjour_service(const char *type, const char *domain)
{
  return (nw_browse_descriptor_t)MEMORY[0x1F40F29A0](type, domain);
}

void nw_browse_descriptor_set_include_txt_record(nw_browse_descriptor_t descriptor, BOOL include_txt_record)
{
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return (nw_endpoint_t)MEMORY[0x1F40F29B8](result);
}

nw_txt_record_t nw_browse_result_copy_txt_record_object(nw_browse_result_t result)
{
  return (nw_txt_record_t)MEMORY[0x1F40F29C0](result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return MEMORY[0x1F40F29C8](old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return (nw_browser_t)MEMORY[0x1F40F29D8](descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return (nw_path_t)MEMORY[0x1F40F2A90](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

uint64_t nw_endpoint_create_srv()
{
  return MEMORY[0x1F40F2EB8]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1F40F2ED0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_domain(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EE0](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_name(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EE8](endpoint);
}

const char *__cdecl nw_endpoint_get_bonjour_service_type(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1F40F2EF0](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x1F40F2F20](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1F40F2F50](error);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1F40F3238]();
}

void nw_ip_options_set_version(nw_protocol_options_t options, nw_ip_version_t version)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1F40F3418](parameters);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34D0](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34E0](configure_dtls, configure_udp);
}

void nw_parameters_prohibit_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_path_copy_endpoint()
{
  return MEMORY[0x1F40F3810]();
}

nw_protocol_options_t nw_protocol_stack_copy_internet_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3B58](stack);
}

BOOL nw_txt_record_apply(nw_txt_record_t txt_record, nw_txt_record_applier_t applier)
{
  return MEMORY[0x1F40F3F70](txt_record, applier);
}

size_t nw_txt_record_get_key_count(nw_txt_record_t txt_record)
{
  return MEMORY[0x1F40F3F80](txt_record);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return MEMORY[0x1F40CD140](activity, parent_id);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

uint64_t os_transaction_needs_more_time()
{
  return MEMORY[0x1F40CD5B0]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
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

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD8B8](*(void *)&pid, buffer, *(void *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1F40CDCC0](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1F40CDF48](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1F4186570]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1F4186638]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1F4186640]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1F4186648]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1F4186658]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1F4186690]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1F41866A0]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1F4186730]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1F41867B8]();
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

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x1F4188278]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x1F4188290]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

uint64_t voucher_copy_without_importance()
{
  return MEMORY[0x1F40CE720]();
}