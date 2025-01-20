id getCAFenceHandleClass()
{
  void *v0;
  id v1;
  void v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCAFenceHandleClass_softClass;
  v7 = getCAFenceHandleClass_softClass;
  if (!getCAFenceHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCAFenceHandleClass_block_invoke;
    v3[3] = &unk_1E5441630;
    v3[4] = &v4;
    __getCAFenceHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AA0CEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___getHIDEventSystemClient_block_invoke()
{
  v9[3] = *MEMORY[0x1E4F143B8];
  if (!_getHIDEventSystemClient___hidEventSystemClientRef)
  {
    v0 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v1 = [v0 bundleIdentifier];
    if (!v1) {
      __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(v0);
    }
    v2 = (void *)v1;
    if (BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken != -1) {
      dispatch_once(&BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken, &__block_literal_global_83);
    }
    int v3 = BKSHIDServicesDeviceHasHighFrequencyDigitizer_hasHighFrequencyDigitizer;
    v9[0] = v2;
    v8[0] = @"bundleID";
    v8[1] = @"pid";
    uint64_t v4 = [NSNumber numberWithInt:getpid()];
    v5 = (void *)v4;
    v8[2] = @"HighFrequency";
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    if (!v3) {
      uint64_t v6 = MEMORY[0x1E4F1CC28];
    }
    v9[1] = v4;
    v9[2] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

    _getHIDEventSystemClient___hidEventSystemClientRef = IOHIDEventSystemClientCreateWithType();
  }
}

uint64_t migHelperHash(unsigned int *a1)
{
  return *a1;
}

id BKLogEventDeliveryBuffering()
{
  if (BKLogEventDeliveryBuffering_onceToken != -1) {
    dispatch_once(&BKLogEventDeliveryBuffering_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)BKLogEventDeliveryBuffering___logObj;
  return v0;
}

id BKLogTouchEvents()
{
  if (BKLogTouchEvents_onceToken != -1) {
    dispatch_once(&BKLogTouchEvents_onceToken, &__block_literal_global_43);
  }
  v0 = (void *)BKLogTouchEvents___logObj;
  return v0;
}

uint64_t migHelperGetPort(unsigned int *a1)
{
  return *a1;
}

id BKLogTouchDeliveryPolicy()
{
  if (BKLogTouchDeliveryPolicy_onceToken != -1) {
    dispatch_once(&BKLogTouchDeliveryPolicy_onceToken, &__block_literal_global_40);
  }
  v0 = (void *)BKLogTouchDeliveryPolicy___logObj;
  return v0;
}

NSObject *_BKDecodeArrayOfClass(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a3;
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), a2, 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:v6];

  if (!v8)
  {
LABEL_18:
    v15 = MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  id v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = BKLogEventDelivery();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = (id)objc_opt_class();
      id v16 = v26;
      _os_log_error_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_ERROR, "expected NSArray, got %{public}@", buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v17 = BKLogEventDelivery();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v19 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v26 = a2;
            __int16 v27 = 2114;
            v28 = v19;
            id v20 = v19;
            _os_log_error_impl(&dword_18AA0B000, v17, OS_LOG_TYPE_ERROR, "expected %{public}@, got %{public}@", buf, 0x16u);
          }
          goto LABEL_17;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v15 = v10;
LABEL_19:

  return v15;
}

uint64_t BKSHIDEventContainsUpdates()
{
  if (IOHIDEventGetType() != 11) {
    return 0;
  }
  uint64_t result = IOHIDEventGetIntegerValue();
  if (result) {
    return IOHIDEventGetIntegerValue() != 0;
  }
  return result;
}

id BKLogBacklight()
{
  if (BKLogBacklight_onceToken != -1) {
    dispatch_once(&BKLogBacklight_onceToken, &__block_literal_global_22);
  }
  v0 = (void *)BKLogBacklight___logObj;
  return v0;
}

float BKSDisplayServicesGetExternalDisplayScale(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = [getCADisplayClass() displays];
    id v3 = [v2 firstObject];

    if (v3 == v1)
    {
      int v6 = 1065353216;
      _BKSDisplayServicesGetMainScreenInfo(0, 0, &v6, 0, 0, 0);
      float v4 = *(float *)&v6;
    }
    else
    {
      float v4 = _BKSGetExternalDisplayScale(v1);
    }
  }
  else
  {
    float v4 = 0.0;
  }

  return v4;
}

id getCADisplayClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getCADisplayClass_softClass;
  uint64_t v7 = getCADisplayClass_softClass;
  if (!getCADisplayClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCADisplayClass_block_invoke;
    v3[3] = &unk_1E5441630;
    v3[4] = &v4;
    __getCADisplayClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AA14AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double _BKSGetExternalDisplayScale(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"display != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [NSString stringWithUTF8String:"CGFloat _BKSGetExternalDisplayScale(CADisplay *__strong _Nonnull)"];
      *(_DWORD *)buf = 138544130;
      id v9 = v7;
      __int16 v10 = 2114;
      uint64_t v11 = @"BKSDisplayServices.m";
      __int16 v12 = 1024;
      int v13 = 364;
      __int16 v14 = 2114;
      v15 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA14C64);
  }
  v2 = v1;
  unint64_t v3 = [v1 pointScale];
  if (([v2 tag] & 0xE0) != 0)
  {
    uint64_t v4 = [v2 currentMode];
    unint64_t v3 = [v4 preferredScale];
  }
  return (double)v3;
}

id BKLogEventDelivery()
{
  if (BKLogEventDelivery_onceToken != -1) {
    dispatch_once(&BKLogEventDelivery_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)BKLogEventDelivery___logObj;
  return v0;
}

__CFString *NSStringFromBKSHIDEventDeferringPolicyStatus(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5440BA8[a1];
  }
  return v1;
}

id BKLogOrientationGlobal()
{
  if (BKLogOrientationGlobal_onceToken != -1) {
    dispatch_once(&BKLogOrientationGlobal_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)BKLogOrientationGlobal___logObj;
  return v0;
}

id BKLogUISensor()
{
  if (BKLogUISensor_onceToken != -1) {
    dispatch_once(&BKLogUISensor_onceToken, &__block_literal_global_34);
  }
  v0 = (void *)BKLogUISensor___logObj;
  return v0;
}

__CFString *NSStringFromBKSHIDEventSource(uint64_t a1)
{
  if (a1 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:0x%X>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5441A20[a1];
  }
  return v1;
}

void BKSHIDServicesCancelTouchesOnMainDisplay()
{
}

uint64_t BKHIDServicesGetNonFlatDeviceOrientation()
{
  int v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetNonFlatDeviceOrientation(v0, &v2);
  return v2;
}

uint64_t _BKSHIDGetNonFlatDeviceOrientation(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8DAE00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000146)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

double BKSHIDServicesLastUserEventTime()
{
  double v2 = 0.0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetLastUserEventTime(v0, &v2);
  return v2;
}

uint64_t _BKSHIDGetLastUserEventTime(int a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x5B8DAC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 6000144)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v6 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v10;
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&msg[32] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v6;
}

BOOL BKSDisplayServicesDisplayIsTethered()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayDisplayIsTethered(v0, &v2);
  return v2 != 0;
}

uint64_t _BKSDisplayDisplayIsTethered(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B917900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6001117)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetOrientationClientEventsEnabled(int a1, int a2, char a3, char a4)
{
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[28] = a2;
  int v7 = 1310720;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  char v9 = a3;
  __int16 v10 = 0;
  char v11 = 0;
  char v12 = a4;
  __int16 v13 = 0;
  char v14 = 0;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(void *)&msg[20] = 0x1005B8DB5;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v4;
}

float BKSDisplayBrightnessGetCurrent()
{
  float v2 = 1.0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetCurrentDisplayBrightness(v0, &v2);
  return v2;
}

uint64_t _BKSHIDGetCurrentDisplayBrightness(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8DB600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000154)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

CFRunLoopSourceRef BKCreateMIGServerSourceWithContext(uint64_t a1, int a2, CFIndex a3, uint64_t a4)
{
  pthread_once(&__BKMIGServerCalloutContextKeyOnce, (void (*)(void))makeCalloutContextKey);
  uint64_t v8 = malloc_type_malloc(0x18uLL, 0x10A0040FC6C5850uLL);
  *(_DWORD *)uint64_t v8 = a2;
  v8[1] = a1;
  v8[2] = a4;
  context.version = 1;
  context.info = v8;
  context.retain = 0;
  context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F14838];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))migHelperCopyDescription;
  context.equal = (Boolean (__cdecl *)(const void *, const void *))migHelperEqual;
  context.hash = (CFHashCode (__cdecl *)(const void *))migHelperHash;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperGetPort;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))migHelperRecievePortCallout;
  CFRunLoopSourceRef v9 = CFRunLoopSourceCreate(0, a3, &context);
  if (!v9) {
    free(v8);
  }
  return v9;
}

uint64_t _BKSHIDSetAccelerometerClientEventsEnabled(int a1, int a2, mach_msg_timeout_t timeout, double a4, float a5, float a6, float a7)
{
  memset(&msg[4], 0, 32);
  *(_DWORD *)&msg[28] = a2;
  int v11 = 1310720;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  double v13 = a4;
  float v14 = a5;
  float v15 = a6;
  float v16 = a7;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(void *)&msg[20] = 0x1005B8DB4;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 17, 0x44u, 0, 0, timeout, 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v8;
}

void BKSHIDServicesCancelTouchesOnDisplay(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  bzero(buffer, 0x400uLL);
  if (!v1 || CFStringGetCString(v1, buffer, 1024, 0x8000100u))
  {
    mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDCancelTouchesOnDisplay(v2, buffer);
  }
}

uint64_t _BKSHIDCancelTouchesOnDisplay(mach_port_name_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)name = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v8 = 0x5B8D9A00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t BKSDisplayServicesStart()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  int v8 = 0;
  int v9 = 1065353216;
  __int16 v7 = 0;
  uint64_t MainScreenInfo = _BKSDisplayServicesGetMainScreenInfo((_DWORD *)&v10 + 1, &v10, &v9, &v8, (BOOL *)&v7 + 1, (BOOL *)&v7);
  if (MainScreenInfo == -308)
  {
    uint64_t MainScreenInfo = _BKSDisplayServicesGetMainScreenInfo((_DWORD *)&v10 + 1, &v10, &v9, &v8, (BOOL *)&v7 + 1, (BOOL *)&v7);
    if (MainScreenInfo == -308)
    {
      uint64_t v6 = BKLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "Exiting because we are unable to communicate with backboardd.", buf, 2u);
      }

      exit(-1);
    }
  }
  if (MainScreenInfo)
  {
    mach_port_name_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"backboardd isn't running -- or we couldn't talk to it -- result: %s (%X)", mach_error_string(MainScreenInfo), MainScreenInfo);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v3 = [NSString stringWithUTF8String:"Boolean BKSDisplayServicesStart(void)"];
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = v3;
      __int16 v13 = 2114;
      float v14 = @"BKSDisplayServices.m";
      __int16 v15 = 1024;
      int v16 = 113;
      __int16 v17 = 2114;
      v18 = v2;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v2 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1AD38);
  }
  GSSetMainScreenInfo();
  if (!(HIBYTE(v7) | v7) && (*((float *)&v10 + 1) <= 0.0 || *(float *)&v10 <= 0.0))
  {
    mach_msg_size_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"GetMainScreenInfo width: %f height: %f", *((float *)&v10 + 1), *(float *)&v10);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [NSString stringWithUTF8String:"Boolean BKSDisplayServicesStart(void)"];
      *(_DWORD *)buf = 138544130;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      float v14 = @"BKSDisplayServices.m";
      __int16 v15 = 1024;
      int v16 = 118;
      __int16 v17 = 2114;
      v18 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1AE0CLL);
  }
  return 1;
}

id BKSHIDEventGetConciseDescription(void *a1)
{
  int Type = IOHIDEventGetType();
  switch(Type)
  {
    case 1:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionVendorDefined();
      goto LABEL_34;
    case 2:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionButton();
      goto LABEL_34;
    case 3:
      mach_msg_size_t v4 = BKSHIDEventGetBaseAttributes(a1);
      uint64_t v5 = [v4 source];

      uint64_t v3 = _BKSHIDEventGetConciseDescriptionKeyboard(a1, v5);
      goto LABEL_34;
    case 4:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionTranslation();
      goto LABEL_34;
    case 5:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionRotation();
      goto LABEL_34;
    case 6:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionScroll();
      goto LABEL_34;
    case 7:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionScale();
      goto LABEL_34;
    case 8:
    case 9:
    case 10:
    case 12:
    case 13:
    case 15:
    case 16:
      goto LABEL_5;
    case 11:
      uint64_t v6 = NSString;
      id v7 = objc_alloc_init(MEMORY[0x1E4F4F720]);
      int v8 = BKSHIDEventGetDigitizerAttributes(a1);
      int v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 token];
        id v11 = (id)[v7 appendObject:v10 withName:@"token"];

        __int16 v12 = [v9 options];
        if ((v12 & 0x200) != 0) {
          [v7 appendString:@"more" withName:0];
        }
        if ((v12 & 0x400) != 0) {
          [v7 appendString:@"abs" withName:0];
        }
        _BKSHIDEventAppendEventFlags((uint64_t)a1, v7);
        unsigned int v13 = [v9 touchStreamIdentifier];
        if (v13)
        {
          float v14 = NSStringFromBKSTouchStreamIdentifier(v13);
          [v7 appendString:v14 withName:@"strm"];
        }
        if ([v9 systemGestureStateChange]) {
          [v7 appendString:@"systemGestureStateChange" withName:0];
        }
        if ([v9 systemGesturesPossible]) {
          [v7 appendString:@"sgp" withName:0];
        }
        uint64_t v15 = [v9 activeModifiers];
        if (v15)
        {
          v40[0] = MEMORY[0x1E4F143A8];
          v40[1] = 3221225472;
          v40[2] = ___BKSHIDEventConciseDescriptionDigitizer_block_invoke;
          v40[3] = &__block_descriptor_40_e43_v16__0___BSDescriptionStringAppendTarget__8l;
          v40[4] = v15;
          [v7 appendCustomFormatWithName:@"modifiers" block:v40];
        }
        unint64_t v16 = [v9 sceneTouchBehavior];
        if (v16)
        {
          __int16 v17 = NSStringFromBKSSceneHostTouchBehavior(v16);
          [v7 appendString:v17 withName:@"behavior"];
        }
      }
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      if (IntegerValue) {
        id v19 = (id)[v7 appendInteger:IntegerValue withName:@"gen"];
      }
      id v20 = IOHIDEventGetChildren();
      long long v21 = [v9 pathAttributes];
      uint64_t v22 = [v21 count];
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x2020000000;
      uint64_t v39 = 0;
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      uint64_t v30 = ___BKSHIDEventConciseDescriptionDigitizer_block_invoke_2;
      v31 = &unk_1E54419B0;
      id v23 = v7;
      id v32 = v23;
      v34 = &v36;
      uint64_t v35 = v22;
      id v24 = v21;
      id v33 = v24;
      [v23 appendCollection:v20 withName:@"subevents" itemBlock:&v28];
      if (!v37[3]) {
        _BKSHIDEventAppendEventFlags((uint64_t)a1, v23);
      }
      v25 = [v23 description];

      _Block_object_dispose(&v36, 8);
      id v26 = [v6 stringWithFormat:@"Digitizer %@", v25, v28, v29, v30, v31];

      goto LABEL_35;
    case 14:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionProximity(a1);
      goto LABEL_34;
    case 17:
      uint64_t v3 = _BKSHIDEventGetConciseDescriptionPointer(a1);
      goto LABEL_34;
    default:
      if (Type == 39)
      {
        uint64_t v3 = _BKSHIDEventGetConciseDescriptionGenericGesture();
      }
      else
      {
LABEL_5:
        uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@", IOHIDEventTypeGetName()];
      }
LABEL_34:
      id v26 = (void *)v3;
LABEL_35:
      return v26;
  }
}

void sub_18AA1B2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _BKSHIDEventGetConciseDescriptionProximity(void *a1)
{
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v3 = BKSHIDEventGetProximityAttributes(a1);
  mach_msg_size_t v4 = NSString;
  uint64_t v5 = NSStringFromBKSHIDServicesProximityDetectionMode([v3 proximityDetectionMode]);
  uint64_t v6 = (void *)v5;
  if (IntegerValue)
  {
    id v7 = BKSNSStringFromIOHIDProximityDetectionMask(IntegerValue);
    int v8 = [v4 stringWithFormat:@"Proximity [%@]: (%@)", v6, v7];
  }
  else
  {
    int v8 = [v4 stringWithFormat:@"Proximity [%@]: <none>", v5];
  }

  return v8;
}

_DWORD *BKSHIDEventGetProximityAttributes(void *a1)
{
  int Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 14 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1) {
      goto LABEL_8;
    }
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (!AttributeDataPtr) {
      goto LABEL_9;
    }
    if (AttributeDataPtr[1] && *(unsigned char *)AttributeDataPtr == 7)
    {
      BKSHIDEventGetBaseAttributes(a1);
      AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
LABEL_9:
  return AttributeDataPtr;
}

void BKSHIDServicesSetHitTestRegionsForDisplay(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  mach_msg_size_t v4 = a2;
  bzero(buffer, 0x400uLL);
  if (v4) {
    BOOL v5 = CFStringGetCString(v4, buffer, 1024, 0x8000100u) != 0;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v3);
  id v7 = (void *)v6;
  if (v3 && !v6)
  {
    int v8 = BKLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543362;
      id v17 = v3;
      int v9 = "Error encoding hittestRegions: %{public}@";
      uint64_t v10 = v8;
      uint32_t v11 = 12;
LABEL_12:
      _os_log_error_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v16, v11);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (v5)
  {
    mach_port_t v12 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    id v13 = v7;
    int v14 = _BKSHIDSetHitTestRegionsForDisplay(v12, [v13 bytes], objc_msgSend(v13, "length"), buffer);
    if (v14)
    {
      int v15 = v14;
      int v8 = BKLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v16 = 67109120;
        LODWORD(v17) = v15;
        int v9 = "Error sending hittestRegions: 0x%x";
        uint64_t v10 = v8;
        uint32_t v11 = 8;
        goto LABEL_12;
      }
LABEL_13:
    }
  }
}

uint64_t BKSHIDEventDigitizerGetTouchLocus(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    BOOL v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathCollectionEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "BKSHIDTouchLocus BKSHIDEventDigitizerGetTouchLocus(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      mach_port_t v12 = @"BKSHIDEvent.m";
      __int16 v13 = 1024;
      int v14 = 666;
      __int16 v15 = 2114;
      int v16 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1B784);
  }
  if (!a2)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BKSHIDTouchLocus BKSHIDEventDigitizerGetTouchLocus(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      uint64_t v10 = v8;
      __int16 v11 = 2114;
      mach_port_t v12 = @"BKSHIDEvent.m";
      __int16 v13 = 1024;
      int v14 = 667;
      __int16 v15 = 2114;
      int v16 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1B858);
  }
  mach_port_name_t v2 = _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  uint64_t v3 = [v2 locus];

  return v3;
}

id _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(void *a1, uint64_t a2)
{
  id v2 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    if (IOHIDEventGetType() == 11)
    {
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      BOOL v5 = BKSHIDEventGetDigitizerAttributes(a1);
      uint64_t v6 = v5;
      if (v5)
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = objc_msgSend(v5, "pathAttributes", 0);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              mach_port_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
              if ([v12 pathIndex] == IntegerValue)
              {
                id v2 = v12;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
        id v2 = 0;
LABEL_16:
      }
      else
      {
        id v2 = 0;
      }
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

_DWORD *BKSHIDEventGetDigitizerAttributes(void *a1)
{
  int Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 11 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1) {
      goto LABEL_8;
    }
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (!AttributeDataPtr) {
      goto LABEL_9;
    }
    if (AttributeDataPtr[1] && *(unsigned char *)AttributeDataPtr == 2)
    {
      BKSHIDEventGetBaseAttributes(a1);
      AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
LABEL_9:
  return AttributeDataPtr;
}

id BKSHIDEventGetBaseAttributes(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = _BKSHIDEventGetAttachment((uint64_t)a1, @"backboardd-attr-cache-16000026", v2);
  mach_msg_size_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_3:
    a1 = v5;
    goto LABEL_14;
  }
  if (a1)
  {
    if (IOHIDEventGetAttributeDataLength() >= 1)
    {
      AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr();
      if (AttributeDataPtr)
      {
        if (*((_DWORD *)AttributeDataPtr + 1))
        {
          int v7 = *AttributeDataPtr;
          if ((v7 - 1) < 7)
          {
            uint64_t v8 = objc_opt_class();
            BKSHIDEventAttributeDataWithExpectedClass((uint64_t)a1, v8);
            id v5 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_3;
          }
          uint64_t v9 = BKLogEventDelivery();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            IOHIDEventGetType();
            v11[0] = 67109378;
            v11[1] = v7;
            __int16 v12 = 2082;
            uint64_t TypeString = IOHIDEventGetTypeString();
            _os_log_error_impl(&dword_18AA0B000, v9, OS_LOG_TYPE_ERROR, "unsupported type for attribute decode:%d -- %{public}s event", (uint8_t *)v11, 0x12u);
          }
        }
      }
    }
    a1 = 0;
  }
LABEL_14:

  return a1;
}

id _BKSHIDEventGetAttachment(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = (void *)_IOHIDEventCopyAttachment();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
  }
  else
  {
    if (v5)
    {
      int v7 = BKLogEventDelivery();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138543874;
        id v11 = v4;
        __int16 v12 = 2114;
        uint64_t v13 = a3;
        __int16 v14 = 2114;
        id v15 = (id)objc_opt_class();
        id v9 = v15;
        _os_log_error_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_ERROR, "failed to get attachment for key: %{public}@ expected class %{public}@ but got class %{public}@ ", (uint8_t *)&v10, 0x20u);
      }
    }
    id v6 = 0;
  }

  return v6;
}

id BKSHIDEventAttributeDataWithExpectedClass(uint64_t a1, uint64_t a2)
{
  *(void *)&v13[5] = *MEMORY[0x1E4F143B8];
  if (a1
    && IOHIDEventGetAttributeDataLength() >= 1
    && (AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr()) != 0
    && *((_DWORD *)AttributeDataPtr + 1))
  {
    int v5 = *AttributeDataPtr;
    if ((v5 - 1) >= 7)
    {
      id v6 = BKLogEventDelivery();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        IOHIDEventGetType();
        *(_DWORD *)buf = 67109378;
        v13[0] = v5;
        LOWORD(v13[1]) = 2082;
        *(void *)((char *)&v13[1] + 2) = IOHIDEventGetTypeString();
        _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "unsupported type for attribute decode:%d -- %{public}s event", buf, 0x12u);
      }
      int v7 = 0;
    }
    else
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", AttributeDataPtr + 8);
      id v11 = 0;
      int v7 = [MEMORY[0x1E4F4F808] decodeObjectOfClass:a2 fromData:v6 error:&v11];
      id v8 = v11;
      if (v7)
      {
        _BKSHIDEventSetAttachment(a1, @"backboardd-attr-cache-16000026");
      }
      else
      {
        int v10 = BKLogEventDelivery();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)uint64_t v13 = v8;
          _os_log_error_impl(&dword_18AA0B000, v10, OS_LOG_TYPE_ERROR, "could not decode attributes:%{public}@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

void BKSHIDEventSetAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 6;
LABEL_13:
    _BKSHIDEventSetAttributes(a1, v6, v3);

    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 7;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 5;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 2;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 4;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = 1;
    goto LABEL_13;
  }
  id v4 = [NSString stringWithFormat:@"don't know what type to use for %@", objc_opt_class()];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetAttributes(IOHIDEventRef _Nonnull, BKSHIDEventBaseAttributes *__strong _Nonnull)");
    *(_DWORD *)buf = 138544130;
    id v8 = v5;
    __int16 v9 = 2114;
    int v10 = @"BKSHIDEvent.m";
    __int16 v11 = 1024;
    int v12 = 494;
    __int16 v13 = 2114;
    __int16 v14 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

void _BKSHIDEventSetAttributes(uint64_t a1, void *a2, char a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v13 = 0;
  id v6 = [MEMORY[0x1E4F4F808] encodeObject:v5 error:&v13];
  id v7 = v13;
  if (v6)
  {
    size_t v8 = [v6 length];
    MEMORY[0x1F4188790]();
    int v10 = (char *)&v12 - v9;
    *(uint64_t *)((char *)&v12 - v9) = 0;
    memcpy((char *)&v12 - v9 + 8, (const void *)[v6 bytes], v8);
    char *v10 = a3;
    *((_DWORD *)v10 + 1) = v8;
    IOHIDEventSetAttributeData();
    _BKSHIDEventSetAttachment(a1, @"backboardd-attr-cache-16000026");
  }
  else
  {
    __int16 v11 = BKLogEventDelivery();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v7;
      _os_log_error_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_ERROR, "could not encode attribute data:%{public}@", buf, 0xCu);
    }
  }
}

void _BKSHIDEventSetAttachment(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (!_IOHIDEventSetAttachment())
  {
    char v3 = BKLogEventDelivery();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "failed to set attachment with key: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

uint64_t _BKSHIDSetHitTestRegionsForDisplay(mach_port_t a1, uint64_t a2, unsigned int a3, char *src)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 448);
  *(_OWORD *)&v13[8] = 0u;
  memset(&name, 0, sizeof(name));
  int v10 = 1;
  uint64_t v11 = a2;
  int v12 = 16777472;
  *(void *)id v13 = a3;
  *(void *)&v13[4] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v13[12] = a3;
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v14, src, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v14, src, 1024);
  }
  *(_DWORD *)&v13[16] = 0;
  *(_DWORD *)&v13[20] = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 64;
  name.msgh_bits = -2147483629;
  name.msgh_remote_port = a1;
  name.msgh_local_port = 0;
  *(void *)&name.msgh_voucher_port = 0x5B8D9D00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&name);
  }
  uint64_t v7 = mach_msg(&name, 1, v6, 0, 0, 0, 0);
  if ((v7 - 268435459) <= 1)
  {
    if ((name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name.msgh_local_port);
    }
    mach_msg_destroy(&name);
  }
  return v7;
}

__CFString *NSStringFromBKSHIDServicesProximityDetectionMode(uint64_t a1)
{
  if a1 < 0x15 && ((0x10307Fu >> a1))
  {
    id v1 = off_1E5441AE8[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%d>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *BKSNSStringFromIOHIDProximityDetectionMask(unsigned int a1)
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28E78] string];
    uint64_t v4 = 0;
    _BKAppendStringForBitmaskDescription(v2, @"LargeBodyContact", a1, 1, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"LargeBodyFarField", a1, 2, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"IrregularObjects", a1, 4, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"EdgeStraddling", a1, 8, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"FlatFingerClasp", a1, 16, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"FingerTouch", a1, 32, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"Receiver", a1, 64, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"SmallObjectsHovering", a1, 128, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"ReceiverCrude", a1, 256, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"ReceiverMonitoring", a1, 512, &v4);
    _BKAppendStringForBitmaskDescription(v2, @"ReceiverCrudeMonitoring", a1, 1024, &v4);
  }
  else
  {
    id v2 = @"<none>";
  }
  return v2;
}

void _BKAppendStringForBitmaskDescription(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  id v10 = a1;
  id v9 = a2;
  if ((a4 & a3) != 0)
  {
    if (*a5 >= 1) {
      [v10 appendString:@"|"];
    }
    [v10 appendString:v9];
    ++*a5;
  }
}

uint64_t BKSHIDServicesSetMinimumBrightnessLevelWithFadeDuration(float a1, float a2)
{
  mach_port_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetMinimumBrightnessLevelWithFadeDuration(v4, a1, a2);
}

uint64_t _BKSDisplayServicesGetMainScreenInfo(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, BOOL *a5, BOOL *a6)
{
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  __int16 v14 = 0;
  int v12 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  uint64_t result = _BKSDisplayGetMainScreenInfo(v12, (_DWORD *)&v16 + 1, &v16, (_DWORD *)&v15 + 1, &v15, (unsigned char *)&v14 + 1, &v14);
  if (a1) {
    *a1 = HIDWORD(v16);
  }
  if (a2) {
    *a2 = v16;
  }
  if (a3) {
    *a3 = HIDWORD(v15);
  }
  if (a4) {
    *a4 = v15;
  }
  if (a5) {
    *a5 = HIBYTE(v14) != 0;
  }
  if (a6) {
    *a6 = (_BYTE)v14 != 0;
  }
  return result;
}

uint64_t _BKSServerPortHelper(const char *a1, mach_port_name_t *a2, CFTypeRef *a3, void (__cdecl *a4)(CFMachPortRef, void *))
{
  pthread_mutex_lock(&BKSServerPortLock);
  mach_port_type_t ptype = 0;
  if (!mach_port_type(*MEMORY[0x1E4F14960], *a2, &ptype) && (ptype & 0x100000) == 0) {
    goto LABEL_7;
  }
  if (*a2) {
    _lock_InvalidatePortHelper((uint64_t)a1, a2, a3);
  }
  if (!bootstrap_look_up(*MEMORY[0x1E4F14638], a1, a2) && *a2 + 1 >= 2)
  {
    char v8 = 0;
    *a3 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *a2, 0, 0, 0);
  }
  else
  {
LABEL_7:
    char v8 = 1;
  }
  uint64_t v9 = *a2;
  pthread_mutex_unlock(&BKSServerPortLock);
  if ((v8 & 1) == 0 && *a3) {
    CFMachPortSetInvalidationCallBack((CFMachPortRef)*a3, a4);
  }
  return v9;
}

uint64_t _BKSDisplayGetMainScreenInfo(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, unsigned char *a6, unsigned char *a7)
{
  long long v22 = 0u;
  long long v23 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x5B917500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v15 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v16 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 6001113)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 60)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v16 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v19 = DWORD1(v22);
                *a2 = v22;
                *a3 = v19;
                int v20 = HIDWORD(v22);
                *a4 = DWORD2(v22);
                *a5 = v20;
                *a6 = v23;
                *a7 = BYTE4(v23);
                return v16;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v17 = 1;
            }
            else {
              BOOL v17 = *(_DWORD *)&msg[32] == 0;
            }
            if (v17) {
              uint64_t v16 = 4294966996;
            }
            else {
              uint64_t v16 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v16 = 4294966996;
      }
      else
      {
        uint64_t v16 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v16;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v16 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v16;
}

uint64_t BKSHIDServicesDeviceHasHighFrequencyDigitizer()
{
  if (BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken != -1) {
    dispatch_once(&BKSHIDServicesDeviceHasHighFrequencyDigitizer_onceToken, &__block_literal_global_83);
  }
  return BKSHIDServicesDeviceHasHighFrequencyDigitizer_hasHighFrequencyDigitizer;
}

uint64_t BKSDisplayServicesGetMainScreenInfo(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  return _BKSDisplayServicesGetMainScreenInfo(a1, a2, a3, a4, 0, 0);
}

id NSStringFromBKSSceneHostTouchBehavior(unint64_t a1)
{
  if (a1 >= 3)
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%d>", a1);
  }
  else
  {
    id v1 = (void *)*((void *)&off_1E54418D8 + a1);
  }
  return v1;
}

__CFString *NSStringFromBKSHIDEventHardwareType(unint64_t a1)
{
  if (a1 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:0x%lX>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5441750[a1];
  }
  return v1;
}

id BKLogEventDeliveryMatching()
{
  if (BKLogEventDeliveryMatching_onceToken != -1) {
    dispatch_once(&BKLogEventDeliveryMatching_onceToken, &__block_literal_global_13);
  }
  int v0 = (void *)BKLogEventDeliveryMatching___logObj;
  return v0;
}

uint64_t makeCalloutContextKey()
{
  return pthread_key_create((pthread_key_t *)&__BKMIGServerCalloutContextKey, 0);
}

uint64_t _BKSHIDSetMinimumBrightnessLevelWithFadeDuration(mach_port_t a1, float a2, float a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  float v7 = a2;
  float v8 = a3;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000004;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t __BKSHIDServicesDeviceHasHighFrequencyDigitizer_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  BKSHIDServicesDeviceHasHighFrequencyDigitizer_hasHighFrequencyDigitizer = result;
  return result;
}

id BKLogDisplay()
{
  if (BKLogDisplay_onceToken != -1) {
    dispatch_once(&BKLogDisplay_onceToken, &__block_literal_global_25);
  }
  int v0 = (void *)BKLogDisplay___logObj;
  return v0;
}

