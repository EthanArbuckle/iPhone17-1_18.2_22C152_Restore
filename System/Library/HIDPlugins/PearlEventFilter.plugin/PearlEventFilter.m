uint64_t sub_2407C18CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t TimeStamp;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  int v20;

  v5 = sub_2407C1A64();
  if (v5)
  {
    if (v5 == 1)
    {
      TimeStamp = IOHIDEventGetTimeStamp();
      v10 = sub_2407C2DAC(TimeStamp - *(void *)(a1 + 64), v7, v8, v9);
      *(void *)(a1 + 64) = TimeStamp;
      if (v10 <= 0x3E8)
      {
        v11 = *(NSObject **)(a1 + 24);
        v15 = MEMORY[0x263EF8330];
        v16 = 3221225472;
        v17 = sub_2407C2F1C;
        v18 = &unk_2650D6378;
        v19 = a1;
        v12 = 6;
LABEL_10:
        v20 = v12;
        goto LABEL_11;
      }
      if (!*(unsigned char *)(a1 + 45))
      {
        v11 = *(NSObject **)(a1 + 24);
        v15 = MEMORY[0x263EF8330];
        v16 = 3221225472;
        v17 = sub_2407C2F1C;
        v18 = &unk_2650D6378;
        v19 = a1;
        v12 = 1;
        goto LABEL_10;
      }
      sub_2407C2E24(1u);
    }
    else if (*(unsigned char *)(a1 + 44))
    {
      v13 = *(NSObject **)(a1 + 24);
      v15 = MEMORY[0x263EF8330];
      v16 = 3221225472;
      v17 = sub_2407C2F1C;
      v18 = &unk_2650D6378;
      v19 = a1;
      v20 = v5;
      v11 = v13;
LABEL_11:
      dispatch_async(v11, &v15);
    }
  }
  return a3;
}

uint64_t sub_2407C1A64()
{
  int Type = IOHIDEventGetType();
  if (Type == 1)
  {
    if (IOHIDEventGetIntegerValue() == 65292 && IOHIDEventGetIntegerValue() == 3) {
      IOHIDEventGetVendorDefinedData();
    }
    return 0;
  }
  if (Type == 11)
  {
    if ((IOHIDEventGetIntegerValue() & 0x20000) != 0) {
      return 3;
    }
    return 0;
  }
  if (Type != 3 || !IOHIDEventGetIntegerValue()) {
    return 0;
  }
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v2 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 12 && v2 == 48) {
    return IOHIDEventGetIntegerValue() != 0;
  }
  if (IntegerValue != 65289 || v2 != 1 || IOHIDEventGetIntegerValue()) {
    return 0;
  }
  return 2;
}

BOOL AWDBiometricKitPrewarmCameraReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x263F62298];
  v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    v7 = (int *)MEMORY[0x263F62268];
    while (1)
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
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 32) |= 1u;
        while (1)
        {
          uint64_t v28 = *v3;
          unint64_t v29 = *(void *)(a2 + v28);
          if (v29 == -1 || v29 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v30 = *(unsigned char *)(*(void *)(a2 + *v7) + v29);
          *(void *)(a2 + v28) = v29 + 1;
          v20 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
          {
            v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__machTimestampInMillisecond;
            goto LABEL_48;
          }
          v26 += 7;
          BOOL v24 = v27++ > 8;
          if (v24)
          {
            uint64_t v20 = 0;
            v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__machTimestampInMillisecond;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__machTimestampInMillisecond;
LABEL_47:
        *(unsigned char *)(a2 + *v5) = 1;
        goto LABEL_48;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)(a1 + 32) |= 4u;
        while (1)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__timestamp;
            goto LABEL_47;
          }
          char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
          *(void *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0) {
            break;
          }
          v18 += 7;
          BOOL v24 = v19++ > 8;
          if (v24)
          {
            uint64_t v20 = 0;
            v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__timestamp;
            goto LABEL_50;
          }
        }
        v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__timestamp;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_51:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    char v31 = 0;
    unsigned int v32 = 0;
    uint64_t v20 = 0;
    *(unsigned char *)(a1 + 32) |= 2u;
    while (1)
    {
      uint64_t v33 = *v3;
      unint64_t v34 = *(void *)(a2 + v33);
      if (v34 == -1 || v34 >= *(void *)(a2 + *v4))
      {
        v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__prewarmCameraEventSource;
        goto LABEL_47;
      }
      char v35 = *(unsigned char *)(*(void *)(a2 + *v7) + v34);
      *(void *)(a2 + v33) = v34 + 1;
      v20 |= (unint64_t)(v35 & 0x7F) << v31;
      if ((v35 & 0x80) == 0) {
        break;
      }
      v31 += 7;
      BOOL v24 = v32++ > 8;
      if (v24)
      {
        uint64_t v20 = 0;
        v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__prewarmCameraEventSource;
        goto LABEL_50;
      }
    }
    v25 = &OBJC_IVAR___AWDBiometricKitPrewarmCamera__prewarmCameraEventSource;