uint64_t BKSHIDDigitizerEventIsFirstTouchDown()
{
  if ((IOHIDEventGetIntegerValue() & 2) == 0) {
    return 0;
  }
  uint64_t result = IOHIDEventGetIntegerValue();
  if (result)
  {
    CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
    if (!Children) {
      __assert_rtn("BKSHIDDigitizerEventIsFirstTouchDown", "BKSHIDEvent.m", 815, "pathEvents");
    }
    CFArrayRef v2 = Children;
    CFIndex Count = CFArrayGetCount(Children);
    if (Count >= 1)
    {
      CFIndex v4 = Count;
      CFIndex v5 = 0;
      while (1)
      {
        CFArrayGetValueAtIndex(v2, v5);
        if (IOHIDEventGetType() == 11)
        {
          char IntegerValue = IOHIDEventGetIntegerValue();
          uint64_t v7 = IOHIDEventGetIntegerValue();
          BOOL v8 = IOHIDEventGetIntegerValue() == 0;
          if (v7) {
            BOOL v8 = 1;
          }
          int v9 = v8 | ((unint64_t)(IntegerValue & 2) >> 1);
          BOOL v10 = (IntegerValue & 2) == 0 || v7 == 0;
          if (v9 == 1 && v10) {
            break;
          }
        }
        if (v4 == ++v5) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  return result;
}

void sub_18AA1FBB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id BKLogMousePointer()
{
  if (BKLogMousePointer_onceToken != -1) {
    dispatch_once(&BKLogMousePointer_onceToken, &__block_literal_global_46);
  }
  int v0 = (void *)BKLogMousePointer___logObj;
  return v0;
}

id BKLogKeyboard()
{
  if (BKLogKeyboard_onceToken != -1) {
    dispatch_once(&BKLogKeyboard_onceToken, &__block_literal_global_49);
  }
  int v0 = (void *)BKLogKeyboard___logObj;
  return v0;
}

void sub_18AA20718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AA20DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __BKLogEventDelivery_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "EventDelivery");
  uint64_t v1 = BKLogEventDelivery___logObj;
  BKLogEventDelivery___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void sub_18AA22E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

id BKLogTouchDeliveryObserver()
{
  if (BKLogTouchDeliveryObserver_onceToken != -1) {
    dispatch_once(&BKLogTouchDeliveryObserver_onceToken, &__block_literal_global_31_6269);
  }
  os_log_t v0 = (void *)BKLogTouchDeliveryObserver___logObj;
  return v0;
}

uint64_t BKSHIDEventRegisterEventCallbackOnRunLoop(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (_getHIDEventSystemClient_onceToken != -1) {
    dispatch_once(&_getHIDEventSystemClient_onceToken, &__block_literal_global_411);
  }
  uint64_t v6 = _getHIDEventSystemClient___hidEventSystemClientRef;
  CFRunLoopGetCurrent();
  IOHIDEventSystemClientScheduleWithRunLoop();
  return MEMORY[0x1F40E8AF0](v6, a1, a2, a3);
}

uint64_t _BKSHIDTouchStreamSetEventDispatchMode(mach_port_t a1, int a2, char a3, char a4, double a5)
{
  int v9 = a2;
  uint64_t v8 = *MEMORY[0x1E4F14068];
  char v10 = a3;
  __int16 v11 = 0;
  char v12 = 0;
  char v13 = a4;
  __int16 v14 = 0;
  char v15 = 0;
  double v16 = a5;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 6000037;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v5 = mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v5;
}

void sub_18AA24974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __BKLogMousePointer_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "MousePointer");
  uint64_t v1 = BKLogMousePointer___logObj;
  BKLogMousePointer___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogDisplay_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "Display");
  uint64_t v1 = BKLogDisplay___logObj;
  BKLogDisplay___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t _BKSHIDVerifyEventAuthenticationMessage(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v12 = 1;
  uint64_t v13 = a2;
  int v14 = 16777472;
  int v15 = a3;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(void *)&v11.msgh_voucher_port = 0x5B8DCC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v11);
    mach_port_t special_reply_port = v11.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (v11.msgh_id == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (v11.msgh_id == 6000176)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              uint64_t v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = HIDWORD(v13) == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = HIDWORD(v13);
            }
            goto LABEL_25;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v11.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v11.msgh_local_port);
    }
    goto LABEL_25;
  }
  return v8;
}

void sub_18AA251F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getFBSSystemServiceClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5441050;
    uint64_t v8 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    CFIndex v4 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"BKSSystemService.m", 15, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("FBSSystemService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"Class getFBSSystemServiceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"BKSSystemService.m", 16, @"Unable to find class %s", "FBSSystemService");

LABEL_10:
    __break(1u);
  }
  getFBSSystemServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _BKSVerifyIsArrayOfNumbers(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

__CFString *NSStringFromBKSHIDEventBackBoardVendorSubtype(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5440880[a1];
  }
  return v1;
}

uint64_t BKSHIDEventGetBackBoardVendorSubtype()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IOHIDEventGetType() != 1
    || IOHIDEventGetIntegerValue() != 65280
    || IOHIDEventGetIntegerValue() != 92)
  {
    return 0;
  }
  if (IOHIDEventGetIntegerValue())
  {
    os_log_t v0 = BKLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      id v1 = "BKSHIDEventGetBackBoardVendorSubtype: unsupported event version";
LABEL_17:
      _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, v1, (uint8_t *)v6, 2u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if ((unint64_t)IOHIDEventGetIntegerValue() <= 3)
  {
    os_log_t v0 = BKLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      id v1 = "BKSHIDEventGetBackBoardVendorSubtype: data too small";
      goto LABEL_17;
    }
LABEL_18:

    return 0;
  }
  DataValue = (unsigned int *)IOHIDEventGetDataValue();
  if (!DataValue)
  {
    os_log_t v0 = BKLogCommon();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6[0]) = 0;
      id v1 = "BKSHIDEventGetBackBoardVendorSubtype: data missing";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  uint64_t v3 = *DataValue;
  if (v3 > 3)
  {
    uint64_t v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_error_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_ERROR, "BKSHIDEventGetBackBoardVendorSubtype: invalid subtype %X", (uint8_t *)v6, 8u);
    }

    return 0;
  }
  return v3;
}

uint64_t BKSHIDEventCreateBackBoardVendorSubtypeEvent(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a1 - 1) >= 3)
  {
    id v2 = [NSString stringWithFormat:@"invalid subtype"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v3 = objc_msgSend(NSString, "stringWithUTF8String:", "IOHIDEventRef  _Nonnull BKSHIDEventCreateBackBoardVendorSubtypeEvent(BKSHIDEventBackBoardVendorSubtype, uint64_t)");
      int v4 = 138544130;
      uint64_t v5 = v3;
      __int16 v6 = 2114;
      uint64_t v7 = @"BKSHIDEventBackBoardVendor.m";
      __int16 v8 = 1024;
      int v9 = 85;
      __int16 v10 = 2114;
      long long v11 = v2;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v4, 0x26u);
    }
    [v2 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA27E60);
  }
  int v4 = a1;
  return IOHIDEventCreateVendorDefinedEvent();
}

void BSDescriptionStreamAppendBKSKeyModifierFlags(void *a1, int a2)
{
  id v3 = a1;
  char v4 = 0;
  if ((a2 & 0x800000) != 0)
  {
    _BKSKeyModifierStringAppend(v3, @"glb", &v4);
    if ((a2 & 0x100000) == 0)
    {
LABEL_3:
      if ((a2 & 0x40000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((a2 & 0x100000) == 0)
  {
    goto LABEL_3;
  }
  _BKSKeyModifierStringAppend(v3, @"cmd", &v4);
  if ((a2 & 0x40000) == 0)
  {
LABEL_4:
    if ((a2 & 0x80000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  _BKSKeyModifierStringAppend(v3, @"ctrl", &v4);
  if ((a2 & 0x80000) == 0)
  {
LABEL_5:
    if ((a2 & 0x20000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  _BKSKeyModifierStringAppend(v3, @"opt", &v4);
  if ((a2 & 0x20000) == 0)
  {
LABEL_6:
    if ((a2 & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  _BKSKeyModifierStringAppend(v3, @"shft", &v4);
  if ((a2 & 0x10000) == 0)
  {
LABEL_7:
    if ((a2 & 0x200000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  _BKSKeyModifierStringAppend(v3, @"capslock", &v4);
  if ((a2 & 0x200000) != 0) {
LABEL_8:
  }
    _BKSKeyModifierStringAppend(v3, @"numpad", &v4);
LABEL_9:
}

void _BKSKeyModifierStringAppend(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a1;
  id v5 = a2;
  if (*a3) {
    [v6 appendString:@"|"];
  }
  else {
    *a3 = 1;
  }
  [v6 appendString:v5];
}

__CFString *NSStringFromBKSKeyModifierFlags(uint64_t a1)
{
  if (a1)
  {
    int v1 = a1;
    id v2 = (__CFString *)objc_opt_new();
    BSDescriptionStreamAppendBKSKeyModifierFlags(v2, v1);
  }
  else
  {
    id v2 = &stru_1ED755B00;
  }
  return v2;
}

__CFString *BKSRestartActionOptionsDescription(char a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = v2;
  if (a1) {
    [v2 addObject:@"HideAppleLogo"];
  }
  if ([v3 count])
  {
    char v4 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    char v4 = @"(none)";
  }

  return v4;
}

_BKSTouchDeliveryPolicyConcreteServerReference *BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler(void *a1)
{
  uint64_t v1 = BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_onceToken, &__block_literal_global_1434);
  }
  id v3 = objc_alloc_init(_BKSTouchDeliveryPolicyConcreteServerReference);
  [(_BKSTouchDeliveryPolicyConcreteServerReference *)v3 setServer:BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server];
  [(_BKSTouchDeliveryPolicyConcreteServerReference *)v3 setErrorHandler:v2];

  return v3;
}

void __BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = objc_alloc_init(_BKSTouchDeliveryPolicyConcreteServerInterface);
  uint64_t v1 = (void *)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server;
  BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server = (uint64_t)v0;

  if (!BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler_server)
  {
    id v2 = [NSString stringWithFormat:@"need a server instance"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v3 = [NSString stringWithUTF8String:"id<BKSTouchDeliveryPolicyServerInterface> BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler(void (^__strong)(NSError *__strong))_block_invoke"];
      int v4 = 138544130;
      id v5 = v3;
      __int16 v6 = 2114;
      uint64_t v7 = @"BKSTouchDeliveryPolicyServerInterface.m";
      __int16 v8 = 1024;
      int v9 = 70;
      __int16 v10 = 2114;
      long long v11 = v2;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v4, 0x26u);
    }
    [v2 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2F26CLL);
  }
}

uint64_t BKSHIDServicesServerPort()
{
  return _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
}

void _lock_InvalidatePortHelper(uint64_t a1, mach_port_name_t *a2, CFTypeRef *a3)
{
  mach_port_deallocate(*MEMORY[0x1E4F14960], *a2);
  *a2 = 0;
  if (*a3) {
    CFRelease(*a3);
  }
  *a3 = 0;
  __int16 v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___lock_InvalidatePortHelper_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v6, block);
}

uint64_t _InvalidateHIDServicesPort()
{
  pthread_mutex_lock(&BKSServerPortLock);
  _lock_InvalidatePortHelper((uint64_t)"com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort);
  return pthread_mutex_unlock(&BKSServerPortLock);
}

uint64_t BKSDisplayServicesServerPort()
{
  return _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
}

uint64_t _InvalidateDisplayServicesPort()
{
  pthread_mutex_lock(&BKSServerPortLock);
  _lock_InvalidatePortHelper((uint64_t)"com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort);
  return pthread_mutex_unlock(&BKSServerPortLock);
}

uint64_t BKSWatchdogServerPort()
{
  return _BKSServerPortHelper("com.apple.backboard.watchdog", BKSWatchdogPort, &BKSWatchdogMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateWatchdogPort);
}

uint64_t _InvalidateWatchdogPort()
{
  pthread_mutex_lock(&BKSServerPortLock);
  _lock_InvalidatePortHelper((uint64_t)"com.apple.backboard.watchdog", BKSWatchdogPort, &BKSWatchdogMachPort);
  return pthread_mutex_unlock(&BKSServerPortLock);
}

float BKSHIDServicesGetBacklightFactor()
{
  float v2 = -1.0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetBacklightFactor(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesSetBacklightFactorPending(float a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetBacklightFactorPending(v2, a1);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration(char a1, float a2, float a3)
{
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetBacklightFactorWithFadeDuration(v6, a1, 0, a2, a3);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationAsync(char a1, float a2, float a3)
{
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(v6, 1, a1, 0, a2, a3);
}

uint64_t BKSHIDServicesNotifyBacklightFactorWithFadeDurationAsync(char a1, float a2, float a3)
{
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(v6, 0, a1, 0, a2, a3);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationSilently(char a1, float a2, float a3)
{
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetBacklightFactorWithFadeDuration(v6, a1, 1, a2, a3);
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDurationSilentlyAsync(char a1, float a2, float a3)
{
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(v6, 1, a1, 1, a2, a3);
}

void BKSHIDServicesSetBacklightFeatures(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v7 = 0;
  mach_port_t v2 = [MEMORY[0x1E4F4F808] encodeObject:v1 error:&v7];
  id v3 = v7;
  if (v2)
  {
    int v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    id v5 = v2;
    _BKSHIDSetBacklightFeatures(v4, [v5 bytes], objc_msgSend(v5, "length"));
  }
  else
  {
    mach_port_t v6 = BKLogBacklight();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v9 = v1;
      __int16 v10 = 2114;
      id v11 = v3;
      _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetBacklightFeatures failed to encode %{public}@: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t BKSHIDServicesGetDeviceBacklightArchitectureVersion()
{
  unsigned __int8 v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetDeviceBacklightArchitectureVersion(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesAmbientLightSensorExists()
{
  if (BKSHIDServicesAmbientLightSensorExists_onceToken != -1) {
    dispatch_once(&BKSHIDServicesAmbientLightSensorExists_onceToken, &__block_literal_global_1561);
  }
  return BKSHIDServicesAmbientLightSensorExists_alsExists;
}

uint64_t __BKSHIDServicesAmbientLightSensorExists_block_invoke()
{
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDAmbientLightSensorExists(v0, &BKSHIDServicesAmbientLightSensorExists_alsExists);
}

uint64_t BKSHIDServicesAmbientLightSensorEnableAutoBrightness(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDAmbientLightSensorEnableAutoBrightness(v2, a1);
}

uint64_t BKSHIDServicesAmbientLightSensorDisableAutoBrightness()
{
  mach_port_t v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDAmbientLightSensorDisableAutoBrightness(v0);
}

uint64_t BKSHIDServicesRequestEstimatedProximityEvents(double a1)
{
  unsigned int v5 = 0;
  int v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  float v3 = a1;
  _BKSHIDRequestEstimatedProximityEvents(v2, &v5, v3);
  return v5;
}

void BKSHIDServicesRequestProximityStatusEvent(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 length])
  {
    mach_port_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = [NSString stringWithUTF8String:"void BKSHIDServicesRequestProximityStatusEvent(NSString *__strong _Nonnull)"];
    [v6 handleFailureInFunction:v7 file:@"BKSHIDServices.m" lineNumber:134 description:@"must have a valid reason"];
  }
  int v2 = BKLogUISensor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_DEFAULT, "request status event", v8, 2u);
  }

  bzero(v8, 0x400uLL);
  float v3 = (__CFString *)v1;
  if ([(__CFString *)v3 length])
  {
    int CString = CFStringGetCString(v3, (char *)v8, 1024, 0x8000100u);

    if (!CString) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  mach_port_name_t v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDRequestProximityStatusEvent(v5, (const char *)v8);
LABEL_10:
}

uint64_t BKSHIDServicesProximityDetectionModePriority(int a1)
{
  if ((a1 - 1) > 0xC) {
    return 0;
  }
  else {
    return qword_18AA84FD8[a1 - 1];
  }
}

void BKSHIDServicesRequestProximityDetectionMode(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  int v2 = BKLogUISensor();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    float v3 = NSStringFromBKSHIDServicesProximityDetectionMode(a1);
    *(_DWORD *)buf = 138543362;
    uint64_t v13 = v3;
    _os_log_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_DEFAULT, "request prox mode: %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&BKSHIDServicesRequestProximityDetectionMode_sLock);
  if (a1)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __BKSHIDServicesRequestProximityDetectionMode_block_invoke;
    v10[3] = &__block_descriptor_36_e35_v16__0__BKSMutableHIDUISensorMode_8l;
    int v11 = a1;
    int v4 = +[BKSHIDUISensorMode buildModeForReason:@"RequestProximityDetectionMode" builder:v10];
    mach_port_name_t v5 = +[BKSHIDUISensorService sharedInstance];
    mach_port_t v6 = [v5 suppressUISensorChangesForReason:@"RequestProximityDetectionMode transaction"];
    id v7 = (id)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion;
    uint64_t v8 = [v5 requestUISensorMode:v4];
    uint64_t v9 = (void *)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion;
    BKSHIDServicesRequestProximityDetectionMode_sModeAssertion = v8;

    [v7 invalidate];
    [v6 invalidate];
  }
  else
  {
    [(id)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion invalidate];
    int v4 = (void *)BKSHIDServicesRequestProximityDetectionMode_sModeAssertion;
    BKSHIDServicesRequestProximityDetectionMode_sModeAssertion = 0;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&BKSHIDServicesRequestProximityDetectionMode_sLock);
}

void __BKSHIDServicesRequestProximityDetectionMode_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDigitizerEnabled:1];
  [v3 setProximityDetectionMode:*(unsigned int *)(a1 + 32)];
}

void BKSHIDServicesSetProximityEventsClient()
{
  mach_port_t v0 = BKLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v1 = 0;
    _os_log_error_impl(&dword_18AA0B000, v0, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetProximityEventsClient is no longer supported; set up a dispatching rule for proximity events with"
      " BKSHIDEventDeliveryManager instead",
      v1,
      2u);
  }
}

uint64_t BKSHIDServicesResetProximityCalibration()
{
  mach_port_t v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDResetProximityCalibration(v0);
}

__CFString *NSStringFromBKSHIDUILockSource(unint64_t a1)
{
  if (a1 > 3) {
    return @"<unknown>";
  }
  else {
    return off_1E5440A58[a1];
  }
}

__CFString *NSStringFromBKSHIDUILockState(uint64_t a1)
{
  if (a1)
  {
    __int16 v1 = a1;
    int v2 = [MEMORY[0x1E4F1CA48] array];
    id v3 = v2;
    if ((v1 & 0x20) != 0)
    {
      [v2 addObject:@"disableProximity"];
      if ((v1 & 0x10) == 0)
      {
LABEL_4:
        if ((v1 & 0x40) == 0) {
          goto LABEL_5;
        }
        goto LABEL_16;
      }
    }
    else if ((v1 & 0x10) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"disableMultitouch"];
    if ((v1 & 0x40) == 0)
    {
LABEL_5:
      if ((v1 & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
LABEL_16:
    [v3 addObject:@"disableTapToWake"];
    if ((v1 & 0x80) == 0)
    {
LABEL_6:
      if ((v1 & 0x100) == 0) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
LABEL_17:
    [v3 addObject:@"pocketTouchMode"];
    if ((v1 & 0x100) == 0)
    {
LABEL_7:
      if ((v1 & 0x200) == 0)
      {
LABEL_9:
        int v4 = [v3 componentsJoinedByString:@","];

        goto LABEL_11;
      }
LABEL_8:
      [v3 addObject:@"disableAlwaysOnGestures"];
      goto LABEL_9;
    }
LABEL_18:
    [v3 addObject:@"disableCoverGesture"];
    if ((v1 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v4 = @"<none>";
LABEL_11:
  return v4;
}

void BKSHIDServicesSetHIDUILockedState(int a1)
{
  if (a1) {
    char v1 = 48;
  }
  else {
    char v1 = 0;
  }
  BKSHIDServicesSetHIDUILockedStateWithSource(0, v1);
}

void BKSHIDServicesSetHIDUILockedStateWithSource(uint64_t a1, char a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)&BKSHIDServicesSetHIDUILockedStateWithSource_lock);
  int v4 = (void *)BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion;
  BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion = 0;
  id v5 = v4;

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __BKSHIDServicesSetHIDUILockedStateWithSource_block_invoke;
  uint64_t v13 = &__block_descriptor_44_e35_v16__0__BKSMutableHIDUISensorMode_8l;
  uint64_t v14 = a1;
  LOBYTE(v15) = (a2 & 0x10) != 0;
  BYTE1(v15) = (a2 & 0x40) != 0;
  BYTE2(v15) = (a2 & 0x90) == 128;
  BYTE3(v15) = (a2 & 0x20) != 0;
  mach_port_t v6 = +[BKSHIDUISensorMode buildModeForReason:@"BKSHIDServicesSetHIDUILockedState" builder:&v10];
  id v7 = +[BKSHIDUISensorService sharedInstance];
  uint64_t v8 = [v7 requestUISensorMode:v6];
  uint64_t v9 = (void *)BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion;
  BKSHIDServicesSetHIDUILockedStateWithSource_sPrevailingSensorStateAssertion = v8;

  [v5 invalidate];
  os_unfair_lock_unlock((os_unfair_lock_t)&BKSHIDServicesSetHIDUILockedStateWithSource_lock);
}

void __BKSHIDServicesSetHIDUILockedStateWithSource_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setChangeSource:*(void *)(a1 + 32)];
  [v4 setDigitizerEnabled:*(unsigned char *)(a1 + 40) == 0];
  if (*(unsigned char *)(a1 + 40)) {
    [v4 setTapToWakeEnabled:*(unsigned char *)(a1 + 41) == 0];
  }
  else {
    [v4 setPocketTouchesExpected:*(unsigned __int8 *)(a1 + 42)];
  }
  id v3 = v4;
  if (*(unsigned char *)(a1 + 43))
  {
    [v4 setProximityDetectionMode:5];
    id v3 = v4;
  }
}

BOOL BKSHIDServicesGetObjectInProximityIgnoresTouches()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetObjectInProximityIgnoresTouches(v0, &v2);
  return v2 != 0;
}

uint64_t BKSHIDServicesSetObjectInProximityIgnoresTouches(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetObjectInProximityIgnoresTouches(v2, a1);
}

uint64_t BKSHIDServicesGetObjectWithinProximity()
{
  unsigned __int8 v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetObjectWithinProximity(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesProximityDetectionActive()
{
  unsigned __int8 v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetProximityDetectionActive(v0, &v2);
  return v2;
}

__CFString *NSStringFromBKSHIDServicesHumanPresenceStatus(uint64_t a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    id v3 = v2;
    if (v1)
    {
      [v2 appendString:@"has-presence "];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 appendString:@"has-proximity "];
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 8) == 0)
      {
LABEL_7:
        id v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v5 = [v3 stringByTrimmingCharactersInSet:v4];

        goto LABEL_9;
      }
LABEL_6:
      [v3 appendString:@"received-proximity "];
      goto LABEL_7;
    }
LABEL_14:
    [v3 appendString:@"received-presence "];
    if ((v1 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v5 = @"unsupported";
LABEL_9:
  return v5;
}

void BKSHIDServicesGetHumanPresenceStatus(void *a1, void *a2, BOOL *a3, _DWORD *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  bzero(buffer, 0x400uLL);
  if (!v7 || CFStringGetCString(v7, buffer, 1024, 0x8000100u))
  {
    unsigned int v11 = 0;
    char v10 = 0;
    int v9 = 0;
    mach_port_name_t v8 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDGetHumanPresenceStatus(v8, buffer, &v11, &v10, &v9);
    if (a2) {
      *a2 = v11;
    }
    if (a3) {
      *a3 = v10 != 0;
    }
    if (a4) {
      *a4 = v9;
    }
  }
}

BOOL BKSHIDServicesIsCapsLockLightOn()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDIsCapsLockLightOn(v0, 0, &v2);
  return v2 != 0;
}

BOOL BKSHIDKeyboardIsCapsLockLightOn(uint64_t a1)
{
  char v4 = 0;
  int v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDIsCapsLockLightOn(v2, a1, &v4);
  return v4 != 0;
}

uint64_t BKSHIDServicesSetCapsLockRomanSwitchMode(int a1)
{
  char v1 = a1 != 0;
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockRomanSwitchMode(v2, 0, v1);
}

uint64_t BKSHIDKeyboardSetCapsLockRomanSwitchMode(uint64_t a1, char a2)
{
  mach_port_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockRomanSwitchMode(v4, a1, a2);
}

uint64_t BKSHIDServicesSetCapsLockDelayOverride(double a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockDelayOverride(v2, 0, a1);
}

uint64_t BKSHIDKeyboardSetCapsLockDelayOverride(uint64_t a1, double a2)
{
  mach_port_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockDelayOverride(v4, a1, a2);
}

void BKSHIDServicesSetHardwareKeyboardLayout(void *a1)
{
}

void BKSHIDKeyboardSetLayout(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  bzero(buffer, 0x400uLL);
  if (!v3 || CFStringGetCString(v3, buffer, 1024, 0x8000100u))
  {
    mach_port_name_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDSetHardwareKeyboardLayout(v4, a1, buffer);
  }
}

id BKSHIDServicesGetHardwareKeyboardLanguage()
{
  int v0 = BKSHIDKeyboardGetDeviceProperties(0);
  char v1 = [v0 language];

  return v1;
}

id BKSHIDKeyboardGetDeviceProperties(uint64_t a1)
{
  mach_port_t v2 = +[BKSHIDKeyboardService sharedInstance];
  id v3 = [v2 keyboardDeviceForSenderID:a1];
  mach_port_name_t v4 = [v3 _properties];

  return v4;
}

uint64_t BKSHIDServicesCapsLockKeyHasLanguageSwitchLabel()
{
  int v0 = BKSHIDKeyboardGetDeviceProperties(0);
  uint64_t v1 = [v0 capsLockKeyHasLanguageSwitchLabel];

  return v1;
}

BOOL BKSHIDKeyboardWantsStandardTypeOverride(uint64_t a1)
{
  char v4 = 0;
  int v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDKeyboardWantsStandardTypeOverride(v2, a1, &v4);
  return v4 != 0;
}

uint64_t BKSHIDKeyboardSetCapsLockActive(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v6 = [NSString stringWithFormat:@"BKSHIDKeyboardSetCapsLockActive requires a specific keyboard service senderID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDKeyboardSetCapsLockActive(IOHIDEventSenderID, BOOL)");
      int v8 = 138544130;
      int v9 = v7;
      __int16 v10 = 2114;
      unsigned int v11 = @"BKSHIDServices.m";
      __int16 v12 = 1024;
      int v13 = 458;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x26u);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA30F0CLL);
  }
  mach_port_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetCapsLockActive(v4, a1, a2);
}

uint64_t BKSHIDServicesSetStandardType(uint64_t a1, int a2)
{
  mach_port_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetStandardType(v4, a1, a2);
}

void BKSHIDServicesSetAuthenticatedKeyCommands(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  int v2 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v1);
  if (!v2)
  {
    id v7 = BKLogBacklight();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v1;
      int v8 = "BKSHIDServicesSetBacklightFeatures failed to encode %{public}@";
      int v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_9;
    }
LABEL_6:

    goto LABEL_7;
  }
  int v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v4 = v2;
  int v5 = _BKSHIDSetAuthenticatedKeyCommands(v3, [v4 bytes], objc_msgSend(v4, "length"));
  if (v5)
  {
    int v6 = v5;
    id v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      LODWORD(v12) = v6;
      int v8 = "Error sending authenticatedKeyCommands: 0x%x";
      int v9 = v7;
      uint32_t v10 = 8;
LABEL_9:
      _os_log_error_impl(&dword_18AA0B000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, v10);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:
}

uint64_t BKSHIDServicesGetRingerState()
{
  unsigned int v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetRingerState(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesIsSmartCoverClosed()
{
  unsigned __int8 v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDIsSmartCoverClosed(v0, &v2);
  return v2;
}

uint64_t BKSHIDServicesCancelButtonEventsFromSenderID(uint64_t a1, int a2, int a3)
{
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDCancelButtonEventsFromSenderID(v6, a1, a2, a3);
}

uint64_t BKSHIDServicesSetTouchPadAvailability(unsigned int a1)
{
  unsigned __int8 v2 = @"com.apple.backboardd.touchpad-availability";
  int v3 = (const char *)[@"com.apple.backboardd.touchpad-availability" UTF8String];
  int v4 = BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken;
  if (BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken == -1)
  {
    uint64_t result = notify_register_check(v3, &BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken);
    if (result) {
      return result;
    }
    int v4 = BKSHIDServicesSetTouchPadAvailability___NotifyTouchPadAvailabilityToken;
  }
  notify_set_state(v4, a1);
  return notify_post(v3);
}

uint64_t BKSHIDServicesCancelTouchesOnAllDisplays()
{
  mach_port_t v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDCancelTouchesOnAllDisplays(v0);
}

void BKSHIDServicesCancelTouchesWithIdentifiers(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v1);
  int v3 = (void *)v2;
  if (v1 && !v2)
  {
    int v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v1;
      int v5 = "Error encoding touchIdentifiers: %{public}@";
      mach_port_t v6 = v4;
      uint32_t v7 = 12;
LABEL_10:
      _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v12, v7);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v8 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v9 = v3;
  int v10 = _BKSHIDCancelTouchesWithIdentifiers(v8, [v9 bytes], objc_msgSend(v9, "length"));
  if (v10)
  {
    int v11 = v10;
    int v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 67109120;
      LODWORD(v13) = v11;
      int v5 = "Error sending touchIdentifiers: 0x%x";
      mach_port_t v6 = v4;
      uint32_t v7 = 8;
      goto LABEL_10;
    }
LABEL_7:
  }
}

void BKSHIDServicesClaimGenericGestureFocus(void *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = a1;
  bzero(buffer, 0x400uLL);
  if (v3 && !CFStringGetCString(v3, buffer, 1024, 0x8000100u))
  {
    uint32_t v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      int v12 = v3;
      int v8 = "Could not encode displayUUID: '%@'";
      id v9 = v7;
      uint32_t v10 = 12;
      goto LABEL_10;
    }
LABEL_7:

    goto LABEL_8;
  }
  mach_port_name_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  int v5 = _BKSHIDClaimGenericGestureFocus(v4, buffer, a2);
  if (v5)
  {
    int v6 = v5;
    uint32_t v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      LODWORD(v12) = v6;
      int v8 = "Error sending generic gesture destination: 0x%x";
      id v9 = v7;
      uint32_t v10 = 8;
LABEL_10:
      _os_log_error_impl(&dword_18AA0B000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v11, v10);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
LABEL_8:
}

void BKSHIDServicesExcludeCAContextsFromHitTestingForZoomSenders(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v1);
    if (!v2)
    {
      int v3 = BKLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138543362;
        id v9 = v1;
        _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "Error encoding contextIDs: %{public}@", (uint8_t *)&v8, 0xCu);
      }
      id v4 = 0;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  int v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v4 = v2;
  int v6 = _BKSHIDExcludeCAContextsFromHitTestingForZoomSenders(v5, [v4 bytes], objc_msgSend(v4, "length"));
  if (v6)
  {
    int v7 = v6;
    int v3 = BKLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v8 = 67109120;
      LODWORD(v9) = v7;
      _os_log_error_impl(&dword_18AA0B000, v3, OS_LOG_TYPE_ERROR, "Error sending contextIDs: 0x%x", (uint8_t *)&v8, 8u);
    }
    goto LABEL_10;
  }
LABEL_11:
}

void _BKSHIDServicesApplyButtonDefinitions(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v1);
  int v3 = (void *)v2;
  if (v1 && !v2)
  {
    id v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v1;
      _os_log_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEFAULT, "Error encoding button definitions: %{public}@", (uint8_t *)&v9, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  int v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v6 = v3;
  int v7 = _BKSHIDApplyButtonDefinitions(v5, [v6 bytes], objc_msgSend(v6, "length"));
  if (v7)
  {
    int v8 = v7;
    id v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_error_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_ERROR, "Error sending button definitions: 0x%x", (uint8_t *)&v9, 8u);
    }
    goto LABEL_8;
  }
LABEL_9:
}

void BKSHIDServicesRequestHapticFeedback(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    int v9 = NSString;
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    int v12 = [v9 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"request", v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v13 = [NSString stringWithUTF8String:"void BKSHIDServicesRequestHapticFeedback(BKSHIDHapticFeedbackRequest *__strong _Nonnull)"];
      *(_DWORD *)buf = 138544130;
      long long v22 = v13;
      __int16 v23 = 2114;
      id v24 = @"BKSHIDServices.m";
      __int16 v25 = 1024;
      int v26 = 664;
      __int16 v27 = 2114;
      uint64_t v28 = v12;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA31C00);
  }
  uint64_t v2 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = NSString;
    uint64_t v15 = (objc_class *)[v2 classForCoder];
    if (!v15) {
      uint64_t v15 = (objc_class *)objc_opt_class();
    }
    uint64_t v16 = NSStringFromClass(v15);
    int v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    int v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"request", v16, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v20 = [NSString stringWithUTF8String:"void BKSHIDServicesRequestHapticFeedback(BKSHIDHapticFeedbackRequest *__strong _Nonnull)"];
      *(_DWORD *)buf = 138544130;
      long long v22 = v20;
      __int16 v23 = 2114;
      id v24 = @"BKSHIDServices.m";
      __int16 v25 = 1024;
      int v26 = 664;
      __int16 v27 = 2114;
      uint64_t v28 = v19;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA31D18);
  }

  int v3 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v2);
  if (!v3)
  {
    int v8 = BKLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v22 = v2;
      _os_log_impl(&dword_18AA0B000, v8, OS_LOG_TYPE_DEFAULT, "Error encoding haptic feedback request: %{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  int v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v5 = v3;
  int v6 = _BKSHIDRequestHapticFeedback(v4, [v5 bytes], objc_msgSend(v5, "length"));
  if (v6)
  {
    int v7 = v6;
    int v8 = BKLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = v7;
      _os_log_error_impl(&dword_18AA0B000, v8, OS_LOG_TYPE_ERROR, "Error sending haptic feedback request: 0x%x", buf, 8u);
    }
LABEL_9:
  }
}

void _BKSHIDServicesPostTouchAnnotations(void *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v1);
  int v3 = (void *)v2;
  if (v1 && !v2)
  {
    int v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v1;
      _os_log_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_DEFAULT, "Error encoding touch annotations: %{public}@", (uint8_t *)&v9, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  int v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v6 = v3;
  int v7 = _BKSHIDPostTouchAnnotations(v5, [v6 bytes], objc_msgSend(v6, "length"));
  if (v7)
  {
    int v8 = v7;
    int v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = 67109120;
      LODWORD(v10) = v8;
      _os_log_error_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_ERROR, "Error sending touch annotations: 0x%x", (uint8_t *)&v9, 8u);
    }
    goto LABEL_8;
  }
LABEL_9:
}

__CFString *NSStringFromBKSHIDServicesUserEventTimerMode(unsigned int a1)
{
  if (a1 > 3) {
    return @"(unknown)";
  }
  else {
    return off_1E5440A78[a1];
  }
}

uint64_t BKSHIDServicesResetUserEventTimer(unsigned int a1, double a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1) {
    BOOL v3 = a2 < 0.0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3 && a2 < 9223372040.0) {
    double v5 = a2;
  }
  else {
    double v5 = 9223372040.0;
  }
  id v6 = BKLogIdleTimer();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a1 > 3) {
      int v7 = @"(unknown)";
    }
    else {
      int v7 = off_1E5440A78[a1];
    }
    double v8 = INFINITY;
    if (v5 != 9223372040.0) {
      double v8 = v5;
    }
    int v11 = 138543618;
    int v12 = v7;
    __int16 v13 = 2048;
    double v14 = v8;
    _os_log_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_INFO, "Resetting user event timer to %{public}@ with duration %gs", (uint8_t *)&v11, 0x16u);
  }

  mach_port_t v9 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDResetUserEventTimer(v9, a1, v5);
}

uint64_t BKSHIDServicesNotifyOnNextUserEvent()
{
  mach_port_t v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDNotifyOnNextUserEvent(v0);
}

BOOL BKSHIDServicesSafeToResetIdleTimer()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDSafeToResetIdleTimer(v0, &v2);
  return v2 != 0;
}

uint64_t BKHIDServicesGetCurrentDeviceOrientation()
{
  int v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetCurrentDeviceOrientation(v0, &v2);
  return v2;
}

void BKSHIDServicesSetOrientationClient(void *a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a1;
  memset(&v6[30], 0, 32);
  if (v3) {
    int v4 = v3;
  }
  else {
    int v4 = &stru_1ED755B00;
  }
  memset(v6, 0, 480);
  if (CFStringGetCString(v4, (char *)v6, 1024, 0x8000100u))
  {
    mach_port_name_t v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDSetOrientationClient(v5, (const char *)v6, a2);
  }
}

uint64_t BKSHIDServicesLockOrientation(uint64_t result, char a2)
{
  int v3 = result;
  int v4 = __BKLockedOrientation;
  if (__BKLockedOrientation == -2)
  {
    uint64_t v7 = 0;
    int v5 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    uint64_t result = _BKSHIDIsOrientationLockedWithOrientation(v5, (_DWORD *)&v7 + 1, &v7);
    if (HIDWORD(v7)) {
      int v4 = v7;
    }
    else {
      int v4 = -1;
    }
    __BKLockedOrientation = v4;
  }
  if (v4 == -1)
  {
    __BKLockedOrientation = v3;
    int v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    return _BKSHIDLockOrientation(v6, v3, a2);
  }
  return result;
}

void BKSHIDServicesUnlockOrientation()
{
  int v0 = __BKLockedOrientation;
  if (__BKLockedOrientation == -2)
  {
    uint64_t v3 = 0;
    int v1 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDIsOrientationLockedWithOrientation(v1, (_DWORD *)&v3 + 1, &v3);
    if (HIDWORD(v3)) {
      int v0 = v3;
    }
    else {
      int v0 = -1;
    }
    __BKLockedOrientation = v0;
  }
  if (v0 != -1)
  {
    __BKLockedOrientation = -1;
    mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDUnlockOrientation(v2);
  }
}

BOOL BKSHIDServicesIsOrientationLockedWithOrientation(void *a1)
{
  int v2 = __BKLockedOrientation;
  if (__BKLockedOrientation == -2)
  {
    uint64_t v6 = 0;
    int v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    _BKSHIDIsOrientationLockedWithOrientation(v3, (_DWORD *)&v6 + 1, &v6);
    if (HIDWORD(v6)) {
      int v2 = v6;
    }
    else {
      int v2 = -1;
    }
    __BKLockedOrientation = v2;
  }
  if (a1)
  {
    if (v2 == -1) {
      int v4 = 0;
    }
    else {
      int v4 = v2;
    }
    *a1 = v4;
  }
  return v2 != -1;
}

uint64_t BKSHIDServicesSetDeviceInterfaceOrientation(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDeviceInterfaceOrientation(v2, a1);
}

uint64_t BKSHIDServicesSetDeviceOrientationForAutomation(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDeviceOrientationForAutomation(v2, a1);
}

BOOL BKSHIDServicesSetAccelerometerClientEventsEnabled(int a1, double a2, float a3, float a4, float a5)
{
  int v10 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetAccelerometerClientEventsEnabled(v10, a1, 0, a2, a3, a4, a5) == 268435460;
}

void BKSHIDServicesSetTouchHand(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1 == 1) {
    goto LABEL_4;
  }
  if (a1 == 2)
  {
    uint64_t v1 = 0;
LABEL_4:
    mach_port_t v2 = +[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer];
    int v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v1, @"TouchHand");
    uint64_t v6 = v3;
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    BKSHIDServicesSetPersistentServiceProperties(v2, v4);

    goto LABEL_7;
  }
  mach_port_t v2 = BKLogTouchEvents();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v8 = v1;
    _os_log_error_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetTouchHand unknown touchHand value %ld", buf, 0xCu);
  }
LABEL_7:
}

void BKSHIDServicesSetPersistentServiceProperties(void *a1, void *a2)
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  if (!v5)
  {
    uint64_t v18 = NSString;
    int v19 = (objc_class *)objc_opt_class();
    int v20 = NSStringFromClass(v19);
    long long v21 = [v18 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"sender", v20];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      *(_DWORD *)buf = 138544130;
      v46 = v22;
      __int16 v47 = 2114;
      v48 = @"BKSHIDServices.m";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = 918;
      WORD2(v50[0]) = 2114;
      *(void *)((char *)v50 + 6) = v21;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA32A4CLL);
  }
  uint64_t v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v23 = NSString;
    id v24 = (objc_class *)[v6 classForCoder];
    if (!v24) {
      id v24 = (objc_class *)objc_opt_class();
    }
    __int16 v25 = NSStringFromClass(v24);
    int v26 = (objc_class *)objc_opt_class();
    __int16 v27 = NSStringFromClass(v26);
    uint64_t v28 = [v23 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"sender", v25, v27];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      *(_DWORD *)buf = 138544130;
      v46 = v29;
      __int16 v47 = 2114;
      v48 = @"BKSHIDServices.m";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = 918;
      WORD2(v50[0]) = 2114;
      *(void *)((char *)v50 + 6) = v28;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA32B64);
  }

  uint64_t v7 = (__CFString *)v4;
  if (!v7)
  {
    uint64_t v30 = NSString;
    v31 = (objc_class *)objc_opt_class();
    id v32 = NSStringFromClass(v31);
    id v33 = [v30 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"properties", v32];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v34 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      *(_DWORD *)buf = 138544130;
      v46 = v34;
      __int16 v47 = 2114;
      v48 = @"BKSHIDServices.m";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = 919;
      WORD2(v50[0]) = 2114;
      *(void *)((char *)v50 + 6) = v33;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v33 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA32C58);
  }
  uint64_t v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v35 = NSString;
    uint64_t v36 = (objc_class *)[(__CFString *)v8 classForCoder];
    if (!v36) {
      uint64_t v36 = (objc_class *)objc_opt_class();
    }
    v37 = NSStringFromClass(v36);
    uint64_t v38 = (objc_class *)objc_opt_class();
    uint64_t v39 = NSStringFromClass(v38);
    v40 = [v35 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"properties", v37, v39];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v41 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      *(_DWORD *)buf = 138544130;
      v46 = v41;
      __int16 v47 = 2114;
      v48 = @"BKSHIDServices.m";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = 919;
      WORD2(v50[0]) = 2114;
      *(void *)((char *)v50 + 6) = v40;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA32D70);
  }

  if (!CFPropertyListIsValid(v8, kCFPropertyListXMLFormat_v1_0))
  {
    v42 = [NSString stringWithFormat:@"non-plistable type in %@", v8];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v43 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDServicesSetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSDictionary<NSString *,id> *__strong)");
      *(_DWORD *)buf = 138544130;
      v46 = v43;
      __int16 v47 = 2114;
      v48 = @"BKSHIDServices.m";
      __int16 v49 = 1024;
      LODWORD(v50[0]) = 921;
      WORD2(v50[0]) = 2114;
      *(void *)((char *)v50 + 6) = v42;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA32E3CLL);
  }
  id v44 = 0;
  uint64_t v9 = [MEMORY[0x1E4F4F808] encodeObject:v6 error:&v44];
  id v10 = v44;
  uint64_t v11 = [(__CFString *)v8 bs_secureEncoded];
  int v12 = (void *)v11;
  if (v9 && v11)
  {
    int v13 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    id v14 = v9;
    uint64_t v15 = [v14 bytes];
    LODWORD(v14) = [v14 length];
    id v16 = v12;
    _BKSHIDSetPersistentServiceProperties(v13, v15, (int)v14, [v16 bytes], objc_msgSend(v16, "length"));
  }
  else
  {
    int v17 = BKLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v46 = v6;
      __int16 v47 = 2114;
      v48 = v8;
      __int16 v49 = 2114;
      v50[0] = v10;
      _os_log_error_impl(&dword_18AA0B000, v17, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetPersistentServiceProperties failed to encode %{public}@ / %{public}@: %{public}@", buf, 0x20u);
    }
  }
}

void BKSHIDServicesSetWristState(unint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1 >= 3)
  {
    mach_port_t v2 = BKLogTouchEvents();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v8 = a1;
      _os_log_error_impl(&dword_18AA0B000, v2, OS_LOG_TYPE_ERROR, "BKSHIDServicesSetWristState unknown wristState value %ld", buf, 0xCu);
    }
  }
  else
  {
    mach_port_t v2 = +[BKSHIDEventSenderDescriptor anyBuiltinTouchscreenDigitizer];
    id v3 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", a1, @"WristState");
    uint64_t v6 = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    BKSHIDServicesSetPersistentServiceProperties(v2, v4);
  }
}

id BKSHIDServicesGetPersistentServiceProperties(void *a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  if (!v5)
  {
    v48 = NSString;
    __int16 v49 = (objc_class *)objc_opt_class();
    v50 = NSStringFromClass(v49);
    v51 = [v48 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"sender", v50];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v52 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      *(_DWORD *)buf = 138544130;
      v85 = v52;
      __int16 v86 = 2114;
      v87 = @"BKSHIDServices.m";
      __int16 v88 = 1024;
      *(_DWORD *)v89 = 881;
      *(_WORD *)&v89[4] = 2114;
      *(void *)&v89[6] = v51;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v51 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA336ECLL);
  }
  uint64_t v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v53 = NSString;
    v54 = (objc_class *)[v6 classForCoder];
    if (!v54) {
      v54 = (objc_class *)objc_opt_class();
    }
    v55 = NSStringFromClass(v54);
    v56 = (objc_class *)objc_opt_class();
    v57 = NSStringFromClass(v56);
    v58 = [v53 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"sender", v55, v57];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v59 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      *(_DWORD *)buf = 138544130;
      v85 = v59;
      __int16 v86 = 2114;
      v87 = @"BKSHIDServices.m";
      __int16 v88 = 1024;
      *(_DWORD *)v89 = 881;
      *(_WORD *)&v89[4] = 2114;
      *(void *)&v89[6] = v58;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v58 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA33804);
  }

  id v7 = v4;
  if (!v7)
  {
    v60 = NSString;
    v61 = (objc_class *)objc_opt_class();
    v62 = NSStringFromClass(v61);
    v63 = [v60 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"propertyKeys", v62];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v64 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      *(_DWORD *)buf = 138544130;
      v85 = v64;
      __int16 v86 = 2114;
      v87 = @"BKSHIDServices.m";
      __int16 v88 = 1024;
      *(_DWORD *)v89 = 882;
      *(_WORD *)&v89[4] = 2114;
      *(void *)&v89[6] = v63;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v63 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA338F4);
  }
  unint64_t v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v65 = NSString;
    v66 = (objc_class *)[v8 classForCoder];
    if (!v66) {
      v66 = (objc_class *)objc_opt_class();
    }
    v67 = NSStringFromClass(v66);
    v68 = (objc_class *)objc_opt_class();
    v69 = NSStringFromClass(v68);
    v70 = [v65 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"propertyKeys", v67, v69];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v71 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
      *(_DWORD *)buf = 138544130;
      v85 = v71;
      __int16 v86 = 2114;
      v87 = @"BKSHIDServices.m";
      __int16 v88 = 1024;
      *(_DWORD *)v89 = 882;
      *(_WORD *)&v89[4] = 2114;
      *(void *)&v89[6] = v70;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v70 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA33A0CLL);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v9 = v8;
  uint64_t v10 = [(__CFString *)v9 countByEnumeratingWithState:&v79 objects:v83 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v80 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v15 = NSString;
        id v16 = (objc_class *)objc_opt_class();
        if (!v14)
        {
          v31 = NSStringFromClass(v16);
          id v32 = [v15 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"key", v31];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            id v33 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
            *(_DWORD *)buf = 138544130;
            v85 = v33;
            __int16 v86 = 2114;
            v87 = @"BKSHIDServices.m";
            __int16 v88 = 1024;
            *(_DWORD *)v89 = 884;
            *(_WORD *)&v89[4] = 2114;
            *(void *)&v89[6] = v32;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
          [v32 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA33344);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v34 = NSString;
          uint64_t v35 = (objc_class *)[v14 classForCoder];
          if (!v35) {
            uint64_t v35 = (objc_class *)objc_opt_class();
          }
          uint64_t v36 = NSStringFromClass(v35);
          v37 = (objc_class *)objc_opt_class();
          uint64_t v38 = NSStringFromClass(v37);
          uint64_t v39 = [v34 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"key", v36, v38];

          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v40 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDictionary<NSString *,id> *BKSHIDServicesGetPersistentServiceProperties(BKSHIDEventSenderDescriptor *__strong, NSSet<NSString *> *__strong)");
            *(_DWORD *)buf = 138544130;
            v85 = v40;
            __int16 v86 = 2114;
            v87 = @"BKSHIDServices.m";
            __int16 v88 = 1024;
            *(_DWORD *)v89 = 884;
            *(_WORD *)&v89[4] = 2114;
            *(void *)&v89[6] = v39;
            _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
          }
          [v39 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18AA33458);
        }
      }
      uint64_t v11 = [(__CFString *)v9 countByEnumeratingWithState:&v79 objects:v83 count:16];
    }
    while (v11);
  }

  id v78 = 0;
  int v17 = [MEMORY[0x1E4F4F808] encodeObject:v6 error:&v78];
  id v18 = v78;
  uint64_t v19 = [(__CFString *)v9 bs_secureEncoded];
  int v20 = (void *)v19;
  uint64_t v77 = 0;
  unsigned int v76 = 0;
  if (!v17 || !v19)
  {
    __int16 v25 = BKLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v85 = v6;
      __int16 v86 = 2114;
      v87 = v9;
      __int16 v88 = 2114;
      *(void *)v89 = v18;
      int v26 = "BKSHIDServicesGetPersistentServiceProperties failed to encode %{public}@ / %{public}@: %{public}@";
      __int16 v27 = v25;
      uint32_t v28 = 32;
      goto LABEL_39;
    }
LABEL_20:
    uint64_t v29 = 0;
    goto LABEL_21;
  }
  mach_port_t v21 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v22 = v17;
  uint64_t v23 = [v22 bytes];
  LODWORD(v22) = [v22 length];
  id v24 = v20;
  if (_BKSHIDGetPersistentServiceProperties(v21, v23, (int)v22, [v24 bytes], objc_msgSend(v24, "length"), &v77, &v76))
  {
    __int16 v25 = BKLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v26 = "BKSHIDServicesGetPersistentServiceProperties IPC failed";
      __int16 v27 = v25;
      uint32_t v28 = 2;
LABEL_39:
      _os_log_error_impl(&dword_18AA0B000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  __int16 v25 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", v77, v76);
  if (!v25)
  {
    v46 = BKLogCommon();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v47 = "BKSHIDServicesGetPersistentServiceProperties data access failed";
      goto LABEL_41;
    }
LABEL_37:

    goto LABEL_20;
  }
  v74 = (void *)MEMORY[0x1E4F1CAD0];
  v75 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v73 = objc_opt_class();
  uint64_t v72 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  v45 = objc_msgSend(v74, "setWithObjects:", v73, v72, v41, v42, v43, v44, objc_opt_class(), 0);
  uint64_t v29 = objc_msgSend(v75, "bs_secureDecodedFromData:withAdditionalClasses:", v25, v45);

  if (!v29)
  {
    v46 = BKLogCommon();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v47 = "BKSHIDServicesGetPersistentServiceProperties property decode failed";
LABEL_41:
      _os_log_error_impl(&dword_18AA0B000, v46, OS_LOG_TYPE_ERROR, v47, buf, 2u);
      goto LABEL_37;
    }
    goto LABEL_37;
  }
LABEL_21:

  return v29;
}

id BKSHIDServicesProductIdentifierFromServiceProperties(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = v5;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = objc_opt_class();
  id v13 = v6;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  uint64_t v16 = objc_opt_class();
  id v17 = v7;
  if (v16)
  {
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v19 = v18;

  int v20 = 0;
  if (v11 && v15)
  {
    if (v19) {
      [NSString stringWithFormat:@"%@-%@-%@", v11, v15, v19];
    }
    else {
    int v20 = [NSString stringWithFormat:@"%@-%@", v11, v15, v22];
    }
  }

  return v20;
}

void BKSHIDServicesGetCALayerTransform(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  id v6 = +[BKSTouchEventService sharedInstance];
  if (v6)
  {
    id v7 = v6;
    [v6 transformForDisplayUUID:0 layerID:a2 contextID:a1];
    id v6 = v7;
  }
  else
  {
    a3[6] = 0u;
    a3[7] = 0u;
    a3[4] = 0u;
    a3[5] = 0u;
    a3[2] = 0u;
    a3[3] = 0u;
    *a3 = 0u;
    a3[1] = 0u;
  }
}

__CFString *NSStringFromBKSHIDTouchSensitiveButtonIdentifier(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      mach_port_t v2 = @"cameraCapture";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
      mach_port_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    mach_port_t v2 = @"undefined";
  }
  return v2;
}

__CFString *NSStringFromBKSHIDTouchSensitiveButtonScanMode(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      mach_port_t v2 = @"active";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
      mach_port_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    mach_port_t v2 = @"none";
  }
  return v2;
}

id BKSHIDTouchSensitiveButtonRequestScanMode(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2 <= 0)
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scanMode > BKSHIDTouchSensitiveButtonScanModeNone"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSInvalidatable>  _Nonnull BKSHIDTouchSensitiveButtonRequestScanMode(BKSHIDTouchSensitiveButtonIdentifier, BKSHIDTouchSensitiveButtonScanMode, NSString *__strong _Nonnull)");
      *(_DWORD *)buf = 138544130;
      id v15 = v12;
      __int16 v16 = 2114;
      id v17 = @"BKSHIDServices.m";
      __int16 v18 = 1024;
      int v19 = 979;
      __int16 v20 = 2114;
      mach_port_t v21 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA33F24);
  }
  id v6 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (BKSHIDTouchSensitiveButtonRequestScanMode_onceToken != -1) {
    dispatch_once(&BKSHIDTouchSensitiveButtonRequestScanMode_onceToken, block);
  }
  id v7 = (void *)BKSHIDTouchSensitiveButtonRequestScanMode_scanningAssertion;
  uint64_t v8 = [NSNumber numberWithInteger:a2];
  id v9 = [v7 acquireForReason:v6 withContext:v8];

  return v9;
}

void __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke_2;
  v3[3] = &__block_descriptor_40_e36_v16__0___BSCompoundAssertionState__8l;
  v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"BKSHIDTouchSensitiveButtonStartScanning" stateDidChangeHandler:v3];
  mach_port_t v2 = (void *)BKSHIDTouchSensitiveButtonRequestScanMode_scanningAssertion;
  BKSHIDTouchSensitiveButtonRequestScanMode_scanningAssertion = v1;
}

uint64_t __BKSHIDTouchSensitiveButtonRequestScanMode_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = objc_msgSend(a2, "orderedContext", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) integerValue];
        if (v9 > v6) {
          uint64_t v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    LODWORD(v6) = 0;
  }

  mach_port_t v10 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDTouchSensitiveButtonSetScanMode(v10, *(_DWORD *)(a1 + 32), v6);
}

__CFString *BKSOpenApplicationErrorCodeToString(unsigned int a1)
{
  if (a1 > 8) {
    return 0;
  }
  else {
    return off_1E5440B40[a1];
  }
}

__CFString *NSStringFromBKSTouchHitTestContextCategory(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      mach_port_t v2 = @"accessibilityOverlay";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
      mach_port_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    mach_port_t v2 = @"unspecified";
  }
  return v2;
}