LABEL_48:
    if (*(unsigned char *)(a2 + *v5)) {
      uint64_t v20 = 0;
    }
LABEL_50:
    *(void *)(a1 + *v25) = v20;
    goto LABEL_51;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_2407C26A4(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = __osLogTrace;
  v3 = &_os_log_internal;
  if (__osLogTrace) {
    v4 = __osLogTrace;
  }
  else {
    v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_2407C0000, v4, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::AddRef\n", (uint8_t *)v8, 2u);
    uint64_t v2 = __osLogTrace;
  }
  uint64_t v5 = (*(_DWORD *)(a1 + 8) + 1);
  *(_DWORD *)(a1 + 8) = v5;
  if (v2) {
    v6 = v2;
  }
  else {
    v6 = v3;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_2407C0000, v6, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::AddRef: -> %u\n", (uint8_t *)v8, 8u);
  }
  return v5;
}

void *PearlEventFilterFactory(const __CFAllocator *a1, const void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v5 = __osLogTrace;
  }
  else {
    uint64_t v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2407C0000, v5, OS_LOG_TYPE_DEFAULT, "PearlEventFilterFactory\n", buf, 2u);
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (CFEqual(a2, v7))
  {
    char v8 = CFAllocatorAllocate(a1, 72, 0);
    CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0x25u, 0x44u, 0x51u, 0xCCu, 0x1Du, 0xAAu, 0x48u, 0xE1u, 0x83u, 0xE7u, 0x8Du, 0x9Bu, 0x7Fu, 0x82u, 0x53u, 0x79u);
    sub_2407C33F8((uint64_t)v8, v9);
  }
  else
  {
    char v8 = 0;
  }
  if (__osLogTrace) {
    unint64_t v10 = __osLogTrace;
  }
  else {
    unint64_t v10 = v4;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    char v13 = v8;
    _os_log_impl(&dword_2407C0000, v10, OS_LOG_TYPE_DEFAULT, "PearlEventFilterFactory: -> %p\n", buf, 0xCu);
  }
  return v8;
}