__CFString *NSStringFromBKSHIDEventAttributeOptions(int a1)
{
  if (a1)
  {
    __int16 v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = v2;
    if (v1)
    {
      [v2 addObject:@"cancelled"];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_21;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"touchChanged"];
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_22;
    }
LABEL_21:
    [v3 addObject:@"highResolutionScroll"];
    if ((v1 & 8) == 0)
    {
LABEL_6:
      if ((v1 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_23;
    }
LABEL_22:
    [v3 addObject:@"displayLinkSynchronized"];
    if ((v1 & 0x10) == 0)
    {
LABEL_7:
      if ((v1 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
LABEL_23:
    [v3 addObject:@"highQualityFrequency"];
    if ((v1 & 0x20) == 0)
    {
LABEL_8:
      if ((v1 & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_25;
    }
LABEL_24:
    [v3 addObject:@"usesNaturalScrolling"];
    if ((v1 & 0x40) == 0)
    {
LABEL_9:
      if ((v1 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_26;
    }
LABEL_25:
    [v3 addObject:@"usesDeviceOrientation"];
    if ((v1 & 0x80) == 0)
    {
LABEL_10:
      if ((v1 & 0x100) == 0) {
        goto LABEL_11;
      }
      goto LABEL_27;
    }
LABEL_26:
    [v3 addObject:@"modifiersOnly"];
    if ((v1 & 0x100) == 0)
    {
LABEL_11:
      if ((v1 & 0x200) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
LABEL_27:
    [v3 addObject:@"debugVisualizationEnabled"];
    if ((v1 & 0x200) == 0)
    {
LABEL_12:
      if ((v1 & 0x400) == 0)
      {
LABEL_14:
        uint64_t v4 = [v3 componentsJoinedByString:@", "];

        goto LABEL_16;
      }
LABEL_13:
      [v3 addObject:@"absoluteSource"];
      goto LABEL_14;
    }
LABEL_28:
    [v3 addObject:@"multiplexedMore"];
    if ((v1 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v4 = @"none";
LABEL_16:
  return v4;
}

__CFString *NSStringFromBKSHIDEventContextType(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    __int16 v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v1 = off_1E5440C00[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSHIDEventContextMove(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    __int16 v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v1 = off_1E5440BE8[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSHIDEventScreenEdgeMask(int a1)
{
  if (a1)
  {
    char v1 = a1;
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v3 = v2;
    if (v1)
    {
      [v2 addObject:@"top"];
      if ((v1 & 2) == 0)
      {
LABEL_4:
        if ((v1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
    else if ((v1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"left"];
    if ((v1 & 4) == 0)
    {
LABEL_5:
      if ((v1 & 8) == 0)
      {
LABEL_7:
        uint64_t v4 = [v3 componentsJoinedByString:@", "];

        goto LABEL_9;
      }
LABEL_6:
      [v3 addObject:@"right"];
      goto LABEL_7;
    }
LABEL_14:
    [v3 addObject:@"bottom"];
    if ((v1 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v4 = @"none";
LABEL_9:
  return v4;
}

__CFString *NSStringFromBKSHIDEventTeleportState(unsigned int a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E5440C18[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSHIDEventPointerAttributeState(unsigned int a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E5440BC0[a1];
  }
  return v1;
}

void collectPolicies(void *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __collectPolicies_block_invoke;
  v6[3] = &unk_1E5440D60;
  id v7 = v3;
  id v4 = v3;
  id v5 = (id)[a1 reducePolicyToObjectWithBlock:v6];
}

id __collectPolicies_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __collectPolicies_block_invoke_2;
  v10[3] = &unk_1E5440D88;
  id v11 = *(id *)(a1 + 32);
  id v12 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __collectPolicies_block_invoke_3;
  v7[3] = &unk_1E5440DB0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v12;
  id v4 = v12;
  id v5 = [v4 matchSharingTouchesPolicy:v10 orCancelTouchesPolicy:v7 orCombinedPolicy:&__block_literal_global_3285];

  return v5;
}

uint64_t __collectPolicies_block_invoke_2(uint64_t a1)
{
  return 0;
}

uint64_t __collectPolicies_block_invoke_3(uint64_t a1)
{
  return 0;
}

uint64_t __collectPolicies_block_invoke_4()
{
  return 0;
}

__CFString *NSStringFromBKSDisplayTags(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = v2;
  if (a1)
  {
    if (a1)
    {
      [v2 addObject:@"hidden"];
      if ((a1 & 2) == 0)
      {
LABEL_4:
        if ((a1 & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_18;
      }
    }
    else if ((a1 & 2) == 0)
    {
      goto LABEL_4;
    }
    [v3 addObject:@"debounce"];
    if ((a1 & 4) == 0)
    {
LABEL_5:
      if ((a1 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
LABEL_18:
    [v3 addObject:@"AirPlay"];
    if ((a1 & 0x10) == 0)
    {
LABEL_6:
      if ((a1 & 0x20) == 0) {
        goto LABEL_7;
      }
      goto LABEL_20;
    }
LABEL_19:
    [v3 addObject:@"musicOnly"];
    if ((a1 & 0x20) == 0)
    {
LABEL_7:
      if ((a1 & 0x40) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
LABEL_20:
    [v3 addObject:@"car"];
    if ((a1 & 0x40) == 0)
    {
LABEL_8:
      if ((a1 & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_22;
    }
LABEL_21:
    [v3 addObject:@"carInstruments"];
    if ((a1 & 0x80) == 0)
    {
LABEL_9:
      if ((a1 & 0x10000) == 0)
      {
LABEL_11:
        id v4 = NSString;
        id v5 = [v3 componentsJoinedByString:@" | "];
        uint64_t v6 = [v4 stringWithFormat:@"(%@)", v5];

        goto LABEL_13;
      }
LABEL_10:
      [v3 addObject:@"unknown"];
      goto LABEL_11;
    }
LABEL_22:
    [v3 addObject:@"continuity"];
    if ((a1 & 0x10000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v6 = @"()";
LABEL_13:

  return v6;
}

__CFString *NSStringFromBKSDisplayServicesCloneMirroringMode(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    char v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v1 = off_1E5440EA0[a1];
  }
  return v1;
}

uint64_t _BKSSetDisplayDisabled(void *a1, char a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (v3 && (int v5 = [(__CFString *)v3 isEqualToString:@"<main>"], v4, !v5))
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v4, buffer, 1024, 0x8000100u);
  }
  else
  {

    bzero(buffer, 0x400uLL);
  }
  mach_port_name_t v6 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetDisabled(v6, buffer, a2, &v8);
}

BOOL BKSDisplayServicesIsScreenDisabled(const __CFString *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  char v4 = 1;
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayIsDisabled(v2, buffer, &v4);
  return v4 != 0;
}

id BKSDisplayServicesAcquireDisplayDisabledAssertion(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (BKSDisplayServicesAcquireDisplayDisabledAssertion_onceToken != -1) {
    dispatch_once(&BKSDisplayServicesAcquireDisplayDisabledAssertion_onceToken, &__block_literal_global_3670);
  }
  id v5 = v3;
  if ([v5 length]) {
    uint64_t v6 = (__CFString *)v5;
  }
  else {
    uint64_t v6 = @"<main>";
  }

  id v7 = [(id)BKSDisplayServicesAcquireDisplayDisabledAssertion_assertion acquireForReason:v4 withContext:v6];

  return v7;
}

void __BKSDisplayServicesAcquireDisplayDisabledAssertion_block_invoke()
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy_;
  v3[4] = __Block_byref_object_dispose_;
  id v4 = [MEMORY[0x1E4F1CAD0] set];
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __BKSDisplayServicesAcquireDisplayDisabledAssertion_block_invoke_65;
  v2[3] = &unk_1E5440DF8;
  v2[4] = v3;
  uint64_t v0 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"com.apple.backboard.display-disabled" stateDidChangeHandler:v2];
  char v1 = (void *)BKSDisplayServicesAcquireDisplayDisabledAssertion_assertion;
  BKSDisplayServicesAcquireDisplayDisabledAssertion_assertion = v0;

  _Block_object_dispose(v3, 8);
}

void sub_18AA3F88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void __BKSDisplayServicesAcquireDisplayDisabledAssertion_block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 context];
  id v4 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mutableCopy];
  [v4 minusSet:v3];
  id v5 = (void *)[v3 mutableCopy];
  [v5 minusSet:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        _BKSSetDisplayDisabled(*(void **)(*((void *)&v20 + 1) + 8 * v10++), 1);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        _BKSSetDisplayDisabled(*(void **)(*((void *)&v16 + 1) + 8 * v15++), 0);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

uint64_t BKSDisplayServicesSetScreenBlanked(char a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(v4, 0x400uLL);
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayNotifySetDisplayBlanked(v2, v4, a1, 1);
}

uint64_t BKSDisplayServicesSetDisplayBlanked(const __CFString *a1, char a2)
{
  return _BKSDisplayServicesNotifySetDisplayBlanked(a1, a2, 1);
}

uint64_t _BKSDisplayServicesNotifySetDisplayBlanked(const __CFString *a1, char a2, char a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  mach_port_name_t v6 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayNotifySetDisplayBlanked(v6, buffer, a2, a3);
}

uint64_t BKSDisplayServicesNotifyDisplayBlanked(const __CFString *a1, char a2)
{
  return _BKSDisplayServicesNotifySetDisplayBlanked(a1, a2, 0);
}

BOOL BKSDisplayServicesGetBlankingRemovesPower(const __CFString *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  char v4 = 0;
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayGetBlankingRemovesPower(v2, buffer, &v4);
  return v4 != 0;
}

uint64_t BKSDisplayServicesSetBlankingRemovesPower(const __CFString *a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  mach_port_name_t v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetBlankingRemovesPower(v4, buffer, a2);
}

id BKSDisplayServicesGetSystemIdentifiers(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v1 = a1;
  bzero(buffer, 0x400uLL);
  if (v1) {
    CFStringGetCString(v1, buffer, 1024, 0x8000100u);
  }
  uint64_t v10 = 0;
  unsigned int v9 = 0;
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  id v3 = 0;
  if (!_BKSDisplayGetSystemIdentifiers(v2, buffer, &v10, &v9))
  {
    mach_port_name_t v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", v10, v9);
    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
      id v3 = objc_msgSend(v5, "bs_secureDecodedFromData:withAdditionalClasses:", v4, v7);
    }
    else
    {
      id v3 = 0;
    }
  }
  return v3;
}

void BKSDisplayServicesSetSystemIdentifiers(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  bzero(buffer, 0x400uLL);
  if (v3) {
    CFStringGetCString(v3, buffer, 1024, 0x8000100u);
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v4);
  uint64_t v6 = (void *)v5;
  if (v4 && !v5)
  {
    uint64_t v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v4;
      uint64_t v8 = "Error encoding system identifiers: %{public}@";
      unsigned int v9 = v7;
      uint32_t v10 = 12;
LABEL_12:
      _os_log_error_impl(&dword_18AA0B000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, v10);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  mach_port_t v11 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  id v12 = v6;
  int v13 = _BKSDisplaySetSystemIdentifiers(v11, buffer, [v12 bytes], objc_msgSend(v12, "length"));
  if (v13)
  {
    int v14 = v13;
    uint64_t v7 = BKLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 67109120;
      LODWORD(v16) = v14;
      uint64_t v8 = "Error sending system identifiers: 0x%x";
      unsigned int v9 = v7;
      uint32_t v10 = 8;
      goto LABEL_12;
    }
LABEL_9:
  }
}

BOOL BKSDisplayServicesIsFlipBookEnabled(const __CFString *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  char v4 = 0;
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayIsFlipBookEnabled(v2, buffer, &v4);
  return v4 != 0;
}

uint64_t BKSDisplayServicesSetFlipBookEnabled(const __CFString *a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  mach_port_name_t v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetFlipBookEnabled(v4, buffer, a2);
}

uint64_t BKSDisplayServicesSetCalibrationPhase(const __CFString *a1, int a2, int a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  mach_port_name_t v6 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetCalibrationPhase(v6, buffer, a2, a3);
}

BOOL BKSDisplayServicesIsFlipBookSuppressed(const __CFString *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  char v4 = 0;
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayIsFlipBookSuppressed(v2, buffer, &v4);
  return v4 != 0;
}

uint64_t BKSDisplayServicesSetFlipBookSuppressed(const __CFString *a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  mach_port_name_t v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetFlipBookSuppressed(v4, buffer, a2);
}

uint64_t BKSDisplayServicesWillUnblank()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  bzero(v2, 0x400uLL);
  mach_port_name_t v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayWillUnblank(v0, v2);
}

uint64_t BKSDisplayServicesWillUnblankDisplay(const __CFString *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x400uLL);
  if (a1) {
    CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  }
  mach_port_name_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayWillUnblank(v2, buffer);
}

void __getCADisplayClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CADisplay");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCADisplayClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    mach_port_name_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getCADisplayClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BKSDisplayServices.m", 42, @"Unable to find class %s", "CADisplay");

    __break(1u);
  }
}

void QuartzCoreLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __QuartzCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_1E5440E88;
    uint64_t v5 = 0;
    QuartzCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!QuartzCoreLibraryCore_frameworkLibrary)
  {
    char v1 = [MEMORY[0x1E4F28B00] currentHandler];
    mach_port_name_t v2 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"BKSDisplayServices.m", 41, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  mach_port_name_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __QuartzCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary = result;
  return result;
}

id BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay(void *a1, unint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  if (!v3)
  {
    long long v20 = NSStringFromClass(v5);
    long long v21 = [v4 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"displayUUID", v20];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v22 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSInvalidatable>  _Nonnull BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay(NSString *__strong _Nonnull, BKSDisplayServicesCloneMirroringMode)");
      *(_DWORD *)buffer = 138544130;
      v34 = v22;
      __int16 v35 = 2114;
      uint64_t v36 = @"BKSDisplayServices.m";
      __int16 v37 = 1024;
      int v38 = 423;
      __int16 v39 = 2114;
      v40 = v21;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA40BECLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v23 = NSString;
    id v24 = (objc_class *)[v3 classForCoder];
    if (!v24) {
      id v24 = (objc_class *)objc_opt_class();
    }
    __int16 v25 = NSStringFromClass(v24);
    uint64_t v26 = (objc_class *)objc_opt_class();
    __int16 v27 = NSStringFromClass(v26);
    uint32_t v28 = [v23 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"displayUUID", v25, v27];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", "id<BSInvalidatable>  _Nonnull BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay(NSString *__strong _Nonnull, BKSDisplayServicesCloneMirroringMode)");
      *(_DWORD *)buffer = 138544130;
      v34 = v29;
      __int16 v35 = 2114;
      uint64_t v36 = @"BKSDisplayServices.m";
      __int16 v37 = 1024;
      int v38 = 423;
      __int16 v39 = 2114;
      v40 = v28;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA40D00);
  }

  if (!BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v7 = (void *)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache;
    BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache = (uint64_t)v6;
  }
  uint64_t v8 = objc_alloc_init(_BKSCloneMirroringModeRequest);
  [(_BKSCloneMirroringModeRequest *)v8 setDisplayUUID:v3];
  [(_BKSCloneMirroringModeRequest *)v8 setMode:a2];
  id v9 = objc_alloc(MEMORY[0x1E4F4F838]);
  uint32_t v10 = NSString;
  mach_port_t v11 = NSStringFromBKSDisplayServicesCloneMirroringMode(a2);
  id v12 = [v10 stringWithFormat:@"%@:%@", v3, v11];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_block_invoke;
  v30[3] = &unk_1E54415B8;
  int v13 = (__CFString *)v3;
  v31 = v13;
  int v14 = v8;
  id v32 = v14;
  int v15 = (void *)[v9 initWithIdentifier:v12 forReason:@"CloneMirroring" invalidationBlock:v30];

  id v16 = [(id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache objectForKey:v13];
  uint64_t v17 = [v16 count];

  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "bs_addObject:toCollectionClass:forKey:", v14, objc_opt_class(), v13);
  if (!v17)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v13, buffer, 1024, 0x8000100u);
    mach_port_name_t v18 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
    _BKSDisplaySetCloneMirroringModeForDestinationDisplay(v18, buffer, a2);
  }

  return v15;
}

void __BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  mach_port_name_t v2 = [(id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache objectForKey:*(void *)(a1 + 32)];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 mode];

  objc_msgSend((id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache, "bs_removeObject:fromCollectionForKey:", *(void *)(a1 + 40), *(void *)(a1 + 32));
  uint64_t v5 = [(id)BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay_displayToModeCache objectForKey:*(void *)(a1 + 32)];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 mode];

  bzero(buffer, 0x400uLL);
  CFStringGetCString(*(CFStringRef *)(a1 + 32), buffer, 1024, 0x8000100u);
  if ([v5 count])
  {
    if (v4 != v7)
    {
      mach_port_name_t v8 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
      _BKSDisplaySetCloneMirroringModeForDestinationDisplay(v8, buffer, v7);
    }
  }
  else
  {
    mach_port_name_t v9 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
    _BKSDisplayRemoveCloneMirroringModeForDestinationDisplay(v9, buffer);
  }
}

uint64_t BKSDisplayServicesSetCloneRotationDisabled(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetCloneRotationDisabled(v2, a1);
}

BOOL BKSDisplayServicesTetherPrefsNeedImmediateUpdate()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayTetherPrefsNeedImmediateUpdate(v0, &v2);
  return v2 != 0;
}

uint64_t BKSDisplayServicesSetTetheredOrientationNotificationsDisabled(char a1)
{
  int v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetTetheredOrientationNotificationsDisabled(v2, a1);
}

uint64_t BKSDisplayServicesUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation(v2, a1);
}

uint64_t BKSDisplayServicesUpdateMirroredDisplayOrientationWithInterfaceOrientation(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplayUpdateMirroredDisplayOrientationWithInterfaceOrientation(v2, a1);
}

uint64_t BKSDisplaySetSecureMode(char a1)
{
  int v2 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  return _BKSDisplaySetSecureMode(v2, a1);
}

void BKSDisplayServicesSetArrangement(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v1);
  id v3 = (void *)v2;
  if (v1 && !v2)
  {
    uint64_t v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v1;
      uint64_t v5 = "Error encoding arrangement: %{public}@";
      id v6 = v4;
      uint32_t v7 = 12;
LABEL_10:
      _os_log_error_impl(&dword_18AA0B000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v12, v7);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  int v8 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  id v9 = v3;
  int v10 = _BKSDisplaySetArrangement(v8, [v9 bytes], objc_msgSend(v9, "length"));
  if (v10)
  {
    int v11 = v10;
    uint64_t v4 = BKLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v12 = 67109120;
      LODWORD(v13) = v11;
      uint64_t v5 = "Error sending arrangement: 0x%x";
      id v6 = v4;
      uint32_t v7 = 8;
      goto LABEL_10;
    }
LABEL_7:
  }
}

void BKSDisplayServicesDrawPersistentScreenSnapshot()
{
  int v0 = [getCADisplayClass() mainDisplay];
  id v2 = +[BKSDisplayRenderOverlayDescriptor descriptorWithName:@"BKSDisplayServicesDrawPersistentScreenSnapshot" display:v0];

  id v1 = [[BKSDisplayRenderOverlay alloc] initWithDescriptor:v2];
  [(BKSDisplayRenderOverlay *)v1 present];
}

void BKSDisplayServicesTearDownPersistentScreenSnapshot()
{
  int v0 = [getCADisplayClass() mainDisplay];
  id v1 = +[BKSDisplayRenderOverlay existingOverlayForDisplay:v0];

  [v1 dismiss];
}

BKSDisplayRenderOverlay *BKSDisplayServicesGetRenderOverlayForDisplay(void *a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    int v10 = NSString;
    getCADisplayClass();
    int v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    id v13 = [v10 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v12];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [NSString stringWithUTF8String:"BKSDisplayRenderOverlay * _Nonnull BKSDisplayServicesGetRenderOverlayForDisplay(CADisplay *__strong _Nonnull)"];
      *(_DWORD *)buffer = 138544130;
      __int16 v25 = v14;
      __int16 v26 = 2114;
      __int16 v27 = @"BKSDisplayServices.m";
      __int16 v28 = 1024;
      int v29 = 531;
      __int16 v30 = 2114;
      v31 = v13;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA41600);
  }
  id v2 = v1;
  getCADisplayClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v15 = NSString;
    id v16 = (objc_class *)[v2 classForCoder];
    if (!v16) {
      id v16 = (objc_class *)objc_opt_class();
    }
    uint64_t v17 = NSStringFromClass(v16);
    getCADisplayClass();
    mach_port_name_t v18 = (objc_class *)objc_opt_class();
    long long v19 = NSStringFromClass(v18);
    long long v20 = [v15 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v17, v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v21 = [NSString stringWithUTF8String:"BKSDisplayRenderOverlay * _Nonnull BKSDisplayServicesGetRenderOverlayForDisplay(CADisplay *__strong _Nonnull)"];
      *(_DWORD *)buffer = 138544130;
      __int16 v25 = v21;
      __int16 v26 = 2114;
      __int16 v27 = @"BKSDisplayServices.m";
      __int16 v28 = 1024;
      int v29 = 531;
      __int16 v30 = 2114;
      v31 = v20;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)buffer, 0x26u);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA41718);
  }

  id v3 = [v2 uniqueId];
  bzero(buffer, 0x400uLL);
  if (v3) {
    CFStringGetCString(v3, buffer, 1024, 0x8000100u);
  }
  uint64_t v23 = 0;
  unsigned int v22 = 0;
  mach_port_name_t v4 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  uint64_t v5 = 0;
  if (!_BKSDisplayRenderOverlay(v4, buffer, &v23, &v22))
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", v23, v22);
    if (v6)
    {
      uint32_t v7 = +[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode];
      int v8 = +[BKSDisplayRenderOverlayDescriptor bs_secureDecodedFromData:v6 withAdditionalClasses:v7];

      if (v8) {
        uint64_t v5 = [[BKSDisplayRenderOverlay alloc] initWithDescriptor:v8];
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  return v5;
}

BOOL BKSDisplayServicesApplyRenderOverlay(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  if (!v5)
  {
    int v12 = NSString;
    id v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    int v15 = [v12 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"overlay", v14];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v16 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BKSDisplayServicesApplyRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull, BSAnimationSettings *__strong _Nullable)");
      *(_DWORD *)buf = 138544130;
      __int16 v25 = v16;
      __int16 v26 = 2114;
      __int16 v27 = @"BKSDisplayServices.m";
      __int16 v28 = 1024;
      int v29 = 557;
      __int16 v30 = 2114;
      v31 = v15;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA41984);
  }
  id v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = NSString;
    mach_port_name_t v18 = (objc_class *)[v6 classForCoder];
    if (!v18) {
      mach_port_name_t v18 = (objc_class *)objc_opt_class();
    }
    long long v19 = NSStringFromClass(v18);
    long long v20 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v20);
    unsigned int v22 = [v17 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"overlay", v19, v21];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BKSDisplayServicesApplyRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull, BSAnimationSettings *__strong _Nullable)");
      *(_DWORD *)buf = 138544130;
      __int16 v25 = v23;
      __int16 v26 = 2114;
      __int16 v27 = @"BKSDisplayServices.m";
      __int16 v28 = 1024;
      int v29 = 557;
      __int16 v30 = 2114;
      v31 = v22;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA41A9CLL);
  }

  [getCATransactionClass() flush];
  [getCATransactionClass() synchronize];
  uint32_t v7 = [v6 _descriptor];
  int v8 = objc_msgSend(v7, "bs_secureEncoded");

  id v9 = objc_msgSend(v4, "bs_secureEncoded");
  LODWORD(v7) = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  BOOL v10 = _BKSDisplayApplyRenderOverlay((mach_port_t)v7, objc_msgSend(v8, "bs_bytesForMIG"), objc_msgSend(v8, "bs_lengthForMIG"), objc_msgSend(v9, "bs_bytesForMIG"), objc_msgSend(v9, "bs_lengthForMIG")) == 0;

  return v10;
}

id getCATransactionClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  int v0 = (void *)getCATransactionClass_softClass;
  uint64_t v7 = getCATransactionClass_softClass;
  if (!getCATransactionClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCATransactionClass_block_invoke;
    v3[3] = &unk_1E5441630;
    v3[4] = &v4;
    __getCATransactionClass_block_invoke((uint64_t)v3);
    int v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AA41B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCATransactionClass_block_invoke(uint64_t a1)
{
  QuartzCoreLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CATransaction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCATransactionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCATransactionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BKSDisplayServices.m", 43, @"Unable to find class %s", "CATransaction");

    __break(1u);
  }
}

BOOL BKSDisplayServicesRemoveRenderOverlay(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 _descriptor];
  id v5 = objc_msgSend(v4, "bs_secureEncoded");

  uint64_t v6 = objc_msgSend(v3, "bs_secureEncoded");

  LODWORD(v3) = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  BOOL v7 = _BKSDisplayRemoveRenderOverlay((mach_port_t)v3, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"), objc_msgSend(v6, "bs_bytesForMIG"), objc_msgSend(v6, "bs_lengthForMIG")) == 0;

  return v7;
}

BOOL BKSDisplayServicesFreezeRenderOverlay(void *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1)
  {
    BOOL v7 = NSString;
    int v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    BOOL v10 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"overlay", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v11 = [NSString stringWithUTF8String:"BOOL BKSDisplayServicesFreezeRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull)"];
      *(_DWORD *)buf = 138544130;
      long long v20 = v11;
      __int16 v21 = 2114;
      unsigned int v22 = @"BKSDisplayServices.m";
      __int16 v23 = 1024;
      int v24 = 581;
      __int16 v25 = 2114;
      __int16 v26 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA41F48);
  }
  id v2 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v12 = NSString;
    id v13 = (objc_class *)[v2 classForCoder];
    if (!v13) {
      id v13 = (objc_class *)objc_opt_class();
    }
    uint64_t v14 = NSStringFromClass(v13);
    int v15 = (objc_class *)objc_opt_class();
    id v16 = NSStringFromClass(v15);
    uint64_t v17 = [v12 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"overlay", v14, v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      mach_port_name_t v18 = [NSString stringWithUTF8String:"BOOL BKSDisplayServicesFreezeRenderOverlay(BKSDisplayRenderOverlay *__strong _Nonnull)"];
      *(_DWORD *)buf = 138544130;
      long long v20 = v18;
      __int16 v21 = 2114;
      unsigned int v22 = @"BKSDisplayServices.m";
      __int16 v23 = 1024;
      int v24 = 581;
      __int16 v25 = 2114;
      __int16 v26 = v17;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA42060);
  }

  id v3 = [v2 _descriptor];
  uint64_t v4 = objc_msgSend(v3, "bs_secureEncoded");

  LODWORD(v3) = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  BOOL v5 = _BKSDisplayFreezeRenderOverlay((mach_port_t)v3, objc_msgSend(v4, "bs_bytesForMIG"), objc_msgSend(v4, "bs_lengthForMIG")) == 0;

  return v5;
}

void BKSDisplayServicesDismissInterstitialRenderOverlay(void *a1)
{
  objc_msgSend(a1, "bs_secureEncoded");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  mach_port_t v1 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  _BKSDisplayDismissInterstitialRenderOverlay(v1, objc_msgSend(v2, "bs_bytesForMIG"), objc_msgSend(v2, "bs_lengthForMIG"));
}

id BKSDisplayServicesGetRenderOverlayDismissActions()
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  unsigned int v19 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.display.services", BKSDisplayServerPort, &BKSDisplayServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateDisplayServicesPort);
  mach_port_t v1 = 0;
  if (!_BKSDisplayGetRenderOverlayDismissActions(v0, &v20, &v19))
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", v20, v19);
    if (v2)
    {
      id v3 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v4 = +[BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode];
      BOOL v5 = objc_msgSend(v3, "bs_secureDecodedFromData:withAdditionalClasses:", v2, v4);

      mach_port_t v1 = [MEMORY[0x1E4F1CA80] set];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (objc_msgSend(v11, "isInterstitial", (void)v15)) {
              int v12 = off_1E5440190;
            }
            else {
              int v12 = off_1E54401A0;
            }
            id v13 = (void *)[objc_alloc(*v12) initWithDescriptor:v11];
            [v1 addObject:v13];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }
        while (v8);
      }
    }
    else
    {
      mach_port_t v1 = 0;
    }
  }
  return v1;
}

void BKSDisplayServicesArchiveWithOptionsAndCompletion(char a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x18C123C50]();
    BOOL v5 = objc_opt_new();
    id v6 = (void *)MEMORY[0x1E4F50BB8];
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = [v6 endpointForServiceName:@"com.apple.backboard.display.archive" oneshot:v7 service:@"DisplayArchive" instance:0];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F50BA0] NSXPCConnectionWithEndpoint:v8 configurator:&__block_literal_global_136];
      BOOL v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED779370];
      int v11 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
      [v10 setClasses:v14 forSelector:sel_nameAndDumpAllWithCompletion_ argumentIndex:0 ofReply:1];

      long long v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      long long v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
      [v10 setClasses:v18 forSelector:sel_dumpAllWithCompletion_ argumentIndex:0 ofReply:1];

      [v9 setRemoteObjectInterface:v10];
      [v9 activate];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_2;
      v37[3] = &unk_1E5440E40;
      id v19 = v5;
      id v38 = v19;
      id v20 = v3;
      id v40 = v20;
      id v21 = v9;
      id v39 = v21;
      uint64_t v22 = [v21 remoteObjectProxyWithErrorHandler:v37];

      if (v22)
      {
        __int16 v23 = BKLogDisplayArchive();
        BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (a1)
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18AA0B000, v23, OS_LOG_TYPE_DEFAULT, "sending name layers and dump all to service", buf, 2u);
          }

          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_148;
          v32[3] = &unk_1E5440E68;
          id v33 = v19;
          id v35 = v20;
          id v21 = v21;
          id v34 = v21;
          [v22 nameAndDumpAllWithCompletion:v32];

          __int16 v25 = v33;
        }
        else
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18AA0B000, v23, OS_LOG_TYPE_DEFAULT, "sending dump all to service", buf, 2u);
          }

          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_150;
          v28[3] = &unk_1E5440E68;
          id v29 = v19;
          id v31 = v20;
          id v21 = v21;
          id v30 = v21;
          [v22 dumpAllWithCompletion:v28];

          __int16 v25 = v29;
        }

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      __int16 v26 = BKLogDisplayArchive();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18AA0B000, v26, OS_LOG_TYPE_ERROR, "failed to lookup endpoint to service", buf, 2u);
      }

      id v21 = 0;
    }
    if ([v5 signal])
    {
      uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4097 userInfo:0];
      (*((void (**)(id, void, void *))v3 + 2))(v3, MEMORY[0x1E4F1CC08], v27);

      [v21 invalidate];
    }
    goto LABEL_17;
  }
LABEL_18:
}

void __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = BKLogDisplayArchive();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_18AA0B000, v4, OS_LOG_TYPE_ERROR, "error talking to service : %@", (uint8_t *)&v5, 0xCu);
  }

  if ([*(id *)(a1 + 32) signal])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) invalidate];
  }
}

void __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_148(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v7 = BKLogDisplayArchive();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEFAULT, "received name layers and dump all response from service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) invalidate];
  }
}

void __BKSDisplayServicesArchiveWithOptionsAndCompletion_block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) signal])
  {
    uint64_t v7 = BKLogDisplayArchive();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_18AA0B000, v7, OS_LOG_TYPE_DEFAULT, "received dump all response from service", v8, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 40) invalidate];
  }
}

void sub_18AA44A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AA456B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBKSTouchAuthenticationInitialSampleEvent(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    mach_port_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    mach_port_t v1 = off_1E5440FB0[a1];
  }
  return v1;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

CFRunLoopSourceRef BKCreateMIGServerSource(uint64_t a1, int a2, CFIndex a3)
{
  return BKCreateMIGServerSourceWithContext(a1, a2, a3, 0);
}

uint64_t migHelperRecievePortCallout(mach_msg_header_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  mach_msg_return_t v21;
  FILE *v23;
  char *v24;

  uint64_t v6 = *(void *)(a4 + 8);
  mach_msg_id_t msgh_id = a1->msgh_id;
  int v8 = *(_DWORD *)(v6 + 8);
  BOOL v9 = __OFSUB__(msgh_id, v8);
  int v10 = msgh_id - v8;
  if (v10 < 0 != v9 || msgh_id >= *(_DWORD *)(v6 + 12))
  {
    int v11 = 0;
  }
  else
  {
    int v11 = *(void (**)(mach_msg_header_t *, mach_msg_header_t *))(v6 + 40 * v10 + 40);
    if (v11)
    {
      char v12 = 0;
      size_t v13 = *(unsigned int *)(v6 + 40 * v10 + 64);
      goto LABEL_7;
    }
  }
  char v12 = 1;
  size_t v13 = 36;
LABEL_7:
  uint64_t v14 = (mach_msg_header_t *)malloc_type_calloc(1uLL, v13, 0xA199083EuLL);
  if (v14)
  {
    long long v15 = v14;
    mach_port_t msgh_remote_port = a1->msgh_remote_port;
    v14->mach_msg_bits_t msgh_bits = a1->msgh_bits & 0x1F;
    v14->msgh_size = 36;
    *(void *)&v14->mach_port_t msgh_remote_port = msgh_remote_port;
    v14->mach_msg_id_t msgh_id = a1->msgh_id + 100;
    if (v12)
    {
      *(void *)&v14[1].mach_msg_bits_t msgh_bits = *MEMORY[0x1E4F14068];
      v14[1].mach_port_t msgh_remote_port = -303;
    }
    else
    {
      uint64_t v17 = *(const void **)(a4 + 16);
      if (v17)
      {
        pthread_setspecific(__BKMIGServerCalloutContextKey, v17);
        v11(a1, v15);
        pthread_setspecific(__BKMIGServerCalloutContextKey, 0);
      }
      else
      {
        v11(a1, v14);
      }
    }
    mach_msg_bits_t msgh_bits = v15->msgh_bits;
    if ((v15->msgh_bits & 0x80000000) == 0)
    {
      mach_port_t v19 = v15[1].msgh_remote_port;
      if (v19 == -305)
      {
LABEL_31:
        free(v15);
        return 0;
      }
      if (v19 && (a1->msgh_bits & 0x80000000) != 0)
      {
        a1->mach_port_t msgh_remote_port = 0;
        mach_msg_destroy(a1);
        mach_msg_bits_t msgh_bits = v15->msgh_bits;
      }
    }
    if (v15->msgh_remote_port)
    {
      if ((msgh_bits & 0x1F) == 0x12) {
        mach_msg_option_t v20 = 1;
      }
      else {
        mach_msg_option_t v20 = 17;
      }
      id v21 = mach_msg(v15, v20, v15->msgh_size, 0, 0, 0, 0);
      if ((v21 - 268435459) >= 2 && v21 != 0)
      {
        __int16 v23 = (FILE *)*MEMORY[0x1E4F143C8];
        BOOL v24 = mach_error_string(v21);
        fprintf(v23, "<CFRunLoopSource MIG Server> mach_msg send error in reply: %s\n", v24);
        goto LABEL_31;
      }
      if ((v21 - 268435459) > 1) {
        goto LABEL_31;
      }
      mach_msg_bits_t msgh_bits = v15->msgh_bits;
    }
    if ((msgh_bits & 0x80000000) != 0) {
      mach_msg_destroy(v15);
    }
    goto LABEL_31;
  }
  return 0;
}

BOOL migHelperEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

CFStringRef migHelperCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, @"<CFRunLoopSource MIG Server> {port = %u, subsystem = %p, CFRunLoopSourceContext context = %p}", *a1, *((void *)a1 + 1), *((void *)a1 + 2));
}

uint64_t BKGetMachPortForMIGServerSource(__CFRunLoopSource *a1)
{
  memset(&context.info, 0, 64);
  context.version = 1;
  CFRunLoopSourceGetContext(a1, &context);
  return *(unsigned int *)context.info;
}

void *BKGetContextForCalloutCurrentMIGServerSource()
{
  return pthread_getspecific(__BKMIGServerCalloutContextKey);
}

void _serverWasRestarted(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x18C123C50]();
  [a2 _serverWasRestarted];
}

uint64_t _BKXXDeliverAccelerometerEvent(double a1, float a2, float a3, float a4, uint64_t a5, uint64_t a6)
{
  int v11 = pthread_getspecific(__BKMIGServerCalloutContextKey);
  char v12 = [v11 delegate];
  *(float *)&double v13 = a2;
  *(float *)&double v14 = a3;
  *(float *)&double v15 = a4;
  [v12 accelerometer:v11 didAccelerateWithTimeStamp:a6 x:a1 y:v13 z:v14 eventType:v15];

  return 0;
}

void sub_18AA4BDB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t BKSDisplayBrightnessTransactionGetTypeID()
{
  if (__BKSDisplayBrightnessTransactionRegisterOnce != -1) {
    dispatch_once(&__BKSDisplayBrightnessTransactionRegisterOnce, &__block_literal_global_6098);
  }
  return __BKSDisplayBrightnessTransactionTypeID;
}

uint64_t __BKSDisplayBrightnessTransactionGetTypeID_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  __BKSDisplayBrightnessTransactionTypeID = result;
  return result;
}

void BKSDisplayBrightnessTransactionDealloc(os_unfair_lock_s *a1)
{
  int v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDFlushDisplayBrightnessUpdates(v2);
  os_unfair_lock_lock(a1 + 4);
  mach_port_name_t os_unfair_lock_opaque = a1[5]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque + 1 >= 2)
  {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], os_unfair_lock_opaque, 1u, -1);
    a1[5]._mach_port_name_t os_unfair_lock_opaque = 0;
  }
  os_unfair_lock_unlock(a1 + 4);
}

_DWORD *BKSDisplayBrightnessTransactionCreate()
{
  if (__BKSDisplayBrightnessTransactionRegisterOnce != -1) {
    dispatch_once(&__BKSDisplayBrightnessTransactionRegisterOnce, &__block_literal_global_6098);
  }
  Instance = (_DWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    mach_port_name_t name = 0;
    if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name)
      || (mach_port_name_t v1 = name,
          Instance[4] = 0,
          Instance[5] = v1,
          int v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort), _BKSHIDBeginDisplayBrightnessTransaction(v2, Instance[5])))
    {
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

uint64_t BKSDisplayBrightnessSet(char a1, float a2)
{
  mach_port_t v4 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDisplayBrightnessValue(v4, a1, a2);
}

uint64_t BKSDisplayBrightnessSetWithImplicitTransaction(float a1)
{
  int v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDisplayBrightnessWithImplicitTransaction(v2, a1);
}

uint64_t BKSDisplayBrightnessRestoreSystemBrightness()
{
  mach_port_t v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDRestoreSystemDisplayBrightness(v0);
}

uint64_t BKSDisplayBrightnessCurveSet(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetDisplayBrightnessCurveValue(v2, a1);
}

uint64_t BKSDisplayBrightnessCurveGetCurrent()
{
  unsigned __int8 v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDGetCurrentDisplayBrightnessCurve(v0, &v2);
  return v2;
}

uint64_t BKSDisplayBrightnessSetAutoBrightnessEnabled(char a1)
{
  mach_port_t v2 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  return _BKSHIDSetAutoDisplayBrightnessEnabled(v2, a1);
}

BOOL BKSDisplayBrightnessIsAutoBrightnessAvailable()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDBrigthnessIsAutoBrightnessAvailable(v0, &v2);
  return v2 != 0;
}

BOOL BKSDisplayBrightnessIsBrightnessLevelControlAvailable()
{
  char v2 = 0;
  int v0 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDBrigthnessIsBrightnessLevelControlAvailable(v0, &v2);
  return v2 != 0;
}

id BKLogCommon()
{
  if (BKLogCommon_onceToken != -1) {
    dispatch_once(&BKLogCommon_onceToken, &__block_literal_global_6245);
  }
  int v0 = (void *)BKLogCommon___logObj;
  return v0;
}

uint64_t __BKLogCommon_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "Common");
  uint64_t v1 = BKLogCommon___logObj;
  BKLogCommon___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogDetailed()
{
  if (BKLogDetailed_onceToken != -1) {
    dispatch_once(&BKLogDetailed_onceToken, &__block_literal_global_4);
  }
  os_log_t v0 = (void *)BKLogDetailed___logObj;
  return v0;
}

uint64_t __BKLogDetailed_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "Detailed");
  uint64_t v1 = BKLogDetailed___logObj;
  BKLogDetailed___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogEventDeliveryBuffering_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "EventDeliveryBuffering");
  uint64_t v1 = BKLogEventDeliveryBuffering___logObj;
  BKLogEventDeliveryBuffering___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogEventDeliveryMatching_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "EventDeliveryMatching");
  uint64_t v1 = BKLogEventDeliveryMatching___logObj;
  BKLogEventDeliveryMatching___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogAlternateSystemApp()
{
  if (BKLogAlternateSystemApp_onceToken != -1) {
    dispatch_once(&BKLogAlternateSystemApp_onceToken, &__block_literal_global_16_6256);
  }
  os_log_t v0 = (void *)BKLogAlternateSystemApp___logObj;
  return v0;
}

uint64_t __BKLogAlternateSystemApp_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "AlternateSystemApp");
  uint64_t v1 = BKLogAlternateSystemApp___logObj;
  BKLogAlternateSystemApp___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogIdleTimer()
{
  if (BKLogIdleTimer_onceToken != -1) {
    dispatch_once(&BKLogIdleTimer_onceToken, &__block_literal_global_19);
  }
  os_log_t v0 = (void *)BKLogIdleTimer___logObj;
  return v0;
}

uint64_t __BKLogIdleTimer_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "IdleTimer");
  uint64_t v1 = BKLogIdleTimer___logObj;
  BKLogIdleTimer___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogBacklight_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "Backlight");
  uint64_t v1 = BKLogBacklight___logObj;
  BKLogBacklight___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogDisplayArchive()
{
  if (BKLogDisplayArchive_onceToken != -1) {
    dispatch_once(&BKLogDisplayArchive_onceToken, &__block_literal_global_28);
  }
  os_log_t v0 = (void *)BKLogDisplayArchive___logObj;
  return v0;
}

uint64_t __BKLogDisplayArchive_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "DisplayArchive");
  uint64_t v1 = BKLogDisplayArchive___logObj;
  BKLogDisplayArchive___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogTouchDeliveryObserver_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "TouchDeliveryObserver");
  uint64_t v1 = BKLogTouchDeliveryObserver___logObj;
  BKLogTouchDeliveryObserver___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogUISensor_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "UISensor");
  uint64_t v1 = BKLogUISensor___logObj;
  BKLogUISensor___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogSystemShell()
{
  if (BKLogSystemShell_onceToken != -1) {
    dispatch_once(&BKLogSystemShell_onceToken, &__block_literal_global_37);
  }
  os_log_t v0 = (void *)BKLogSystemShell___logObj;
  return v0;
}

uint64_t __BKLogSystemShell_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "SystemShell");
  uint64_t v1 = BKLogSystemShell___logObj;
  BKLogSystemShell___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogTouchDeliveryPolicy_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "TouchDeliveryPolicy");
  uint64_t v1 = BKLogTouchDeliveryPolicy___logObj;
  BKLogTouchDeliveryPolicy___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogTouchEvents_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "TouchEvents");
  uint64_t v1 = BKLogTouchEvents___logObj;
  BKLogTouchEvents___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogKeyboard_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "Keyboard");
  uint64_t v1 = BKLogKeyboard___logObj;
  BKLogKeyboard___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogHapticFeedback()
{
  if (BKLogHapticFeedback_onceToken != -1) {
    dispatch_once(&BKLogHapticFeedback_onceToken, &__block_literal_global_52);
  }
  os_log_t v0 = (void *)BKLogHapticFeedback___logObj;
  return v0;
}

uint64_t __BKLogHapticFeedback_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "HapticFeedback");
  uint64_t v1 = BKLogHapticFeedback___logObj;
  BKLogHapticFeedback___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

Class __getCAFenceHandleClass_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary_6337)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    _DWORD v6[2] = (void *)3221225472;
    v6[3] = __QuartzCoreLibraryCore_block_invoke_6338;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5441188;
    uint64_t v8 = 0;
    QuartzCoreLibraryCore_frameworkLibrary_6337 = _sl_dlopen();
  }
  if (!QuartzCoreLibraryCore_frameworkLibrary_6337)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    mach_port_t v4 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"BKSAnimationFence.m", 16, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CAFenceHandle");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getCAFenceHandleClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"BKSAnimationFence.m", 17, @"Unable to find class %s", "CAFenceHandle");

LABEL_10:
    __break(1u);
  }
  getCAFenceHandleClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuartzCoreLibraryCore_block_invoke_6338()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary_6337 = result;
  return result;
}

void sub_18AA4F5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBKSMousePointerDeviceClickHapticStrength(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E54411A0[a1];
  }
  return v1;
}

void BKSTerminateApplicationForReasonAndReportWithDescription(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v9 = a1;
  id v7 = a4;
  if (!v9) {
    __assert_rtn("BKSTerminateApplicationForReasonAndReportWithDescription", "BKSApplicationTermination.m", 19, "bundleID");
  }
  uint64_t v8 = objc_alloc_init(BKSSystemService);
  [(BKSSystemService *)v8 terminateApplication:v9 forReason:a2 andReport:a3 withDescription:v7];
}

id getCADisplayClass_7108()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getCADisplayClass_softClass_7109;
  uint64_t v7 = getCADisplayClass_softClass_7109;
  if (!getCADisplayClass_softClass_7109)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getCADisplayClass_block_invoke_7110;
    v3[3] = &unk_1E5441630;
    v3[4] = &v4;
    __getCADisplayClass_block_invoke_7110((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_18AA51B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCADisplayClass_block_invoke_7110(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary_7111)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    _DWORD v6[2] = (void *)3221225472;
    v6[3] = __QuartzCoreLibraryCore_block_invoke_7112;
    void v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E5441278;
    uint64_t v8 = 0;
    QuartzCoreLibraryCore_frameworkLibrary_7111 = _sl_dlopen();
  }
  if (!QuartzCoreLibraryCore_frameworkLibrary_7111)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"BKSDisplayRenderOverlayDescriptor.m", 16, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("CADisplay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v5 = [NSString stringWithUTF8String:"Class getCADisplayClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"BKSDisplayRenderOverlayDescriptor.m", 17, @"Unable to find class %s", "CADisplay");

LABEL_10:
    __break(1u);
  }
  getCADisplayClass_softClass_7109 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __QuartzCoreLibraryCore_block_invoke_7112()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary_7111 = result;
  return result;
}

__CFString *NSStringFromBKSHIDEventSecureNameStatus(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<status:%d>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E54412B0[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSHIDEventAuthenticationStatus(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<status:%d>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5441290[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSSystemShellCheckInStatus(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E54413A0[a1];
  }
  return v1;
}

void sub_18AA56670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AA56918(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8065(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8066(uint64_t a1)
{
}

id NSStringFromBKSHIDEventHitTestLayerInformationMask(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = v2;
  if ((a1 & 2) != 0)
  {
    [v2 addObject:@"cumulativeOpacity"];
    if ((a1 & 1) == 0)
    {
LABEL_3:
      if ((a1 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"cumulativeTransform"];
  if ((a1 & 0x10) == 0)
  {
LABEL_4:
    if ((a1 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 addObject:@"cumulativeLayerTransform"];
  if ((a1 & 0x20) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 addObject:@"cumulativeContentsTransform"];
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  [v3 addObject:@"backgroundStatistics"];
  if ((a1 & 4) != 0) {
LABEL_7:
  }
    [v3 addObject:@"hasInsecureFilter"];
LABEL_8:
  uint64_t v4 = NSString;
  id v5 = [v3 componentsJoinedByString:@" | "];
  uint64_t v6 = [v4 stringWithFormat:@"(%@)", v5];

  return v6;
}

__CFString *NSStringFromBKSButtonHapticAssetType(unint64_t a1)
{
  if (a1 > 3) {
    return @"<unknown>";
  }
  else {
    return off_1E5441518[a1];
  }
}

void sub_18AA5F328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromBKSWindowServerHitTestOcclusionType(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_1E5441668[a1];
  }
  return v1;
}

void *__getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerHitTestSecurityAnalysisOcclusionType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerHitTestSecurityAnalysisOcclusionTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 24);
  return result;
}

void *QuartzCoreLibrary_9830()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!QuartzCoreLibraryCore_frameworkLibrary_9845)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __QuartzCoreLibraryCore_block_invoke_9846;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_1E5441650;
    uint64_t v6 = 0;
    QuartzCoreLibraryCore_frameworkLibrary_9845 = _sl_dlopen();
  }
  os_log_t v0 = (void *)QuartzCoreLibraryCore_frameworkLibrary_9845;
  if (!QuartzCoreLibraryCore_frameworkLibrary_9845)
  {
    os_log_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"BKSWindowServerHitTestSecurityAnalysis.m", 24, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void *__getkCAWindowServerOcclusionTypeLayerSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerOcclusionTypeLayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerOcclusionTypeLayerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCAWindowServerOcclusionTypeClippedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerOcclusionTypeClipped");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerOcclusionTypeClippedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCAWindowServerOcclusionTypeBorderSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerOcclusionTypeBorder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerOcclusionTypeBorderSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerHitTestSecurityAnalysisOcclusionPercent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerHitTestSecurityAnalysisOcclusionPercentSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

void sub_18AA64DA8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void *__getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerHitTestSecurityAnalysisCumulativeLayerTransformSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                             + 24);
  return result;
}

void *__getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerHitTestSecurityAnalysisCumulativeOpacity");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerHitTestSecurityAnalysisCumulativeOpacitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32)
                                                                                                  + 8)
                                                                                      + 24);
  return result;
}

void *__getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerProperties");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerHitTestSecurityAnalysisParentsHaveInsecureLayerPropertiesSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = QuartzCoreLibrary_9830();
  uint64_t result = dlsym(v2, "kCAWindowServerHitTestSecurityAnalysisIsInsecureFiltered");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCAWindowServerHitTestSecurityAnalysisIsInsecureFilteredSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                       + 24);
  return result;
}

uint64_t __QuartzCoreLibraryCore_block_invoke_9846()
{
  uint64_t result = _sl_dlopen();
  QuartzCoreLibraryCore_frameworkLibrary_9845 = result;
  return result;
}

void _BKSWatchdogSetServerWrapper(id obj)
{
}

BOOL BKSWatchdogGetIsAlive(uint64_t a1)
{
  char v5 = 0;
  id v2 = (void *)BKSWatchdogGetIsAlive_sServerWrapper;
  if (!BKSWatchdogGetIsAlive_sServerWrapper)
  {
    if (_BKSGetWatchdogServerWrapper_onceToken != -1) {
      dispatch_once(&_BKSGetWatchdogServerWrapper_onceToken, &__block_literal_global_9913);
    }
    objc_storeStrong((id *)&BKSWatchdogGetIsAlive_sServerWrapper, (id)__service);
    id v2 = (void *)BKSWatchdogGetIsAlive_sServerWrapper;
  }
  if (objc_msgSend(v2, "_BKSWatchdogGetIsAlive:isAlive:timeout:", _BKSServerPortHelper("com.apple.backboard.watchdog", BKSWatchdogPort, &BKSWatchdogMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateWatchdogPort), &v5, a1))BOOL v3 = 1; {
  else
  }
    BOOL v3 = v5 == 0;
  return !v3;
}

__CFString *NSStringFromBKSHIDHapticFeedbackRequestDeviceType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      id v2 = @"trackpad";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v2 = @"pencil";
  }
  return v2;
}

__CFString *NSStringFromBKSTouchDeliveryUpdateType(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5441688[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSHIDUISensorChangeSource(unint64_t a1)
{
  if (a1 < 5 && ((0x1Bu >> a1) & 1) != 0)
  {
    uint64_t v1 = off_1E54416C0[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromBKSHIDUISensorDisplayState(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E54416E8[a1];
  }
  return v1;
}

void sub_18AA6AD88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18AA6BC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id BKLogOrientationClient()
{
  if (BKLogOrientationClient_onceToken != -1) {
    dispatch_once(&BKLogOrientationClient_onceToken, &__block_literal_global_11843);
  }
  os_log_t v0 = (void *)BKLogOrientationClient___logObj;
  return v0;
}

uint64_t __BKLogOrientationClient_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "OrientationClient");
  uint64_t v1 = BKLogOrientationClient___logObj;
  BKLogOrientationClient___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogOrientationDevice()
{
  if (BKLogOrientationDevice_onceToken != -1) {
    dispatch_once(&BKLogOrientationDevice_onceToken, &__block_literal_global_3);
  }
  os_log_t v0 = (void *)BKLogOrientationDevice___logObj;
  return v0;
}

uint64_t __BKLogOrientationDevice_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "OrientationDevice");
  uint64_t v1 = BKLogOrientationDevice___logObj;
  BKLogOrientationDevice___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __BKLogOrientationGlobal_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "OrientationGlobal");
  uint64_t v1 = BKLogOrientationGlobal___logObj;
  BKLogOrientationGlobal___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id BKLogOrientationHostUI()
{
  if (BKLogOrientationHostUI_onceToken != -1) {
    dispatch_once(&BKLogOrientationHostUI_onceToken, &__block_literal_global_9);
  }
  os_log_t v0 = (void *)BKLogOrientationHostUI___logObj;
  return v0;
}

uint64_t __BKLogOrientationHostUI_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.BackBoard", "OrientationHostUI");
  uint64_t v1 = BKLogOrientationHostUI___logObj;
  BKLogOrientationHostUI___logObj = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(void *a1)
{
  id v1 = a1;
  id v2 = NSString;
  BOOL v3 = [v1 infoDictionary];
  uint64_t v4 = [v2 stringWithFormat:@"missing bundleID for main bundle %@: %@", v1, v3];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    char v5 = [NSString stringWithUTF8String:"void __BKSHIDEvent__BUNDLE_IDENTIFIER_FOR_CURRENT_PROCESS_IS_NIL__(NSBundle *__strong)"];
    *(_DWORD *)buf = 138544130;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    uint64_t v9 = @"BKSHIDEvent.m";
    __int16 v10 = 1024;
    int v11 = 91;
    __int16 v12 = 2114;
    double v13 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t BKSHIDEventRegisterEventCallback(uint64_t a1)
{
  CFRunLoopGetCurrent();
  return BKSHIDEventRegisterEventCallbackOnRunLoop(a1, 0, 0);
}

id BKSHIDEventGetKeyCommandResolutionDescription(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  char v5 = objc_msgSend(v3, "bs_secureEncoded");
  uint64_t v6 = objc_msgSend(v4, "bs_secureEncoded");

  if (v5)
  {
    *(void *)double v15 = 0;
    unsigned int v14 = 0;
    mach_port_t v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    int v8 = _BKSHIDGetKeyCommandResolutionDescription(v7, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"), objc_msgSend(v6, "bs_bytesForMIG"), objc_msgSend(v6, "bs_lengthForMIG"), v15, &v14);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", *(void *)v15, v14);
    __int16 v10 = objc_msgSend(NSString, "bs_secureDecodedFromData:", v9);
    if (v8)
    {
      int v11 = BKLogEventDelivery();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = v8;
        _os_log_error_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_ERROR, "Error sending descriptors: 0x%x", buf, 8u);
      }
    }
  }
  else
  {
    __int16 v12 = BKLogEventDelivery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v15 = 138543362;
      *(void *)&v15[4] = v3;
      _os_log_error_impl(&dword_18AA0B000, v12, OS_LOG_TYPE_ERROR, "Error encoding keyCommand: %{public}@", v15, 0xCu);
    }

    __int16 v10 = 0;
  }

  return v10;
}

id BKSHIDEventGetResolutionDescription(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  char v5 = objc_msgSend(v3, "bs_secureEncoded");
  uint64_t v6 = objc_msgSend(v4, "bs_secureEncoded");

  if (v5)
  {
    *(void *)double v15 = 0;
    unsigned int v14 = 0;
    mach_port_t v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    int v8 = _BKSHIDGetEventResolutionDescription(v7, objc_msgSend(v5, "bs_bytesForMIG"), objc_msgSend(v5, "bs_lengthForMIG"), objc_msgSend(v6, "bs_bytesForMIG"), objc_msgSend(v6, "bs_lengthForMIG"), v15, &v14);
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_dataWithVMAllocatedBytes:length:", *(void *)v15, v14);
    __int16 v10 = objc_msgSend(NSString, "bs_secureDecodedFromData:", v9);
    if (v8)
    {
      int v11 = BKLogEventDelivery();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v17 = v8;
        _os_log_error_impl(&dword_18AA0B000, v11, OS_LOG_TYPE_ERROR, "Error sending descriptors: 0x%x", buf, 8u);
      }
    }
  }
  else
  {
    __int16 v12 = BKLogEventDelivery();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)double v15 = 138543362;
      *(void *)&v15[4] = v3;
      _os_log_error_impl(&dword_18AA0B000, v12, OS_LOG_TYPE_ERROR, "Error encoding eventDescriptor: %{public}@", v15, 0xCu);
    }

    __int16 v10 = 0;
  }

  return v10;
}

void BKSHIDEventSendToApplicationWithBundleIDAndPid(void *a1, uint64_t a2, uint64_t a3)
{
}

void _RedirectEventToClient(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = BKLogEventDelivery();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = a3;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_18AA0B000, v9, OS_LOG_TYPE_DEFAULT, "REDIRECT: SET pid:%d environment:%{public}@", (uint8_t *)v10, 0x12u);
  }

  if (a1)
  {
    if ((int)a3 <= 0) {
      a3 = getpid();
    }
    _BKSHIDEventSetRedirectInfo(a1, a3, v8, v7);
    if (_getHIDEventSystemClient_onceToken != -1) {
      dispatch_once(&_getHIDEventSystemClient_onceToken, &__block_literal_global_411);
    }
    IOHIDEventSystemClientDispatchEvent();
  }
}

void _BKSHIDEventSetRedirectInfo(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  if (a1)
  {
    id v13 = v7;
    id v8 = a4;
    uint64_t v9 = BKSHIDEventGetBaseAttributes(a1);
    __int16 v10 = objc_opt_new();
    [v10 setEnvironment:v8];

    __int16 v11 = [v9 display];
    [v10 setDisplay:v11];

    if (v13)
    {
      objc_msgSend(v10, "setToken:");
    }
    else
    {
      id v12 = [v9 token];
      [v10 setToken:v12];
    }
    objc_msgSend(v10, "setOptions:", objc_msgSend(v9, "options"));
    objc_msgSend(v10, "setSource:", objc_msgSend(v9, "source"));
    [v10 setPid:a2];
    _BKSHIDEventSetAttributes((uint64_t)a1, v10, 3);

    id v7 = v13;
  }
}

void BKSHIDEventSendToApplicationWithBundleIDAndPidAndFollowingFocusChain(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    uint64_t v6 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;
  _RedirectEventToClient(a1, v6, a3, 0);
}

void BKSHIDEventSendToFocusedProcess(void *a1)
{
  id v2 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  _RedirectEventToClient(a1, v2, 0xFFFFFFFFLL, 0);
}

void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    char v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"event != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(IOHIDEventRef, BKSHIDEventDeferringEnvironment *__strong)");
      *(_DWORD *)buf = 138544130;
      id v21 = v6;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEvent.m";
      __int16 v24 = 1024;
      int v25 = 228;
      __int16 v26 = 2114;
      uint64_t v27 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6DD30);
  }
  id v19 = v3;
  if (!v19)
  {
    id v7 = NSString;
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    __int16 v10 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"environment", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(IOHIDEventRef, BKSHIDEventDeferringEnvironment *__strong)");
      *(_DWORD *)buf = 138544130;
      id v21 = v11;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEvent.m";
      __int16 v24 = 1024;
      int v25 = 229;
      __int16 v26 = 2114;
      uint64_t v27 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6DE24);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = NSString;
    id v13 = (objc_class *)[v19 classForCoder];
    if (!v13) {
      id v13 = (objc_class *)objc_opt_class();
    }
    unsigned int v14 = NSStringFromClass(v13);
    double v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    int v17 = [v12 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"environment", v14, v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToResolvedProcessForDeferringEnvironment(IOHIDEventRef, BKSHIDEventDeferringEnvironment *__strong)");
      *(_DWORD *)buf = 138544130;
      id v21 = v18;
      __int16 v22 = 2114;
      __int16 v23 = @"BKSHIDEvent.m";
      __int16 v24 = 1024;
      int v25 = 229;
      __int16 v26 = 2114;
      uint64_t v27 = v17;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6DF3CLL);
  }

  uint64_t v4 = getpid();
  _RedirectEventToClient(a1, v19, v4, 0);
}

void BKSHIDEventSendToProcess(void *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)a2 <= 0)
  {
    id v2 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pid > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v3 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToProcess(IOHIDEventRef, pid_t)");
      *(_DWORD *)buf = 138544130;
      id v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = @"BKSHIDEvent.m";
      __int16 v10 = 1024;
      int v11 = 235;
      __int16 v12 = 2114;
      id v13 = v2;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v2 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6E088);
  }
  if (!a1)
  {
    uint64_t v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"event != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToProcess(IOHIDEventRef, pid_t)");
      *(_DWORD *)buf = 138544130;
      id v7 = v5;
      __int16 v8 = 2114;
      uint64_t v9 = @"BKSHIDEvent.m";
      __int16 v10 = 1024;
      int v11 = 236;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6E15CLL);
  }
  _RedirectEventToClient(a1, 0, a2, 0);
}

void BKSHIDEventSendToProcessAndFollowDeferringRules(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v7 = a4;
  if ((int)a2 <= 0)
  {
    uint64_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pid > 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToProcessAndFollowDeferringRules(IOHIDEventRef, pid_t, BKSHIDEventDeferringToken *__strong, BKSHIDEventDeferringEnvironment *__strong)");
      *(_DWORD *)buf = 138544130;
      double v15 = v10;
      __int16 v16 = 2114;
      int v17 = @"BKSHIDEvent.m";
      __int16 v18 = 1024;
      int v19 = 242;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6E2DCLL);
  }
  if (!a1)
  {
    int v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"event != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSendToProcessAndFollowDeferringRules(IOHIDEventRef, pid_t, BKSHIDEventDeferringToken *__strong, BKSHIDEventDeferringEnvironment *__strong)");
      *(_DWORD *)buf = 138544130;
      double v15 = v12;
      __int16 v16 = 2114;
      int v17 = @"BKSHIDEvent.m";
      __int16 v18 = 1024;
      int v19 = 243;
      __int16 v20 = 2114;
      id v21 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6E3B0);
  }
  __int16 v8 = v7;
  _RedirectEventToClient(a1, v7, a2, v13);
}

_DWORD *BKSHIDEventGetPointerAttributes(void *a1)
{
  int Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 17 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1) {
      goto LABEL_8;
    }
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (!AttributeDataPtr) {
      goto LABEL_9;
    }
    if (AttributeDataPtr[1] && *(unsigned char *)AttributeDataPtr == 5)
    {
      BKSHIDEventGetBaseAttributes(a1);
      AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
LABEL_9:
  return AttributeDataPtr;
}

_DWORD *BKSHIDEventGetKeyboardAttributes(void *a1)
{
  int Type = IOHIDEventGetType();
  AttributeDataPtr = 0;
  if (Type == 3 && a1)
  {
    if (IOHIDEventGetAttributeDataLength() < 1) {
      goto LABEL_8;
    }
    AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
    if (!AttributeDataPtr) {
      goto LABEL_9;
    }
    if (AttributeDataPtr[1] && *(unsigned char *)AttributeDataPtr == 6)
    {
      BKSHIDEventGetBaseAttributes(a1);
      AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_8:
      AttributeDataPtr = 0;
    }
  }
LABEL_9:
  return AttributeDataPtr;
}

_DWORD *BKSHIDEventGetSmartCoverAttributes(void *a1)
{
  BOOL v2 = IOHIDEventGetIntegerValue() != 65289 || a1 == 0;
  if (v2 || IOHIDEventGetAttributeDataLength() < 1) {
    goto LABEL_10;
  }
  AttributeDataPtr = (_DWORD *)IOHIDEventGetAttributeDataPtr();
  if (!AttributeDataPtr) {
    goto LABEL_11;
  }
  if (AttributeDataPtr[1] && *(unsigned char *)AttributeDataPtr == 4)
  {
    BKSHIDEventGetBaseAttributes(a1);
    AttributeDataPtr = (_DWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_10:
    AttributeDataPtr = 0;
  }
LABEL_11:
  return AttributeDataPtr;
}

uint64_t BKSHIDEventCopyDisplayIDFromEvent(void *a1)
{
  if (!a1) {
    return 0;
  }
  if (IOHIDEventGetAttributeDataLength() < 1) {
    return 0;
  }
  AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr();
  if (!AttributeDataPtr || !*((_DWORD *)AttributeDataPtr + 1) || *AttributeDataPtr - 1 > 2) {
    return 0;
  }
  id v3 = BKSHIDEventGetBaseAttributes(a1);
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 display];
    uint64_t v6 = [v5 _hardwareIdentifier];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t BKSHIDEventGetContextIDFromEvent(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = BKSHIDEventGetBaseAttributes(a1);
  BOOL v2 = v1;
  if (v1)
  {
    id v3 = [v1 token];
    uint64_t v4 = [v3 _identifierOfCAContext];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void *BKSHIDEventGetSourceFromKeyboardEvent(void *result)
{
  if (result)
  {
    id v1 = BKSHIDEventGetBaseAttributes(result);
    uint64_t v2 = [v1 source];

    return (void *)v2;
  }
  return result;
}

uint64_t BKSHIDEventGetIsSystemAppEventFromEvent(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = BKSHIDEventGetBaseAttributes(a1);
  uint64_t v2 = [v1 environment];
  uint64_t v3 = [v2 _isSystemEnvironment];

  return v3;
}

void BKSHIDEventSetBaseAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v3 = objc_opt_class();
  if (([v3 isEqual:objc_opt_class()] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"no classes other than BKSHIDEventBaseAttributes allowed, not even %@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetBaseAttributes(IOHIDEventRef, BKSHIDEventBaseAttributes *__strong)");
      *(_DWORD *)buf = 138544130;
      __int16 v8 = v5;
      __int16 v9 = 2114;
      __int16 v10 = @"BKSHIDEvent.m";
      __int16 v11 = 1024;
      int v12 = 501;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6E880);
  }
  _BKSHIDEventSetAttributes(a1, v6, 1);
}

void BKSHIDEventSetDigitizerAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v3 = objc_opt_class();
  if (([v3 isEqual:objc_opt_class()] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"no classes other than BKSHIDEventDigitizerAttributes allowed, not even %@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetDigitizerAttributes(IOHIDEventRef, BKSHIDEventDigitizerAttributes *__strong)");
      *(_DWORD *)buf = 138544130;
      __int16 v8 = v5;
      __int16 v9 = 2114;
      __int16 v10 = @"BKSHIDEvent.m";
      __int16 v11 = 1024;
      int v12 = 507;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6E9FCLL);
  }
  _BKSHIDEventSetAttributes(a1, v6, 2);
}

void BKSHIDEventSetPointerAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v3 = objc_opt_class();
  if (([v3 isEqual:objc_opt_class()] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"no classes other than BKSHIDEventPointerAttributes allowed, not even %@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetPointerAttributes(IOHIDEventRef, BKSHIDEventPointerAttributes *__strong)");
      *(_DWORD *)buf = 138544130;
      __int16 v8 = v5;
      __int16 v9 = 2114;
      __int16 v10 = @"BKSHIDEvent.m";
      __int16 v11 = 1024;
      int v12 = 513;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6EB78);
  }
  _BKSHIDEventSetAttributes(a1, v6, 5);
}

void BKSHIDEventSetKeyboardAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v3 = objc_opt_class();
  if (([v3 isEqual:objc_opt_class()] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"no classes other than BKSHIDEventKeyboardAttributes allowed, not even %@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetKeyboardAttributes(IOHIDEventRef, BKSHIDEventKeyboardAttributes *__strong)");
      *(_DWORD *)buf = 138544130;
      __int16 v8 = v5;
      __int16 v9 = 2114;
      __int16 v10 = @"BKSHIDEvent.m";
      __int16 v11 = 1024;
      int v12 = 519;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6ECF4);
  }
  _BKSHIDEventSetAttributes(a1, v6, 6);
}

void BKSHIDEventSetProximityAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v3 = objc_opt_class();
  if (([v3 isEqual:objc_opt_class()] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"no classes other than BKSHIDEventProximityAttributes allowed, not even %@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetProximityAttributes(IOHIDEventRef, BKSHIDEventProximityAttributes *__strong)");
      *(_DWORD *)buf = 138544130;
      __int16 v8 = v5;
      __int16 v9 = 2114;
      __int16 v10 = @"BKSHIDEvent.m";
      __int16 v11 = 1024;
      int v12 = 525;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6EE70);
  }
  _BKSHIDEventSetAttributes(a1, v6, 7);
}

void BKSHIDEventSetSmartCoverAttributes(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v3 = objc_opt_class();
  if (([v3 isEqual:objc_opt_class()] & 1) == 0)
  {
    uint64_t v4 = [NSString stringWithFormat:@"no classes other than BKSHIDEventSmartCoverAttributes allowed, not even %@", objc_opt_class()];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventSetSmartCoverAttributes(IOHIDEventRef, BKSHIDEventSmartCoverAttributes *__strong)");
      *(_DWORD *)buf = 138544130;
      __int16 v8 = v5;
      __int16 v9 = 2114;
      __int16 v10 = @"BKSHIDEvent.m";
      __int16 v11 = 1024;
      int v12 = 531;
      __int16 v13 = 2114;
      uint64_t v14 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6EFECLL);
  }
  _BKSHIDEventSetAttributes(a1, v6, 4);
}

void BKSHIDEventSetSimpleInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, char a6)
{
  id v15 = (id)objc_opt_new();
  if (a6) {
    +[BKSHIDEventDeferringEnvironment systemEnvironment];
  }
  else {
  int v12 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  }
  [v15 setEnvironment:v12];
  if (a5)
  {
    __int16 v13 = +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:a5];
    [v15 setToken:v13];
  }
  if (a4)
  {
    uint64_t v14 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:a4];
    [v15 setDisplay:v14];
  }
  [v15 setSource:a2];
  if (a3) {
    [v15 setOptions:1];
  }
  _BKSHIDEventSetAttributes(a1, v15, 1);
}

void BKSHIDEventSetSimpleDeliveryInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id v7 = +[BKSHIDEventBaseAttributes baseAttributesFromProvider:a4];
  [v7 setSource:a2];
  if (a3) {
    [v7 setOptions:1];
  }
  _BKSHIDEventSetAttributes(a1, v7, 1);
}

void *BKSHIDEventGetButtonIsCancelledFromButtonEvent(void *a1)
{
  id v1 = a1;
  if (a1)
  {
    if (IOHIDEventGetType() == 3)
    {
      uint64_t v2 = BKSHIDEventGetBaseAttributes(v1);
      id v1 = (void *)([v2 options] & 1);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

uint64_t BKSHIDEventGetSystemGestureStatusFromDigitizerEvent(void *a1)
{
  id v1 = BKSHIDEventGetDigitizerAttributes(a1);
  uint64_t v2 = [v1 systemGesturesPossible];

  return v2;
}

uint64_t BKSHIDEventGetIsSystemGestureStateChangeFromDigitizerEvent(void *a1)
{
  id v1 = BKSHIDEventGetDigitizerAttributes(a1);
  uint64_t v2 = [v1 systemGestureStateChange];

  return v2;
}

uint64_t BKSHIDEventGetTouchStreamIdentifier(void *a1)
{
  id v1 = BKSHIDEventGetDigitizerAttributes(a1);
  uint64_t v2 = [v1 touchStreamIdentifier];

  return v2;
}

double BKSHIDEventGetInitialTouchTimestampFromDigitizerEvent(void *a1)
{
  id v1 = BKSHIDEventGetDigitizerAttributes(a1);
  [v1 initialTouchTimestamp];
  double v3 = v2;

  return v3;
}

float BKSHIDEventGetMaximumForceFromDigitizerEvent(void *a1)
{
  id v1 = BKSHIDEventGetDigitizerAttributes(a1);
  [v1 maximumForce];
  float v3 = v2;

  return v3;
}

double BKSHIDEventGetPointFromDigitizerEvent(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v4 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"digitizerEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = [NSString stringWithUTF8String:"CGPoint BKSHIDEventGetPointFromDigitizerEvent(IOHIDEventRef)"];
      *(_DWORD *)buf = 138544130;
      __int16 v9 = v5;
      __int16 v10 = 2114;
      __int16 v11 = @"BKSHIDEvent.m";
      __int16 v12 = 1024;
      int v13 = 644;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6F49CLL);
  }
  if (IOHIDEventGetType() != 11)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"event is the wrong type: %d", IOHIDEventGetType());
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v7 = [NSString stringWithUTF8String:"CGPoint BKSHIDEventGetPointFromDigitizerEvent(IOHIDEventRef)"];
      *(_DWORD *)buf = 138544130;
      __int16 v9 = v7;
      __int16 v10 = 2114;
      __int16 v11 = @"BKSHIDEvent.m";
      __int16 v12 = 1024;
      int v13 = 645;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6F574);
  }
  IOHIDEventGetFloatValue();
  double v2 = v1;
  IOHIDEventGetFloatValue();
  return v2;
}

uint64_t BKSHIDEventDigitizerGetTouchIdentifier(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathCollectionEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "BKSHIDEventTouchIdentifier BKSHIDEventDigitizerGetTouchIdentifier(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      __int16 v10 = v6;
      __int16 v11 = 2114;
      __int16 v12 = @"BKSHIDEvent.m";
      __int16 v13 = 1024;
      int v14 = 652;
      __int16 v15 = 2114;
      uint64_t v16 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6F6BCLL);
  }
  if (!a2)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = objc_msgSend(NSString, "stringWithUTF8String:", "BKSHIDEventTouchIdentifier BKSHIDEventDigitizerGetTouchIdentifier(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      __int16 v10 = v8;
      __int16 v11 = 2114;
      __int16 v12 = @"BKSHIDEvent.m";
      __int16 v13 = 1024;
      int v14 = 653;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6F790);
  }
  double v2 = _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  uint64_t v3 = [v2 touchIdentifier];

  return v3;
}

uint64_t BKSHIDEventDigitizerGetTouchUserIdentifier(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    char v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathCollectionEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t BKSHIDEventDigitizerGetTouchUserIdentifier(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      __int16 v10 = v6;
      __int16 v11 = 2114;
      __int16 v12 = @"BKSHIDEvent.m";
      __int16 v13 = 1024;
      int v14 = 659;
      __int16 v15 = 2114;
      uint64_t v16 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6F8D8);
  }
  if (!a2)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t BKSHIDEventDigitizerGetTouchUserIdentifier(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      __int16 v10 = v8;
      __int16 v11 = 2114;
      __int16 v12 = @"BKSHIDEvent.m";
      __int16 v13 = 1024;
      int v14 = 660;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6F9ACLL);
  }
  double v2 = _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  uint64_t v3 = [v2 userIdentifier];

  return v3;
}

float BKSHIDEventGetZGradientFromDigitizerEventForPathEvent(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathCollectionEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_msgSend(NSString, "stringWithUTF8String:", "float BKSHIDEventGetZGradientFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      __int16 v11 = v7;
      __int16 v12 = 2114;
      __int16 v13 = @"BKSHIDEvent.m";
      __int16 v14 = 1024;
      int v15 = 673;
      __int16 v16 = 2114;
      uint64_t v17 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6FAFCLL);
  }
  if (!a2)
  {
    __int16 v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = objc_msgSend(NSString, "stringWithUTF8String:", "float BKSHIDEventGetZGradientFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      __int16 v11 = v9;
      __int16 v12 = 2114;
      __int16 v13 = @"BKSHIDEvent.m";
      __int16 v14 = 1024;
      int v15 = 674;
      __int16 v16 = 2114;
      uint64_t v17 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6FBD0);
  }
  double v2 = _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  [v2 zGradient];
  float v4 = v3;

  return v4;
}

double BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(void *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    __int16 v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathCollectionEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      int v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = @"BKSHIDEvent.m";
      __int16 v18 = 1024;
      int v19 = 680;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6FD80);
  }
  if (!a2)
  {
    __int16 v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      int v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = @"BKSHIDEvent.m";
      __int16 v18 = 1024;
      int v19 = 681;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA6FE54);
  }
  double v2 = _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  float v3 = v2;
  if (v2)
  {
    [v2 hitTestLocationX];
    double v5 = v4;
    [v3 hitTestLocationY];
  }
  else
  {
    if (IOHIDEventGetType() != 11)
    {
      __int16 v12 = objc_msgSend(NSString, "stringWithFormat:", @"event is the wrong type: %d", IOHIDEventGetType());
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint BKSHIDEventGetHitTestPointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
        *(_DWORD *)buf = 138544130;
        int v15 = v13;
        __int16 v16 = 2114;
        uint64_t v17 = @"BKSHIDEvent.m";
        __int16 v18 = 1024;
        int v19 = 686;
        __int16 v20 = 2114;
        id v21 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA6FF2CLL);
    }
    IOHIDEventGetFloatValue();
    double v5 = v6;
    IOHIDEventGetFloatValue();
  }

  return v5;
}

double BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(void *a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    __int16 v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathCollectionEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      int v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = @"BKSHIDEvent.m";
      __int16 v18 = 1024;
      int v19 = 692;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA700D8);
  }
  if (!a2)
  {
    __int16 v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"pathEvent"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
      *(_DWORD *)buf = 138544130;
      int v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = @"BKSHIDEvent.m";
      __int16 v18 = 1024;
      int v19 = 693;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA701ACLL);
  }
  double v2 = _BKSHIDEventGetSubEventInfoFromDigitierEventForPathEvent(a1, a2);
  float v3 = v2;
  if (v2)
  {
    [v2 preciseLocationX];
    double v5 = v4;
    [v3 preciseLocationY];
  }
  else
  {
    if (IOHIDEventGetType() != 11)
    {
      __int16 v12 = objc_msgSend(NSString, "stringWithFormat:", @"event is the wrong type: %d", IOHIDEventGetType());
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = objc_msgSend(NSString, "stringWithUTF8String:", "CGPoint BKSHIDEventGetPrecisePointFromDigitizerEventForPathEvent(IOHIDEventRef, IOHIDEventRef)");
        *(_DWORD *)buf = 138544130;
        int v15 = v13;
        __int16 v16 = 2114;
        uint64_t v17 = @"BKSHIDEvent.m";
        __int16 v18 = 1024;
        int v19 = 700;
        __int16 v20 = 2114;
        id v21 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA70284);
    }
    IOHIDEventGetFloatValue();
    double v5 = v6;
    IOHIDEventGetFloatValue();
  }

  return v5;
}

void BKSHIDEventSetDigitizerInfo(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, double a6, float a7)
{
}

void BKSHIDEventSetDigitizerInfoWithSubEventInfoAndTouchStreamIdentifier(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, double a9, float a10)
{
  if (a1)
  {
    LODWORD(v11) = a7;
    uint64_t v27 = objc_alloc_init(BKSHIDEventDigitizerAttributes);
    __int16 v20 = +[BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:a2];
    [(BKSHIDEventBaseAttributes *)v27 setToken:v20];

    if (a6)
    {
      uint64_t v22 = +[BKSHIDEventDisplay displayWithHardwareIdentifier:a6];
      [(BKSHIDEventBaseAttributes *)v27 setDisplay:v22];
    }
    *(float *)&double v21 = a10;
    [(BKSHIDEventDigitizerAttributes *)v27 setMaximumForce:v21];
    [(BKSHIDEventDigitizerAttributes *)v27 setInitialTouchTimestamp:a9];
    [(BKSHIDEventDigitizerAttributes *)v27 setTouchStreamIdentifier:a5];
    [(BKSHIDEventDigitizerAttributes *)v27 setSystemGesturesPossible:a3 != 0];
    [(BKSHIDEventDigitizerAttributes *)v27 setSystemGestureStateChange:a4 != 0];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v11)
    {
      uint64_t v11 = v11;
      uint64_t v24 = a8 + 16;
      do
      {
        int v25 = objc_alloc_init(BKSHIDEventDigitizerPathAttributes);
        [(BKSHIDEventDigitizerPathAttributes *)v25 setPathIndex:*(unsigned int *)(v24 - 16)];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setTouchIdentifier:*(unsigned int *)(v24 - 12)];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setUserIdentifier:*(unsigned int *)(v24 - 8)];
        LODWORD(v26) = *(_DWORD *)v24;
        [(BKSHIDEventDigitizerPathAttributes *)v25 setZGradient:v26];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setLocus:*(unsigned __int8 *)(v24 - 4)];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setHitTestLocationX:*(float *)(v24 + 4)];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setHitTestLocationY:*(float *)(v24 + 8)];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setPreciseLocationX:*(float *)(v24 + 12)];
        [(BKSHIDEventDigitizerPathAttributes *)v25 setPreciseLocationY:*(float *)(v24 + 16)];
        [v23 addObject:v25];

        v24 += 36;
        --v11;
      }
      while (v11);
    }
    [(BKSHIDEventDigitizerAttributes *)v27 setPathAttributes:v23];
    _BKSHIDEventSetAttributes(a1, v27, 2);
  }
}

void BKSHIDEventSetDigitizerInfoWithSubEventInfos(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, uint64_t a7, double a8, float a9)
{
}

void BKSHIDEventSetDigitizerInfoWithTouchStreamIdentifier(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, double a7, float a8)
{
}

__CFString *NSStringFromBKSHIDEventSmartCoverState(int a1)
{
  if ((a1 - 1) > 2) {
    return @"unknown";
  }
  else {
    return off_1E5441A08[a1 - 1];
  }
}

uint64_t BKSHIDEventGetSmartCoverStateFromEvent(void *a1)
{
  double v1 = BKSHIDEventGetSmartCoverAttributes(a1);
  uint64_t v2 = [v1 smartCoverState];

  return v2;
}

void BKSHIDEventSetSmartCoverInfo(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    BKSHIDEventGetSmartCoverAttributes(a1);
    double v6 = (BKSHIDEventSmartCoverAttributes *)objc_claimAutoreleasedReturnValue();
    if (!v6) {
      double v6 = objc_alloc_init(BKSHIDEventSmartCoverAttributes);
    }
    id v7 = v6;
    [(BKSHIDEventSmartCoverAttributes *)v6 setSmartCoverState:a2];
    [(BKSHIDEventSmartCoverAttributes *)v7 setWakeAnimationStyle:a3];
    _BKSHIDEventSetAttributes((uint64_t)a1, v7, 4);
  }
}

void BKSHIDEventSetRemoteTimestamp(uint64_t a1, uint64_t a2)
{
  _BKSHIDEventClearRemoteTimestamp(a1);
  if (a2)
  {
    VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
    IOHIDEventAppendEvent();
    CFRelease(VendorDefinedEvent);
  }
}

void _BKSHIDEventClearRemoteTimestamp(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = ___BKSHIDEventClearRemoteTimestamp_block_invoke;
  v13[3] = &unk_1E5441948;
  id v3 = v2;
  id v14 = v3;
  BKSHIDEventEnumerateChildEvents(a1, v13);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        IOHIDEventRemoveEvent();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v6);
  }

  BKSHIDEventEnumerateChildEvents(a1, &__block_literal_global_427);
}

void BKSHIDEventEnumerateChildEvents(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void (**)(void, void, void, void))v3;
  if (a1)
  {
    if (v3)
    {
      CFArrayRef Children = (const __CFArray *)IOHIDEventGetChildren();
      if (Children)
      {
        CFArrayRef v6 = Children;
        CFIndex Count = CFArrayGetCount(Children);
        char v11 = 0;
        if (Count >= 1)
        {
          CFIndex v8 = Count;
          uint64_t v9 = 1;
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v6, v9 - 1);
            ((void (**)(void, const void *, uint64_t, char *))v4)[2](v4, ValueAtIndex, v9 - 1, &v11);
            if (v9 >= v8) {
              break;
            }
            ++v9;
          }
          while (!v11);
        }
      }
    }
  }
}

uint64_t BKSHIDEventGetRemoteTimestamp()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  IOHIDEventGetChildren();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v1; ++i)
      {
        if (*(void *)v11 != v2) {
          objc_enumerationMutation(v0);
        }
        int Type = IOHIDEventGetType();
        uint64_t IntegerValue = IOHIDEventGetIntegerValue();
        uint64_t v6 = IOHIDEventGetIntegerValue();
        if (Type == 1
          && (IntegerValue == 65308 || IntegerValue == 65280)
          && v6 == 258
          && (unint64_t)IOHIDEventGetIntegerValue() >= 8)
        {
          DataValue = (uint64_t *)IOHIDEventGetDataValue();
          if (DataValue)
          {
            uint64_t v1 = *DataValue;
            goto LABEL_19;
          }
        }
      }
      uint64_t v1 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v1) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  return v1;
}

__CFString *NSStringFromBKSHIDTouchLocus(unsigned int a1)
{
  if (a1 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%d>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5441A90[a1];
  }
  return v1;
}

__CFString *NSStringFromBKSTouchStreamIdentifier(unsigned int a1)
{
  if (a1 < 6 && ((0x2Fu >> a1) & 1) != 0)
  {
    uint64_t v1 = off_1E5441AB8[a1];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %u>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id _BKSHIDEventGetConciseDescriptionKeyboard(void *a1, uint64_t a2)
{
  uint64_t SenderID = IOHIDEventGetSenderID();
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v41 = IOHIDEventGetIntegerValue();
  uint64_t v5 = IOHIDEventGetIntegerValue();
  uint64_t v6 = IOHIDEventGetIntegerValue();
  unsigned int Phase = IOHIDEventGetPhase();
  uint64_t v8 = IOHIDEventGetIntegerValue();
  uint64_t v9 = BKSHIDEventGetBaseAttributes(a1);
  uint64_t v45 = v5;
  uint64_t v43 = NSString;
  if (v5 == 7)
  {
    long long v10 = @"KeyPress";
    goto LABEL_3;
  }
  int v14 = v6 | (v5 << 16);
  if (v14 > 786559)
  {
    if (v14 > 786657)
    {
      if (v14 <= 786976)
      {
        if (v14 > 786864)
        {
          if (v14 > 786947)
          {
            if (v14 == 786948)
            {
              long long v10 = @"ACExit";
              goto LABEL_3;
            }
            if (v14 == 786953)
            {
              long long v10 = @"Options";
              goto LABEL_3;
            }
          }
          else
          {
            if (v14 == 786865)
            {
              long long v10 = @"Slideshow";
              goto LABEL_3;
            }
            if (v14 == 786874)
            {
              long long v10 = @"DigitalWallet";
              goto LABEL_3;
            }
          }
        }
        else if (v14 > 786665)
        {
          if (v14 == 786666)
          {
            long long v10 = @"VolumeDecrement";
            goto LABEL_3;
          }
          if (v14 == 786846)
          {
            long long v10 = @"TerminalLock";
            goto LABEL_3;
          }
        }
        else
        {
          if (v14 == 786658)
          {
            long long v10 = @"ToggleMute";
            goto LABEL_3;
          }
          if (v14 == 786665)
          {
            long long v10 = @"VolumeIncrement";
            goto LABEL_3;
          }
        }
        goto LABEL_196;
      }
      if (v14 <= 787035)
      {
        if (v14 > 786979)
        {
          if (v14 == 786980)
          {
            long long v10 = @"ACBack";
            goto LABEL_3;
          }
          if (v14 == 787035)
          {
            long long v10 = @"Like";
            goto LABEL_3;
          }
        }
        else
        {
          if (v14 == 786977)
          {
            long long v10 = @"ACSearch";
            goto LABEL_3;
          }
          if (v14 == 786979)
          {
            long long v10 = @"ACHome";
            goto LABEL_3;
          }
        }
        goto LABEL_196;
      }
      if (v14 <= 787100)
      {
        if (v14 == 787036)
        {
          long long v10 = @"Dislike";
          goto LABEL_3;
        }
        if (v14 == 787042)
        {
          long long v10 = @"AddToWishlist";
          goto LABEL_3;
        }
        goto LABEL_196;
      }
      if (v14 == 787101)
      {
        long long v10 = @"KeyboardLayoutSelect";
        goto LABEL_3;
      }
      if (v14 != 16711683) {
        goto LABEL_196;
      }
      goto LABEL_149;
    }
    if (v14 <= 786607)
    {
      switch(v14)
      {
        case 786564:
          long long v10 = @"Tuning";
          break;
        case 786565:
        case 786567:
        case 786568:
        case 786570:
        case 786571:
        case 786572:
          goto LABEL_196;
        case 786566:
LABEL_150:
          long long v10 = @"Home";
          break;
        case 786569:
          long long v10 = @"Provider";
          break;
        case 786573:
          long long v10 = @"Guide";
          break;
        default:
          if (v14 == 786560)
          {
LABEL_151:
            long long v10 = @"Select";
          }
          else
          {
            if (v14 != 786581) {
              goto LABEL_196;
            }
            long long v10 = @"Side";
          }
          break;
      }
    }
    else
    {
      switch(v14)
      {
        case 786608:
          long long v10 = @"Play";
          break;
        case 786609:
          long long v10 = @"Pause";
          break;
        case 786610:
          long long v10 = @"Record";
          break;
        case 786611:
          long long v10 = @"FastForward";
          break;
        case 786612:
          long long v10 = @"Rewind";
          break;
        case 786613:
          long long v10 = @"ScanNextTrack";
          break;
        case 786614:
          long long v10 = @"ScanPreviousTrack";
          break;
        case 786617:
          long long v10 = @"ToggleShuffle";
          break;
        case 786620:
          long long v10 = @"ToggleRepeat";
          break;
        case 786622:
          long long v10 = @"PlaybackSpeedNormal";
          break;
        case 786634:
          long long v10 = @"PlaybackSpeedFaster";
          break;
        case 786635:
          long long v10 = @"PlaybackSpeedSlower";
          break;
        case 786637:
          long long v10 = @"PlayOrPause";
          break;
        case 786639:
          long long v10 = @"VoiceCommand";
          break;
        default:
          goto LABEL_196;
      }
    }
  }
  else
  {
    long long v10 = @"Action";
    if (v14 <= 720928)
    {
      if (v14 > -16187392)
      {
        if (v14 <= -16187361)
        {
          switch(v14)
          {
            case -16187391:
              long long v10 = @"SmartCoverOpen";
              break;
            case -16187390:
              long long v10 = @"SmartCoverFlap1";
              break;
            case -16187389:
              long long v10 = @"SmartCoverFlap2";
              break;
            case -16187388:
              long long v10 = @"SmartCoverFlap3";
              break;
            default:
              if (v14 != -16187376) {
                goto LABEL_196;
              }
              long long v10 = @"SmartCoverAttach";
              break;
          }
          goto LABEL_3;
        }
        if (v14 <= 65667)
        {
          if (v14 == -16187360)
          {
            long long v10 = @"SmartCoverStateUnknown";
            goto LABEL_3;
          }
          if (v14 == 65667)
          {
            long long v10 = @"SystemWakeUp";
            goto LABEL_3;
          }
        }
        else
        {
          switch(v14)
          {
            case 65668:
              long long v10 = @"Colors";
              goto LABEL_3;
            case 65670:
              long long v10 = @"Menu";
              goto LABEL_3;
            case 65691:
              long long v10 = @"DoNotDisturb";
              goto LABEL_3;
          }
        }
LABEL_196:
        long long v10 = @"Unknown";
        goto LABEL_3;
      }
      if (v14 > -16711648)
      {
        if (v14 > -16711169)
        {
          if (v14 == -16711168) {
            goto LABEL_3;
          }
          if (v14 == -16318463)
          {
            long long v10 = @"HeadsetAvailability";
            goto LABEL_3;
          }
        }
        else
        {
          if (v14 == -16711647)
          {
            long long v10 = @"BrightnessDown";
            goto LABEL_3;
          }
          if (v14 == -16711632)
          {
            long long v10 = @"Language";
            goto LABEL_3;
          }
        }
        goto LABEL_196;
      }
      if (v14 > -16711665)
      {
        if (v14 == -16711664)
        {
          long long v10 = @"ExposéAll";
          goto LABEL_3;
        }
        if (v14 == -16711648)
        {
          long long v10 = @"BrightnessUp";
          goto LABEL_3;
        }
        goto LABEL_196;
      }
      if (v14 != -16711677)
      {
        if (v14 == -16711676)
        {
          long long v10 = @"Launchpad";
          goto LABEL_3;
        }
        goto LABEL_196;
      }
LABEL_149:
      long long v10 = @"Function";
      goto LABEL_3;
    }
    if (v14 <= 786495)
    {
      if (v14 > 720941)
      {
        switch(v14)
        {
          case 720942:
            long long v10 = @"Ringer";
            goto LABEL_3;
          case 786436:
            long long v10 = @"Microphone";
            goto LABEL_3;
          case 786480:
            long long v10 = @"Lock";
            goto LABEL_3;
        }
      }
      else
      {
        switch(v14)
        {
          case 720929:
            long long v10 = @"Headset";
            goto LABEL_3;
          case 720931:
            long long v10 = @"ObsoleteHold";
            goto LABEL_3;
          case 720941:
            goto LABEL_3;
        }
      }
      goto LABEL_196;
    }
    if (v14 > 786527)
    {
      if (v14 > 786543)
      {
        switch(v14)
        {
          case 786544:
            long long v10 = @"DisplayBrightnessDecrement";
            goto LABEL_3;
          case 786553:
            long long v10 = @"KeyboardBrightnessIncrement";
            goto LABEL_3;
          case 786554:
            long long v10 = @"KeyboardBrightnessDecrement";
            goto LABEL_3;
        }
      }
      else
      {
        switch(v14)
        {
          case 786528:
            long long v10 = @"TV";
            goto LABEL_3;
          case 786533:
            long long v10 = @"Snapshot";
            goto LABEL_3;
          case 786543:
            long long v10 = @"DisplayBrightnessIncrement";
            goto LABEL_3;
        }
      }
      goto LABEL_196;
    }
    switch(v14)
    {
      case 786496:
        goto LABEL_150;
      case 786497:
        goto LABEL_151;
      case 786498:
        long long v10 = @"Up";
        break;
      case 786499:
        long long v10 = @"Down";
        break;
      case 786500:
        long long v10 = @"Left";
        break;
      case 786501:
        long long v10 = @"Right";
        break;
      default:
        goto LABEL_196;
    }
  }
LABEL_3:
  uint64_t v44 = v6;
  uint64_t v42 = v10;
  unsigned int v11 = Phase;
  uint64_t v12 = SenderID;
  if (a2)
  {
    long long v13 = NSStringFromBKSHIDEventSource(a2);
    id v40 = [@"source" stringByAppendingFormat:@":%@ ", v13];
  }
  else
  {
    id v40 = &stru_1ED755B00;
  }
  uint64_t Children = IOHIDEventGetChildren();
  if (Children)
  {
    CFArrayRef v16 = (const __CFArray *)Children;
    uint64_t v17 = v8;
    for (CFIndex i = 0; ; ++i)
    {
      if (i >= CFArrayGetCount(v16))
      {
        uint64_t v19 = 0;
        __int16 v20 = v9;
        unint64_t v21 = 0x1E4F29000uLL;
        uint64_t v22 = v41;
        goto LABEL_19;
      }
      CFArrayGetValueAtIndex(v16, i);
      if (IOHIDEventGetType() == 1 && IOHIDEventGetIntegerValue() == 65299) {
        break;
      }
    }
    uint64_t v19 = IOHIDEventGetIntegerValue();
    if (v19 == 1)
    {
      id v23 = @"(IR) ";
    }
    else
    {
      if (v19 != 16)
      {
        __int16 v20 = v9;
        unint64_t v21 = 0x1E4F29000;
        uint64_t v22 = v41;
        if (v19 == 2)
        {
          id v23 = @"(CEC) ";
          goto LABEL_20;
        }
LABEL_19:
        uint64_t v9 = v20;
        objc_msgSend(*(id *)(v21 + 24), "stringWithFormat:", @"(AppleVendorSenderID:0x%X) ", v19);
        id v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      id v23 = @"(MediaRemote) ";
    }
    unint64_t v21 = 0x1E4F29000;
    uint64_t v22 = v41;
LABEL_20:
    uint64_t v8 = v17;
  }
  else
  {
    id v23 = &stru_1ED755B00;
    unint64_t v21 = 0x1E4F29000uLL;
    uint64_t v22 = v41;
  }
  if ((unint64_t)(v12 + 0x7FFFFFF7E8CE6C8FLL) < 6 || v12 == 0x8000000817319378)
  {
    uint64_t v39 = v12;
    uint64_t v24 = @":%llX(AX) ";
LABEL_24:
    objc_msgSend(@"senderID", "stringByAppendingFormat:", v24, v39);
    goto LABEL_25;
  }
  if (!v12)
  {
    uint64_t v24 = @":zero(!) ";
    goto LABEL_24;
  }
  if (!a2)
  {
    int v25 = &stru_1ED755B00;
    if (v11) {
      goto LABEL_26;
    }
    goto LABEL_71;
  }
  objc_msgSend(@"senderID", "stringByAppendingFormat:", @":%llX ", v12);
LABEL_25:
  int v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_26:
    objc_msgSend(@"phase", "stringByAppendingFormat:", @":0x%lX ", v11);
    double v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_72;
  }
LABEL_71:
  double v26 = &stru_1ED755B00;
LABEL_72:
  if (v8 != 1)
  {
    objc_msgSend(@"pressCount", "stringByAppendingFormat:", @":%d ", v8);
    uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v22) {
      goto LABEL_74;
    }
LABEL_76:
    uint64_t v28 = &stru_1ED755B00;
    goto LABEL_77;
  }
  uint64_t v27 = &stru_1ED755B00;
  if (!v22) {
    goto LABEL_76;
  }
LABEL_74:
  objc_msgSend(@"longPress", "stringByAppendingFormat:", @":%d ", 1);
  uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_77:
  if (IntegerValue && (v11 & 1) != 0)
  {
    id v29 = @"began";
  }
  else if ((v11 & 4) != 0 && IntegerValue)
  {
    id v29 = @"end";
  }
  else if (IntegerValue || (v11 & 4) == 0)
  {
    id v29 = @"up";
    if (IntegerValue) {
      id v29 = @"down";
    }
    if (v22) {
      id v29 = @"long press";
    }
  }
  else
  {
    id v29 = @"timeout";
  }
  id v30 = v23;
  id v31 = v9;
  uint64_t v32 = v29;
  int v33 = [v9 options];
  if (v33)
  {
    id v34 = *(void **)(v21 + 24);
    id v35 = NSStringFromBKSHIDEventAttributeOptions(v33);
    uint64_t v36 = [v34 stringWithFormat:@" (%@)", v35];

    id v31 = v9;
  }
  else
  {
    uint64_t v36 = &stru_1ED755B00;
  }
  __int16 v37 = [v43 stringWithFormat:@"%@ page:0x%X usage:0x%X downEvent:%d %@%@%@%@%@%@%@%@", v42, v45, v44, IntegerValue != 0, v40, v30, v25, v26, v27, v28, v32, v36];

  return v37;
}

__CFString *BKNSStringFromIOHIDGenericGestureType(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 5)
    {
      uint64_t v2 = @"squeeze";
    }
    else if (a1 == 1)
    {
      uint64_t v2 = @"swipe";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<unknown:%d>", a1);
      uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v2 = @"tap";
  }
  return v2;
}

__CFString *_BKSHIDEventGetConciseDescriptionGenericGesture()
{
  int IntegerValue = IOHIDEventGetIntegerValue();
  switch(IntegerValue)
  {
    case 5:
      uint64_t v5 = NSString;
      int Phase = IOHIDEventGetPhase();
      id v4 = BKNSStringFromIOHIDEventPhase(Phase);
      long long v13 = @"squeeze";
      int v14 = v4;
      uint64_t v7 = @"%@ phase:%@";
LABEL_7:
      objc_msgSend(v5, "stringWithFormat:", v7, v13, v14, v15);
      goto LABEL_8;
    case 1:
      IOHIDEventGetDoubleValue();
      uint64_t v9 = v8;
      uint64_t v5 = NSString;
      int v10 = IOHIDEventGetPhase();
      id v4 = BKNSStringFromIOHIDEventPhase(v10);
      uint64_t v15 = v4;
      int v14 = v9;
      long long v13 = @"swipe";
      uint64_t v7 = @"%@ progress:%g phase:%@";
      goto LABEL_7;
    case 0:
      uint64_t v1 = IOHIDEventGetIntegerValue();
      uint64_t v2 = NSString;
      int v3 = IOHIDEventGetPhase();
      id v4 = BKNSStringFromIOHIDEventPhase(v3);
      [v2 stringWithFormat:@"%@ count:%d phase:%@", @"tap", v1, v4];
LABEL_8:
      unsigned int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
  }
  unsigned int v11 = @"unknown";
LABEL_10:
  return v11;
}

__CFString *BKNSStringFromIOHIDEventPhase(int a1)
{
  if (a1)
  {
    if ((a1 & (a1 - 1)) != 0 || a1 == 0)
    {
      id v4 = [MEMORY[0x1E4F1CA48] array];
      for (uint64_t i = 0; i != 16; ++i)
      {
        if (((1 << i) & a1) != 0)
        {
          uint64_t v6 = _BKSPhaseStringForBit(a1);
          [v4 addObject:v6];
        }
      }
      int v3 = [v4 componentsJoinedByString:@", "];
    }
    else
    {
      _BKSPhaseStringForBit(a1);
      int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v3 = @"undefined";
  }
  return v3;
}

__CFString *_BKSPhaseStringForBit(int a1)
{
  if (a1 > 15)
  {
    if (a1 > 63)
    {
      if (a1 == 64)
      {
        uint64_t v2 = @"momentumEnd";
        goto LABEL_16;
      }
      if (a1 == 128)
      {
        uint64_t v2 = @"mayBegin";
        goto LABEL_16;
      }
    }
    else
    {
      if (a1 == 16)
      {
        uint64_t v2 = @"momentumContinue";
        goto LABEL_16;
      }
      if (a1 == 32)
      {
        uint64_t v2 = @"momentumStart";
        goto LABEL_16;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"unknown:%X", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"began";
    switch(a1)
    {
      case 1:
        break;
      case 2:
        uint64_t v2 = @"changed";
        break;
      case 4:
        uint64_t v2 = @"ended";
        break;
      case 8:
        uint64_t v2 = @"cancelled";
        break;
      default:
        goto LABEL_15;
    }
  }
LABEL_16:
  return v2;
}

id _BKSHIDEventGetConciseDescriptionPointer(void *a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (IOHIDEventGetEvent())
  {
    IOHIDEventGetFloatValue();
    BOOL v3 = v2 != 0.0;
    IOHIDEventGetFloatValue();
    uint64_t v5 = v4 != 0.0 || v3;
    if (IOHIDEventGetEvent()) {
      BOOL v6 = IOHIDEventGetIntegerValue() != 0;
    }
    else {
      BOOL v6 = 0;
    }
    __int16 v18 = NSString;
    id v9 = [NSNumber numberWithBool:v5];
    id v19 = [NSNumber numberWithBool:v6];
    __int16 v20 = [v18 stringWithFormat:@"Pointer movement:%@ buttonDown:%@", v9, v19];
  }
  else
  {
    uint64_t v7 = IOHIDEventGetChildren();
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v57 count:16];
    __int16 v47 = a1;
    if (v10)
    {
      uint64_t v11 = v10;
      int v12 = 0;
      uint64_t v13 = *(void *)v53;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v52 + 1) + 8 * v14);
          unsigned int Type = IOHIDEventGetType();
          if (Type <= 0x11)
          {
            if (((1 << Type) & 0x8F6) != 0)
            {
              [v8 addObject:v15];
              int v12 = 1;
            }
            else if (Type == 17)
            {
              int v12 = 1;
            }
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v17 = [v9 countByEnumeratingWithState:&v52 objects:v57 count:16];
        uint64_t v11 = v17;
      }
      while (v17);
    }
    else
    {
      int v12 = 0;
    }

    IOHIDEventGetFloatValue();
    double v22 = v21;
    IOHIDEventGetFloatValue();
    double v24 = v23;
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    double v26 = BKSHIDEventGetPointerAttributes(v47);
    uint64_t v27 = v26;
    if (v26)
    {
      uint64_t v28 = [v26 activeModifiers];
      int v29 = [v27 pointerEdgeMask];
    }
    else
    {
      uint64_t v28 = 0;
      int v29 = 0;
    }
    __int16 v20 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Pointer"];
    if (v22 != 0.0 || v24 != 0.0 || ((v12 ^ 1) & 1) != 0)
    {
      unint64_t v30 = [v27 contextMove];
      uint64_t v31 = NSStringFromBKSHIDEventContextType([v27 contextType]);
      uint64_t v32 = (void *)v31;
      if (v30)
      {
        int v33 = NSStringFromBKSHIDEventContextMove(v30);
        [v20 appendFormat:@" %g,%g (%@ %@)", *(void *)&v22, *(void *)&v24, v32, v33];
      }
      else
      {
        [v20 appendFormat:@" %g,%g (%@)", *(void *)&v22, *(void *)&v24, v31];
      }
    }
    id v34 = [v27 authenticationMessage];

    if (v34) {
      [v20 appendString:@" auth"];
    }
    id v35 = [v27 hitTestSecurityAnalysis];

    if (v35) {
      [v20 appendString:@" sa"];
    }
    if (IntegerValue) {
      objc_msgSend(v20, "appendFormat:", @" buttonMask:%X", IntegerValue);
    }
    if (v28)
    {
      uint64_t v36 = NSStringFromBKSKeyModifierFlags(v28);
      [v20 appendFormat:@" modifiers:%@", v36];
    }
    if (v29)
    {
      __int16 v37 = NSStringFromBKSHIDEventScreenEdgeMask(v29);
      [v20 appendFormat:@" edges:%@", v37];
    }
    uint64_t v38 = [v27 fingerDownCount];
    if (([v27 options] & 2) != 0)
    {
      if (v38 < 1) {
        objc_msgSend(v20, "appendFormat:", @" touchUp", v46);
      }
      else {
        objc_msgSend(v20, "appendFormat:", @" touchChanged fingersDown:%d", v38);
      }
    }
    else if (v38)
    {
      objc_msgSend(v20, "appendFormat:", @" fingersDown:%d", v38);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v19 = v8;
    uint64_t v39 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v49 != v41) {
            objc_enumerationMutation(v19);
          }
          uint64_t v43 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          [v20 appendString:@" "];
          uint64_t v44 = BKSHIDEventGetConciseDescription(v43);
          [v20 appendString:v44];
        }
        uint64_t v40 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v40);
    }
  }
  return v20;
}