uint64_t sub_2407C298C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v8 = &_os_log_internal;
  if (__osLogTrace) {
    CFUUIDRef v9 = __osLogTrace;
  }
  else {
    CFUUIDRef v9 = &_os_log_internal;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2407C0000, v9, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::QueryInterface\n", buf, 2u);
  }
  *(void *)&v23.byte0 = a2;
  *(void *)&v23.byte8 = a3;
  CFUUIDRef v10 = CFUUIDCreateFromUUIDBytes(0, v23);
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB30];
  CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v10, v12)
    || (CFUUIDRef v13 = CFUUIDGetConstantUUIDWithBytes(v11, 0x19u, 0xD7u, 0x74u, 0x41u, 0xBBu, 0xC4u, 0x45u, 0x11u, 0x91u, 0x49u, 0x60u, 0x57u, 0x2Au, 0xBu, 1u, 0x5Cu), CFEqual(v10, v13)))
  {
    uint64_t v14 = __osLogTrace;
    if (__osLogTrace) {
      int v15 = __osLogTrace;
    }
    else {
      int v15 = v8;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2407C0000, v15, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::AddRef\n", buf, 2u);
      uint64_t v14 = __osLogTrace;
    }
    int v16 = *(_DWORD *)(a1 + 8) + 1;
    *(_DWORD *)(a1 + 8) = v16;
    if (!v14) {
      uint64_t v14 = v8;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = v16;
      _os_log_impl(&dword_2407C0000, v14, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::AddRef: -> %u\n", buf, 8u);
    }
    uint64_t v17 = 0;
  }
  else
  {
    a1 = 0;
    uint64_t v17 = 2147483652;
  }
  *a4 = a1;
  CFRelease(v10);
  if (__osLogTrace) {
    char v18 = __osLogTrace;
  }
  else {
    char v18 = v8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v21 = v17;
    _os_log_impl(&dword_2407C0000, v18, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::QueryInterface: -> %u\n", buf, 8u);
  }
  return v17;
}

uint64_t sub_2407C2C1C(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = &_os_log_internal;
  if (__osLogTrace) {
    v3 = __osLogTrace;
  }
  else {
    v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_2407C0000, v3, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::Release\n", (uint8_t *)v8, 2u);
  }
  uint64_t v4 = (*(_DWORD *)(a1 + 8) - 1);
  *(_DWORD *)(a1 + 8) = v4;
  if (a1 && !v4)
  {
    uint64_t v5 = sub_2407C2D4C(a1);
    MEMORY[0x2455FACD0](v5, 0x10E0C40284D09D9);
  }
  if (__osLogTrace) {
    CFAllocatorRef v6 = __osLogTrace;
  }
  else {
    CFAllocatorRef v6 = v2;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl(&dword_2407C0000, v6, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::Release: -> %u\n", (uint8_t *)v8, 8u);
  }
  return v4;
}

uint64_t sub_2407C2D4C(uint64_t a1)
{
  return a1;
}

void sub_2407C2D90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t sub_2407C2DAC(unint64_t a1, double a2, double a3, double a4)
{
  if (qword_26AFC86A0 != -1) {
    dispatch_once(&qword_26AFC86A0, &unk_26F4E8AC8);
  }
  LODWORD(a3) = dword_26AFC8698;
  LODWORD(a4) = *(_DWORD *)algn_26AFC869C;
  return (unint64_t)((double)a1 * (double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 * 0.000001);
}

uint64_t sub_2407C2E24(unsigned int a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a1 >= 7) {
    uint64_t v1 = &off_2650D6398;
  }
  else {
    uint64_t v1 = &(&off_2650D6398)[2 * a1];
  }
  if (__osLogTrace) {
    uint64_t v2 = __osLogTrace;
  }
  else {
    uint64_t v2 = &_os_log_internal;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *v1;
    int v5 = 136315138;
    CFAllocatorRef v6 = v3;
    _os_log_impl(&dword_2407C0000, v2, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::logEvent (%s)\n", (uint8_t *)&v5, 0xCu);
  }
  if (*((_DWORD *)v1 + 2)) {
    BKLogEvent();
  }
  uint64_t result = *((unsigned int *)v1 + 3);
  if (result) {
    return kdebug_trace();
  }
  return result;
}

uint64_t sub_2407C2F10()
{
  return mach_timebase_info((mach_timebase_info_t)&dword_26AFC8698);
}

void sub_2407C2F1C(uint64_t a1)
{
  kern_return_t v16;
  AWDBiometricKitPrewarmCamera *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = &_os_log_internal;
  if (__osLogTrace) {
    uint64_t v4 = __osLogTrace;
  }
  else {
    uint64_t v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v5;
    _os_log_impl(&dword_2407C0000, v4, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::prewarmCamera (%d)\n", buf, 8u);
  }
  LOBYTE(v30) = 0;
  unint64_t v29 = 0;
  unsigned int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == 6) {
    __int16 v7 = 2;
  }
  else {
    __int16 v7 = 1;
  }
  sub_2407C2E24(v6);
  int v8 = *(_DWORD *)(a1 + 40);
  double v9 = *(double *)(v2 + 48);
  if (v9 + 1.0 >= CFAbsoluteTimeGetCurrent() && (v8 != 6 || *(_DWORD *)(v2 + 56) == 6))
  {
    if (__osLog) {
      CFUUIDRef v12 = __osLog;
    }
    else {
      CFUUIDRef v12 = v3;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFUUIDRef v13 = "PearlEventFilter::prewarmCamera - prewarmed too recently\n";
      goto LABEL_23;
    }
    goto LABEL_29;
  }
  kdebug_trace();
  CFUUIDRef v10 = objc_msgSend(*(id *)(v2 + 32), "calls", v29, v30);
  uint64_t v11 = [v10 count];

  kdebug_trace();
  if (v11)
  {
    if (__osLog) {
      CFUUIDRef v12 = __osLog;
    }
    else {
      CFUUIDRef v12 = v3;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFUUIDRef v13 = "PearlEventFilter::prewarmCamera - call in progress\n";
LABEL_23:
      _os_log_impl(&dword_2407C0000, v12, OS_LOG_TYPE_INFO, v13, buf, 2u);
    }
LABEL_29:
    if (__osLogTrace) {
      BOOL v24 = __osLogTrace;
    }
    else {
      BOOL v24 = v3;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v32) = 0;
      v25 = v24;
      char v26 = OS_LOG_TYPE_DEFAULT;
LABEL_34:
      _os_log_impl(&dword_2407C0000, v25, v26, "PearlEventFilter::prewarmCamera -> %{errno}d\n", buf, 8u);
      return;
    }
    return;
  }
  BKLogEvent();
  kdebug_trace();
  *(CFAbsoluteTime *)(v2 + 48) = CFAbsoluteTimeGetCurrent();
  *(_DWORD *)(v2 + 56) = *(_DWORD *)(a1 + 40);
  LODWORD(v29) = 2839120;
  WORD2(v29) = 1;
  HIWORD(v29) = v7;
  unint64_t v14 = *(unsigned int *)(a1 + 40);
  if (v14 >= 5) {
    char v15 = 0;
  }
  else {
    char v15 = 0x302000100uLL >> (8 * v14);
  }
  LOBYTE(v30) = v15;
  int v16 = IOConnectCallStructMethod(*(_DWORD *)(v2 + 40), 0, &v29, 9uLL, 0, 0);
  if (!v16)
  {
    uint64_t v17 = objc_alloc_init(AWDBiometricKitPrewarmCamera);
    -[AWDBiometricKitPrewarmCamera setPrewarmCameraEventSource:](v17, "setPrewarmCameraEventSource:", *(unsigned int *)(a1 + 40), v29);
    char v18 = mach_absolute_time();
    [(AWDBiometricKitPrewarmCamera *)v17 setMachTimestampInMillisecond:sub_2407C2DAC(v18, v19, v20, v21) % 0x1388];
    AWDPostMetric();
    uint64_t v22 = (void *)MEMORY[0x263F2AAC8];
    CFUUIDBytes v23 = [(AWDBiometricKitPrewarmCamera *)v17 dictionaryRepresentation];
    [v22 analyticsOSLogNSDictionary:v23 forEvent:@"biometricKitPrewarmCameraEvent"];

    goto LABEL_29;
  }
  if (__osLog) {
    unsigned int v27 = __osLog;
  }
  else {
    unsigned int v27 = v3;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    unsigned int v32 = "err == 0 ";
    uint64_t v33 = 2048;
    unint64_t v34 = v16;
    char v35 = 2080;
    v36 = "";
    v37 = 2080;
    v38 = "/Library/Caches/com.apple.xbs/Sources/Pearl_UI/PearlEventFilter/PearlEventFilter.mm";
    v39 = 1024;
    v40 = 361;
    _os_log_impl(&dword_2407C0000, v27, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
  }
  if (__osLogTrace) {
    uint64_t v28 = __osLogTrace;
  }
  else {
    uint64_t v28 = v3;
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = v16;
    v25 = v28;
    char v26 = OS_LOG_TYPE_ERROR;
    goto LABEL_34;
  }
}

void sub_2407C33C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2407C33F8(uint64_t a1, const void *a2)
{
  *(void *)a1 = &PearlEventFilter::functionTable;
  *(_DWORD *)(a1 + 8) = 1;
  *(void *)(a1 + 16) = 0;
  uint64_t v4 = (CFTypeRef *)(a1 + 16);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  *(_WORD *)(a1 + 44) = 257;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  os_log_t v5 = os_log_create("com.apple.BiometricKit", "PearlEventFilter");
  unsigned int v6 = (void *)__osLog;
  __osLog = (uint64_t)v5;

  __int16 v7 = (void *)__osLog;
  if (!__osLog)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2407C3E50();
    }
    __int16 v7 = (void *)__osLog;
  }
  objc_storeStrong((id *)&__osLogTrace, v7);
  CFTypeRef *v4 = CFRetain(a2);
  CFPlugInAddInstanceForFactory((CFUUIDRef)a2);
  dispatch_queue_t v8 = dispatch_queue_create("com.apple.PearlEventFilter", 0);
  double v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;

  CFUUIDRef v10 = *(NSObject **)(a1 + 24);
  uint64_t v11 = dispatch_get_global_queue(2, 0);
  dispatch_set_target_queue(v10, v11);

  sub_2407C36E0(a1);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_2407C39D4;
  handler[3] = &unk_2650D6408;
  handler[4] = a1;
  int out_token = -1;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, *(dispatch_queue_t *)(a1 + 24), handler);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2407C3B3C;
  v17[3] = &unk_2650D6408;
  v17[4] = a1;
  int out_token = -1;
  notify_register_dispatch("com.apple.iokit.hid.displayStatus", &out_token, *(dispatch_queue_t *)(a1 + 24), v17);
  LODWORD(v10) = out_token;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2407C3CB8;
  v16[3] = &unk_2650D6408;
  v16[4] = a1;
  int out_token = -1;
  notify_register_dispatch("com.apple.passkit.inapp.presented", &out_token, *(dispatch_queue_t *)(a1 + 24), v16);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2407C3E44;
  v15[3] = &unk_2650D6408;
  v15[4] = a1;
  int out_token = -1;
  notify_register_dispatch("com.apple.passkit.inapp.dismissed", &out_token, *(dispatch_queue_t *)(a1 + 24), v15);
  sub_2407C39DC(a1);
  sub_2407C3B44(a1, (int)v10);
  id v12 = objc_alloc_init(MEMORY[0x263EFC8E8]);
  CFUUIDRef v13 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v12;

  return a1;
}