void _BKSHIDEventAppendEventFlags(uint64_t a1, void *a2)
{
  id v10 = a2;
  unsigned int IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v3 = IOHIDEventGetIntegerValue();
  int v4 = (v3 != 0) & (IntegerValue >> 1);
  int v5 = IOHIDEventGetIntegerValue();
  int v6 = IOHIDEventGetIntegerValue();
  if ((IntegerValue & 0x80) != 0)
  {
    [v10 appendString:@"cancel" withName:0];
    if ((IntegerValue & 0x20000) == 0)
    {
LABEL_3:
      if (!v4) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((IntegerValue & 0x20000) == 0)
  {
    goto LABEL_3;
  }
  [v10 appendString:@"tap" withName:0];
  if (!v4)
  {
LABEL_4:
    if ((IntegerValue & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  [v10 appendString:@"down" withName:0];
  if ((IntegerValue & 4) == 0)
  {
LABEL_5:
    if ((IntegerValue & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
LABEL_10:
  if (v3)
  {
    [v10 appendString:@"move" withName:0];
    goto LABEL_15;
  }
  [v10 appendString:@"move (not touching!)" withName:0];
  if ((IntegerValue & 2) != 0)
  {
LABEL_13:
    if (!v3)
    {
      uint64_t v7 = @"up";
LABEL_27:
      [v10 appendString:v7 withName:0];
      goto LABEL_28;
    }
  }
LABEL_15:
  if ((IntegerValue & 3) == 1)
  {
    if (IOHIDEventGetIntegerValue()) {
      uint64_t v8 = @"range (in)";
    }
    else {
      uint64_t v8 = @"range (out)";
    }
    [v10 appendString:v8 withName:0];
  }
  if ((IntegerValue & 0x40) != 0) {
    char v9 = (v3 != 0) & (IntegerValue >> 1);
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0 && (IntegerValue & 4) == 0 && (IntegerValue & 0x80) == 0)
  {
    uint64_t v7 = @"attribute";
    goto LABEL_27;
  }
LABEL_28:
  if (v5) {
    [v10 appendString:@"will-update" withName:0];
  }
  if (v6) {
    [v10 appendString:@"did-update" withName:0];
  }
  if ((IntegerValue & 0x800) != 0)
  {
    [v10 appendString:@"edge" withName:0];
    if ((IntegerValue & 0x1000) == 0)
    {
LABEL_34:
      if ((IntegerValue & 0x2000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_42;
    }
  }
  else if ((IntegerValue & 0x1000) == 0)
  {
    goto LABEL_34;
  }
  [v10 appendString:@"corner" withName:0];
  if ((IntegerValue & 0x2000) == 0)
  {
LABEL_35:
    if ((IntegerValue & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_42:
  [v10 appendString:@"swipe-pending" withName:0];
  if ((IntegerValue & 0x40000) != 0) {
LABEL_36:
  }
    [v10 appendString:@"swipe-locked" withName:0];
LABEL_37:
}

id _BKSHIDEventGetConciseDescriptionScroll()
{
  id v0 = IOHIDEventGetChildren();
  if ([v0 firstObject]) {
    IOHIDEventGetType();
  }
  IOHIDEventGetFloatValue();
  uint64_t v2 = v1;
  IOHIDEventGetFloatValue();
  uint64_t v4 = v3;
  IOHIDEventGetFloatValue();
  double v6 = v5;
  int Phase = IOHIDEventGetPhase();
  if (Phase)
  {
    uint64_t v8 = NSString;
    char v9 = BKNSStringFromIOHIDEventPhase(Phase);
    id v10 = [v8 stringWithFormat:@"Scroll %g,%g (%@)", v2, v4, v9];
  }
  else
  {
    if (v6 == 0.0) {
      objc_msgSend(NSString, "stringWithFormat:", @"Scroll %g,%g", v2, v4, v12);
    }
    else {
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Scroll x:%g y:%g z:%g", v2, v4, *(void *)&v6);
    }
  }

  return v10;
}

id _BKSHIDEventGetConciseDescriptionScale()
{
  int Phase = IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  double v2 = v1;
  IOHIDEventGetFloatValue();
  double v4 = v3;
  IOHIDEventGetFloatValue();
  uint64_t v6 = v5;
  uint64_t v7 = NSString;
  uint64_t v8 = BKNSStringFromIOHIDEventPhase(Phase);
  char v9 = (void *)v8;
  if (v2 == 0.0 && v4 == 0.0) {
    [v7 stringWithFormat:@"Scale (%@) z:%g", v8, v6, v12, v13];
  }
  else {
  id v10 = [v7 stringWithFormat:@"Scale (%@) x:%g y%g z:%g", v8, *(void *)&v2, *(void *)&v4, v6];
  }

  return v10;
}

id _BKSHIDEventGetConciseDescriptionTranslation()
{
  int Phase = IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  uint64_t v2 = v1;
  IOHIDEventGetFloatValue();
  uint64_t v4 = v3;
  IOHIDEventGetFloatValue();
  double v6 = v5;
  uint64_t v7 = NSString;
  uint64_t v8 = BKNSStringFromIOHIDEventPhase(Phase);
  char v9 = (void *)v8;
  if (v6 == 0.0) {
    [v7 stringWithFormat:@"Translation (%@) %g,%g", v8, v2, v4, v12];
  }
  else {
  id v10 = [v7 stringWithFormat:@"Translation (%@) x:%g y:%g z:%g", v8, v2, v4, *(void *)&v6];
  }

  return v10;
}

id _BKSHIDEventGetConciseDescriptionRotation()
{
  int Phase = IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  double v2 = v1;
  IOHIDEventGetFloatValue();
  double v4 = v3;
  IOHIDEventGetFloatValue();
  uint64_t v6 = v5;
  uint64_t v7 = NSString;
  uint64_t v8 = BKNSStringFromIOHIDEventPhase(Phase);
  char v9 = (void *)v8;
  if (v2 == 0.0 && v4 == 0.0) {
    [v7 stringWithFormat:@"Rotation (%@) z:%g", v8, v6, v12, v13];
  }
  else {
  id v10 = [v7 stringWithFormat:@"Rotation (%@) x:%g y%g z:%g", v8, *(void *)&v2, *(void *)&v4, v6];
  }

  return v10;
}

uint64_t _BKSHIDEventGetConciseDescriptionButton()
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  return objc_msgSend(NSString, "stringWithFormat:", @"Button mask:%X number:%d", IntegerValue, IOHIDEventGetIntegerValue());
}

id _BKSHIDEventGetConciseDescriptionVendorDefined()
{
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v1 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65280 && v1 == 17) {
    _BKSHIDEventGetConciseDescriptionVendorDefinedForceStageEvent();
  }
  else {
  double v3 = objc_msgSend(NSString, "stringWithFormat:", @"VendorDefined page:%X usage:%X", IntegerValue, v1);
  }
  return v3;
}

id _BKSHIDEventGetConciseDescriptionVendorDefinedForceStageEvent()
{
  IOHIDEventGetVendorDefinedData();
  id v0 = objc_msgSend(NSString, "stringWithFormat:", @"<corrupt data>", v2, v3);
  return v0;
}

uint64_t BKSHIDServicesProximityDetectionModeIsValid(unsigned int a1)
{
  return (a1 < 0x15) & (0x10307Fu >> a1);
}

__CFString *NSStringFromBKSHIDForceStageTransition(uint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<invalid:%X>", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E5441B90[a1];
  }
  return v1;
}

id _BKSHIDEventGetEventInfoDescription(id a1)
{
  id v1 = a1;
  if (a1)
  {
    if (IOHIDEventGetAttributeDataLength() >= 1
      && (AttributeDataPtr = (unsigned __int8 *)IOHIDEventGetAttributeDataPtr()) != 0
      && *((_DWORD *)AttributeDataPtr + 1)
      && *AttributeDataPtr - 1 <= 6)
    {
      uint64_t v3 = BKSHIDEventGetBaseAttributes(v1);
      double v4 = v3;
      if (v3)
      {
        id v1 = [v3 description];
      }
      else
      {
        id v1 = 0;
      }
    }
    else
    {
      id v1 = 0;
    }
  }
  return v1;
}

id BKSHIDEventDescription(void *a1)
{
  uint64_t v2 = _BKSHIDEventGetEventInfoDescription(a1);
  uint64_t v3 = (__CFString *)CFCopyDescription(a1);
  double v4 = [NSString stringWithFormat:@"%@\n%@", v2, v3];

  return v4;
}

void BKSHIDEventEnumerateUpdatesWithBlock(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    uint64_t v7 = [NSString stringWithFormat:@"why so nil, bro?"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventEnumerateUpdatesWithBlock(IOHIDEventRef, __strong BKSHIDEventUpdateHandler)");
      *(_DWORD *)buf = 138544130;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      CFArrayRef v16 = @"BKSHIDEvent.m";
      __int16 v17 = 1024;
      int v18 = 2114;
      __int16 v19 = 2114;
      __int16 v20 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA7319CLL);
  }
  double v4 = v3;
  if (IOHIDEventGetType() == 11)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    int v6 = IOHIDEventGetIntegerValue();
    if (IntegerValue)
    {
      if (v6)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __BKSHIDEventEnumerateUpdatesWithBlock_block_invoke;
        v9[3] = &unk_1E5441900;
        uint64_t v11 = IntegerValue;
        int v12 = v6;
        id v10 = v4;
        BKSHIDEventEnumerateChildEvents(a1, v9);
      }
    }
  }
}

uint64_t __BKSHIDEventEnumerateUpdatesWithBlock_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t result = IOHIDEventGetIntegerValue();
  if (IntegerValue && result)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4 != IntegerValue)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"child event should have the same generation as parent (child:%ld parent:%ld)", IntegerValue, v4);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventEnumerateUpdatesWithBlock(IOHIDEventRef, __strong BKSHIDEventUpdateHandler)_block_invoke");
        *(_DWORD *)buf = 138544130;
        int v12 = v8;
        __int16 v13 = 2114;
        uint64_t v14 = @"BKSHIDEvent.m";
        __int16 v15 = 1024;
        int v16 = 2125;
        __int16 v17 = 2114;
        int v18 = v7;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v7 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA7337CLL);
    }
    uint64_t v5 = *(unsigned int *)(a1 + 48);
    if ((result & ~v5) != 0)
    {
      char v9 = objc_msgSend(NSString, "stringWithFormat:", @"child update mask should be a subset of parent update mask (child:%X parent:%X)", result, v5);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventEnumerateUpdatesWithBlock(IOHIDEventRef, __strong BKSHIDEventUpdateHandler)_block_invoke");
        *(_DWORD *)buf = 138544130;
        int v12 = v10;
        __int16 v13 = 2114;
        uint64_t v14 = @"BKSHIDEvent.m";
        __int16 v15 = 1024;
        int v16 = 2126;
        __int16 v17 = 2114;
        int v18 = v9;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA7344CLL);
    }
    int v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v6();
  }
  return result;
}

uint64_t BKSHIDEventMatchingPredicate(uint64_t a1, void *a2)
{
  return _BKSHIDEventMatchingPredicateCore(a1, 0, a2);
}

uint64_t _BKSHIDEventMatchingPredicateCore(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v15 = [NSString stringWithFormat:@"Can't pass nil for predicate. That's illegal."];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v16 = objc_msgSend(NSString, "stringWithUTF8String:", "IOHIDEventRef _BKSHIDEventMatchingPredicateCore(IOHIDEventRef, NSInteger, BOOL (^__strong)(IOHIDEventRef, NSInteger))");
      *(_DWORD *)buf = 138544130;
      double v23 = v16;
      __int16 v24 = 2114;
      int v25 = @"BKSHIDEvent.m";
      __int16 v26 = 1024;
      int v27 = 2135;
      __int16 v28 = 2114;
      int v29 = v15;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA73674);
  }
  int v6 = v5;
  if (a1 && ((*((uint64_t (**)(id, uint64_t, uint64_t))v5 + 2))(v5, a1, a2) & 1) == 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = IOHIDEventGetChildren();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      uint64_t v11 = a2 + 1;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = _BKSHIDEventMatchingPredicateCore(*(void *)(*((void *)&v17 + 1) + 8 * v12), v11, v6);
          if (v13)
          {
            a1 = v13;
            goto LABEL_14;
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    a1 = 0;
LABEL_14:
  }
  return a1;
}

uint64_t BKSHIDEventDigitizerDetachTouchesWithIdentifiers(void *a1, int a2)
{
  uint64_t v3 = BKSHIDEventDigitizerDetachTouchesWithIdentifiers_onceToken;
  id v4 = a1;
  if (v3 != -1) {
    dispatch_once(&BKSHIDEventDigitizerDetachTouchesWithIdentifiers_onceToken, &__block_literal_global_12378);
  }
  uint64_t v5 = BKSHIDEventDigitizerDetachTouches(v4, a2, (void *)BKSHIDEventDigitizerDetachTouchesWithIdentifiers_policy, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  return v5;
}

uint64_t BKSHIDEventDigitizerDetachTouches(void *a1, int a2, void *a3, double a4, double a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a3;
  uint64_t v11 = [v9 count];
  if (v11 <= 0)
  {
    uint64_t v30 = [NSString stringWithFormat:@"need more than zero identifiers"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BKSHIDEventDigitizerDetachTouches(NSArray<NSNumber *> *__strong _Nonnull, uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull, CGPoint)");
      *(_DWORD *)buf = 138544130;
      id v39 = v31;
      __int16 v40 = 2114;
      uint64_t v41 = @"BKSHIDEvent.m";
      __int16 v42 = 1024;
      int v43 = 2183;
      __int16 v44 = 2114;
      uint64_t v45 = v30;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v30 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA73A80);
  }
  uint64_t v12 = v11;
  if ((unint64_t)v11 >= 0x20)
  {
    uint64_t v32 = [NSString stringWithFormat:@"need less than 32 identifiers"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v33 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BKSHIDEventDigitizerDetachTouches(NSArray<NSNumber *> *__strong _Nonnull, uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull, CGPoint)");
      *(_DWORD *)buf = 138544130;
      id v39 = v33;
      __int16 v40 = 2114;
      uint64_t v41 = @"BKSHIDEvent.m";
      __int16 v42 = 1024;
      int v43 = 2184;
      __int16 v44 = 2114;
      uint64_t v45 = v32;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v32 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA73B48);
  }
  if (!v10)
  {
    id v34 = [NSString stringWithFormat:@"need a policy (a default one will do)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v35 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL BKSHIDEventDigitizerDetachTouches(NSArray<NSNumber *> *__strong _Nonnull, uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull, CGPoint)");
      *(_DWORD *)buf = 138544130;
      id v39 = v35;
      __int16 v40 = 2114;
      uint64_t v41 = @"BKSHIDEvent.m";
      __int16 v42 = 1024;
      int v43 = 2186;
      __int16 v44 = 2114;
      uint64_t v45 = v34;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA73C10);
  }
  MEMORY[0x1F4188790]();
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  for (uint64_t i = 0; i != v12; ++i)
  {
    int v16 = [v9 objectAtIndex:i];
    *(_DWORD *)&v14[4 * i] = [v16 unsignedIntValue];
  }
  long long v17 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v10);
  if (!v17)
  {
    __int16 v24 = BKLogCommon();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v39 = v10;
    int v25 = "Error encoding policy: %{public}@";
    goto LABEL_18;
  }
  char v37 = 0;
  mach_port_t v18 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v21 = v17;
  float v19 = a4;
  float v20 = a5;
  int v22 = _BKSHIDDigitizerTouchDetach(v18, v19, v20, (uint64_t)v14, v12, a2, [v21 bytes], objc_msgSend(v21, "length"), &v37);
  if (!v22)
  {
    if (v37)
    {
      uint64_t v28 = 1;
      goto LABEL_12;
    }
    __int16 v24 = BKLogCommon();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v39 = v9;
    int v25 = "Touches not found:%{public}@";
LABEL_18:
    __int16 v26 = v24;
    uint32_t v27 = 12;
    goto LABEL_19;
  }
  int v23 = v22;
  __int16 v24 = BKLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v39) = v23;
    int v25 = "Error detaching touches: 0x%X";
    __int16 v26 = v24;
    uint32_t v27 = 8;
LABEL_19:
    _os_log_error_impl(&dword_18AA0B000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
  }
LABEL_11:

  uint64_t v28 = 0;
LABEL_12:

  return v28;
}

uint64_t __BKSHIDEventDigitizerDetachTouchesWithIdentifiers_block_invoke()
{
  id v0 = objc_alloc_init(BKSHIDTouchRoutingPolicy);
  uint64_t v1 = BKSHIDEventDigitizerDetachTouchesWithIdentifiers_policy;
  BKSHIDEventDigitizerDetachTouchesWithIdentifiers_policy = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t BKSHIDEventDigitizerDetachTouchesWithIdentifiersAndPolicy(void *a1, int a2, void *a3)
{
  return BKSHIDEventDigitizerDetachTouches(a1, a2, a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

uint64_t BKSHIDEventDigitizerSetTouchOffset(int a1, double a2, double a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v10 = [NSString stringWithFormat:@"need nonzero userIdentififer"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchOffset(uint32_t, CGPoint)");
      int v12 = 138544130;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      __int16 v15 = @"BKSHIDEvent.m";
      __int16 v16 = 1024;
      int v17 = 2216;
      __int16 v18 = 2114;
      float v19 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x26u);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA73DD4);
  }
  mach_port_t v6 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  float v7 = a2;
  float v8 = a3;
  return _BKSHIDDigitizerTouchSetOffset(v6, a1, v7, v8);
}

void BKSHIDEventDigitizerSetTouchRoutingPolicy(int a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    __int16 v15 = [NSString stringWithFormat:@"zero is not a valid userIdentifier"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchRoutingPolicy(uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull)");
      *(_DWORD *)buf = 138544130;
      *(void *)uint64_t v30 = v16;
      *(_WORD *)&v30[8] = 2114;
      uint64_t v31 = @"BKSHIDEvent.m";
      __int16 v32 = 1024;
      int v33 = 2222;
      __int16 v34 = 2114;
      id v35 = v15;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA74078);
  }
  id v4 = v3;
  if (!v4)
  {
    int v17 = NSString;
    __int16 v18 = (objc_class *)objc_opt_class();
    float v19 = NSStringFromClass(v18);
    uint64_t v20 = [v17 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"policyForDetachedTouches", v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v21 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchRoutingPolicy(uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull)");
      *(_DWORD *)buf = 138544130;
      *(void *)uint64_t v30 = v21;
      *(_WORD *)&v30[8] = 2114;
      uint64_t v31 = @"BKSHIDEvent.m";
      __int16 v32 = 1024;
      int v33 = 2223;
      __int16 v34 = 2114;
      id v35 = v20;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA7416CLL);
  }
  uint64_t v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v22 = NSString;
    int v23 = (objc_class *)[v5 classForCoder];
    if (!v23) {
      int v23 = (objc_class *)objc_opt_class();
    }
    __int16 v24 = NSStringFromClass(v23);
    int v25 = (objc_class *)objc_opt_class();
    __int16 v26 = NSStringFromClass(v25);
    uint32_t v27 = [v22 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"policyForDetachedTouches", v24, v26];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventDigitizerSetTouchRoutingPolicy(uint32_t, BKSHIDTouchRoutingPolicy *__strong _Nonnull)");
      *(_DWORD *)buf = 138544130;
      *(void *)uint64_t v30 = v28;
      *(_WORD *)&v30[8] = 2114;
      uint64_t v31 = @"BKSHIDEvent.m";
      __int16 v32 = 1024;
      int v33 = 2223;
      __int16 v34 = 2114;
      id v35 = v27;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA74284);
  }

  mach_port_t v6 = objc_msgSend(MEMORY[0x1E4FBA8A8], "bs_secureDataFromObject:", v5);
  if (!v6)
  {
    uint64_t v11 = BKLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)uint64_t v30 = v5;
      *(_WORD *)&v30[8] = 1024;
      LODWORD(v31) = a1;
      int v12 = "Error encoding policy: %{public}@ for touches with userIdentifier:%X";
      uint64_t v13 = v11;
      uint32_t v14 = 18;
      goto LABEL_12;
    }
LABEL_9:

    goto LABEL_10;
  }
  int v7 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  id v8 = v6;
  int v9 = _BKSHIDDigitizerTouchSetRoutingPolicy(v7, a1, [v8 bytes], objc_msgSend(v8, "length"));
  if (v9)
  {
    int v10 = v9;
    uint64_t v11 = BKLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v30 = v10;
      *(_WORD *)&void v30[4] = 1024;
      *(_DWORD *)&v30[6] = a1;
      int v12 = "Error setting touch routing policy:0x%X for touches with userIdentifier:%X";
      uint64_t v13 = v11;
      uint32_t v14 = 14;
LABEL_12:
      _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
LABEL_10:
}

void BKSHIDEventTransferTouchesToDifferentCAContext(void *a1, mach_port_name_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = [v3 count];
  if (v4 <= 0)
  {
    uint32_t v14 = [NSString stringWithFormat:@"need more than zero identifiers"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventTransferTouchesToDifferentCAContext(NSArray<NSNumber *> *__strong, uint32_t)");
      *(_DWORD *)buf = 138544130;
      id v21 = v15;
      __int16 v22 = 2114;
      int v23 = @"BKSHIDEvent.m";
      __int16 v24 = 1024;
      int v25 = 2238;
      __int16 v26 = 2114;
      uint32_t v27 = v14;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA744DCLL);
  }
  uint64_t v5 = v4;
  if ((unint64_t)v4 >= 0x20)
  {
    __int16 v16 = [NSString stringWithFormat:@"need less than 32 identifiers"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventTransferTouchesToDifferentCAContext(NSArray<NSNumber *> *__strong, uint32_t)");
      *(_DWORD *)buf = 138544130;
      id v21 = v17;
      __int16 v22 = 2114;
      int v23 = @"BKSHIDEvent.m";
      __int16 v24 = 1024;
      int v25 = 2239;
      __int16 v26 = 2114;
      uint32_t v27 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA745A4);
  }
  if (!a2)
  {
    __int16 v18 = [NSString stringWithFormat:@"need nonzero contextID"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      float v19 = objc_msgSend(NSString, "stringWithUTF8String:", "void BKSHIDEventTransferTouchesToDifferentCAContext(NSArray<NSNumber *> *__strong, uint32_t)");
      *(_DWORD *)buf = 138544130;
      id v21 = v19;
      __int16 v22 = 2114;
      int v23 = @"BKSHIDEvent.m";
      __int16 v24 = 1024;
      int v25 = 2240;
      __int16 v26 = 2114;
      uint32_t v27 = v18;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA7466CLL);
  }
  MEMORY[0x1F4188790]();
  int v7 = &buf[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  for (uint64_t i = 0; i != v5; ++i)
  {
    int v9 = [v3 objectAtIndex:i];
    *(_DWORD *)&v7[4 * i] = [v9 unsignedIntValue];
  }
  mach_port_name_t v10 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  int v11 = _BKSHIDTouchTransfer(v10, (uint64_t)v7, v5, a2);
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = BKLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v12;
      _os_log_error_impl(&dword_18AA0B000, v13, OS_LOG_TYPE_ERROR, "Error transferring touches: 0x%X", buf, 8u);
    }
  }
}

uint64_t _BKSHIDGetBacklightFactor(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D8000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000100)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetBacklightFactorPending(mach_port_t a1, float a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  float v6 = a2;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000001;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetBacklightFactorWithFadeDuration(mach_port_t a1, char a2, char a3, float a4, float a5)
{
  float v12 = a4;
  uint64_t v11 = *MEMORY[0x1E4F14068];
  float v13 = a5;
  char v14 = a2;
  __int16 v15 = 0;
  char v16 = 0;
  char v17 = a3;
  __int16 v18 = 0;
  char v19 = 0;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v10.mach_msg_bits_t msgh_bits = 5395;
  v10.mach_port_t msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  *(void *)&v10.msgh_voucher_port = 0x5B8D8200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v10);
    mach_port_t special_reply_port = v10.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&v10, 3162115, 0x30u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((v10.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v10.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v10);
    return v8;
  }
  if (v10.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_18;
  }
  if (v10.msgh_id != 6000102)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v8 = 4294966996;
  if ((v10.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v10.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v8 = LODWORD(v12);
  if (v12 != 0.0) {
    goto LABEL_18;
  }
  return v8;
}

uint64_t _BKSHIDNotifySetBacklightFactorWithFadeDurationAsync(mach_port_t a1, char a2, char a3, char a4, float a5, float a6)
{
  uint64_t v9 = *MEMORY[0x1E4F14068];
  float v10 = a5;
  float v11 = a6;
  char v12 = a2;
  __int16 v13 = 0;
  char v14 = 0;
  char v15 = a3;
  __int16 v16 = 0;
  char v17 = 0;
  char v18 = a4;
  __int16 v19 = 0;
  char v20 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000003;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v6 = mach_msg(&msg, 1, 0x34u, 0, 0, 0, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v6;
}

uint64_t _BKSHIDBrigthnessIsAutoBrightnessAvailable(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D8500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000105)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDBrigthnessIsBrightnessLevelControlAvailable(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D8600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000106)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetDeviceBacklightArchitectureVersion(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D8700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000107)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetBacklightFeatures(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F10;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDAmbientLightSensorExists(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D8900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000109)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDAmbientLightSensorDisableAutoBrightness(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8D8A00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDAmbientLightSensorEnableAutoBrightness(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000011;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetDeviceInterfaceOrientation(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000012;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetDeviceOrientationForAutomation(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000013;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDRequestEstimatedProximityEvents(int a1, _DWORD *a2, float a3)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)int rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(float *)&rcv_name[28] = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_mach_port_name_t name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  int v10 = 5395;
  *(void *)&rcv_name[12] = 0x5B8D8E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    mach_port_name_t special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 6000114)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a2 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_25;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((v10 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_25;
  }
  return v7;
}

uint64_t _BKSHIDRequestProximityStatusEvent(mach_port_name_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v8 = 0x5B8D8F00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _BKSHIDResetProximityCalibration(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8D9000000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDProximityDidUnoccludeAfterScreenWake(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8D9100000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDGetObjectWithinProximity(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D9200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000118)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetProximityDetectionActive(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D9300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000119)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetObjectInProximityIgnoresTouches(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D9400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000120)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetObjectInProximityIgnoresTouches(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000021;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDGetRingerState(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D9600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000122)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDIsSmartCoverClosed(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8D9700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000123)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDCancelButtonEventsFromSenderID(mach_port_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v10 = *MEMORY[0x1E4F14068];
  uint64_t v11 = a2;
  int v12 = a3;
  int v13 = a4;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v9.mach_msg_bits_t msgh_bits = 5395;
  v9.mach_port_t msgh_remote_port = a1;
  v9.msgh_local_port = special_reply_port;
  *(void *)&v9.msgh_voucher_port = 0x5B8D9800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v9);
    mach_port_t special_reply_port = v9.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v9, 3162115, 0x30u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v6)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v7 - 268435459) > 1) {
      return v7;
    }
    if ((v9.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v9.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v9);
    return v7;
  }
  if (v9.msgh_id == 71)
  {
    uint64_t v7 = 4294966988;
    goto LABEL_18;
  }
  if (v9.msgh_id != 6000124)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v7 = 4294966996;
  if ((v9.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v9.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v7 = v11;
  if (v11) {
    goto LABEL_18;
  }
  return v7;
}

uint64_t _BKSHIDClaimGenericGestureFocus(mach_port_name_t a1, const char *a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  memset(v12, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v11 = 0u;
  *((void *)&v11 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v12 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v12 + 8, a2, 1024);
  }
  LODWORD(v12[0]) = 0;
  DWORD1(v12[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v7 = v6 + 44;
  *(_DWORD *)((char *)v12 + v6 + 8) = a3;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v11 = 0x5B8D9900000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)name, 1, v7, 0, 0, 0, 0);
  if ((v8 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v8;
}

uint64_t _BKSHIDCancelTouchesOnAllDisplays(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8D9B00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDCancelTouchesWithIdentifiers(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F20;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDExcludeCAContextsFromHitTestingForZoomSenders(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F30;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDApplyButtonDefinitions(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F40;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDPostTouchAnnotations(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F50;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDPlayHaptic(mach_port_t a1, int a2, int a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  int v7 = a2;
  int v8 = a3;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000033;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _BKSHIDRequestHapticFeedback(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)mach_msg_header_t msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F60;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDTouchStreamCreate(mach_port_name_t a1, int a2, char *src, int a4, char a5, _DWORD *a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  memset(v21, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v20 = 0u;
  *((void *)&v20 + 1) = *MEMORY[0x1E4F14068];
  LODWORD(v21[0]) = a2;
  if (MEMORY[0x1E4F149B0]) {
    int v10 = mig_strncpy_zerofill((char *)v21 + 12, src, 1024);
  }
  else {
    int v10 = mig_strncpy((char *)v21 + 12, src, 1024);
  }
  DWORD1(v21[0]) = 0;
  DWORD2(v21[0]) = v10;
  uint64_t v11 = (v10 + 3) & 0xFFFFFFFC;
  int v12 = (char *)rcv_name + v11;
  *((_DWORD *)v12 + 11) = a4;
  v12[48] = a5;
  *(_WORD *)(v12 + 49) = 0;
  v12[51] = 0;
  mach_msg_size_t v13 = v11 + 52;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v20 = 0x5B8DA300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v15 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v13, 0x30u, special_reply_port, 0, 0);
  uint64_t v16 = v15;
  if ((v15 - 268435458) > 0xE || ((1 << (v15 - 2)) & 0x4003) == 0)
  {
    if (!v15)
    {
      if (DWORD1(v20) == 71)
      {
        uint64_t v16 = 4294966988;
      }
      else if (DWORD1(v20) == 6000135)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v16 = LODWORD(v21[0]);
              if (!LODWORD(v21[0]))
              {
                *a6 = DWORD1(v21[0]);
                return v16;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v17 = 1;
            }
            else {
              BOOL v17 = LODWORD(v21[0]) == 0;
            }
            if (v17) {
              uint64_t v16 = 4294966996;
            }
            else {
              uint64_t v16 = LODWORD(v21[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v16 = 4294966996;
      }
      else
      {
        uint64_t v16 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v16;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v16 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v16;
}

uint64_t _BKSHIDTouchStreamInvalidate(int a1, int a2)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B8DA400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1) {
      return v5;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000136)
  {
    uint64_t v5 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v5;
}

uint64_t _BKSHIDTouchTransfer(mach_port_name_t a1, uint64_t a2, unsigned int a3, mach_port_name_t a4)
{
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (a3 > 0x20) {
    return 4294966989;
  }
  uint64_t v8 = a3;
  __memcpy_chk();
  LODWORD(v14) = a3;
  rcv_name[v8 + 9] = a4;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x5B8DA600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8 * 4 + 40, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0) {
    goto LABEL_16;
  }
  if (v10)
  {
    mig_dealloc_special_reply_port();
LABEL_16:
    if ((v4 - 268435459) > 1) {
      return v4;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_21:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v4;
  }
  if (DWORD1(v13) == 71)
  {
    uint64_t v4 = 4294966988;
    goto LABEL_21;
  }
  if (DWORD1(v13) != 6000138)
  {
    uint64_t v4 = 4294966995;
    goto LABEL_21;
  }
  uint64_t v4 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_21;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_21;
  }
  if (rcv_name[2]) {
    goto LABEL_21;
  }
  uint64_t v4 = v14;
  if (v14) {
    goto LABEL_21;
  }
  return v4;
}

uint64_t _BKSHIDDigitizerTouchDetach(mach_port_t a1, float a2, float a3, uint64_t a4, unsigned int a5, int a6, uint64_t a7, unsigned int a8, unsigned char *a9)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&v27[8] = 0u;
  uint64_t v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v24 = 1;
  uint64_t v25 = a7;
  int v26 = 16777472;
  *(void *)uint32_t v27 = a8;
  *(void *)&v27[4] = *MEMORY[0x1E4F14068];
  if (a5 <= 0x20)
  {
    uint64_t v17 = 4 * a5;
    __memcpy_chk();
    *(_DWORD *)&v27[12] = a5;
    long long v18 = (char *)&rcv_name + v17;
    *((_DWORD *)v18 + 14) = a6;
    *((float *)v18 + 15) = a2;
    *((float *)v18 + 16) = a3;
    *((_DWORD *)v18 + 17) = a8;
    mach_port_t special_reply_port = mig_get_special_reply_port();
    rcv_name.mach_port_t msgh_remote_port = a1;
    rcv_name.msgh_local_port = special_reply_port;
    rcv_name.mach_msg_bits_t msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0x5B8DA700000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t special_reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v20 = mach_msg(&rcv_name, 3162115, v17 + 72, 0x30u, special_reply_port, 0, 0);
    uint64_t v10 = v20;
    if ((v20 - 268435458) > 0xE || ((1 << (v20 - 2)) & 0x4003) == 0)
    {
      if (!v20)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v10 = 4294966988;
        }
        else if (rcv_name.msgh_id == 6000139)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                uint64_t v10 = HIDWORD(v25);
                if (!HIDWORD(v25))
                {
                  *a9 = v26;
                  return v10;
                }
                goto LABEL_27;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port) {
                BOOL v21 = 1;
              }
              else {
                BOOL v21 = HIDWORD(v25) == 0;
              }
              if (v21) {
                uint64_t v10 = 4294966996;
              }
              else {
                uint64_t v10 = HIDWORD(v25);
              }
              goto LABEL_27;
            }
          }
          uint64_t v10 = 4294966996;
        }
        else
        {
          uint64_t v10 = 4294966995;
        }
LABEL_27:
        mach_msg_destroy(&rcv_name);
        return v10;
      }
      mig_dealloc_special_reply_port();
    }
    if ((v10 - 268435459) > 1) {
      return v10;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_27;
  }
  return 4294966989;
}

uint64_t _BKSHIDDigitizerTouchSetOffset(mach_port_t a1, int a2, float a3, float a4)
{
  uint64_t v7 = *MEMORY[0x1E4F14068];
  int v8 = a2;
  float v9 = a3;
  float v10 = a4;
  *(void *)&v6.mach_msg_bits_t msgh_bits = 19;
  v6.msgh_voucher_port = 0;
  v6.mach_msg_id_t msgh_id = 6000040;
  v6.mach_port_t msgh_remote_port = a1;
  v6.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v6);
  }
  uint64_t v4 = mach_msg(&v6, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((v6.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v6.msgh_local_port);
    }
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t _BKSHIDDigitizerTouchSetRoutingPolicy(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v9 = a3;
  int v10 = 16777472;
  int v11 = a4;
  uint64_t v12 = *MEMORY[0x1E4F14068];
  int v13 = a2;
  int v14 = a4;
  uint64_t v6 = 2147483667;
  int v7 = a1;
  *(_OWORD *)mach_port_name_t name = xmmword_18AA84F70;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)&v6, 1, 0x3Cu, 0, 0, 0, 0);
  if ((v4 - 268435459) <= 1)
  {
    if ((v6 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[0]);
    }
    mach_msg_destroy((mach_msg_header_t *)&v6);
  }
  return v4;
}

uint64_t _BKSHIDResetUserEventTimer(mach_port_t a1, int a2, double a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  double v7 = a3;
  int v8 = a2;
  *(void *)&v5.mach_msg_bits_t msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.mach_msg_id_t msgh_id = 6000042;
  v5.mach_port_t msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v5);
  }
  uint64_t v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v5.msgh_local_port);
    }
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDNotifyOnNextUserEvent(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8DAB00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDSafeToResetIdleTimer(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8DAD00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000145)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDGetCurrentDeviceOrientation(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8DAF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000147)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetOrientationClient(mach_port_name_t a1, const char *a2, char a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v12 = 0u;
  *((void *)&v12 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  }
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  BOOL v7 = (char *)name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  mach_msg_size_t v8 = v6 + 44;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v12 = 0x5B8DB000000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)name, 1, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v9;
}

uint64_t _BKSHIDLockOrientation(int a1, int a2, char a3)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v9 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = a2;
  LOBYTE(v9) = a3;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B8DB100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v5)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v6 - 268435459) > 1) {
      return v6;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v6;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v6 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000149)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v6 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v6 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v6;
}

uint64_t _BKSHIDUnlockOrientation(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8DB200000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDIsOrientationLockedWithOrientation(int a1, _DWORD *a2, _DWORD *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B8DB300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 6000151)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                int v11 = DWORD1(v13);
                *a2 = v13;
                *a3 = v11;
                return v8;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&msg[32] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&msg[32];
            }
            goto LABEL_25;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_25;
  }
  return v8;
}

uint64_t _BKSHIDBeginDisplayBrightnessTransaction(int a1, int a2)
{
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&unsigned char msg[28] = a2;
  uint64_t v8 = 1310720;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = 0x5B8DB700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1) {
      return v5;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000155)
  {
    uint64_t v5 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v5;
}

uint64_t _BKSHIDSetDisplayBrightnessWithImplicitTransaction(int a1, float a2)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(float *)&msg[32] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B8DB800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1) {
      return v5;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000156)
  {
    uint64_t v5 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v5;
}

uint64_t _BKSHIDSetDisplayBrightnessValue(mach_port_t a1, char a2, float a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  float v7 = a3;
  char v8 = a2;
  __int16 v9 = 0;
  char v10 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000057;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _BKSHIDFlushDisplayBrightnessUpdates(int a1)
{
  uint64_t v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B8DBA00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v3)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v4 - 268435459) > 1) {
      return v4;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v4;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v4 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6000158)
  {
    uint64_t v4 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v4 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v4 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v4;
}

uint64_t _BKSHIDRestoreSystemDisplayBrightness(mach_port_t a1)
{
  msg.msgh_size = 0;
  msg.mach_msg_bits_t msgh_bits = 19;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0x5B8DBB00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t _BKSHIDGetCurrentDisplayBrightnessCurve(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B8DBC00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6000160)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSHIDSetDisplayBrightnessCurveValue(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000061;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDSetAutoDisplayBrightnessEnabled(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000062;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSHIDGetHumanPresenceStatus(mach_port_name_t a1, const char *a2, _DWORD *a3, unsigned char *a4, _DWORD *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v9 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  }
  else {
    int v9 = mig_strncpy((char *)v18 + 8, a2, 1024);
  }
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v9;
  mach_msg_size_t v10 = ((v9 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v17 = 0x5B8DBF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v10, 0x38u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (DWORD1(v17) == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (DWORD1(v17) == 6000163)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 48)
          {
            if (!rcv_name[2])
            {
              uint64_t v13 = LODWORD(v18[0]);
              if (!LODWORD(v18[0]))
              {
                *a3 = DWORD1(v18[0]);
                *a4 = BYTE8(v18[0]);
                *a5 = HIDWORD(v18[0]);
                return v13;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = LODWORD(v18[0]) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = LODWORD(v18[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v13;
}

uint64_t _BKSHIDIsCapsLockLightOn(int a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 28);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(void *)&msg_4[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x5B8DC000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 6000164)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 40)
          {
            if (!*(_DWORD *)&msg_4[4])
            {
              uint64_t v7 = *(unsigned int *)&msg_4[28];
              if (!*(_DWORD *)&msg_4[28])
              {
                *a3 = msg_4[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)msg_4 == 36)
          {
            if (*(_DWORD *)&msg_4[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&msg_4[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&msg_4[28];
            }
            goto LABEL_25;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_25;
  }
  return v7;
}

uint64_t _BKSHIDSetCapsLockRomanSwitchMode(mach_port_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  uint64_t v7 = a2;
  char v8 = a3;
  __int16 v9 = 0;
  char v10 = 0;
  *(void *)&v5.mach_msg_bits_t msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.mach_msg_id_t msgh_id = 6000065;
  v5.mach_port_t msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v5);
  }
  uint64_t v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v5.msgh_local_port);
    }
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDSetCapsLockDelayOverride(mach_port_t a1, uint64_t a2, double a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  uint64_t v7 = a2;
  double v8 = a3;
  *(void *)&v5.mach_msg_bits_t msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.mach_msg_id_t msgh_id = 6000066;
  v5.mach_port_t msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v5);
  }
  uint64_t v3 = mach_msg(&v5, 1, 0x30u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v5.msgh_local_port);
    }
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDSetStandardType(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  uint64_t v7 = a2;
  int v8 = a3;
  *(void *)&v5.mach_msg_bits_t msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.mach_msg_id_t msgh_id = 6000067;
  v5.mach_port_t msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v5);
  }
  uint64_t v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v5.msgh_local_port);
    }
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDSetCapsLockActive(mach_port_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  uint64_t v7 = a2;
  char v8 = a3;
  __int16 v9 = 0;
  char v10 = 0;
  *(void *)&v5.mach_msg_bits_t msgh_bits = 19;
  v5.msgh_voucher_port = 0;
  v5.mach_msg_id_t msgh_id = 6000068;
  v5.mach_port_t msgh_remote_port = a1;
  v5.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&v5);
  }
  uint64_t v3 = mach_msg(&v5, 1, 0x2Cu, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((v5.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v5.msgh_local_port);
    }
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t _BKSHIDKeyboardWantsStandardTypeOverride(int a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&msg_4[16], 0, 28);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(void *)&msg_4[28] = a2;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = special_reply_port;
  int msg = 5395;
  *(void *)&msg_4[12] = 0x5B8DC500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg_4[8];
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!v6)
    {
      if (*(_DWORD *)&msg_4[16] == 71)
      {
        uint64_t v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg_4[16] == 6000169)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)msg_4 == 40)
          {
            if (!*(_DWORD *)&msg_4[4])
            {
              uint64_t v7 = *(unsigned int *)&msg_4[28];
              if (!*(_DWORD *)&msg_4[28])
              {
                *a3 = msg_4[32];
                return v7;
              }
              goto LABEL_25;
            }
          }
          else if (*(_DWORD *)msg_4 == 36)
          {
            if (*(_DWORD *)&msg_4[4]) {
              BOOL v8 = 1;
            }
            else {
              BOOL v8 = *(_DWORD *)&msg_4[28] == 0;
            }
            if (v8) {
              uint64_t v7 = 4294966996;
            }
            else {
              uint64_t v7 = *(unsigned int *)&msg_4[28];
            }
            goto LABEL_25;
          }
        }
        uint64_t v7 = 4294966996;
      }
      else
      {
        uint64_t v7 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v7 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg_4[8]);
    }
    goto LABEL_25;
  }
  return v7;
}

uint64_t _BKSHIDSetHardwareKeyboardLayout(mach_port_name_t a1, uint64_t a2, char *src)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  memset(v11, 0, 464);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v9 = 0u;
  *((void *)&v9 + 1) = *MEMORY[0x1E4F14068];
  *(void *)&long long v10 = a2;
  if (MEMORY[0x1E4F149B0]) {
    int v4 = mig_strncpy_zerofill((char *)v11, src, 1024);
  }
  else {
    int v4 = mig_strncpy((char *)v11, src, 1024);
  }
  DWORD2(v10) = 0;
  HIDWORD(v10) = v4;
  mach_msg_size_t v5 = ((v4 + 3) & 0xFFFFFFFC) + 48;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v9 = 0x5B8DC600000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v6 = mach_msg((mach_msg_header_t *)name, 1, v5, 0, 0, 0, 0);
  if ((v6 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v6;
}

uint64_t _BKSHIDSetAuthenticatedKeyCommands(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)int msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84F80;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDGetEventResolutionDescription(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 16777472;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.mach_msg_bits_t msgh_bits = 2147489043;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x5B8DC800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (v15.msgh_id == 6000172)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v12 = 4294966996;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v15.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v15.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v12;
}

uint64_t _BKSHIDGetKeyCommandResolutionDescription(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 16777472;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.mach_msg_bits_t msgh_bits = 2147489043;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x5B8DC900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (v15.msgh_id == 6000173)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v12 = 4294966996;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v15.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v15.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v12;
}

uint64_t _BKSHIDSetPersistentServiceProperties(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v10 = a2;
  int v11 = 16777472;
  int v12 = a3;
  uint64_t v13 = a4;
  int v14 = 16777472;
  int v15 = a5;
  uint64_t v16 = *MEMORY[0x1E4F14068];
  int v17 = a3;
  int v18 = a5;
  uint64_t v7 = 2147483667;
  int v8 = a1;
  *(_OWORD *)mach_port_name_t name = xmmword_18AA84F90;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)&v7);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v7, 1, 0x4Cu, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((v7 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[0]);
    }
    mach_msg_destroy((mach_msg_header_t *)&v7);
  }
  return v5;
}

uint64_t _BKSHIDGetPersistentServiceProperties(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, void *a6, _DWORD *a7)
{
  int v16 = 2;
  uint64_t v17 = a2;
  int v18 = 16777472;
  int v19 = a3;
  uint64_t v20 = a4;
  int v21 = 16777472;
  int v22 = a5;
  uint64_t v23 = *MEMORY[0x1E4F14068];
  int v24 = a3;
  int v25 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v15.mach_msg_bits_t msgh_bits = 2147489043;
  v15.mach_port_t msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(void *)&v15.msgh_voucher_port = 0x5B8DCB00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v15);
    mach_port_t special_reply_port = v15.msgh_local_port;
  }
  uint64_t v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!v11)
    {
      if (v15.msgh_id == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (v15.msgh_id == 6000175)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            uint64_t v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port) {
                uint64_t v12 = 4294966996;
              }
              else {
                uint64_t v12 = HIDWORD(v17);
              }
            }
          }
          else
          {
            uint64_t v12 = 4294966996;
          }
          goto LABEL_26;
        }
        uint64_t v12 = 4294966996;
        if (v16 == 1 && *(void *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          int v13 = v19;
          if (v19 == v21)
          {
            uint64_t v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((v15.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v15.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v12;
}

uint64_t _BKSHIDTouchAddAuthenticationSpecifications(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)int msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84FA0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDRequestUISensorMode(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)int msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84FB0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _BKSHIDGetUISensorCharacteristics(int a1, void *a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int msg_8 = a1;
  mach_port_name_t msg_12 = special_reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x5B8DCF00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = msg_12;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 6000179)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg_16[16];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          int v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            uint64_t v8 = 0;
            *a2 = *(void *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg_12);
    }
    goto LABEL_27;
  }
  return v8;
}

uint64_t _BKSHIDTouchSensitiveButtonSetScanMode(mach_port_t a1, int a2, int a3)
{
  uint64_t v6 = *MEMORY[0x1E4F14068];
  int v7 = a2;
  int v8 = a3;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6000080;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t _BKSDisplayIsDisabled(mach_port_name_t a1, const char *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x5B916800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v13) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001100)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v14[0]) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v14[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetDisabled(mach_port_name_t a1, const char *a2, char a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v17 = 0u;
  *((void *)&v17 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v18 + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v18 + 8, a2, 1024);
  }
  LODWORD(v18[0]) = 0;
  DWORD1(v18[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  uint64_t v9 = (char *)rcv_name + v8;
  v9[40] = a3;
  *(_WORD *)(v9 + 41) = 0;
  v9[43] = 0;
  mach_msg_size_t v10 = v8 + 44;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v17 = 0x5B916900000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v10, 0x30u, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!v12)
    {
      if (DWORD1(v17) == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (DWORD1(v17) == 6001101)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v13 = LODWORD(v18[0]);
              if (!LODWORD(v18[0]))
              {
                *a4 = BYTE4(v18[0]);
                return v13;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = LODWORD(v18[0]) == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = LODWORD(v18[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v13;
}

uint64_t _BKSDisplayNotifySetDisplayBlanked(mach_port_name_t a1, const char *a2, char a3, char a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v14 = 0u;
  *((void *)&v14 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v15 + 8, a2, 1024);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  uint64_t v9 = (char *)name + v8;
  v9[40] = a3;
  *(_WORD *)(v9 + 41) = 0;
  v9[43] = 0;
  v9[44] = a4;
  *(_WORD *)(v9 + 45) = 0;
  v9[47] = 0;
  mach_msg_size_t v10 = v8 + 48;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v14 = 0x5B916A00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)name, 1, v10, 0, 0, 0, 0);
  if ((v11 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v11;
}

uint64_t _BKSDisplayWillUnblank(mach_port_name_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)mach_port_name_t name = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v8 = 0x5B916B00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _BKSDisplayGetBlankingRemovesPower(mach_port_name_t a1, const char *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x5B916C00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v13) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001104)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v14[0]) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v14[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetBlankingRemovesPower(mach_port_name_t a1, const char *a2, char a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v14 = 0u;
  *((void *)&v14 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  int v7 = (char *)rcv_name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  mach_msg_size_t v8 = v6 + 44;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v14 = 0x5B916D00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v10)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v11 - 268435459) > 1) {
      return v11;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v11;
  }
  if (DWORD1(v14) == 71)
  {
    uint64_t v11 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v14) != 6001105)
  {
    uint64_t v11 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v11 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v11 = LODWORD(v15[0]);
  if (LODWORD(v15[0])) {
    goto LABEL_22;
  }
  return v11;
}

uint64_t _BKSDisplayGetSystemIdentifiers(mach_port_name_t a1, const char *a2, void *a3, _DWORD *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((void *)&v15[0] + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  }
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&v15[0] = 0x5B916E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 6001106)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = LODWORD(v15[1]);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          int v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            uint64_t v11 = 0;
            *a3 = *(void *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v11;
}

uint64_t _BKSDisplaySetSystemIdentifiers(mach_port_t a1, const char *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  *(_OWORD *)&v15[8] = 0u;
  memset(&name, 0, sizeof(name));
  int v12 = 1;
  uint64_t v13 = a3;
  int v14 = 16777472;
  *(void *)uint64_t v15 = a4;
  *(void *)&v15[4] = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v6 = mig_strncpy_zerofill(&v15[20], a2, 1024);
  }
  else {
    int v6 = mig_strncpy(&v15[20], a2, 1024);
  }
  *(_DWORD *)&v15[12] = 0;
  *(_DWORD *)&uint8_t v15[16] = v6;
  uint64_t v7 = (v6 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v8 = v7 + 64;
  *(_DWORD *)&v15[v7 + 20] = a4;
  name.mach_msg_bits_t msgh_bits = -2147483629;
  name.mach_port_t msgh_remote_port = a1;
  name.msgh_local_port = 0;
  *(void *)&name.msgh_voucher_port = 0x5B916F00000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&name);
  }
  uint64_t v9 = mach_msg(&name, 1, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name.msgh_local_port);
    }
    mach_msg_destroy(&name);
  }
  return v9;
}

uint64_t _BKSDisplayIsFlipBookEnabled(mach_port_name_t a1, const char *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x5B917000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v13) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001108)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v14[0]) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v14[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetFlipBookEnabled(mach_port_name_t a1, const char *a2, char a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v14 = 0u;
  *((void *)&v14 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v7 = (char *)rcv_name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  mach_msg_size_t v8 = v6 + 44;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v14 = 0x5B917100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v10)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v11 - 268435459) > 1) {
      return v11;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v11;
  }
  if (DWORD1(v14) == 71)
  {
    uint64_t v11 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v14) != 6001109)
  {
    uint64_t v11 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v11 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v11 = LODWORD(v15[0]);
  if (LODWORD(v15[0])) {
    goto LABEL_22;
  }
  return v11;
}

uint64_t _BKSDisplaySetCalibrationPhase(mach_port_name_t a1, const char *a2, int a3, int a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v16 = 0u;
  *((void *)&v16 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  }
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v9 = v8 + 48;
  uint64_t v10 = (char *)rcv_name + v8;
  *((_DWORD *)v10 + 10) = a3;
  *((_DWORD *)v10 + 11) = a4;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v16 = 0x5B917200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v12)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v13 - 268435459) > 1) {
      return v13;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v13;
  }
  if (DWORD1(v16) == 71)
  {
    uint64_t v13 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v16) != 6001110)
  {
    uint64_t v13 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v13 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v13 = LODWORD(v17[0]);
  if (LODWORD(v17[0])) {
    goto LABEL_22;
  }
  return v13;
}

uint64_t _BKSDisplayIsFlipBookSuppressed(mach_port_name_t a1, const char *a2, unsigned char *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(v14, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v13 = 0u;
  *((void *)&v13 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  }
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  mach_msg_size_t v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v13 = 0x5B917300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!v8)
    {
      if (DWORD1(v13) == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (DWORD1(v13) == 6001111)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              uint64_t v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = BYTE4(v14[0]);
                return v9;
              }
              goto LABEL_28;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2]) {
              BOOL v10 = 1;
            }
            else {
              BOOL v10 = LODWORD(v14[0]) == 0;
            }
            if (v10) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v14[0]);
            }
            goto LABEL_28;
          }
        }
        uint64_t v9 = 4294966996;
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
LABEL_28:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v9 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_28;
  }
  return v9;
}

uint64_t _BKSDisplaySetFlipBookSuppressed(mach_port_name_t a1, const char *a2, char a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(v15, 0, 480);
  *(_OWORD *)int rcv_name = 0u;
  long long v14 = 0u;
  *((void *)&v14 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v15 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v15 + 8, a2, 1024);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  int v7 = (char *)rcv_name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  mach_msg_size_t v8 = v6 + 44;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&long long v14 = 0x5B917400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0) {
    goto LABEL_17;
  }
  if (v10)
  {
    mig_dealloc_special_reply_port();
LABEL_17:
    if ((v11 - 268435459) > 1) {
      return v11;
    }
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
LABEL_22:
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
    return v11;
  }
  if (DWORD1(v14) == 71)
  {
    uint64_t v11 = 4294966988;
    goto LABEL_22;
  }
  if (DWORD1(v14) != 6001112)
  {
    uint64_t v11 = 4294966995;
    goto LABEL_22;
  }
  uint64_t v11 = 4294966996;
  if ((rcv_name[0] & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (rcv_name[1] != 36) {
    goto LABEL_22;
  }
  if (rcv_name[2]) {
    goto LABEL_22;
  }
  uint64_t v11 = LODWORD(v15[0]);
  if (LODWORD(v15[0])) {
    goto LABEL_22;
  }
  return v11;
}

uint64_t _BKSDisplaySetCloneRotationDisabled(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6001014;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSDisplaySetCloneMirroringModeForDestinationDisplay(mach_port_name_t a1, const char *a2, char a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(v13, 0, 480);
  *(_OWORD *)mach_msg_header_t name = 0u;
  long long v12 = 0u;
  *((void *)&v12 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  }
  else {
    int v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  }
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  uint64_t v6 = (v5 + 3) & 0xFFFFFFFC;
  __int16 v7 = (char *)name + v6;
  v7[40] = a3;
  *(_WORD *)(v7 + 41) = 0;
  v7[43] = 0;
  mach_msg_size_t v8 = v6 + 44;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v12 = 0x5B917700000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)name, 1, v8, 0, 0, 0, 0);
  if ((v9 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v9;
}

uint64_t _BKSDisplayRemoveCloneMirroringModeForDestinationDisplay(mach_port_name_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, 480);
  *(_OWORD *)mach_msg_header_t name = 0u;
  long long v8 = 0u;
  *((void *)&v8 + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 1024);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 1024);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  mach_msg_size_t v4 = ((v3 + 3) & 0xFFFFFFFC) + 40;
  name[0] = 19;
  name[2] = a1;
  name[3] = 0;
  *(void *)&long long v8 = 0x5B917800000000;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)name);
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)name, 1, v4, 0, 0, 0, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], name[3]);
    }
    mach_msg_destroy((mach_msg_header_t *)name);
  }
  return v5;
}

uint64_t _BKSDisplayTetherPrefsNeedImmediateUpdate(int a1, unsigned char *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = special_reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x5B917A00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    mach_port_name_t special_reply_port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6001118)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v6;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v7 = 1;
            }
            else {
              BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v7) {
              uint64_t v6 = 4294966996;
            }
            else {
              uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_25;
          }
        }
        uint64_t v6 = 4294966996;
      }
      else
      {
        uint64_t v6 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v6 - 268435459) <= 1)
  {
    if ((v9 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_25;
  }
  return v6;
}

uint64_t _BKSDisplaySetTetheredOrientationNotificationsDisabled(int a1, char a2)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B917B00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1) {
      return v5;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6001119)
  {
    uint64_t v5 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v5;
}

uint64_t _BKSDisplayUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6001020;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSDisplayUpdateMirroredDisplayOrientationWithInterfaceOrientation(mach_port_t a1, char a2)
{
  uint64_t v5 = *MEMORY[0x1E4F14068];
  char v6 = a2;
  __int16 v7 = 0;
  char v8 = 0;
  *(void *)&msg.mach_msg_bits_t msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.mach_msg_id_t msgh_id = 6001021;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t _BKSDisplaySetSecureMode(int a1, char a2)
{
  *(_OWORD *)&msg[20] = 0u;
  uint64_t v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  msg[32] = a2;
  *(_WORD *)&msg[33] = 0;
  msg[35] = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x5B917E00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t special_reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v4)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v5 - 268435459) > 1) {
      return v5;
    }
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
LABEL_19:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v5;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v5 = 4294966988;
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[20] != 6001122)
  {
    uint64_t v5 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v5 = 4294966996;
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[4] != 36) {
    goto LABEL_19;
  }
  if (*(_DWORD *)&msg[8]) {
    goto LABEL_19;
  }
  uint64_t v5 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_19;
  }
  return v5;
}

uint64_t _BKSDisplayRenderOverlay(mach_port_name_t a1, const char *a2, void *a3, _DWORD *a4)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  *(_OWORD *)int rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((void *)&v15[0] + 1) = *MEMORY[0x1E4F14068];
  if (MEMORY[0x1E4F149B0]) {
    int v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  }
  else {
    int v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  }
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  mach_msg_size_t v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(void *)&v15[0] = 0x5B917F00000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    mach_port_name_t special_reply_port = rcv_name[3];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 6001123)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            uint64_t v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = LODWORD(v15[1]);
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_30;
        }
        uint64_t v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          int v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            uint64_t v11 = 0;
            *a3 = *(void *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_30:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((rcv_name[0] & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name[3]);
    }
    goto LABEL_30;
  }
  return v11;
}

uint64_t _BKSDisplayApplyRenderOverlay(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v11 = 2;
  uint64_t v12 = a2;
  int v13 = 16777472;
  int v14 = a3;
  uint64_t v15 = a4;
  int v16 = 16777472;
  int v17 = a5;
  uint64_t v18 = *MEMORY[0x1E4F14068];
  int v19 = a3;
  int v20 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.mach_msg_bits_t msgh_bits = 2147489043;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x5B918000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&msg, 3162115, 0x4Cu, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
LABEL_19:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_19;
  }
  if (msg.msgh_id != 6001124)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_19;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_19;
  }
  return v8;
}

uint64_t _BKSDisplayRemoveRenderOverlay(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v11 = 2;
  uint64_t v12 = a2;
  int v13 = 16777472;
  int v14 = a3;
  uint64_t v15 = a4;
  int v16 = 16777472;
  int v17 = a5;
  uint64_t v18 = *MEMORY[0x1E4F14068];
  int v19 = a3;
  int v20 = a5;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&msg.mach_msg_bits_t msgh_bits = 2147489043;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(void *)&msg.msgh_voucher_port = 0x5B918100000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t special_reply_port = msg.msgh_local_port;
  }
  uint64_t v7 = mach_msg(&msg, 3162115, 0x4Cu, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0) {
    goto LABEL_14;
  }
  if (v7)
  {
    mig_dealloc_special_reply_port();
LABEL_14:
    if ((v8 - 268435459) > 1) {
      return v8;
    }
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
LABEL_19:
    mach_msg_destroy(&msg);
    return v8;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v8 = 4294966988;
    goto LABEL_19;
  }
  if (msg.msgh_id != 6001125)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_19;
  }
  uint64_t v8 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_19;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_19;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_19;
  }
  uint64_t v8 = HIDWORD(v12);
  if (HIDWORD(v12)) {
    goto LABEL_19;
  }
  return v8;
}

uint64_t _BKSDisplayFreezeRenderOverlay(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v9 = 1;
  uint64_t v10 = a2;
  int v11 = 16777472;
  int v12 = a3;
  uint64_t v13 = *MEMORY[0x1E4F14068];
  int v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 2147489043;
  v8.mach_port_t msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(void *)&v8.msgh_voucher_port = 0x5B918200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v8);
    mach_port_t special_reply_port = v8.msgh_local_port;
  }
  uint64_t v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v5)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v6 - 268435459) > 1) {
      return v6;
    }
    if ((v8.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v8.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v8);
    return v6;
  }
  if (v8.msgh_id == 71)
  {
    uint64_t v6 = 4294966988;
    goto LABEL_18;
  }
  if (v8.msgh_id != 6001126)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v6 = 4294966996;
  if ((v8.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v8.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v6 = HIDWORD(v10);
  if (HIDWORD(v10)) {
    goto LABEL_18;
  }
  return v6;
}

uint64_t _BKSDisplayDismissInterstitialRenderOverlay(mach_port_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v9 = 1;
  uint64_t v10 = a2;
  int v11 = 16777472;
  int v12 = a3;
  uint64_t v13 = *MEMORY[0x1E4F14068];
  int v14 = a3;
  mach_port_t special_reply_port = mig_get_special_reply_port();
  *(void *)&v8.mach_msg_bits_t msgh_bits = 2147489043;
  v8.mach_port_t msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(void *)&v8.msgh_voucher_port = 0x5B918300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&v8);
    mach_port_t special_reply_port = v8.msgh_local_port;
  }
  uint64_t v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0) {
    goto LABEL_13;
  }
  if (v5)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v6 - 268435459) > 1) {
      return v6;
    }
    if ((v8.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], v8.msgh_local_port);
    }
LABEL_18:
    mach_msg_destroy(&v8);
    return v6;
  }
  if (v8.msgh_id == 71)
  {
    uint64_t v6 = 4294966988;
    goto LABEL_18;
  }
  if (v8.msgh_id != 6001127)
  {
    uint64_t v6 = 4294966995;
    goto LABEL_18;
  }
  uint64_t v6 = 4294966996;
  if ((v8.msgh_bits & 0x80000000) != 0) {
    goto LABEL_18;
  }
  if (*(void *)&v8.msgh_size != 36) {
    goto LABEL_18;
  }
  uint64_t v6 = HIDWORD(v10);
  if (HIDWORD(v10)) {
    goto LABEL_18;
  }
  return v6;
}

uint64_t _BKSDisplayGetRenderOverlayDismissActions(int a1, void *a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  memset(&msg_16[4], 0, 44);
  int msg_4 = 0;
  mach_port_name_t special_reply_port = mig_get_special_reply_port();
  int msg_8 = a1;
  mach_port_name_t msg_12 = special_reply_port;
  int msg = 5395;
  *(void *)msg_16 = 0x5B918400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_name_t special_reply_port = msg_12;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 6001128)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            uint64_t v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8) {
                uint64_t v8 = 4294966996;
              }
              else {
                uint64_t v8 = *(unsigned int *)&msg_16[16];
              }
            }
          }
          else
          {
            uint64_t v8 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          int v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            uint64_t v8 = 0;
            *a2 = *(void *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg_12);
    }
    goto LABEL_27;
  }
  return v8;
}

uint64_t _BKSDisplaySetArrangement(int a1, uint64_t a2, int a3)
{
  uint64_t v6 = a2;
  int v7 = 16777472;
  int v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F14068];
  int v10 = a3;
  *(void *)int msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AA84FC0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  }
  uint64_t v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t _XDeliverAccelerometerEvent(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 56)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  }
  else
  {
    uint64_t result = _BKXXDeliverAccelerometerEvent(*(double *)(result + 32), *(float *)(result + 40), *(float *)(result + 44), *(float *)(result + 48), result, *(unsigned int *)(result + 52));
    *(_DWORD *)(a2 + 32) = 0;
  }
  return result;
}

uint64_t (*BKAccelerometer_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 980665) {
    return _XDeliverAccelerometerEvent;
  }
  else {
    return 0;
  }
}

uint64_t BKAccelerometer_server(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v4 = *(_DWORD *)(a1 + 20) + 100;
  *(void *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  if (*(_DWORD *)(a1 + 20) == 980665)
  {
    if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 56)
    {
      *(_DWORD *)(a2 + 32) = -304;
      *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    }
    else
    {
      _BKXXDeliverAccelerometerEvent(*(double *)(a1 + 32), *(float *)(a1 + 40), *(float *)(a1 + 44), *(float *)(a1 + 48), a1, *(unsigned int *)(a1 + 52));
      *(_DWORD *)(a2 + 32) = 0;
    }
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _BKSWatchdogGetIsAlive(int a1, unsigned char *a2, mach_msg_timeout_t a3)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  mach_port_t reply_port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_name_t rcv_name_8 = reply_port;
  int v11 = 5395;
  *(void *)rcv_name_12 = 0x5B955000000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    mach_port_t reply_port = rcv_name_8;
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)&v11, 275, 0x18u, 0x30u, reply_port, a3, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name_8);
  }
  else
  {
    if (!v7)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        uint64_t v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 6002100)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              uint64_t v8 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = rcv_name_12[20];
                return v8;
              }
              goto LABEL_26;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = *(_DWORD *)&rcv_name_12[16] == 0;
            }
            if (v9) {
              uint64_t v8 = 4294966996;
            }
            else {
              uint64_t v8 = *(unsigned int *)&rcv_name_12[16];
            }
            goto LABEL_26;
          }
        }
        uint64_t v8 = 4294966996;
      }
      else
      {
        uint64_t v8 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_reply_port(rcv_name_8);
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((v11 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name_8);
    }
    goto LABEL_26;
  }
  return v8;
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C238]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C258]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1F410C2A0]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1F410C2A8]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1F410C2B0]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1F410C2E8]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1F410C2F8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1F410C328]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1F410C340]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1F410C360]();
}

uint64_t BSGetVersionedPID()
{
  return MEMORY[0x1F410C378]();
}

uint64_t BSHashPurify32()
{
  return MEMORY[0x1F410C380]();
}

uint64_t BSHashPurifyNS()
{
  return MEMORY[0x1F410C388]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x1F410C3B0]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1F410C4D0]();
}

uint64_t BSPointFromValue()
{
  return MEMORY[0x1F410C4D8]();
}

uint64_t BSProcessDescriptionForPID()
{
  return MEMORY[0x1F410C4F8]();
}

uint64_t BSRunLoopPerformAfterCACommit()
{
  return MEMORY[0x1F410C550]();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5A8]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x1F410C5C8]();
}

uint64_t BSValueWithPoint()
{
  return MEMORY[0x1F410C6A8]();
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1F40C96C8](bytes, count);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C68](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1F40D7F68](plist, format);
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

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t GSKeyboardGetLiveModifierState()
{
  return MEMORY[0x1F411C988]();
}

uint64_t GSKeyboardGetModifierState()
{
  return MEMORY[0x1F411C9A8]();
}

uint64_t GSKeyboardIsGlobeKeyUsagePair()
{
  return MEMORY[0x1F411C9B8]();
}

uint64_t GSKeyboardTranslateKeyExtendedCommandWithUsagePage()
{
  return MEMORY[0x1F411C9D8]();
}

uint64_t GSSetMainScreenInfo()
{
  return MEMORY[0x1F411CA20]();
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x1F40E88D8]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x1F40E89A0]();
}

uint64_t IOHIDEventGetAttributeDataLength()
{
  return MEMORY[0x1F40E89B8]();
}

uint64_t IOHIDEventGetAttributeDataPtr()
{
  return MEMORY[0x1F40E89C0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1F40E89C8]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x1F40E89D0]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x1F40E89D8]();
}

uint64_t IOHIDEventGetEvent()
{
  return MEMORY[0x1F40E89E0]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1F40E89F8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1F40E8A00]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x1F40E8A18]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1F40E8A20]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1F40E8A38]();
}

uint64_t IOHIDEventGetTypeString()
{
  return MEMORY[0x1F40E8A40]();
}

uint64_t IOHIDEventGetVendorDefinedData()
{
  return MEMORY[0x1F40E8A48]();
}

uint64_t IOHIDEventRemoveEvent()
{
  return MEMORY[0x1F40E8A58]();
}

uint64_t IOHIDEventSetAttributeData()
{
  return MEMORY[0x1F40E8A60]();
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1F40E8AC8]();
}

uint64_t IOHIDEventSystemClientDispatchEvent()
{
  return MEMORY[0x1F40E8AD0]();
}

uint64_t IOHIDEventSystemClientScheduleWithRunLoop()
{
  return MEMORY[0x1F40E8B20]();
}

uint64_t IOHIDEventTypeGetName()
{
  return MEMORY[0x1F40E8C30]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t NSStringFromBSVersionedPID()
{
  return MEMORY[0x1F410C6C8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x1F40E92A8]();
}

uint64_t _IOHIDEventSetAttachment()
{
  return MEMORY[0x1F40E92C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1F410C6F0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1F4181500](cls, outCount);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CB3D8](*(void *)&__clock_id);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
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

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1F40CCD60]();
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1F40CCD78]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD90](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1F40CCD98](dest, src, *(void *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
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

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
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

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1F4181AC0](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x1F40CE598](__b1, __b2, __len);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1F40CF018](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}