void sub_2407C36C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2407C36E0(uint64_t a1)
{
  kern_return_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  char v26 = *MEMORY[0x263EF8340];
  uint64_t v2 = &_os_log_internal;
  if (__osLogTrace) {
    v3 = __osLogTrace;
  }
  else {
    v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2407C0000, v3, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::pearlConnect\n", (uint8_t *)&v16, 2u);
  }
  mach_port_t v4 = *MEMORY[0x263F0EC90];
  CFDictionaryRef v5 = IOServiceMatching("ApplePearlSEPDriver");
  io_service_t MatchingService = IOServiceGetMatchingService(v4, v5);
  if (MatchingService)
  {
    io_object_t v7 = MatchingService;
    dispatch_queue_t v8 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)(a1 + 40));
    if (!v8)
    {
      IOObjectRelease(v7);
      if (__osLogTrace) {
        double v9 = __osLogTrace;
      }
      else {
        double v9 = v2;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 67109120;
        LODWORD(v17) = 0;
        CFUUIDRef v10 = v9;
        uint64_t v11 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_2407C0000, v10, v11, "PearlEventFilter::pearlConnect -> %{errno}d\n", (uint8_t *)&v16, 8u);
        return;
      }
      return;
    }
    id v12 = v8;
    if (__osLog) {
      unint64_t v14 = __osLog;
    }
    else {
      unint64_t v14 = v2;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      uint64_t v17 = "err == 0 ";
      char v18 = 2048;
      unsigned int v19 = v12;
      uint64_t v20 = 2080;
      int v21 = "";
      uint64_t v22 = 2080;
      CFUUIDBytes v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_UI/PearlEventFilter/PearlEventFilter.mm";
      BOOL v24 = 1024;
      v25 = 299;
      _os_log_impl(&dword_2407C0000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
    IOObjectRelease(v7);
  }
  else
  {
    id v12 = -536870212;
    if (__osLog) {
      CFUUIDRef v13 = __osLog;
    }
    else {
      CFUUIDRef v13 = v2;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136316162;
      uint64_t v17 = "service";
      char v18 = 2048;
      unsigned int v19 = 0;
      uint64_t v20 = 2080;
      int v21 = "";
      uint64_t v22 = 2080;
      CFUUIDBytes v23 = "/Library/Caches/com.apple.xbs/Sources/Pearl_UI/PearlEventFilter/PearlEventFilter.mm";
      BOOL v24 = 1024;
      v25 = 296;
      _os_log_impl(&dword_2407C0000, v13, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
    }
  }
  if (__osLogTrace) {
    char v15 = __osLogTrace;
  }
  else {
    char v15 = v2;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v16 = 67109120;
    LODWORD(v17) = v12;
    CFUUIDRef v10 = v15;
    uint64_t v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_13;
  }
}

void sub_2407C39D4(uint64_t a1)
{
}

void sub_2407C39DC(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = &_os_log_internal;
  if (__osLogTrace) {
    v3 = __osLogTrace;
  }
  else {
    v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9[0]) = 0;
    _os_log_impl(&dword_2407C0000, v3, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::updateKeybagState\n", (uint8_t *)v9, 2u);
  }
  kdebug_trace();
  int v4 = MKBGetDeviceLockState();
  kdebug_trace();
  BOOL v6 = v4 != 3 && v4 != 0;
  *(unsigned char *)(a1 + 44) = v6;
  if (__osLogTrace) {
    io_object_t v7 = __osLogTrace;
  }
  else {
    io_object_t v7 = v2;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(unsigned __int8 *)(a1 + 44);
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_2407C0000, v7, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::updateKeybagState -> void (_ %d)\n", (uint8_t *)v9, 8u);
  }
}

void sub_2407C3B3C(uint64_t a1, int a2)
{
}

void sub_2407C3B44(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = &_os_log_internal;
  if (__osLogTrace) {
    CFDictionaryRef v5 = __osLogTrace;
  }
  else {
    CFDictionaryRef v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl(&dword_2407C0000, v5, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::updateDisplayState\n", (uint8_t *)v8, 2u);
  }
  v8[0] = 0;
  kdebug_trace();
  notify_get_state(a2, v8);
  kdebug_trace();
  *(unsigned char *)(a1 + 45) = v8[0] != 0;
  BKLogEvent();
  if (__osLogTrace) {
    BOOL v6 = __osLogTrace;
  }
  else {
    BOOL v6 = v4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(unsigned __int8 *)(a1 + 45);
    *(_DWORD *)buf = 67109120;
    int v10 = v7;
    _os_log_impl(&dword_2407C0000, v6, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::updateDisplayState -> void (_ %d)\n", buf, 8u);
  }
}

void sub_2407C3CB8(uint64_t a1)
{
}

void sub_2407C3CC4(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = &_os_log_internal;
  if (__osLogTrace) {
    CFDictionaryRef v5 = __osLogTrace;
  }
  else {
    CFDictionaryRef v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "false";
    if (a2) {
      BOOL v6 = "true";
    }
    LODWORD(v9) = 136315138;
    *(void *)((char *)&v9 + 4) = v6;
    _os_log_impl(&dword_2407C0000, v5, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::updateWalletState (%s)\n", (uint8_t *)&v9, 0xCu);
  }
  if (a2)
  {
    int v7 = *(NSObject **)(a1 + 24);
    *(void *)&long long v9 = MEMORY[0x263EF8330];
    *((void *)&v9 + 1) = 3221225472;
    int v10 = sub_2407C2F1C;
    uint64_t v11 = &unk_2650D6378;
    uint64_t v12 = a1;
    int v13 = 6;
    dispatch_async(v7, &v9);
  }
  if (__osLogTrace) {
    int v8 = __osLogTrace;
  }
  else {
    int v8 = v4;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_2407C0000, v8, OS_LOG_TYPE_DEFAULT, "PearlEventFilter::updateWalletState -> void\n", (uint8_t *)&v9, 2u);
  }
}

void sub_2407C3E44(uint64_t a1)
{
}

void sub_2407C3E50()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2407C0000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.PearlEventFilter'!\n", v0, 2u);
}

uint64_t AWDPostMetric()
{
  return MEMORY[0x270F858D0]();
}

uint64_t BKLogEvent()
{
  return MEMORY[0x270F10C60]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x270EF4348]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x270EF4370]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x270EF4380]();
}

uint64_t IOHIDEventGetVendorDefinedData()
{
  return MEMORY[0x270EF4398]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x270F58568]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete()
{
  while (1)
    ;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}